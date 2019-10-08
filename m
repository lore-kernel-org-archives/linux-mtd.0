Return-Path: <SRS0=afzE=YB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE605C4360C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 08:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83EAD20640
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 08:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ukDJhr8M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAhHl78X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83EAD20640
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xw9k85W6Jik2BIaTdNjgHHWALQHAMjSumIRt6nHrRUM=; b=ukDJhr8M/Of8j0
	673CPoDDNozWkIC8khxOgk7NJx9FEo1eeg1noSvAwOzL03My8j/Q2tJCsZ7c8VOmxY4Ln+weQ6hN5
	dY+JvtDJLUrdipEIZn0tv9IAiKevVPCw463QHa8MBZggqSlWHlNxf3AMu5kWKGsOXx/Wz42/pIIKY
	xwk1P8OJM1c+2HARNaUmWmGFiy/a19ztD9ZgWs8dZ1aN8bPi9I5LdXTKX6xyW/oHJ639TwlejdRnF
	OoV/4I8yiM63IbifPYukfgFLPIp99l+yZQAvQdi/WAXhhOP7PhcfE0mVfw0pgh1QWCvFj4Rz84cjQ
	W94ir/hIHINgp1x93Bog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHkT2-0000fY-PW; Tue, 08 Oct 2019 08:03:36 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHkT0-0000f2-5r
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2019 08:03:35 +0000
Received: by mail-ed1-x542.google.com with SMTP id v8so14823606eds.2
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2019 01:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=yxS/5g5MPHnEad7jnspSPl7+yeVZs8sfkzTndwQAVzk=;
 b=EAhHl78XuVocZEdz30R7pd3IfBemGBznvY6PD39XcEiOlKGRI1MK5WZC8n3ceUp3/H
 z9JQMKQENUvUvGBqYZMst4zTMleGrPDriDFmf5FAehe39PGOTUcAvS1KbcNa6i/izwXz
 wAXGrbgHR00X8osnPiKyP51gcZEKPdcdPHcyuhByhYeLnI+am1mKXpvoPE6/8wgCBXH9
 g+uX2K0qy5JVpxXJFUVYKNjGutQSvJi3iB43GyanshJsegcJfc9ssvqr9aky429OZAeh
 l6yrkEJudyyFyQpwZU5I+7xFbhxGvh/gn8RXR9eIkuMtTAA3wXPIK59EhSqEQ6PdmTqx
 Bhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=yxS/5g5MPHnEad7jnspSPl7+yeVZs8sfkzTndwQAVzk=;
 b=n+rLtY50H8K+E02XuMKFtF7H6qTYoO+L3igLFp0+sDv2tvu+rGD8mUJ3d4ui/5xpP2
 P5+VgT4hutcj94m1YMoGabbHvTu1v+tJ4z+5ILDbIrV//J10LXx7AqKqnZI16P3oihh9
 0nA2IN8skuylMXtxJ+7bXoqNw4PSVjFPVobfkjoS/p46CQ2GJVhDFhtkPZRGf1JxkwvD
 v7ksG0V39ae+l0P9diogzGO9SQH6pY7VP/XpidQ+4nMhQVGX8pkwBsQBfb4xL/kZoZtq
 uDNHMbZEktORlesmY3lq9Gw7OO8PGhmQHg2Kk5330Uj7+NnOHOZGGFgXEpiAjp2qTyWM
 EhZA==
X-Gm-Message-State: APjAAAVtmsOPJlRXtm3PtJARjURY8VcESbx6Ri7iuptG3rGKEx2cI1mw
 cOcOompm+1WMLQFL0iso2vXstQvn8XHIiTY0hF4=
X-Google-Smtp-Source: APXvYqypn7t2uUJe+awkVTXq7JkTX0btoKhETmCVDFgFr1mM4OoJtmuJLTBmWdxP7UzctGAsOSHunY+YR4FvjTetzB8=
X-Received: by 2002:a50:981b:: with SMTP id g27mr32988737edb.105.1570521812059; 
 Tue, 08 Oct 2019 01:03:32 -0700 (PDT)
MIME-Version: 1.0
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Tue, 8 Oct 2019 10:03:16 +0200
Message-ID: <CAH+2xPB7rbeJnOPU10Ss9BhV_2DJV-ToQ3XNOy97+vrGx+ubcg@mail.gmail.com>
Subject: Regression: dmaengine: imx28 with emmc
To: Sascha Hauer <s.hauer@pengutronix.de>, dmaengine@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_010334_216604_F50E3919 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vkoul@kernel.org, NXP Linux Team <linux-imx@nxp.com>, bth@kamstrup.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi

I am getting a kernel oops[1] during boot on imx28 with emmc flash right
around rootfs mounting. Using git bisect I found the cause to be the
following commit.

Regression: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")

Reverting the 2 changes in drivers/dma/mxs-dma.c fixes the oops,
but I am not sure that is the right solution as I don't have the full
mxs-dma + mtd/mmc overview.

I did see that the patch isn't a simple rename but also a bit define
change.
From: DMA_CTRL_ACK = (1 << 1) = BIT(1)
To: MXS_DMA_CTRL_WAIT4END = BIT(31)

Bruno

[1] One of the kernel oops during git bisect (dirty part is just a dts).

