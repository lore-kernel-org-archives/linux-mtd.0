Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,WEIRD_QUOTING autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AEF5C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C210D2085B
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RliCEBoe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1M+nA1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C210D2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJVrweY7LVt18fKFFd2IliKKKtFBlFw8NLvaFdLs7As=; b=RliCEBoeBblpuVjRADqBLygFVT
	DegPSnyciJ4tANBYStS58MUkMvh1P6j4kEw5rDgdefm1c1KWvnPoJS3CQ2RJbzdrSLjfoDjdittAI
	5kmnS+pBCLc9lFRatTBj65E+xoUWhAc3Cc8L3B5aYrbbX9pt5nGe2AMa+7OYXULMB4S7b/NS3JOOr
	uJa3w5v3lFXTvpnYwWxYDBDSvGQkD1a/03zyK9ZQC5WVxacJQMfgzMPunmemZJK9PreqRO4q9+Cta
	/DHaP/cLcHc0aE7wR/5APruvTQDNLqnj8I7QDdyV1byok1eAoKDzsafAYz0A6Y+cgXH3M5S1HPTNx
	FxR+KaEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJlNX-0004T3-7n; Sat, 19 Sep 2020 22:30:47 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJlNU-0004SF-O5
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 22:30:45 +0000
Received: by mail-qt1-x844.google.com with SMTP id g3so8804551qtq.10
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 15:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4ohihBLzAbKs8Bu/1T1sqja6nMDJKebNRtsvfxozrU=;
 b=F1M+nA1BK8MrKcCRrhAR+fRA9MxHi6Uxh0pY04x9jQh/zRqIqpda7BM2qoyFq/zAim
 nPcr2l964AH1N/SS/2c9qq9g8rtyGxSDVUyb+RJ158cVeUt2hlmTJ3DsDqbYjfujBObP
 UsqsYK+WJkU05nfZJtBQsGhfibHHdIxs+9MU3+1+IahewsFVmj4g6iQ3+tLSkpGhMLMM
 Wd7Li4oyaOVdWWUYNvAkFGAssdfsIZqqe4TnJJ64W8Qs7VwsRS5insGrK0H11ubm3aXc
 gLkrzDjIdbrreRnSPjjeBS9FmoyrLH9BtgHrdphTftihjmJvAqcz04Y/kkgE4H9XjdmH
 w4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4ohihBLzAbKs8Bu/1T1sqja6nMDJKebNRtsvfxozrU=;
 b=p4Qdh6DWIPIchI4FKxXnSomTJRmljGw3pBWvYb3fsdcnoWvhoSs703nulZkX7XDViI
 CcNKdgP6w50AamDuVzc4ryTUoJJ0r531g21KqShGUbScdZPYb8g3jj1Zb/SMNvq0s3zr
 XZjRs7aFBphDbdIaq0ygBkXHQpPXZCPoH96ptIarRBFF98CNJnIkFx5wdpB6uOsRxizF
 1r8f4JUa459BXj9AKz4kiiVXRtovUeuQNwPzRWYwG4Ug1XNUw4zxY7qFRU+gbOkRDd7O
 dXRWzbqi4koV9yutCSO9+qE8AIGSbOr4k6OY3aZjhXEXoFCKk/qB53gx1HNPYIKk1ows
 ww+A==
X-Gm-Message-State: AOAM532PlBovxB8HoP+chOLrr8hCVAhv+w1xQHdkmzA0Sewv6GvGfG0L
 SVx1dpxaLdh45t1x02mpiumckmTJ9xybfg==
X-Google-Smtp-Source: ABdhPJyy8Go+AqwEioL7G5p0Y7q3etaRJByxYyhWS9KBVNcx1f2oAfBAY6yN6okxvP5+o2cRDOP36A==
X-Received: by 2002:aed:3e3d:: with SMTP id l58mr40839873qtf.350.1600554642920; 
 Sat, 19 Sep 2020 15:30:42 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id f24sm2581139qkk.136.2020.09.19.15.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 15:30:42 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/4] Actually implement nvmem support for mtd
Date: Sun, 20 Sep 2020 00:30:19 +0200
Message-Id: <20200919223026.20803-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_183044_795272_BA0D9D98 
X-CRM114-Status: GOOD (  21.00  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mtd support for the nvmem api has been stalled from 2018 with a patch
half pushed hoping that a scheme is found for the mtd name later. This
pathset try to address this and add a very needed feature for the
mac-address.

My solution to the already discussed problem here [1] is to keep it simple.
A mtd subpartition can be set as a nvmem-provider with a specific tag and
each direct subnode is treat by the nvmem api as a nvmem-cell and gets
correctly registred. The mtd driver will treat a direct subnode of the
subpartition as a legacy subpartition of the subpartition using the
'fixed-partition' parser. To fix this every nvmem-cell has to have the
'nvmem-cell' tag and the fixed-partition parser will skip these node if 
this tag is detected. Simple as that. The subpartition with the tag 
'nvmem-provider' will then be set by the config to not skip the of
registration in the config and the nvmem-cells are correctly registred
and can be used to set mac-address of the devices on the system.

The last 2 patch try to address a problem in the embedded devices (mostly
routers) that have the mac-address saved in a dedicated partition and is
a ""master"" mac-address. Each device increment or decrement the extracted
mac-address based on the device number. The increment function is
implemented in the of_net function to get the mac-address that every net
driver should allready use if they don't have a trusty mac-address source.
(One example of this implementation are many ath10k device that gets the
mac-address from the art mtd partition assigned to the network driver and
increments it 1 for the wifi 2.4ghz and 2 for the wifi 5ghz).

I really hope my mtd nvmem implementation doesn't conflicts with others
and can be used, since this would remove many patch used to get mac-address
and other nvmem data.

[1] https://lore.kernel.org/patchwork/patch/765435/

Changes:
v2:
* Fix compile error (missing mtd_node in mtdcore)

Ansuel Smith (4):
  mtd: Add nvmem support for mtd nvmem-providers
  dt-bindings: mtd: partition: Document use of nvmem-provider
  of_net: add mac-address-increment support
  dt-bindings: net: Document use of mac-address-increment

 .../devicetree/bindings/mtd/partition.txt     | 59 +++++++++++++++++++
 .../bindings/net/ethernet-controller.yaml     | 19 ++++++
 drivers/mtd/mtdcore.c                         |  3 +-
 drivers/mtd/parsers/ofpart.c                  |  8 +++
 drivers/of/of_net.c                           | 53 +++++++++++++----
 5 files changed, 129 insertions(+), 13 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
