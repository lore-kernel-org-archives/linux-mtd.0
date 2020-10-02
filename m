Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A36CC47423
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:20:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9515D20796
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kgZvuqS8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGouKxpY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9515D20796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2IFj0f4woBSUS8H5+mgDq2VE8tFxHJFCO9TY0GIYQdw=; b=kgZvuqS85EaYWQAmIJjcJtkOWI
	AvDI03s/KxQoDtYjLlDmdtrLXKxg3bpVbpFNj4g3AOxE9Tt1naHRiAnWRfZtOCxiWQC1nPBMcORo+
	zKWJsqNnUvUux1JgW3BQeyl5zENsaOmaxFeNNDQnNqLhdwP5APJQcHbMG3NYD3SaBhvyypmaWNepa
	vwQIQlg7NmKDVT5K/y6YRywdPOVgh6bJ0OYueNZRDHfWVTmuOFvlevecrpjBA3xGu9AGkOcZ/rDX9
	Q7FM9jfj3o89cJWMuliD7g6Zsfn2zZNFu3JOOkpMDC59r943mRd+lzWlk9ES60uZtbSVy1K/t3lnC
	0kWoTRBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kODTA-0004sP-JB; Fri, 02 Oct 2020 05:19:00 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kODT7-0004r7-Rl
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 05:18:58 +0000
Received: by mail-pf1-x441.google.com with SMTP id w21so455684pfc.7
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2020 22:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQtHqXjRYxN1r4+LkBeNnGwpY1KrDA0bB7WOGTvXlUs=;
 b=CGouKxpYUOOTpMot0ofCu85aRlTOnSvl524/IsLDkz3TZ+LE5kL4c2v5loiTfV4/ot
 qolBKUZjf2gmn2LzUvsSwgEOtNeHgfe5+U/LgMOP1/+xTID4crDgoLVAOgfCsOkuN6g+
 kklfq2zwuRJ+EXq5rtWwQVmaMOXQjH8jV9QfBZvK6tnz3sHcB9kXELzfKq6IITN8iBk0
 XqSLp5g6mhyB/EpYtLjvG95IirbH+kHxT+UhYqRZtHOf/+Xkn8vrjbnCE8VeAteh1nLs
 IHoZCTSIzBTg9qMXNjM7x0flYhgBZVIvxtVXOFKGZta5GTUC8FRUnJL9poVPRQlb/APT
 VmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQtHqXjRYxN1r4+LkBeNnGwpY1KrDA0bB7WOGTvXlUs=;
 b=loRzZv1Vmj1DCFnxwev2MMoAFL8cWeGPfN1uu5QUQ0CY5SGFIV3o7FC2qGswp6LUhc
 WMJ6grufpPkcwsmESuAWLEtLDza8qsejwQMLPxlveMKIzbr7fA6dW1TDe00Pa08vv4zo
 nJ8UNfRe/FRnspMHjByKXBedQGmlKYNJie1bLaJuMeQfTJiXXB77oHTeXnN0xbaFONyw
 5LhAf2ARQat+9JQBHjaVCtTk2cn9XSH9R+Fd+yCyKkjd3DletSb4q0FAwPKNm8+kUphf
 Zrceo1BBxejIjze4iS0QbiclWWh8HUI3ornRhgJipoVEdyX3+7Yde4iWew5JMiw0C0RN
 ofLA==
X-Gm-Message-State: AOAM531/ds8xYuq3aFbnKrF+J4tAjup0uzesN2oixjtMmli/TTdK3fxY
 8+XUvYN2BbBKC38c9rW/nSWjrn5qPaE2Zg==
X-Google-Smtp-Source: ABdhPJyZhBzkUEB4tmt/wEwWayx5PK1OiuvKwtTOkmxZBSKRc5jSasgDkTCz1oMmhjrofOMTeVyt3A==
X-Received: by 2002:a05:6a00:1708:b029:142:2501:3a01 with SMTP id
 h8-20020a056a001708b029014225013a01mr740722pfc.80.1601615933472; 
 Thu, 01 Oct 2020 22:18:53 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id s66sm380773pfc.159.2020.10.01.22.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 22:18:52 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] mtd: spi-nor: Fix non-uniform erase map issues
Date: Fri,  2 Oct 2020 14:17:58 +0900
Message-Id: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_011857_998374_7D5ADE5A 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Bacem.Daassi@infineon.com, tkuw584924@gmail.com, miquel.raynal@bootlin.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

This patchset fixes the issues in handling non-uniform erase map.

Takahiro Kuwano (4):
  mtd: spi-nor: sfdp: Fix wrong erase type bitmask for overlaid region
  mtd: spi-nor: sfdp: Fix wrong index of last erase region
  mtd: spi-nor: core: Fix erase type discovery for overlaid region
  mtd: spi-nor: core: Fix erase command list setup for

 drivers/mtd/spi-nor/core.c | 10 ++++++----
 drivers/mtd/spi-nor/sfdp.c |  5 ++---
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
