Received: from [66.78.22.109] (helo=host3.hosting4everyone.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iDpu-0001fU-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 12:14:30 +0000
From: "Christopher Fowler" <cfowler@outpostsentinel.com>
To: Robert Sandilands <robert.sandilands@secureworx.com>,"'cfowler@outpostsentinel.com'" <cfowler@outpostsentinel.com>, 	americas-techsupport@m-sys.com,linux-mtd@lists.infradead.org
Reply-To: cfowler@outpostsentinel.com
Subject: RE: msys process
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <E16iE0E-0004SJ-00@host3.hosting4everyone.com>
Date: Tue, 05 Mar 2002 07:25:10 -0500
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm using the latest M-SYS software.  From what I heard, the MTD driver 
does not support the version 5 of software.


> M-sys have already told me that they are not interested in chasing and
> fixing the bug. I would seriously recommend using the MTD drivers in 
Linux
> for the following reasons:
> 
> 1. It works
> 2. You get support
> 
> Robert Sandilands
> 
> > -----Original Message-----
> > From: Chris Fowler [mailto:cfowler@outpostsentinel.com]
> > Sent: 04 March 2002 07:01
> > To: americas-techsupport@m-sys.com
> > Cc: linux-mtd@lists.infradead.org
> > Subject: msys process
> > 
> > 
> > Under Linux I have a process running.   msys/fla.
> > 
> > This process seems to keep my load averages around 1.    When 
> > I do not have the driver loaded my laod averages are 0.06.  
> > Since I mount my flash as ro to load software and only read  
> > a raw partition
> > for configuration informatin, I have to wonder my my load 
> > averages are *so* high with this process.
> > 
> > 1) What is it doing?
> > 
> > 2) How can I stop it?
> > 
> > 3) Why is is consuming so many resources for a little task?
> > 
> > 
> > Thanks,
> > Chris
> > 
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
> 
