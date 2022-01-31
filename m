Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8DDC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhUaLOyL4+mtCfwmx+tz/PKbUBPEg7j4mYlITDMXYkQ=; b=jVV+qeeaIjjUxu
	qEoBmz/0wF57HrKFXiwJCS0Jr2sT+z8IrdJdBQ8sJF2irlcPuIfi/4hzV4XkhIPdX2DfoyOXluoPl
	z6fLK6GwU8zJEH4rk0nAKl6TT1LCBm+frfzpXtsGXq1AiGpCkqD0sHBKAbMS2p57M5ruZldOc5Fhp
	CJX+bzAsTwo/6+m4wXLcqnzPp5Kn9H1+aYjy445fZyjljEO+1E5bGecgyF/QqOo3qUU0esV1HcuBX
	xYoQSV6gnRWLvOLC0OiUsiK7SuRIe/Z+FMVa2UE0FXkSF2vxNsk4REd7eREWHsFR8+QbQqPTw0IA+
	SPgWPInW60tRIFh2OqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZQx-009pf4-CW; Mon, 31 Jan 2022 16:21:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZQt-009pdf-OY
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 16:21:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 78A9DFF808;
 Mon, 31 Jan 2022 16:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643646093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foKlbKD1flw52xvkKhlCCQOxu1k1h+lVg1GUmH6+Qlg=;
 b=SLLpFye4I0za6ZbGwXSjx6LmA5FgVoAzu3gmuLaxq7+FJ6EgB3JrWZDZTfR2e492UzRjbg
 1iZLiLZWxhQt4JPodFrgKYWvALbRF3psxIoy/qm7r+Yx86kXTMId0VKcbeVLd0p6isQ6Is
 sYPlWMuBTiX2XbpgA9JNrl9kAiEwDVfENRY6kxFU3uQhrognwAMIRLOSeAJWVEXN9P2iRI
 Sz93KTl1PwZBNNnqbhgveMKExK0Jg8zK28FetCoA1kV9+GWhwEA/ugLycrj9GeJk+Rwen2
 gKEXx7FEX1SFZQbFNSQcbWxYPLH7McXidehBvy7Ot8e5M4ax7tWXEkATtH9eOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: Fix misuses of of_match_node()
Date: Mon, 31 Jan 2022 17:21:31 +0100
Message-Id: <20220131162131.23450-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127110802.1064963-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e02dacd3a26d5e5d3913650d3d6d939ebf77fd5c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_082135_956644_0F2248AC 
X-CRM114-Status: UNSURE (   7.02  )
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

On Thu, 2022-01-27 at 11:08:02 UTC, Miquel Raynal wrote:
> On non-OF enabled platforms (CONFIG_OF is not set), of_match_node() will
> expand to NULL. The of_device_id array pointed by the macro will then be
> left unused. Let's mark the array __maybe_unused in this case to prevent
> compiler warnings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
