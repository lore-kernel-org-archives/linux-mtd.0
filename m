Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275F0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 05:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LbvMltpRIjgE4jbhss1w2XZDNcmy7I60H2ck1rhRRWo=; b=eLb4TuAYRchRo3
	IovlgnMfZzt5LrvSsWlH2Lq01sJ7wqUuvWTZsDB3HAQccUNLl9INEf12t/GuqM9quIqR63fQVt5Ba
	PAbYG5Y3AM4ydJrWvWc4evfgMuDSex604C1fFHc5HN/Iei6lqfVAinGV/LOP8pZ5llk5ussdND2hK
	Sds40KYjk5vNDewL34XK4p5Z/KPvx8BstLLahUrhCf/eXZoMrGA0x7qwt2bCfwheS3+X//T1CkY42
	6Yx8YFO2eoWC02C4N2kyx5Bz9Zlef54HXM2W5/i6BZnGVKQJYwEgqQszPYwik+Iml2o69gVTjhdah
	LrADj+JMQYdZPU/PK6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkJSE-009cZA-7K; Fri, 29 Apr 2022 05:46:10 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkJSB-009cYF-9v
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 05:46:08 +0000
Received: by mail-qk1-x733.google.com with SMTP id b189so5166792qkf.11
 for <linux-mtd@lists.infradead.org>; Thu, 28 Apr 2022 22:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bLTftZOmNCEKWdg/w/LKAiVP4XXhL/YylRxacAEvnUM=;
 b=HZDi7YrcD7xdcirUzbKmgfCUwU2mAUIMxLK6Pfl/vXm8dXaCa6oXJJnM94XedJsXJW
 d7tXeECGF66fkQaVC/8ZnRRdU00yEtUsPABlMNqn9lEgozeeUnTlVm53XHdvZD/Z0tyo
 ZGO/03ZVgKDyEXakICg1glfHPx/pZPDhLUtQSg7B3OEbyJqdpK9h9+exyaL8gWziyIvf
 GOalhUhOrt//j+HanjgDq8+wqT6/KBQZ6Fv+ab2y3KyX/HkpjJge/xXFpggkY5EGxt6J
 nWjex5cU9dc2gOvfd06sbax7dIxjwAO7lyDxCC+4upHoch9N9YGnIgOw6jOMP9crBA1+
 dsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bLTftZOmNCEKWdg/w/LKAiVP4XXhL/YylRxacAEvnUM=;
 b=onkwk8PLt/PzNv7zOXS01l/8KnE6hCno93/FqrNaEjI/N82Ar5ZJU4/Td8DdDtw/3P
 U2UU3DH5BGzdyHSCqicajqFbM3ZvTFk1mhUiYXgdpfvAEg8S420dy7LDiGVp+fMhuo3M
 SoSEFA5joZ8ObZ1limyplDsrx7Z0r20nB32C3A8Ni6TnchaHPZzGjkBIfYIbOz6cOd2+
 xLUqxP6aCYZo7TOUNdlHeyK+SePxIvIj8Bp2Vi/DVJ8pVUKw0j55QYu6I7WE1eLCItyd
 eWpJIBACxqqVwGahuvyaB9R2XCqnrht/DAsExDmSD/og0Leh3kx38zoedimQp+K8jCgU
 tYbQ==
X-Gm-Message-State: AOAM5304Eje+5n1huSEPoIp1kjwtlavwZj56G9O+npr9aV7Rab0Vgvaf
 /AvilplBkeCwlWkvGLsvElk=
X-Google-Smtp-Source: ABdhPJzXfwoRnrSfH1iu4KqIReOFh1KQsHnmjpSDX7rs/uIg/dywVen246u6DCBlSv5WGou7UcrNog==
X-Received: by 2002:a37:a90e:0:b0:69f:9b8f:86b4 with SMTP id
 s14-20020a37a90e000000b0069f9b8f86b4mr5555492qke.513.1651211164465; 
 Thu, 28 Apr 2022 22:46:04 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05622a104a00b002f35726ccd8sm1188876qte.86.2022.04.28.22.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:46:03 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] UBIFS: simplify the return expression of run_gc()
Date: Fri, 29 Apr 2022 05:45:56 +0000
Message-Id: <20220429054556.3851784-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_224607_385402_04C02242 
X-CRM114-Status: GOOD (  10.30  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 fs/ubifs/budget.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
index c0b84e960b20..e8b9b756f0ac 100644
--- a/fs/ubifs/budget.c
+++ b/fs/ubifs/budget.c
@@ -65,7 +65,7 @@ static void shrink_liability(struct ubifs_info *c, int nr_to_write)
  */
 static int run_gc(struct ubifs_info *c)
 {
-	int err, lnum;
+	int lnum;
 
 	/* Make some free space by garbage-collecting dirty space */
 	down_read(&c->commit_sem);
@@ -76,10 +76,7 @@ static int run_gc(struct ubifs_info *c)
 
 	/* GC freed one LEB, return it to lprops */
 	dbg_budg("GC freed LEB %d", lnum);
-	err = ubifs_return_leb(c, lnum);
-	if (err)
-		return err;
-	return 0;
+	return ubifs_return_leb(c, lnum);
 }
 
 /**
-- 
2.25.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
