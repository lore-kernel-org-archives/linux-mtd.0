Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16NaH0-0001sR-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jan 2002 13:57:10 +0000
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB84064B0989@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: How to Sync properly ? 
Date: Mon, 7 Jan 2002 09:08:03 -0500 
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

Ok, I am using Minix FS ... to minimized space used by the meta data (short
file name ...)

What would be the FS suggested to minimize space used ?

thank


Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: January 7, 2002 8:59 AM
> To: Patrick Allaire
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: How to Sync properly ? 
> 
> 
> 
> pallaire@gameloft.com said:
> >  If I want to move a file from a ram drive to the flash, I 
> will issue
> > a 'mv' command followed by a 'sync' command. Sometime it will be
> > updated but sometime it wont !!! 'sync' should not return until the
> > flash is updated ? no ? 
> 
> > To see what was happening I added some printk in the driver, in the
> > delete and write ! I saw some stranges behaviour. After a 'mv',
> > sometimes the sync command does not do any things, sometime I see
> > somes delteting and writing of buffers but not all of the blocks ...
> > the remaining block will be written to the flash in a delay 
> from 1 to
> > 5 mintutes later ... and sometime the sync work fine !!! 
> 
> What file system? If you're using a 'normal' filesystem on 
> the mtdblock 
> device, you shouldn't expect it to be reliable. 
> 
> Linux stupidly just assumes that block devices never do any 
> write caching, 
> and a sync request is therefore never passed to the block 
> device driver. 
> 
> --
> dwmw2
> 
> 
