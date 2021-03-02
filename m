Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DF4C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:02:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C9DE64EBD
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C9DE64EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mREhs5IUBhAMaPPdk55BARfTTR6zNeBpnefOF7Xm8lM=; b=Yurhtlmldb5BFJDB92AIObomA
	+TZpAwXDM1AzPE1kpLD/bf42UxYQg0Yu3wQyaejAhBSImAH2OPkEK0g8AOTdtKqCn7fxJ7MAwSXJ6
	h6NicSFdtuW0s4vzDoHIkubBGyoS2Ed90I+uBD4J+fgWumIdbEBEqDpSLI06fn1n8GAXBiZsIWq9Q
	U5r0TBzAs4mq9/OnXrDUhcu4Kt81RbMgkAZD4AXtbiMbqikgqYo9BJiwhRbkWknqNwPrgwmVlmhBf
	TzQH6eeCVCzritq+DDlqqaAsrvC0jZ1u8ZFd7q0qR8qrXjJM9uj/S/uq4lEEcbLv8IqhUBpRfq+dm
	4E1SnXbgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZXM-006gMq-RH; Wed, 03 Mar 2021 22:00:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTAS-005KY4-BM
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=H5pS85PY/WXogq3se+u0fDzykr9d4RQ9gqUrwKwtvpA=; b=uVqSDXoeM/VpuRlL1/PEtzH1dV
 qPzfTE4b4DWafDNe+jZ19zbZnIrArzs0jWv+LwZ0MZ89yYGZjUlJSQw+eM/PpjniplsYmosh1Mngn
 gaZC+///NJnY3aCTVcOk4+Yhe4nCflK24Jo0ezQRh7b9HDi+/e5XezNqrkE1vJbjGQVs1pxI1/QIq
 U0+e47S+rxReLJCBAoX8dL0lEINLdXgiCkSahIPGSJRXaj4Xd1amsqwKTAY/o34mRApGmNWdHu0/3
 3IX1NHYV5873+CnliVzGoj1WO165mLyAyp6E5lzm6kpWNMl9YEm1E0VR4DTSapikJlm0Uy3nT4oOI
 Utdo661w==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8bx-00HWHr-Vh
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:15:12 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 57FE2C0003;
 Tue,  2 Mar 2021 17:14:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dejin Zheng <zhengdejin5@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, nixiaoming@huawei.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mtd/next 2/8] mtd: ftl: Use module_mtd_blktrans to
 register driver
Date: Tue,  2 Mar 2021 18:14:38 +0100
Message-Id: <20210302171438.1704-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213164600.409061-3-zhengdejin5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 1f083af44d1911abf3df857c6e355a644f7861c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171512_026999_6FBA0B22 
X-CRM114-Status: UNSURE (   4.36  )
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

On Sat, 2021-02-13 at 16:45:54 UTC, Dejin Zheng wrote:
> Removing some boilerplate by using module_mtd_blktrans instead of calling
> register and unregister in the otherwise empty init/exit functions.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
