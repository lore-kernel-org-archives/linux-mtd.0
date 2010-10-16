Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P77cV-0003Da-KA
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 14:20:25 +0000
Received: by wyi11 with SMTP id 11so1865949wyi.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 07:20:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20101016131752.GA2676@pengutronix.de>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
	<20101016131752.GA2676@pengutronix.de>
Date: Sat, 16 Oct 2010 22:20:16 +0800
Message-ID: <AANLkTimfD5u0d7FaY2nHp-QcA2WH0d0v01qUbA8Jbhrf@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
From: yidong zhang <zhangyd6@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, glecerf@gmail.com, taliaferro62@gmail.com,
	David.Woodhouse@intel.com, yegorslists@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 16, 2010 at 9:17 PM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
> On Sat, Oct 16, 2010 at 08:25:44PM +0800, yidong zhang wrote:
>> Hi
>> =A0 Thanks for your reply. In the cfi_nopri_fixup_table, i added the
>> below code as you did.
>> { CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B
>
> OK, please just use C-style comments (I just sent another patch
> converting the others). Also, would be nice if you could check the
> datasheet for other IDs mentioned there and add them, too.
>
>> And the flash can get detected. But i still have one confusion.
>> According to the =A0data sheets Table 6, in the 6th bus write cycle.
>> 39VF6401B uses 0x50 and 39VF6401 uses 0x30. If 39VF6401B uses 0x30 in
>
> Ouch! Is this true for the other 39VF*-non-B and B-versions, too?

Yeah,  it is true for the other  39vf*-no-B and B-versions listed on
the cfi_nopri_fixup_table. And many other chips look like the
39VF*-B-versions.



>
> Adding Guillaume to CC...
>
> Regards,
>
> =A0 Wolfram
>
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Wo=
lfram Sang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEYEARECAAYFAky5pgAACgkQD27XaX1/VRuEjQCeNCz+zi5WcYZkPqs2e5qPHn2C
> 4dYAn20dlxN5m+SdRDqtaspFiEFR0KAY
> =3Dq/e2
> -----END PGP SIGNATURE-----
>
>
