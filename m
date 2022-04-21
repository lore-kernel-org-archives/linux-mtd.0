Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61399C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y96fDP9SEVSFEql3m3GMdRYh1Huodt3M7gc/5DuAutc=; b=S3XLcodvK+lBOR
	jHcdk6yqhBjCFg0GtK4kuYZJZLUPLytno963Z1E0NI/rhrurMjy2Et+4BCDUjGCmmd7Qh/ZEV5D+Q
	+QP5lo8rhvUGwYkBoqJlEG/jvEbr5kkh2CVxVd0O8WMseElfaSXtpf8bE37nQmAVnCWqNkveR7fXU
	NUn8lYv67JkAU//cT8DO+1D+CyxR3XuGfToOc6OY+lxDS2uYUMbRy4l12gevdzvSBZdOtGBR8Kpl4
	jUAXB8EO/eEIiUI7xMo/Cd9LPQNgvjRidLTDEu60mI+dPT5eJ68ic44oBJ99E5Qr4ONzb1em2R/yk
	M//uSY+cIFPVdF2Pe2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRQ4-00C62d-Rf; Thu, 21 Apr 2022 07:40:04 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRNP-00C482-6H
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:37:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8F821BF216;
 Thu, 21 Apr 2022 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0Sm4Xz2dTAZCIP2aG40242xnWMl8eBIaOUNhSxdP1Q=;
 b=KWqUlTyJRVAwOsQev62w4lyZIPDZVaOiBYyei7VJv6sL4wkCvunPbGOQr/K9Z6NkjR9B9r
 X2A57140HWhOByKhxqKwvtXSsWE1VfIrevVfjaNkUdXoO/VBVz85aXHwRXe9MSeN6q4dTR
 Zjc4AdiWKXmfu7/9VTVUM2tONzTjBJ3P0SdezpeeQEyO9QJU5oEX8ouKIiQFmB7abkFLmg
 DnIIpKZn0+muKI9alPHsWpmPE1/ZT638fG1cnbVeG/DjdM9VL7AAQ6mErVvQui4FXuKrpd
 hUTnrPC/oOnJ7NBBexAFjM2r93sgFU+yolFhpF9+CbyDRFM2sdN8UTOilUUscg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheyu Ma <zheyuma97@gmail.com>, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: denali: Use managed device resources
Date: Thu, 21 Apr 2022 09:37:16 +0200
Message-Id: <20220421073716.72814-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220411125808.958276-1-zheyuma97@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3a745b51cddafade99aaea1b93aad31e9614e230'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003719_456901_3017CA69 
X-CRM114-Status: UNSURE (   8.40  )
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

On Mon, 2022-04-11 at 12:58:08 UTC, Zheyu Ma wrote:
> All of the resources used by this driver has managed interfaces, so use
> them. Otherwise we will get the following splat:
> 
> [    4.472703] denali-nand-pci 0000:00:05.0: timeout while waiting for irq 0x1000
> [    4.474071] denali-nand-pci: probe of 0000:00:05.0 failed with error -5
> [    4.473538] nand: No NAND device found
> [    4.474068] BUG: unable to handle page fault for address: ffffc90005000410
> [    4.475169] #PF: supervisor write access in kernel mode
> [    4.475579] #PF: error_code(0x0002) - not-present page
> [    4.478362] RIP: 0010:iowrite32+0x9/0x50
> [    4.486068] Call Trace:
> [    4.486269]  <IRQ>
> [    4.486443]  denali_isr+0x15b/0x300 [denali]
> [    4.486788]  ? denali_direct_write+0x50/0x50 [denali]
> [    4.487189]  __handle_irq_event_percpu+0x161/0x3b0
> [    4.487571]  handle_irq_event+0x7d/0x1b0
> [    4.487884]  handle_fasteoi_irq+0x2b0/0x770
> [    4.488219]  __common_interrupt+0xc8/0x1b0
> [    4.488549]  common_interrupt+0x9a/0xc0
> 
> Fixes: 93db446a424c ("mtd: nand: move raw NAND related code to the raw/ subdir")
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
