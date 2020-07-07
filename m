Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4F8C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 19:01:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B9220720
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 19:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmW24/2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B9220720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JXpGqi8gpV8OcaPLyduekw8GKAZptT2/+MBFYZrURpE=; b=YmW24/2LusqWIdKy7WSYf4rmN
	Bh/TeOSaHz8mDimYtcxz428KoWIEC+KJiOoCFZdDTE6tqXFHKG8r4zIyb1OMirg7C4qY+HNj1Kwkn
	ftepKVsSC6bznkRfOe0YHk4wFzRcXBLSm/FnBtKWG7Z9wLamzC+Lq6KiN+s4tleocu6HEMfYdInQ6
	GIGLASbmmv3MKh8BcOKndZmlIAEulNuGoKWQDfTc5kuWRnXlFL1lwAgciN5ScIcvManfaYFfNgw+N
	DYCqswqOhq/co9hl2U90WV/y2JZGTt0RolGgCZCjQIqPX/fuG+oFtIIfEIaZJFJOfHXxI3ZEZnMnb
	zgCAZ0EAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsspZ-000790-Uc; Tue, 07 Jul 2020 19:00:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsspA-0006w5-RL
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 19:00:14 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1FE721C0003;
 Tue,  7 Jul 2020 19:00:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org, mark.rutland@arm.com,
 arnd@linaro.org, alexandre.torgue@st.com
Subject: Re: [PATCH v5 1/6] mtd: rawnand: stm32_fmc2: do not display errors if
 the driver is deferred
Date: Tue,  7 Jul 2020 21:00:08 +0200
Message-Id: <20200707190008.25296-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1591975362-22009-2-git-send-email-christophe.kerello@st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 5eeb7fe919ff4f683d96cf8c74a9de7e54722040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_150013_033750_32D12887 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-12 at 15:22:37 UTC, Christophe Kerello wrote:
> A MDMA issue has been solved on Kernel 5.7. The effect of this fix is
> that the MDMA driver is now deferred and the FMC2 NFC driver is also
> deferred. All is working fine but there is a FMC2 log in the console:
> stm32_fmc2_nfc 58002000.nand-controller: failed to request tx DMA
> channel: -517
> 
> This patch removes the display of this log in the console in case of
> this error is -EPROBE_DEFER.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
