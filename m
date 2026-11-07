Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D838A6082BCD
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x1aspYwJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/4IdBOw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zhmr+ciV/L+XfZ8E0ES8PbbBO8JolvVUOBdTiJitRXQ=; b=x1aspYwJsb2GxFzSadB2P5CTAX
	uJ0zFxlxF50atK8KNRPYyb9e7xMOBBDkIiaMBXk6sxlHlWn+nBIILADVNRzrhjjBjLVMYkGAkwIOH
	X5Z72u6H7oCN24tnk13S064qY/4z650+9P1zTWnBOU6niaMre/bSqA+hUgPc2xjkEjFby/udfgP8T
	f5hdFnqBvDdjQsmSFSCcFIyeTQnZCU01CFGX231qVZuiiBicPSlTUwBX1A/Ig6wQ0XyJrbQV9oifE
	V8TIHkUKazcZYR2ogyG09ukeNR4jbuenzuY3LVCWttpFZjUBjg+89FHlp/Q+Z/kRgjTgnH3P0PX1N
	Wj4LIKdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTY-0000000ESth-0SVQ;
	Sat, 07 Nov 2026 10:16:44 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTI-0000000ESay-2PSo
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:36 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-82109f51565so590236a34.2
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046587; x=1794651387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
        b=x/4IdBOwOZFUgtoFLBB6+JQOVKr5eiGYaMt/A2iMzvzbBVjTIWHqRevouCNYTe0sMW
         iJZqFRGVMKlVZcVCut1dJJmiNsY49AJGeOeyPi+Ufs+E1P1GnE+pM/f9ShBaqgK2J/s4
         yedGwaZ6Qy2siuXl6eTXG5hrnxMVdF53wMAWh5JqjH2AcY5MJOrUe/UI4F2PNbqVJWTQ
         2nRP5fFlHOtlh8hnsvu1X1DhGGjJg0e7YFCr3vn6BINbjoel2196bEdNwOAsd65EZVLk
         aLUr5JRTWM6UxZTfSuRD9NdHmXsgxN/x6kFmVGg9JSoeMUKn7bkhmxljp3p3hRt2cV3z
         EPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046587; x=1794651387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
        b=ueulKMJQTUAlsy0dJY7w4INLF3sXhe+/xGIlyrqmnyvVpUxfENbVVtVu1OAnzEv8e+
         DdUoIEW0UAlrr5C2k8pwFqV1KQkFksAJ08tcPo0fRnfcy/TNdfXhjrLxZIw9LET+r0OR
         qhkLl+GQLCegagJEidJEFf1dvvvzBUjQzPO+7648UyfeZbuBlwuLJhltsDRKQjRLGs7W
         frRXBORA7ieYkRTAsa+fzBVN75VqyzW+hVbDA4sPr1Cj0OfxR/ykx9EwmDGI3AdxgHpb
         CUg/vcrKOS7OwjQylDXKxihO585gh7WtFmkFBvGKXjOQkS3UX2ZE6yvS9PAFQbUFB+wi
         447w==
X-Forwarded-Encrypted: i=1; AKwUvBz7PaqUn+BeHm1XcixL4+GAJeQHT+BzoIduD3d4KNMzoecQdUi7LRyzXAOr2pSMwuzeAuf4WZOFRPo=@lists.infradead.org
X-Gm-Message-State: APuU4Z85tSGwVJnKHH3BTI/5xhAxnW5rco78EZgpqftyBLsTZP/Waohd
	a6E62rLXp9aEjFPvFSdYbodguEQIUNuhTkqf3kewvz7xMffhL7wJs6YM
