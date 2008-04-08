Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj6cT-0005mh-7E
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 05:43:45 +0000
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OFC5391750.C1B34EBF-ON88257424.006DD52A-88257424.006E8EFD@selinc.com>
References: <OFC5391750.C1B34EBF-ON88257424.006DD52A-88257424.006E8EFD@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 Apr 2008 08:43:06 +0300
Message-Id: <1207633386.8040.112.camel@sauron>
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


On Mon, 2008-04-07 at 13:07 -0700, Bruce_Leonard@selinc.com wrote:
> >=20
> > Is it a secret what is your flash and what is its size? If it is NAND
> > I'd recommend you to test it with Adrian's NAND tests:
> > git://infradead.org/~ahunter/nand-tests.git
> >=20
> Nope, no secret.  We're using Samsung K9WAG08U1A NAND parts in 2GiB, 4GiB=
,=20
> and 8GiB configurations.  At least we're hoping to get the 4 and 8GiB=20
> configurations working.
If you are thinking about using UBI, it might be not fast enough if you
have slow I/O which is usually the case if there is not NAND controller.
But anyway, I would be very interested to know UBI attach time for your
flash.

>   I've run into a problem in the MTD layer with the=20
> size field.  It's a 32-bit field which isn't big enough to store=20
> 0x100000000 or 0x200000000 which we need for the two larger=20
> configurations.  Just changing it to a 64-bit field introduces problems=20
> with other code, so we're looking at using more than one NAND controller=20
> in our FPGA and concatenating the NAND chips at the MTD level.

Well, I guess it should not be too difficult to fix these 64 bit issues.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
