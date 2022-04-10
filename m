Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB5C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Apr 2022 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPTMhxiIp7Cz8qEHO9kekWPRkocHSgv3Kgby7U+Hy28=; b=AflWwJYtJlRc8u
	YqJnVQhuY5mqjKAwiKgfEYzlGf1uGAsflj1YuN/nYhwdu17A6Ipn80F4VNkPSU1w0Wl7DGsHjoenP
	2rS7ehv2GifYDbf44JxgZr4jBgvjWxr2CMvkdYSZgCuGII2Bg36k2TTufTFU9KrCMh73QKp2uleBV
	ZpfUHQWQCpj9EBtiWPrcSDtyXtL8KQt7YRPliYJwXjIt6OIWOBJWoNGxnwrfjei3SEphhbaWte1jL
	PmplOgMYSkQcJpJCpYMdPe8aHnljea7cBr0ihUuxFxljzKkuCtfFcvBpuk2HHVwOIjup1glj7/w3A
	V317Yak8OYBgzhKGpI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndYNy-004x2E-Uf; Sun, 10 Apr 2022 14:17:50 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndYNw-004x1p-Cn
 for linux-mtd@lists.infradead.org; Sun, 10 Apr 2022 14:17:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id f3so12432507pfe.2
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2022 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FMBgmq8WKX+31y3rGclfHeDGwB3PfPowydFLKHwFCfQ=;
 b=mLvHvlFkv6OT+7/x+LeJDrtZZr8fRBhJJ2mgrN717MhJA26x5JO4ysK2LM7P81ymhR
 k4glu0J8QDC6TPkV0AXEmKQvwzr8DyzKNLF/fk94lOB0nfuJA1p7pkCz5/+R6hH3pGT3
 37/cPCRNJDKj53Rgn/ktsG2VJznD+UqYBNdbGBJEcZ+Jh+kKugSo8bqNLThh4I0vQ594
 sBnuA6K5kOJtUNHzd56qIo1TQP66ntFROjh80n6+M6A1bLhS7w6K07qhZGdSC+1Yqmmm
 vWyVeteSS5VhXpBvGE90hD5i2nn0phU/lJkBHm7tSKAp3plwCB+ftCUP/h/BYrZtYdg3
 Vg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FMBgmq8WKX+31y3rGclfHeDGwB3PfPowydFLKHwFCfQ=;
 b=bx9wN4VlsocecoS4tkw8ggL+e5/IiBos9lr6YrIq5DkCo7ZEAdG7oyRIuIe4A+APxj
 HMwqZC6IhCSNsgyIOj6DMdhG1tzW+sUJDRuKFtcpQjccx+JqdmZXv3VOE/Uawijyu5Ws
 Xwbz0o9HE4OFspgSWWledNSxQSdfY5kcNxI6EFzb9fJ+oMuY/UX3EZb7bUg75FbMnAuY
 0mao+SLxZUWJn6R94r+Isifm9+j5fzZIMa+Afs0VTGKNs/kijryHzouY1BrVtTRhQmYQ
 KcSyRGa5842dVg+v5ai6jZWqxrXvSfyDiCtPaV/TtVFYV/YUGhAhvgSw4eo0Iee2unsA
 ScTw==
X-Gm-Message-State: AOAM533dH4TmLo6ls/E7OOQ3zrQHz5A3/yQIDGJL3pPn+LAnP/zY84AG
 GJhq1ahvjtDGGST8Nd4x301M4mBObFyUybGsGZTBXcZqOxrKBkE=
X-Google-Smtp-Source: ABdhPJznr7MjkdWgQf2yJa7FooAbfWqjAnQjRrdpSS6+CnEn4MUZoHzPicnQcAWZ5sW1Z0LFsgLUyp7RqWNXpTFZQyI=
X-Received: by 2002:a05:6a00:ad0:b0:4f7:a357:6899 with SMTP id
 c16-20020a056a000ad000b004f7a3576899mr28594362pfl.80.1649600266651; Sun, 10
 Apr 2022 07:17:46 -0700 (PDT)
MIME-Version: 1.0
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Sun, 10 Apr 2022 22:17:35 +0800
Message-ID: <CAMhUBjn40pO7A=icudFKOoiMrckcH_o7mdi-uCmgCFHi6Ueuzw@mail.gmail.com>
Subject: [BUG] mtd: rawnand: denali_pci: page fault when probing fails
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_071748_484184_17F10A4D 
X-CRM114-Status: UNSURE (   6.05  )
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

Hello,

I found a bug in the denali_pci module.
When the driver fails to probe, we will get the following splat:

[    4.472703] denali-nand-pci 0000:00:05.0: timeout while waiting for
irq 0x1000
[    4.474071] denali-nand-pci: probe of 0000:00:05.0 failed with error -5
[    4.473538] nand: No NAND device found
[    4.474068] BUG: unable to handle page fault for address:
ffffc90005000410
[    4.475169] #PF: supervisor write access in kernel mode
[    4.475579] #PF: error_code(0x0002) - not-present page
[    4.478362] RIP: 0010:iowrite32+0x9/0x50
[    4.486068] Call Trace:
[    4.486269]  <IRQ>
[    4.486443]  denali_isr+0x15b/0x300 [denali]
[    4.486788]  ? denali_direct_write+0x50/0x50 [denali]
[    4.487189]  __handle_irq_event_percpu+0x161/0x3b0
[    4.487571]  handle_irq_event+0x7d/0x1b0
[    4.487884]  handle_fasteoi_irq+0x2b0/0x770
[    4.488219]  __common_interrupt+0xc8/0x1b0
[    4.488549]  common_interrupt+0x9a/0xc0

It seems that the driver unmap the memory region before disabling the irq.

Regards,
Zheyu Ma

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
