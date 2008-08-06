Received: from mx1.myoutlookonline.com ([69.25.74.47])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KQgPL-0001ag-0a
	for linux-mtd@lists.infradead.org; Wed, 06 Aug 2008 10:38:19 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: usage of the reseverd byte in oob area
Date: Wed, 6 Aug 2008 06:31:00 -0400
Message-ID: <F933E170AF6D2641AC49FAE0F33296A9698A91@BE042.mail.lan>
In-Reply-To: <F933E170AF6D2641AC49FAE0F33296A9698A32@BE042.mail.lan>
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

=20

-----Original Message-----

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
--------------------------------------------------------

Hi All,

OK, my question (seems too silly and totally out of context)=20
could not find merit for a reply. the additional data on this:

As per the document "mtdnand.ps", for small page flash=20
(with 512 byte pagesize and 16 byte oob), the oob area is=20
used for=20
 1) ECC bytes=20
 2) two reserved bytes (one byte for badblock, other byte ???)
 3) filesystem specific info (JFFS2/YAFFS1).

The document "mtdnand.ps" also says, if anyone want to use=20
the Hardware ECC, he have to store the badblock information
into some known area of flash (NAND_BBT_*).

After this the badblock byte and other reserved byte in the=20
oob area is available for Hardware ECC.=20

Now, I would like to know, can one use the other reserved=20
byte for hardware ECC, while still using the badblock marker=20
byte for its intended role. With additional reserved bytes,=20
Total 7 bytes are available for hardware ECC (BCH). The=20
hardware can take scattered positions for ECC bytes.

The question is more about 'should' than 'can'.

Please point me, if this is not the right mailing list for=20
this query.


Thanks,
Raj Kumar Yadav
