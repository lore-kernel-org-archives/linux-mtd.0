Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D1DC88E66
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwgRshTYhqDgX/V8JL6Fdzu+UZ4fw0fQGmNEqSeIZic=; b=GSwU1RlJGLatRn23tsfnfuMAl+
	PeBVr7zU17P4eMsT86vvbk1A2nKo9YQZJjTuQunbCr1uyTwzoXNHJKQJSsot1OoGRfq0fo5QpQXdP
	5fdYZd/Y3I/jaqjU/pHmFbrSziJhaoSAunsrw3FxE00aRSPUbHjl/NCeVbeD1DrbFMem1AvqWXi8r
	DwYh25f2l6pqCb7S96s2YjvGhm/MOToaW1+MbxE3O0d7rzqoQBN4wcGR3bccSNP6S9ZAtkFQkPouE
	19E/52lmdIymThfVHxfBx95QFE2DofCMEEm5vJ3CJ/Mc9YIXCGRUzxDU6Qy5rqAFBhWLqLuQRpdqp
	KxIGizcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x637a-00000002yg2-1g0v;
	Mon, 14 Sep 2026 09:37:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x637Z-00000002yfk-1r1P
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 09:37:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 9744760142;
	Mon, 14 Sep 2026 09:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C9F1D1F000FF;
	Mon, 14 Sep 2026 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789378624;
	bh=EEczusL60kIlaGDXpaeA4vSKeh8P7cute24deuMG9pU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=f1q0VWeCoNCUqItX9fug//25Wrlsf+h1SaY/TONriAPkz9r4XL4YH1bLUIVRsegAc
	 0YQyBMdsBbETqyrLSZ7YzycFR0Y3an3clkhyL4Bv+UIW7jnV1c2AnozvQTVqNCf9CI
	 OSaxHJ7pk7F+UYH3RNnrPW0sp96egIvJe4gtPsSkz/oWxeIG6igurNwzFfSdUsVMP1
	 BoTSSBS0Gl+puw2Ku3FGzF7EZWVKC5eYjXunjTYU2ffE8igv4F60NE6AL6bcsxLCGb
	 29cfeu2UgAYwOGyyl17xVogECKj9xeS18RselvvdYF+S2diJnGYyU0mQqM0nTSPou3
	 dNsVC/xY5JUmg==
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 11:37:00 +0200
Message-Id: <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to
 s25fs256s1
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <Takahiro.Kuwano@infineon.com>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@linaro.org>, <alex@sverdlin.org>
X-Mailer: aerc 0.20.0
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
 <fb4398e88939472eaa86cdc098a3d265@infineon.com>
In-Reply-To: <fb4398e88939472eaa86cdc098a3d265@infineon.com>
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
Content-Type: multipart/mixed; boundary="===============7006240516835434174=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7006240516835434174==
Content-Type: multipart/signed;
 boundary=6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Takahiro,

On Mon Sep 14, 2026 at 9:11 AM CEST, Takahiro.Kuwano wrote:
> Hi Michael,
>
>> On Mon Sep 14, 2026 at 6:50 AM CEST, Takahiro Kuwano via B4 Relay wrote:
>> > From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>> >
>> > s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
>> > Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page siz=
e
>> > and sector map.
>>=20
>> Do you have an SFDP dump by chance? I haven't found one on the list
>> for this flash.
>>=20
>
> Yes, but param tables are located beyond PAGE_SIZE(1000h)...

Could you test the following patch if that helps?

--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -99,10 +99,26 @@ static umode_t spi_nor_sysfs_is_bin_visible(struct kobj=
ect *kobj,
 	return 0;
 }

+static size_t spi_nor_sysfs_bin_size(struct kobject *kobj, const struct bi=
n_attribute *attr, int n)
+{
+	struct spi_device *spi =3D to_spi_device(kobj_to_dev(kobj));
+	struct spi_mem *spimem =3D spi_get_drvdata(spi);
+	struct spi_nor *nor =3D spi_mem_get_drvdata(spimem);
+	struct sfdp *sfdp =3D nor->sfdp;
+	size_t sfdp_size =3D sfdp->num_dwords * sizeof(*sfdp->dwords);
+
+	if (attr =3D=3D &bin_attr_sfdp)
+		return sfdp_size;
+
+	return 0;
+}
+
+
 static const struct attribute_group spi_nor_sysfs_group =3D {
 	.name		=3D "spi-nor",
 	.is_visible	=3D spi_nor_sysfs_is_visible,
 	.is_bin_visible	=3D spi_nor_sysfs_is_bin_visible,
+	.bin_size	=3D spi_nor_sysfs_bin_size,
 	.attrs		=3D spi_nor_sysfs_entries,
 	.bin_attrs	=3D spi_nor_sysfs_bin_entries,
 };

--6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqfAPBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hMygF+PxyjWh8LmZT+QsgsGPiLePGUj9fSwJXR
qP1kY11p9hlGNsL9zWcF9dsOTwI/7relAYDN3ggcmfiNvgwBVcBQeGpyPfF4gvql
K+3pfOtE5QLDfXSdKz6IoPxDbnmsRIPvk5Y=
=6G4J
-----END PGP SIGNATURE-----

--6772bacee958a6c0e9d12f720d351f228d2b58bd69892be9ac587ac6df17--


--===============7006240516835434174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7006240516835434174==--