X-Gm-Gg: AYBFou0nDStMlz0FYJ3P9+k876TGDnZmNQlq8LR8HgUXVMjc2adQkSP9lMZvR/qDR36
	zCB++o7NxYse/gEbn5W5WERsej5MUuwMSW7X+NIt9OWwuuwZeCZkkPkjBGUbJz7E92RWmWkiB0a
	2hNjTtvJ0c2sv+ISHc5eViGC1qFdh0zc1viBqtbMi8C8Ht4F2Fjy3gkUUTdENrB2e6R8DzvFUWP
	JukEOexNlD/RjywAgGQMaPbKBBcsAiXFpxeOCvpKxPXgix09Z1O7s0lgHEMgYIAf8Ino81PzHpH
	YWLUQ3bXqjajLYRWZf5rcaoytcfeVt4rUOLA6CGS1CFRP9cnZ7SOxOqkLI5yx/LeZHUBZWZ60qd
	4gvhdtGsgiUQ4djRrgZGGeLoIHcHY8S8kf4uE+1xyw6kg/68Oe3RDz2lmEfpjOJ0HKmtcT0Gz61
	pQYzeO2Wj+7YU7GHXLMSrxGp6VWCY0+z805V5pDGFE9J/cZVHi3RzC320/5DIIukJ5HlqX9LuGa
	5sy1/NHj9+gLzqt0yoTlsYaWTrvg03VEIqMJPUMF1t/FZ/n+L2aV8tdh7B5qGtopmO8TEvL/ZD2
	qr/QzKOfvIWSMW7YF2PdlwTlK9J7I8tgkwlpyVGBX6N3nfU6uffhJc1J2JXoYaxc+FqcBbczK6V
	LvlHhMVikZQcCRShhxiIJV7yoKfg7rvFhjrfczs0LJiGZ0Jur6+6O4CT0404qeBrWAzHtWc9uQL
	/FqinfdyCMXhugJ++IrgNb2uR7VAsYjjMurc4Bu1716Yls16aBKYOI
X-Received: by 2002:a05:6830:4101:b0:844:4959:e856 with SMTP id 46e09a7af769-85f1cf2dfcbmr4924112a34.11.1794046587358;
        Sat, 07 Nov 2026 02:16:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:15:58 -0700
Subject: [PATCH 01/58] mtd: clear OTP provider pointers after unregistering
 them
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-1-0181ef0cc4c8@gmail.com>
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
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_021631_925580_5BBF4E5A 
X-CRM114-Status: GOOD (  14.78  )
X-Spam-Score: -1.9 (-)
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

If factory OTP discovery or registration fails after user OTP was
registered, mtd_otp_nvmem_add() unregisters the user provider but leaves
its pointer set. mtd_device_parse_register() then unregisters it again
while unwinding the error, accessing a freed provider or dropping a
reference still owned by a consumer.

The same stale pointer survives when the factory OTP error is
-EOPNOTSUPP, which mtd_otp_nvmem_add() treats as success. In that case
mtd_device_unregister() can release the provider a second time later.

Centralize removal of the OTP providers and clear each pointer after
unregistering it so subsequent cleanup cannot repeat the put.

Fixes: e0489f6e221f ("mtd: core: fix error path for nvmem provider")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8efa2d88556e..558a605ba749 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1016,6 +1016,14 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 	return retlen == bytes ? 0 : -EIO;
 }
 
+static void mtd_otp_nvmem_remove(struct mtd_info *mtd)
+{
+	nvmem_unregister(mtd->otp_user_nvmem);
+	mtd->otp_user_nvmem = NULL;
+	nvmem_unregister(mtd->otp_factory_nvmem);
+	mtd->otp_factory_nvmem = NULL;
+}
+
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 {
 	struct device *dev = mtd->dev.parent;
@@ -1082,7 +1090,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 	return 0;
 
 err:
-	nvmem_unregister(mtd->otp_user_nvmem);
+	mtd_otp_nvmem_remove(mtd);
 	/* Don't report error if OTP is not supported. */
 	if (err == -EOPNOTSUPP)
 		return 0;
@@ -1180,10 +1188,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 
 out:
-	if (ret) {
-		nvmem_unregister(mtd->otp_user_nvmem);
-		nvmem_unregister(mtd->otp_factory_nvmem);
-	}
+	if (ret)
+		mtd_otp_nvmem_remove(mtd);
 
 	if (ret && device_is_registered(&mtd->dev)) {
 		err = del_mtd_device(mtd);
@@ -1210,8 +1216,7 @@ int mtd_device_unregister(struct mtd_info *master)
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
 	}
 
-	nvmem_unregister(master->otp_user_nvmem);
-	nvmem_unregister(master->otp_factory_nvmem);
+	mtd_otp_nvmem_remove(master);
 
 	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
 		err = mtd_virt_concat_destroy(master);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
