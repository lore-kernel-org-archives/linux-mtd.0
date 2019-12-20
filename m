Return-Path: <SRS0=9iyA=2K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A161C43603
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 11:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B75B24682
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 11:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3XAJRL7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="t7uLCHPm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B75B24682
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lDRr4KaoGTxZbl9xiSnyrh+6Ix10XVfFZSaKs5fnewg=; b=X3X
	AJRL7VBmDBYCY7GGQwr9G2VxcI6EscWujaSTh0XIpYbTYJm/gm3G7e4dvi6XC+/VLVhYvwZY4DAzu
	F7c9yUESDrth/aZU/VRG0i/7LYiFM061D/h1S0DNnYbImMIPteywKzmYK3wG+0KhCLuOLcvAwxoFa
	hZPWrriFTeUJdKrvdz0t50A+pnU+6oEccXG9JjATshkaPuHv1ya5fiSitRFA6TXRqAB6FRnY7YMtC
	djE89T+B6s94rSi7zLRL6MVVleyK4MQxEGPTmrky8Wzy6jjGHCejUlY0IZ9uRN+T6HOAq/9KsK158
	gJ6Ek2U/WrSs9QAbgoYF3l+1tjDcx9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiGXB-000107-6B; Fri, 20 Dec 2019 11:33:29 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiGWJ-00008v-4e
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2019 11:32:36 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id xBKBW2Wt010984;
 Fri, 20 Dec 2019 20:32:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com xBKBW2Wt010984
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576841524;
 bh=6jBixM0kD4Z6TDatL5XzWOLAsBsJ6q5AmXiipGKg7PA=;
 h=From:To:Cc:Subject:Date:From;
 b=t7uLCHPmhCDjQn2UH113INPsymuwdIgQQTb39RAQ1PqTNqSC2PTZ/t4Csuu5m0B8z
 4oBITna0r3DfIq/t5cPhKmOeheC01CPYRtRjnDm6wxn2URSunjeAMLk6j+39bV9N8y
 79IsNPODMx3zCBIQmIzHm9cq7OOma3vPk8XCWprq+YWKXWZ8xkScJaOZrJC34aK7px
 k3mGZXNBKBoCIRFssKJw1fMStrcFNaAUco1EoyEj2YVJLqiRrTTghUanFkFiNxas6/
 /hoyonHHTuXuBxYnnqcq/KJQRX5L2kdJZ+m0ksdWNorOhyQmbysKIZp3xBhIBf5klr
 dC1bLDbhkNIXA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/5] mtd: rawnand: denali: a bungle of denali patches that
 is cleanly applicable
Date: Fri, 20 Dec 2019 20:31:50 +0900
Message-Id: <20191220113155.28177-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_033235_426604_3CE5A0A2 
X-CRM114-Status: UNSURE (   5.60  )
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some Denali driver patches are flying in ML.

The recently re-submitted patch
http://patchwork.ozlabs.org/patch/1213986/

... caused a conflict with:
http://patchwork.ozlabs.org/patch/1205912/

Instead of discussing "who should rebase his patch" again,
I offer to rebase and tidy up all the patches in a series
(if useful for the NAND maintainer).


Marek Vasut (1):
  mtd: rawnand: denali_dt: Add support for configuring
    SPARE_AREA_SKIP_BYTES

Masahiro Yamada (4):
  mtd: rawnand: denali_dt: error out if platform has no associated data
  dt-bindings: mtd: denali_dt: document reset property
  mtd: rawnand: denali_dt: add reset controlling
  mtd: rawnand: denali: remove hard-coded DENALI_DEFAULT_OOB_SKIP_BYTES

 .../devicetree/bindings/mtd/denali-nand.txt   |  7 +++
 drivers/mtd/nand/raw/denali.c                 | 14 ++---
 drivers/mtd/nand/raw/denali_dt.c              | 56 +++++++++++++++++--
 3 files changed, 64 insertions(+), 13 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
