Received: from n1.cetrtapot.si ([89.212.80.162])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOBPh-0003cI-2B
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 08:04:04 -0400
Message-ID: <46CD779E.9020902@cetrtapot.si>
Date: Thu, 23 Aug 2007 14:03:42 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Tushar Kapse <tusharkapse@gmail.com>
Subject: Re: MTD nand driver help
References: <3db60e760708160941g3d2978f8i7e07c4d85a34685e@mail.gmail.com>	
	<3db60e760708222317o22392948g1f3cbf69e246eba6@mail.gmail.com>	
	<Pine.LNX.4.64.0708230823000.8989@lnxricardw.se.axis.com>	
	<3db60e760708222340g49294138w9ce3372ab5eb50bf@mail.gmail.com>	
	<Pine.LNX.4.64.0708230841590.8989@lnxricardw.se.axis.com>	
	<3db60e760708230211g27b99f93o67da774f64d7c556@mail.gmail.com>	
	<46CD5B75.2060105@cetrtapot.si>
	<3db60e760708230439n5cde0461r8444f46664c570ba@mail.gmail.com>
In-Reply-To: <3db60e760708230439n5cde0461r8444f46664c570ba@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
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
> thanx for your valuable suggestion..
> Here are the steps followed to create JFFS2 and dumped into the NAND
> using Boot Loader utility for NAND:
> 1) On the Host(x86) we have created a directory "Target" and copied
> the minumum required file system into that directory.
> 2)Then we have created a jffs2 image using the following command:
> "#./mkfs.jffs2 --pad=0xa00000 --eraseblock=0x20000 --pagesize=2048 -l
> -n --root=Target --output Target.jffs2"
>          Note: Here we want to create 10Mb image.
> 3)Then we have copied Target.jffs2 into NAND device using Boot Loader
> NAND utility which reside in the NOR.
>    Note:
>     1)We have copied Target.jffs2 from 0th Block, 0th Page onwards...
>     2)We dont have any partitions on NAND device. NAND formated using
> utility of Bootloader.

Can you check that the jffs2 image was indeed written on the NAND (by 
using some bootloader commands)?
By dumping and HEX comparing, lets say, first few bytes, kbytes...

> 
> If we have missed any steps kindly tell  us,
> waiting for your reply
> Best regards
> tushar
> 
> Once we have followed above steps,and when i Boot the Linux we found
> the error as follows:
> "Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(31,0)"

Are you sure that this NAND device (partition) is located on 
/dev/mtdblk0 (as the error suggests)? If you have NOR flash also present 
on your this might not be the case...

Regards,
Hinko

-- 
ÈETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
