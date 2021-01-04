Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B03C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:19:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD00D20780
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 10:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD00D20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1U+x6FVv+hbSKTni5JPuIM4ZhHUtAL2vWbgO27MbfuQ=; b=MMo/1Urwgt3u8aOSVAAqvRQCP
	HrmWwKmw+9db+ZjxKYLzctCGCiafLlLWnaBtuSmVX5FvPYXfcoYxR3nGPtX7cT6kCY0M5h7gDl7KB
	VOurwMwoz9qoeD7uans/aeABkJIuF1j+9N9kHP9dwuK8zftaeDnuuAQBcItwQJfFk/oCQH7UfBVce
	iqMliDW6ANQuqULyYTnr3Gn+APXqY8OBrVO/6V1IlwADdMxvU0rtZ/9JlFP6KWSLAk5uycy5GF52C
	GqD5e5ltL5b2HwDvuj47eZT45pkuLKcIZNUcvkjkOVZ5MyuznPJyPMxS0XvZ1//H94YFsekVoozdE
	7mOZpDwEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwMwf-0001tK-DP; Mon, 04 Jan 2021 10:18:37 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwMwc-0001s7-FO
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 10:18:35 +0000
Received: from localhost.localdomain
 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr [90.89.98.255])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id DEE9D240005;
 Mon,  4 Jan 2021 10:18:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: yangerkun <yangerkun@huawei.com>, zhongguohua1@huawei.com,
 joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
 patrick@baymotion.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: phram: use div_u64_rem to stop overwrite len in
 phram_setup
Date: Mon,  4 Jan 2021 11:18:30 +0100
Message-Id: <20210104101830.3036-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230021718.2043147-1-yangerkun@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a02eec60d29751b243ded353b26726e8e6be2a9e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_051834_728669_46F1F76F 
X-CRM114-Status: UNSURE (   8.70  )
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
Cc: yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-30 at 02:17:18 UTC, yangerkun wrote:
> We now support user to set erase page size, and use do_div between len
> and erase size to determine the reasonableness for the erase size.
> However, do_div is a macro and will overwrite the value of len. Which
> results a mtd device with unexcepted size. Fix it by use div_u64_rem.
> 
> Fixes: ffad560394de ("mtd: phram: Allow the user to set the erase page size.")
> Signed-off-by: yangerkun <yangerkun@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
