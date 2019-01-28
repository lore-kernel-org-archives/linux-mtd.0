Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B043C282CC
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 02:22:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323D220C01
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 02:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ek29BSVq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ajwfC0Lh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 323D220C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p1BJ/3PAu+0pDmnprK5XepMvmi2k+wVjzgupybhRg/U=; b=ek29BSVqQShWV5
	l2vLQ787YVVQrgOPeK/U/tcpzaVbAvTDJXfZy2VYyrbPHar50Kfj7pI/MN1Dfeu9JZ/9NAfvX5Zc6
	dkLHFmsbRZWRBLMQjo/xnfKDGeG9hOtkW5fUHhqXDwrDImFmsJJtpjSfN7E3jf1paPtw581Oekpdz
	VJFg1qqdm3zbuwhRwwWi5BE5aZeEYOIaqeChZ3q6GGEZwgThbS70F/mUfdtt6+WOOG9S1dYD+8v2T
	yxVxx8gt0ixljgcW69AnAHuXvNx3esDb+cYSqLjl7Y3d5sc3RoL9nHk2bL9wBc55QYEoeIno9c5ux
	ZM5neJq+/5EKgLQ66meg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnwYl-0008If-5X; Mon, 28 Jan 2019 02:22:03 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnwYf-0008IY-9v
 for linux-mtd@bombadil.infradead.org; Mon, 28 Jan 2019 02:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibtxGouiTmsRJl/wbEcaH90zmmh7s2shyU3KNUF+GGQ=; b=ajwfC0Lhk3a9UM9W+20EE6k9zM
 Wa5tGhv0A5yN5uoNXkRwnLYSFss/x2vRQFuY5tLWKVA1Ile4akw8QGHk2dLSWvvJMPh/DKF4IZpQ/
 3m6/5xRG58a1GDShzRaXsTekdrZSFRJ2tEn3eoHeKupCt9S5yD5Xjs8S6c1eAkl25Gjb+3GvMFmU9
 F6piMVjt6QGFiP7XLeZkrL8ZCz1FKaQ24LOBHlY++LNRK2JaZwOcchYPC+htDc257q5pg10udezsD
 VC4/2zqUImi+PM7l1Ry7q6Bd2+LIvSRPG5nhOIOhP/xNIhyT2w23FAYyT8InASbaroHjLvxt1asVM
 HE9QC77Q==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnwYb-0002xR-6O; Mon, 28 Jan 2019 02:21:53 +0000
To: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] mtd: nand: fix kernel-doc warnings
Message-ID: <21d5edd7-1335-2731-6d53-5b15d053462c@infradead.org>
Date: Sun, 27 Jan 2019 18:21:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
Content-Language: en-US
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix kernel-doc warnings in drivers/mtd/nand/raw:

../drivers/mtd/nand/raw/nand_base.c:420: warning: Function parameter or member 'chip' not described in 'nand_fill_oob'
../drivers/mtd/nand/raw/nand_bbt.c:173: warning: Function parameter or member 'this' not described in 'read_bbt'
../drivers/mtd/nand/raw/nand_bbt.c:173: warning: Excess function parameter 'chip' description in 'read_bbt'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
---
Do you want Fixes: tags for these:

Fixes: 0813621ba898a ("mtd: rawnand: Stop passing mtd_info objects to internal functions")
Fixes: 99f3351a6d6e0 ("mtd: rawnand: Reorganize code to avoid forward declarations")

 drivers/mtd/nand/raw/nand_base.c |    1 +
 drivers/mtd/nand/raw/nand_bbt.c  |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

--- lnx-50-rc4.orig/drivers/mtd/nand/raw/nand_base.c
+++ lnx-50-rc4/drivers/mtd/nand/raw/nand_base.c
@@ -410,6 +410,7 @@ static int nand_check_wp(struct nand_chi
 
 /**
  * nand_fill_oob - [INTERN] Transfer client buffer to oob
+ * @chip: NAND chip object
  * @oob: oob data buffer
  * @len: oob data write length
  * @ops: oob ops structure
--- lnx-50-rc4.orig/drivers/mtd/nand/raw/nand_bbt.c
+++ lnx-50-rc4/drivers/mtd/nand/raw/nand_bbt.c
@@ -158,7 +158,7 @@ static u32 add_marker_len(struct nand_bb
 
 /**
  * read_bbt - [GENERIC] Read the bad block table starting from page
- * @chip: NAND chip object
+ * @this: NAND chip object
  * @buf: temporary buffer
  * @page: the starting page
  * @num: the number of bbt descriptors to read



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
