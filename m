Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A914C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:22:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10BB761075
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10BB761075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bma+upxs3oZH67y8mu6AwziLqFLC1NwgosTSG+Nv0bQ=; b=YAaq5OtMWtMrRox7JBK/WJsI4
	Xo6Ymv6U7sGZDyYNMXQQzVrx8UynYXWUNfAgpWO00uwq87w643eeLhoNM0IFKOLfGEEqWtiOWqfmA
	g1Vu51ftSFv4BoMGuxVJloQnuG1V9f729PFUF+MfNsmVMgPTjbnM1Co4+v2OAEllcUvFz+L71fqNN
	Aq08JvOZ3cjMjJEWi942IsXoCyTOsfUs54tx9Q3Qx2cSUGH4MQjkkcpVfcaBl/AQPdqatWxBa+d6b
	XMKPqfWLGuiXozh+TE62ThPhnIiKPqjanYhbhiXGv1FTs4vAMI/bxHH8nCzZk0YyZBTn2MmPVVEwY
	/HjZCVqcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg32u-00Dv1V-I1; Mon, 10 May 2021 10:21:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30v-00Dudo-2d
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=m3xw7nVjExknkmugsHsPwO+LHRn1ooweFjepMMXSNYg=; b=zRtQlTY29yk1MEqynJJd1leOBs
 4ZlYKIe59ihidUKGHfTJ/uPI5LrEAW7IfZr5KUSOoOUQneQaAd1XIIFB0ohWTe4oQ8QxPITs6KpYF
 t18MPuJ1Y7/jweCpYKF+A1EHYnwmasLhE1kuJnoiN2rX17NAWtCb0LVGpeImra0BCr9JH1z5w0Gti
 qkUXCOyaWKhrULnCEANCWZpXWs+UnaafB5/TgIAeXPl9Y5+A5MICy3Ve03RyEFfx1l+ppr5Znqonj
 gkiq2PSuAd9SLuh/J+uB0CNrqi33FTrsw0Ihe2EJRF+/dALSRS29tRCBFRJ0lW62tlngE7YemICoa
 O/DzsAsg==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30s-008WHD-86
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:19:47 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0284720008;
 Mon, 10 May 2021 10:19:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tian Tao <tiantao6@hisilicon.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nftlcore: remove set but rewrite variables
Date: Mon, 10 May 2021 12:19:42 +0200
Message-Id: <20210510101942.8077-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1618363874-25113-1-git-send-email-tiantao6@hisilicon.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'16a7af2ecc2217ba8c317fdd2ca177bbc7b0a8d2'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_031946_439548_9D59E3BC 
X-CRM114-Status: UNSURE (   6.96  )
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

On Wed, 2021-04-14 at 01:31:14 UTC, Tian Tao wrote:
> The value of lastEUN is not used at line 622, and will rewrite a new value
> at line 541. so just remote the line at 622.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
