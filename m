Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7EBC43461
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:37:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11EC207C3
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nd+kKSgV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11EC207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qJpTgBBcA7mze1jK/TLw5JhyIpeqvmF4AXU9SHPV1bI=; b=nd+kKSgVxtjwIHXiO05AzNlg+
	+24bmq9HIV6DgKaaXHhhnCcrbguKVVc7i0fwCPpgUfhB+PVpekRhyQsqsSHuKqgCS9RMOS/rku1vg
	tBnYnKRfTcYdr0A0IeX3Y2HJ/kx+05KBENUPcQ08bAC8hM9OFhuYQN/US8BiDE7DMo8CYKgV/mmag
	TxNNHZ2pu0n5MRYJy5kFzVc7eaEp9MFVG9bsYI3QBsE6skp/VAP7Ge4L3U7Rl2MpuQ8p/BLxQEMmk
	RUkicI2FLW2TH9XvpCGQVwH/bnVpm0fTrhjaMJ5erMWVYWuEttvmZOYG3PHHDRp0FxLIruxUta0AD
	Ac9yi9weA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBh8-0001xp-9l; Mon, 07 Sep 2020 07:36:06 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfi-0001Cf-8U
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:34:39 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 573F8240005;
 Mon,  7 Sep 2020 07:34:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mtd: lpddr: Move function print_drs_error to
 lpddr_cmds.c
Date: Mon,  7 Sep 2020 09:34:34 +0200
Message-Id: <20200907073434.27599-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e0063cbd65f3b47be1db34efc494ea3047634d88.1588016644.git.gustavo@embeddedor.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 1a64026eda1642c81425e48550fd4bd3f73d0ab5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033438_422325_A8739191 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: Joe Perches <joe@perches.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-27 at 19:56:08 UTC, "Gustavo A. R. Silva" wrote:
> Function print_drs_error is only used in drivers/mtd/lpddr/lpddr_cmds.c
> so, better to move it there.
> 
> Also, notice that there's no need for inline as the function is used
> once.  Lastly, fix the following checkpatch warning:
> 
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> +static void print_drs_error(unsigned dsr)
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
