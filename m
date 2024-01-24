Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E5CC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BeIBbvkTcnHfCc5o/je4JHKNYW+6hHZkvbvyJ5cZSkw=; b=q6mnfzoAP4msXk
	SrbQIFQQ2TYQ3VuLE07zT6m6j2m2WYFDJqVdZn4stn9M9w+Gp6dXx3pIe9EdsTj8WiR2IWi4MSH7Y
	xwDMSRXqNZNlWi9QgDm9Y5O1p+JHjs5c6dAmYhImclkcyBFkRv2oZf/i6H4LvIDA21wmiyDpIRtHW
	H27TozCgEJJIN3FUcXg3vc5rB2dMeT0G9hx1WKsR3Q50d98Wp6iUUj92g3YJiaJGRS7SqY1/ZdIfn
	SWl/8k+P5V79YreLnmL3qdCEyBWGA6FsTDdXaynvv0VqWbCXIAzAIxjwdFHmN938RN/pH3UfVQbzM
	4b5S7iw7dl4irXmKKpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSaWj-002WWm-0O;
	Wed, 24 Jan 2024 10:30:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZTX-002Cj6-1Q
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 09:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=iOzgs8a2JYVMN5e1i5x+Xq35GB0Dh8Ugvl1CrNqJfm8=; b=ilex0phu5IxnDW5WU8byMashOf
	rhtnuFlrJJ1d7DNXpiwuIsNa8YyCsJiwxCwpRXcDpkcn+bnXyDc17fkU0RzYZAxKIaDPBJ1ejcwSU
	quUg3hotrZzcoq2F4c5wEbb+YqCdWDMtmNVMfUgqODgD0hqW3VrIIKPWstx2b5afn84K+D2LQNFql
	2q656Kmli1IGnJ45nu+lMhKaLqAtfehcVuK/L3Qw+vNjHtf7JJHQV0EgvvupTDGln6IOKsCaNJw/A
	wM200X5z2y7rd+JHRaBIw+4+bXfQUwUFGxfAQkCKZAwJ/e4nNhQNExvB+o69hEJEaKc/PbtzKVNQT
	mJZlzIIQ==;
Received: from lithops.sigma-star.at ([195.201.40.130])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSZTT-00000004Lwp-0yuz
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 09:23:13 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2976164507DA;
	Wed, 24 Jan 2024 10:22:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id w_Bvcet4ViWp; Wed, 24 Jan 2024 10:22:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A16ED64507E4;
	Wed, 24 Jan 2024 10:22:50 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u8S5ND4jULSw; Wed, 24 Jan 2024 10:22:50 +0100 (CET)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 6809B64507DA;
	Wed, 24 Jan 2024 10:22:50 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH] MAINTAINERS: Add Zhihao Cheng as UBI/UBIFS reviewer
Date: Wed, 24 Jan 2024 10:22:46 +0100
Message-Id: <20240124092246.9616-1-richard@nod.at>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_092311_576013_71D22C2C 
X-CRM114-Status: UNSURE (   8.30  )
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

Recognizing Zhihao Cheng's valuable contributions,
let's officially appoint him as a UBI/UBIFS reviewer.
His demonstrated expertise and assistance make him a valuable
addition to the MTD community.

Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
Zhihao Cheng,

Please ack this patch if you're fine with this change.

Thanks,
//richard
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a69..fc99cc381268 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22453,6 +22453,7 @@ F:	include/uapi/misc/uacce/
 
 UBI FILE SYSTEM (UBIFS)
 M:	Richard Weinberger <richard@nod.at>
+R:	Zhihao Cheng <chengzhihao1@huawei.com>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
 W:	http://www.linux-mtd.infradead.org/doc/ubifs.html
@@ -22581,6 +22582,7 @@ F:	drivers/ufs/host/ufs-renesas.c
 
 UNSORTED BLOCK IMAGES (UBI)
 M:	Richard Weinberger <richard@nod.at>
+R:	Zhihao Cheng <chengzhihao1@huawei.com>
 L:	linux-mtd@lists.infradead.org
 S:	Supported
 W:	http://www.linux-mtd.infradead.org/
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
