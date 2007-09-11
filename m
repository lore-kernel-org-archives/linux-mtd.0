Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IV1E7-0007J6-4T
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 04:36:09 -0400
Subject: Re: [PATCH try #2] Blackfin on-chip NAND Flash Controller driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: bryan.wu@analog.com
In-Reply-To: <1189417837.28956.9.camel@roc-desktop>
References: <1188885450.7074.7.camel@roc-laptop>
	<1189144341.14370.77.camel@sauron>
	<1189417837.28956.9.camel@roc-desktop>
Content-Type: text/plain; charset=utf-8
Date: Tue, 11 Sep 2007 11:35:07 +0300
Message-Id: <1189499707.14370.107.camel@sauron>
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

Hi,

On Mon, 2007-09-10 at 17:50 +0800, Bryan Wu wrote:
> Here is the test log, only 2 errors in oobtest. After digging into the
> mtd-nand driver code, it should be no relation to my bf5xx_nand driver.
> Maybe somethings wrong in the mtd-nand code. I intend to get some help
> from you, please see my test log below:

> oobtest: Attempting to read past end of device
> oobtest: An error is expected...
> oobtest: error: read past end of device

This means that MTD did not return an error when the test tried to read
the last NAND page's OOB. Here is the code:

/* Attempt to write off end of device */
ops.mode      =3D MTD_OOB_AUTO;
ops.ooblen    =3D mtd->ecclayout->oobavail + 1;
ops.oobbuf    =3D writebuf;
printk(PRINT_PREF "Attempting to write past end of device\n");
printk(PRINT_PREF "An error is expected...\n");
err =3D mtd->write_oob(mtd, mtd->size - mtd->writesize, &ops);

So we read OOB size + 1 byte from the last NAND page and get no error.

This test passes for nandsim, so I'm not sure the problem is in the
generic code. On the other hand, it is generic code which should check
rages.

> oobtest: Attempting to write past end of device
> oobtest: An error is expected...
> nand_write_oob: Attempt to write past end of page
> oobtest: Error occurred as expected
> oobtest: Attempting to read past end of device
> oobtest: An error is expected...
> oobtest: error: read past end of device

Similar.

> I plan to do the torture test after this oobtest passed. And this
> nand_test suites are intended to integrated into our Blackfin
> uClinux-dist testsuites.

We are planning to clean up the tests and submit them for kernel
inclusion some day, when we have time.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
