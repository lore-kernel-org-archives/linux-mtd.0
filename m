Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Cw91-0006H3-Qu
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 07:41:44 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=localhost)
	by imladris.demon.co.uk with esmtp (TLSv1:AES256-SHA:256)
	(Exim 4.14)
	id 19Cw9G-00020a-DN
	for linux-mtd@lists.infradead.org; Tue, 06 May 2003 07:41:58 +0100
Message-ID: <D3AF5F134D627243993F2F2FC32EE4D229C730@mailman.eason.com>
From: Alex Pavloff <apavloff@eason.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 5 May 2003 14:26:56 -0700 
MIME-Version: 1.0
ReSent-Message-ID: <Pine.LNX.4.44.0305060741320.7712@imladris.demon.co.uk>
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: Re: CompactFlash...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Date: Tue, 6 May 2003 08:54:52 +1200
> From: Charles Manning <manningc2@actrix.gen.nz>
> To: <tom@ceisystems.com>, <linux-mtd@lists.infradead.org>
> Subject: Re: CompactFlash...
> 
> On Tuesday 06 May 2003 08:08, tom@ceisystems.com wrote:
> > Hello all,
> >
> > 	I have recently come to own a motherboard that supports the ATA
> > interface to a CompactFlash card, which has been purchased from my local
> > BestBuy.  I am wondering what the best implimentation would be for this
> > flash, as it is seen at /dev/hdd.  Is there a way to still see it as a
> > MTD device, and use jffs2 or yaffs on it?  Thanks in advance for any
> > information.
> 
> This has been raised many times and is explained in an mtd doc.
> 
> The flash in Compact Fash is not visible as raw flash, only as ATA (which
is 
> basically functionally the same as IDE hard-disk). This means that you
can't 
> really use it as flash for YAFFS or JFFSx (except by bodging up a mtd 
> emulation on a block device which would not really buy you anything).

(I'm not the original poster, but I've got a couple questions).

1) Do CF cards when used in ATA (or other modes) have built in wear
leveling?  Mfg docs appear to be inconsistent.

2) Would JFFS2 or other journaled file systems be applicable when using
CompactFlash in I/O or Memory Mode (rather than True IDE mode)?

Alex Pavloff -- apavloff@eason.com
Eason Technology --- www.eason.com
--- Linux-based industrial HMI ---
-------- www.eason.com/5k --------
