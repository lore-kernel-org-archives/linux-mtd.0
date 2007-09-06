Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITEzT-0004zh-Cv
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 06:53:43 -0400
Subject: Re: General performance of NAND operations i.e mount and ls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20070906093735.GD2164@z1.synertronixx>
References: <20070906081215.GA5693@anita.doom>
	<1189067241.14370.23.camel@sauron>
	<20070906084418.GC2164@z1.synertronixx>
	<1189069864.14370.34.camel@sauron>
	<20070906093735.GD2164@z1.synertronixx>
Content-Type: text/plain; charset=utf-8
Date: Thu, 06 Sep 2007 13:53:12 +0300
Message-Id: <1189075992.14370.42.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-06 at 11:37 +0200, Konstantin Kletschke wrote:
> UBI: empty MTD device detected
> UBI: create volume table (copy #1)
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 0:512,
> written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 1:512,
> written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 2:512,
> written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 3:512,
> written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 4:512,
> written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 5:512,
> written 0 bytes
> UBI warning: io_init: EC and VID headers are in the same minimal I/O
> unit, switch to read-only mode
> UBI error: validate_ec_hdr: bad VID header offset 512, expected 128
> UBI error: validate_ec_hdr: bad EC header
> UBI error: ubi_io_read_ec_hdr: validation failed for PEB 0

This means your driver does not support sub-pages, but reports it does.
You should either fix sub-page support or do not report it is present.

There are good NANDtests available at

git://git.infradead.org/~ahunter/nand-tests.git
(http://git.infradead.org/?p=3Dusers/ahunter/nand-tests.git;a=3Dsummary)


Try them to make sure your NAND driver is all-right. Well, you may want
to avoid the torture test, but it is also very useful to run it with
limited amount of erase cycles to make sure your flash/driver survive
really high I/O load.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
