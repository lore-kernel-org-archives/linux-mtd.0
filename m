Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AB9C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:05:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F4BE64EEF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 19:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F4BE64EEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ZLfhb+a+/szNxk4bmsJloO2+vHi9fhaQfHul24YheU=; b=fDs+4xAcJokqa4v03CDY+Teph
	72T6Ifib+OaXOnTQp/TJxJeEmzQD1rxND/oFnmItQPXQxtG/6YN0p0xzHSlHdKFZT4/pVyUJ5hf0y
	dN/sb7f3Uj5+81OSVsA9ecbt2JfUR4NrMPh0M/r5giqY666EEaxpGM5uPrGm5NV66K9LINRVqhuge
	i/kGX+PUmhkLi84vEt4GsdM/ylCkXX7lDx8X3KH9xOkA3UgF3u2dX56qLB0Zo1k7RYkhjjhn8NO/o
	ZNK68p7wTE4qc1g4sD85xtY48y4EAmVMIDg6iRfIDsmVJx/gZfpV+9VNDlWQkh9fg4kNdbyG/gOrD
	W4ED6dDIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHWnH-0068Pw-Gf; Wed, 03 Mar 2021 19:04:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT2O-005HiC-Od
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=swXN01gv7aoifLEHR1eC0Soez628RMO5LGsURtcFFVc=; b=gH5xhr5QALGloTVhdWMk9YuI6Y
 Oan2clPmICZm6lNcSmR8vJYMNAU0MzbeH/ihE1f1Mjqrvo6p03vq5kGK5UAJPaGueQ7geRihyqP6N
 nF2v9gWRcKdYkM9rEVSRwoIbS35LZxMXhlm6s77DIWn8hnACqQsiSmgyTGZFsTGkqjITwqy0eVD3r
 i/37Gy6MhRSWNyzWeL2/JNo2vh+RX8i0EDl3Prm1APfAOoheAeS5KMJ5E4o0NGh4YFI07vMxUf4cn
 1j7zTHL1OEMaQecjZvqJO79c0wyYlzoa5rBJkoVs1NHYMiK8Igdl4oR9JJAc3lD3DWlzSKR7yqPbf
 6ssBXktg==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7x6-00HSCh-Jm
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:32:56 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8C6641C0008;
 Tue,  2 Mar 2021 16:32:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>, miquel.raynal@bootlin.com,
 mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH 3/5] mtd: rawnand: qcom: Rename parameter name in macro
Date: Tue,  2 Mar 2021 17:32:25 +0100
Message-Id: <20210302163225.23205-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614109141-7531-3-git-send-email-mdalam@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 050d2d43aa8a077c51684a2a76df6ab3b48a9eb4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163255_972140_F267A3B2 
X-CRM114-Status: UNSURE (   5.76  )
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

On Tue, 2021-02-23 at 19:38:59 UTC, Md Sadre Alam wrote:
> Rename the parameters of the nandc_set_read_loc() macro
> to avoid the confusion between is_last_read_loc which
> is last location in a read code word and last_cw which
> is last code word of a page data.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
