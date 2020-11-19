Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75062C56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:11:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B2422255
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BsrPLFHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B2422255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aqYictBZgIu73CO5PCcsZ6jPZJEOeaw/FMBR83aRiv8=; b=BsrPLFHXojKX7k74JH668dhVk
	Rkwwb/NCNVqY/ZVxGx5ZPFI3WuoHq59gsWfCehOFybX4tJ45FVxh85tflWwWfnB4ko1cVu2rgv2Di
	A9fP7Gj1I5yDDhu3ZjQ/aajAiKtWAKP0N9DDkn4hTwBeitkSvM+eqOuTTyLBKoJq70Sdhdce8CJIO
	5cJtBgmM3O5nNM+iMLglN558I2Q69vImZKlAxYK6g+MmmjVa8t38jrEhVAe26fO8mb6SUON2/q5Ni
	0H0bLqBiZGppghqJfH/mOXAE16ZkYoF8LMaDyMdfa4DDTDEyNR5eHqeBg2yvidLW0xyPwlQeZhHCA
	vIxlMY9Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrBX-0002pU-C3; Thu, 19 Nov 2020 21:09:43 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrAh-0002Ne-Ng
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:08:53 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4E2E260002;
 Thu, 19 Nov 2020 21:08:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 14/23] mtd: ubi: gluebi: Fix misnamed function
 parameter documentation
Date: Thu, 19 Nov 2020 22:08:47 +0100
Message-Id: <20201119210847.25881-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109182206.3037326-15-lee.jones@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f064b4d62017a14d54dbd9276b74814e4cf21fa2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160851_929695_C488B2CB 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-09 at 18:21:57 UTC, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/ubi/gluebi.c:446: warning: Function parameter or member 'ns_ptr' not described in 'gluebi_notify'
>  drivers/mtd/ubi/gluebi.c:446: warning: Excess function parameter 'ptr' description in 'gluebi_notify'
> 
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
