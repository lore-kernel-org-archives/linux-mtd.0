Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C416E6FE42
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoklTmstnZTP64IIcVanHbQ1cEdB9CePIIojsTuUFaU=; b=4S13N+gs/N/M1N
	wJCHEh0JDVoxxRLuIq0KQU95EGIeUM2MagJYRQAao6tqA/QsjOuxFKWLJfE0rthdalXO7iz2Egg37
	veSbqNnVhrgQ0rA1Gn7J1eNrlj2nQ+EkFgaDihHbpN+EP3Id/AIuqDqyUMilZFPkwbDqNTpLgoYuq
	nCEMSDYmZvakx9T14/0j5GzP7P7OwnyQKj2BxwwK+bhLbA2sQJ8wjsYobr0C2xd+TBpoFCqJmJezJ
	VBB7so0D92D6msNvudDnMiOnK0wK3iNNlbJcmMYdyVBezSYfzWNvAub12qEcyItxGRg9hoKKsZ4vM
	4tCpuWN5C4tceMeyadpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhV5-009FFs-0T;
	Fri, 22 Sep 2023 14:51:23 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjhV1-009FEL-2B
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 14:51:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4AD84000C;
	Fri, 22 Sep 2023 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695394275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wQX2ktdkqFIuYrPhSh4pRo+ygkcZ8kR2Ky+CjNE0P0=;
	b=Wr85+tU+J3U/0x0nUCpDXOCwzzBOmg3xw+HhtOh9/ntsNmDwpNjDBJiBHtjnp2ohPH5p+n
	cezjFJ9DhguYo6iMeHOufrPueJm1s9MqdW3x4T9fZ5JjBrAwH/TX0uUG18Le1C2FiDwt0s
	plmXrrXSFHRgmxuhJU4Lzxl/RkCM0UOEAhT76ROxxgAXXT4Jul5sbcmLudgbIIDgB8HRCY
	1wZdMaUYDru3jbzgpT6LokedvTwbEqZ1lukZqmw5+i8GUcJqQMo2C9lbPnwriW8HaFRPhH
	HiBbX6pSGFedGRKnYBacnz8/P9c676e3789WETtj8GptG91cBlKCrCvhIx5U6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: rawnand: pl353: Ensure program page operations are successful
Date: Fri, 22 Sep 2023 16:51:13 +0200
Message-Id: <20230922145113.578275-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717194221.229778-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9777cc13fd2c3212618904636354be60835e10bb'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_075119_854764_EF60B4D6 
X-CRM114-Status: GOOD (  13.41  )
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

On Mon, 2023-07-17 at 19:42:21 UTC, Miquel Raynal wrote:
> The NAND core complies with the ONFI specification, which itself
> mentions that after any program or erase operation, a status check
> should be performed to see whether the operation was finished *and*
> successful.
> 
> The NAND core offers helpers to finish a page write (sending the
> "PAGE PROG" command, waiting for the NAND chip to be ready again, and
> checking the operation status). But in some cases, advanced controller
> drivers might want to optimize this and craft their own page write
> helper to leverage additional hardware capabilities, thus not always
> using the core facilities.
> 
> Some drivers, like this one, do not use the core helper to finish a page
> write because the final cycles are automatically managed by the
> hardware. In this case, the additional care must be taken to manually
> perform the final status check.
> 
> Let's read the NAND chip status at the end of the page write helper and
> return -EIO upon error.
> 
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: stable@vger.kernel.org
> Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
