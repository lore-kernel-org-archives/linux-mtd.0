Return-Path: <SRS0=H+qW=CU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A95C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:56:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D4B72074B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2020 16:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lb8dddCM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D4B72074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oYNh3lgjZJNy6HHRWux4pAGUoNxt26xPov7PrSjxMDI=; b=lb8dddCMSkLpWs8TjKM7EDgUc
	xpamuOB59lKz62SDHjHxaFNB+Zy4YE+cBlT0iwWymfE/zu5KoRDltSL5F0O9PlmVu862cCVYbo5+F
	09ESfji5LKvpAu4l73EirpPNHAvzMt8NzC2ArxLN6OYIlO1G7gMnpkTaUJxbBwE3Na/+XyfXuwWAU
	KV93kWrftySiIX2BZpH/kLOpR0RSZ01x4td0zV+G4kNBszt1SzDAYZqIFNr1mE6TH/XTDTKSOQ5XS
	4dGyJU4UvaJyEDptShABpN+R3wHxk25hDzkdO80VM704J5yJnYGAsDEBzOEmtToCtbPT0KehfvyDz
	FA1mTvKwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGmKe-0003fl-Sj; Fri, 11 Sep 2020 16:55:28 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGmKc-0003fI-Jw
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2020 16:55:27 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 68FAF240005;
 Fri, 11 Sep 2020 16:55:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>, stefan@agner.ch,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH -next] mtd: rawnand: vf610_nfc: Remove unused function
 vf610_nfc_transfer_size()
Date: Fri, 11 Sep 2020 18:55:22 +0200
Message-Id: <20200911165522.28454-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909134318.36340-1-yuehaibing@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 6534d0b57d71759e1f5e93735e1595be649c160a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_125526_766400_9DB51221 
X-CRM114-Status: UNSURE (   7.48  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-09 at 13:43:18 UTC, YueHaibing wrote:
> commit ecc40b8df59a ("mtd: rawnand: vf610_nfc: remove old hooks")
> left behind this, remove it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
