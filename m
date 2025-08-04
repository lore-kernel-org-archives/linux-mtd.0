Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00454C87FDA
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jSE6wct7kYJkgimJOK0DQzLj5fIvD5wbXvZCMMYJLJo=; b=vweFm0f2+/nmoB
	u1+x5rPJqFpIR8zSQtUqvi44uud0nut2i0bS+LKaHocvTJE+z8g5rJ2etAFV9gKIQ5cMtFkPeg6Aw
	inY5sZjF/dOMz0NM3pWRbEG5BJ14EdOlZ/9zNyiSomf5eXc21NUUx5NrYp/S0lAbSsq93/pr/JZIM
	kGkDF1SxtsHanN6zOq7RU0MO36LWj0ZyoRlapoWf0mG+uxeYC3Lw2q6JkgDtq4CPbI3pF1lfcgzSM
	f9Wp+MdIO+KXT+3065OLVq2awlmSw0jRlxZkMqqH3+42ToSWDsAR2RJ8rsiVrZRS801k4w2dNPhEv
	+PSc9zWmX0Injst0nNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirpv-0000000A7cl-0zKO;
	Mon, 04 Aug 2025 09:50:31 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirpr-0000000A7cF-2srR
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 09:50:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A11F24316E;
	Mon,  4 Aug 2025 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754301023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8AkJ02wQGHu9WLLvikIeP8n7YbchB7CGIHF+YdxDHjQ=;
	b=D1p9CxrsEl1CUCUMSbtxC8EKmXr9o73gjm65vRliWugsVReFRmE2QfhDGEUecoA2u9HPDg
	j/nEJxvZoi7pnG//jhTwmaM/VTZJvsKps3jwE0L5PaElt7HZispORtPklE8e6EQiLvQQma
	+aO/p4rKQdys/WJdxwzi380+GCSnFFrk3+MehH4JAAQU52mReOAc6bRmGOGWyp1zAfmB7t
	xxYkY7tgqsGVx4jDU9xN7+oj58jRxF0dHGwb8HG4NgBZ696A+HceZFR/NnJSKnuxAOKtyh
	FQb8whwNNzkklUri6Qu0sUHRFQUCWmxasVyqL+G5BfrQR89GgbzAtXBrQImJ0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] spi: spi-mem: Add missing kdoc argument
Date: Mon,  4 Aug 2025 11:50:13 +0200
Message-ID: <20250804095013.409700-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueeileelteeggffhfeevhfeihfeffedvtddvgfelvdejleejveelueeggeevleehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpt
 hhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_025028_531573_00D37F23 
X-CRM114-Status: UNSURE (   9.88  )
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

The "*mem" pointer has been added without description, describe it in
the kdoc comment in order to fix the following W=1 warning:

Warning: drivers/spi/spi-mem.c:594 function parameter 'mem' not
described in 'spi_mem_calc_op_duration'

Fixes: a11a51896572 ("spi: spi-mem: Take into account the actual maximum frequency")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507310409.fnuQ21qb-lkp@intel.com/
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index d3b7e857b377..841b0995c8ea 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -577,6 +577,7 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
  * spi_mem_calc_op_duration() - Derives the theoretical length (in ns) of an
  *			        operation. This helps finding the best variant
  *			        among a list of possible choices.
+ * @mem: the SPI memory
  * @op: the operation to benchmark
  *
  * Some chips have per-op frequency limitations, PCBs usually have their own
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
