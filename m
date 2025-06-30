Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D19C7EE39
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWhWUQZDKoPis13z7Sjv+VproGbdpyGq0GJuLNTVAJE=; b=dcVIt4Ah2JxCCQ9y1ftsvVPGoR
	d+HgaRTIqmN6yEGCBiv2pSVzg/kioFpDZlFcE5AE1/b5awY5O4REieUzSFeC1VSlSoiwI9PoYcLn6
	SByX+pD+GIECps5WNnil+9IoWV5Y67ektSseVdddA98SNqq3ruXBqBqJc7Ak+RkHDE8zZ3L7YBjH8
	HjITM4FQzpyuD30nKCx2oytFsCKzNuyGpECHzVYpcFaiHoMxwPyoTvHlG/hPM2kkv4FbVWGIoKOxY
	K9mxVHgN/+IJlT4sP3H12PEK0gNY/L9v0W4NlLqTP5gXhxVw+YkAGDt9B83J3kz6IU1lZrjG7VNwx
	Yi1btzGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAlu-00000001kSB-1wUA;
	Mon, 30 Jun 2025 09:25:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAlp-00000001kRT-0Bpg
	for linux-mtd@lists.infradead.org;
	Mon, 30 Jun 2025 09:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ADA0462AA;
	Mon, 30 Jun 2025 09:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA57AC4CEE3;
	Mon, 30 Jun 2025 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751275548;
	bh=smX2YBtkYqzCCe10Vwr0s1kVTj75TS4LURSnqOo+jGE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=cfDcJZSoZB3Kzntdi+rvfCVC88AiefVnO+ej4yLk/X5N7hP+gia+AY1ZUMXjvZf41
	 w2xS27Sz6VLshhKmMpIUgPBNmdSswJ/zxnIU5meuFjz9tCx4JfjXxoGD0cAP+kTb34
	 g9G0fHQEjL+4TpPyBpp0ah/fZ1v1PSriAMw6nFqyqWPX2BSVaEoTxakZC4cB/7DjcX
	 gii6UmzNkovRU346nRLN6XyyTAS0SsI2VWvle2iRcalx6QbyS/TSdhTAUd6gBlRLnG
	 vrMqbJlgBAvUPZKPIBKiXvNOq+tlaafTaiO8Fz99mPP9f/4Zh+rddoVhLOtwr2qKqA
	 U8S0wglC8Owcg==
Date: Mon, 30 Jun 2025 11:25:44 +0200
Message-Id: <DAZRDAEP431C.26ALRPF1GSJQH@kernel.org>
Subject: Re: [bug] spi-nor not unlocking on Ubiquiti XW and WA
Cc: <tim.j.wilkinson@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jean-Marc Ranger" <jmranger@hotmail.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com>
In-Reply-To: <
 <DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_022549_133201_C32039C7 
X-CRM114-Status: GOOD (  42.43  )
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
Content-Type: multipart/mixed; boundary="===============7465026611264170766=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7465026611264170766==
Content-Type: multipart/signed;
 boundary=9999c2a3d1de4970bbc0b7b85935accf772f7e48f1c61a8f61f2cc29655e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9999c2a3d1de4970bbc0b7b85935accf772f7e48f1c61a8f61f2cc29655e
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> I'm reporting this as an user of OpenWRT 23.05 on an Ubiquiti=20
> Nanostation AC, who hopes to upgrade to 24.10. Currently, upgrading=20
> results in a device where no configuration can be saved. Recovery=20
> requires physical presence, on devices often installed outdoor.

thanks for the bug report.

