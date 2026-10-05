Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803D0CA5FFC
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/AO0HUZk1yrS20LxBkvXVIlmjPNEP5yeXkngWVBLuI=; b=YSyjzXos582QVc
	t4tqO1ptm6ueRjM/TOX1jk0i7PYdAMgOsPEBaFr1tiyFPph7Ym7zCfd7VxzhxpMHR45lE5nQkaocV
	on4X/+k57rAfO7bHT8c1s2jTxR8dqdxwSFuVOc9g3L/lai52Fo/HBA6Km3yOQX/n+PEDY9a6H0qwl
	Q7sP4ijl5lFc3ehISuHLKV9U/ficZqxWLLeg5mkC1mh4BT17hH/aDtEqs+Z2mY2St2C+LAfosTf1u
	6Je4zSW7P2wapSDPDW5+Yo3frKtxzj423A60SzjK2SB/EGA5iW75yw7iP0uLiExoJ8HtPmPX9stgJ
	Ts7UZ+xDhTSK4qjJmJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDknL-0000000Glyh-20M2;
	Mon, 05 Oct 2026 15:40:03 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDknH-0000000Gly6-3UcE
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 15:40:00 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48c58132824so629209f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2026 08:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214797; x=1791819597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5zceH4jNrBdEqXJOgqRFynavUkkfMoVyT3whsFnol4=;
        b=jYS+F/V6iH+csR6omCk/yVbn7oF9yKOFcGG+2WkLc+Hgb2sWT6sB5SF12UeknS/l8G
         ssqLFJGQ9J6/AfRfHNGY2Bmu9V+6W/BXN2XUFTcMH//+MR5l2WnCJSI2qzc2xDEO5o+k
         Y2iN9EuK4K606oNveoKVn1yjlPHUArsA7iRwSvUSziMrr2uLKqGbzReie6snm/tr8mUt
         82orSPJKakioVmfH6wYEJhm6bWUDkQscENJ2WKMuSHMCsM0jQfNpQDIIjEfmQWMLguyM
         BpvjIXwtzWMBuiU2JEH347qC0VI/Bf8cH9S8f4jkVmyZBRcVtWKHCFkWg7d9kqDEl6Vt
         kfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214797; x=1791819597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5zceH4jNrBdEqXJOgqRFynavUkkfMoVyT3whsFnol4=;
        b=ymtfqvgejy3h3jN0lS8ozohPmIgSfiqj1ICYVSoECXdHyuVnOlrQHp7YDmwcLRZv9m
         M9svRqeNZUaAmDN6iBnFjMlz5rHAcZ8NoNHYs7fZznsv8P2vAEpzGCEerAaw/wc9gpTc
         ly7Sa8wg5pmYJkm4jezHq05r6/BFrLpqgXOo7bgMTWJyRReSVXYDUwJgmPOBYAUmZl3j
         c4Mc4Ry0MAiuzIlJYZyDA/libPbwCggHJzp4H+qT7SOoIbJP2w1udeakuALs5csOYdLh
         8nU/Kc9WN1RBoKta3enV2QsGiGhOUt9BwfDZ+YAdIk5NejqEj1uCmswX0C2AquH2WBRY
         nE9g==
X-Forwarded-Encrypted: i=1; AKwUvByRsArCZw6uY1fmJyTmEVIoCBIutygK9ILUZyX/V4dAMDHYK1TzwtfGVQ6/B27m78G9nQ5+ilJAi04=@lists.infradead.org
X-Gm-Message-State: AFq9FYLnCruO9Ywexeyq185Q9g3XIorg5OUV4JOmnHy4DpcpOh4QrDT6
	+Be/48np9OSon0pC0JhI4ESn9/T14+5KnXJaWk+72Hs3zyQU+Cy2DVO5
X-Gm-Gg: AYBFou1KZHVHnz5O3nTqr4TlSKnqeiTrLu8d9ORydvNovZThughqM4WqmX1nOlCy9EI
	ubFQT+1RLxi7BZ3fiud/D2p0eCfSRs+ftfQPMbdx/HUN5wmiBfH6KoR/cQA7vYlQ0pa+dIIhIJF
	lXRWjQWxj/xGPFPPDVvKhNaOg6UcGFvsECr0CGUl0avTsSQI6jP73wc7cqqadfyIIEzSjCu0jO9
	nkUvOmEharL4Nu5bKP4rbnnVheDezEXTwW00C6kJP0OUKw0iN+W7fkCLx8nugxmUoyJP+WQY9K2
	r5myAYIpmZqiiqRPo7wjTmpEHqCJ4kDmWFIEUbz/swO8cHYD1uidg0xB5nmHTLlEY33bmBICrXQ
	IFGythV0P1Xq7+zFXTZcZjFLafnBBdjh3wWNbcyAffwUL9De7gEyf6zi0Jdz6uCc8XuxDBrmf0f
	jL1JSD2hjc7ezBt6yKHWwliPg8+W3xx5ino4zmpmgDKD3v9snogDaCV9Z4cu593x1RFdW5y8eR0
	2G5ya8SQyobqlQ=
X-Received: by 2002:adf:f04f:0:b0:488:88f6:36a9 with SMTP id ffacd0b85a97d-48b12717780mr13929101f8f.21.1791214797488;
        Mon, 05 Oct 2026 08:39:57 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622bb172sm9124104f8f.42.2026.10.05.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:39:56 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: stable@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	mehmet.fide@screeningeagle.com
Subject: Please apply 68fe2faf5c69 ("mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages") to the stable trees
Date: Mon,  5 Oct 2026 17:39:56 +0200
Message-ID: <20261005153956.238827-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_083959_910653_F369CF3B 
X-CRM114-Status: UNSURE (   7.26  )
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

Hi,

please consider

  68fe2faf5c69 ("mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages")

for 5.10.y, 5.15.y, 6.1.y, 6.6.y, 6.12.y, 6.18.y and 7.2.y. It is in
mainline since 7.3-rc6 and applies cleanly to each of them on top of

  37adc9c5789c ("mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB")

which is already queued for all seven.

Without it the driver reports one corrected bitflip for every erased
page it reads (18035 on a 126 MiB partition on a Colibri VF50, one per
erased page, while raw reads of the same pages return clean 0xff), so
the corrected counter of every Vybrid NAND device grows on every scan
and anything that watches it sees a flash going bad.

Thanks,
Mehmet

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
