Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD3AC25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBXcmdlWw/k6anuPvxQuXUbPe33jkkuwyvaVS+cRREs=; b=rdEnFSs92oZJ+r
	wDcD858j6wPDuN63wkQhDo+38vjc2+TbTJTFg7A41eFcYWHe3p9ET5xmIlS9371Q0WXreELsrhg/G
	a7A536BjBuV2fAUliAEcdtNuY3ApbrsRngy+nAXa3g21CGn86zt1W4dMAY2m36Ut3EPkEIZxlKXSY
	1g84BB5iMwiPEvPNxYLgvzxmvRojZ15y0Dly3jojZvyQ5NydE++JJ/gYLHf1oZjnVSSLaYH9+BHTf
	k5xucO3Vk65XW7KuW2urSH3tZhm9cQPFrcbHUaVmCl3PWeTAJXOR194CVPSvFjzpqnPkWe+6m0Pjj
	jWTHstR4LcyKhhF/z3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZHT-0000000EpGi-2qGr;
	Mon, 27 May 2024 12:16:47 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZHP-0000000EpDn-2G8e
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:16:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA7171C0009;
	Mon, 27 May 2024 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+pTexNnoi2rCugZBXqMjjTiJGuY+cdZad02BzfGqoE=;
	b=l/Hk6T5pn2De9E6jOnwCSc6eG58e00A9vohb+VB2G1BGtcVFQ0+HbNCad2x2X1J4Z/cRpW
	g5g5rRt1jg8czZ5FElP0w57pTzVs8zZLeLzCY1t9aDAkkNBnsb4/al6ezlvICJG4injp3H
	Gfu9rpz+PC5yUB2gEJ79pbDxJzb892m4L5Cv4v4aokye/SRKsJxncTdViGf/57yNx8d3nI
	FalV7Txy+Oiyakie2P4SR7ftw3NAXvuLzS8s6gSfvJDGZNWw0EPXBYQshMJmBU/XeG7szT
	7dAvNXBhxSp0/xU8313R+PcIbETDiQI64ULXya+V6FQbZ0VtfXRU3bWexFB/mw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: cfi: Get rid of redundant 'else'
Date: Mon, 27 May 2024 14:16:38 +0200
Message-Id: <20240527121638.104039-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503184230.2927283-1-andriy.shevchenko@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5350f6ec55df381cd99db2a6bde283328fb3f75a'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051643_743826_7555075C 
X-CRM114-Status: UNSURE (   8.12  )
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

On Fri, 2024-05-03 at 18:42:30 UTC, Andy Shevchenko wrote:
> In the snippets like the following
> 
> 	if (...)
> 		return / goto / break / continue ...;
> 	else
> 		...
> 
> the 'else' is redundant. Get rid of it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
