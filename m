Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33775606A680
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TzR0oUJn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TqF1ldy5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ElLnWqdI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W/+t7+2tnJL3B9Cz7Fn7LoViRL/JhC6X/sNvQ1qCs0E=; b=TzR0oUJnC0YbyhQX6Y04uggPVu
	jHIdA8YzokRLxkeaIJMQTPWS3+yiC0ia6nm6eEGrB09CB68L/PQP5FGwIC/2quw7DzOa8kod+azzM
	MiQk66pkm6n2u4c9wa4hRHU/6pYOE4nRtNQX1J6uqlBeHzKowrGUMA41tmW0DJGlZ70wITL6KEE6U
	HMEv+Ic/BdIQLyHXRHX2r+a7V2NhjyclObqGgndhhVSHSoWiGCjoKW2SqMECxuci1auui58deCWGK
	czKEmUo3CDd7qrg9+hAtx28VxhxG3CyUiqUWP1JGQ6FbFza5K0r61yU1VU+XxXBNt3ycN9c+f/rF4
	O48fOQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFsZ-0000000AYs3-3cnp;
	Wed, 25 Nov 2026 16:29:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrW-0000000AYTR-2wrJ
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Nov 2026 16:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=; b=TqF1ldy5WwyCB1h51VRngPIjmv
	2IUIqPfVwbOTO0JdCyIaZb4DaCUYAp4Zr1UGf5Shk/nyaaL9WFTKBD+NYvs0vSaqawPK6E34lnLlE
	dMYi8Cn4bUEe+/4cPZy8Ju/AfoAWAqejx/+JP7/POuEdxuPx36ToKj85PSh299mkMTEZYIj2qcE5K
	M883BBvjrJOLR0ALLhK2sFpqRykzzbgytJl/GsBxLQ4w1LtlmX7UICAdsFOBHot3k10eHbzUHeiPa
	sCqJzfa1HztByTmYZMk9D6oJ9+TiQvvrKtccYEFnkj0wnIuHgveM8U7qRxxYkoGhFgv/+La+6dd2K
	Om1A7ecw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrS-00000005WuX-0ety
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 16:28:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-497614c95f0so3429100f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624124; x=1796228924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=ElLnWqdI3yfwXg59dPULv5nFFtLg5KAuqy93cSw6Sed0XU/0kMYuF64Dwyw7I0rZYd
         43lOp2q0vbxcoWqSBMKTLAtpwCEr/6LP7wO7GF1+03GNBPVheQ4Qp5OQQ/xJmgQX5+ai
         Y4yr7lIMBpqAsIJDQWQpGogZnm7ktdGryCjWSIFr2qfBmvsEKIGE5iAUeUEgzxF3q0Vh
         PuF0eMp/y2gCWA1/ZZXplc/F3wGXC5fcwgfI6VQuvIEpopN/g55DY/2Ui+RjyD+6XhfF
         gbx8K3bMNEkBCHbzZNzwZRNrFK1BtvG/dl+IXW6kZMzpkDE+pSNxl3a6g5XMgBeNPcdI
         Yr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624124; x=1796228924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=ZDGt2ib82D5sgu86csNnC/wbBFTn4J6qI3+wtU3cBK7S36ngdDYdJFiC5iYXSIgHdL
         fMAl/Ro9+2RLFe5EXktm150NyUDOxVjcCZRTubLhhO/1bnH57IGLT2MYj0a3Nw7HXZ7r
         utXu53641CYgmJJenE+AQyeaBpPC4YRsb+JJZ/7ko/Zvsp8+z9rbSiNC9szfmJylquFg
         HPLCa9udFCxskPKB0PbQzEKklM4YJbufe5vIUHka3WtyIm2nMNbnmh37Osjr0xWH+f+4
         85ged6e7QTlLGSBFJ861jr8HOPRd9bR4/FKYrY4k+HeG0hu1/I5mbttPlfpX3u1FuTxN
         f/sw==
X-Gm-Message-State: APuU4Z8iPlBNs8UqJU4A+A4gYxKbvOA9RzmfAUtKPAk3Fp3aUQ+qQxmk
	oK1ldLWHyRcHhLjuk93G/bDWdHpJDzP/e+FsymovYgF+t1fsV9I9baAJkceEFTMizvs=
X-Gm-Gg: AZFdTZd9+MuxdgcCiWWhaAsWJnaC6HlcsLSLpO6kEHeVYKVzlTVtpf2QbtsnbtyIUKQ
	r5qUUkSXz73xzZl5Gi35rWDeiXXZwbS2LjkKUQj+E10gfkl39z3/dG8AkR6LdJgeQn5+EId9lZ0
	fcTqiuI3SvGD8vrM/IP8OFvS9QZNP6Eus6qZAipAvHy2LmiRpV9MjyJfczAdKWcChDwMHe4cbDY
	F5mCTWTKhoS3LHSs5Knlyd7t6RbFkDgKdlI6hfcvNAE2w+sbcqbkF4A0pSYIJFxCDZp1I2HB4g8
	zqwtu7ZBIXjI1lWvGVxg6yvPPYHIN5g4tM4mMRnLB3DL4vcziT80WsziSuZik2n3pAZl7SPJXg7
	LTDtrusR0u1KhnGEERQxtMkTtD7v+e3SL7zavVoyuQlmcchOHw+PCzFBddLjPLRswYmXpdTXl3c
	j5diZmd+Kzdm/fA7tZ2lqY8Rm+k0vLfObZOUC8jobaA1Sr8UYqCEqWONrO817Qv3CgyIyAzZoZA
	s91g+MJRKBXk6Pjae9MP364Qncx0W3gJmy6vuQzP1BH2v+zHg3g2WCzEApMsoS2wLgDm1AdclHj
	fQXjEbTSKSi/kjUSF8jEhsQESruwgNiXjjbXvSJTVWKzqQ==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr361648545e9.16.1795624123960;
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:29 +0000
Subject: [PATCH 03/10] mtd: maps: int0800: Use named initializers for
 acpi_device_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-acpi-mtd-v1-3-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=833;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=blggJzzi34PPFng5frzDjV1f6bR0P7BZrevZFLsW314=;
 b=ZHZnM3Lf8DzUboiERoH/ypcNIiAQvRVlt4l5CMlhz7vJ+CymRE50z5L8UPm9qLmBzcXPpEYvV
 3V+SKJgc8HhAzjwEkWT9COXnLzIMM7NmIiKpGWF+rOcWTSAb6lbGtOg
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162847_916313_95A5BD26 
X-CRM114-Status: GOOD (  17.19  )
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

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/int0800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
index 1f5a7c4936dd..feb721908989 100644
--- a/drivers/mtd/maps/int0800.c
+++ b/drivers/mtd/maps/int0800.c
@@ -88,7 +88,7 @@ static void int0800_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int0800_ids[] = {
-	{ "INT0800", 0 },
+	{ .id = "INT0800" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, int0800_ids);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
