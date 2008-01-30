Received: from smtp.tal.de ([81.92.1.5])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKCuK-0003d4-7b
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 13:23:22 +0000
Received: from [172.16.0.10] (p50826B8D.dip.t-dialin.net [80.130.107.141])
	by smtp.tal.de (SMTP.TAL.DE) with ESMTP id B78E71091E5
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jan 2008 14:23:03 +0100 (CET)
Message-ID: <47A07A34.6010209@mkc-gmbh.de>
Date: Wed, 30 Jan 2008 14:23:00 +0100
From: =?ISO-8859-1?Q?Bernd_B=FCttner?= <b.buettner@mkc-gmbh.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Cleaning JFFS2 errors
References: <478F1509.2090001@mkc-gmbh.de>
In-Reply-To: <478F1509.2090001@mkc-gmbh.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No answer jet.
Does this mean it is a silly question or is there no solution for it?

Bernd


Bernd Büttner schrieb:
> Hi,
> after working some time with the JFFS2 filesystem (on a uclinux-system with a non-mmu freescale processor)
> I'm getting errors on every mount like this:
> 
>    jffs2_scan_inode(): CRC failed on node at 0x00c999f0: Read 0xffffffff, calculated 0x7621c0c4
>    Empty flash at 0x00c99a3c ends at 0x00c99c00
>    Empty flash at 0x0134201c ends at 0x01342200
>    jffs2_scan_eraseblock(): Node at 0x01d88df8 {0x1985, 0xe001, 0x0000002f) has invalid
>      CRC 0x1985e001 (calculated 0x392fe03e)
>    JFFS2 notice: (13) read_dnode: node CRC failed on dnode at 0x1341fd4:
>      read 0xffffffff, calculated 0xce9c70e9
> 
> The kernel is 2.6.19 from the latest uclinux distribution 20070130.
> 
> I think these errors are the result of power-loss, misbehaving new drivers and system crashes,
> and I suppose they are not critical and will be corrected by jffs2 after some time.
> 
> But delivering such systems to customers doesn't look good.
> 
> Is there a possibility to force jffs2 to correct these errors at once?
> 
> I hope so.
> 
> Bernd
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
