Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEdG9-0003KH-RK
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2003 23:28:22 +0000
Received: from there (203-96-62-11-tollfree.actrix.co.nz [203.96.62.11])
	by blood.actrix.co.nz (Postfix) with SMTP id 9B8854414
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Oct 2003 12:26:58 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Wed, 29 Oct 2003 12:33:08 +1300
References: <3F9D3D98.6453.14E703@localhost>
	<20031027202807.DA4481A0A7@desire.actrix.co.nz>
	<1067339503.15551.429.camel@hades.cambridge.redhat.com>
In-Reply-To: <1067339503.15551.429.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <20031028232658.9B8854414@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: SmartMedia FAT
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Implementing SMTL really shouldn't be that hard. The mtd_blkdevs code in
> CVS handles all the horridness of the Linux block layer for you and you
> only need to write readsector() and writesector() routines. There's code
> in drivers/usb/storage/sddr09.c which may help, since those devices make
> the host do the translation.

The flip side to this is that if you can find an SDDR09  you could likely get 
YAFFS/JFFS2 working with that by bypassing the usb storage driver and 
exposing it as NAND to mtd. However, SDDR09's are pretty rare. Samsung does 
make a USB device for experimenting with NAND that could be used for the same 
purpose.

I agree with David that the SMTL is simple. I have the code for a Win2K 
version which I am not allowed to release. 

-- Charles
