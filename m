Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10C8C7113E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 06:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOq37fyBvk80hdMfpPNY1YanliWqzQtNBm/He+Xtr9M=; b=qdVdY1WpzQU+yRb0y1f8/Jk1CU
	Wn05cTgyBYU2Nyqg9CExSiMhnRZe7OuuApxFcnme7DmnNdekzmdztwtj1SlFVd3IR1VHLYAKO+HL6
	d1CFOL90b/gfu3n9lISobt+5yKDz92kAmPWuZYHo8SvuE0TNDZu6NNm6rl1LzpHrrU+2ZKsYTVl4y
	F5NypST+eLVMvlou1N6l7c/LZEWZ3JOIt4RyPE/Pj2ZcZN8nG0QfDTBPPXfrb8R8nq5xdAEvBbfr4
	M5fRZyLu8Suv+F6FfzA5Ov4AxefqHmn2XBFkOxeTt1S5YGxpKdWiNlbe7wDCnKtLr/EwnaLbZn3KX
	hTzQX4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbHw-0000000CImY-28LJ;
	Thu, 12 Jun 2025 06:19:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbFo-0000000CIcq-2tk8;
	Thu, 12 Jun 2025 06:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D617EA50CE4;
	Thu, 12 Jun 2025 06:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C63C4CEEA;
	Thu, 12 Jun 2025 06:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749709055;
	bh=CPf/T5G9xmhfOPA7I4FYNybIe2U380iGEg9S5rVqMdQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=hFLtT5LrjC2B2B6y5y9+BWaT/J+LcXSqEIIUkEf5DkTf5xtSWX7yhkF89C/pv+DUE
	 15xWYHUQeYxqcEQ4T+m1v7EuahV7Q2OfZXMCeuY9q2ZkTNYDllCfL050Zjlmzkmu7Q
	 fZx/Ly5qTLwJpgBSmdcYRDcRaswLsd4MAykBXxV+kK4ZaCX4nCChl0oOkW9j8w9mEf
	 zu4hDRz7YOjCN51poYRE06pK/FS9wBx8f6Oo1xTIWOe+v4LNjpLYCepqfOHv5nS1j2
	 yowDWu/nNB+Z3Uh4OETm+bzUhrw5rTe7JuBOM+tof0D0dSYp4i5w6w5WT+5rf9LVxG
	 0AbFUI85LHGQg==
Date: Thu, 12 Jun 2025 08:17:31 +0200
Message-Id: <DAKC3DIYRP6K.1G9HTSVXDJOLB@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <Manikandan.M@microchip.com>, <tudor.ambarus@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
X-Mailer: aerc 0.16.0
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
 <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
 <759e4a1e-6af4-4bf9-9a95-01a7f6faaf46@microchip.com>
 <DAJJ1UHCLV0M.2GGHO5PDRWMYH@kernel.org>
 <7c373149-53b9-4488-a8d0-e5560cdee7e0@microchip.com>
