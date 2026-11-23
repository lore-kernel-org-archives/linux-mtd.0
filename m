Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C0B606A31F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 05:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYkCoKQM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nhS7Is0e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TVn0gPSIqtJJ3P+4OYnHRGqtXheyVLESXl0YhaSnI5Q=; b=hYkCoKQM6YGZgPDzRnIYxmsazL
	hpZ7g+hRAAFe0UEJMenF8HjDrpueV8GcPcO6yVMWF5lwWl1cbfau/HTFVVW373zwgm7acY0kJi1eS
	EMUpw9SlVT2YK72lIl4FAgAa8XmCfNZbCt+L7CPPHcG5rPGZ3dv0eUFfVl5fbl+4Q8Q1Mvw0A5Nxy
	t5AVjSIYF1b9Hk/AxCq/doht0vzdGA89OWTAvPUFErHTWzc/VUhXdZ6z+R0YGHgvbrDh1IT7oi+n/
	L/FUllf35k29doh+TjX2RT6qFfRX7wcIlu8nDo1yAeSasB83WqmVtLGYUBVCThGC21tXBvqCuewCX
	L7MUiXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMwi-00000002Kyh-0f1g;
	Mon, 23 Nov 2026 05:50:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMwd-00000002KyD-3pSW
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 05:50:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f07a960666so9944175ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 21:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413027; x=1796017827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=nhS7Is0e+fvHvESzaTYwKAbgStgLuRM57juupX8a8FFGErQ0j5mEG0K9sXJdaMLHgb
         S1ew039PoySPxAqvkck+1Mdot9wxaljtRrTWz6P4vcfFIQ8TloGhhwN5oDEbHf57wyk3
         PcpOOH9Ke329JY+MBfM8qV7dCwfyRXg4euRgzNwBlv4PZ+2I/AoLVjwWa3q5jQcTA/Da
         XaMPgmFgfFLmpAX4p44lQJBiqZw5/Ht2ECg0m0SFo+ILSnCyWP2kHHUqtO4ihdb7bKua
         q50EP6HNLkZfZZGor2gZY2DQkWLxXk1jAEzKeMQGXz5m3Kk2mss7dFcF3F+SWZu/u5nO
         JBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413027; x=1796017827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=dZgUDaqaw89NnknnZqOI/bvDDct55Zab8JKnQkQO/DYAQ5OxsugU6TITWDCkiwEdxW
         Nh8VdsNuwCusTfnAg8j+zYHsX8EL/hrDIvIvVEQJGetUIjFdP0WALKyUMk8PNFJbMi8I
         Yk462ManFLvPRWdKsORXetH6v6PMC1yIBwkJRHLATQkJ3AGGq8sK+NU7jOD4qTLhtQP0
         uhYdN4oo1FOJdmk1Yir6saRg2N7ac0O1CTXaoVKZ77dXA79DtGDs6lKsriqkxbj5B3hM
         aBreMWxNxlU0VXjbtUvlWrolpmO+jxefoDHe0J3R2SxTu9ZH6tZT0k3w/+OYIN1ef+jH
         If3w==
X-Gm-Message-State: APuU4Z/BLTQJ15BkQNDf/x6apC0XBDveWOYqwsG1t+vZCaE7rq9TGRLT
	lft+jh69/pktDvLc1RZUxWFgKNgJhITFTHRjwf994nvRGT2bmbGy9USN
X-Gm-Gg: AZFdTZf5S9RMmDHLsamA9BbMrpVSYTtFJzzKgeaDCw0xuYSOYBCkbhvS+7NohuAJc+w
	p1yM0Zbxdv/vyXjtWpLOHMUhdh/yw6CmMjzKyjn8Q6110kO6r1mDyYwyWewj2NjeZpCNJ+c6Xxh
	zxdHrTfA3gC+Im0WltT1kfeeTeaSdp5OC0jOEK03/eAvcwcH405onk9kYv28IuRo8Jx9M3trJB+
	EwOnOIRFe1w3KKq/3tUXrfmxWOb2lPxIkKiDqZnZoHtgSgSz7ypUj0+EjISYTMSyv12k4+CPp9j
	74TEuJHZLyAYN13O3xrUryO8DfKN2jxB62T/FvtagEHs6WxSAlsJgIOTimSpqLy7C/KdSDkqKuv
	y3gW3d/WhXzpKvj83HvkFt6myg3fpPAdQlDzDeAIo/GWLG/Srojvs/wCBrSgWmEwEJHKMtbVryM
	w8vT/XCboeYk3PbndeV8DRs5e2U8ip86g+tUcHpoGmoFCQrRIWDnnN4+lpNqXywZbhjRnZjlTCV
	3gFLynWRokPX6PbHCOU0cpxIf8cqHP1IJiXN+kXhGqse03l+ib/Fgq3QRD8vy0vfLwDDhg+FUjt
	wrOcT7EtYGgBi+Vic2aoopGEv1y0Hw==
X-Received: by 2002:a17:902:f547:b0:2f0:60c4:9d1b with SMTP id d9443c01a7336-2f060c4a58dmr72115095ad.62.1795413027126;
        Sun, 22 Nov 2026 21:50:27 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:26 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Mon, 23 Nov 2026 13:50:17 +0800
Message-Id: <20261123055020.1995251-1-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_215027_947385_6CC338EA 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

From: Ping Li <leeonion.muyu@gmail.com>

While discussing a proposal to also allocate the mtdchar read/write
bounce buffers with kvmalloc() [1], an audit showed that three raw
NAND controllers DMA the buffers handed by the NAND core without
declaring NAND_USES_DMA, so nand_base never bounces non-linear-map
buffers for them (see the use_bounce_buf logic in
nand_do_read_ops()/nand_do_write_ops()).

The exposure predates that proposal: since the MEMREAD/MEMWRITE
ioctls were converted to kvmalloc() (83208e106a8e8), a heavily
fragmented system can already feed a vmalloc'd buffer into their
dma_map_single() calls, which is not a valid input for
non-linear-map addresses.

fsmc and intel have no protection at all; declaring
NAND_USES_DMA lets nand_base bounce through chip->data_buf as
the other DMA-capable controllers (arasan, denali, meson, mtk,
nuvoton...) already do.  r852 has an internal bounce buffer but
only checks alignment; a virt_addr_valid() check extends it to
cover non-linear-map buffers too.

These fixes are independent of the direction taken in [1].

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/

Ping Li (3):
  mtd: rawnand: fsmc: declare NAND_USES_DMA
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: r852: bounce non-linear-map buffers

 drivers/mtd/nand/raw/fsmc_nand.c             | 2 +-
 drivers/mtd/nand/raw/intel-nand-controller.c | 1 +
 drivers/mtd/nand/raw/r852.c                  | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
--
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
