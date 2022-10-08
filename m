Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B81C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Oct 2022 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IYh9vIrwq1dZzJJgazHQFgpqQAwjGdtx9sr9KcW1+/A=; b=va2P/vOTBgBHn3
	8UxnXPa1ZJagOEYHZtyXOcr/ObHknluH4g6fYmohxK2I6VFEVF+M0S8fCxR+wfWw5T9t6x9VuBWhi
	R204kMx10gmxmLvhHW28l9Io71UVJLk5TY3JOoXaaUTFn+mxecq2VNU0K5alnggXl1JdBC5VVYz+C
	pRAYai7irFxME09SoSTXXQN7yz75zmziUTaH3Mo4q05ymjIc9n8C9SpRRP78Uii5INC2fruhuBf7Q
	Q7ONnTNygSZ0qhHlU2EqKlW5n/lT4dvBJGSEWRCQGl0NSGBvnsmfuTf+Lw+Kn7sGk2C2+zgn4m+1I
	30eb+ozKLSP1u+MBzmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh4Xu-00CKqv-DI; Sat, 08 Oct 2022 07:46:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh4Xs-00CKqA-1e
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2022 07:46:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id f140so6762407pfa.1
        for <linux-mtd@lists.infradead.org>; Sat, 08 Oct 2022 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yy1hrG2GpPBkvn2HfQINffR+3hxzGXt2IgtYJPN1P7E=;
        b=auD42bYp121ROiFoAixlBntsidbY1hawD9jksLlHUfCGs+g1S33boZlc8IG52tq3LN
         DX3zkFHJMskR9WbEfqaIU3wWP2PYec++sWTNaxJ+jm/6Sc/mlQCL57/xC3g6z8bdDGzp
         EqRUliodvHvnOoW98Z6z+P8C9u0UOxm965lxZO0jk3o0DBucSnhvgc/Noh0foIWdCPo1
         IpDQTDjQ1Xb46qq47hdQJsExw1k6iJAlOma49I3UhOIkTQqVIW3vnwh2GfMB+HZKRAC9
         YNZ+9lFYEDDf82yOzWn7uDWc+lc0U/2O7VNLesgUBHl+ixcvrRL2tAfsnNKxAG71wtVg
         J12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy1hrG2GpPBkvn2HfQINffR+3hxzGXt2IgtYJPN1P7E=;
        b=Oa3+921QmIwoTAVKtPOUJPFoS3rDLzuqBVAsa3FIpDE736xKHy14sDWdGFLpoY35Xa
         R3HN24B4KUsT1cH3BmwxYzkuGfO2PzVXYfH8RTnyUQBFwGnHpADiIsezS61i1YhrS1g4
         3iNV/PrbKrqvi6AMhBoUa6N3vpVSUW5MuhLIhZ6cC4GXqA9FftD3jUZ/zhmygfvDuh3c
         0YRem568ZL/wG5d2aDtRMm5rU0Sp6Gk60wqtT6BoQtUbQ04uwZzg2WmQ2SIEhbBE38jr
         ziAZehYLwqggVTQcqn4ZMf4ku6Ft0waxvSGH/QISc9MfTyJ4gZSHwMpwxC/kDMbiLaU0
         yttg==
X-Gm-Message-State: ACrzQf2OdkohjTW0xaDYSz2DQvvoSPnLlH0M9g8fz5vDp/+IoAlNbIkz
	z36QwArrJKG/jZ3U+tFRijY=
X-Google-Smtp-Source: AMsMyM5rC5UzbfGyUKVwo477N415VnISLNMlKqnEO7xakBGPSl2Z3+N74oa8uaYCPuiv4SH83PF1mw==
X-Received: by 2002:a63:581e:0:b0:43c:29a0:6390 with SMTP id m30-20020a63581e000000b0043c29a06390mr8029983pgb.552.1665215209070;
        Sat, 08 Oct 2022 00:46:49 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x16-20020aa79a50000000b005365aee486bsm2852880pfj.192.2022.10.08.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 00:46:48 -0700 (PDT)
From: yexingchen116@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	wsa+renesas@sang-engineering.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ye xingchen <ye.xingchen@zte.com.cn>
Subject: [PATCH linux-next] mtd: replace strcmp with sysfs_streq
Date: Sat,  8 Oct 2022 07:46:43 +0000
Message-Id: <20221008074643.308969-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_004652_107452_1AAAF0F2 
X-CRM114-Status: GOOD (  11.09  )
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

From: ye xingchen <ye.xingchen@zte.com.cn>

Replace the open-code with sysfs_streq().

Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/mtd/parsers/cmdlinepart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/cmdlinepart.c
b/drivers/mtd/parsers/cmdlinepart.c
index b34856def816..6a401e0b1b95 100644
--- a/drivers/mtd/parsers/cmdlinepart.c
+++ b/drivers/mtd/parsers/cmdlinepart.c
@@ -154,7 +154,7 @@ static struct mtd_partition * newpart(char *s,
 	}
 
 	/* if slc is found use emulated SLC mode on this partition*/
-	if (!strncmp(s, "slc", 3)) {
+	if (sysfs_streq(s, "slc")) {
 		add_flags |= MTD_SLC_ON_MLC_EMULATION;
 		s += 3;
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
