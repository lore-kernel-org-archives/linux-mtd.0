Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806DFC77B6E
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 06:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bPzMtkjBjlxtN0DHm45jwvFBenwEH1CcIhXvAH/07ho=; b=OHB7UUHP9Jn28g
	vl3f9I7x4GEj/eCd+CeI4H45BSHOAdqFHqb/6IJkrakgtcbOzG34XqGg95smXYvsNZRS6W1hoWTk+
	vLWnMedVExKtd2vf14mXO/KTzVfR59zgt09GUpIPswOoTXrUzvLFjr+/SCkpI1xk47gjxMFwQy0Cq
	zvhlsRLAOh51gmfKVAAf39TgDoFrTvwK5ktFEB1e/4wQy5Q64YLkOfZI6GeGOLuv/NJx4m9l6FAfJ
	ShqR00SryoUpmp5TNQmqvhOXFDyRFkGzCP7flXO29xph6fF5fIgMn8bbYBjATo1vwDxAfK8Xa2gvg
	uQGDpNIgZnDEC4CSxamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIwh-006SWv-1t;
	Thu, 06 Apr 2023 06:18:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkIwd-006SVG-27
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 06:18:04 +0000
Received: by mail-pj1-x102f.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so39715507pjb.0
        for <linux-mtd@lists.infradead.org>; Wed, 05 Apr 2023 23:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680761878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F0fiXKpYKNu2MAhebyIE17ggjHkWO10SE8hj8DKRRWA=;
        b=Ni0+WRjkT9VOWlsSBkGO0CDvc5vpWY3GqExde8VNrpj1V1kfYnDJNbxlDNxVjLxoCl
         YfXKbwysW53hhwUBW685d63NFuGTzieaVSaiX+9NW86e2STJg134QJnkTpWB+taKsLNp
         ZBNWev9XuL8Ah3uDQ91nJpSbKL2aetc8Mu26k0YeRsk8ptUmua9FKuKY3VoHka/ywMn9
         fN132xCYaIP5DZFPn2SemxEI3fCevCe1iL3VsewTFozMJzncXAb8d68K5wng1Sbsttvp
         TyxSv480DpA5Bi9p0+y6Jfoi1zW+GEkXx8q03gTOZoPek9O8HutqdKPmxF0GkY4ihKkH
         o8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0fiXKpYKNu2MAhebyIE17ggjHkWO10SE8hj8DKRRWA=;
        b=I/eQgc+km9Kz1u56vnYY3MV20DpOGq3yHxO1JRl6NGoIUeks+S1sGDY1mLvvMJTLgb
         3bieilIrC8FaRDYwR2zpwAgdgqkvaKM1Nc8GmbGImtURDpD+jRP0Z4hMt3P21/SZCZ1d
         Oh13y/ftgnxEt3kKxEWn2k/+dUYbeMSBP2uju30DHYx8heYR1O+2kvVylXoqfAuiCNdx
         +QZJRUjxZd5HldQi7p8tRGE5bLprA0VssQatxbv/YNwtgtEhTsYBvp9hxN3VA1tsgyJt
         N4rt5NOV5R4Msm9m8BRMdpDIkjklzhNS/CHgR6FsgtQ4O1jbKyFnn+fYDRSBRMZE4pj8
         Vcsw==
X-Gm-Message-State: AAQBX9dip3ORKMosgTxWFzrWUWA8PNIbuTxhKFhHT1lFYeEVgYkDfcGl
	1jxKcMO5VK/UudWhMnlJ3KE4qDmXE1zjOQ==
X-Google-Smtp-Source: AKy350ZYAvMRLTUcsfZFMhxyTbpdwKg9/D3SGmeeVrwTQfFsQe3hDUG3xQLQ3gWi4lpktYiZUtdv+w==
X-Received: by 2002:a17:903:41c1:b0:19a:aa0e:2d67 with SMTP id u1-20020a17090341c100b0019aaa0e2d67mr4975689ple.32.1680761878562;
        Wed, 05 Apr 2023 23:17:58 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-38-119.msd.spmode.ne.jp. [49.98.38.119])
        by smtp.gmail.com with ESMTPSA id y11-20020a1709027c8b00b0019c919bccf8sm567622pll.86.2023.04.05.23.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 23:17:58 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 0/3] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon SEMPER flash
Date: Thu,  6 Apr 2023 15:17:43 +0900
Message-Id: <cover.1680760742.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_231803_710111_5506EDBF 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Infineon(Cypress) SEMPER NOR flash family has on-die ECC and its program
granularity is 16-byte ECC data unit size. JFFS2 supports write buffer
mode for ECC'd NOR flash. To activate it, MTD_BIT_WRITEABLE needs to be
unset in mtd->flags. In this series, a new SNOR_F_ECC flag is introduced
and fixups for SEMPER flash pats set it.

Changes in v3
  - Split to three patches

Changes in v2
  - Introduce SNOR_F_ECC flag
  - Add fixes tag and Cc stable

Takahiro Kuwano (3):
  mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s28hx
    SEMPER flash
  mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s25hx
    SEMPER flash
  mtd: spi-nor: spansion: Enable JFFS2 write buffer for S25FS256T

 drivers/mtd/spi-nor/core.c     |  3 +++
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/debugfs.c  |  1 +
 drivers/mtd/spi-nor/spansion.c | 28 +++++++++++++++-------------
 4 files changed, 20 insertions(+), 13 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
