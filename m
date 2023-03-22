Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8522C76195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG73ah8mL6tUrpte6qg5/eKMMrwJIrGIa1A2GF3PzJU=; b=zz2o4F33XcqkB0
	dUw/9ZenlOP54wQ9Xg+Bf/x0v+nRRtCW4duSJm6AjNIDxoiPiDVDMKW6kGyL3U/CVKIuNE1AKjqWj
	JtAD3HgWGznHenlFLpEUSU+LPojl3A3xkRVMRGhWOUL8cdH0ALnKnhw0galSxaiu8T8CzV1LgceYC
	lin5ttOhZR/jfKjF9lZ9uIiGmoXq7kFj5g9TgnkI6ZhmDkI6Oni82PjcnWiDzEAnAhMPMXk1gZh9n
	iMyq/icDbRX1oA03D9pdtrQslldc5snfTtQqDqL6hO9IeaueFWm157F0EXU8YiIlqPdzfwy3m1dLc
	fe8WE5ZAIvQHuqXtETqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf11M-00GbuP-1A;
	Wed, 22 Mar 2023 16:09:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10v-00GbYd-0V
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 16:08:39 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BDB6F24000D;
	Wed, 22 Mar 2023 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2cqPqiiXUnLRrvg7EXLCXB7phDabOi9CfV7wq6/u7k=;
	b=hxmba1p0qPMhPp6nf3oJ+gTcGks9TnfkMCIb2yi81ZeEHXAI2Nc51P8rdLJAjSxTW8/pQz
	b0+LV4If/dLWYzcSgUexHy3u63MoknbEjclS0WmFLaKI5XsTBueoxF+pqtA+rfc91dkPUH
	kWkBVBuRClCnYRAKiKe5TxBl+P4mVFq1oXX5W9mG31O9+amkWgZz0DE4esAysdzRGLH7Lw
	yLH/vTv1rv5ocFfU4X6aniiW0yTWs7SBZQdevZCCwPV8ftMwHK05trSIk3OT3vVuwVc17W
	bjqov6648UkoONABAalux5FZTajGAkJ22WiuWYTlHXFh1Pno5I0sKYtX8dgZ6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: Avoid printing error messages on probe deferrals
Date: Wed, 22 Mar 2023 17:08:34 +0100
Message-Id: <20230322160834.2232864-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307192506.439532-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5cab06156aade17fbee2fd926bce8c503e55b2b5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090837_555105_B5658AD2 
X-CRM114-Status: UNSURE (   5.86  )
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

On Tue, 2023-03-07 at 19:25:06 UTC, Miquel Raynal wrote:
> There is no reason to complain about probe errors in case of deferrals.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
