Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78771C761AE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmenVrzCLOeANIrk31NAtmSgHhQppCxuOVZ2DEru4t0=; b=Gyd7kEkV6YurRL
	qaLqKw0+SEXjeOHdhNKxemAZJhzRs3vY997mIXHmAf763rnTiiYo7yrXFNdpDpYaFBTx3AsccC+lx
	8QghD/3nVQEQtYlrzs+6qhVlkn1b1ms9cO23tZRjtd/8Cg4zjBPlvtytg0NQuCthz1RPd/OqBHWPo
	w2YCVx5WcPEE6ysG4AhaJHMluyJJvlsCuZ3uqdr8JFvdTClXyIB0zjzfOisZymAwASVaun91BrIwb
	oRHXqt+aDPLUFXN+GR3sW3VG3yRnjlcXAjAzrJYUAuX1Jmmgv3FA26QgCI5pOyZc7QVIurVlO7B0t
	T8op7o4/M/iAcpVAyPpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqZ-0000000AIVb-3xOQ;
	Wed, 18 Jun 2025 13:28:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhf-0000000A5Sb-2K0Y
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GQ6sSa3qqRKNyhsxZmga10RJnCjtGjq37nBcPbQIfTQ=; b=XfGZPhomKTdP+jlfRbdOPGEXNN
	ycIeCysSMjqiEVKQnURzSNj70M3dIPYKtk+83xKKXorMzMomHneFaSJNopH9sN5UAnQb2dUf7xbnw
	ZJr2mB5iUC9eUkZDP6jdh4Be77YCJ2qffptlIz2nazuVS9ZfPJEc0pRLJc3+5CSzolk9IVAOHMkjh
	4WZXUd+K6Q2yJRKLgtOgCi6oKmrvoVDhxUiYjhQY8cjEkdsoDXE8Pf3Oetg1dmTBp2RT8OGxnqraj
	U1+nOuyb/0V71+Q98ce90xlB6dX+DkaZMDh2wLsH5o0z+IoLzJAOfMXz11cIRssE/1JXa6GIXESV6
	8cibcexA==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhb-000000041gC-0CE7
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CA3643860;
	Wed, 18 Jun 2025 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750248936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQ6sSa3qqRKNyhsxZmga10RJnCjtGjq37nBcPbQIfTQ=;
	b=mtqTnIpYfFXAOBrU3xmBw40hiHYyu9z2ligQjwfVEvrbaNetxhXy6+FoA2QFRXo49CvtyP
	zeWK78f95pvv3HbqrOTGI4EfUu4qcCkAWojlUcAKyTKa6Pos3lCDXRGuA+aRRu8VvV+Tlj
	3bfXMlhgS2dDiPmvfHLQPlKmSaCoFTFzOH9PB1z/zz4KjO25CHR5ebtClA4gFzX9DTBUq7
	a6kMVqrSpQAH8olv7btwJWErWWBIoYYuAC5yUYDSm+4Nec64QpnDUfFb+685SUvbjVL3bg
	e+FXi3/b4ilhORoSGHayNRRMFE6Rlhwz8JjO6bV9uaJEovto580rkMeFN1nZEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Jun 2025 14:14:19 +0200
Subject: [PATCH 2/8] spi: spi-mem: Take into account the actual maximum
 frequency
MIME-Version: 1.0
Message-Id: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-2-513202126013@bootlin.com>
References: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
In-Reply-To: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-0-513202126013@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yogesh S <yogeshs@ti.com>, Santhosh Kumar K <s-k6@ti.com>, 
 Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeihohhgvghshhhssehtihdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtp
 hhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuffvnfhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_131539_367295_FB3FF844 
X-CRM114-Status: GOOD (  15.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In order to pick the best variant, the duration of each typical
operation is derived and then compared. These durations are based on the
maximum capabilities of the chips, which are commonly the limiting
factors. However there are other possible limiting pieces, such as the
hardware layout, EMC considerations and in some cases, the SPI controller
itself.

We need to take this into account to further refine our variant choice,
so let's use the actual frequency that will be used for the operation
instead of the theoretical maximum.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c |  2 +-
 drivers/spi/spi-mem.c       | 18 ++++++++++++++----
 include/linux/spi/spi-mem.h |  2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 942a33b8d2ed9530f5fa9228fe298ec1653a795e..03b4b0cda815a2ecc456ea25e802c60e32ee2bae 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1298,7 +1298,7 @@ spinand_select_op_variant(struct spinand_device *spinand,
 
 			nbytes -= op.data.nbytes;
 
-			op_duration_ns += spi_mem_calc_op_duration(&op);
+			op_duration_ns += spi_mem_calc_op_duration(spinand->spimem, &op);
 		}
 
 		printk("%s [%d] variant %d duration: %lld)\n", __func__, __LINE__, i, op_duration_ns);
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index c42c227eb2a29ccd291bdced6b9d188c3b0bfb67..d3b7e857b3776e16310d3afc9acb7c315e3ea039 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -586,15 +586,25 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
  * accurate, all these combinations should be rated (eg. with a time estimate)
  * and the best pick should be taken based on these calculations.
  *
- * Returns a ns estimate for the time this op would take.
+ * Returns a ns estimate for the time this op would take, except if no
+ * frequency limit has been set, in this case we return the number of
+ * cycles nevertheless to allow callers to distinguish which operation
+ * would be the fastest at iso-frequency.
  */
-u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
+u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op)
 {
 	u64 ncycles = 0;
 	u64 ps_per_cycles, duration;
 
-	ps_per_cycles = 1000000000000ULL;
-	do_div(ps_per_cycles, op->max_freq);
+	spi_mem_adjust_op_freq(mem, op);
+
+	if (op->max_freq) {
+		ps_per_cycles = 1000000000000ULL;
+		do_div(ps_per_cycles, op->max_freq);
+	} else {
+		/* In this case, the unit is no longer a time unit */
+		ps_per_cycles = 1;
+	}
 
 	ncycles += ((op->cmd.nbytes * 8) / op->cmd.buswidth) / (op->cmd.dtr ? 2 : 1);
 	ncycles += ((op->addr.nbytes * 8) / op->addr.buswidth) / (op->addr.dtr ? 2 : 1);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index c4830dfaff3db5549c45bb7a9c4bf5110fa2e338..82390712794c5a4dcef1319c19d74b77b6e1e724 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -424,7 +424,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
-u64 spi_mem_calc_op_duration(struct spi_mem_op *op);
+u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);
 
 bool spi_mem_supports_op(struct spi_mem *mem,
 			 const struct spi_mem_op *op);

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
