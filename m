Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7DDC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:28:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3957D60240
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 06:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3957D60240
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bTy2RQKNEv3S4tb5tub2UkQ66kduTa3x941I90KOs0=; b=uSnDmVBSmHschR
	mfcM0O7Ty+4N/kbzBhdYd6uBTkzIPzJ1b8IjszVk0bX2CD5QdzmfSS6sDWLyvb5vZsBMDsn4NMDNv
	b035lhRQIuOKNcNCA2cWebYNrx6BgvqQC9ot4iYCSp+LSGt+7De904y599LBCO1BvLwxWxCCGQY8c
	XAVvVSfoAACh+EqwYRJvt9GOet7klrzHP1pA6XUt7tEwgdUdU1xlviDWt0vejn1G1bdgh1zC2VPJb
	tK2Vz3oPTuEWvlaJsYaiQl5s+is6hO5+Y8uwAqI9sSuZeYXUYpXJiIdzgx//17jkEMZAUH0pAV+Qc
	q2VFe2szx4Y6BaoCOjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZomq-007w6D-Rb; Mon, 11 Oct 2021 06:27:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZomd-007w5V-Qm; Mon, 11 Oct 2021 06:27:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19B6R9UG088923;
 Mon, 11 Oct 2021 01:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633933629;
 bh=SelORhSquSxMSReMFVnXR4kenbg8CrvW0kLaLyc/10g=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=BZIkRAsWoZ0T5j9D6zIC2rrlWbO3IGREMg/seSSgzrpKduijkMxW89e16oYvG4bry
 QJUhIXDSu8MaZW3Xh44G67tX+ZSI+WbYTNLtrQ3tXi+lZiI8bZh785bIM6XIJ29lZu
 9RpVyXqTKCv+mmIi9k+GJvDhBUFIRoOKBn8kEuD4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19B6R85O113551
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 01:27:08 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 01:27:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 01:27:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19B6R7wf130378;
 Mon, 11 Oct 2021 01:27:08 -0500
Date: Mon, 11 Oct 2021 11:57:07 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <macromorgan@hotmail.com>, <vigneshr@ti.com>,
 <jaimeliao@mxic.com.tw>, <richard@nod.at>, <esben@geanix.com>,
 <linux@rasmusvillemoes.dk>, <knaerzche@gmail.com>,
 <Nicolas.Ferre@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <code@reto-schneider.ch>,
 <miquel.raynal@bootlin.com>, <heiko.thiery@gmail.com>, <sr@denx.de>,
 <mail@david-bauer.net>, <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH v2 09/35] mtd: spi-nor: atmel: Use flash late_init() for
 locking
Message-ID: <20211011062705.4vgew3efp5vvqwni@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-10-tudor.ambarus@microchip.com>
 <20210816190629.3kg4cbf5d7h7gyk5@ti.com>
 <a9d41aa96a8749b599d4479f18479c5d@walle.cc>
 <88abe817-9d2f-35f6-746c-1640b166aab8@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88abe817-9d2f-35f6-746c-1640b166aab8@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_232735_977475_ED4338A8 
