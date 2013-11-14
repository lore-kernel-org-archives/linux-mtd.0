Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgpFg-00063n-QW
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 05:14:01 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, Ivan Djelic
 <ivan.djelic@parrot.com>, "avinashphilipk@gmail.com"
 <avinashphilipk@gmail.com>
Subject: RE: [PATCH v3 1/4] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
Date: Thu, 14 Nov 2013 05:13:33 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA3798E@DBDE04.ent.ti.com>
References: <1383385576-26095-1-git-send-email-pekon@ti.com>
 <1383385576-26095-2-git-send-email-pekon@ti.com>
 <20131113211100.GG9468@ld-irv-0074.broadcom.com>
In-Reply-To: <20131113211100.GG9468@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> + Philip and Ivan, who did relevant work
>=20
Including Avinash Philip's new email-id... <avinashphilipk@gmail.com>


> > On Sat, Nov 02, 2013 at 03:16:13PM +0530, Pekon Gupta wrote:
> > chip->ecc.correct() is used for detecting and correcting bit-flips duri=
ng read
> > operations. In omap2-nand driver this is done usingt following function=
s:
> >
> > - omap_correct_data(): for H/W based HAM1_ECC schemes
> > 	(Un-Touched in current patch)
> >
> > - omap_elm_correct_data(): for H/W based BCHx_ECC scheme
> > 	Current implementation of this function is not scalable for newer ECC
> > 	schemes because:
> > 	- It depends on a specific byte-position in OOB area (reserved as
> 0x00)
> > 	  to differentiates between programmed-pages and erased-pages.
> > 	  This reserved byte-position cannot be accomodated in all ECC
> schemes.
> > 	- Current code is not scalable for future ECC schemes due to tweaks
> for
> > 	  BCH4_ECC and BCH8_ECC at multiple places.
> > 	- It checks for bit-flips in Erased-pages using check_erased_page().
> > 	  This is over-work, as sanity of Erased-page can be verified by just
> > 	  comparing them to a pre-defined ECC-syndrome for all_0xFF data.
> >
> > 	This patch optimizes omap_elm_correct_data() in following ways:
> > 	(1) Removes dependency on specific reserved-byte (0x00) in OOB
> area,
> > 	    instead Erased-page is identified by matching calc_ecc with a
> > 	    pre-defined ECC syndrome of all(0xFF) data
> > 	(2) merges common code for BCH4_ECC and BCH8_ECC for scalability.
> > 	(3) handles incorrect elm_error_location beyond data+oob buffer.
> > 	(4) removes check_erased_page(): Bit-flips in erased-page are
> handled
> > 	    in same way as for programmed-page
>=20
> Are you sure that this new scheme is equivalent to the old? i.e., is
> this backwards compatible?
>
Yes, this is backward compatible. I'm also testing it using old boot-loader=
s.
With this patch NAND boots (ROM-> boot-loader (SPL + u-boot) -> kernel).

[...]

>  Are you totally dropping the "reserved byte"  marker?
>=20
No, The "reserved byte" is part of ecc.layout which is defined in ROM code.
(please refer AM335x TRM [1] (b) Figure which explains ECC layout)

I'm just replacing below check in which driver determines whether page is
programmed or not based on number of '0' bits present in "reserved" byte.
> > -	/*
> > -	 * Check data area is programmed by counting
> > -	 * number of 0's at fixed offset in spare area.
> > -	 * Checking count of 0's against threshold.
> > -	 * In case programmed page expects at least threshold
> > -	 * zeros in byte.
> > -	 * If zeros are less than threshold for programmed page/
> > -	 * zeros are more than threshold erased page, either
> > -	 * case page reported as uncorrectable.
> > -	 */
> > -	if (hweight8(~read_ecc[eccsize]) >=3D threshold) {
> > -		/*
> > -		 * Update elm error vector as
> > -		 * data area is programmed
> > -		 */
> > -		err_vec[i].error_reported =3D true;
> > -		is_error_reported =3D true;
> > -	} else {
> > -		/* Error reported in erased page */
> > -		int bitflip_count;
> > -		u_char *buf =3D &data[info->nand.ecc.size * i];
> > -
> > -		if (memcmp(calc_ecc, erased_ecc_vec, eccsize)) {
> > -			bitflip_count =3D erased_sector_bitflips(
> > -					buf, read_ecc, info);

Also, based on following discussion, erased pages also need to be checked
for bit-flips.
https://lkml.org/lkml/2012/10/5/288

So instead of depending on "reserved" byte marker in OOB area,=20
I'm identifying the erased page based=20
if ECC_of(read_data + read_ecc) =3D=3D ECC_of( all 0xff * (ecc.size + ecc.b=
ytes))
	 then page is erased.

[...]

> Is this compatible with your bootloaders? I don't have a very
> clear mental picture of exactly what your driver is doing to check
> programmed/erased pages, and I'm certainly not familiar with your
> bootloader/ROM code.
>=20
Pointing to AM335x TRM which I'm referring for this ..
- http://www.ti.com/product/am3359
- [1] latest AM3359 TRM  http://www.ti.com/litv/pdf/spruh73i

(a) Section: 26.1.7.4 NAND
	This section explains ROM code behavior for booting from NAND.
	ROM code also fetches device geometry from ONFI params.
	In addition there is a separate boot mode (called NANDI2C) where
	device parameters can be fetched from on-board EEPROM.

(b) Figure 26-15. ECC Data Mapping for 2 KB Page and 8b BCH Encoding
	This figure explains ecc layout used by ROM code, which is what
	I'm using as reference for BCH8_HW algorithm.


with regards, pekon
