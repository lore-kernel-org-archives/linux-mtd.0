Return-Path: <SRS0=qv8i=A3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB2AC433F1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 21:18:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF31B207E8
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 21:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ntg/5inE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="nZ5a1iRj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF31B207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dje109p14XRnrNOrrqo/ZZxnwJhqjoixYcBF78NEqfY=; b=Ntg/5inEK9ToOb2zGWSGljGNGY
	g+LcCQb98Ut7xOW0Vm/egzWYUzqXNu8ReVw6TqM0cWmUUI5/Mh1oUGX6Q6sOvb+922uoViBzW8kcP
	OwGcqzKfBP8LHIUAVxHIffqonp+MbAwKCTZ7/oro7iJZpKioq0Gg/AU6LYt2N6qiVyoVxq0bHzXUn
	jK97snSSfyK7GyvjHb/IzDj7ICMLjaKS8McTM1fWc4+r8BS2SWgK8F3ctRBS/w5Sauyb+t3ljFMUB
	E7jwpiDWxV2foDQuqOVxn3M5VgiOjaHUWQ4OBzpWOW9lq2fVTXVfDpn8U9cKEIqrO8T8J1toiOyc1
	dbOWvI6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwBFs-0005Ro-2K; Thu, 16 Jul 2020 21:17:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwBFp-0005R6-G7
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2020 21:17:22 +0000
Received: by mail-pf1-x430.google.com with SMTP id u185so4290730pfu.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2020 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=3LXNyEBf2JATqHhliExPnElwLiD0d3lTc+jssWNiHaA=;
 b=nZ5a1iRjoKjGH37zTUsECSjSN8qQr2y7zKA8VlMsoSetw90mlTa5KFSFnzPOyb4OP2
 pIDRXq9vxkSPmjJTd/UatcjchGd87erAKietgAwzyRUcmTCxA2A+db19/1FnhH/eYZJn
 2QlNTmx2ihUvDxaznLocGnSIfrVkkYYExkBAhcAiigakyRuJ7RGwpAFUT7vQWvd6VWUu
 tKIiaF289aqzyXJCIBZfTLJhtsrfEdih758wCBxhT63O87fTOIk/X30yzEaaSc/hiG9u
 /HBkNrmt2vVA52GWx8tSWw/Vbc1CQMSoBpv0KE4UUVjeSe/H2E4xJNQCvBp7MJACj1uw
 G5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3LXNyEBf2JATqHhliExPnElwLiD0d3lTc+jssWNiHaA=;
 b=KS2RDeWv2SwclxnP5kGsSJhHYqd4eKxRcq/zo5nr1Vh0Ljo4WTJMG+dipe1fk7A+CA
 dqvHEgCDrrzmqSpQ3vAlzotSsdh6DHZpL7bELULICqCkA7RxlbFrF/W6sx9rrJn9EaNr
 PAkEz2ij1xzZ/3Qd8V59FE4tHwIEucfkFXMMo/iSxCCaFa51W0h+F8AEPY8M5wr8/G8q
 LWCYeHKdjjw4urODNLW+d3pUW7OFct5TEIAcfUE5LSdTSHBbw+q3Ax+lfziWpZ/DFgl8
 iYlbLf30Oqca5PBmtRs3PJApwzbKZHeXL5Xfi+SbC3C+FbQitpJB1op3vH1tmzLDKS9G
 +C9g==
X-Gm-Message-State: AOAM533eLUhxwNmifP39xTkmtSimBQe7hF2bKiRJFFFQvOTrNG68vEpf
 FQlh61UMeb9fo1oYggDIWXuHWsz0Xuc=
X-Google-Smtp-Source: ABdhPJzag1qQTyiFzIKZUkWgYdR64aldcCBWqPs6L+H+Gc1IbPRGftQ4nv67WxncJZWQUXO25R/XYQ==
X-Received: by 2002:a63:9353:: with SMTP id w19mr5819715pgm.13.1594934237362; 
 Thu, 16 Jul 2020 14:17:17 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
 by smtp.gmail.com with ESMTPSA id s10sm832889pjl.41.2020.07.16.14.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:17:16 -0700 (PDT)
From: David Clear <dac2@pensando.io>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@microchip.com
Subject: [PATCH 0/2] Support flash devices used on Pensando boards
Date: Thu, 16 Jul 2020 14:16:29 -0700
Message-Id: <20200716211631.38949-1-dac2@pensando.io>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_171721_805216_8B069389 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: snelson@pensando.io, David Clear <dac2@pensando.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pensando boards use Macronix and Micron flash devices in x2 mode.  This
patchset adds support for the previously unlisted Macronix mx66u2g45g, and
it enables x2 mode on the Micron mt25qu02g.

This patchset applies to the spi-nor/next tree.

David Clear (2):
  mtd: spi-nor: Add support for Macronix mx66u2g45g.
  mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron mt25qu02g.

 drivers/mtd/spi-nor/macronix.c  | 3 +++
 drivers/mtd/spi-nor/micron-st.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)


base-commit: fb249e1007e0270e305ea674012dcc4f95f1304e
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
