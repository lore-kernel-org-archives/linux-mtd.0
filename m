Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22E606A683
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 09:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FF35wwTo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5R8P4N1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v5DwHPB0IF2UXdRiniK3dVAhElKSbmOGrTzKi0slB88=; b=FF35wwToZrgmTfj5/OpfwhWY8e
	5D9EMzlgUx9G7O17wol7DR8veKtWPbzUMOz0THDiWn26AMlLuxuGHXcCy6JQgPjGxDtOtOjvOrUP+
	/TtQysB8lJWzdwEJMYFRFLViEBMVdibHQ86P6n6pq4T5Pap4AKDzRzNMof2YPpEBlyBLd7ffD8WUq
	bMPL9M50Pa65somudqbJQsuNM9zvajeMZb8dg4z+iDjOCguCKIuAjcJRycoMO+vxJD3eg7isK6UKm
	+P3HLW6mQHfqLWu0dfPqK/kEZRoXNArMUeJP/l9qFDHSENyNveXnjCk/py9UOgOdRoT2Tocf8dc+F
	bmcG8smw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9G6-00000009H6I-3C6E;
	Wed, 25 Nov 2026 09:25:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9G3-00000009H53-1tlu
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 09:25:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f052ae3c86so29894065ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 01:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598742; x=1796203542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnB+aZxKe6ZtO8gfhG6inB6mdXvFtFPkZxKmjJASbvg=;
        b=W5R8P4N1PbZJEkAPC2XMlq93rfKzvwH0m4LX0GgklYuTnLZP1X3HWbYiIRojqG48u0
         sv3OARhhq2c04mV/dvB9nQhi1l9pSv5B9QELRUDzl8TYCuFD1cdZr4jcWzOXJpxcE4fK
         xItQVuRZFed1DUUIl2Q8ADRAeQglEMpHb2sUreIwfEd8hUtRIFqcVdDWoq1EeZWE8RDP
         wUt1v0FztjfJYkZqfb2a1g4x6AUAQoyCy9QjVi2fq70VUoematJ/txGi4ZcKiUFaWm7Z
         z5gpNSCIf3dGEYyGGiMUwf4FIEvF4JEsRpcVbTYXuDIOZ4nFx3rUZB6RHF5k3SmgS5r0
         MVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598742; x=1796203542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnB+aZxKe6ZtO8gfhG6inB6mdXvFtFPkZxKmjJASbvg=;
        b=HGJNeW6nuxzEkMcopbcpqWhhtqQpVBC8t5xYuFGOy1gh0zdmmshjwJ35/Ey9ZAMqk5
         9Tz35DOcYtv/Q/Y384ZcJ91kS1Y7GhDJbb1PqxD+ZSX95vppvVXqYacaJ5trjz0JxOEd
         egNdpzXiLZfFJO85mR7HOJTNYnQS+P76mpDlMo4XrjnrBQOWfJr7w/SoGfV/OfyTEh1n
         aIV6iMr28DqJ+Lofr7yABpMdbCGqCDd73n41kAB27qy7jsCPu99/yFxTQWwq4/ua5NgM
         0ggBhGjHhLRpcU74r5rtdOXMq5H95DyC8yATw18l72BPNFB5sqodXgTdpwYBctMc2LIb
         8CiA==
X-Gm-Message-State: APuU4Z+PEa8GSac7PxtFIxSvJVSkxRLM69ZGUaPb5CLtH9GA40RScdJT
	/x4eHbtw/llGSQzvibOC8e2loho1Nd7nbZxz6jMDPxGrGoWyMnvMu0Qtj/nUenPW
X-Gm-Gg: AZFdTZdL571B8Gj0fq66JEBkYA2NoRou27JyD8mefNXSnbAOU+OsH3BfKCYM0N308z4
	jyEQx0Ve237mBtgLBbbzA0U6wvKs8Zf44+7T9rvLr6z9ma6xwNZxjo5oBksZFY1lFa+Pli78mSk
	O1mC6aiy2jBdn5EMrWVfS/aXHJgC18wB4kuU0AHmOG9fveu9WBNNh5sL0m373wS4aQ+CXJ+jC10
	jsmElHDaHebYR5AT+PrHPCvlYCpj0z87uGEKulmUC0/qRvXZqIfA09D/p8xmOCMpOnbmdTMFJ7G
	ggqYy4BaKyRujX2WiY7lFmeKFz/dKLvAjLsdtXC6qW+OozXYhPZ1Mr0jyhb3tcFG6MW1KS3kPdn
	TBZL/g4PI2vB3O9gQnhudyrNKA84OV/M79yXVusNayb/WD0oxDlfRq97WOlZAQ0pRpo5VNfShA5
	vLJBfCaQ8Ih4lqsESDdpGnhaxes4Ood28LOM4TZsZSBQQbnQVSs0oSjUvUHEZ0YB/ZI25Ypt43O
	HJ4dl/iNsnhNKzFk23VBIw1MNKg0lEapv8KPtKX2K3+nk/xUabwyK7Wth+Q5wqBjNgBX1r0XDv0
	SrF52ZuSwt7v7+4ZfGs+X5h1SW28UrzqOA==
X-Received: by 2002:a17:902:e847:b0:2ed:3db6:2eb0 with SMTP id d9443c01a7336-2f03f1d63c6mr171538965ad.48.1795598742548;
        Wed, 25 Nov 2026 01:25:42 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:42 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v3 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Wed, 25 Nov 2026 17:25:35 +0800
Message-Id: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_012543_492652_FD6BC626 
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
already do.  r852 keeps its existing local bounce, which is still
needed for the hardware's 512-byte alignment requirement.

While at it, a leak in intel's ebu_dma_start() (mapping never
unmapped on success, wrong device used on the error path) found
during the audit is fixed as well.

Changes in v3 (following Miquel's review [2]):
- r852: use the core bounce through NAND_USES_DMA instead of
  extending the local condition; the local alignment check stays,
  as the core condition (chip->buf_align, default 1) does not
  cover the 512-byte hardware requirement.
- Add Cc: stable to the three patches.

Changes in v2 (following the AI review of v1):
- Drop the fsmc patch: nothing has set host->mode since
  a1b1e1d5bdfe ("mtd: nand: fsmc: finally remove
  fsmc_nand_platform_data"), so the DMA paths are dead code and
  fsmc_exec_op() always takes the PIO branch.
- Fix the Fixes: tags.
- Add a fix for the ebu_dma_start() unmap problems.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/all/875wxl1ea6.fsf@bootlin.com/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: declare NAND_USES_DMA

 drivers/mtd/nand/raw/intel-nand-controller.c |  8 +++++---
 drivers/mtd/nand/raw/r852.c                  | 10 ++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
