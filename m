Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460D360A2604
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nfc3wjxH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J19tH02n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lgxdwTpg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FoyvWGwERdl7KgPDy3u+VyO+OqYTAJ5avx5aoJWsUOA=; b=Nfc3wjxH+XX2tcMTdI+f9CDFWz
	fq+HGylZK43EW64yYX8Ue95S0tQMR9GkDtvZbIqEuaV7hfHrzAopX+oUJa39V99oL8Pgjr7GC59iF
	ReQ/fVHqdYtuOPKCj+1kDSMuRj6aIctKxkiZaWdr5xPjFcpjX2UXNxKIoe9v3zVAvT9X6+7XQMakp
	r9h1ri/hhnRzZLecrKCzbcXzEpXjrZCjdWojzL4uwJpgOLj7XJIA8unjAFihTP+iwrntGmtV4Pgyv
	rs9JDJqjIhS027qJ7u91u0UZJYmXUTfhXIjdT8ExwcSBGqZkEPdrH8pXH3/BjOVz+YmtmqotmKjM0
	ceqpRJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTl-0000000ETMF-2Mfu;
	Sat, 07 Nov 2026 10:16:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTc-0000000ET22-46zn
	for linux-mtd@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=; b=J19tH02nkU1zSj7SpSmX3UR6qt
	KmOHIk6/Pqpr+RNqAB1Q8wfeXAAQflUOm6caPGceiZRshN7FZcK8o511SP8pInjfdGqqLZ2+0OjWd
	cSnvMOYa+UO2KgS21zd+fL2xjfekFwIt4mA/PcKiwHfWsmBr6P4DKxx+07540lJhNOVxwG6iCf785
	9Ioj/iW8a38z5O7MXnzHDlKfs9frYsnVERYjRyujZuhR14l//8X7rldI16cF+UvYEdC0fyjg9B6/I
	I5Z4FAGz4PSnDxWAnowp9wQHLGo3eVp901lCWHcNnUJADlNn7089I0CNoaSlYv0MEGeTU8RDPTvNl
	mGHs3kcA==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTY-000000057bD-2LTl
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:47 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-846566246e8so395264a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046602; x=1794651402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=lgxdwTpgd5z0PuvkyIHpK+edB4AspuU7l5gxAc4hlhVK43ATNj0W1W5x1dlBHdrOvo
         jO1L6eWqJij2/Nrx3lfLwVoaYB0gEEQS81qpY/vBXYeBUbQWiW5gq1qzPUCp30XGPoRi
         wE5JQCKeQShJmF0yVFcxIV/nA/Zi1sdeVzlAR6NgECCafoAEWMxdOh2mRaJ5TLhX7s7X
         y0n7BV4rGwafsUnMxUIT1YviA2TvnHLWnzkzAOAyCXMfZMx9Sdsxaaea5TRPgI+ZALiD
         xtVq6IBq42Rtt0YP+BhvD8JOUJ7SNdl4vEX6B7xQ0Pjc7MtMqH7CbvXFd0ciI0wOkNK2
         HqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046603; x=1794651403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=AatGlzw2zknbyefybMpir2O88hQZVLN1vOsAkifMCyJxd+jOdniFABTMhu08pEfFQb
         T004PfFhGsBindneePR4xjKWwl2oeBh3zgBkQKw4Lwcle/qrfh8zVrMClDss3t8eQ13u
         2myUKlFB0T6QhKV3AMkk4qwwitxqGe2VZH4UlZPk6640lO0cIhFTIFBnTFloAGKMmBYX
         4vR++8bJv3oJmC6HBtcoxMFcepvg/JQAUHEIlz0SxEWcf9yp1i0eGzzYyAeHoLmUhkqi
         vp5ydogC9vwbaEMzr7wcy8xVGYnbX2gbhZ8H4U0/91zsDpyrdwdDm7fC/BKRu7b9g3zD
         vzXw==
X-Forwarded-Encrypted: i=1; AKwUvBzPqZCsxGCqIYiYR4lQdPitLyLNyFK1C4NJDJny6i2FBwhyPNatuNRgp2FZ7TqcG7G3/Q8iHCXw8V8=@lists.infradead.org
X-Gm-Message-State: APuU4Z8CDnEVQIrhm89923kzN8DBko0US4+r8vfphRjll1d3ZmHOYx8j
	bfLHFpSkSJK3LzoGQe9bLvH8qZEPxAduHmRSAxYbrtV08c2n7PplonRu
X-Gm-Gg: AYBFou3+lsEChwmzxjmqGogmMQPBEEouX5vLOnFOQ+/5weFFKy1pWGmaJ5ArB9wJWZh
	LvuAaOoWenwPjFDohWn5LvrYrqfRcRf20qJWcYZwPv38lpGe9Pxn6wgE+z4IQ5kuvRibssCS1kl
	r3Ed2eOqpi5aX+wreQx3CCtoItzA6QJ5s+qVEmRACFczgaSlNQZ7ozFkHi6aPNOx3wb7E925luP
	o66HnTyHBd1ZvAmvGEhBpR6/XYlj5KxdhF++xW3WJemDLVg87douzCggtGysfGQVCo9ZDcfejHj
	sSkVH0NkJ3vGxV5aoNHK6eLygFXFCd2oWSv4ZrUqla+Tvz5A+h4vCZsLEchKkfKPl59C4MDMA6l
	d3QIVE5bQZY+l+xj+H09yH1iuhPeLBfvencdX+siZ+yqFVfboIujw+TPvJt+Rn5TipOkChQKdSx
	XjHwg3V6aQG1Qvb2UaBllaNvTBAIY9XY7vEsqBnxfwJJMrUCEsUtHg6rSm26QNDrU46Mc4pkBe3
	nsHdiMZgofGuMfRu280Diy7z6tj4zvF2IJTnw8PcyRFTIuYNZ63W6P0ZixdjVmKPU25232miqQG
	XKCLiejVnRH3Eq8JnWczvhAAagi7C4ue5qIzC1DaD4wHJUV11JM4tOtUTe8UV6Bepc/RlIPPlcd
	Aco2/5fZBd3yfpcoF9jL+32rycwL4WcId0WQ+6q91lI++dJ+3AD79u73ES4OdjHa+rxt+z770BX
	OXIAWmqHSB4TSaqkACChVwOMUCJOfn0AcXSy9R3Jiao2nAC/t+07BRpfO+IuIEHk2RU/gzQZo+R
	Q==
X-Received: by 2002:a05:6830:314f:b0:823:e626:277e with SMTP id 46e09a7af769-85f3419d333mr1085835a34.4.1794046602585;
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:03 -0700
Subject: [PATCH 06/58] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-6-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>, 
 Russell King <rmk+kernel@arm.linux.org.uk>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Mike Rapoport <rppt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Jason Roberts <jason.e.roberts@intel.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Mason Yang <masonccyang@mxic.com.tw>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_101644_551623_5BDEF71D 
X-CRM114-Status: GOOD (  17.33  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. A retained OTP
handle can therefore issue commands after controller disconnection, and
normal NAND I/O can also interfere with the temporary OTP mode.

Take the common NAND operation locks around the entire OTP transaction,
including restoring normal mode. This also rejects operations on a
disconnected chip and waits for suspended chips using the normal NAND
rules.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+int nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f7d2571e8d9..2667faf02a91 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static int nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..1ffe2fc4943e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +429,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
