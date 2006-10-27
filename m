Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GdR2u-0003Ho-DH
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 13:42:49 +0100
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by krynn.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	k9RCglCO020272
	for <linux-mtd@lists.infradead.org>; Fri, 27 Oct 2006 14:42:47 +0200
Date: Fri, 27 Oct 2006 14:44:21 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: /proc/mtd and flash information
Message-ID: <Pine.LNX.4.64.0610271433390.25906@lnxricardw.se.axis.com>
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


Hi,

It seems to me that /proc/mtd is a little short on information.

It would be nice to see the type of media (NOR, NAND etc), write and oob=20
size (for NAND), perhaps a couple of other things for NAND such as the=20
number of bad blocks within a partition.

Perhaps having a /proc/mtdX file for each device, giving much the same=20
information that otherwise has to be fetched using ioctls like MEMGETINFO,=
=20
ECCGETLAYOUT, ECCGETSTATS etc. Or would that be considered useless, given=
=20
that the same information can actually be obtained from userspace using an=
=20
application using those ioctls?

I see there is an application called flash_info which would seem to=20
display information, but which actually only displays info gathered from=20
MEMGETREGIONCOUNT. Perhaps it would be an idea to augment this application=
=20
so that it outputs as much information as can be read using ioctls?

Don't mind working on this, but would like some input first.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
