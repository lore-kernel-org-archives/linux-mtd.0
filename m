Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QIJyW-0007G3-MJ
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 12:17:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id F1D9712033
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 May 2011 14:17:37 +0200 (CEST)
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OXbzPHSbL0Wj for <linux-mtd@lists.infradead.org>;
	Fri,  6 May 2011 14:17:37 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by ra.se.axis.com (Postfix) with ESMTP id 409B511FC3
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 May 2011 14:17:37 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by seth.se.axis.com (Postfix) with ESMTP id 3EAE73E187
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 May 2011 14:17:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	p46CHbFX002713
	for <linux-mtd@lists.infradead.org>; Fri, 6 May 2011 14:17:37 +0200
Date: Fri, 6 May 2011 14:17:37 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: ubirmvol:ing gluebied volumes
Message-ID: <Pine.LNX.4.64.1105061412050.15966@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I enabled the gluebi MTD emulation layer in the kernel, and was pleased to=
=20
see all the UBI volumes coming up in /proc/mtd as mtd volumes.

However, one thing though, if I try to ubirmvol one of the UBI volumes, I=
=20
get:

ubirmvol: error!: cannot UBI remove volume
           error 16 (Device or resource busy)

similar to what I get if I have a mounted ubifs residing in an UBI volume=
=20
and try and ubirmvol the volume without umounting the file system.

Fair enough, I guess gluebi is keeping the UBI volume busy? But then how=20
do I free it up? There's normally no way to disassociate mtd partitions=20
from the underlying media, and I can't see any ubi tool that would do this=
=20
either.

So is this an (unfortunate) consequence of using gluebi: that the=20
underlying UBI volumes can't be removed?

Same thing happens if I try and ubidetach the UBI partition from the=20
underlying mtd partition: Device or resource busy.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
