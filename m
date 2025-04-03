Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05142C3601B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDCWG+rSkIgRWGWtAvqFA4GsNKatw+3L934fN3o2mxw=; b=Lt59553Wa51fF0
	D2keIDmbS+/Jt6t/7kWJWVSmUJj3i/798eQXyYCRWweMqdoM/RXcDypnXA/QO2vfct6HQmgxP/O/3
	dCRqXiNyofixcC0hGJHdjjAaT/c6TN0LYROJqA3N+Sv1GDXJ2XJxE/z1u8KD0eTs6XZz78+yV2imO
	/vi28GvCHC52ah2DAEPP+BZ1tjIkZVjZkgMxTQniDRdoe/uYpfwwXwT+8ZoZ5zCJMfKinvSCOKWKr
	ipLr5IrlF/5SVbfOjyUS5lalpmn19Ef1AG2p7wJChz63DSCOZrMdtG6vjEKQDU93yqITxxyKYBp1M
	m/J9RJv929UxjbSioabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HXv-00000008VhA-0vsE;
	Thu, 03 Apr 2025 10:11:39 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Gjl-00000008Nq3-2k8I
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 09:19:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E186043226;
	Thu,  3 Apr 2025 09:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743671988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRvX3Vs7D+eXAuoSQ2XAv/OCH44SN3rQC84wbbF/K6E=;
	b=Qs7ZMHSfHvTdOdqFRHLx49lkX+gl8VUkchXOe4wlxVbr0ldsqpcTISUnmMyymP9kDDCw2i
	k8fvMSpSGT5cRw2BfNtckkyomv9xkgJFLHsDbzEGFMWaaUaz29okwNxV2HES3cTY5KMd3V
	jYNvU8Z2PifyxskYM1pYh3nGcuKzndqeAnxrbPdybTVtmGvgvUh4OJWbV74VxOTNjebBw2
	nc05pNvEP1FRPpSFCV+UU/cZO3IYw+GExgllAvlTlCkZi1Admypscrx3OVMd8ThUSuSg5D
	liXqkjk97sl6ITpy5xlrhux8V+/835wzcfRrfPH/2Y38I1u/g8FtLS12BZxNpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 03 Apr 2025 11:19:29 +0200
Subject: [PATCH v2 19/19] mtd: spinand: winbond: Add support for W35N02JW
 and W35N04JW chips
MIME-Version: 1.0
Message-Id: <20250403-winbond-6-14-rc1-octal-v2-19-7846bd88fe83@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgepudeknecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelledphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghru
 gesnhhougdrrghtpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehsqdhkieesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_021949_848602_4CA08543 
X-CRM114-Status: UNSURE (   9.46  )
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

These chips support single SPI, octal SPI and octal DDR SPI.

For now, only the SDR protocols are supported.

Tested with the W35N02JW variant, but the 04 one just has twice more
dies and is described in the same datasheet, so we can reasonably expect
that it will behave identically.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index c263c9b5affe79a14466bc0e2ef2da53ecfd48cf..19f8dd4a63707e6599068a43fd80dabcd9dd3a57 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -287,6 +287,24 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_octal_variants),
 		     0,
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
+	SPINAND_INFO("W35N02JW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 2, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
+					      &write_cache_octal_variants,
+					      &update_cache_octal_variants),
+		     0,
+		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
+	SPINAND_INFO("W35N04JW", /* 1.8V */
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 4, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_octal_variants,
+					      &write_cache_octal_variants,
+					      &update_cache_octal_variants),
+		     0,
+		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
 	/* 2G-bit densities */
 	SPINAND_INFO("W25M02GV", /* 2x1G-bit 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xab, 0x21),

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
