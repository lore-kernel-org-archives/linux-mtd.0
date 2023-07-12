Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45810EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGbOHzzZjKyOaOJj8k0o6ycxhDLoENf9B/0I6AKhZyA=; b=yad7IW/Git68Ag
	iLr2PLe9BbIQ3Bskp0+2gMQKLlNBbMfS43zs4Wrxy4xhiLjXuN3YIvhQAw0c3DZQGXWpkJfIQ40nZ
	Za1QxTdelsjJtRpx7EmdJnRthlw1RJgqWp7O6uWK2WflVF7tdPRKI67XvGJnOVViNpOPIhIfjFbdy
	IIN2RrWp21Pa+D0a42XqNMUzwTZDGXXzC43oeTiqsMZXTBj+9BG3PGED0mA7ONdFughKJgyasq+Bq
	dXZZrTpaTkBV+Tft/f6efOm5/DBEha/ZvtLr/RLfFmrjTTv+kTk9aH2oKCeUz6xvRY6lszCDOWs7F
	hWUMNj/LgFALgL4rYXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJab3-000ACU-0g;
	Wed, 12 Jul 2023 14:13:37 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJab0-000ABI-1u
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:13:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B121E60009;
	Wed, 12 Jul 2023 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELmVEwfyQow51i4SwILFqMBHApGdkoRTmhhEzgBesiI=;
	b=ZvccUrp8Ez3RYDCvKj/4f4ZZ7QPMhUzMbPqdqLDtK2VKfRVtM5A2bmFvUVCW6E9PLgglTt
	JeXp7bkwz9a0IG+gXVbbQQ+y0QRbrFD1OMf3VaG8JmGNU7+V07EpJgsD7LSTKJsesz9mKx
	aBPjhFtQWxX+Y0U5OwmAsfJN1n9VqjRaVf9KV5flqaoG/GHIXQOkQ/ekaKUqWede0D/FUm
	khFoQk6dVSDm9E7SQ8ZHxzGbKsIs7w5SH6yYeDEGrOb9ZIGurnO1bN9mCW+PxGofkByROY
	sYGRUsheUR3nAdnkC0HtOMcMDYkzwTEw8XyLRCtB9uX+lUPR1dHQOdGuz8vjmg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/18] mtd: lpddr2_nvm: Convert to devm_platform_ioremap_resource()
Date: Wed, 12 Jul 2023 16:13:19 +0200
Message-Id: <20230712141319.354823-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-15-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a29f696aa96f94ced1655b183c9694920d8bbfe2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071334_754765_18EB9EE7 
X-CRM114-Status: UNSURE (   5.73  )
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

On Fri, 2023-07-07 at 04:06:19 UTC, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
