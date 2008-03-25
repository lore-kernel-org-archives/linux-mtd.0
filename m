Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeB15-00052h-FF
	for linux-mtd@lists.infradead.org; Tue, 25 Mar 2008 15:24:47 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	m2PFOcTN031656
	for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2008 16:24:38 +0100
Date: Tue, 25 Mar 2008 16:24:26 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Old code question
Message-ID: <Pine.LNX.4.64.0803251616070.6032@lnxricardw.se.axis.com>
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


Ok, so this is old code, but perhaps someone can explain nevertheless ...

In the mtd used in Linux 2.6.16, mtd/nand/nand_ecc:nand_correct_data()=20
used to be able to return -1, 0, 1 or 2, with -1 meaning 'uncorrectable or=
=20
other error', 0 meaning 'no errors' and 1 meaning '1 error corrected'. But=
=20
what did 2 mean?

(Yes, we should and could upgrade to the latest version; we still want to=
=20
figure out what's going on as there's a bug elsewhere in our design and we=
=20
want to make sure we've fixed it).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
