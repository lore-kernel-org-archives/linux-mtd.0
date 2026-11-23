Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E5606A31F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 07:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EDFYOJaJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frFoIwkI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hhm07Ts0iMNlTFsDOHWST6d5u6kOHTSE/PG/zNThkOA=; b=EDFYOJaJg5zVIedj4tsJ+5dngZ
	RswzytggYrSdbdjShEAPR0OjmiZbI6WIPXqajhmxa+IJaIOYpOoTaPdMQlbIU6c/TZJJ9sSYPSC3d
	8/kSVjNn7VD/xWkMqxCkFK1o8RDzWyRTdAutuSVhP1BRAx9+QB5TttaOnqfuxcPddolNtkuFj0Qm3
	phYUe46+O8F5a482jf50LQO4rrlYDl6p0L5mF3RRARxVfW2mpN1nmHhIcRAR+M2h1Y9vZTcUKs5ap
	CG8XRtAAU9rf0bsd2/eULHGef0YD/yyPXS0fYTtn/ez2gEwnaUsxuF96seWbytNxewMeE1f88w4nJ
	SaCf8Ffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6p-00000002Qo2-0GkS;
	Mon, 23 Nov 2026 07:05:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVO6Z-00000002Qjm-2M8X
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 07:05:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1613284a91.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 23:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795417487; x=1796022287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEX0mxA7VnoyxX9zCpamt/vhWNwnvsYGWit7MA7nHRs=;
        b=frFoIwkIrrXhYe7VieKVowyYhNb1gTOM3sOpA9yHPAOM4R+geNG0Ucp4pWtj+G7hrm
         leqck6PBR+Ndl0PRvHHBe320D2DLeA2QkvNX4rB5RC1+tjkZzdvfvAdaFtPnDCpYv2DL
         Eyp4aoH3jexx8bV/nE1VxxR3tS0lq79AKN9KX5iqdZlSiqBmf99P6fjD2zLLmlb1En1Y
         yquMCuQ3vgaikizzClXlU+7M9XFq3UbXlE/vWELTSPkJNwKknZosNn/iCeKwkNHx0xYF
         I9vXOnNP4zquWT9v2/uJ9Ki3dzaq9gWAc8X22qpNI2JAfi7aFtUNVBR10B2NB/S8u3Gv
         jQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417487; x=1796022287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEX0mxA7VnoyxX9zCpamt/vhWNwnvsYGWit7MA7nHRs=;
        b=hx7pxweD4P1G3ydYHs5nJTg3ejGS/v3KxLR5EhSJ5T6zrq68/D8gGE41E0ik86/uTe
         nEubqlpswrVViGIlxUkwhgV2B5WcS0GU2sGwgm6Ij112hHxH5akEkAB08gPIGWHpFgFc
         iWjtfcVdYoXQ0FhocevHd3Pss+Yf6DA2KUIzVz9+Tz6oKq98iBYKl2AfwdFRhjf+xJ5y
         duVdbBhlwR4lAIgdQ4BVDTS4tSbl/pYzDVUu//L6XRQcuZLZrwH6fBrjK81RRV6C5Ls9
         H60OLvkrI/KbVsAAjhd0cn3ZpQ33T96vNBO6l9OxByIIGkO3Fx6PJU76/VVnbSzfzWni
         GX+A==
X-Gm-Message-State: APuU4Z+ABhLOR1Hsuuuc3gjo4B5IqdBEsoQ24CIV8Z2e5NwOjhdYL8Y0
	2rJ1DE2YpOf59pRgs9YTZ/zV21WX5xOO27bAbMPaQPMb4BFp3BO0+lRY
X-Gm-Gg: AZFdTZcKjCwiYSnCYrKeGNO1gdte80EymWjbJ/faAtioorjppXTPFTMJENJOUei2Xfe
	2WHBwboYHtrK2293xu02KkfQPKIoh1dweAIWpxGNOql3bD2j79aOaarAs9K7VH1QfGRLI3e3cSB
	4iNgiVbH+TiGqu/0f2RF/mEDXmdHLKpfFTE7ooRvcZbrNzwsqgtvwhH8FlgHanfSabVJE/9/r3a
	sPnEOyAVZVP6DrjImysTxqNbFLr+hfrX9FDQDl/p9kJzvYuTlD+6MsZISx7pg2GWsxMiKaL2pYo
	2E4sgY67lT27z/TNKPEQVdbl30K+UfWZaNHVNMa50B1ZEMKIelS+UFk7Nso0WDtQW1sx/E+cQyi
	Ql6xzGGn43Lv7Vsxrb1Ywh+BV1PL6rdGyPu3F7N8cyL2UqGTXuNWAGujfxtgtYB95ueVcvY7DRM
	o6RRfwFP0JqvJZHlzfmjKhGkX4/zHxZF3PV/t9BL0nseeQ6ct4woYwsZOwwCh6o4EX3p5q46MRX
	MPymBbH3MXz9IZvYA0Vmkx6025YYoTQM6TEw+IlODXO/pbbVMRjiw9k3I8bGNJBdrLWS25DcGGq
	px7/g+/klSjnAxr/5krnnNpwOG84mRSA2A==
X-Received: by 2002:a17:90b:3d4d:b0:3b3:b636:763c with SMTP id 98e67ed59e1d1-3b41c8fe33bmr10175028a91.22.1795417486682;
        Sun, 22 Nov 2026 23:04:46 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm19763094a91.2.2026.11.22.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:04:46 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Mon, 23 Nov 2026 15:04:37 +0800
Message-Id: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_230448_236357_A143C4A4 
X-CRM114-Status: GOOD (  10.21  )
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

The first revision of this series covered three controllers; the
v2 changes (following the AI review [2]) are:

- Drop the fsmc patch: nothing has set host->mode since
  a1b1e1d5bdfe ("mtd: nand: fsmc: finally remove
  fsmc_nand_platform_data"), so the DMA paths are dead code and
  fsmc_exec_op() always takes the PIO branch; declaring
  NAND_USES_DMA would only add an unnecessary bounce.
- Fix the Fixes: tags: the exposure goes back to each driver's
  introduction, not to the 2022 mtdchar kvmalloc conversion.
- Add a fix for the ebu_dma_start() unmap problems found by the
  same review.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/all/sashiko-outbox-228750@kernel.org/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: bounce non-linear-map buffers

 drivers/mtd/nand/raw/intel-nand-controller.c | 8 ++++----
 drivers/mtd/nand/raw/r852.c                  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
