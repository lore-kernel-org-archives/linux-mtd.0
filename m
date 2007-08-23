Received: from bart.se.axis.com ([193.13.178.9])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOE0e-0005eG-Dg
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 10:50:09 -0400
Received: from bart.se.axis.com (bart.se.axis.com [127.0.0.1])
	by bart.se.axis.com (Postfix) with ESMTP id 446DE64083
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 16:50:04 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by bart.se.axis.com (Postfix) with ESMTP id 36BB964079
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Aug 2007 16:50:04 +0200 (CEST)
Date: Thu, 23 Aug 2007 16:49:58 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: MTD nand driver help
In-Reply-To: <3db60e760708230721k56b02922o74818747035ff783@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0708231647290.8989@lnxricardw.se.axis.com>
References: <3db60e760708160941g3d2978f8i7e07c4d85a34685e@mail.gmail.com>
	<3db60e760708222317o22392948g1f3cbf69e246eba6@mail.gmail.com>
	<Pine.LNX.4.64.0708230823000.8989@lnxricardw.se.axis.com>
	<3db60e760708222340g49294138w9ce3372ab5eb50bf@mail.gmail.com>
	<Pine.LNX.4.64.0708230841590.8989@lnxricardw.se.axis.com>
	<3db60e760708230211g27b99f93o67da774f64d7c556@mail.gmail.com>
	<46CD5B75.2060105@cetrtapot.si>
	<3db60e760708230439n5cde0461r8444f46664c570ba@mail.gmail.com>
	<46CD779E.9020902@cetrtapot.si>
	<3db60e760708230721k56b02922o74818747035ff783@mail.gmail.com>
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

> Thanx....
> we have verified the jffs2 image in the nand with the bootloader
> utility and it is correct.
> how to verify that this NAND device is located on /dev/mtdblk0 ?
> since we do not have any partion in the nand, is it necessary to have
> the partition in the nand?

Even if you haven't partitioned your nand flash, you will probably find=20
that for instance your nor flash is /dev/mtdblock0 and your nand flash=20
then may be /dev/mtdblock1, assuming don't have any partitions in the nor=
=20
flash. I.e. even without partitioning, each flash chip has its own=20
/dev/mtdblockn device. This is especially true when the devices are not=20
the same type (nor vs. nand). If you have several nor devices of the same=
=20
type, depending on your mtd configuration, they can be concatenated to one=
=20
single /dev/mtdblockn device.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
