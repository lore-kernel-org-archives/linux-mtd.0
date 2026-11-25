Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD16606A68F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lwtMoGdV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NoP6ICN+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rx8le6si
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nRkkOQc+2UQtTgDH5I41LEk4TY2qE/YBIDFIlmeX0Fk=; b=lwtMoGdV9ci46znMEDGwvcy1Jl
	93IEM0dwUHkcWcKeVtQs8dRZi0Jh4AdqoCj+JCC/rB7SOGYVlHg7fjIykdePbSZhHhiBD04QUnM5G
	rqU6AseI5KtVTgr6Ag49iEDmHYpl2jJHXMe3XRYo5P8GUjKGwTmxsivi2r6luoHzHF/QgB1vkRL85
	fOZKlstziFUKRWdI+BnmqNDiFaB8mFVc+lXjYrIbG3q2/1qSimPHNUEDnGRwPn1C3rMVnLgUcjkxY
	8ENnbePRpkbUjtNbKXaLB26XUzvDTrcbLfTOfXNxNi6x5BZ4OVgZ/WcD90F2DyFQQDNzRo9nUrGZ+
	2BzJ0w7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFsl-0000000AZ4g-030G;
	Wed, 25 Nov 2026 16:30:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrV-0000000AYTE-2N9Y
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 16:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=; b=NoP6ICN+Gj4F8TfT3WoDr4bcQ/
	SL2o3k/eM6a82SWlywvfSzBEdQ8vdwMZhQiWvalNwQ9InHo1nDw6fP8wIX1PnB0NXwDLpKU6kzHOE
	b/W55yxlH4P2nQ94jFIJmKeOjMgr+4atcemGGMaaYZWlSeAIZ0HHCcXJfBBAJDe2igMB7Kf7ifYIW
	T1H3B6WwjEr/0lHYAe+o1/LUQkhO5jv14fSJ5afhr7/wVjKPSuRdziCYKtKgQVzuSNw73TxRZNj69
	xiPH7j4l4WX8GZf01MiFMan0KNFo6/n3GbTzmxP2GrEZmvoPgnrY1zr+VGbFhJAvXZnbldOStTbx5
	sUJTtb6Q==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrP-00000005WtW-1Xio
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 16:28:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so34879435e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624121; x=1796228921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=;
        b=rx8le6siA91nditUUwOlnfvrgRb96EzAdSAV2HUBLDfK2AQmSS/xa1zQB0vxpxTE9s
         axm8jg7mKopI12qnAgnhiXG+RrO6fR9QpjwS2138r4KKu5pRzVX2DNZlDBYk3TG7Wgt6
         EuiurStdgs3xHGU7JltWvsLq8C6PPKDlFPAHwb3VGbI24m9IKDw5D34tT/QmnZjqRD1D
         2TAQF7wvf9BAiB6L5Tr94/rnEmaQZZJ2i9/xXoJb7I7wZPTO3rSBIbXYEsVfP0hpCmgN
         RAAex2O3vZf6fQ/p7rBHRkxlLl8kKO2LyXC/p7SUTYvvf6VVORnTXzunwo76cj2uhIdT
         Yzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624122; x=1796228922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=;
        b=kielsuOtKJpd1zzToEzIUOZbzAJBHNAXUc8N05OG/SkaniROMwSyk0ygEBgawV05JD
         MZVvlpc/Jc9nwx2ZR2+V8LX8a3BFSbhw3rb8r5GzJ5aO+hep8LZl631Rehp5mwcSOPhr
         MaimxguBwRWT/g8nmPq9sD6encEDCfet3EbWkHiWfSofiOXmupG3upHAWZ456Z3UG3Tg
         V0OGhYwBJ+NonWGQoQ4mDOvJHf8Zd83gNpiTUeYwGp1W+KkVcascgmkqYR3GGQCnzcqG
         sdkpWzy5yAQpxihPQQ5mZFqo9na+v7436iKNdBw69w6M0o1ehVHjkvFvWcEdiU0mYNkM
         h+gA==
X-Gm-Message-State: APuU4Z8MkHfNu7F3ye83OLuWTNeyRqlesOuh6HF4w6gZ7hk1tD6/ByVq
	Q0rm3PMlVekh8sKJbhkV9cP47gPlwZwWviOBkkjVs8oupcN60YH4QKwg1pUrcfvT4OQ=
X-Gm-Gg: AZFdTZc0s94msW0twLL8VXBkjZI0mwS60iU0BpjHQlwUub8C9+XrcEwcrhb2cHBrS/x
	ltt3O4805DoTehG65AuO22QVht+FaE57hud9Mdc69Z6+jTKTnpheb8g6eMpg9r0TVQ0KbQavL0k
	iTtPXMPdDFvAl731p5FsMn6dmn6u/ksmHwjjDJW0kp2GoA/HVPYi4DSD4CPUqRdsYuszaYVdZtB
	Z/iFZb3Qq5pln/y4zZKek4b3NwCx0Jqd2Xzj2/3a8UlDYQzo8ZU+fPq+TFhf0momqCvb5m2KUW5
	B+7iiLZrDJNvVHf3lk0dVP3shj/WK5DMIp913tdix0+jt+rqDs2XDcRx9fLX1elcugIKRHWXOfF
	W6j/5sRv7WKi0uQOJtDD/AHUB1bWbQld2onMkLw1XTAuZ/BQPSSWhDzHpIitg24UPJH7HHnkXGB
	hfeBDarpQFBINscup9gYFcH4wwVCORZjb54AOj4e7a+Q20SPkSeLCEBq14WRdt68XGdAByfFCOd
	YgJbAqHgkKecdy2WfJr40iF1mBFPsBQtfMmoEjPZj+4YPSbtrcPdRRD9yEO/oCMqEBfwhnNdPnb
	jJ9/H0RLspz1Qn4HdpwGaimI1lRvuEdQQCH/92z54aPL5w==
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr367205855e9.22.1795624121613;
        Wed, 25 Nov 2026 08:28:41 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:41 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:28 +0000
