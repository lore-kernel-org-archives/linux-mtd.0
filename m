Received: from xrelay04.mail2web.com ([168.144.1.50])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EEoGa-0001PR-Iv
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 14:22:38 +0100
Received: from [168.144.251.131] (helo=M2W027.mail2web.com)
	by xrelay04.mail2web.com with smtp (Exim 4.50) id 1EEoG5-00048R-Pi
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 09:22:07 -0400
Message-ID: <380-22005911213225774@M2W027.mail2web.com>
From: "chandrasekar@aelixsystems.com" <chandrasekar@aelixsystems.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 12 Sep 2005 09:22:05 -0400
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Subject: Reg. Nand Flash - large page(2112 bytes)
Reply-To: chandrasekar@aelixsystems.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hi,
    I m working on armboot bootloader=2E I m trying to access the large
page(2112 bytes) NAND Flash from the bootloader=2E I had succeeded in writ=
ing
a small pattern to test erase, write and read the flash=2E I dont have any=

idea abt checking ECC for the same=2E If anyone have worked on the same ie=
=2E,
the modification of the code to support large page nand flash, please give=

me some suggestions=2E FYI my present code supports NAND flash woth page s=
ize
528 bytes=2E=20
    I would be very grateful if any of you could suggest me as of where
exactly I m going wrong=3F

    regards,
    chandru=2E

--------------------------------------------------------------------
mail2web - Check your email from the web at
http://mail2web=2Ecom/ =2E
