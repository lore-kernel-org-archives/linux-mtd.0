Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BCEC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:01:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF8D619A1
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF8D619A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GV8MzZVatyV4j8m1Kfltxl9lp6cyrEqZi1QpgoovmrE=; b=a1B81AXPezjiyezkc1X4vZdIl
	WYByhafHdbTiaRQ7uYq6o4545yTcVzj4LqCDD1NaEv0DRBcZEAOlaojG4xxoDiXsmKWtjeSwqfm+a
	KbFRnS9Pd82iwZI4auXVfdlZ7rcrkWeDmMpT3BxUrYAvlCzJlaDHdMtsIxoL65JMUM0n9oa+q+tVX
	rivh/nxJcbDggGMQrPf3KLnbf93/cpZ8BrjhstCh9op5JK1OUdF3G62iDz7HM+3ddfRQ7qcNCN3mX
	WLX4kCi6+Ot5quLqGwWrtzAXYAoAlEw8u43RjxMTn5P6hfVGTfBav0wPNIm2pKi5lIBO33VmONpzF
	KZc4v3UiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3eu-00E1gk-Ae; Mon, 10 May 2021 11:01:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OK-00Dz1N-G8
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=r8i05/sJHhcJ59sue0UQfr77viJZYo6EFbK5Xn7d7gE=; b=LDEiamcDiuA1uhuOLrePKG5J+/
 8mzrrKCmOFsrEebwe+6/PhKKXHvzT7UavN8Iz2h5ur1blNYK2hRWNIrRDXIVeANSom5RsjuLSw70j
 xN6juajMj/VopLijO+D4+JQR7uNpDw2Uc/IL692rGmOlS7jSvN6S5MUf+L3ia8W+UJRqpyPE7vwgy
 DLg0k0XtdnoadSPIK770lW5ptZCFzwcbXmpT9Ey1t0ZfiCy0ybc8JY68b32SKG3JdQRbnV9MTDrw+
 3iGlrxxira1dauti5W9mzn9A0ELegSbmWBs1Zk3FF4Km29T7PacTxg+4ymRYHIqjcYykRRtEEgV75
 dxUwC2AQ==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OH-008YsK-NI
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:43:59 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 773DC1C0002;
 Mon, 10 May 2021 10:43:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 5/5] mtd: core: add OTP nvmem provider support
Date: Mon, 10 May 2021 12:43:55 +0200
Message-Id: <20210510104355.11075-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210424110608.15748-6-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4b361cfa862479fbb1d14ddf01de4dbc7146dcc5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034357_910443_3ABF8037 
X-CRM114-Status: UNSURE (   8.43  )
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

On Sat, 2021-04-24 at 11:06:08 UTC, Michael Walle wrote:
> Flash OTP regions can already be read via user space. Some boards have
> their serial number or MAC addresses stored in the OTP regions. Add
> support for them being a (read-only) nvmem provider.
> 
> The API to read the OTP data is already in place. It distinguishes
> between factory and user OTP, thus there are up to two different
> providers.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
