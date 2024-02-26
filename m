Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72F8C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFwIj6EaHUgV0yGkqwgxftHcHuvE0CHu/Ui1AH/6Uwk=; b=oxmbjG59O9LYd7
	cZUCV8Q86adQ4eYDVt1oAeMPLJD07CW1+UnJlBG6Z8Ap/bvOApPL1WVHOK2JE9flQ6FfZAZ0c/cTz
	Uf0rwVsh2H4Rm3nwlPw7GTftAK8eaQF0sShoAM877kwYzPXpnVt7BlimZaf/zzDQLkVU8Yg5Cuwh7
	qKQ3kZtOs5U2q58khCLjFLTYBcs4WdGjFvx1xcLg+En9ApPrfeiobvXyIGmygF++TIa7qkNY8XreI
	e0kfnzza7afFKObC4ixE3rndJYykC+jbZe/pyT8XndvnDdDHgBz6dJPIqVnWSMh17yVwtN1HM95S6
	GRPNrjSqZZA+XY4niiKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSl-000000008p3-1asm;
	Mon, 26 Feb 2024 10:43:59 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSH-000000008V0-3rui;
	Mon, 26 Feb 2024 10:43:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C683A40023;
	Mon, 26 Feb 2024 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iiDx69rBn44PBfSXRrZ4ojskwBHY1Kqig+sdNaTzSgE=;
	b=aY7rMA4yJ9RonYLN3+KQvxeTbm7aiwjhNJc1DB4cvydcuf1ak/b7E0tAZqa2iSCJSwVc1T
	mQ/MwCVu/bfpakOHnT04dXX9MZGoqZJjPbfiyNYEbraK+oZREWD2RN/wfgqPLCdHGSd4hy
	jmdR2mbu9upeHsboD6s/GmFg8tGzUw7k+VNzDhUMwTRPG0ZPR3ZuZgzDc6m1TPH8PKas7G
	lHL7WJ+ehxqYRUNsOhdT7E6/vcfDOJcUnHLLElDxDaehvGd9Qa11fXZMcjeQ0bZ2KRt7iO
	/bPFzPJZ4PCZm4/QaCiXm3t5l3J4+LGAlz/IHrfLzvJYsrBigbr3osOPXLh5Qg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: lpc32xx: use typedef for dma_filter_fn
Date: Mon, 26 Feb 2024 11:43:26 +0100
Message-Id: <20240226104326.489058-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208202113.630190-1-krzysztof.kozlowski@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f1d00496a15bcdfe54bdb54cf1e7f207d6ad9b79'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024330_547914_B3249768 
X-CRM114-Status: UNSURE (   4.88  )
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

On Thu, 2024-02-08 at 20:21:13 UTC, Krzysztof Kozlowski wrote:
> Use existing typedef for dma_filter_fn to avoid duplicating type
> definition.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
