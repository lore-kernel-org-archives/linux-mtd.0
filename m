Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CKhOz-0001xs-B8
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 14:11:09 -0400
Received: from westrelay04.boulder.ibm.com (westrelay04.boulder.ibm.com
	[9.17.193.32])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id i9LIB2Lv375776
	for <linux-mtd@lists.infradead.org>; Thu, 21 Oct 2004 14:11:02 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by westrelay04.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i9LIB2Am150248
	for <linux-mtd@lists.infradead.org>; Thu, 21 Oct 2004 12:11:02 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	i9LIB1iY012429
	for <linux-mtd@lists.infradead.org>; Thu, 21 Oct 2004 12:11:01 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: bodhi@despammed.com
In-Reply-To: <200410211624.i9LGOGk29291@mailout.despammed.com>
References: <200410211624.i9LGOGk29291@mailout.despammed.com>
Content-Type: text/plain
Message-Id: <1098382261.20427.16.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Thu, 21 Oct 2004 13:11:01 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Howto write to flash from user space (II)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-10-21 at 11:24, bodhi@despammed.com wrote:
> I already read http://www.linux-mtd.infradead.org/
> but I found no useful informations

There's all kinds of useful information on there...  for MTD developers
;).

> How can I write directly into flash from an user space application ?

Using either /dev/mtdblock (CONFIG_MTD_BLOCK) or /dev/mtd
(CONFIG_MTD_CHAR).

You might also want to look into JFFS2 if you haven't already.

> I am using a SA1110 with 16MB StrataFlash.
> I tried using /dev/mem but I can only read and not write to flash.

That's for DRAM only.

> I do not have any /dev/mtd* device in my /dev , why ?

You need to configure MTD into your kernel, and create the /dev nodes if
you aren't using devfs or udev.  The MAKEDEV script in the utils
directory helps with that.

> Do I need to develop a driver ?

No, StrataFlash is handled by the cfi_cmdset_0001 driver
(CONFIG_MTD_CFI_INTELEXT).

Also, the more information you give us, the more help we can provide. 
The board and flash chip types are a great start.  If you are still
having trouble, let us know what version of the kernel, what MTD
snapshot, etc.

josh
