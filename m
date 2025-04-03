Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22C8C3601B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpQC4GZfQm9HGWDcsFH25YsimpL89khrmwKp6AdphFs=; b=npdU00FmO307P4
	CEviSyKQaaQFJzbQi3Y5xeN0ZdrZOOy6r2LjQMG7mO1JZJmaKWfVNZqjbNCJVMJE2KgIOLmjWXHdu
	GlBqjiUf8ehgGKOWjczWyU5GRrbX/hYEvPMOvYJXT8NNRncc9ub4nmmf/i6Fnz/wuEDQylbaK8qqq
	W1j3irbLcLtYEYw1zbpkWpjnWCa+7mDUDS75yziM6D36nbilHB+jNr1/eqEcAJ5MShSCSoH2WRFLh
	do5Bbx7qNbIjLJPLJ4YWXtHuNivCMvM0BUECS3tvksN+5Wa03MDMfe8XtrbRkbZxCcZ1Ra3zVVyMR
	f7WL4MAbFThPkab8fhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HXr-00000008Vbk-0kf1;
	Thu, 03 Apr 2025 10:11:35 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gjk-00000008NpV-0Ldd
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 09:19:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 841DB43201;
	Thu,  3 Apr 2025 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhfSbIOk+2FngR/3ff22zpNoh154/LrttDSggOhVijk=;
	b=buMi0j8anP0+dj9WPLMY1iEBueo9Y0sglS4c6Pfs1X5RJa9hn0fdjJzHmePLqQHz/tsxCp
	5+zblQK0sttrX9VRw+WnwVx2u7oLeI1RZ8oC8EoNZmNF622APojkXesC/fu6QVeYrFeMxP
	rdnEG646G9qjY9wGd6VrzDEctO8sESfA8kelLET9Pye7RZZg4xNQ2gC2TcUByZQxV2hBaO
	WNG5bJop5avYLWs9BwwTQ8xRnlpJbK3ynstT9aqy7vdjGIAxANsXU99FWrG2Dpu1e564Ol
	WVmldwp8ygwG1DJZzGEQ2r996awBO47IPfvg9Mx9ft9qfu75oKoMuTwcPdjwrw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:28 +0200
Subject: [PATCH v2 18/19] mtd: spinand: winbond: Add octal support
MIME-Version: 1.0
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-18-7846bd88fe83@bootlin.com>
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
In-Reply-To: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelledphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghru
 gesnhhougdrrghtpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehsqdhkieesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_021948_258597_E9A36CE1 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

Describe the octal "read from cache" (1S_1S_8S, 1S_8S_8S and
1S_1D_8D_OP) and "program load" (1S_1S_8S and 1S_8S_8S) operations
supported by the W35N01JW chip.

There is no observable improvement between the two octal SDR modes,
which anyway offered a great read speed improvement compared to single
mode.

flash_speed test results ran on the TI AM62A7 LP SK using a 25MHz SPI bus:

* Single mode:
eraseblock  read speed is  2346 KiB/s
page        read speed is  2342 KiB/s
eraseblock write speed is  2028 KiB/s
page       write speed is  2028 KiB/s

* Octal modes:
eraseblock  read speed is 10801 KiB/s
page        read speed is 10711 KiB/s
eraseblock write speed is  7335 KiB/s
page       write speed is  7293 KiB/s

However, testing on the cadence qspi controller driver did not allow
mixed modes (where SDR and DTR cycles are mixed in the same operation),
thus 1S-1D-8D mode could not be tested and is provided for reference (it
is anyway skipped on platforms not supporting this). It did not allow
easy "update cache" tests either, so these macros are untested and given
as-is.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 9b0369a077efadac8bd6be632f15b822d42a7227..c263c9b5affe79a14466bc0e2ef2da53ecfd48cf 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -24,13 +24,19 @@
  */
 
 static SPINAND_OP_VARIANTS(read_cache_octal_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 2, NULL, 0, 105 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 16, NULL, 0, 86 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_8S_OP(0, 1, NULL, 0, 133 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_octal_variants,
+		SPINAND_PROG_LOAD_1S_8S_8S_OP(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD_1S_1S_8S_OP(0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_octal_variants,
+		SPINAND_PROG_LOAD_1S_8S_8S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
