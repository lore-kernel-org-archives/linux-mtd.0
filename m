Received: from bart.se.axis.com ([193.13.178.9])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQOl7-0007VQ-Bj
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 10:43:08 -0400
Received: from bart.se.axis.com (bart.se.axis.com [127.0.0.1])
	by bart.se.axis.com (Postfix) with ESMTP id 77413641D6
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Aug 2007 16:43:00 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by bart.se.axis.com (Postfix) with ESMTP id 6A92C6415F
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Aug 2007 16:43:00 +0200 (CEST)
Date: Wed, 29 Aug 2007 16:42:51 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: transfer jffs2 rootFS to Nand flash
In-Reply-To: <200708291610.50617.schane@osmozis.com>
Message-ID: <Pine.LNX.4.64.0708291639070.4036@lnxricardw.se.axis.com>
References: <200708291610.50617.schane@osmozis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 29 Aug 2007, Saravanan Chanemouganandam wrote:

> 5. on the host created jffs2 rootfs image using #mkfs.jffs2 -r cmrootfs -=
n -o
> cmrootfs.img -e 0x20000 --pad=3D0x20000000
> ...
> 7. on the cm-x270, flashed rootfs image using mtd-utilities
>        cm-debian:~# nandwrite /dev/mtdblock1 /mnt/net/cmrootfs.img
> =09.....
>        Writing data to block 1ffe0000
> =09Data did not fit into device, due to bad blocks
> =09: Success
> =09cm-debian:~#

You shouldn't pad the image up to the size of the device (or partition, if=
=20
you were using partitions) or you will get this error, if there are bad=20
blocks in your flash (there usually are). However, your subsequent test=20
mount seems to work, so you seem to have gotten all valid data into the=20
flash anyway, so it still doesn't explain why it doesn't want to be=20
mounted when=20
the kernel boots.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
