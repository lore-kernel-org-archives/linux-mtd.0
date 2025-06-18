Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648C1C71157
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRwfWozmD7Mab7UN/i9CSrevlSnwVRGbq1jMcgomNx4=; b=CpkuLMHIZ7O8GW
	wv77oMvS0bdjZqCm6X/3djXkBm4OMJkUYny09vTcSa/H+FlJG9EVS42tvry9fGcQyM6q4T6SaMQvW
	b5Tqo2lkCNszf3klLi+poFKV98gNR1xEIILI17AmJBWNumtkGD4NYLmWzzrAvXt5gXklvgRqkBtwL
	IxizDkXMasRI3neRjWigPDpAi7SBYZhWDQzveps2oPD7/oFpoK8Ge719GNF8kkXfaMYp8ztFT7vFu
	j1MAoI5XaJcBUYkv9xHeSKSKUhIzwPZU2h0S7qUWUNnoM7sxyVH9YKitqrG/szhd+H2OnZ8iPUiz/
	jmt6tU9QO0eYpvf+ku2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqb-0000000AIXl-3DeR;
	Wed, 18 Jun 2025 13:29:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhg-0000000A5TF-1omS
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VpqVsihgUGFbmg/hmgcVGoJJCF38QwAQyQZG7jtDhrg=; b=nFt8RYAO2EHZmBWj640JDUCE3w
	bhSwNC6n+49ScU1JBJgXnu/ABMD9uof46Imd35U3unk8MSPvUiAeWpfcIk134UModcerCRcghdllt
	lDPdW4Kn3NVC+XfNTiFqFXu1tK1d+IZhLMB5iTzC8pErF9MB3EMBT5MMCdkWiRkLGYEsjcgK67hJ6
	VAkT56uXsfaYlHivMmoSqt4nVeKLWLt6PnRG2bEY1UUTwY/r3uIfaSfPyRxQH3jwzKe1HVBXkGNTJ
	XlKYSPBrXW8hOXFA+sJ7NZINdo8rYcBAUca77do2/87q3UDtP0GEytSixWVeByr+dmoKAKt1jlWsf
	opfRTUCg==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhd-000000041hy-2iz4
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A72BB43866;
	Wed, 18 Jun 2025 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750248940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VpqVsihgUGFbmg/hmgcVGoJJCF38QwAQyQZG7jtDhrg=;
	b=GItI00vhOdLfKVMxPXyKhRLG+HHH5bUkItatVK7RltifN05JjlyLvIrWtdftBcC7wE89PB
	RyWZpPt10BFJikhu/vffaB4GNN84spATMmSeYBRQSUGyrFjhCixUyfb91mitXGmMUMM1mZ
	gzTRU8uLY55CzYNkOu6eloPFSmcoSF6entzwhg62kXzkbLQpnISMrmpucGir3ZX2QPOYqT
	SqIT8nvhr/tIzOA36Ou7V07lnRXT+E9uHGVAZ3DNNxCIbUV2Mt/DgM3/1IjPsJpeAv91oP
	f0ftSLTxv6LqVC9mragO/a10CKBG9NWvz3chti80QEXo+SL0EgT6bOhEv3qRkw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Jun 2025 14:14:25 +0200
Subject: [PATCH 8/8] mtd: spinand: winbond: Add comment about the maximum
 frequency
MIME-Version: 1.0
Message-Id: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-8-513202126013@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelgfehvdduieefieeikeffgffggfdttdeugeffieetheeuleelfeehffdtffetveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeihohhgvghshhhssehtihdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtp
 hhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuffvnfhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_131541_868584_F3233536 
X-CRM114-Status: UNSURE (   8.01  )
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

Clarify that Winbond octal capable chips may be clocked at up to 166MHz,
which is their absolute maximum.

No per-operation maximum value (captured with a "0" in the table)
involves that in these cases the maximum frequency of the chip applies,
ie. the one commonly described in the DT.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 53890b1da65cd4b2a956edde48c591c043242399..87053389a1fc7abf6e6b12d061c74442ea3bbcaf 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -32,6 +32,7 @@
 /*
  * "X2" in the core is equivalent to "dual output" in the datasheets,
  * "X4" in the core is equivalent to "quad output" in the datasheets.
+ * Quad and octal capable chips feature an absolute maximum frequency of 166MHz.
  */
 
 static SPINAND_OP_VARIANTS(read_cache_octal_variants,

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
