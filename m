Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910A606A32E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=niGFhTeW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRl8zhav
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ONeuMYmrs/wPga/AGvaFmJKn9YdHZ5QQNVLM2WV9Qbc=; b=niGFhTeWvZ8eE80/pmWhY6xQmQ
	Hi01VeEcjN0LK05at6mknmq0EUgivfiEDGl0PyTvOPCoLdL8bRq4dpcg3TBi9lNLC5m3my7mPpEQ1
	PZk3GIk7ud56Fq/7oMp+giJ10n7dvPWiyp2RgdSDJECD5RAz0HtXj25bG8OyTeX30uZCpMPh9tk0W
	j/TYe+bAYuG+rS4aRYfNCAn2xJeWd0SXak+t1t/915icJaPHkx3OUrejJAuJsyacBvJeEOF+jgpc4
	tKB3ISxzX8cr2jcI8zFskvJz7YJeWnJuaizR0xDq5C3pF41pIu7SlsOA3Yz+iGz6Jo+G5C6hjFoyH
	P7RKuGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC0P-00000009nn4-0kRr;
	Wed, 25 Nov 2026 12:21:45 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWC0M-00000009nlB-3LJ2
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 12:21:44 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so3881643b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 04:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609302; x=1796214102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAM2PmX/DJ4eJQYYdKNpygFCiHeH25kCFURdOxc9Vgk=;
        b=zRl8zhavU1rXZAYk2F7XtI93grlDsw9+TFIjLzFHubjdJ3KrRdfx7q5fE8SxJmAAXV
         IK+MKnBYUkD/fwJ9s28C49db4zMc9/eewcvIU8bgyZytBrBAF+KP+248FH9/ck81YFlX
         o4vdMGlFJIouJuZ1FwBiA86X/US4ijn8A1YSZ5BT3VuwZYoZSy3iA44r13uevTVrvAvT
         dzrYpMLotpyF82P/7+C69bKH5vBwnYCpMw1IXnVokRx/mlnL04UbkvrwdGjqkYvT2nz4
         zkPH5BrCrBWe5iB9ozeirBoOiJFstXEz6NvFSVTBJ0UVJrKtMfC91Njz0DfGhoViLX0k
         HuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609302; x=1796214102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAM2PmX/DJ4eJQYYdKNpygFCiHeH25kCFURdOxc9Vgk=;
        b=Ns5dtGIvnFnFwflqNU1F1Q8RA0zbZrLZPOGoohgo6rfmdyUdzJm0pwR+UAn7/yNtHP
         qvhnA5HGG0Reuh4gZSvk+LQfaqTVDqFWdCR8WPVqAoh1wD164/AYtL9ZhbuCksIgW+9I
         la06c0jiDSgXFdNcS2Waqu1RQx6xK1oKPZNtg7wflEj5MKSpotc0mEQ8phPd+nuVNxf3
         s14RWxFhyPGY8jkMGd2BvKtZOtSwikon/Q8+hR16ILOdx6Hvf3zE9TpK0gs7H0p8+5rj
         dcRGdfyFMHUZk/bX/pzTzBKPEhg/wS1X92l/yxvl6yK3W+7f0mXVKIUycQL5VQ89D/dC
         5hkQ==
X-Gm-Message-State: APuU4Z+TwlRcEqYRK7dCw8Mg9T/xU0ZBjleSygetX57tgZ9znBnC1Arb
	S5ERp9vXQfNhkfVUwdU+jrm8FSaFxmxhSdeBLEKKrE2bzwigIyav6wbA
X-Gm-Gg: AZFdTZfIMFbpJgUjUKcyX2dIsasoemHCnn8FZPE5Cuakkl+loRdjFmGBKB6C4FaG2NF
	j+URWQA+FgbP7rrQRts9TsVj89g6d13RPfO5G3mFbOGOIU/aLq+3hFhum7xk/BnnwJ8L0tbrhFb
	ThkHUS4WuUJcSPYHgmU5Fd9W3N+Fvq05UB6U6DFC5a8V5QQv4UoikQurKyXDdMaQjMTysby88Or
	Dy1w+kT0o2c3kfPjZaFsYb4cT6yA+RY7A6gwLYEcH0Az2UpSU9p3nGBIKe1hcNrKjB9gao89Chj
	zy/mLKd/mquxH04+dacJrry8oV93wlhuO8xu9ajKqIUwVGUreU9o1a0RLdvZpkr9MiA/Gi/duql
	ym3tAOumCzAUczyEGaAeUTn9OdX0R/QHTOCc1tAtBYuQQI2hbKaIg2KUgWVh13bgYuaOqJIdAkE
	kO1eonfcQ5gZY7h8jyo3QoYO2ikxJSn/RoIp6Skzz8ssRnzXzUqyjOwFIEBJiFPUZzi6ba0h8Ba
	6E/WQmltajoBknKPn86G4HLCi3S+MVFH9R24TknP+Nhimxwi683RLjGLd9GH+/seIUIHCC8Bku4
	tUCy2+fUxwpRGHbdLS/blWj4iz48k/caMA==
X-Received: by 2002:a05:6a00:2389:b0:89d:7f51:6492 with SMTP id d2e1a72fcca58-8c87c38b44bmr17379665b3a.32.1795609301756;
        Wed, 25 Nov 2026 04:21:41 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm8688656b3a.13.2026.11.25.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:21:40 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v5 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Wed, 25 Nov 2026 20:21:32 +0800
Message-Id: <20261125122135.44696-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
References: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042142_835977_F3EF11E3 
X-CRM114-Status: GOOD (  13.37  )
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

Changes in v5 (following the AI review [2]):
- r852: gate NAND_USES_DMA and chip->buf_align on dev->dma_usable,
  as the PIO fallback path does not care about buffer addresses
  being linear-map or 512-byte aligned.

Changes in v4 (following Miquel's review [3]):
- r852: advertise the 512-byte alignment requirement through
  chip->buf_align instead of keeping a local justification; drop
  the code comment.

Changes in v3 (following Miquel's review [4]):
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
[2] https://lore.kernel.org/all/sashiko-outbox-233336@kernel.org/
[3] https://lore.kernel.org/all/87o6bdz1fm.fsf@bootlin.com/
[4] https://lore.kernel.org/all/875wxl1ea6.fsf@bootlin.com/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: declare NAND_USES_DMA

 drivers/mtd/nand/raw/intel-nand-controller.c | 8 +++++---
 drivers/mtd/nand/raw/r852.c                  | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
