Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ezGn-0004jV-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 14:32:37 +0100
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB84044549FE@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: Patrick Allaire <pallaire@gameloft.com>,
        "'David Woodhouse'"
	 <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Now Grub ??? was :RE: lilo and mtd ans doc 
Date: Thu, 6 Sep 2001 09:31:39 -0400 
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

I have in this patch directory some Grub patch ? should I use Grub instead ?
or do I need both ?

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: Patrick Allaire 
> Sent: September 6, 2001 9:12 AM
> To: David Woodhouse; Patrick Allaire
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: lilo and mtd ans doc 
> 
> 
> in the mtd cvs download --> /mtd/patches there is a 
> lilo-mtd.tar.gz ! inside this file there is a lilo-mtd 
> allready compiled and a lilo21-mtd-patch ... should I 
> recompile lilo our I should use the one that is there ? ... I 
> am currently using the precompiled one.
> 
> Patrick Allaire
> mailto:pallaire@gameloft.com
> If you can see it, but it's not there, it's virtual. 
> If you can't see it, but it is there, it's hidden. 
> It you can't see it and it isn't there, it's gone.
> 
> 
> 
> > -----Original Message-----
> > From: David Woodhouse [mailto:dwmw2@infradead.org]
> > Sent: August 31, 2001 5:37 PM
> > To: Patrick Allaire
> > Cc: linux-mtd@lists.infradead.org
> > Subject: Re: lilo and mtd ans doc 
> > 
> > 
> > 
> > 
> > pallaire@gameloft.com said:
> > > Kernel Panic : VFS: unable to mount root fs on 03:05 
> > 
> > Er, that's /dev/hda5. It's not trying to mount the 
> DiskOnChip at all.
> > Try append="root=/dev/nftla1" instead of just root=/dev/nftla1
> > 
> > LILO sucks like that.
> > 
> > BTW, how many partitions do you have on the DiskOnChip? If 
> > only one, why 
> > are you wasting space on partitions rather than just using a 
> > filesystem on 
> > /dev/nftla ?
> > 
> > --
> > dwmw2
> > 
> > 
> 
