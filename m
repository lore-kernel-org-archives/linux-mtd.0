Received: from [66.78.22.109] (helo=host3.hosting4everyone.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16QYOZ-0005cQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jan 2002 18:33:15 +0000
From: "Christopher Fowler" <cfowler@outpostsentinel.com>
To: Cam Mayor <cmayor@iders.ca>,linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: cfowler@outpostsentinel.com
Subject: Re: open question on flash speed/app blocking
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <E16QYZ1-00041c-00@host3.hosting4everyone.com>
Date: Tue, 15 Jan 2002 13:44:03 -0500
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

I've noticed that when I write to a file on my DOC2000 that they bus 
does not block until the bufffers are flushd.  My flashing program 
issues a sync() before unmounting the flash.  I even write a 21kb 
config to a raw partition.  That can take a while too.    I'm not sure 
if there is a way around this.  On the DOC2000 you need to use at least 
a block size of 4096.  Since the M-SYS driver reads and writes in those 
block sizes.  Maybe some other people here can talk about this subject.

Chris

> Hi all,
> 
> We're making an app that periodically writes a persistance file to 
flash.  I 
> haven't actually gotten a flash file system area working yet on my 
board, so 
> i can't test this yet for speed.   I know that the results will vary 
with the 
> hardware, the filesystem used, and a handful of other factors.  I'm 
assuming 
> that a write to the flash will be blocking - that is, nothing else 
will be 
> allowed to happen on the bus while that function is being performed.
> 
> For a file the size of 32bytes, 1kByte, and 32kBtyes, what kind of 
blocking 
> delay might one expect from linux writing to flash for each of those 
file 
> sizes?  What would be an optimum flash filesystem to use for 
something like 
> this?  (if there is one)
> 
> cheers,
> cam
> 
> ps. i'm using linux 2.4.6-rmk1-rayl1 and 2.4.16-rmk2.  I could use 
the latest 
> kernel, too, i just haven't gotten around to it.  For development 
purposes, 
> i'm using a cirrus CDB89712 development board, which has the cs89712 
> processor and some Intel 28f320B3 flash on it.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
