Received: from kcmso1.att.com ([192.128.133.69] helo=kcmso1.proxy.att.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U8Sr-0007lW-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 16:08:13 +0100
Received: from attrh2i.attrh.att.com ([135.37.94.56])
	by kcmso1.proxy.att.com (AT&T IPNS/MSO-3.0) with ESMTP id f77FDWD13304
	for <linux-mtd@lists.infradead.org>; Tue, 7 Aug 2001 11:13:32 -0400 (EDT)
Received: from mpgw.attlabs.att.com (135.197.3.11) by attrh2i.attrh.att.com (5.5.029)
        id 3B2901300038454B for linux-mtd@lists.infradead.org; Tue, 7 Aug 2001 11:13:26 -0400
Received: from exchsj06.attlabs.att.com (exchsj06.attlabs.att.com [135.197.6.51])
	by mpgw.attlabs.att.com (8.8.5/8.8.8) with ESMTP id IAA28752
	for <linux-mtd@lists.infradead.org>; Tue, 7 Aug 2001 08:13:25 -0700 (PDT)
Message-ID: <BB682C76EACAD311A6BD006008F5F7DC0112D50E@mpexchcl.attlabs.att.com>
From: "James, Laura" <laurajames@attlabs.att.com>
To: linux-mtd@lists.infradead.org
Subject: RE: Problems with NAND support 
Date: Tue, 7 Aug 2001 08:13:56 -0700 
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

We're going to be working on a new board with large amounts of NAND flash in
the immediate future. It would seem to be a much better idea to go with
jffs2 than jffs.  What will we need to do to get it working? 

Any pointers you can give will be very much appreciated.

Laura

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Tuesday, August 07, 2001 3:26 AM
> To: juan@hispafuentes.com
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Problems with NAND support 
> 
> 
> 
> 
> juan@hispafuentes.com said:
> >  We only can get a kernel image if we don't enable NAND device
> > support.  The problem is that we really need it. Do you know why? 
> 
> If you're using raw NAND chips you'll need a tiny board-specific glue 
> driver like spia.c to let the generic nand code know how to 
> access the 
> chips.
> 
> You can't use FTL on it because that's for NOR flash. You 
> can't use NFTL 
> because that requires the DiskOnChip ECC hardware, and in 
> many places both 
> suffer from patent problems.
> 
> You can use JFFS on it, but JFFS2 hasn't yet been made to 
> deal with NAND 
> flash - I'm happy to give you pointers if you want to fix that.
> 
> I'd also like to see someone write a SmartMedia-compatible 
> translation 
> layer driver - that ought to be fairly simple to do too.
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
