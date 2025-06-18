Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D36C7115C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aXGXzP90BwUPQ5hGbX3tB18SQJoL9Nef1puC+2VZXAk=; b=KJH/3Re7S1D7+v
	gkOMU/mBlgO5/jnODVt2gH10ZJfRGtc0uJ9s9RA5xYnb7HaC9NUMtzIB/75eVwKLmf0B1IznwLaKP
	BXNKHFVWGnva+y8eXylaLKFF/o9fnFZiT7GqgKcGm6Ph7J0R3+ohU2g5nFBCygH7loyP6A5X49GLZ
	fCVAxFZ5QB0OWEVffhUPob4l69AKn7l8F4+zh3gM4WKvTBySrs69sMfdErd2MPkyXijuAHBmtxR53
	Asc6LbH2pccfraRKM095mEytdYDycXpLdHTzvpyJsa1LmWLQclvi6x8dMFpN7xCGkdydwrvJbfLMY
	JnO93B+eqKvlAOy0PfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouD-00000009Vdq-3pP2;
	Wed, 18 Jun 2025 09:16:29 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoSk-00000009T0I-2wUb
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 08:48:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 893F42047A;
	Wed, 18 Jun 2025 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750236483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=26bPgdXu0+Ffys+AA3egh0Kbed2F/0RjBbXded3aryY=;
	b=F57RaWXd8Zg0FooUFIVoOyqwB2Nzue3J8X/M7kGsGYR4gYUjaNxOOfrlySFAx99WKS9LB/
	uKhnCIIeA4YGdfgseOOUu3wzLS8wQ9yzF7dZtzdfVbm/CD2jSPnX/bYV4ZIOnGj9q6WH11
	+Pb+EHo+2deiebZIbcprZO+B6DrTxdAEgetSCXVMd/PmXH9Ia1covbqHtThMYKfikztK5B
	R/U2xe9F1VEvCXeIOHvzXg8WBxO2N+khVSAOEwEP7nv9mPDSY1yFOqhTp8LXwn6deM5dhW
	MKEMX8l/DQ4y3j6F24wgFNqwkHSyHzMJdqn75QAPV3ZiVpkVba+pcvZ1UFHfLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] mtd: spinand: winbond: Some fixes
Date: Wed, 18 Jun 2025 10:47:57 +0200
Message-ID: <20250618084800.1644246-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeetfeduleefjeffheevleeggfdtvdduhfdugeeuieejveejiedvhfdugfettdehnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggru
 gdrohhrghdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014806_901336_BAA02B52 
X-CRM114-Status: UNSURE (   7.94  )
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

The W35N geometry was slightly incorrectly described, and some of the
variants on both dual/quand and octal variants needed to be further
defined in order to be fully accurate.

Changes in v2:
- Fix compilation issue with the last patch. I didn't notice it in the
  first place, as I have many more patches on top which did solve the
  problem.

Miquel Raynal (3):
  mtd: spinand: winbond: Fix W35N number of planes/LUN
  mtd: spinand: winbond: Increase maximum frequency on an octal
    operation
  mtd: spinand: winbond: Prevent unsupported frequencies on dual/quad
    I/O variants

 drivers/mtd/nand/spi/winbond.c | 10 +++++-----
 include/linux/mtd/spinand.h    | 10 ++++++----
 2 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
