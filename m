Return-Path: <SRS0=bEc/=4X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77655C3F2C6
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 03:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC0B2073D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2020 03:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ixOBcicP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC0B2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=81MWalQlY8nMFMzgu3BLY47m4o+s7jdEo+QR1UihSO8=; b=ixO
	BcicPhV8wPcFQm7Go91fxGXAInXZKQf1Hzt1nUvaVL3PwaDe67TexGQ2PKdq02sZNv0vjhEYrW1tW
	RcnytCP5pqysp+XZ9PGswvmDtjxn0hnAohBuujOZxmxFeJ/ELxDQQRav0gIL78p1IWHRhY5gnr2az
	OgrAYTHIdS66K8FZyDFJzPTNx2aS25mg/pBngeAiNZojpbIPmPsvHI95Ftdc0RCJaVdxvFzIwxAyB
	Ntw72wC2mg2piea8wxdSBIbmBZ6PiS6pK5oj4T+VmVLrq+WeIpW0MTcR3QDiK/8u9/c+g0hgD6FdB
	/1Dptk2XOjczK/Q/S8I6bRn1PpFqiwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA3Ls-0000W4-2Y; Fri, 06 Mar 2020 03:08:40 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA3Lp-0000Ve-Cx
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2020 03:08:38 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 02638Q0D003586;
 Fri, 6 Mar 2020 12:08:26 +0900
X-Iguazu-Qid: 34tIY4cItsxDUY9Iiu
X-Iguazu-QSIG: v=2; s=0; t=1583464106; q=34tIY4cItsxDUY9Iiu;
 m=+i8Z5jthqs8lewgIQyFS/3QaoZABW1knr5SC80GC1gw=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1513) id 02638OTA011326;
 Fri, 6 Mar 2020 12:08:25 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 02638OXN015888;
 Fri, 6 Mar 2020 12:08:24 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 02638Oj0023927;
 Fri, 6 Mar 2020 12:08:24 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH v3 0/2] mtd: spinand: toshiba: Support for new Kioxia Serial
 NAND
Date: Fri,  6 Mar 2020 12:08:21 +0900
X-TSB-HOP: ON
Message-Id: <cover.1583371913.git.ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_190837_691832_DD6B9D7E 
X-CRM114-Status: UNSURE (   4.47  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

First patch is to rename function name becase of add new device.
Second patch is to supprot for new device.

Yoshio Furuyama (2):
  mtd: spinand: toshiba: Rename function name to change suffix and
    prefix (8Gbit)
  mtd: spinand: toshiba: Support for new Kioxia Serial NAND

 drivers/mtd/nand/spi/toshiba.c | 173 +++++++++++++++++++++++++++++++----------
 1 file changed, 130 insertions(+), 43 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
