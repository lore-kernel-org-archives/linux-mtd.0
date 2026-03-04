Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88780EFCE4D
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2026 22:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BmSidUy+k1sHMdz8HCMfef4mpUYqM6ae6oSA/A1iCWQ=; b=JE9e/fqkZLP/CP
	1k1SWqY6WQkv+LChNKkAR20JsWAH5sFBiVrVM+nQCeBqinEUs04pGjQ3fSCrX7bPiSV5Kuk7UjS/3
	yV0fsonAnL1S1Rd34ZHpAZjhGjUSQgvEnqnMg0vQ5/rQr3JW76KroZNLsh4J8+rsjrmLH+F9R1A+m
	7AxrmuW71LQqHdv3QZ2/ECev9sp/j+6TWt1O2ZGKNDrKlZwpaVfsgw7ocZ0FYVrogLcIe93GqIvWk
	dz7xImF8FW1bZ/Um2mvXuEWVorIy9q8SXAkYvwff+fhRT6Q9sqGkSUZ93tMaChP1Kw4Zs5ixjkM2/
	WoS8VayOtN8Cdu6KqWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuVT-00000000ZBZ-2bvM;
	Wed, 04 Mar 2026 22:15:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuVR-00000000ZB0-2vrD
	for linux-mtd@lists.infradead.org;
	Wed, 04 Mar 2026 22:15:50 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82976220e97so632300b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772662548; x=1773267348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pknTK9DovrvOWreCLiec4pXoC+apbckmLy6Og46MTYI=;
        b=DczIwghxj/j3oa89XO8fSzWTCEIVeXH/JUTZZ6ahhZea0MArckj45UQg/M4CXPXoD1
         0aifsu/N1+MAWMPok85OmptRlAeib4sGc2U6iLzFEk3magdc+JEbV4YlUpdc9ADJQY2F
         SQ3ZhDOMkKfr8uznp5w5rbUjyf46ofQRULkABPt+SvFK3Yo5dJ5d0msShpZgAmd/B9KC
         Q8dFkKBvPPVoIxcWQOI4RyR2MSJ05b38JZAmYA+/BedWf/OzXun94Bhks6RxpqnkjmRT
         IMc2XvrdQos7/4wNBneYNESRGBcZtYkCbdOypHxeGhWddv0CriPvpFHiYxd/FoZ/tChX
         j85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772662548; x=1773267348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pknTK9DovrvOWreCLiec4pXoC+apbckmLy6Og46MTYI=;
        b=KBXchmYbgPd0SXMZVyKL3v2KnSvWOaBvKzluv3WYtblZvSghw/bAuC0EgS4spnmV/F
         Hl5Z+icu7BSPDa52Q92/n31baOEhhtVKvyu3EYd2YF28lfV7yZjX6h5GGgpVcWbyyhx9
         8I67qH0ijfYlbjvTUqpqjzNP1Ld5GJwXxKuntmw3FnKxi5URPtM44mgg8GG9i7G3iOUT
         3igC8giE6XzIXqvD7kv7E9Ffihrmg4+n8SVfxcm3Jlthylx+wN846sCj12b6O0SYGzmG
         QiKJd8PxHo33DUVwapsIIXjBLhEuucTXU/qXNML41TvQr4yIRBvsFHcvaJhH5W1eGxnN
         2DmQ==
X-Gm-Message-State: AOJu0YzfOGCTxJdxlBl7PKMZkYZR2LzUA1YQN1XZMiW/ybM1WUwkGiKb
	bHWh8JISEaqT2Ikakg5djghQRJAWKVYaV9zHvf8OZXTAeCMA8dLsSKYsRtUpU635uQA=
X-Gm-Gg: ATEYQzy6Vpf3mSlAop7Cx30W4/2Ja9Vg5oAsaa6m8Ep+Q8xCznvTs2smTzigJpmt2NI
	QFla5zxB5yPVL0RI/lWIIj9uu0Sp+S14BiGrAuNJM3rSGawNuvjAEMRscj689I/NEW+ofWqbeQr
	EdVDWq1N83wr4Nm3pnShjlwqxaWsuKbtuAQAS4nrz+qIO4uZ++0uVzU5+VM+tXb+Ooysga159uq
	Wtohln+HRRx7t54IavZCBoDLWvN7Y1dp3ezHU3GS90K1to6VO2DBOPEF8nrAjsJCK5Jx3oxK8vD
	saWjwxVMg2vhIzdzOQDRcTa+Re21GT92HAjXsk9xqq5s5XLt+Vx6rlTawyw2eAWc1fx1b0t2nLF
	fPs7bfyfwsqH/QTfvPpIiha+oN6qp/MwhY5Giokt65lncGiGLPE57jYrS26BsXhVVMIrQJSPtEv
	0XHtr/9xK52IopaLamPBePNOqUrLsuNnN5Z+/o+qn1QKqv70eBlb1NltbFQb1jaIUK
X-Received: by 2002:a05:6a21:608a:b0:35b:9ba2:8cd5 with SMTP id adf61e73a8af0-3982e2036d4mr3459771637.56.1772662548516;
        Wed, 04 Mar 2026 14:15:48 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa6203a6sm17637399a12.8.2026.03.04.14.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:15:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 0/2] mtd: concat: use flex array
Date: Wed,  4 Mar 2026 14:15:28 -0800
Message-ID: <20260304221530.15018-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141549_774652_2F3634F1 
X-CRM114-Status: UNSURE (   7.90  )
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

Simplifies allocation. There may or may not be missing frees here. One
allocation is simpler to reason about.

Rosen Penev (2):
  mtd: virt_concat: use single allocation for node
  mtd: concat: replace alloc + calloc with 1 alloc

 drivers/mtd/mtd_virt_concat.c | 19 +++----------------
 drivers/mtd/mtdconcat.c       |  5 +----
 include/linux/mtd/concat.h    |  2 +-
 3 files changed, 5 insertions(+), 21 deletions(-)

--
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
