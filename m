Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD25BC25B06
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 20:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hyyJ5hNhEw1nA7vC6m7P5JWmv9EmjMTchdd7K8kcwU4=; b=CtzDgggDH3u/PF
	q/uPWV/OAPUpBFPauGuevzKepIeik6q9BoyTZ0Q4s7+ezxM9y1AmRVVjKcb94AY3NrpZLFUFDOYrc
	6jjTvwL3ryH3J9KOeuzOZ5uTdXV6jlKRDvJ76uGFXcgbQSV/M8Jf12jUFOCk04BIE7+caQ4w9Cb6H
	To1Z1XPZHS2APWCSkdXTphOFVMzsbokXAPcGnYoamWJG4eXB5nvGgfmQMegfvUYUgIF088AE8mKrk
	tNrEwuu2+TzytkUEpdbuJKsoWPx5Y/p2c/uxTOyR0+yTu5hUX3bxosgxDf/Tgji2WgdK/mmGZvDdn
	Wf/6zY5jMZytuTHq90IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVco-006B23-FT; Tue, 09 Aug 2022 20:14:50 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLVck-006AzA-A7
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 20:14:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id h13so15515596wrf.6
        for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2022 13:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=6Qonm6iaHiCG37E9Vy+iyvt+Lcl9E0+zQmTyp2y5GN8=;
        b=MA/SLCzGbcsdtjX0pFpdjQSE9cMe4j2H3ERl3C2t4PacMtVR90dl1kamzZQEmUtS8d
         nYLjkj669ey764cGjq7aU2h7vm27uhO/cQmglBcIsFmyitGXIidZkhM77jScmlThXvpp
         ELCQDGOfzPnf5Vs3Cymmg7kq1H/eAr+K3X/zzGKw7WDejZ/vkUeJizniuGRwfMzk+RR6
         zEGXVkV6ZbZOKmLlgsfa5Nj+GElHb+uk3SIxu/kQSPCxqwcxuCwJOKvCXs16yppGn1Vj
         OSVk4YiNEkMjcFUpicon95mSOJIzgMXNjdeknuTslak7AHEzrlvmwKDpmR7E+fSg5ufP
         g+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=6Qonm6iaHiCG37E9Vy+iyvt+Lcl9E0+zQmTyp2y5GN8=;
        b=hsdtV0MrZgqWjZg6R7FhufE64wx692AjL/uDiSyJ31/+qS6rJIEpg8LInyZM7uNGFv
         bQzUH2/ahOw3SkesNMLmQzua4q0G/noazB03tE+mlVvFpUoByscPRzRpMTchrsIx5Kft
         cNbpz/ta58eige4SCiRVi0FkQhqaphD4eVKBPeGCpDpD5vBjA7HfHtdQMlDQD5PNzpxG
         Dh+wvuX3qysq16XYGsUmaeE6kLQSRZvVb726tjxIUlYCDSZgNMa5wg1j9/sNgoVvbLPl
         iq2Wzgj3z1aMI0RqUoDwhzSjOMIICDRsE/s32UTTdOmFj8/Yxmg/k7ZJgII4qCzpQ40T
         5DTA==
X-Gm-Message-State: ACgBeo0xaaRz/rdQdjXX7Yd/xxhvyFsCHLZnbd0OIbMZZFHI0g/OLSpz
	UuR4TnzT0a5UnFovB7MjzD7QTQ==
X-Google-Smtp-Source: AA6agR6S8ASd/btWcHQaYoP+no/BZLMyuwD9cCluX0U4Jf6RkxELiN64K4xWSUPO04XqbcZj4GNelw==
X-Received: by 2002:adf:f30e:0:b0:21f:afbb:db23 with SMTP id i14-20020adff30e000000b0021fafbbdb23mr15241313wro.490.1660076082904;
        Tue, 09 Aug 2022 13:14:42 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
        by smtp.gmail.com with ESMTPSA id q15-20020a7bce8f000000b003a53e6c5425sm24041wmj.8.2022.08.09.13.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 13:14:42 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH v2 0/3] Add support for Quad Input Page Program to is25wp256
Date: Tue,  9 Aug 2022 21:14:25 +0100
Message-Id: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_131446_396522_64A7C14D 
X-CRM114-Status: UNSURE (   8.48  )
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

This patch series enables SFDP support for is25wp256. And also adds
Quad Input Page Program capability as its not discoverable from SFDP.

Changes in v2:
Enable SFDP instead of using no-sfdp-flags.

Sudip Mukherjee (3):
  mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
  mtd: spi-nor: add SFDP fixups for Quad Page Program
  mtd: spi-nor: issi: is25wp256: Enable Quad Input Page Program

 drivers/mtd/spi-nor/core.c | 9 +++++++++
 drivers/mtd/spi-nor/core.h | 2 ++
 drivers/mtd/spi-nor/issi.c | 4 ++--
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
