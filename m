Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04FFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDk8mM+UZDYZ3Y3jFu9CJzElgVqGbAiaVdDd0/w14KI=; b=FSlN8sVq1Rg5E5
	fTeQLhamzarN65+IOpOvQtsjueG6+zAzHV4ipI+MPSuW3vKKPRKXwCk++QhCno/9ZgLYrlMBFeAme
	RT8KA2XAwQuCG/M2S9NP3EeB9bfRphBiTB7WOFRk0lwqiizFrzWaMdFeK4yLQPqQPThLnILQ0y5yg
	uqk4pgYbwd7cYsQ/krEkHhR7ZtfzXUnLsvacojPw2RZm+M1WKj8dc8zahp1/n4npsMIPD9PdxnL6j
	W3OlpW3xM1dvVBiJT5R5VTH8qQQPHmKcHzMFPazvwJG0MevpDCp3MmvbT9rJlNPa/pkvHRnCeBN/F
	21SQ0RZVrlbIvy3SrGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myCEf-00A5qj-1T; Fri, 17 Dec 2021 12:21:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myCDB-00A5Dz-1A
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 12:19:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C08E5FF809;
 Fri, 17 Dec 2021 12:19:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at
Cc: vigneshr@ti.com, kishon@ti.com, nm@ti.com, tony@atomide.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mtd: rawnand: omap2: Allow build on K3 platforms
Date: Fri, 17 Dec 2021 13:19:41 +0100
Message-Id: <20211217121941.327886-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209090458.24830-3-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'35da0c45455346f9f34870276e875a49a0491c43'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_041945_234908_846BE33F 
X-CRM114-Status: UNSURE (   3.82  )
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

On Thu, 2021-12-09 at 09:04:54 UTC, Roger Quadros wrote:
> K3 platforms come with GPMC. Enable GPMC build for
> K3 platforms.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
