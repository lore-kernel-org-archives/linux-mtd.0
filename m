Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4BAC6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf66z9BHjpB5f9dT0MYZHzcXFCh1ri8K78MxgLZIKRw=; b=CtKWsHgVbDloZh
	T+fz3fCe8s+4+riCoD/5hdqXR5cPQGiuYUuAhUuRshp8JDdMy+dNAN+1YKAES9qVBscF1WiHacQOz
	8R48mNGgFyBeQi62b47cdqITN5QNE2fT91cuiggWg/8d1fUkz/zQ7SsXisVV7TPUF+PeL+kkj5S3W
	VgkAlBIeCYeYmEBWLMNL182tdrA60xibVI/JCPygd5yPAEkGAHODCCD1QUYnjb+eQZ2dfQasfc1u3
	D5y4Ky9wW4bXMVAKUa2L1drvpeEpNydOdKK76JJnLJAD5QCSIn0TgbsdlQKi8JXxUem8Qm8cZ8iD1
	gmB9WlTWjZXUH/BPFrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf11O-00Gbvq-1g;
	Wed, 22 Mar 2023 16:09:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf113-00GbcB-1J
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 16:08:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF9061BF20D;
	Wed, 22 Mar 2023 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PSmnxBcZaUN7gsWHWZ45hdp2vXlK1DT4al4TDhvtl0=;
	b=Vcy9+zDUUhG2rn8iTHsAKvO4V15dpsX94dRn8OkrHPjFyLXe6ywWgPbEPvusnyMYH83Q97
	tCQOmTrZ1QcXbh3HZjJ4zYRu4tyyvNoZL2WRA95hzgT+EaIOdLuxFDbjOS+TMApsc79d1E
	Jw0delv/2t3kli1J9Z18PCMXo2myl74EE/QERYaiKu2MWG3XEM9lSOy/Bc4PpynWLKSECi
	UC7w0ZxbhROnrZGgnMiOlnxjBn/Ub8+UbKPPNq3V+tyw4q/M4Z+W7vbR3UVmY4DN2gdKCl
	515mFRhlCtFGdgLnoHWcwXtvJGgMnYLVbVO9KbQ/z+wJMGPZFfg3Y8Gu/ZcwZw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tom Rix <trix@redhat.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: remove unused is_imx51_nfc and imx53_nfc functions
Date: Wed, 22 Mar 2023 17:08:38 +0100
Message-Id: <20230322160838.2232894-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321114638.1782086-1-trix@redhat.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'cb70cf99abae487941bbb5d3661653c02a5103cc'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090845_588844_BB84EDB5 
X-CRM114-Status: UNSURE (   6.14  )
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

On Tue, 2023-03-21 at 11:46:38 UTC, Tom Rix wrote:
> clang with W=1 reports
> drivers/mtd/nand/raw/mxc_nand.c:1602:19: error: unused function
>   'is_imx51_nfc' [-Werror,-Wunused-function]
> static inline int is_imx51_nfc(struct mxc_nand_host *host)
>                   ^
> drivers/mtd/nand/raw/mxc_nand.c:1607:19: error: unused function
>   'is_imx53_nfc' [-Werror,-Wunused-function]
> static inline int is_imx53_nfc(struct mxc_nand_host *host)
>                   ^
> These functions are not used, so remove them.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
