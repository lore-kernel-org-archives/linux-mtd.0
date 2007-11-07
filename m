Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpjaD-0008In-4j
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 07:00:39 -0500
Received: by wa-out-1112.google.com with SMTP id v33so2650590wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Nov 2007 04:00:27 -0800 (PST)
Message-ID: <2563ac9e0711070400v82b344je142d46191254506@mail.gmail.com>
Date: Wed, 7 Nov 2007 13:00:27 +0100
From: "William Juul" <william.juul@datarespons.no>
Sender: william.juul@gmail.com
To: linux-mtd@lists.infradead.org
Subject: nand_oob_128?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are working on two custom cards with large nand devices and could
not find any implementation of nand_ecclayout for our HW in
drivers/mtd/nand/nand_base.c

I could not find any requirements for how this struct should be
implemented, so I just tried with:

static struct nand_ecclayout nand_oob_128 =3D {
=09.eccbytes =3D 48,
=09.eccpos =3D {
=09=09    80,  81,  82,  83,  84,  85,  86,  87,
=09=09    88,  89,  90,  91,  92,  93,  94,  95,
=09=09    96,  97,  98,  99, 100, 101, 102, 103,
=09=09   104, 105, 106, 107, 108, 109, 110, 111,
=09=09   112, 113, 114, 115, 116, 117, 118, 119,
=09=09   120, 121, 122, 123, 124, 125, 126, 127},
=09.oobfree =3D {
=09=09{.offset =3D 2,
=09=09 .length =3D 78}}
};

Can anyone confirm the validity of this implementation or point me to
information about how it should be implemented?
Or better yet, provide me with the correct implementation :-)

I will provide a patch once I feel comfortable with the validity of my
implementation.

Best regards
William Juul

-------------------------------------------------
William Juul, Senior Development Engineer
Data Respons Norge AS
Sandviksveien 26
P.O. Box 489
NO-1323 H=F8vik, Norway

www.datarespons.no
-------------------------------------------------
