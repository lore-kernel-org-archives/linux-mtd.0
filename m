Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E88CC19F32
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 20:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+9A5OxJDE04aN9KS+mHNezsgPBrB4ICAiwMRe/fbA2I=; b=ySAz8gS80DAzu3
	VFnvrhfDLAj/4Gg/p6ak3lgMv8mKyEm10QUhrHvPUFj46SZz9Jg+/N/Yby5NslKCcsyLahpXvL9j+
	vLQU4bqvR9Xr2YuqjdATGFBZzp42i9ndkd6ioOw/hH9hvAT7GBG0qjr+nBkD2hsTse4/iQp6/YdqS
	YUNqw3deGMU1ov2BIUK/4lHzjv62e7bFYDWjFgS1kIh/f9c1PQE0+zrLqC1GDvixn+yKdJ55oMnrN
	wdY3ps8D9gwt8SjuF0W7GnK4mQ+Zk9jW872ZrXvvagQsS9ehEGFB6EvzKONk21DeX3lF5zAXsSHFi
	7PZ4nLXyWEMQgN4J38xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvQs-00000009EGh-1IeR;
	Wed, 05 Mar 2025 20:33:34 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpukp-000000097xQ-1kLn
	for linux-mtd@lists.infradead.org;
	Wed, 05 Mar 2025 19:50:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02999443C9;
	Wed,  5 Mar 2025 19:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741204203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vUDHRTpD/iZCnVjxFz/EHMCmU3ISO8WMJ+sqi7bT/U0=;
	b=iCgSvMunf7egiCOwnRclv9n5kr+yyOLt5OXn/YqguOe4djM7M9KfqRaz8eWK50Wv2+32MO
	e4oZ2zJfmA4a3MEWNnRLeLt/ynNxjZYUuvTPgIEmjsdpLgWDAtIaMmWt69cExWebKNCRNu
	eS2bvBPXPl/dlEQRl0A9XOyUxmz7Uj1yKjn7Lq16K7GgXeQKGBAQ8Jr5cBomP5iAsNAHHi
	LPd57NerOgwOjrG9pEizCrufSXwMaEMjWB40GXOz3LhkJF1y7gW1zzf5CV15VxZp8qSxDg
	MLijAI/lp+fJD60MzaoPF3104qZzHEmim2GluRvTRHLoAmgKlZQlaFjZZvRjew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: nand: Fix a kdoc comment
Date: Wed,  5 Mar 2025 20:49:55 +0100
Message-ID: <20250305194955.2508652-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetfeduleefjeffheevleeggfdtvdduhfdugeeuieejveejiedvhfdugfettdehnecukfhppeelvddrudekgedruddtkedrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrdeliedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigq
 dhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_115007_888406_5BF0EAAF 
X-CRM114-Status: UNSURE (   9.69  )
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

The max_bad_eraseblocks_per_lun member of nand_device obviously
describes a number of *maximum* number of bad eraseblocks per LUN.

Fix this obvious typo.

Fixes: 377e517b5fa5 ("mtd: nand: Add max_bad_eraseblocks_per_lun info to memorg")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0e2f228e8b4a..07486168d104 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -21,7 +21,7 @@ struct nand_device;
  * @oobsize: OOB area size
  * @pages_per_eraseblock: number of pages per eraseblock
  * @eraseblocks_per_lun: number of eraseblocks per LUN (Logical Unit Number)
- * @max_bad_eraseblocks_per_lun: maximum number of eraseblocks per LUN
+ * @max_bad_eraseblocks_per_lun: maximum number of bad eraseblocks per LUN
  * @planes_per_lun: number of planes per LUN
  * @luns_per_target: number of LUN per target (target is a synonym for die)
  * @ntargets: total number of targets exposed by the NAND device
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
