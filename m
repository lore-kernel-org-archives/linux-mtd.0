Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B9AC10DC1
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTDiOnNQuz/58bYlEjiy92t/3L9YKigiKDZ3YK5lGRA=; b=kwOb8cDhUOG+a/
	+AgM8wEFIAAlk/FsrA9jzN+qJQLSJm6AN7zveTH8XI/C+KMmcH9rEgyeVObVna61PNLNaRZOEnfh8
	QoPdOkCa+8kfzeFKQZgy7zK/9K1Q4+pNBwwYGv8njpfafGycaqxzU3EcOnxLaSkdau1rmZ0jxE9lK
	TUzanGcTqQU4m7q6RewRE8CirAdBv6MC55YbAkY1oersh/xaF2Tw/TkgmOqC9kBtcHFQzt4fHsoZN
	z14zWaH3yLRTmtnji6yOcPMeQz22hujeAYD/j9fBs5jfqGET6OEDvqJcyEgm1qvh10aZnMuTYsBo7
	8ZCp1sSRU7g/n7j+wMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePZ-00ASw7-0i;
	Thu, 30 Nov 2023 10:36:49 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ePV-00ASt9-0M
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 10:36:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32BC160004;
	Thu, 30 Nov 2023 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701340602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vD6NzcOjgtTtJsTzF2WOxi5yJUg/3VS2nIW03qLJHts=;
	b=nHiWyfrEn7/XnSCyyIuVvBA417mXeWm5/NwO0X8fcYTcSl70shKbqkqQFJf6rL25UQxQy7
	KhOq+eTMiI7OuH9FFQMiFBwN1hNgHERX6v9M/Ea5X2nrFDmyMh9G7wrm1IafJT3LdVjOa0
	MlxIZnTUE+wKCtMi1+GrOe31s5CBmiYoDNf33K6CddrPJeDIZVQ/6ghwVVRwowACwduG7+
	jT/uqfzpLG1CaSY/3mCabqbfbpfnoXa3thc5qNFB+3EjAsFj2whhQjN1MoVfYA5J7GQP9r
	4w/kW/WQeg6b8VGLKeyHW12zEfBzNJ3DaF9bvs8fZFVE3qloXVns5Y+WFOB9Mg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan@broadcom.com,
	miquel.raynal@bootlin.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Adam Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH v5 2/4] mtd: rawnand: NAND controller write protect
Date: Thu, 30 Nov 2023 11:36:37 +0100
Message-Id: <20231130103637.715341-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125012438.15191-2-dregan@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'42ae3f2b5f4942e0d36201184a1b5366d9430c73'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_023645_280995_D3F6B570 
X-CRM114-Status: UNSURE (   5.92  )
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

On Sat, 2023-11-25 at 01:24:36 UTC, dregan@broadcom.com wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Allow NAND controller to be responsible for write protect pin
> handling during fast path and exec_op destructive operation
> when controller_wp flag is set.
> 
> Signed-off-by: David Regan <dregan@broadcom.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
