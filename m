Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GOPT-0000rI-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 18:56:43 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: <anidea@earthlink.net>, <linux-mtd@lists.infradead.org>
Subject: Re: Nand flash and blob
Date: Tue, 26 Nov 2002 08:22:33 +1300
References: <017c01c294a2$907fe9b0$6401000a@zorak>
In-Reply-To: <017c01c294a2$907fe9b0$6401000a@zorak>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021125192709.87DC44754@tiger.actrix.co.nz>
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

There are conceptually two ways of doing this:
* Use reserved NAND blocks to store the image.
* Store the image in a NAND file system (JFFS2 or YAFFS).

The second option has various advantages in that the image can then be 
transferred via file system copies. I have done this for WinCE, but other 
people have done this for Linux..

Nick Bane has done some mork to transfer YAFFS images into the device under 
bootloader control. See 
http://www.toby-churchill.org/Distribution/distribution.html

-- CHarles




On Tue, 26 Nov 2002 05:49, Gabriel Goldstein wrote:
> Hello,
>
> I'm working on a arm based design where I have a 16MB Sandisk/Samsung
> nand flash device.  I think I have the Linux side settled buy using the
> standard MTD driver.
>
> I'm using BLOB and I'd like to know what people are doing to get the
> system loaded.  I have zImage, params, and ramdisk that I want to use my
> NAND device to store these blocks.
>
> Thanks,
>
> Gabriel
>
>
> Gabriel Goldstein
> Anidea Engineering, Inc.
> Fort Lauderdale, FL
> anidea@earthlink.net
> Phone:  954-254-9898
> Fax:  240-368-8982
