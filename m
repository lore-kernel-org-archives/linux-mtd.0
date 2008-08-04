Received: from mx1.myoutlookonline.com ([69.25.74.47])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KPzYx-0001uD-24
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 12:53:25 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: usage of the reseverd byte in oob area
Date: Mon, 4 Aug 2008 08:26:03 -0400
Message-ID: <F933E170AF6D2641AC49FAE0F33296A9698A32@BE042.mail.lan>
From: "Raj Kumar Yadav" <ryadav@NeoMagic.com>
To: <linux-mtd@lists.infradead.org>
Cc: rajkumaryadav@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
=20
The oob offset 0x4 in small page (512 byte pagesize) flash is marked as
reserved.
Is this byte reserved for any specifc present or defined future h/w or
s/w use?=20
Or left for the software to interpret and use it suitabily?=20
=20
I have a requirement of 7 bytes for the ECC code (currently it is 6
bytes).
Can I use the reserved byte as extra bytes for the ECC code of 7 bytes?
=20
As the remaining 8 bytes of OOB area are used by the JFFS2 and YAFFS1.=20
=20
=20
=20
Thanks,
Raj Kumar Yadav
=20
=20
