Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7D6083632
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qIZCD5t+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d/Vit/cv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TW7tcnSmo3oZxToUUxQHGlXOOCjMuQHstA2d9Gsgi5I=; b=qIZCD5t+wWz59ZmdkHYv0yVzTT
	m/F9bY4a5NkvZ84Ob+wVPgyYe9hRrY7KoKYqaDKxYVVQDSmCBMhhN7xnc07bjuYc6jwVcMnu+OQ8P
	OujSop41lODlqj2maxxESLqGCN+qtD42XlswIO/13VGW0h4vITtJtPyv0/P80mIOhpoL+l/m5+x94
	bnw7qF4ActqiEFNF+BhdwfeVWInz6HhsZaf7p9aCa7LAwNBXAhPh+/pr/3YZZMeyFRad7JIu8tpJp
	hw4/luzqV/tFWU8/tFQhs0Y2aka/7eU3u58BZq+9FzrNftyy8EkO+tgm12WeF4QJ/nZOP8xrdDxaG
	6CJ3v9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTk-0000000ETJE-1OA9;
	Sat, 07 Nov 2026 10:16:56 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTU-0000000ESom-2rxa
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 10:16:47 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-82109f51565so590295a34.2
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 02:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046600; x=1794651400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=;
        b=d/Vit/cv6f2wZmco2jo2Ob17WUhf4txOlRBkvrnkvTgqJfuh69X8o3K6+cOXgLG2Lp
         yCYvStspsNLdFZRQz0Rka1ShzA5XNMHwxZn1w7XO/EpxWCMxRqchZgKQ2+EvFrP7B0lW
         2eeuKpx8SnNGT0XoOqEmfX0jOmpdUl4+JVCCDXHDu2/ASgdA02O+SKT40p82E1cBFqhc
         hWcEhR6BzbvIMkAG5tWphSbcMERpK4yw4D2WQlVXqejWn2GNpBBblXufEcKNsstHPEAy
         FYoz3EDw6svDIt+KagoW53sp6D6hAHNDqOxtKRMEGqT42wmwJCW+hP1b0IslbL5YTCsV
         y+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046600; x=1794651400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU1HVMt6F+8GX+5+y1BQ6f55b/pZazHVnomyKtjqHX4=;
        b=LEOPNCtNdFunVFIi3a4Jk4xQ/pC2Qwrc3VxVdfik1bgu9ZuA7WpvcPBJAa9wB173Dd
         RkUtaa44bQ5l76cSJz7qN1s+7BLggi7DOCDd/0T+NjtBkozE/9+TQ8e1eyJGnLHzxu1L
         us96VHOd4D0NVCCukVNOBplYNiAKawR9QyJvO3eZddKWXr0OMdfcEs9GyR+tvQwbUe/e
         9/I7cAZI4ZMK9Xfw2jo93DLrzxCriA/N2QxRkOKskqSvwId+ds3w+MLNaty+4/rTkqcF
         9OUQz3JAekgl9RXNG2zFizGFU90/GZE3+qCPzL8pCIcXb+k9NXdGdNocad1IASb6Loqw
         GbZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUims6CJtUIjZXpj9d+UG7BftptUIYWJUSIvMg8eRgfVwnsMUgtXpT9zTOhJxIlTtKRQg+bzp2ub8=@lists.infradead.org
X-Gm-Message-State: APuU4Z97ssC7U+EBaGSWS3Ll4B+USIimuBkOxzjoXoZ6Y399H5pCbQrk
	PVYqsQbVH8zL7kehRSZ9QiJBpOdp9krPluxpQaBEWg6txrg9z+AG7ou1
