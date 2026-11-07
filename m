Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152E606A331
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 20:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G5c7Vah4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HprWCN3K94Wbtxz5mI4NBmRtY+oOQ1fK9OpAwbEYgqU=; b=G5c7Vah41tb010W3AHxpAM9CVQ
	UTDZ/bUUtsoli+0DGbdR4hq+LV3CwPXwWfUFCoKXwEz9WArgUoptiKoH0p4xwHlYbekM0S+pFgGt2
	LUcLs6cXDBFqTkLK0U6Q7y6x2XAUMpaOVcwcuiLDIHch4TWUS5Nyu6JNIBGlH44hVzKk4X4T2ygXt
	qv5zKLZaNZRrEMzJ4K6J8rLRqTirhfagpTZ5S6svnTTQ9hRmf8DHiSFN25gZC+2V6OZRbBR1pPcbm
	3IyvcVuWX/6oVXpwxBQxLDW+Pfu+pIp8+jVgYjvBslT2zG7hXKUyJ6/1uBOx4+AhOQI1xp4TjJqmp
	EZCo1K/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmoV-0000000FKdB-2UbL;
	Sat, 07 Nov 2026 20:14:59 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnw-0000000FJZm-24w4
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 20:14:29 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6f8a519e215so23171eaf.1
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 12:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082463; x=1794687263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=bjp0BakEK9ZsZ64vVhx0aKpFSUsIXCF5NlFSjrYPs54z3pGp0B4cuLhj/AwWWfKqrt
         wCfjm+0XPxb6hlQXQiyqnONIQg8sMdd6ApairHFG9xGVUMyUkjxD7dVGAcRsqH0usmwc
         +TWfpySIOfui3woNC4DHzy6Cf5lcFdyuZydl2J/UT9lY+9+KJ6JOtN2krrO8MnYcj8N9
         jCXlsIl0O5xGl5VoLnkeSjwscRYyyUIs3pER0fwOmib8zanmrYKoBEIr2VBPkksy1C1e
         LomAa9mU/f3Rit0z+dbONDYjxKbDjDb93XZiY9+KarZAXECrCmcZG8xsV5mHmTvQ6gL3
         ou1w==
X-Forwarded-Encrypted: i=1; AKwUvBzW4xKNr8lj/5sz6swsxtLneXEw35u5AE5B4QmT/Icn+YAnP+8pzJ/+C5gvaNCzffxosuHbsRcdStI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/YPMMcihO9numxNGdbAxovd8+BuZm6iJJDUpRm/6wfP/3YaWZW
	VAhG8/qbo61hi2uvtyg2pjh6vGm91G+jMHG/fOT1lgDX4d9QLvoYRn7ZXnruUBoNw3s=
X-Gm-Gg: AYBFou1KD0PYu0q5uhjKmWLyGxYckHC7NExp2NCfCGf2g+HjeZNBHsL09K1huJtuM+b
	wRIdRMOSUCS/Bj+1eXWT5vt40mlNKhyxbPIWuKDvm9gWn4qPFivbUM/KpzX0EXujpax8Fa9q8S1
	rs4H5lj9lODSBAZ2eCM4Cpb+de+ne8kY87WkcgwNUpg2FjQuzyY+ewAqVb0zMR/cFE6Z4LtOtoz
	BfDVCu24hCIUA7KrfgA0Dwzdelairkle+fkK8DH9UCnKmIQ5j3B8hGQaiHmLlG7r+SJ89BsPrQw
	gc+lWqc31FMxsrF01rYCwgmjB28lNIbBSLH0Vldvjic9joJ1xUpHIdB0WE5c3WT12dmF+rb/sUu
	7HbLCGesWGcHGqOJ/SRudgQr71xVMtvzQ41xO6R3QcxG/r69bC48j9PwuELZXx1pJYdp1bpYpUL
	JzmOZNKtPUAARlHIPF03jsEmvIjT7sIzFzG1UDBiyy8v5+aEi4+PD1X3U7yhMjuJw8eJif8mE8B
	Jr3aIC9tGkmAobVBqvl/cNHRsqqzmX/Y01uC6lmnCSLJMUKOEmV8fYXQua24k+sejrrv5T3XTa2
	z4gN0VTB6ZgTPdX9wq0cqya7KB2qlt1SJekLzNhl8uF1WbM2ZePP+hVHhkZM
X-Received: by 2002:a05:6820:4cca:b0:6df:ac2e:85ae with SMTP id 006d021491bc7-71700c8606emr1101384eaf.14.1794082463049;
        Sat, 07 Nov 2026 12:14:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:55 -0700
Subject: [PATCH 58/58] mtd: rawnand: diskonchip: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-58-0181ef0cc4c8@gmail.com>
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
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
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
X-CRM114-CacheID: sfid-20261107_121424_598001_5E2A36BD 
X-CRM114-Status: GOOD (  15.95  )
X-Spam-Score: 1.7 (+)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MTD device references may outlive unregistration during module removal.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..a4338b51b49d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1296,6 +1296,11 @@ static const struct nand_controller_ops doc2001plus_ops = {
 	.attach_chip = doc200x_attach_chip,
 };
 
+static void doc_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
 static int __init doc_probe(unsigned long physadr)
 {
 	struct nand_chip *nand = NULL;
@@ -1494,13 +1499,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_release(nand, doc_chip_release);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1548,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
