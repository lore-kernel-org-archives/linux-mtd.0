Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BBCC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:38:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE30760F8F
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE30760F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoBO0bbVL2XwSFsL0MnhcB/zPbghKKTYpF6dY9oQlOo=; b=dN/kJzAs9jH770
	dhXXkLGN4XFQ8aVXT8o7fvtmDsmV7X5jP19w/XDUKRStJopKdVjva9mj+gu4FHMJ5Ceyr3oefDS3h
	BgrI/tDR+hFQEOgcCaL0nFKiMC0cpJu1TWYKFwHlqJ7retmHhjqBbyxIT0b7UXEBOQLb1nnuK141n
	woOk9HyXKXjj3r9Se4SuPgGQrZwcsdC8BX7Q0wHWu7oByYa3lBbODkHzYj6QBo8x/biRTF68ehbSR
	aCpOlz+hI0lIWmSC5HpcGQRgHyt86KPPgIPvdtAKY/NJtmDBhEIzVa2O7SD9gnt4VcCpp7uVrSo92
	DD0gNLfY6P30hZV8C36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQCNI-006ZkF-U9; Tue, 14 Sep 2021 17:37:40 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCNF-006ZjR-08
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 17:37:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3EF1320007;
 Tue, 14 Sep 2021 17:37:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>, miquel.raynal@bootlin.com,
 mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org,
	stable@kernel.org
Subject: Re: [PATCH V6] mtd: rawnand: qcom: Update code word value for raw read
Date: Tue, 14 Sep 2021 19:37:32 +0200
Message-Id: <20210914173732.167846-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1630998357-1359-1-git-send-email-mdalam@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f60f5741002b9fde748cff65fd09bd6222c5db0c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_103737_227298_F463E07A 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue, 2021-09-07 at 07:05:57 UTC, Md Sadre Alam wrote:
> From QPIC V2 onwards there is a separate register to read
> last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
> 
> qcom_nandc_read_cw_raw() is used to read only one code word
> at a time. If we will configure number of code words to 1 in
> in QPIC_NAND_DEV0_CFG0 register then QPIC controller thinks
> its reading the last code word, since from QPIC V2 onwards
> we are having separate register to read the last code word,
> we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n"
> register to fetch data from controller buffer to system
> memory.
> 
> Fixes: 503ee5aad430 ("mtd: rawnand: qcom: update last code word register")
> Cc: stable@kernel.org
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
