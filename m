Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B95BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 18:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D772610CE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 18:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D772610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9i19JveUl97/gp8VbduFsmN/mRF6q20300cru/yNKyI=; b=nwbbkhIVYHEu0R
	L1V3OMoEH+Idni0/3X2PFMIYHNqC2s9zlxIdRe38Q2PlxLMJQFVFSLHgaJ2OACV2Vm5u9dvGrIhjR
	03/5hvocXaXZ3LcxQdZSU8sOuXk+GSHP00uEhXKqnVaruu4pwV2WXs2phMOpfabmHFzGPA8Yu8rop
	Nxs1guD5v+D23+cGKdihKlBLb2dqFvp6XVUZNovZhQcfgeJ8032gOaYkMoMw1fK7IgosxLryTM+nQ
	IWRXwe6S++YUB2jxcfLHpgPp2fJ95x1RC8kXp9iJXDVqjvzPioHmV5peAdG0yBspzLpfAPI6sZszh
	jXCIDUaetHH6RgMdt0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQCsk-006h5p-Sq; Tue, 14 Sep 2021 18:10:11 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCQL-006aSl-TS
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 17:40:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 79A7A1BF205;
 Tue, 14 Sep 2021 17:40:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yi Yang <yiyang13@huawei.com>, Wang Weiyang <wangweiyang2@huawei.com>,
 Xiu Jianfeng <xiujianfeng@huawei.com>
Subject: Re: [PATCH] mtd: Remove obsolete macros only used by the old
 nand_ecclayout struct
Date: Tue, 14 Sep 2021 19:40:46 +0200
Message-Id: <20210914174046.302368-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210830083356.31702-1-gongruiqi1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a2aec2c86ef0cad0fd6be718cfeb5cf5eefbfca9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_104050_155265_534E7751 
X-CRM114-Status: UNSURE (   6.40  )
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

On Mon, 2021-08-30 at 08:33:56 UTC, "GONG, Ruiqi" wrote:
> All uses of MTD_MAX_{OOBFREE,ECCPOS}_ENTRIES_LARGE have been removed as
> commit ef5eeea6e911 ("mtd: nand: brcm: switch to mtd_ooblayout_ops") and
> commit aab616e31d1c ("mtd: kill the nand_ecclayout struct") replaced
> struct nand_ecclayout by the new mtd_ooblayout_ops interface. Remove
> these two macros therefore.
> 
> Reported-by: Yi Yang <yiyang13@huawei.com>
> Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
