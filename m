Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Ctuj-0005uS-GH
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 05:18:49 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "=?iso-8859-1?q?=3F=3F?=" <taoyong2002cncq@yahoo.com.cn>,
	linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Date: Tue, 6 May 2003 16:20:27 +1200
References: <E19CqaA-0005IE-IL@pentafluge.infradead.org>
In-Reply-To: <E19CqaA-0005IE-IL@pentafluge.infradead.org>
MIME-Version: 1.0
Message-Id: <20030506041902.2B165406F@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: NAND flash!
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>       Could i use cheaper NAND Flash-ROMs instead of expensive NOR
> Flash-ROMs (like Intel or AMD Flash) to hold the
> MIPS-Kernel/Applications/Data and boot the System from? We use the AMD
> PB1000 development board,and the bootloader is yamon.
>    I know that yaffs is very useful for the NAND flash. But how to add it
> to the kernal or yamon?

Yes, you most definitely can use YAFFS as a root file system on NAND. YAFFS 
also includes a very simple bootloader. There are also tools for generating a 
YAFFS file system image. Many people are using these with great success. Nick 
Bane wrote a mini-HOWTO  about how to add YAFFS to the kernel as the root 
file system.

The best place to start is to get the code from YAFFS CVS 
(http://www.aleph1.co.uk) . I suggest you also subscribe to the yaffs 
discussion list.

-- CHarles
