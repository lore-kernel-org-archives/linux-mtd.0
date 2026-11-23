Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC6606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 05:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UTmI8ogq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxyrgNl7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TVn0gPSIqtJJ3P+4OYnHRGqtXheyVLESXl0YhaSnI5Q=; b=UTmI8ogqSD+hNRC5dsrCShRr4O
	HI4p0E55YexLtnmx38stY9tIchD4LJyni1U3w4ReXjVIK17vIVQ4P5M1f0uCo9FKUU/31xWpZQGeF
	v/D0tk3CAz4yBNGgo2bzMfa4wx88SDEB+51HNo4e+qh0VGlQF5P1K4JkXMeDTHM/E/tXVHx+jKhk7
	XikkuSlXUFmGn6WhD2rW0NPk/UmNy4h919f/jxdEGEdTx5n24he2lDsQ9ZVxqv7CkVBf2FnEU3yhi
	vuWnEQ1bPG8LG0kTyHXi2swLQzz2Q4LA+iw5HOW5wQQy0+c/nvCj3yX7JWb3iPx2BUkB4x9KoeaiK
	FvY6VTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMvy-00000002KqO-3wvM;
	Mon, 23 Nov 2026 05:49:46 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMvu-00000002Kpt-32aY
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 05:49:45 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1143111a12.1
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 21:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412981; x=1796017781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=NxyrgNl74kt9OVaO+WO4JeD757IbKubRKEZrPmoswZDTVumyCQyjR3TQUB9GScSbzh
         RZQlQCNdNHk3jyyJC9ZeUEIEDlfoTXhgT1o1CIiFZ3TutbdxBWB0Hmh/nb/X84JQgn/p
         zFHJsWaBjhvZ+tbk9hc/v8PuY9mkMFED/qjcpv7biaPgs86dU/71ZzrjDuYUCraBqmMc
         ssbfRKtabC0f4wg/W1jDl4qdQ1jI7oek3a1tL/gCxoGrwIBP/KGLqNtAgX+qMdDQIc3L
         VMNoYvTC+P1SS6tgIVgSeB1QrTC+D0CBeIzJHbcBjE3oYCxDZxNy3GuQwCEJp/bCDJnV
         PL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412981; x=1796017781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1miFl2IJmFM7VcXdj9lme3r8dskktuvJlE1HEUDWnA=;
        b=Ljtttc5jb/wCqpmBf7EXTwXceNVcPLPqUMZKzvfzWk4JDJTZjXe3y92fJQbKnVbSaj
         8vVBK0mSy8vemVNU9zupDQLgUhT6sYLbfQnXU9BBr7djkZc1dnlY6pgZ9wBhhLcHLGc8
         1xnhqtgLIBIMqcaGqzTMu82aIcopp+8L4ZpcQgIKVAfbpwn38TlzZkZbqSbwNZzZmhq4
         kuZRuZxJYe6RS0SBfjUdNuolmgUQlYYIdpfCjwGs3wePRsDOEeor1EcKNt9fLcQfVLHW
         KwKnMaAZXDm6B6ZBL/jYULbRiv94AHT8Rt7kWMd81iaL+I3i2FVqINzPD+/MklXQ4CUr
         AWGQ==
X-Gm-Message-State: APuU4Z9C5Ld8/3PzrPv99zckZiEIVsHxPl2dX6PosJp13JCUXd+DpbW9
	M0NTJ9RqguYxlo09mHtMfQMYlWKevsagg+Bk1uq5eGk9QiwwpFPbaY6G
X-Gm-Gg: AZFdTZebykRuuFiaMh4naxhaV/COKjeKJ/df8LtA2uDnBT4XhTXYZai6EvG7rCBiqut
	ezEaUYw4NVkg+Xcd28chitwpYhzbQ4ddQD4HGtdJ+bsdqShV7w7To5cdfa4jnVzbtV7/0khVH4e
	5waJSXEpHSsyWZSyp8htZpnkAuOSbGgkm61hEHt8wEsWR6YW3BYxpsRXBQyGb5VPxD5I8MjY4M9
	5e3655pnlTBizkGdc/KDzFhUYmyemRfEjKJl+OOjTO8Ka/lFH1DuZoMZ5QldUWX1tBbwiVXuovY
	Iiu9bes2+hqhFkDFJtt00LQo8bHsujyN+zkl6wP26geuOF5kaOmdtHTGDSL7Oxu2B2dLYBFjoAf
	o8JNMV6D/DZPKXi9wkuPRyn78fKXpFjLsFgX3s/TNjmIN+P7BK2ZxTk6/KrEvx+5AE00wAw5CEC
	PdEyqRirfUpQHw2NxA5j29nrsbpvUR0Dcy69evd+WZW7Es012Y7yTfWxLYuGuHZuFRNDiMbMTMy
	zOV2bBVnZhXVrxscz3D2p+cSu7GfYkhJd+HAP1/s/Ym/0xX7vQOHsioYNHESY9jDWoAFy1yt3h/
	lH4Ii8hnOuMcbdM5YtfZBw2FmJN25T8=
X-Received: by 2002:a17:90b:5287:b0:3b4:97f:8fc7 with SMTP id 98e67ed59e1d1-3b41c8fe219mr8662901a91.12.1795412981558;
        Sun, 22 Nov 2026 21:49:41 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm5974143a91.3.2026.11.22.21.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:49:41 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Mon, 23 Nov 2026 13:49:32 +0800
Message-Id: <20261123054935.1925807-1-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_214943_239656_F4353826 
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