X-Gm-Gg: AYBFou0SWLRa8Ugsnqx+QmKXd7EnMC+ePVC1GK1re31zDNiAhck3BF79l0Jb1P7EvCa
	pfC29wYEuAMG1kU5QAKAH+k6vZNOEFtUEj5d5Yl5k4wesFSSOL2yr7FYKiA49WgH4AZgI9czk0d
	1Y7FaJqlyPyoIRylrgrzY5qML/1jmMq/0adm9IMR77vNnxDG8A+D8beDg5Fphb8rliFJoeJBX/3
	nR/OsK02MiGYVBFTZ4DLkJZ/UyQGGhFQ82mf5yjUx42SS3AK9d7vhPW8aNgEpFzwsGiXgXoSTSU
	T31wl46JKGM+R3wl8JSUZsWPPb35ekHfQ7+3/ru1n72x5Hf3QYJJTWWPJFwLLCSg8us4D7DRsRh
	4Y6Rc9ZWhyEvkPnbF4sLF6dBij0Mxui2XS8FYCuKY4mUqW0+GAS4Yoi3/v1J0iGdVzp7UAW6DXn
	cx+bzr6I5/SmfgndxNXe1CNBzSmaNpjaDTU3AVttJaYBNGHSWqfjkOvTeYnJTz6EMBJO2fgt9Zc
	R/WqZYGkGs0Ke1NjEmJKmH6ojvCvWE/PMK0BmjA+HgShft5XR8kqOl2YM5YAFZzi6UdmTSTGeEj
	u+lyc5yCVHSgoIQljpchRpCiS4DJcqRnd3x/zpwPOLeljfl82cDSRcfzLfo/S5vckDahR2w3a+O
	d/vhYPKIGG2qlax74VJ80eayNAWr9dObdB8x2HtrKnuBWNsQcD+dtw/l2Mra0p9b+P1m0ihMY1f
	Vw3bg6I+0NakR7a7Fx/Joc6gYPZUkOlakJg/bE5dJAu/96jZMuvAu3
X-Received: by 2002:a05:6830:438f:b0:821:94d2:83cd with SMTP id 46e09a7af769-85f1cee4f2cmr4595254a34.9.1794046599688;
        Sat, 07 Nov 2026 02:16:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:02 -0700
Subject: [PATCH 05/58] mtd: rawnand: share retained chip and controller
 ownership
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-5-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_021640_883189_9831744B 
X-CRM114-Status: GOOD (  23.82  )
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

Controller drivers need to keep chip metadata and serialization locks
alive after unregistering MTD, without retaining their hardware
resources. Share the name, firmware-node and parent-device references,
the final NAND cleanup, and the disconnected-device open check.

Provide reference-counted controller storage with an initial
device-managed reference. Register that reference before managed
hardware resources so their teardown finishes before the controller can
be freed. Each retained chip pins the controller independently, allowing
multi-chip controllers and embedded chip structures to use the same
lifetime rules.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/Makefile        |   1 +
 drivers/mtd/nand/raw/nand_lifetime.c | 118 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  12 ++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 619760138d32..7ea275a40fcd 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
 obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_lifetime.o
 nand-objs += nand_onfi.o
 nand-objs += nand_jedec.o
 nand-objs += nand_amd.o
