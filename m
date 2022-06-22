Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF85BC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jun 2022 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nwc07N7gYwz0cZCg9LM18JG+D13O4uRpTl/R5DbEWsk=; b=ZRgRbHsx6IOUGW
	Qiw76crGU0uYiMYonrcrSx/q0VNlJEVYKN+vG/OZkQJ163rQDhaNVlPy6XsTrfnjQsYBY7UgPdk/N
	TEVOxRvrLqUuuNPcoG1lietQ8jjNrgIyeNgM66+99xHGfpPfnU/W/VRLf7a5cMjwsSoF++jBCD1DB
	J/2FUZWYi/ftwvu/EtKznwBORutXwIbMvHMKmSu25G/ksKU9rN+yyurMN9s1FU1NtYaFpDBDwZHLm
	8Nb8gKJvmpiCqugLf/4FhlS7iCeBLXg+CwiJTHQx7Kg1/CjZb7dA7m88XAESVa0CtivCzAVnBPJDJ
	xHsbOy/axkQ3qpmpnlgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o438m-00BUW4-LM; Wed, 22 Jun 2022 16:23:40 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o42ra-00BMxz-7m
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2022 16:06:00 +0000
X-QQ-mid: bizesmtp65t1655913918tvmgs68c
Received: from ubuntu.localdomain ( [106.117.78.84])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jun 2022 00:05:12 +0800 (CST)
X-QQ-SSF: 01000000000000B0C000000A0000000
X-QQ-FEAT: HNxLNQvIe76+hcMYMvaXk26UGWx+SAJB64xM5wT4wR8jPje9QKZ0664emjZNu
	d60Whm576CtGRC0d5FsMSwwxsgPt0wKfEq3Vq9R6pJ906zshVI/+AUzFHQlm7ycW5vM0iXV
	8w7NhWW2h+q28Am6kY8aNtjs4kOUjGiAb6smZzjb1jWtfH9L1fctAsrG9udlVW40ObczWbE
	kUHMllYtephnWoLf6s+88VhLygcP8CtzKry6+j0pn8nkNlNpK5vE8mOXqSbs0oZ5PbUpqVo
	2Oimr10CwYdAO3Qhx80fUQOnwDbUgYqtncWBHRWBrRyr8zbIgrwABIYS0=
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiang Jian <jiangjian@cdjrlc.com>
Subject: [PATCH] mtd: rawnand: sm_common: drop unexpected word 'is' in the comments
Date: Thu, 23 Jun 2022 00:05:11 +0800
Message-Id: <20220622160511.11679-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_090554_700300_7063F4CD 
X-CRM114-Status: UNSURE (   8.77  )
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

there is an unexpected word 'is' in the comments that need to be dropped

file: drivers/mtd/nand/raw/sm_common.c
line: 55

/* NOTE: This layout is is not compatabable with SmartMedia, */

changed to:

/* NOTE: This layout is not compatabable with SmartMedia, */

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/mtd/nand/raw/sm_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index ba24cb36d0b9..b2b42dd1a2de 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -52,7 +52,7 @@ static const struct mtd_ooblayout_ops oob_sm_ops = {
 	.free = oob_sm_ooblayout_free,
 };
 
-/* NOTE: This layout is is not compatabable with SmartMedia, */
+/* NOTE: This layout is not compatabable with SmartMedia, */
 /* because the 256 byte devices have page depenent oob layout */
 /* However it does preserve the bad block markers */
 /* If you use smftl, it will bypass this and work correctly */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
