Return-Path: <SRS0=+6Wf=EO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE48C388F9
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 11:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFCF8206ED
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 11:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Ep+i7L2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaoihXbx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFCF8206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8uARKN3iMyF9xM1kVE+T7YqiMEOv4hnTmNDD/Aowqm8=; b=3Ep+i7L2LMOKYwCvCCIT9uRx4N
	v1lWCJr4zNGOgsiWB1XnwHYWRA7gYWthw3Cqc+wUV/331SeM/Qho4uTwZAOB95Lw0EN2by/N+TRFS
	YUoNU7cPNbCaBBGHCGdDsSTWsGNlMnA5lJYCM6jpg+N3wDXotGVztGxHra75XSPpwQOvv9qSUwJXD
	AISDVXDwGMWNbgihTeRnVNSjUWDu0bQ3OOi0dSXt43HKue9ZfOewCf/A2kOzVZ2lZWRtfwcDm+dCI
	CHIP0R/Ro4r9z+lI8bwyC6ERgcBUNXNkmTxss7kyKKTDT4fM5OnMZ+QFAyyT321BRuvGXN9l9az5p
	FLDKNwUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbj13-0001E2-B2; Sun, 08 Nov 2020 11:37:49 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbj10-0001Cy-Rl
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2020 11:37:47 +0000
Received: by mail-pg1-x543.google.com with SMTP id m26so1028605pgd.9
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2020 03:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WZtQivcQ+AZubSIg46b9m4DEOzL0fiKWbinL/KFoggA=;
 b=CaoihXbx23aeFZpxtNy7GTt3o+aBGBdyZlNtc35S0IPP0zW4umWFCe6d3/3HWqgRTx
 Nup857PQXsKuNwQ/WxQCEngwlATThEUyPZRiSNueccU2gnnrIBG9NlIwIJkZhAsJVTHY
 H4ShPEqR4II9BqZGn2d+2p9MPhv4t0URYbkWYqV+RisPhX/tuOB/iw7svZo+T8JheyQp
 mCGcJnh7bDSxYhAVQ+spkz2qSHb/zR5HVvWhi368ldiew1KIxzLsVJfn1PFXTysvMm2Y
 XNkwu5AhfAq37hwN7CAbOZqlYPDvFhEeo5Y3l538lQyQR3NTkHIOhIuPaTPBmKkBZlHY
 BToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WZtQivcQ+AZubSIg46b9m4DEOzL0fiKWbinL/KFoggA=;
 b=DCK8TacYNp37gn/Ume2+WS0IryMepNxm4oqQ26JNa0hOL1n07Wq4fOL9QJNxkrHTa4
 c53ni8XO6EXiJ1eNcMx3az4qsdtZpxQHTBQfFJ2gxv1deZstuEhRsX3T/7AZ1EUzvF2G
 HF5uv5yrzd/Xg6b9fVvwJoCdCh3kP15bjrQN4hWSqZquI2eYQ79PKS0zmKx+p2OkvpI1
 M698s8oktKoz5nFFGJBlbVztXERFN1YCgKLsIiRpnW6j7vVOX7gO4Q7WSGBlg3KYR2Yb
 1Uao+ohj324dvqdCE7bmKxJ9Eb1AvXhU1OeKhEBykq6HopBk11TjhWm+HyNwrl23Ebl8
 GM2A==
X-Gm-Message-State: AOAM5332P5LRx/mrhbzlYJBS/PgJWjsKio66Ge3ZY6vfj5Ai2CnQWT1l
 9ShvWnw/RlZhptzSjUAHzVE=
X-Google-Smtp-Source: ABdhPJywGga5A++IlHOh+wzruJpPJXt/uQ8cIH1WYVoYxBgFTHkaCuSe8xncy4byXhIzP63Dq87VZQ==
X-Received: by 2002:a05:6a00:2292:b029:156:8913:e424 with SMTP id
 f18-20020a056a002292b02901568913e424mr9626833pfe.56.1604835463114; 
 Sun, 08 Nov 2020 03:37:43 -0800 (PST)
Received: from IGL6397W.cw01.contiwan.com ([27.104.143.83])
 by smtp.gmail.com with ESMTPSA id t85sm7230263pgb.29.2020.11.08.03.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 03:37:42 -0800 (PST)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] Add support for micron SPI NAND MT29F2G01AAAED
Date: Sun,  8 Nov 2020 19:37:33 +0800
Message-Id: <20201108113735.2533-1-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_063746_923868_F6B7BE2A 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding support for Micron SPI NAND MT29F2G01AAAED device and generalised
the structure names as per the review comments

v7: Reverted to the v4 except ECC structure related changes

v6: Reverted the SPINAND_OP_VARIANTS() as they were in v4 for
MT29F2G01AAAED device

v5: As per the review comments, the changes were reverted to the v2,
except the MT29F2G01AAAED device related (including the review comments)

v4: Split patch into two parts,
    1. Generalise the oob structure name & function names as show in v3
    2. Add support for MT29F2G01AAAED device
       a. Add oob section check in micron_ooblayout_free function
       b. Rename mt29f2g01aaaed_* to generic name micron_4_*

v3: As per the review comments,
     1. Renamed read_cache_variants as quadio_read_cache_variants,
write_cache_variants as
      x4_write_cache_variants/x1_write_cache_variants,
update_cache_variants as
      x4_update_cache_variants/x1_update_cache_variants,
read_cache_variants as x4_read_cache_variants
     2. Renamed micron_8_ooblayout as micron_grouped_ooblayout &
mt29f2g01aaaed_ooblayout as
      micron_interleaved_ooblayout
     3. Generalized page size based oob section check in
mt29f2g01aaaed_ooblayout_ecc function
      and separate case check for two bytes BBM reserved in
mt29f2g01aaaed_ooblayout_free function
     4. Removed mt29f2g01aaaed_ecc_get_status function &
MICRON_STATUS_ECC_1TO4_BITFLIPS

v2: Removed SPINAND_SELECT_TARGET as per the comments & fixed typo
errors

v1: Add support for Micron SPI Nand device MT29F2G01AAAED

Thirumalesha Narasimhappa (2):
  mtd: spinand: micron: Generalize the structure names
  mtd: spinand: micron: Add support for MT29F2G01AAAED

 drivers/mtd/nand/spi/micron.c | 124 ++++++++++++++++++++++++++--------
 1 file changed, 94 insertions(+), 30 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
