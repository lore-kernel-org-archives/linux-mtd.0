Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCE3C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 20:05:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A3C613CC
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 20:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A3C613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cap1g25ps1OnXlK4ekGfcLKuTGMXrhLENytt0BXZ0nw=; b=gz/yQVZWMzimFz
	SX9ZzkpQibI3fyR1H1Z3u5V4n9OWpLKcRMVCN0FzMmLxkWs2XK9Q1Ibb9DV37H1dLYo4y24WXenXX
	JNYYZamUjVMwkDflJtV74O7MPc8oayAMByAoCnZGdCtdLG9XE4mklMXmgcSSS64jPRqvBB3EX6rc0
	6LgohOq1hRNDrlUYfqGqgoic91I+ZINfvP9uSuA9o4swtenmIO3L+ps6ZcnXNTV3Cvv+/Is33JxWa
	cTNSNrKdZq0cVjfMLMw2ZY9QnbddJpejobhT1b/eOHB0+yGZtOq2cmD+I7exG9wHD80YI4y5pJxKN
	X1/ER5L4dsvC6CrsijlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrnOU-006oPB-Dg; Fri, 11 Jun 2021 20:04:42 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrmQx-006Yxd-Pw
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 19:03:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 157E6240006;
 Fri, 11 Jun 2021 19:03:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	daniel@zonque.org
Subject: Re: [PATCH -next] mtd: rawnand: marvell: add missing
 clk_disable_unprepare() on error in marvell_nfc_resume()
Date: Fri, 11 Jun 2021 21:03:05 +0200
Message-Id: <20210611190305.226637-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210601125814.3260364-1-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b6cc0d1e3ee3545c86024f57519c0d165424595c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_120312_026897_A1FD2CFF 
X-CRM114-Status: UNSURE (   4.39  )
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

On Tue, 2021-06-01 at 12:58:14 UTC, Yang Yingliang wrote:
> Add clk_disable_unprepare() on error path in marvell_nfc_resume().
> 
> Fixes: bd9c3f9b3c00 ("mtd: rawnand: marvell: add suspend and resume hooks")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
