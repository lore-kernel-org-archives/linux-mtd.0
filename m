Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16NwTD-0003b1-00
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jan 2002 13:39:15 +0000
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8406554B24@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: How to Sync properly ? 
Date: Tue, 8 Jan 2002 08:48:27 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Yes we can, but my driver cant for the moment, Since there is no driver for
ST flash in your cvs, We have to port the one from INTEL to ST ... the guy
who did the first draft cant work on it for the moment. 

I have been told :

>>> You can write less than 128k at a time, but there is an architectural
feature of the ST multilevel flash which causes a little issue, there is no
word write command, only a buffer write command - the write buffer is 32
bytes long, and this is broken into 4 8-byte pages. You have to write a
complete 8-byte page at a time. You cannot write (for example 2 bytes of a
page and then write the other 6-bytes later) - this hangs up the state
machine. The reason for this is that they have included an ECC engine in the
device, and each 8-byte page has ECC calculated automatically as you write -
this is obviously stored in flash somewhere, so when you try to write to the
same page again, when it tries to write the ECC codes, it gets into a
screw-up - the issue is, if you want to re-write a page, you need to erase
the entire erase block (128k). <<<

Is this true ? is there a work around to use properly ST flash ? because
INTEL flash cost us the double !

thank you

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: January 8, 2002 4:08 AM
> To: Patrick Allaire
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: How to Sync properly ? 
> 
> 
> 
> pallaire@gameloft.com said:
> > Do you know any of the standard FS that will support sync ??
> 
> Linux has no way to signal to the block device driver that it 
> should flush 
> the write cache - so _no_ Linux filesystem can get it right, even on 
> disc drives with write caches. It's just more obvious with 
> the large write 
> cache on the mtdblock device, that's all. 
> 
> Linux is broken. Unless Linux gets unbroken and starts to 
> deal with block 
> devices having internal write caches, the only option you have is to 
> disable the caching completely.
> 
> > because for the moment the dirver for my ST falsh will only 
> write 128k
> > at a time ... I would have to change my hardware to use Intel Flash,
> > to be able to use JFFS 1 or 2.
> 
> I thought you could write the ST flash in 8-byte chunks?
> 
> 
> 
> --
> dwmw2
> 
> 
