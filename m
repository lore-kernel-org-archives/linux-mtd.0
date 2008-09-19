Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KgewN-0003PW-LK
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 12:18:33 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.84.38.1])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	m8JCIY3t009927
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2008 14:18:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.13.8/8.13.8/Debian-3) with ESMTP id
	m8JCIODf016433
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2008 14:18:24 +0200
Date: Fri, 19 Sep 2008 14:18:24 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Problem with Hynix HY27UF081G2A 1Gb NAND flash?
Message-ID: <Pine.LNX.4.64.0809191409210.29177@lnxricardw.se.axis.com>
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


I'm testing the above mentioned NAND flash chip in a design which has=20
previously used the corresponding 1Gb parts from Samsung and Numonyx (ST)=
=20
without problems. However, with the Hynix chip, mtd won't even read the ID=
=20
code, it's just as if the chip wasn't there (it fails with

nand_get_flash_type: second ID read did not match 01,ec against ec,7a .

Before deciding on a course of action, I was wondering if anyone else has=
=20
had a similar problem. I've skimmed through the data sheet and cannot find=
=20
anything that is obviously different (save for the manufacturer's ID code=
=20
which is expected of course).

Kernel version is 2.6.26.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
    "With Free Software you are employing the best programmers on the plane=
t"