[    2.326402] 8<--- cut here ---
[    2.329575] Unable to handle kernel NULL pointer dereference at
virtual address 00000252
[    2.337988] pgd = (ptrval)
[    2.340793] [00000252] *pgd=00000000
[    2.344483] Internal error: Oops: 5 [#1] ARM
[    2.348790] Modules linked in:
[    2.351904] CPU: 0 PID: 21 Comm: kworker/0:1 Not tainted
5.2.0-10687-g5fe7b600a116-dirty #6
[    2.360283] Hardware name: Freescale MXS (Device Tree)
[    2.365480] Workqueue: events_freezable mmc_rescan
[    2.370324] PC is at mmc_wait_for_cmd+0x30/0xa4
[    2.374893] LR is at mmc_wait_for_cmd+0x30/0xa4
[    2.379453] pc : [<c0389608>]    lr : [<c0389608>]    psr: 40000013
[    2.385748] sp : cf5d9d20  ip : cf5d9d9c  fp : cf73ca64
[    2.391000] r10: 00000001  r9 : cf68f2b0  r8 : 00200000
[    2.396254] r7 : 00000000  r6 : ffffff92  r5 : c0701068  r4 : cf5d9db8
[    2.402810] r3 : 00000000  r2 : fffffffc  r1 : 00000000  r0 : cf5d9d20
[    2.409368] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    2.416537] Control: 0005317f  Table: 40004000  DAC: 00000053
[    2.422315] Process kworker/0:1 (pid: 21, stack limit = 0x(ptrval))
[    2.428611] Stack: (0xcf5d9d20 to 0xcf5da000)
[    2.433016] 9d20: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.441237] 9d40: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.449460] 9d60: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.457680] 9d80: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 3a80845c
[    2.465903] 9da0: 0000000a c0701068 ffffff92 00200000 0000000a
c0392b0c 00000008 000001aa
[    2.474125] 9dc0: 00000000 00000000 00000000 00000000 000002f5
00000000 00000000 00000000
[    2.482347] 9de0: 00000000 00000000 00000000 3a80845c ffffff92
00200000 00000000 c0391a28
[    2.490569] 9e00: 00000000 cf68f000 cf73c800 cf73ca64 00200000
00200000 0000000a 00000000
[    2.498795] 9e20: c0701068 c03937b0 cf5d9e3c 3a80845c cf5d9e54
c030466c c0634ef0 c06484f0
[    2.507021] 9e40: cf4f4680 cf5d9e54 c0701068 c03048c0 ffffff92
ffffff3f cf5d9e50 3a80845c
[    2.515244] 9e60: c0760fc0 cf68f338 00000001 cf68f000 cf68f000
c0760fc0 c0525400 c0701068
[    2.523466] 9e80: 00000000 c0394460 00000008 000001aa ffffff3f
00000000 00000000 00000000
[    2.531689] 9ea0: ffffff3f 3a80845c 00000000 cf68f338 00000001
cf68f000 ffffff92 c0760fc0
[    2.539915] 9ec0: c0525400 c0525410 c0760fb0 c038b47c 00000000
c0708ca4 cf68f338 cf68f338
[    2.548139] 9ee0: cf5aa540 c0708ca4 cfde0600 cf5d9f1c c075a9f9
c075b414 c0701068 c0035298
[    2.556363] 9f00: 00000001 00000000 c0035200 c04eb0c8 00000000
00000000 c00356e8 c0dceb08
[    2.564588] 9f20: c0bbe570 00000000 c06467a0 3a80845c c0708ca4
cf5aa540 c0708ca4 cf5aa554
[    2.572811] 9f40: c0708cd8 ffffe000 c070ff60 00000008 c0708ca4
c0035644 60000053 cf5cb244
[    2.581035] 9f60: ffffe000 cf5b7280 cf5a3fc0 00000000 cf5d8000
cf5aa540 c0035618 cf49be90
[    2.589260] 9f80: cf5b72b8 c003aae8 20000053 cf5a3fc0 c003a9c8
00000000 00000000 00000000
[    2.597483] 9fa0: 00000000 00000000 00000000 c00090b0 00000000
00000000 00000000 00000000
[    2.605703] 9fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.613924] 9fe0: 00000000 00000000 00000000 00000000 00000013
00000000 00000000 00000000
[    2.622176] [<c0389608>] (mmc_wait_for_cmd) from [<c0392b0c>]
(mmc_send_if_cond+0x64/0xb0)
[    2.630507] [<c0392b0c>] (mmc_send_if_cond) from [<c0391a28>]
(mmc_sd_get_cid+0x40/0x164)
[    2.638750] [<c0391a28>] (mmc_sd_get_cid) from [<c03937b0>]
(mmc_sdio_init_card+0x28c/0xcb0)
[    2.647249] [<c03937b0>] (mmc_sdio_init_card) from [<c0394460>]
(mmc_attach_sdio+0x90/0x350)
[    2.655744] [<c0394460>] (mmc_attach_sdio) from [<c038b47c>]
(mmc_rescan+0x370/0x448)
[    2.663646] [<c038b47c>] (mmc_rescan) from [<c0035298>]
(process_one_work+0x220/0x5a0)
[    2.671629] [<c0035298>] (process_one_work) from [<c0035644>]
(worker_thread+0x2c/0x50c)
[    2.679783] [<c0035644>] (worker_thread) from [<c003aae8>]
(kthread+0x120/0x134)
[    2.687232] [<c003aae8>] (kthread) from [<c00090b0>]
(ret_from_fork+0x14/0x24)
[    2.694488] Exception stack(0xcf5d9fb0 to 0xcf5d9ff8)
[    2.699581] 9fa0:                                     00000000
00000000 00000000 00000000
[    2.707803] 9fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.716018] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.722683] Code: e3a0207c e3a01000 e58d307c eb050cad (e5d632c0)
[    2.729008] ---[ end trace bc2ac96ca83a59e7 ]---

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
