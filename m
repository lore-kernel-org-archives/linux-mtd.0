Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07045C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:15:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BABC64EC4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BABC64EC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nRhdMbcLuWE+4s9kuvFvObs/314j7Ut+1wuOkyaaw1k=; b=NDfv1Wdk3gHtfMVO+W50GnEBM
	F28rOEVTBOm9pUOOwvDwYtLIz1fXcy6TRvJwntYzyuqeC+KE33DlPOSIKxBPJ+O7vFrdpFHvZOwQJ
	Tz/N2lw4IyHpifWqYTvVP/pKjKiFKHPUdjLEfLIynvb1LnSQiOhkEGrlHy3VCLc/jKqT5MUcLkNkr
	sIPSW4uWn1QYqkd34zGxoBOPy0JNC/lHYXgrF71o8UE3W0K5oEhGou+zDoOxp0x9xlSqAPQvM5Eme
	Eg9mwKrDXVq/8e1PnVSPEgvXA2p33qm5td/bjSVC3WX8jWGQMVVZ9hkU8OAnVotPao8HPmqkeAnr/
	b0Un61+eQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYpe-006YsR-52; Wed, 03 Mar 2021 21:14:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT80-005JeF-6K
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=o+nHtewl5PPzzoJ9oK4IZX0RWa9sS/K567lL+bqIh7A=; b=srUeek/aFUonsgPbIPWKdsgcau
 bKWLlKKrMYbQPx+qrpcXWfYYtYZz9vFwu4n5YlybS4F0Wh16NIMZqoAeAIDqAx1uuHTsx+h7bMlb1
 IaJ7tn0tzAVaR2XLlUhYmjjvrZD6y/UsT9FFMzQxJfErDbYnUlV6asiGxzZJHzxF4d8gtxORj/cEQ
 u7PJr/F2NAvNP2EyJ4g7TKyc1Iv6AqgMkhDlw4CRcKPxutzhe4CfGJlqXQ1Hmj82XvTikkQNq3f9V
 A3GbBUQNfb7UKD1xGD+4TeP9QQWsMrHHa0wgEWDoDAX6rY1j1WG+W87S8b3XrHwqNdJYPRnnLUpja
 INt1Ud0A==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8b4-00HW86-42
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:16 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1EEF91C0015;
 Tue,  2 Mar 2021 17:13:44 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tomas Winkler <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdcore: constify name param in mtd_bdi_init
Date: Tue,  2 Mar 2021 18:13:44 +0100
Message-Id: <20210302171344.882-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210225143329.430012-1-tomas.winkler@intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ea8b4d3ed2523774d8d5d8a519e7ec451792761f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171416_870784_19EA5855 
X-CRM114-Status: UNSURE (   5.12  )
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

On Thu, 2021-02-25 at 14:33:29 UTC, Tomas Winkler wrote:
> The bdi name is not modified by the function, it should be const.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
