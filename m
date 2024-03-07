Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5347C54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTjpknDcrmRca3t2fuT8e7ggGWW0zlUeAAbOHMWIaAM=; b=IXaQjYxvIYqQbB
	dB7Ni52k0uWz69FPPg0Z47M5DajGx3tP+AojeLltdqvH0LhaQ1Ycnnwr75Llmv6cIGAr5SITi9x32
	RjSq97y6jUYmpxuP2nhe908wFZLdhgpBebfxNwjOpQjvqyynr9ZfOqSqRV2YxDOyA141WmbFbRp+m
	Q3J8zF9HybWGkmykJKtTJkB5aERBC85DCvNei1XRKhumPDtI9P7ClLAv5FMyjIfw51HK9/m6a/pGi
	8ZWiQMkkL6F5jFQCh4JZxtjN8HkMPetq5KV7giVOSuk3kVw6bdW/U0avjXBKVnwWEvNL/Lz8rbk7G
	pfkf0mMCQZgym55w3+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHXp-00000005gYK-3qt4;
	Thu, 07 Mar 2024 17:28:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHXl-00000005gWC-3Mk3;
	Thu, 07 Mar 2024 17:28:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C1DD51C0009;
	Thu,  7 Mar 2024 17:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709832511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gvqGNYjR4WC6GopVrnu5/4J2kVdfdEOltg3boap4Qro=;
	b=L6YDjfJd5Q+nUDymtN+wg7vcVQ7Ts0mKC8gAycf1oRGEhcuMOHZnYdQxVHwuFBgTwD3AeD
	8McWOKf4YvR+OgOT2XeO/xpCN9+cF2RfXgEqGxGbcZPWWbuaDgg5Al0m501qQ7t9QVioxr
	C+PByjymJ8XQ/lnmuFdRu9VonOfjPZTa2fFE1XfdtZ08dXM/ijSbPuM3AhwvUDivN1ANMs
	hTZ4p+BjwFztF2Mcmg8YH7f2GZDO3MJYkAiaJPWlqg28PulGFdDDJLzDxaKRYr+1mja4rY
	Zku1cba1FjB6HzIhXj+oavOMKMWvoi4gPj1WKbfDguD1s10MjYZmEK6dz3qKOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	kernel test robot <lkp@intel.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	David Regan <dregan@broadcom.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: fix sparse warnings
Date: Thu,  7 Mar 2024 18:28:27 +0100
Message-Id: <20240307172827.3453020-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240227190258.200929-1-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ea31fb60222262df8cf0e2c5c783097f90b7adea'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_092834_044897_F497E6D9 
X-CRM114-Status: UNSURE (   7.48  )
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

On Tue, 2024-02-27 at 19:02:57 UTC, William Zhang wrote:
> Fix the following sparse warnings:
> sparse warnings: (new ones prefixed by >>)
> >> drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:79:41: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse:
> cast removes address space '__iomem' of expression
>    drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse:
> cast removes address space '__iomem' of expression
> 
> Fixes: c52c16d1bee5 ("mtd: rawnand: brcmnand: Add BCMBCA read data bus interface")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402270940.gmVLVRg0-lkp@intel.com/
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
