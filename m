Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138D606A323
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vwHWE9f8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q+vVFqTY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EU6GOMvwC/ejyH5SW/yIZEtgE6lAFf1F/Id65l4CWgY=; b=vwHWE9f8X/y2R1GkvtzVBX3+1W
	fIXKc5S0psxBou2EeHpbNrDzVxuaJED+i4EG2fRDmwm78h3YOcVyJ1wTlKA0XhtsMWN6THP21eY25
	uZiQjaaBEAvGawIkABdRqXnP0vLd3/AQ394gEeFne3d576Fyzv/uKBoNrTHrbNob1BkL1Z2ErJuGm
	cFfw6C2I18BtZNiYnq85lJFvAAV05GLo1ExzXakydvsqH5pekcI3JztdjW8mt343swg6OASnPcwW9
	c8Iskvp0N/MZawAdzg0DP3JmZzl52QinXbUdMc4JbL82blTrR7rTP7rvT2/UfreMqAyxIFCw2S6lH
	fnYeXuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWx-00000009iwU-3Ivf;
	Wed, 25 Nov 2026 11:51:19 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBWr-00000009irc-3JYB
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 11:51:18 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso3370466a91.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 03:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607473; x=1796212273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sH6WVZwCKWinPGsMJopSD99+J9jVwHYkDOAjL9AsNM=;
        b=q+vVFqTY8MZor58IyxafUFyBG65Zgt5G/khWSZDGS1XjAswUFraoHtHAsLp8hEE2td
         H4nKRSDjddNgUypIPgO4h33zdy+G5XYuWNNKz7UDxDJBhGaxfP87SEIoGs9zmis5YuZI
         c2b3BsD9RaiAaTgqo/rNmm9yRp+DRMLDu+RUZLVJ09k16v0tk+OvjSBmlQIqxRnTHoHA
         ybHv56V/CbOiYheQAqKoM7qchQDYHT1a5mYVE6Uns2KxlQZYOA1rMFnfXmDw0FxUB1Np
         MZuGxTBClEL1TLNvSia9BBpcSFLJDDw7wqtaA+WGRY4CVeist2FzCtZT4VjtjgqW+oo2
         hyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607473; x=1796212273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sH6WVZwCKWinPGsMJopSD99+J9jVwHYkDOAjL9AsNM=;
        b=mDaFCe2D5T8Tje4Q++qSTMHoofbwesG0TLLTfqkY++fhsdaLulc7hRZ326ly650wxW
         h5D2Ky7L6P/bYroMXbPePxIYnhOZZuWp60XStIk1tF0GPArjHEpDEDwU9I7fa5IIpLTk
         PEjlNmkPmvpulZeLwI9uBSt5DbPUe+f0npbvR7qhUhRzUqm7DQmRlGeegOWHdOmzA5lV
         yVMKrbHXonw7V+XI7Q78Q04iZNW5XzZQOtGrnk+ElupDqiqsx4T2jws7fOCDM76n6izS
         N1/y2xVTlIvxzfC+9iFukriCKXHiGPF1UsfmQSU2R/O46ISpczDu2KtYboG7CdMNlT0f
         Uypg==
X-Gm-Message-State: APuU4Z8bwEUNKV7biHRv+81WCXoPV2N2r9aYvZMnMwSaV8GDp0PCm8Dm
	O9yU+Y5X7OTjg5q89gX6DhhyIP+Pb3f+TDea6HmxpO+cLHYtjN1VbFp/
X-Gm-Gg: AZFdTZe4fwBYNCO/B+oXx/FsJJsrJ9J8rZxRg01yunAK+VDH1yZMnJ53izOpMc4YPD3
	+FqRWDmxMz0BMzuCej5RAopBov9HVDX7yGLc2kkyumts1t1qd0u2NTXQ+FgnONGtrdqThusXUAY
	nefABlZ70dTtRWn2BVIu21V/i97M5JauT3zng9J3o4dbxP5MY/AO7jK8pLhmK3rwLP/bfwtbgAU
	ekr2sX0iZe8S4cz+KTlYgCInnXiJFHSC+GDEeUpHDu8AR2C3bGulX1JnMpAH7+H0kXu3hurjTjZ
	ehM1ulg1SmRr57bK2IHjbADOzVGbNPwQuUjUJhd7HgshgAV9dVpdEY8nyZRzqmXDZb778MJVyjx
	3MeTxiQQy+YNa7fr8sELDmv89qn83udC4q406SOFzL+0Tzb2RwvMDWu/9mhFxGkVQeuF8KV9aKF
	aPvt3SsbhYHB485l36CoUO4DpxBHw7ttnoXybAoAK5O5hcspive0MyuuHkFCrwv9XzIG7r65c32
	qKSx8IkvYKAmJE9UNBaiyoIOiOupjLlktnrXDv7X6tGUxcF7fYMVQ+Kl5fzOEMYwLjPOPN4uOK7
	XqjuYGL0eekuTBt4OzuJaWtC6ib0FaY9XuWq/wbUCvzVI7J0InUhrgc=
X-Received: by 2002:a17:90b:4ec5:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3b41c96182bmr16500507a91.59.1795607472751;
        Wed, 25 Nov 2026 03:51:12 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:12 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v4 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Wed, 25 Nov 2026 19:51:05 +0800
Message-Id: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_035113_845012_2B816B12 
X-CRM114-Status: GOOD (  13.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While discussing a proposal to also allocate the mtdchar read/write
bounce buffers with kvmalloc() [1], an audit showed that raw NAND
controllers may DMA the buffers handed by the NAND core without
declaring NAND_USES_DMA, so nand_base never bounces non-linear-map
buffers for them (see the use_bounce_buf logic in
nand_do_read_ops()/nand_do_write_ops()).

Non-linear-map buffers are not hypothetical: mtdblock's write cache
is vmalloc'ed and UBIFS passes vmalloc'ed LPT buffers to
mtd_write().

intel and r852 have no protection at all; declaring NAND_USES_DMA
lets nand_base bounce through chip->data_buf as the other
DMA-capable controllers (arasan, denali, meson, mtk, nuvoton...)
already do.  r852 also advertises its 512-byte alignment
requirement through chip->buf_align, so misaligned linear buffers
are bounced by the core as well.

While at it, a leak in intel's ebu_dma_start() (mapping never
unmapped on success, wrong device used on the error path) found
during the audit is fixed as well.

Changes in v4 (following Miquel's review [2]):
- r852: advertise the 512-byte alignment requirement through
  chip->buf_align instead of keeping a local justification; drop
  the code comment.

Changes in v3 (following Miquel's review [3]):
- r852: use the core bounce through NAND_USES_DMA instead of
  extending the local condition.
- Add Cc: stable to the three patches.

Changes in v2 (following the AI review of v1):
- Drop the fsmc patch: nothing has set host->mode since
  a1b1e1d5bdfe ("mtd: nand: fsmc: finally remove
  fsmc_nand_platform_data"), so the DMA paths are dead code and
  fsmc_exec_op() always takes the PIO branch.
- Fix the Fixes: tags.
- Add a fix for the ebu_dma_start() unmap problems.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/all/87o6bdz1fm.fsf@bootlin.com/
[3] https://lore.kernel.org/all/875wxl1ea6.fsf@bootlin.com/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: declare NAND_USES_DMA

 drivers/mtd/nand/raw/intel-nand-controller.c | 8 +++++---
 drivers/mtd/nand/raw/r852.c                  | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
