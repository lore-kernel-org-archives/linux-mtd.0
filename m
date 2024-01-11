Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6950C47077
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jan 2024 06:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mzAKuo1J+OPPZQMn1mnNyvXizloNzzIpHQxuR7G79ZM=; b=PoGQPebHnaoHpQ
	k/rsEyNRRbPxq59kBmtL/EtQTsre7TAuY06rJfTUM12mrXqL2qMe4ZvVps4d/kss1ci2OiceBPUQT
	CbybgH0WZt8WeCLjYCkVh2oSjL5gxj78XjqURXdWf75qmiC7TrlraeV8qMlchPaah/tGMIBawoSE+
	j0FIvEIw3+z8oU/r3E9isMuAR5sO1EkhltABinLM8m8Vr8L7S6cREZeTaw2GTBRF+fMJX2wxhmOvN
	C4kT7PB/fIsQ7uqXEzqo1Us1F7O3nHRFGb7y8YJR7ddlo9eoNz+mJG0sOG+D7scEro26TL0Z5Oe7t
	hEUpM310Iz/Xv/53vyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNoim-00G8AG-2p;
	Thu, 11 Jan 2024 06:39:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNoii-00G86s-2a
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jan 2024 06:39:19 +0000
X-UUID: 06e8d5df7d514be686305328458a4511-20240111
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:83a6b7f4-26f0-4521-9e96-b36bb32f8909,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:1
X-CID-INFO: VERSION:1.1.35,REQID:83a6b7f4-26f0-4521-9e96-b36bb32f8909,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:1
X-CID-META: VersionHash:5d391d7,CLOUDID:5fec0b2f-1ab8-4133-9780-81938111c800,B
	ulkID:240111143903VJUGI1AE,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|45|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 06e8d5df7d514be686305328458a4511-20240111
X-User: chentao@kylinos.cn
Received: from kernel.. [(116.128.244.169)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 630914744; Thu, 11 Jan 2024 14:39:00 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: richard@nod.at,
	Artem.Bityutskiy@nokia.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>,
	Kunwu Chan <kunwu.chan@hotmail.com>,
	Richard Weinberger <richard.weinberger@gmail.com>
Subject: [PATCH v2] ubifs: Remove unreachable code in dbg_check_ltab_lnum
Date: Thu, 11 Jan 2024 14:36:56 +0800
Message-Id: <20240111063656.68810-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_223917_172344_57B9F0CB 
X-CRM114-Status: UNSURE (   7.79  )
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

Because there is no break statement in the dead loop above,it is
impossible to execute the 'err=0' statement.Delete the code that
will never execute.

Fixes: 6fb324a4b0c3 ("UBIFS: allocate ltab checking buffer on demand")
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
Cc: Kunwu Chan <kunwu.chan@hotmail.com>
Suggested-by: Richard Weinberger <richard.weinberger@gmail.com>

---
v2: Remove the initialization of err
---
 fs/ubifs/lpt_commit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index c4d079328b92..07351fdce722 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1646,7 +1646,6 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 		len -= node_len;
 	}
 
-	err = 0;
 out:
 	vfree(buf);
 	return err;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
