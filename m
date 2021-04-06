Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAE3C433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 01:48:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C77961382
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 01:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C77961382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URRl4FAqv4LPuU0W57/EHqVRTQye/R+SzhEaElEooOw=; b=KtAsnbGQ3v7+cBMoQbFeaGblPW
	Up/Yyp3CFcotEQLcF5JapEHl71ZFNEA/IrgHGd+DJD+tOYpjUp/FEi0k2lojIqTSqrHPqWCdY5dXl
	lW1AWACVU5E9THAZNdAp2mT9Ro/8Gg1tr8Ev3+VFkRMtFXQc+BUHsnjpmNFYGTrC0O+ThYf3nk/H9
	bE9CZNvzlDcvyRiP5nZWiA+NpU4R1igDuGv4pZMckpWVMnC8RCglIHgOUkL87isG7+Q6/4aiggVvk
	arTvTO5dqv8mpkpJJp/cjzMTHL6v8SyU8ca/NyvfPkO+IYEDsmIblUqQuZhMii+3PDkL2hqpgkKSh
	Ov/RyyJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTaoH-001BsF-K4; Tue, 06 Apr 2021 01:47:17 +0000
Received: from mo-csw1115.securemx.jp ([210.130.202.157]
 helo=mo-csw.securemx.jp)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTaoB-001BrU-Qj
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 01:47:15 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 1361ktBu006321;
 Tue, 6 Apr 2021 10:46:55 +0900
X-Iguazu-Qid: 2wGrPpF1uEzCrsK0MH
X-Iguazu-QSIG: v=2; s=0; t=1617673615; q=2wGrPpF1uEzCrsK0MH;
 m=j1mtSmg+I/E2iQsiK90JGCh/zBNv4ekOEacMF0peMck=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
 by relay.securemx.jp (mx-mr1110) id 1361krHY022634
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 6 Apr 2021 10:46:54 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 017411000A5;
 Tue,  6 Apr 2021 10:46:53 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
 by enc02.toshiba.co.jp  with ESMTP id 1361kqF7012658;
 Tue, 6 Apr 2021 10:46:52 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Fix corner case in bad block table handling.
Date: Tue,  6 Apr 2021 10:46:50 +0900
X-TSB-HOP: ON
Message-Id: <cover.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_024712_642301_48915294 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Doyle, Patrick (1):
  Fix corner case in bad block table handling.

Yoshio Furuyama (1):
  Fix the issue for clearing status process

 drivers/mtd/nand/bbt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
