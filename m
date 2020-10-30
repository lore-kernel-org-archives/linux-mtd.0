Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D95BC4741F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:26:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73ACC2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:26:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="agFlgufb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73ACC2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k93VjDNM/XHXX0S6IgR3e9l8YkKNMw4JoP2wNakIlYo=; b=agFlgufbCwrHaAnr1+BUCefZG
	Oao8/1wnixiBsFsp3yBtihEGqwUBldsHowdelR5yjk7Yx8jWqYjD9AzIa+DPUSZlqN2CszT63EGbA
	iv8shBrngsdCUe4etcqnhq9hkehXnt+o6f+hqWPsPkJYqhphxG99O65yGjl0YcmU8UpXzknvlJaKi
	tmko9s3r5NvLt6ybjdcZUkCxJPvkkRG9y9CF156+nMxpx+x8MCghywqJJmI9vinRbIq5D1DRPI6U+
	WBi/c/qJRVHfAM/ty2kHuoAIpQRe7OaIH9Gi0g1/FDI4pb12MmiDricr9xXmKmxqnTpzHJBPM7iTK
	Xxs0vVSiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYA9-0004Yx-Ma; Fri, 30 Oct 2020 17:26:05 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYA7-0004YP-Kl
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:26:04 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 80C97FF807;
 Fri, 30 Oct 2020 17:26:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: rawnand: stm32_fmc2: fix broken ECC
Date: Fri, 30 Oct 2020 18:26:00 +0100
Message-Id: <20201030172600.28845-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1604064819-26861-1-git-send-email-christophe.kerello@st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 9efac6ce7f621c405d49a091e3e367be4250a27a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_132603_802451_EB6A55DB 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-30 at 13:33:39 UTC, Christophe Kerello wrote:
> Since commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework user
> input parsing bits"), ECC are broken in FMC2 driver in case of
> nand-ecc-step-size and nand-ecc-strength are not set in the device tree.
> To avoid this issue, the default settings are now set in
> stm32_fmc2_nfc_attach_chip function.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
