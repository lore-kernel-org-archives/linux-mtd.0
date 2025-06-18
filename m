Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC991C7115A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 13:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bux30KD9ZlG0ybSo4686qdm4kMLZYyLd40p6yjZgjkc=; b=mQHAGzWt2f9AHh
	vw6ovG/HO/pSNpdbK0HhOmB8V39x2/TDudrlbyZE4aEG5NqfI1Pb5xEDIK7favUmbwrnAGtz9d/6C
	tBhig2NAP8mNlG39nWiqqEMUlLTjxow9mVU/anBAGeGRh5UCLTG9lP1kmTTcEtkcccR8dvkztVyl3
	GnFgKsaq4udbjp8FIQKBLulLMY/g2dHUQSRCG8wjZ5c3L8+tFGRK3To3zSOqm+wpRg1f5cOyrakRm
	qgnQHoj3ho1vVVK7qamnAHvJeDl9CnPf2hVRXjMF0dS/REy+Wxq7j55g/rc7/unXCHhINg9RF4dPw
	2bL0KH5dmwWk4C5Bv5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqX-0000000AITp-1AUa;
	Wed, 18 Jun 2025 13:28:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhd-0000000A5Rm-260P
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WZWJRW69q+SS7CXANDbY2irrOFqYZ2dZT16BR2PmS8w=; b=RRgsPyAjrdoLHLs+0vzZMD+iKZ
	H9S11AOBCRoXV2BPlsPOkC1tOBpmWtz+FnX9a2l1J2hq42/mzaKRUEeG+FDRH/oZfrYyutU6v/Sqk
	mSM9Z46O8GV5BFSZY45gxb0HUnla4T5XVOeeQNgdmgp7aM9EmCJaxyVGlWs5y8DBrrsxqn4/EACXc
	ii1DsufFWSQCOXRWO2ognFSQcyNT91LfVUgu/yb7RmVyQM8R/9kXFCje004px0G5y8SxCgUrmAHgd
	mSAUCLl7UQVTZTLEB0qTphmoyvFbxSg7Byj6CY2a8Y0noNDmjR/7TTiz5+I+2P6YOXHKWe/NKSIdV
	LX5nB9ww==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhb-000000041gA-0ufB
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8791B4385A;
	Wed, 18 Jun 2025 12:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750248936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZWJRW69q+SS7CXANDbY2irrOFqYZ2dZT16BR2PmS8w=;
	b=DtZWb7pzdH4o/7Nzgzkk0725atjbsimy+D+gYddGTforoC1m6f2p02mQUigg4nRo4H8KE3
	y6u7d9s4F0P+LJwg1fYfzxnVwBEeoCAYZj5VKe5u3K9B9GJmy8iZzbNancOYNAlKA1T99B
	46n9WbCrgkdJWgV9ejdAutMxJ8mCpjO3bAQqEU97XapNlA34mHgr4PxyJVRqXoNCok5r7A
	+mT1Lis3KgB9RuyYn6Iz5CacPyQwc52Sgs4VMiZxcmzRIUyfO083HG3eoTEUY46+Ach5qS
	lbw9TLqhDprM6IDcXWjQU5/FFZI2wisEkoMMLnKFLOGBmu5/09Ey5Iu6VyQeKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Jun 2025 14:14:18 +0200
Subject: [PATCH 1/8] spi: spi-mem: Use picoseconds for calculating the op
 durations
MIME-Version: 1.0
Message-Id: <20250618-winbond-6-16-rc1-octal-phy-upstream-v1-1-513202126013@bootlin.com>
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
X-CRM114-CacheID: sfid-20250618_131539_363624_71BB432A 
X-CRM114-Status: GOOD (  11.74  )
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

spi_mem_calc_op_duration() is deriving the duration of a specific op, by
multiplying the number of cycles with the time a cycle will last. This
time was measured in nanoseconds, which means at high frequencies the
delta between two frequencies might not be properly catch due to
roundings.

For instance, the Winbond driver has a changing number of dummy cycles
depending on the speed, adding +8 dummy cycles when running at 166MHz
compared to 162MHz.

Both frequencies would lead to using a 6ns delay per cycle for the op
duration computation, whereas in practice there is a small difference
which actually offsets the number of extra dummy cycles on a normal page
read.

Augmenting the precision of the calculation by using picoseconds
prevents selecting a lower frequency if we can do slightly better with
another frequency involving more cycles. As a result, the above
situation leads to comparing cycles of 6024 and 6172 picoseconds which
leads to picking the most efficient variant.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 5db0639d3b01596b6f2f2df4b914422316eb9a3f..c42c227eb2a29ccd291bdced6b9d188c3b0bfb67 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -591,9 +591,11 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
 u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
 {
 	u64 ncycles = 0;
-	u32 ns_per_cycles;
+	u64 ps_per_cycles, duration;
+
+	ps_per_cycles = 1000000000000ULL;
+	do_div(ps_per_cycles, op->max_freq);
 
-	ns_per_cycles = 1000000000 / op->max_freq;
 	ncycles += ((op->cmd.nbytes * 8) / op->cmd.buswidth) / (op->cmd.dtr ? 2 : 1);
 	ncycles += ((op->addr.nbytes * 8) / op->addr.buswidth) / (op->addr.dtr ? 2 : 1);
 
@@ -603,7 +605,12 @@ u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
 
 	ncycles += ((op->data.nbytes * 8) / op->data.buswidth) / (op->data.dtr ? 2 : 1);
 
-	return ncycles * ns_per_cycles;
+	/* Derive the duration in ps */
+	duration = ncycles * ps_per_cycles;
+	/* Convert into ns */
+	do_div(duration, 1000);
+
+	return duration;
 }
 EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
 

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
