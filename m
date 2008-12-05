Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8YQc-0008Bi-Pl
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 11:00:59 +0000
Subject: RE: UBIFS error CRC calculation on avr32 CPU
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eirik Aanonsen <eaa@wprmedical.com>
In-Reply-To: <2DE39384A09B744FA1E53FD4BF78D430535F4A@dware1013.doorway.loc>
References: <f17812d70811301949s6dc4bcddt791822f8d4ff223c@mail.gmail.com>
	<2DE39384A09B744FA1E53FD4BF78D430535DE3@dware1013.doorway.loc>
	<1228207463.5029.15.camel@sauron>
	<2DE39384A09B744FA1E53FD4BF78D430535E42@dware1013.doorway.loc>
	<1228230933.13686.8.camel@sauron>
	<2DE39384A09B744FA1E53FD4BF78D430535E64@dware1013.doorway.loc>
	<1228296325.13686.24.camel@sauron>
	<2DE39384A09B744FA1E53FD4BF78D430535F4A@dware1013.doorway.loc>
Content-Type: text/plain; charset=utf-8
Date: Fri, 05 Dec 2008 12:58:09 +0200
Message-Id: <1228474689.13686.40.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: kernel@avr32linux.org, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-12-05 at 11:46 +0100, Eirik Aanonsen wrote:
> It was correct that there was some faulty implementation of the oob/ecc h=
andling.
> This is ran on a SLC Samsung NAND flash(2GByte).

It is weird that you do not have sub-pages if this is SLC. You waste
4KiB per eraseblock because of this. Here you may find what is sub-page:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_find_min_io_size

If your flash allows sub-pages, I'd recommend to support them.

> Any hint to what to look into next would be great.

No, not really. You should dig your NAND driver.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
