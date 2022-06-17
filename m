Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0233DCCA47F
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jun 2022 06:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yxyi+8ek16O1+qGgN1l3rEMF1Lp250q7dFU9hMIpL8=; b=NYlj1lfsBo4qAa
	+8wxlmiqSPnkyheYXw/k7YqiZ+z3z9qQa665ZlkJzrxHXjwL7n/f8sw3zUOcV38pGnf9oxeuyYsee
	EGL1HuxmsDaCCSqPXKGkZCsSK2fUpM2Zkav7tG4SbYDyxP7dhr7XDWCNWH62dYDvc/sW7czWBDaOC
	fV76SWUlpzLKO5Yziw3aH/Glilbq49q3YwkMnMWFfiZuvO7bg+u3PMn7rGWPATZ6KT8wilWeyqDLu
	jNQ3+4DtWh7jlj2GguW02oHNA1v7Y7sX1eEL8PfKpd2QmxEPWluDyftGHoC27Y/38D9ZWdIZSsHY4
	n4v+bG7y+XeelKpNLYGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25Vw-005jRv-OF; Fri, 17 Jun 2022 06:31:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25Vt-005jQw-Dk
	for linux-mtd@lists.infradead.org; Fri, 17 Jun 2022 06:31:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BEE361BF211;
	Fri, 17 Jun 2022 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655447481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T1tVZgBV3BS0ceFgD+YF9Gee/DGk44tsKYH0k1uppnk=;
	b=VUVcoyT9pSozjb9BYHPWZXfBbhqE4y/2qKtQT2eOsDE1bbWJo4N63U5R2m4/liRqRbW/yJ
	L6AsmeF0B7MbfWdx0EQdt94l3zsvOpQr8jy4F/FjUtw0iGiwIYZ8leqVvOEMpoPnBbQgmH
	5XFvFp54mMtwUd6wybwCWz4ch5ynoeukFAl4kAsc+bWnbih0yw0HJ7V3d3WokJh2yE75IM
	lch1zustOgRMtk3s2GI8d5N7JIRK3w3mzS84EnexBntQ1jAVlu7HoaatbY6xAqSdF/fDrS
	+JHXN6DhpRnYGeGfigQCOO6OI9TvgoGLT1xgwGd648/hocOnuAAvLGDwh+l1hQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	csharper2005@gmail.com,
	drvlabo@gmail.com
Subject: Re: [PATCH -next] mtd: parsers: scpart: add missing of_node_put() in scpart_parse()
Date: Fri, 17 Jun 2022 08:31:19 +0200
Message-Id: <20220617063119.446659-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220617014008.851583-1-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'278811d5a7b2af4e737c88ab3137d3ccc0732ac1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_233125_648158_965903D1 
X-CRM114-Status: UNSURE (   5.15  )
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

On Fri, 2022-06-17 at 01:40:08 UTC, Yang Yingliang wrote:
> of_get_child_by_name() will increase the refcount of 'ofpart_node',
> so add of_node_put() after using it to avoid refcount leak.
> 
> Fixes: 9b78ef0c7997 ("mtd: parsers: add support for Sercomm partitions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
