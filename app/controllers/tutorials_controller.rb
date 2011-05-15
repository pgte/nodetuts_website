class TutorialsController < ApplicationController
  # GET /tutorials
  # GET /tutorials.xml
  def index
    @tutorials = Tutorial.all :order => 'number DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.rss
    end
  end
  
  def itunes
    @tutorials = Tutorial.all :order => 'number DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.rss
    end
  end

  # GET /tutorials/1
  # GET /tutorials/1.xml
  def show
    @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tutorial }
    end
  end

  # GET /tutorials/new
  # GET /tutorials/new.xml
  def new
    @tutorial = Tutorial.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tutorial }
    end
  end

  # GET /tutorials/1/edit
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  # POST /tutorials
  # POST /tutorials.xml
  def create
    @tutorial = Tutorial.new(params[:tutorial])

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to(@tutorial, :notice => 'Tutorial was successfully created.') }
        format.xml  { render :xml => @tutorial, :status => :created, :location => @tutorial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tutorial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutorials/1
  # PUT /tutorials/1.xml
  def update
    @tutorial = Tutorial.find(params[:id])

    respond_to do |format|
      if @tutorial.update_attributes(params[:tutorial])
        format.html { redirect_to(@tutorial, :notice => 'Tutorial was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tutorial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.xml
  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy

    respond_to do |format|
      format.html { redirect_to(tutorials_url) }
      format.xml  { head :ok }
    end
  end
  
end
