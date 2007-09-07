Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ITWmM-0006qa-0p
	for linux-mtd@lists.infradead.org; Fri, 07 Sep 2007 01:53:21 -0400
Subject: Re: [PATCH try #2] Blackfin on-chip NAND Flash Controller driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: bryan.wu@analog.com
In-Reply-To: <1188885450.7074.7.camel@roc-laptop>
References: <1188885450.7074.7.camel@roc-laptop>
Content-Type: text/plain; charset=utf-8
Date: Fri, 07 Sep 2007 08:52:21 +0300
Message-Id: <1189144341.14370.77.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier.adi@gmail.com>, linux-kernel@vger.kernel.org,
	Robin Getz <rgetz@blackfin.uclinux.org>, linux-mtd@lists.infradead.org,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, akpm@linux-foundation.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-09-04 at 13:57 +0800, Bryan Wu wrote:
> This is the driver for latest Blackfin on-chip nand flash controller
>=20
>  - use nand_chip and mtd_info common nand driver interface
>  - provide both PIO and dma operation
>  - compiled with ezkit bf548 configuration
>  - use hardware 1-bit ECC
>  - tested with YAFFS2 and can mount YAFFS2 filesystem as rootfs
>=20
> ChangeLog from try#1
>  - use hweight32() instead of count_bits()
>  - replace bf54x with bf5xx and BF54X with BF5XX
>  - compare against plat->page_size in 2 cases when enable hardware ECC
>=20
> Signed-off-by: Bryan Wu <bryan.wu@analog.com>

Bryan,

I'd suggest you to test your NAND driver with the following NAND tests:

git://git.infradead.org/~ahunter/nand-tests.git

(http://git.infradead.org/?p=3Dusers/ahunter/nand-tests.git;a=3Dsummary)


You may want to avoid the torture test, but it is useful to run it with
limited amount of erase cycles to make sure your flash/driver survives
really high I/O load.For example, we caught occasional DMA transfer
problems while running the torture test for few days.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
