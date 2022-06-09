Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C117EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5ScTYjQ0fdqWet06tx7uv5QG6JJ5l3aSa9td9h5wsk=; b=o8oFyPdaFKNTrD
	EbJdyY8ajYbfGMt0OzgAvemhIDRCVrKXsSrdSA8V6ija9TVoEVmt+An0ahvndrr0aZPF1ogHeVx7d
	TZ4asWxCxEJ9/xp2XppF02P4VSVsaSpuv1K1v07FvwVnruQIPMCm+c2YqI6v5QswpHllUE5y+0hVT
	I+m5+7sP04wYX30MAhThHjqPLp96Xy7kH4NoQtS6VWY4gnC179OSNQOc6WNrlDAtnAesXIP5SrSQn
	1KvE1FaqpakuzOoqAu75DSI8Z1/uztqyvMZUG8IFyQbYJHGkf0gKiNhOMF+1En66A9+7e+3mVDojR
	oPIbPyW7wAM9cBxzkTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHVv-001q9z-Qp; Thu, 09 Jun 2022 12:43:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHVB-001phV-FN; Thu, 09 Jun 2022 12:43:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 138A1FF809;
	Thu,  9 Jun 2022 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nh1UKK3uyNrH1iUfVE+joZpnh8MNcC8j9ct+8ypJk6k=;
	b=VkTw0SskS0M+TzRZihBsjVCjSeIzjHkS/C9SS1ZaqAkVbS08Pcoe3q0mFI3p2v3fZk+ycb
	F6n6ClM4/EoVcRDErsK4sLyMAHM8n1wbKogIVO1jPBzr24macRRuhoaVgpMTKWt8L8gDDZ
	shFiW6eE5LOVkePyW11D0LDJWirnuoHehhQNQ7H339YHNjwF7Bt1GcjdLMu8sqlWFmxJG4
	a1fQWnBOtixmCS1FQoTkzkEsoGTIq64YANYLs8dWdwcB9IViJfBccFiM3ZIlralVafHPjD
	slnJn44xdUFRPsvWf8giArI5kFYMREhq0fXptZn47eTgF7DdJCbNe0xRk/C+Bw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: Fix refcount leak in of_flash_probe_versatile
Date: Thu,  9 Jun 2022 14:43:02 +0200
Message-Id: <20220609124302.133097-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523140205.48625-1-linmq006@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'33ec82a6d2b119938f26e5c8040ed5d92378eb54'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054305_756594_7D824E5C 
X-CRM114-Status: UNSURE (   7.96  )
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

On Mon, 2022-05-23 at 14:02:05 UTC, Miaoqian Lin wrote:
> of_find_matching_node_and_match() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
