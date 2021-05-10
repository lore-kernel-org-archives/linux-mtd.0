Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C08C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:58:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F216193B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F216193B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dzJiRfMwgaS2hwo8YUeB9xiNZ9VuqfvO6GkPirV2kPI=; b=mi7tmao556IOnbBa6qfialRDN
	WipAzBsWQiEgLqpQwuLxXcGW/u2/617W/9ps3Bnjq3Jn+yordAfNxNq258jYCfvy4qXNCXwKh0apo
	/G9ykaEDfQHWUEsnwjN+icrqnxGJHNWnAY5vp6ekQlNg3VQIiF8eWWGdwWPAw0oWJ55YYZ7cVTA31
	fzXuF4DvCnQwCC7z0E3sVrslFbdMic0Qs1tL6sZznRz3ub+7hZTzsPKFKFZQSY0iWX5TwPd69tGgR
	qlOdNOEfK3PwioEoYfuhAgbjZpxbIc0sQhsN/8KDlD2Gn7t7/3Mh3NN3bM1wvQZYUaXmPuUCPIlzk
	i7G3gqxZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3cD-00E1MB-0q; Mon, 10 May 2021 10:58:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OG-00Dz0d-A8
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=I0I6b819TueHwiA8Fwt4ugua6g03+MlyOQdiSJLzkak=; b=bqJwi5mhw8L28BrPxBmFhCRqwL
 JrDR1pl4eVrBg/gHQRgPimexevXUPrWewLcwSoeMtKPNs0ZZY7f/KunpT5UmxvZ4H02ibCBunt/tU
 oERmOttkRAPiMYBh9zyPPMDbXa+B/fQIP8Qgr3D0FRAW3AYDGjRfYrSr3Y2l1eNafI6Oi7cGZts8U
 2j1AbOF+OBeSjwTVAhn4UdMPUGwa5CODWf1ADwUtwDUpZSFJ/o2qWl0tW4NVNhhBPeK0FYwvBdHdW
 fhr6bEhcxLnNKDpVc1lP2o1c7ple/tzvSC9M/3gOZehEAyEhn1ImzYSPblm1Rm/h9NrQk5SyH3OsK
 Us9m1AmA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3OD-008Ys1-FM
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:43:54 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 803171C000E;
 Mon, 10 May 2021 10:43:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtd_oobtest: Remove redundant assignment to err
Date: Mon, 10 May 2021 12:43:50 +0200
Message-Id: <20210510104350.11011-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1619346498-43617-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6500dc2bde937fb124a399211686e04b8ef9d44e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034353_667732_CF3919D5 
X-CRM114-Status: UNSURE (   8.85  )
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

On Sun, 2021-04-25 at 10:28:18 UTC, Jiapeng Chong wrote:
> Variable err is set to zero but this value is never read as it is
> overwritten with a new value later on, hence it is a redundant
> assignment and can be removed.
> 
> Cleans up the following clang-analyzer warning:
> 
> drivers/mtd/tests/oobtest.c:626:4: warning: Value stored to 'err' is
> never read [clang-analyzer-deadcode.DeadStores].
> 
> drivers/mtd/tests/oobtest.c:603:4: warning: Value stored to 'err' is
> never read [clang-analyzer-deadcode.DeadStores].
> 
> drivers/mtd/tests/oobtest.c:579:4: warning: Value stored to 'err' is
> never read [clang-analyzer-deadcode.DeadStores].
> 
> drivers/mtd/tests/oobtest.c:556:4: warning: Value stored to 'err' is
> never read [clang-analyzer-deadcode.DeadStores].
> 
> drivers/mtd/tests/oobtest.c:532:3: warning: Value stored to 'err' is
> never read [clang-analyzer-deadcode.DeadStores].
> 
> drivers/mtd/tests/oobtest.c:509:3: warning: Value stored to 'err' is
> never read [clang-analyzer-deadcode.DeadStores].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
