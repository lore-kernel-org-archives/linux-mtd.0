Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F656C2BC11
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:35:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FC62145D
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AqjSzO89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3FC62145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ENnpVZCER0XvoSU7Zl2n6+A440ve6c2Hd9V5t9TaHrE=; b=AqjSzO893JE0xj2Vu/N9XCNYe
	fNLCvBMZm4lE2xAbP1Frox1fYi0GXpgXEitqtrk8bHf7a5+SKThhQtRb0LZk3LfGeZgdrP5ACuQBi
	3/IOKVevryMPPxeZQFCngnBHFzSoPlJ1QVE10maOj29tcfr2JNsLHYTjYBzRRQRBlUxTi0X6rZ/V4
	y6u1/iu63FokbjSQcWn5kpw/L6h7+h/8dQerKiF9FNrJ4c3onWq4fyvsHOUvgQNtIZwDTXi7u4NBq
	PqPGHTbE9HT+b/BrtE7Bfm+GqQlH2ChCO5W3rKAhftmhRBFMeZqefp75cxUPIM6DJBEtBC6gLLnVX
	yANTC/Ovg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBfd-0001Af-Dv; Mon, 07 Sep 2020 07:34:33 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfG-0000xv-Og
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:34:12 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A911B1C0007;
 Mon,  7 Sep 2020 07:34:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Matt Weber <matthew.weber@rockwellcollins.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mtdconcat: map through panic write handler
Date: Mon,  7 Sep 2020 09:34:07 +0200
Message-Id: <20200907073407.27337-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602143403.13465-1-matthew.weber@rockwellcollins.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 3fbe507ebd828bc8ce747181a204ddafbe5cce2f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033411_007229_83ED66D4 
X-CRM114-Status: UNSURE (   8.33  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-02 at 14:34:03 UTC, Matt Weber wrote:
> Allows a mtdconcat's subdevice->_panic_write to be used for
> capturing a mtdoops dump.
> 
> Note: The ->_panic_write is mapped through from the first chip
>       that is part of the concat virtual device.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
