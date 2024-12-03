Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00F0E6C5F0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 02:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=227VQdH3rFs4eIxoMqUR/qW09ZPF35s4mUX/KoDuLRo=; b=2FqaT1FCS7DYVs
	DBSqU5eL9EKwAmMe44CMYhV9NvWnjwNTyfvTUguXpX1/A+AOv0bW0N6KZ8rpKJ7GutZhp1rmnSy0J
	E6MFZxvnrgJxne06LgLCJzfeOnexqMxonG24SwWkGNk6F9msEZVPk3exbBclMMcbgF83kbxE7JyG7
	/thOuwezXLFgPGMUmrTGWZg1mhNQq6W7LP+5o/t0ZWKqBdcvN4sHSm3d6qU4ZPYbaCB/XoFF7MIcv
	emqmqh29267UetyyyIgjDQ8Yl4IrtLYCi8pgt5aMztmre+mz9Y8GQI5/dHkpMMH9Mr8nzkPpA49Tk
	0qTCR0pxnV1HYQmtMYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIwh-000000083YW-2xm5;
	Tue, 03 Dec 2024 02:47:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIwJ-000000083Sc-1xIS
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 02:47:04 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7251d20e7f2so4992851b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2024 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733194022; x=1733798822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hPyqhzIMSxJWnuOUuQpU0reG3RAKJpi+Lz1WmPNFCtg=;
        b=hKMx53X9o9HzUMVMJFcRf1Ox+EnIWHpO+sTUOWj95+wrAIu1oIOJGDcy0RJ9Aus9Dq
         V1JTSmrLCy2NNfrF1bIT9uEk0MT2GTEt18noS2+hOXYgr6S04n/hqIiF2r8JLqpI6nRE
         eiRa0pjx59o/S1lmKxt5oCZ4T5NcXiCpK6IOGeqiIgNFgAZnWbdXt7ktxiBEYyOMyEBp
         sIa9oeq6TX6SnYSaBFU4V3lBKms30xzhi3PgJ+RRSvqToex29qTOb4GWf7gJq1lwXexw
         j1DxvfRGSU9w1nRCD+my74C7PoJnBSOMPv1/enPyRErhVEbcIPc/Qv1AkB2DKrYS5WVg
         BatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733194022; x=1733798822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPyqhzIMSxJWnuOUuQpU0reG3RAKJpi+Lz1WmPNFCtg=;
        b=glAD9exKYeVomqerDNDwzstbXn0vT/SifskS0kiADxDztbqVsOdvg/ptboKIyDCxbR
         50eZX0PAAs0qZlostoNTKbz0ZprEbjwR7D0+XAoFcHDW290DBot+pfpmRJScy9sfQXty
         4qnxgFEs8NhsJNfDsoo/lJ7E4CR24kbaCIACzPzii0L+DrQ9S8DGLqnpveg/LUoRVk6H
         CUnFh9FBEFLILsIBZnF1eEEAjvXYpR5OsEC3Ha1c2IpJTz0t2WnTD2GjblLUxryMDU5l
         6JizVqkLjekdaT0NK/lqH1cukCOz2ZWFOdGdDdbFyDDXeGcWQc8tZ1NzMWyWrIKaOGxj
         riLQ==
X-Gm-Message-State: AOJu0Yztn1SkOauF2xkkDYvhn3vpOxhnIX6y/U4ERZryOnzn+JKvUMm6
	g15NiMrMi3vrtDyyvPhrPuUrHj9LreMgZX+WQ9XZaZEpfJKHYadoXZdjug==
X-Gm-Gg: ASbGncuC7l0GGjnXGROOF6v3Sk/yyb1HetKDewJ38dZEH4pzX8NnY8cBluLXYrUjsnD
	VZ5Zrww1jtOK5lNogcHqv3BzhBzDL3DMdLVscFh+pjo7Glr63xd2u4uYv8AIOVoNmDR1xWZN8DB
	OTPYOwArBn9VE2bJMt/aL4JHgFELgU4V8Pcu6pwxwKTXo3q2tKK7ginUEBDlIMTV55ECO5u0Uee
	JmoTuC1NheJFCc482e2ER1KuTPS+cc02dGB9KzbFgisdIG26AEU2EVGmkrig5ItAv3aEc//KIiP
	yju6Et/3hh+aCyO1H3wzJOD9LK9PkMbCIoYeAw==
X-Google-Smtp-Source: AGHT+IHXZ8srMItyQNaxrrIC9I0rILAhOCGAiMi/Ir9PAIv/TyR5TgFqgW5zvnXUz8/AV5PHIYfrMw==
X-Received: by 2002:a05:6a00:2d2a:b0:71e:6c67:2ebf with SMTP id d2e1a72fcca58-7257fa67cf3mr1019665b3a.11.1733194022151;
        Mon, 02 Dec 2024 18:47:02 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-81.msd.spmode.ne.jp. [49.98.220.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d634asm8605693a12.8.2024.12.02.18.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 18:47:01 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 0/3] mtd: spinand: Add support for SkyHigh S35ML-3 family
Date: Tue,  3 Dec 2024 11:46:47 +0900
Message-Id: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_184703_503629_6AA9A840 
X-CRM114-Status: GOOD (  11.16  )
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

This series is successor of the patch submitted by KR Kim:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20240820064547.5035-1-kr.kim@skyhighmemory.com/

Changes in v3:
  - Add Fixes tag to the patch 1/3

Changes in v2:
  - Add new patch that removes redundant write enable in markbad()
  - Make ondie ECC engine ops return error in raw access case and add
    fallback mechanism in isbad() and markbad()
  - Add detailed comment about block lock register in Skyhigh driver 

Takahiro Kuwano (3):
  mtd: spinand: Remove write_enable_op() in markbad()
  mtd: spinand: Introduce a way to avoid raw access
  mtd: spinand: Add support for SkyHigh S35ML-3 family

 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |  25 ++++--
 drivers/mtd/nand/spi/skyhigh.c | 147 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   2 +
 4 files changed, 170 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/skyhigh.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
