Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E936FC56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622A022240
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbwBCO8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622A022240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yvtFPoSzTehjl9wR1MsGOAKO0vO6sxfySrio1S+9enM=; b=jbwBCO8xttvumt8LKIKy9FR+G
	5eoUlfTdl6sh8o2JL7lOS9nKfii5zP1YXIlH95EjW0NFJ56gQLekKlalKx5LLw/iK3sp3b6n5fH39
	4icMvPQdo86sSWtyyN+QLsDjRXDpVeZWNidxZhajwGt40vBKlU5WCrj125b4tcdu2kMX3++KRivni
	TOEgAc0bDYZIvrRa9ZscnldHnDhWYs68MPtfm9BoaE37wWLajNjwlKGeITKR8TFoDmawUiSKXr0Xr
	wDHhQTRq+sMKKHTDPvmJFFYeOVNloZs/Q/PGLJfos7nH305OOkdtyyfg33QqQ5qHU1d7Mv5qumtpk
	x0ktb39UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrFo-0000LS-Ir; Thu, 19 Nov 2020 21:14:08 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrCx-0003Vg-Do
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:11:12 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0362C1BF206;
 Thu, 19 Nov 2020 21:11:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 03/23] mtd: onenand: onenand_base: Fix expected
 kernel-doc formatting
Date: Thu, 19 Nov 2020 22:11:07 +0100
Message-Id: <20201119211107.27287-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109182206.3037326-4-lee.jones@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 7abc17b3ab63d44a96e281617aff61e1424304d8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_161111_785567_B8D32C79 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Adrian Hunter <ext-adrian.hunter@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-09 at 18:21:46 UTC, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'mtd' not described in 'onenand_ooblayout_32_64_ecc'
>  drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'section' not described in 'onenand_ooblayout_32_64_ecc'
>  drivers/mtd/nand/onenand/onenand_base.c:140: warning: Function parameter or member 'oobregion' not described in 'onenand_ooblayout_32_64_ecc'
>  drivers/mtd/nand/onenand/onenand_base.c:200: warning: Function parameter or member 'addr' not described in 'onenand_readw'
>  drivers/mtd/nand/onenand/onenand_base.c:212: warning: Function parameter or member 'value' not described in 'onenand_writew'
>  drivers/mtd/nand/onenand/onenand_base.c:212: warning: Function parameter or member 'addr' not described in 'onenand_writew'
>  drivers/mtd/nand/onenand/onenand_base.c:225: warning: Function parameter or member 'this' not described in 'onenand_block_address'
>  drivers/mtd/nand/onenand/onenand_base.c:225: warning: Function parameter or member 'block' not described in 'onenand_block_address'
>  drivers/mtd/nand/onenand/onenand_base.c:242: warning: Function parameter or member 'this' not described in 'onenand_bufferram_address'
>  drivers/mtd/nand/onenand/onenand_base.c:242: warning: Function parameter or member 'block' not described in 'onenand_bufferram_address'
> 
>  NB: Snipped 200 lines for brevity.
> 
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
