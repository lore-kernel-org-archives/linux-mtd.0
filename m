Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A95C07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 08:23:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C83F61CB0
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 08:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C83F61CB0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wF4OjWw17SKwVjS5uLbPKnveC1Y6RBKhacHufy0aF4w=; b=cxnaOP6UeM/GMN
	/AVpDgHtJdbPyY2aHZsUb0xbr7cSBa0+0KHynrQFCLxqrYMdE6iFBvzmVC8i3IIUaulHmIfQLQ4uQ
	t7FdvzXi4lj51sTI1Fq+C1s6e2V976NyJXjAK6pDje6quPWQfDSG8jGKricHOHhAZENS/sOs3CwVg
	ZcXYLLY4WftXe7YDVn9RCylQ7Fbq1JK40JkSg27cWIrxzYgiI/moMhKVShssgY7QgZtBuumHBQ2kN
	3s52px3oGZBn3kBvBofKV3XESXUNvkIpUGxNaHVIHluIQ4pvOy3aBGUTp53Sn5t5K7pc7z6SMh5BI
	S2z053SlEdiCWXjiMyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m12pP-00DzHv-KB; Wed, 07 Jul 2021 08:22:43 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m12pM-00DzFk-75
 for linux-mtd@lists.infradead.org; Wed, 07 Jul 2021 08:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1625646155; x=1628238155;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TaHQKkZoKqqFdK7Q1tZHDcJT6AzhHXDxyqv0IQazNlY=;
 b=s1B0PmV1XJbdVRdQzk7MVTXiwUKLE3RFoUR9pXYfKm8I/zrqFeMXSVb4U5gyABbL
 9bd/Z8I0kaiozmbTCfdzCHlXeu/fpPZREVmu3qd1qS+G8bw5SfSatxsRGgt1qW7y
 p700adAAGycqh1qg/4T1sgTHgfLKd5MFZanzGMHBvoo=;
X-AuditID: c39127d2-a9fbd70000001c5e-9c-60e5644b39aa
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id E8.9F.07262.B4465E06;
 Wed,  7 Jul 2021 10:22:35 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021070710223480-1106131 ;
 Wed, 7 Jul 2021 10:22:34 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dan Brown <dan_brown@ieee.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH] fixup! mtd: rawnand: nand_bbt: Skip bad blocks when searching
 for the BBT in NAND
Date: Wed, 7 Jul 2021 10:22:34 +0200
Message-Id: <20210707082234.4917-1-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706181308.1aa21d00@xps13>
References: <20210706181308.1aa21d00@xps13>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.07.2021 10:22:35,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.07.2021 10:22:35
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsWyRoCBS9c75WmCwYJmQYvTZ04xWRzp28xs
 MXHlZGaLh1f9LVZN3cli8elaN6PF5V1z2Cx2Ny1jt3g4+yqjxeH2fawWk3e+YbT4u30Ti8X/
 sx/YHXg95q2p9thxdwmjx85Zd9k9ZnfMZPV4OuEgk8fmFVoem1Z1snlsXlLvcXNeoUf/XwOP
 4ze2M3l83iQXwBPFZZOSmpNZllqkb5fAlTF12262guMcFVeffGNsYGxh72Lk5JAQMJFYNakf
 yObiEBLYxihxs2kdE4RzjVHi948vYFVsAkYSC6Y1MoHYIgIhEv3vz7CAFDELfGaWeHq2hQ0k
 ISyQJHH8OkQRi4CKxPvTN8CaeQWsJV4/3sAEsU5eYual70BxDg5OAR2Jl8etQUwhAW2JVb9y
 IKoFJU7OfAI2XkLgCqNE94TJUK1CEqcXn2UGsZmB6pctfM08gVFgFpKeWUhSCxiZVjEK5WYm
 Z6cWZWbrFWRUlqQm66WkbmIExs/hieqXdjD2zfE4xMjEwXiIUYKDWUmEl9HhaYIQb0piZVVq
 UX58UWlOavEhRmkOFiVx3g28JWFCAumJJanZqakFqUUwWSYOTqkGRlenLxu7JRa7XtTmeKRk
 FeJsc2P2j7VRxhP/p7NfmFRky5S3tPyFsNEGv1J/ly15Ii6ssx9LvV68TraVuXbba4YXeqkZ
 DOKvzlh7dn94M0VMfJ5c+oJtjZuFC1sClVoy1O4Iz9B3kGDn3tN0+uNSHmc2F9U98U+sNklM
 rztnvNAuROvkoX3rlFiKMxINtZiLihMB4yr7Jo0CAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_012240_429658_5909D830 
X-CRM114-Status: GOOD (  11.96  )
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

Fix helper parameter alignment.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
Hi Miquel,

sorry, I forgot to realign the parameters. Here's a fixup for that. Hope
it's ok this way.

Regards,
Stefan

---
 drivers/mtd/nand/raw/nand_bbt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 2a30714350ee..b7ad030225f8 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -448,9 +448,8 @@ static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
 }
 
 /* Check if a potential BBT block is marked as bad */
-static int bbt_block_checkbad(struct nand_chip *this,
-				      struct nand_bbt_descr *td,
-				      loff_t offs, uint8_t *buf)
+static int bbt_block_checkbad(struct nand_chip *this, struct nand_bbt_descr *td,
+			      loff_t offs, uint8_t *buf)
 {
 	struct nand_bbt_descr *bd = this->badblock_pattern;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