> The issue has an explanation and a patch (for kernel 6.6) has been=20
> available since late 2024 [1, attached below][2, which merges multiple=20
> fixes]. It has been used by others [3] and myself. However, its author=20
> believes that it doesn't have the correct approach to be upstreamed [4].=
=20
> OpenWRT maintainers are waiting for an ACK or better from upstream=20
> before applying [5].
>
> Is there a way to "unlock" this (pun intended) ?
>
> For reference, OpenWRT configures those devices with=20
> CONFIG_MTD_SPI_NOR_SWP_DISABLE [6].
>
> I'm available to test, but:
> - the only device I can use is a production one
> - OpenWRT is still working on upgrading ath79 from 6.6 to 6.12 [7], so=20
> I'd be limited to testing on 6.6
>
> Let me know how I can help.
>
> Thanks!
>
> Jean-Marc
>
>
> [1]=20
> https://github.com/openwrt/openwrt/pull/17287/commits/c98a55f95268f109911=
c5fddf5a153cfe3565b74
> [2] https://github.com/aredn/aredn/blob/main/patches/006-flash-fixes.patc=
h
> [3] https://github.com/openwrt/openwrt/issues/17285#issuecomment-29469788=
32
> [4] https://github.com/openwrt/openwrt/pull/17287#issuecomment-2558569582
> [5] https://github.com/openwrt/openwrt/pull/17287#issuecomment-2558502454
> [6]=20
> https://github.com/openwrt/openwrt/blob/bb59922007043c0a0813d62b0d9f6e801=
caff9df/target/linux/ath79/generic/config-default
> [7] https://github.com/openwrt/openwrt/issues/16569
>
>
>  From c98a55f95268f109911c5fddf5a153cfe3565b74 Mon Sep 17 00:00:00 2001
> From: Tim Wilkinson <tim.j.wilkinson@gmail.com>
> Date: Mon, 16 Dec 2024 09:37:34 -0800
> Subject: [PATCH] kernel: Fix setup of flash chips which must be unlocked
>   before use.
>
> Setup the mtd information for spi nor flash before calling running
> the nor setup.
>
> The current code assumes the nor setup doesnt make reference to the mtd
> information. There's even a comment to this effect. However, at least
> when flash chips must be unlocked, this isn't true.  Consequently, the
> unlock code will fail because it makes reference to uninitialized mtd
> information. This failure is silent because the bad mtd information
> claims the flash is 0 bytes long, and so there is nothing to unlock.
>
> This patch moves the mtd initialization before the nor setup, so the
> mtd info is available.
>
> This fix has been tested on two different Ubiquiti devices - the
> Rocket AC Lite and the Rocket M5 XW. These use the mx25l12805d and
> mx25l6405d Macronix flash chips respectively.  Previously these devices
> had failed to operate correctly as it was not possible for any
> persistent changes to be made once the factory build had been installed.
> With this change these devices behave correctly.
>
> Signed-off-by: Tim Wilkinson <tim.j.wilkinson@gmail.com>
> ---
>   .../436-mtd-spi-earlier-mtd-setup.patch       | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644=20
> target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patch
>
> diff --git=20
> a/target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patch=20
> b/target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patch
> new file mode 100644
> index 00000000000000..da75e9f7abfe96
> --- /dev/null
> +++ b/target/linux/generic/pending-6.6/436-mtd-spi-earlier-mtd-setup.patc=
h
> @@ -0,0 +1,20 @@
> +--- a/drivers/mtd/spi-nor/core.c
> ++++ b/drivers/mtd/spi-nor/core.c
> +@@ -3540,14 +3540,14 @@
> + 	if (ret)
> + 		return ret;
> +
> ++	/* No mtd_info fields should be used up to this point. */
> ++	spi_nor_set_mtd_info(nor);
> ++
> + 	/* Send all the required SPI flash commands to initialize device */
> + 	ret =3D spi_nor_init(nor);
> + 	if (ret)
> + 		return ret;
> +
> +-	/* No mtd_info fields should be used up to this point. */
> +-	spi_nor_set_mtd_info(nor);
> +-

This seems to be due to the use of the uninitalized "mtd->size".
Could you try the following patch which is based on the latest
next kernel. It replaces mtd->size with nor->params->size, so you
could backport it to 6.6, but maybe it will apply anyway.

