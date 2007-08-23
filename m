Received: from bart.se.axis.com ([193.13.178.9])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IO6QZ-0006UW-4R
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 02:44:24 -0400
Received: from bart.se.axis.com (bart.se.axis.com [127.0.0.1])
	by bart.se.axis.com (Postfix) with ESMTP id 2721E64044
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 08:44:19 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by bart.se.axis.com (Postfix) with ESMTP id 141A964040
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 08:44:19 +0200 (CEST)
Date: Thu, 23 Aug 2007 08:44:12 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: MTD nand driver help
In-Reply-To: <3db60e760708222340g49294138w9ce3372ab5eb50bf@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0708230841590.8989@lnxricardw.se.axis.com>
References: <3db60e760708160941g3d2978f8i7e07c4d85a34685e@mail.gmail.com>
	<3db60e760708222317o22392948g1f3cbf69e246eba6@mail.gmail.com>
	<Pine.LNX.4.64.0708230823000.8989@lnxricardw.se.axis.com>
	<3db60e760708222340g49294138w9ce3372ab5eb50bf@mail.gmail.com>
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


On Thu, 23 Aug 2007, Tushar Kapse wrote:

> Thanx for the reply,
> But, my problem is as follows,
>
> I have the board with PXA255 and want to port the Linux with MTD driver s=
upport.
> I got the steps for creating the JFFS2 file system are :
> 1. using mkfs.jffs2 create the file system.
> 2. using eraseall erase the /dev/mtdn device
> 3. using nandwrite copy the jffs2 image to /dev/mtdn.
> But, my qustion is for erasing and copping jffs2 image in  /dev/mtdn
> device do i need to have the file system exist in the nand already.

No, that should not be necessary. Copying the image using nandwrite to an=
=20
erased nand partition /dev/mtdn should be ok.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
