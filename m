Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7pOv-0003O0-KR
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 13:05:20 +0000
Received: by wwb24 with SMTP id 24so276172wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 06:05:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20101018114104.GC15440@pengutronix.de>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
	<20101016131752.GA2676@pengutronix.de>
	<AANLkTim+RBZRsYFyqXRD65tPw69s3rKogEnBFBQr4E5q@mail.gmail.com>
	<20101018114104.GC15440@pengutronix.de>
Date: Mon, 18 Oct 2010 21:05:12 +0800
Message-ID: <AANLkTikHy9OCYWuZJUKnEyK=9uvwg6LRZvkW_YhL5esm@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
From: yidong zhang <zhangyd6@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: taliaferro62@gmail.com, glecerf@gmail.com, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, yegorslists@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 18, 2010 at 7:41 PM, Wolfram Sang <w.sang@pengutronix.de> wrote=
:
> On Mon, Oct 18, 2010 at 12:00:46PM +0800, yidong zhang wrote:
>> hi
>> =A0 =A0The 39VF*-B-Version flashes in the cfi_nopri_fixup_table don't wo=
rk
>> well in the current code. =A0Because of the mistaken use of
>> command(0x30) in the 6th bus cycle, which should be 0x50. I think the
>> 39VF*-B-Version flashes should be removed form the CFI probe mode. Or
>> maybe the erase operation should be changed for the Compatibility.
>
> Or we put in a variable like the unlock-address?

Maybe that's a better solution. I have no other methods.


>
> --
> Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | Wo=
lfram Sang =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | http://www.p=
engutronix.de/ =A0|
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
>
> iEYEARECAAYFAky8Mk8ACgkQD27XaX1/VRtD1QCgvhKREHwzceC1STdpZXJ2qrum
> Wg4An0JXJSQTkr5eShXUdykOn6lhlvbt
> =3D3BkZ
> -----END PGP SIGNATURE-----
>
>
