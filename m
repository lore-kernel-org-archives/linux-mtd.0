Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48CEEB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDr2yehyYs/rwF+lI6CeDIxBCNMVUIvlns/U5g/R1+A=; b=DO3+aupv3EwdQs
	SowF/SIGuYE5MzbIO7p7wqI+DYvwYKhTPRIagCDZcArtOx0tOlJv8ltbuFvlS+O/dOCg4IMvGuwI7
	qgXdvOvHxueF+LTuQrkAaLzGNzQV/jKi2nxIsOjhU6MB7pQcBtyoym1qnBABUIrGFuPWPia6JL3eD
	05Ez+sWSCuu8LAs98KzKxznOR0R1nCvFwKZ/lK3qS8cgufdkQ5sxDScvABCjUaKze8Q11j72NVGli
	0UnySCsQB4+SCvlBjpr6V2x8rBHwmMu6JmZtTxjWwiHZvnIgDNFx9iWhvhfsuMHZv7AHJQPqs1sup
	DK5d6LHCrsiwLRhoen7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaaj-000A5m-1p;
	Wed, 12 Jul 2023 14:13:17 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaah-000A4T-0v
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:13:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38E3C2001B;
	Wed, 12 Jul 2023 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ta5ioCd7GqG6UJ1XPBF1f9YtfZ8DyGYbABEPInFPsyI=;
	b=oQj4RBnyoApVGd/PZk7cbPv8mPiYQ0gvuG+yz6MrEdKwFO7VQHpEsGx5geNMsxbw7/JR9+
	bRYQwxPHYnNbABsrbNj2rqy82lCqBGrnMiHHB9j8tvh9eHDCpw2C2gCbYAxEyeDUlAvkFd
	OutWTbcb5+5moWa19KIh2bouDsOFfWQvXmh6mjh43nuEXMiSTLz9o1gdTKFxlO32+KgRVL
	zde74yg0iIATnhOmX9MQth0dAtfLG1g/kcXgrGinBjXDr3jioWCNvp5tO2CUGfHbXtLtAe
	xcNi4UK1ftGwhivwcSAHFhEENMF3MyMarw9BfRCXcV7UQcNF2vv3jSxGZvbjLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/18] mtd: spear_smi: Convert to devm_platform_ioremap_resource()
Date: Wed, 12 Jul 2023 16:13:09 +0200
Message-Id: <20230712141309.354763-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-17-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'badd019b4a2a44815e976a0108dd8e52a1a24a83'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071315_475241_E55073CF 
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

On Fri, 2023-07-07 at 04:06:21 UTC, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
