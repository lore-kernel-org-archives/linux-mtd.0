Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF2C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17gvgqBWriHoBpVoxNBJOXTFPGnrvzdAIsol1n44kUg=; b=tjdlEfDfIQ7tq2
	Qdnt/LjC1SlbHSkX9XFLhWpb9V98T5wGfUQNpPVbZbSd4cmUFyTUqPI4F1raazrUGIhDOmlff5jj2
	m3pNQi5hpV/cbXqGa5p9L2MspLBUZqWObgTHJeXRg0zzsCpW7UdzsIWC1yDtfhdf+pxdEt2tpmcpY
	fMohqN79cF1WLx3uxY7GayNy0Vgq9Gq2mTqsnA014f1APp2uVzrdKYDN313ltkLJInC2Qq+WQi8CI
	0qnf3+EQL9gg8AYsx89xjwIU7tpchN29ofnUCDlqc2amXX5uFqX63ysbaDOjuTP52QuCxKf8qGW0N
	EL6NmgWiRw2kWflPkzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4Ja-00Eml4-6A; Fri, 18 Feb 2022 14:32:54 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4JW-00Emj0-8E
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 14:32:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6FF96000C;
 Fri, 18 Feb 2022 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645194766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqG26Ms+nCyJQFkDdv7qdOPbNCR+/tuROMVYtpDW7X4=;
 b=D9LPwQKnluzG9sWIJTQvS/yM99Bi7XXgV4WtxL32zDgenwVACaov8tBREYwdK044wrla7n
 7dfuUePlqtvliEq7+wYmRHVa0UXDs3LfvM/OPKOMLgKuZrKyL5F+lZdKpmSTESgcfb6gyZ
 MI7Y/U9VeopddbrHwJvoC/mI947YsRKxZ7B6fh2exVYph+0ZQjwcupmw1bfOm02c6o9TLA
 gZ8C+h4ZOwP6NNFo02P9OmquhuDzbQaRClzOGm2Xv4ssHJl0PiuSbIZGJO9j0x8pt2d1bX
 cW43r+5UnHEUQ6ERpNZxO7swdmxu48HFEGAPSvRR3zIwM8cEmy0XKXnQSh6eCQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: INAGAKI Hiroshi <musashino.open@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: rafal@milecki.pl, baruch@tkos.co.il, hauke@hauke-m.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: trx: allow to use on MediaTek MIPS SoCs
Date: Fri, 18 Feb 2022 15:32:44 +0100
Message-Id: <20220218143244.321862-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220213064045.1781-1-musashino.open@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2365f91c861cbfeef7141c69842848c7b2d3c2db'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_063250_464730_E331FFFD 
X-CRM114-Status: UNSURE (   5.82  )
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

On Sun, 2022-02-13 at 06:40:44 UTC, INAGAKI Hiroshi wrote:
> Buffalo sells some router devices which have trx-formatted firmware,
> based on MediaTek MIPS SoCs. To use parser_trx on those devices, add
> "RALINK" to dependency and allow to compile for MediaTek MIPS SoCs.
> 
> examples:
> 
> - WCR-1166DS  (MT7628)
> - WSR-1166DHP (MT7621)
> - WSR-2533DHP (MT7621)
> 
> Signed-off-by: INAGAKI Hiroshi <musashino.open@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
