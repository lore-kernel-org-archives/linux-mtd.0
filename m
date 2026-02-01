Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57F8E65296
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Feb 2026 16:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MbiNNDNS+TjFIBcGN6m7VQnawOgyp+10LVuWaONlZw8=; b=Ic8Wg6ZGopIz/g
	vV94DBstAnKp9f5x0u+s7EFSICY3lLE1K8ztPPWHZOZKyzkBq0tFw6CoLbljjeXBo8cuA3TR12AcM
	dyRzMDRQJ2wUABC7Zv/0WOjH62S/SrJL9uFhgkRiu3Aa3mMqKBcKOh7gGGsn62nzS46Cwu4R9x/A0
	lsGSASKvEVUNflbzQW3BJutYCZheRmyflGXSk8o+MRAk01kJM6a5T4xzBjMlkQ/OQZ8A4QC8WGjRe
	dlul9zuyo2JV3dTLpyibkcFKNBEvhk9KGq7AgKlk0Gp5l0jgzRC4o1NJPV+O9tU3g1Sa5Jm4J3+Od
	gKjOfzlDUwT19A1adgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmamP-000000040kv-417e;
	Sun, 01 Feb 2026 16:58:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmamN-000000040kc-2Xy8
	for linux-mtd@lists.infradead.org;
	Sun, 01 Feb 2026 16:58:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29efd139227so23228735ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 01 Feb 2026 08:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769965109; x=1770569909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMi7cbjI9Fovr5w+SFoD33u3qHgdv1NfNra3tupS9QE=;
        b=c7fcfGTrQLADsF4vS34HCt5Gy3bXkJEgeo8fJZ3hHEKB9H1X4Wr7INXcJ7Lbxarc9u
         x5W1nBhh+1XJzcCSbpcpX0lII4SX2OgEX2xZ9zdvRrU00Bq+zHuYf5hXee8UE012lZDm
         trDadjrl1/C2UTMcjpnWZpj69Jmtcy5Oc3urnzZ5POVI2GmboxsHuAGso17PXmI8UJbW
         dyofS5j7WxvSUTRwOXqCjCzXN3ps/OsArPKIBBvEqyXHpXW82zHMn1UG3dCbIZsjGUtJ
         nocu2rqBUfW4jnZudBT/N4C5KZakiErGoObfhUX/L1iXVkVPeUskGhesdIm/RxVSfYOB
         uYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769965109; x=1770569909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMi7cbjI9Fovr5w+SFoD33u3qHgdv1NfNra3tupS9QE=;
        b=Aalyu3QKM/Ukhgl/6eTcBMB1i0t9vyF8VKaAwi8gYQtQVwRv2klSHbNYQrShASCceM
         IOiqrXYjhhsLfAT2C5NTWaKMK8wHhnSUWIHSemRibylmgHvxBVUTWpPAm7qYw7ngb1b8
         U3iwXQLhCO+HamjGSEoXwJ8LvNUasYxCbA+L/a+O4iQ7Sw8I4WxpS01Gxlrjwwl1+2IX
         0R+gOEcwfM41p5/eQ+AdgaYSNEo6pYW6Ma5ccVcRP3Ui56ywMuu+TgOdahIelxtr2T8Q
         pd0+EJ1/OZA16taf5UVx+mrJDCo+St3SXShYr+l0lyIx2n6EmfkyV9QFpGbKDK0yVxxD
         WD4A==
X-Gm-Message-State: AOJu0YxpwzLKe5EzhI7/KFKHqtyfergwZWil/U9uEE2W1qPaEAaLPK8m
	uMgoR4ynaryR4BFF5jknk3Wj7U8fPuPD2P4XMrEfAWUuL4vjGS/XpVaE
X-Gm-Gg: AZuq6aLNVD0aCCwMUWUPd6RY852aQ4rE5R++jcmdXWteB0T9Bk+w+WnXmzJ93fIz/iV
	auOtxA463FyKS8upVjU8YgyxrC8xiISPtCtEjl8t5pvLfbzkfrNXcgznOsOZPjyH2Qc/aqz5ycY
	EjUl8u8xtPvuBORLiVb+awZZrqfKVwjSjlMOSs4UM7YLR+SGSmtDtbhbLa0wVdFRb//shGwdPxi
	H5eZJ70l8ZvofAkMYq75Tz5n1OpitBRLYzToB/xuj6mkCeNTMky5LYeK+FQsPNFAF6WYjuAcq3Q
	DnmloMmK1RnHcvqL/VwyYWBIl68/yuMeI99vPoXBRHqluBmOddyFooW+IIHS+kApucPWvH0jBjb
	4l56PZc1bpU1+t1mUbL0CRt3H+s+35QyaTBPfHbTkl4l0Psks3u41/DHMdctoNJ6qzVncsANWgu
	K69lJfvcGiEdvhQ05rElVfYkLW
X-Received: by 2002:a17:902:f788:b0:2a0:d662:7282 with SMTP id d9443c01a7336-2a8d80378f2mr94160115ad.37.1769965109391;
        Sun, 01 Feb 2026 08:58:29 -0800 (PST)
Received: from 4aee0dccb4bc ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3afdsm120222755ad.61.2026.02.01.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 08:58:28 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
X-Google-Original-From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael.walle@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
Subject: [PATCH 0/2] mtd: spi-nor: Fix SST AAI write mode
Date: Sun,  1 Feb 2026 16:58:15 +0000
Message-ID: <20260201165817.53-1-sanjaikumar.vs@dicortech.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_085831_681084_FC44B657 
X-CRM114-Status: UNSURE (   8.34  )
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

This series fixes SST flash AAI (Auto Address Increment) write mode,
which was broken due to two issues:

1. When writing starts at an odd address, a single byte is programmed
   first using the byte program (BP) command. The flash hardware clears
   the Write Enable Latch (WEL) after this operation, but the driver
   did not re-enable writes before starting the AAI sequence.

2. When the SPI controller does not support direct mapping (nodirmap=true),
   the write path falls back to using an operation template created at
   probe time. This template has the standard page program opcode, not
   the AAI opcode, causing AAI writes to fail.

Tested on SST25VF016B with i.MX8X running linux-imx 5.15.71.
The conditional write enable (only when AAI follows) is based on
code analysis and not runtime tested.

Sanjaikumar V S (2):
  mtd: spi-nor: sst: Fix write enable before AAI sequence
  mtd: spi-nor: core: Fix AAI mode when dirmap is not available

 drivers/mtd/spi-nor/core.c | 2 +-
 drivers/mtd/spi-nor/sst.c  | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