Subject: [PATCH 02/10] mtd: spi-nor: Use named initializers for
 spi_device_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-acpi-mtd-v1-2-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=4183;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=oSYQ7Bs6TY9Bq0it7ME4AMa1HN8RgNqdeSRr8O3thOM=;
 b=ZzYcsPDU1eT9Urm3wkVmXrHRSn8lYS47jYwodaBWVXhHbdUtk3xdzrjUw2pFBpCbVfZ0+gfNR
 dIrCrr0zs9uAk13TU8rgxCJLHxUgZjH9xPYqCVfddGmUaS8ISdiG+oY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162846_284093_699CFBBD 
X-CRM114-Status: GOOD (  17.88  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use a designated initializer for the spi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Put every list item on a new line and unify the list terminator to have
a single space between the brackets and no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/spi-nor/core.c | 77 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a04d22d2e2e1..a76c669000d8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3662,42 +3662,75 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	 * hack around the fact that the SPI core does not provide uevent
 	 * matching for .of_match_table
 	 */
-	{"spi-nor"},
+	{ .name = "spi-nor" },
 
 	/*
 	 * Entries not used in DTs that should be safe to drop after replacing
 	 * them with "spi-nor" in platform data.
 	 */
-	{"s25sl064a"},	{"w25x16"},	{"m25p10"},	{"m25px64"},
+	{ .name = "s25sl064a" },
+	{ .name = "w25x16" },
+	{ .name = "m25p10" },
+	{ .name = "m25px64" },
 
 	/*
 	 * Entries that were used in DTs without "jedec,spi-nor" fallback and
 	 * should be kept for backward compatibility.
 	 */
-	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
-	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
-	{"mx25l25635e"},{"mx66l51235l"},
-	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
-	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
-	{"s25fl064k"},
-	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
-	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
-	{"m25p64"},	{"m25p128"},
-	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
-	{"w25q80bl"},	{"w25q128"},	{"w25q256"},
+	{ .name = "at25df321a" },
+	{ .name = "at25df641" },
+	{ .name = "at26df081a" },
+	{ .name = "mx25l4005a" },
+	{ .name = "mx25l1606e" },
+	{ .name = "mx25l6405d" },
+	{ .name = "mx25l12805d" },
+	{ .name = "mx25l25635e" },
+	{ .name = "mx66l51235l" },
+	{ .name = "n25q064" },
+	{ .name = "n25q128a11" },
+	{ .name = "n25q128a13" },
+	{ .name = "n25q512a" },
+	{ .name = "s25fl256s1" },
+	{ .name = "s25fl512s" },
+	{ .name = "s25sl12801" },
+	{ .name = "s25fl008k" },
+	{ .name = "s25fl064k" },
+	{ .name = "sst25vf040b" },
+	{ .name = "sst25vf016b" },
+	{ .name = "sst25vf032b" },
+	{ .name = "sst25wf040" },
+	{ .name = "m25p40" },
+	{ .name = "m25p80" },
+	{ .name = "m25p16" },
+	{ .name = "m25p32" },
+	{ .name = "m25p64" },
+	{ .name = "m25p128" },
+	{ .name = "w25x80" },
+	{ .name = "w25x32" },
+	{ .name = "w25q32" },
+	{ .name = "w25q32dw" },
+	{ .name = "w25q80bl" },
+	{ .name = "w25q128" },
+	{ .name = "w25q256" },
 
 	/* Flashes that can't be detected using JEDEC */
-	{"m25p05-nonjedec"},	{"m25p10-nonjedec"},	{"m25p20-nonjedec"},
-	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
-	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
+	{ .name = "m25p05-nonjedec" },
+	{ .name = "m25p10-nonjedec" },
+	{ .name = "m25p20-nonjedec" },
+	{ .name = "m25p40-nonjedec" },
+	{ .name = "m25p80-nonjedec" },
+	{ .name = "m25p16-nonjedec" },
+	{ .name = "m25p32-nonjedec" },
+	{ .name = "m25p64-nonjedec" },
+	{ .name = "m25p128-nonjedec" },
 
 	/* Everspin MRAMs (non-JEDEC) */
-	{ "mr25h128" }, /* 128 Kib, 40 MHz */
-	{ "mr25h256" }, /* 256 Kib, 40 MHz */
-	{ "mr25h10" },  /*   1 Mib, 40 MHz */
-	{ "mr25h40" },  /*   4 Mib, 40 MHz */
+	{ .name = "mr25h128" }, /* 128 Kib, 40 MHz */
+	{ .name = "mr25h256" }, /* 256 Kib, 40 MHz */
+	{ .name = "mr25h10" },  /*   1 Mib, 40 MHz */
+	{ .name = "mr25h40" },  /*   4 Mib, 40 MHz */
 
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, spi_nor_dev_ids);
 
@@ -3707,7 +3740,7 @@ static const struct of_device_id spi_nor_of_table[] = {
 	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
 	 */
 	{ .compatible = "jedec,spi-nor" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spi_nor_of_table);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
