Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7maG-00069r-RD
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 10:37:06 +0000
Received: by eyh6 with SMTP id 6so779719eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Apr 2011 03:37:02 -0700 (PDT)
Subject: Re: ubiformat: libmtd: error 12 (Cannot allocate memory): on
	system with limited RAM
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian.Ruppert@sewerin.de
In-Reply-To: <OF8FD344E7.A0857714-ONC125786B.003837F9-C125786B.0038E3D1@sewerin.de>
References: <OF8FD344E7.A0857714-ONC125786B.003837F9-C125786B.0038E3D1@sewerin.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 Apr 2011 13:34:18 +0300
Message-ID: <1302172458.2407.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Grant Erickson <marathon96@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-07 at 12:20 +0200, Bastian.Ruppert@sewerin.de wrote:
> Hello,
> 
> i have problems writing an image with ubiformat in an environment with 
> limited RAM.
> 
> The system is a TI OMAPL138 ARM9 with a 2.6.38-rc6-00071-gb9b65a4 kernel.
> 
> git log in mtd-utils:
> commit a70811466de2c4c0c3a538e5e04a4dd1a8fbcc03
> Author: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
> Date:   Tue Apr 5 17:32:29 2011 +0300
> 
> 
> The following command is working fine with say MEM=72M for the linux 
> kernel, and 
> the content in the ubi image can be mounted successfully after flashing.
> 
> ./ubiformat /dev/mtd3 -f image.ubi -S 19660800
> 
> But with less memory, say 32M the following error occurs:
> 
> -bash-3.2# ./ubiformat /dev/mtd3 -f image.ubi -S 19660800
> ubiformat: mtd3 (nand), size 79691776 bytes (76.0 MiB), 608 eraseblocks of 
> 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 607 -- 100 % complete 
> ubiformat: 607 eraseblocks have valid erase counter, mean value is 3
> ubiformat: 1 eraseblocks are supposedly empty
> ubiformat: flashing eraseblock 35 -- 24 % complete  ubiformat: page 
> allocation failure. order:5, mode:0x40d0
> [<c0034838>] (unwind_backtrace+0x0/0xf0) from [<c007f730>] 
> (__alloc_pages_nodemask+0x590/0x60c)
> [<c007f730>] (__alloc_pages_nodemask+0x590/0x60c) from [<c007f7c0>] 
> (__get_free_pages+0x14/0x44)
> [<c007f7c0>] (__get_free_pages+0x14/0x44) from [<c01e2db4>] 
> (mtd_write+0x8c/0x230)
> [<c01e2db4>] (mtd_write+0x8c/0x230) from [<c00a38f8>] 
> (vfs_write+0xb0/0x13c)
> [<c00a38f8>] (vfs_write+0xb0/0x13c) from [<c00a3e8c>] 
> (sys_write+0x3c/0x68)
> [<c00a3e8c>] (sys_write+0x3c/0x68) from [<c002ffa0>] 
> (ret_fast_syscall+0x0/0x2c)

This is an allocation failure inside the kernel, in mtd_write(). This is
exactly what Grant Erickson is fixing. He sent the patch recently, but I
found few minor issue and asked him to re-send.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
