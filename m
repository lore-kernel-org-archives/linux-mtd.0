Received: from [195.223.129.35] (helo=martina.custom.it)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ClpCX-0001q5-TE
	for linux-mtd@lists.infradead.org; Tue, 04 Jan 2005 08:58:24 -0500
Received: from martina (192.168.2.9)
	by martina.custom.it with MERCUR Mailserver (v4.03.03
	MTA3LTI0MzYtNjY2Nw==)
	for <linux-mtd@lists.infradead.org>; Tue, 4 Jan 2005 14:54:58 +0100
Message-Id: <5.0.2.1.2.20050104145418.00b425b8@192.168.2.9>
Date: Tue, 04 Jan 2005 14:59:29 +0100
To: linux-mtd@lists.infradead.org
From: Fabrizio Grasso <f.grasso@custom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: NAND Partitions on ARM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hi all,
I'm using S3C2410A from Samsung and SMDK2410 from Aiji System. Kernel is 
2.4.18 from MIZI and bootloader is VIVI version 0.1.4 .
I'm trying to partition my NAND flash (64MB) by using VIVI commands. The 
result I obtained is:
>- bon part info
> >          BON info. (5 partitions)
> >          No: offset size flags bad
> >          ---------------------------------------------
> >          0: 0x00000000 0x00020000 00000000 0 128k
> >          1: 0x00020000 0x00010000 00000000 0 64k
> >          2: 0x00030000 0x000d0000 00000000 0 832k
> >          3: 0x00100000 0x02200000 00000000 0 34M
> >          4: 0x02300000 0x01cfc000 00000000 0 28M+1008k
> >
> >- part show
> >          mtdpart info. (5 partitions)
> >          name offset size flag
> >
> >------------------------------------------------------------------------- 
> -------
> >          vivi : 0x00000000 0x00020000 4 128k
> >          param : 0x00020000 0x00010000 4 64k
> >          kernel : 0x00030000 0x000d0000 4 832k
> >          root : 0x00100000 0x02200000 4 34M
> >          data : 0x02300000 0x01d00000 8 29M

Under /dev/bon I can see all 4 partitions... but under /dev/mtdblock I can 
see only "0" !!
What I'm missing?

My system boots from NAND and mounts FS in ram. I'm trying to make 
partitions to have one of them readable/writable at runtime... I'd like to 
have the last partitions to store personal data!

Has anybody any suggestion?

Thanks a lot