diff --git a/drivers/mtd/nand/raw/nand_lifetime.c b/drivers/mtd/nand/raw/nand_lifetime.c
new file mode 100644
index 000000000000..9518c9a4bc63
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_lifetime.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Storage lifetime for disconnected NAND controllers and chips. */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
+
+static void nand_controller_release(struct kref *ref)
+{
+	struct nand_controller *controller;
+
+	controller = container_of(ref, struct nand_controller, refcnt);
+	controller->release(controller);
+}
+
+static void nand_controller_put(void *data)
+{
+	struct nand_controller *controller = data;
+
+	kref_put(&controller->refcnt, nand_controller_release);
+}
+
+/**
+ * devm_nand_controller_init - initialize reference-counted controller storage
+ * @dev: controller device
+ * @controller: controller embedded in driver-owned, non-devm storage
+ * @release: callback freeing that storage, without accessing hardware
+ *
+ * Call before acquiring managed hardware resources. Device teardown drops its
+ * storage reference after releasing those resources. Chips prepared with
+ * nand_set_release() hold additional references until their final MTD put.
+ *
+ * Takes ownership of the storage even on failure.
+ * Return: zero on success or a negative error code.
+ */
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller))
+{
+	nand_controller_init(controller);
+	kref_init(&controller->refcnt);
+	controller->release = release;
+
+	return devm_add_action_or_reset(dev, nand_controller_put, controller);
+}
+EXPORT_SYMBOL_GPL(devm_nand_controller_init);
+
+static int nand_mtd_get_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd_get_master(mtd));
+
+	guard(mutex)(&chip->lock);
+	return chip->disconnected ? -ENODEV : 0;
+}
+
+static void nand_mtd_release(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_controller *controller = chip->controller;
+	struct device *parent = mtd->dev.parent;
+	struct device_node *np = nand_get_flash_node(chip);
+	const char *name = mtd->name;
+
+	if (!controller->release)
+		controller = NULL;
+	nand_cleanup(chip);
+	of_node_put(np);
+	kfree(name);
+	if (chip->release)
+		chip->release(chip);
+	if (controller)
+		nand_controller_put(controller);
+	put_device(parent);
+}
+
+/**
+ * nand_set_release - retain a scanned chip until its final MTD reference
+ * @chip: successfully scanned, unpublished NAND chip
+ * @release: callback freeing chip storage, or NULL for a controller-embedded chip
+ *
+ * Copies the MTD name and pins the parent device, flash node and, when managed
+ * with devm_nand_controller_init(), controller storage. The original name stays
+ * owned by its original allocator. The caller must set the name or parent before
+ * calling this function, and preserve any other metadata used by MTD callbacks.
+ *
+ * After success, unregister MTD, call nand_disconnect(), and drop the driver's
+ * initial reference with mtd_put_master(). Do the same disconnect/put on MTD
+ * registration failure. nand_cleanup() runs at final release, so controller
+ * detach callbacks must not depend on resources released during removal.
+ *
+ * Return: zero on success or -ENOMEM, leaving ownership unchanged on failure.
+ */
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip))
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const char *name = mtd->name;
+	char *copy;
+
+	if (!name)
+		name = dev_name(mtd->dev.parent);
+	copy = kstrdup(name, GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	mtd->name = copy;
+	mtd->_get_device = nand_mtd_get_device;
+	get_device(mtd->dev.parent);
+	of_node_get(nand_get_flash_node(chip));
+	if (chip->controller->release)
+		kref_get(&chip->controller->refcnt);
+	chip->release = release;
+	mtd_set_release(mtd, nand_mtd_release);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_set_release);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90b2169cc745..313e0d88e19a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
+#include <linux/kref.h>
 
 struct nand_chip;
 struct gpio_desc;
@@ -1116,6 +1117,8 @@ struct nand_controller_ops {
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
  * @controller_wp:	the controller is in charge of handling the WP pin.
+ * @refcnt:		controller storage references for managed lifetimes
+ * @release:		free controller storage after the last chip is released
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1125,6 +1128,8 @@ struct nand_controller {
 		unsigned int cont_read: 1;
 	} supported_op;
 	bool controller_wp;
+	struct kref refcnt;
+	void (*release)(struct nand_controller *controller);
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
@@ -1132,6 +1137,9 @@ static inline void nand_controller_init(struct nand_controller *nfc)
 	mutex_init(&nfc->lock);
 }
 
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller));
+
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
@@ -1285,6 +1293,7 @@ struct nand_secure_region {
  *              independent devices
  * @ecc: The ECC controller structure
  * @priv: Chip private data
+ * @release: Free chip storage after the last MTD reference is dropped
  */
 struct nand_chip {
 	struct nand_device base;
@@ -1345,6 +1354,7 @@ struct nand_chip {
 	struct nand_controller *controller;
 	struct nand_ecc_ctrl ecc;
 	void *priv;
+	void (*release)(struct nand_chip *chip);
 };
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
@@ -1598,6 +1608,8 @@ void nand_wait_ready(struct nand_chip *chip);
  */
 void nand_cleanup(struct nand_chip *chip);
 void nand_disconnect(struct nand_chip *chip);
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip));
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