In-Reply-To: <7c373149-53b9-4488-a8d0-e5560cdee7e0@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_231736_870134_EFA2559D 
X-CRM114-Status: GOOD (  39.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3339412372064549997=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3339412372064549997==
Content-Type: multipart/signed;
 boundary=0bf826eaf559227e2f90d99249b46fe0d787dc52be8eeb98c992ad854154;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--0bf826eaf559227e2f90d99249b46fe0d787dc52be8eeb98c992ad854154
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> >>>> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> >>>> net drivers using the nvmem property.The offset is set to 0x0
> >>>> since the factory programmed address is available in the
> >>>> resource managed space and the size determine if the requested
> >>>> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> >>>> This is useful for cases where U-Boot is skipped and the Ethernet
> >>>> MAC address is needed to be configured by the kernel
> >>>>
> >>>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> >>>> ---
> >>>>    .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi    | 13 ++++++++=
+++++
> >>>>    1 file changed, 13 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b=
/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> >>>> index b34c5072425a..be06df1b7d66 100644
> >>>> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> >>>> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> >>>> @@ -210,6 +210,9 @@ &macb0 {
> >>>>         #size-cells =3D <0>;
> >>>>         phy-mode =3D "rmii";
> >>>>
> >>>> +     nvmem-cells =3D <&mac_address_eui48>;
> >>>> +     nvmem-cell-names =3D "mac-address";
> >>>> +
> >>>>         ethernet-phy@0 {
> >>>>                 reg =3D <0x0>;
> >>>>                 interrupt-parent =3D <&pioA>;
> >>>> @@ -238,6 +241,16 @@ qspi1_flash: flash@0 {
> >>>>                 m25p,fast-read;
> >>>>                 status =3D "disabled";
> >>>>
> >>>> +             nvmem-layout {
> >=20
> > IMHO this should be "sfdp {".
> >=20
> >>>> +                     compatible =3D "fixed-layout";
> >=20
> > Please read my feedback on the first version again..
> >=20
> > For the DT maintainers. The SFDP is a small table based content that
> > provide basic information about the flash. There are standard tables
> > which are specified by the JEDEC standard and there are vendor
> > tables, most of the time without proper documentation (or none at
> > all).
> >=20
> > Somehow we need to specify at what table we want to look at. I'd
> > like to see a binding which can potentially expose anything inside
> > the SFDP.
> >=20
> > So I've suggested to use "compatible =3D jedec,sfdp-vendor-table-NNNN"
> > where NNNN is the table parameter id. Additionally, the standard ids
> > could have names like "jedec,sfdp-bfpt" (basic flash parameter table).
> >=20
> > So in your case that would be:
> >=20
> > flash {
> > 	sfdp {
> > 		mac_address: table-1 {
> > 			compatible =3D "jedec,sfdp-idNNNN";
> > 		};
> > 	};
>
> Should the nvmem-layout be included as a child node under sfdp {}, or=20
> should it be implemented as a separate vendor-specific driver to handle=
=20
> the changes introduced in patch 1/3 ?

There is no nvmem-layout involved here.

But another possibility is to make it one. Then you have to
 (1) expose the *entire* sfpd as a nvmem device
 (2a) write an nvmem-layouts driver (in drivers/nvmem/layouts/)
 (2b) come up with a DT binding that is generic enough to expose
      various parameters of the SFDP, not just a one-off for the
      MAC address use case.

Maybe that is even a better fit.

> > };
> >=20
> > I don't know what NNNN is. Could you please provide a dump of the
> > sfdp of your flash.
>
> Please find the entire SFDP data of SST26VF064BEUI flash in Table 11.1=20
> of 11.0 APPENDIX

Please dump it according to [1], so we have it in a machine readable
format.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html


> > On Mon Jun 9, 2025 at 11:27 AM CEST, Manikandan.M wrote:

>
> https://ww1.microchip.com/downloads/aemDocuments/documents/MPD/ProductDoc=
uments/DataSheets/SST26VF064BEUI-Data-Sheet-DS20006138.pdf
>
>
> The vendor parameter ID is 'BF' if I am not wrong.
> >=20
> > -michael
> >=20
> >>>> +                     #address-cells =3D <1>;
> >>>> +                     #size-cells =3D <1>;
> >>>> +
> >>>> +                     mac_address_eui48: mac-address@0 {
> >>>> +                             reg =3D <0x0 0x6>;
> >>>> +                     };
> >>>
> >>> How would this work if in the future the mchp vendor table adds some
> >>> other info that needs to be referenced as nvmem? How do you distingui=
sh
> >>> the info from the table?
> >>> Would it be possible to have some kind of address and size to referen=
ce
> >>> the SFDP?
> >>
> >> I was previously advised not to hardcode the offset in the Device Tree
> >> [1]. In the current implementation (patch 1/3), the read callback for
> >> the MCHP vendor table distinguishes between EUI-48 and EUI-64 MAC
> >> addresses based on the nvmem size, which corresponds to the size of th=
e
> >> respective MAC address.
> >>
> >> [1] --> https://lore.kernel.org/lkml/D889HZF97H8U.1UUX54BAVLAC3@kernel=
.org/
> >>
> >>>
> >>>> +             };
> >>>> +
> >>>>                 partitions {
> >>>>                         compatible =3D "fixed-partitions";
> >>>>                         #address-cells =3D <1>;
> >>>
> >=20


--0bf826eaf559227e2f90d99249b46fe0d787dc52be8eeb98c992ad854154
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaEpw+xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h0NQGA4XhD74s0TEAR5mAjGQVv1YpzAkmTpXqh
JlEcY4mNvpEnYeGqbMJkTZi2NzOp5M1kAX9ioaikhRFTDEXTgFRWz8gNfwxw4DS5
MkAgqH+OeD3bAg01mCejFVo3cEVWc3ICWlg=
=3i6E
-----END PGP SIGNATURE-----

--0bf826eaf559227e2f90d99249b46fe0d787dc52be8eeb98c992ad854154--


--===============3339412372064549997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3339412372064549997==--