X-CRM114-Status: GOOD (  31.69  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/10/21 11:40AM, Tudor.Ambarus@microchip.com wrote:
> On 9/10/21 12:44 AM, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > Am 2021-08-16 21:06, schrieb Pratyush Yadav:
> >> On 27/07/21 07:51AM, Tudor Ambarus wrote:
> >>> Locking is not described in JESD216 SFDP standard, place the locking
> >>> init in late_init().
> > =

> > Btw, we should differentiate between the block protection
> > bits and individual block locking. At least the latter is described
> > in the SFDP (I've seen it in the XTX SFDP, haven't checked the
> > standard yet).
> =

> that's probably a vendor specific table, not something standardized by SF=
DP.
> =

> > =

> >> You are chaning the order of setting the locking ops here. Earlier,
> >> they
> >> were set before we parsed SFDP. Now they are set after we parse SFDP.
> >> Though I don't see it making much of a difference.
> =

> Right, as the locking is not covered by SFDP, we should place it after
> parsing SFDP.
> =

> >>
> >>>
> >>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>> ---
> >>> =A0drivers/mtd/spi-nor/atmel.c | 30 +++++++++++-------------------
> >>> =A01 file changed, 11 insertions(+), 19 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> >>> index 1fea5cab492c..b937ef734e55 100644
> >>> --- a/drivers/mtd/spi-nor/atmel.c
> >>> +++ b/drivers/mtd/spi-nor/atmel.c
> >>> @@ -48,15 +48,11 @@ static const struct spi_nor_locking_ops
> >>> atmel_at25fs_locking_ops =3D {
> >>> =A0=A0=A0=A0 .is_locked =3D atmel_at25fs_is_locked,
> >>> =A0};
> >>>
> >>> -static void atmel_at25fs_default_init(struct spi_nor *nor)
> >>> +static void atmel_at25fs_late_init(struct spi_nor *nor)
> >>> =A0{
> >>> =A0=A0=A0=A0 nor->params->locking_ops =3D &atmel_at25fs_locking_ops;
> >>> =A0}
> >>>
> >>> -static const struct spi_nor_fixups atmel_at25fs_fixups =3D {
> >>> -=A0=A0=A0 .default_init =3D atmel_at25fs_default_init,
> >>> -};
> >>> -
> >>> =A0/**
> >>> =A0 * atmel_set_global_protection - Do a Global Protect or Unprotect
> >>> command
> >>> =A0 * @nor:=A0=A0=A0 pointer to 'struct spi_nor'
> >>> @@ -146,34 +142,30 @@ static const struct spi_nor_locking_ops
> >>> atmel_global_protection_ops =3D {
> >>> =A0=A0=A0=A0 .is_locked =3D atmel_is_global_protected,
> >>> =A0};
> >>>
> >>> -static void atmel_global_protection_default_init(struct spi_nor *nor)
> >>> +static void atmel_global_protection_late_init(struct spi_nor *nor)
> >>> =A0{
> >>> =A0=A0=A0=A0 nor->params->locking_ops =3D &atmel_global_protection_op=
s;
> >>> =A0}
> >>>
> >>> -static const struct spi_nor_fixups atmel_global_protection_fixups =
=3D {
> >>> -=A0=A0=A0 .default_init =3D atmel_global_protection_default_init,
> >>> -};
> >>> -
> >>> =A0static const struct flash_info atmel_parts[] =3D {
> >>> =A0=A0=A0=A0 /* Atmel -- some are (confusingly) marketed as "DataFlas=
h" */
> >>> =A0=A0=A0=A0 { "at25fs010",=A0 INFO(0x1f6601, 0, 32 * 1024,=A0=A0 4, =
SECT_4K |
> >>> SPI_NOR_HAS_LOCK)
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .fixups =3D &atmel_at25fs_fixups },
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .late_init =3D atmel_at25fs_late_i=
nit },
> >>> =A0=A0=A0=A0 { "at25fs040",=A0 INFO(0x1f6604, 0, 64 * 1024,=A0=A0 8, =
SECT_4K |
> >>> SPI_NOR_HAS_LOCK)
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .fixups =3D &atmel_at25fs_fixups },
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .late_init =3D atmel_at25fs_late_i=
nit },
> >>>
> >>> =A0=A0=A0=A0 { "at25df041a", INFO(0x1f4401, 0, 64 * 1024,=A0=A0 8,
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
> >>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .fixups =
=3D &atmel_global_protection_fixups },
> >>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .late_init =3D atmel_global_protec=
tion_late_init },
> >>
> >> Won't you be better off setting this in the manufacturer late_init()?
> >> It
> >> seems common for most atmel flashes.
> >>
> >> Of course, this would cause a problem for atmel flashes that don't have
> >> this at all, since we would set locking for those as well. But I think
> >> we can avoid that by checking for SNOR_F_HAS_LOCK in
> >> spi_nor_register_locking_ops().
> > =

> > +1
> > =

> =

> we also have the atmel_at25fs_late_init() method. setting it per manufact=
urer will result
> in setting the manufacturer locking ops for at25fs as well, which will be=
 overwritten by the
> at25fs locking ops. For those that don't support locking at all, we shoul=
d clear the locking
> ops as you said. This will make the code a little difficult to follow and=
 we return a bit
> to spaghetti. defining late_init() takes only a line anyway. I would keep=
 the code as it is
> if you don't mind. We can ask ourselves about scalability when we have lo=
ts of entries,
> we can reevaluate this in the future. Tell me if you have strong opinions=
 on this.

Okay, this should be fine I think. Looking at the Micron output driver =

strength patch has make me rethink manufacturer-wide settings in =

general. If we add manufacturer-wide settings, and then the manufacturer =

later change their minds and start using different settings for their =

newer flashes, we could easily run into a situation where half the =

flashes are just overwriting the manufacturer-wide default.

> =

> Cheers,
> ta
> =

> =


-- =

Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
