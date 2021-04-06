Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FC5C433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 01:48:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 590A761382
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 01:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 590A761382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzFVaTez51rY25btoBYrVPKo2om57mwbqbQEr1Cw3TY=; b=TjcB/xz5UESjOxT0nuGgLbdn4d
	IPLCQAFX38aUG5hxfvhTGyoIkLa8ENbiaqPxzYwYyqdW+eh0+1L3J7pMIzahYX+d1/6xgz2qUCIUh
	52j2KL780iLWzmRwfDCxENhrOzReDpSz+A8cKGNQcy2Ku5miVo9/o12DsRuraAvSAs5FgY3fffNRW
	duFQU7rDq26PAJM5uA3bJjDz5Pimu6HMWfPZm2AfWyq1tVrXezUbSwEtVubgTwXExg0UgzZZETITu
	Eby0AzI306V191Hz2YelaeKpTjhzcHP8wN+Ka/iXzJBAU1ys7sxmkfH3/URbCVad2L+WIhz2xfEzg
	zbIRJxcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTaok-001Bue-Ht; Tue, 06 Apr 2021 01:47:46 +0000
Received: from mo-csw1114.securemx.jp ([210.130.202.156]
 helo=mo-csw.securemx.jp)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTaoc-001BtF-7f
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 01:47:43 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 1361lUwb008479;
 Tue, 6 Apr 2021 10:47:30 +0900
X-Iguazu-Qid: 2wGrBJasm3hdJ6uKHL
X-Iguazu-QSIG: v=2; s=0; t=1617673650; q=2wGrBJasm3hdJ6uKHL;
 m=GP88N+NcFEyBcPCzzwJsFRf8/vyZgOZVf7KUXtPOf0U=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1113) id 1361lSqw038187
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 6 Apr 2021 10:47:29 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id CFF6B1000AC;
 Tue,  6 Apr 2021 10:47:28 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 1361lS6q013306;
 Tue, 6 Apr 2021 10:47:28 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] Fix the issue for clearing status process
Date: Tue,  6 Apr 2021 10:47:26 +0900
X-TSB-HOP: ON
Message-Id: <e52bf38913c20467e96c66ddf058129a5f063273.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
References: <cover.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_024739_269001_86AFB4E5 
X-CRM114-Status: GOOD (  14.33  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the unlikely event of bad block,
it should update its block status to BBT, 
In this case, there are 2 kind of issue for handling
a) Mark bad block status to BBT:  It was fixed by Patric's patch
b) Clear status to BBT:  I posted patch for this issue 

Patch:
Issue of handing BBT (Bad Block Table) for 
some particular blocks (Ex:10, 11)
Updating status is, first clear status, second set bad block status.
Patrick's patch is only fixed the issue for setting status process,
so this patch fix the clearing status process.

Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
---
 drivers/mtd/nand/bbt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bbt.c b/drivers/mtd/nand/bbt.c
index 64af6898131d..0780896eaafe 100644
--- a/drivers/mtd/nand/bbt.c
+++ b/drivers/mtd/nand/bbt.c
@@ -112,11 +112,13 @@ int nanddev_bbt_set_block_status(struct nand_device *nand, unsigned int entry,
 			     ((entry * bits_per_block) / BITS_PER_LONG);
 	unsigned int offs = (entry * bits_per_block) % BITS_PER_LONG;
 	unsigned long val = status & GENMASK(bits_per_block - 1, 0);
+	unsigned long shift = ((bits_per_block + offs <= BITS_PER_LONG) ?
+					(offs + bits_per_block - 1) : (BITS_PER_LONG - 1));
 
 	if (entry >= nanddev_neraseblocks(nand))
 		return -ERANGE;
 
-	pos[0] &= ~GENMASK(offs + bits_per_block - 1, offs);
+	pos[0] &= ~GENMASK(shift, offs);
 	pos[0] |= val << offs;
 
 	if (bits_per_block + offs > BITS_PER_LONG) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
