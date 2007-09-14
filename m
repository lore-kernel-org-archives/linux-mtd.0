Received: from ext-nj2ut-13.online-age.net ([64.14.54.246])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IW5h9-0006Z2-Dx
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 03:34:35 -0400
Received: from int-nj2ut-6.online-age.net (int-nj2ut-6.online-age.net
	[3.159.237.75])
	by ext-nj2ut-13.online-age.net (8.13.6/8.13.6/20051114-SVVS-TLS-DNSBL)
	with ESMTP id l8E7YTjA002934
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2007 03:34:29 -0400
Received: from ALPMLEF02.e2k.ad.ge.com (int-nj2ut-6.online-age.net
	[3.159.237.75])
	by int-nj2ut-6.online-age.net (8.13.6/8.13.6/20050510-SVVS) with ESMTP
	id l8E7YTTG007644
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2007 03:34:29 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: MirrorBit FLASH Read/Write Issue
Date: Fri, 14 Sep 2007 08:35:26 +0100
Message-ID: <B9CFC78F14A9EE459093EEBC080529A8FC0693@LONMLVEM03.e2k.ad.ge.com>
From: "Billalabeitia, Jose Carlos (GE Indust,
	ConsInd)" <jc.billalabeitia@ge.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello:=20
=20
    I would like to know if someone out there has experienced the
following
problems in the S29GL064M90TFIR60 FLASH (MirrorBit Technology):
=20
    - After two consecutive readings at the same random memory location,

	the first reading is all zeros, and the second one is the data
OK.
=20
    - After programming one word to a random memory location,=20
	the data stored is all zeros or the adjacent memory location is=20
	affected with all zeros.
=20
=20
                                            Thank you
                                                         Billa
