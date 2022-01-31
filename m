Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C46C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Di1J/V44nI1WaW1aQ4MDX4npezwnlQYXnC6XOhL7/U=; b=42j4L2AzSR96rq
	A0Y9KJzbf8jBlvBR2UU9jcZbnYhYF6kCy2OTO17KhKvzXHe6yOJpWcQkiW4hFqZxxQZaIplHf6cnl
	zDKbZJSdCpJaAjnOOiTKQpLVIkwdxC8bkxx2XQVFLFVHjSMsSa9prF+CNd9BpyEJTTpAfn9N5irVq
	sHzWt1nNnAF2wnBMTZMTFGC/sxD6UNn7kRH8os3GS3y5FhlPS2Qvj5lrZS8n1XrysBCYDz4BUt2TT
	qwKOExKxSu8eZlKZ4JHN0h128xX4N6AMd4/OKJezRJUNG97t/eF4UXeSWCWcjFu3xruzJc7gl+kyQ
	xEiawcVSfyPrZDVx1I7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZS9-009q2g-UA; Mon, 31 Jan 2022 16:22:54 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZRA-009pij-O7
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:21:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id C383220000F;
 Mon, 31 Jan 2022 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDTeMeOOIw6olsfuxFu+Cxedy4z1OviP+2QO6mZOzh0=;
 b=n4gJ/GMrsQYbIyp83VTpluxmz32Jit+CuKylpBKfdD8qs6wm4pxG6KeHaNLft+Tw68554j
 749DnKCjpbyYwg+V3mITJmrx0UL6F+VuPCrEuBqsgv/NhzWdVMkXSG2cRWB77kn4ucsl+Q
 3/60LQ2Jtvc5FMH6QE430xxF/+cM9iQBSkTfafjDT0xXjiCwQrJ58gUaM0wONOYmeiz1ix
 s5mxlvF/wzWcCsqQ9gHXjI9aRiIzWrEa7pU/I5iPkuYQHN+doGEF+84Gl7W3pLHp7aRSSs
 EY+O29AO5W6DSFX6jKsBqRiCl1o77OTLS9AS07D6ElstgM0KYlLPDNei2OqW3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH v10 12/13] spi: mxic: Add support for direct mapping
Date: Mon, 31 Jan 2022 17:21:49 +0100
Message-Id: <20220131162149.23649-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-13-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'70cf0b339497d02d8a3e754ba8c1212b6ddace0f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082152_980325_EFE1CD13 
X-CRM114-Status: UNSURE (   6.18  )
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

On Thu, 2022-01-27 at 09:18:07 UTC, Miquel Raynal wrote:
> Implement the ->dirmap_create() and ->dirmap_read/write() hooks to
> provide a fast path for read and write accesses.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Zhengxun Li <zhengxunli@mxic.com.tw>
> Reviewed-by: Zhengxun Li <zhengxunli@mxic.com.tw>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-13-miquel.raynal@bootlin.com

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
