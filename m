Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B75C6FA8E
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niyIwemewGf19QtXyXCtvpHd9zJiat+R2zEmoDc+R9M=; b=wPCLh1gs7s7eQC
	BGZX0th5BSdhMkyb1Aff6EQEQ43Fz+CaCG2bpe4lzhBEM3GhveTYKeH8uMktoDn8hFJAmQJraMCGX
	FmT9JBd65ifSUtdjWmPLXw5+TAWhRtAPHdnnvWd1+usaf63hOnrsGarv+AjSvCd8wTjTEcmGU5JCd
	IhwPwAzDgse/1X+IPvMrIXJRXpvr50fXJc5NoODdfZ1I8t5SitwA8iuTOEFa2+shJXj4LnBpNIM8K
	oSiA7/TZXC3iVHDtkJibpqxbOmsc9ToN7nYBa1+AZ8q8UWcWFdmI2y4rJFEVpTXypf4U9qN3nweEg
	UmYJi5VXCB9iW2/wAZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYMK-001eGX-9w; Tue, 20 Sep 2022 08:12:00 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLn-001dfT-TO
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:11:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 06EBDE000A;
	Tue, 20 Sep 2022 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLv3hj1Tsn8EelPyfLGCe76SE3qvwrAeSW4QMUv6Rqc=;
	b=eccv/PJhYL7vsR4alZyrFVfhyZa2qMJN2/hha4VKAc4hOva90SRk/QVuvCx8LMRAZxQe37
	wZolilxFs1xxjoYDzQVaR0+9fhJfjGBYjWmVbLJBsKbhp4eu1S5UrwuaY4psfIFbYyyJbW
	/N+S4PrV6QxixpTTGtiYvG/gWRqgxWijfY4nv7q5GF+MCmROfzJnGEV09I0F5XvSwfMCek
	VtxXYfhv8//bWxJZlW6eT7PwCp0QY46nKcxY945b8FyUZ01MdfUQGhNbp66J9JspWgv1gh
	cxokQ3C3TPNUGCc3+nzTfYgJbG9OAmtRx4b6whtbRHIb/wcSNRvvF2BPvHaTvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Valentin Korenblit <vkorenblit@sequans.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	piotrs@cadence.com,
	yuehaibing@huawei.com,
	gomonovych@gmail.com,
	liushixin2@huawei.com
Subject: Re: [PATCH 1/1] mtd: rawnand: cadence: support 64-bit slave dma interface
Date: Tue, 20 Sep 2022 10:11:23 +0200
Message-Id: <20220920081123.597488-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708135247.26122-1-vkorenblit@sequans.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7e7dc04774b18c0e42ce74aa3357021cda979674'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011128_137306_EF280398 
X-CRM114-Status: UNSURE (   4.99  )
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

On Fri, 2022-07-08 at 13:52:47 UTC, Valentin Korenblit wrote:
> 32-bit accesses on 64-bit sdma trigger sdma_err in intr_status register.
> 
> Check dma capabilities before reading/writing from/to sdma interface.
> 
> Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