---snip---
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9c9328478d8a..9b07f83aeac7 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -56,7 +56,6 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor =
*nor)
 static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t=
 *ofs,
 					u64 *len)
 {
-	struct mtd_info *mtd =3D &nor->mtd;
 	u64 min_prot_len;
 	u8 mask =3D spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask =3D spi_nor_get_sr_tb_mask(nor);
@@ -77,13 +76,13 @@ static void spi_nor_get_locked_range_sr(struct spi_nor =
*nor, u8 sr, loff_t *ofs,
 	min_prot_len =3D spi_nor_get_min_prot_length_sr(nor);
 	*len =3D min_prot_len << (bp - 1);
=20
-	if (*len > mtd->size)
-		*len =3D mtd->size;
+	if (*len > nor->params->size)
+		*len =3D nor->params->size;
=20
 	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
 		*ofs =3D 0;
 	else
-		*ofs =3D mtd->size - *len;
+		*ofs =3D nor->params->size - *len;
 }
=20
 /*
@@ -158,7 +157,6 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor,=
 loff_t ofs, u64 len,
  */
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	struct mtd_info *mtd =3D &nor->mtd;
 	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask =3D spi_nor_get_sr_bp_mask(nor);
@@ -183,7 +181,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t =
ofs, u64 len)
 		can_be_bottom =3D false;
=20
 	/* If anything above us is unlocked, we can't use 'top' protection */
-	if (!spi_nor_is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
+	if (!spi_nor_is_locked_sr(nor, ofs + len, nor->params->size - (ofs + len)=
,
 				  status_old))
 		can_be_top =3D false;
=20
@@ -195,11 +193,11 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_=
t ofs, u64 len)
=20
 	/* lock_len: length of region that should end up locked */
 	if (use_top)
-		lock_len =3D mtd->size - ofs;
+		lock_len =3D nor->params->size - ofs;
 	else
 		lock_len =3D ofs + len;
=20
-	if (lock_len =3D=3D mtd->size) {
+	if (lock_len =3D=3D nor->params->size) {
 		val =3D mask;
 	} else {
 		min_prot_len =3D spi_nor_get_min_prot_length_sr(nor);
@@ -248,7 +246,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t =
ofs, u64 len)
  */
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
-	struct mtd_info *mtd =3D &nor->mtd;
 	u64 min_prot_len;
 	int ret, status_old, status_new;
 	u8 mask =3D spi_nor_get_sr_bp_mask(nor);
@@ -273,7 +270,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_=
t ofs, u64 len)
 		can_be_top =3D false;
=20
 	/* If anything above us is locked, we can't use 'bottom' protection */
-	if (!spi_nor_is_unlocked_sr(nor, ofs + len, mtd->size - (ofs + len),
+	if (!spi_nor_is_unlocked_sr(nor, ofs + len, nor->params->size - (ofs + le=
n),
 				    status_old))
 		can_be_bottom =3D false;
=20
@@ -285,7 +282,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_=
t ofs, u64 len)
=20
 	/* lock_len: length of region that should remain locked */
 	if (use_top)
-		lock_len =3D mtd->size - (ofs + len);
+		lock_len =3D nor->params->size - (ofs + len);
 	else
 		lock_len =3D ofs;
=20
---snip---

-michael

--9999c2a3d1de4970bbc0b7b85935accf772f7e48f1c61a8f61f2cc29655e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaGJYGBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gfgwGA3Ko8TBN84GT/zYns53y2ZAuxtjg0ptNZ
GmZWRKNJXahheM2IZUVUORUE34lRLgxVAX0eEFSzUOnUp+YQfVV8cxDFk9MXk/As
Rkn8y0jh8T5RXQggbdvw6TV/uNQnzJ65tR0=
=V/h6
-----END PGP SIGNATURE-----

--9999c2a3d1de4970bbc0b7b85935accf772f7e48f1c61a8f61f2cc29655e--


--===============7465026611264170766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7465026611264170766==--

