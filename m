Received: from auriga.auriga.ru ([80.240.102.100])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nazL-0006DR-Vj
	for <linux-mtd@lists.infradead.org>; Fri, 15 Aug 2003 10:35:16 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 15 Aug 2003 13:34:58 +0400
Message-ID: <5B439D84E6653F4AA2E14A5D8898A7E165648D@auriga.auriga.ru>
From: "Eugeny Mints" <eugeny.mints@auriga.ru>
To: "David Woodhouse" <dwmw2@infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: eraseall in mtd snapshot at 04 of August 2003 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hello David, all!

I use mtd snapshot at 04 of August 2003.  While 'eraseall /dev/mtdX'
works fine for my TOSHIBA TC58256AFT NAND flash, 'eraseall -j /dev/mtdX'
hangs. Earlier I used mtd snapshot at ealy of June and 'eraseall -j'
worked. I checked eraseall implementation - it is the same in both
snapshots. So, it seems the problem is somewhere in nand implementation
(possible with cleanmarker of writeoob). Any suggestions would be very
helpful!

Thanks in advance,
				Eugeny
