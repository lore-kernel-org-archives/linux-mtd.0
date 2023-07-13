Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DF9C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCTYjzMsEvWjq1A8/zxQnYIvNFvjnfGEZqT+Pmzv/c4=; b=kUPv4d+ed8FVLv
	1t8nTnLNfvVbks3qFqjuDLyPXz3JkNYxQa8ljF4OPZOVAQFr61ymaONEjNBeDZsJbun8BUujxKTQZ
	POIj/1ibbLcy16zIhyV6DZnaNaxjaao8vrH+LrRX1RMBsUzgd3d2lNz2L76ad19sCcgx1TBASpdBq
	8PPejsEBEmv7Z0Lir3Mc1yvzE7JBQO703AHGJrXkQC/XbqmrJKKRKY/0Zrz6DNSiez+34amT+uOdQ
	FPPydYICZA0WA9PaCLvYh7FyCdYswXsbpDFa+n4dPmz1vR3WAQq6yzCzWHIoNop6/IYtqn9GlWca/
	TGweEBw8HS8hco6gBehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDq-002K88-2B;
	Thu, 13 Jul 2023 07:58:46 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDi-002JzE-1h
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22C3FC0012;
	Thu, 13 Jul 2023 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uAX8nljdTOdMazFudy7wuOfDuiEUUT5Bfk0pliYEkac=;
	b=nMwlXSalPIIAWtUgJTfi/Yre/CCnLsO9qIeQRH2X9XbMFMEBtdhvbHJUuUL1PS6VUcCIm/
	/Ji983bKWzgTjpJ2p57MpGVBlDAtlHdanszczWbP8UtzHDIOL4PfjDiV+EHeWa9oPN5JxM
	Fd7CbTV43vnBCEv9dFd8J5xBqS/OucVPmesGMJVLtodx+XCCBvF2o7xlO5Rdo4kk9EaqHz
	AplBDIDxSojMGnkRrsTMTwyvlKpNBizoLeh3R98lUluUimUk67PG/RF31jf+1q440JI4GP
	Y0+GaVH+Olv8jQZL7vrrqo0sTqS+crFhOoRNDMMOwSBbdwQ4Apl86UpaSzpvww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: William Zhang <william.zhang@broadcom.com>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v4 4/5] mtd: rawnand: brcmnand: Fix potential out-of-bounds access in oob write
Date: Thu, 13 Jul 2023 09:58:34 +0200
Message-Id: <20230713075834.486478-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230706182909.79151-5-william.zhang@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5d53244186c9ac58cb88d76a0958ca55b83a15cd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005838_752418_74209826 
X-CRM114-Status: UNSURE (   9.02  )
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

On Thu, 2023-07-06 at 18:29:08 UTC, William Zhang wrote:
> When the oob buffer length is not in multiple of words, the oob write
> function does out-of-bounds read on the oob source buffer at the last
> iteration. Fix that by always checking length limit on the oob buffer
> read and fill with 0xff when reaching the end of the buffer to the oob
> registers.
> 
> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
