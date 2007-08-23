Received: from n1.cetrtapot.si ([89.212.80.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IO9XP-0001eC-RF
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 06:03:45 -0400
Message-ID: <46CD5B75.2060105@cetrtapot.si>
Date: Thu, 23 Aug 2007 12:03:33 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Tushar Kapse <tusharkapse@gmail.com>
Subject: Re: MTD nand driver help
References: <3db60e760708160941g3d2978f8i7e07c4d85a34685e@mail.gmail.com>	<3db60e760708222317o22392948g1f3cbf69e246eba6@mail.gmail.com>	<Pine.LNX.4.64.0708230823000.8989@lnxricardw.se.axis.com>	<3db60e760708222340g49294138w9ce3372ab5eb50bf@mail.gmail.com>	<Pine.LNX.4.64.0708230841590.8989@lnxricardw.se.axis.com>
	<3db60e760708230211g27b99f93o67da774f64d7c556@mail.gmail.com>
In-Reply-To: <3db60e760708230211g27b99f93o67da774f64d7c556@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tushar Kapse wrote:
> Thank you for your nice support..
> here i will explain detail of my problem.
> 1.I have PXA255 SBC board, and ported linux 2.6.12 on it without File System.
>      Linux Image : Resides in NOR Device ( 4Mb)
>      File System:  To be reside in NAND Device (128Mb). Still to be done .
> 2.Now i want to put JFFS2 file system on NAND device.
> 3. First I have created the Linux image with MTD support (also JFFS2
> file system selected) and ported on NOR device. On power ON of SBC
> board, Linux is booted and got error "Kernel panic - not syncing: VFS:
> Unable to mount root fs on unknown-block(31,0)"
> 4. As there is no JFFS2 File System on it we got this error.
> 5. We have downloaded the MTD utilities on the host system (PC).
> Kindly please tell me the procedure to put JFFS2 FS in the NAND device
> for the first time.
> Note that we don't have any filesystem on NAND device.

If NAND device holds your boot partition you can
a) upload the image to the NAND device from your bootloader (if one 
exists on your machine and supports NAND flash) or
b) boot from NFS rootfs for the first time and then use the nandwrite to 
transfer the image to NAND device.

HTH,
Hinko

-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
