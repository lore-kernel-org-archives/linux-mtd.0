Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98854C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:52:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4701064DD8
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4701064DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u8hzHztUXR8e1h4Or3GK/TOeTzcGQMhjkiY/W3uYEYI=; b=cwA00sfOmPatnktuCbdZmorTj
	6N0mByRwOyNCPV7Oegk/8gRWZDEO07sqvODYy9fqDRZO83LervdBL5Kr2WbedLvjV8JftsJG7B5ad
	3rlIvLjDiLpWrrq1zK1weDmCVj3kTe3i0Q3Zo7tr7/NBrUqCrkBEBxe0Wb4uBXTHY7u6vTcXqcbHn
	QkyIBC4iA1IFzsycxxo5OnhSUqyUDcKNBSk9dulnt/y0TZDTAseY1UOqOHmYzlRA5IvzBJFSPVmD0
	WuRnTHM5HNfzOBLar0i0aePiaSlVh+miEgzLhz/dHtUBiS2ls+uYD/9qNZZPfzEeXn0wW+Ld8Cn9V
	yWDwH1g4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy9P-000663-OL; Sat, 13 Feb 2021 16:52:07 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy9N-00065J-F5
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:52:06 +0000
Received: by mail-oi1-x236.google.com with SMTP id 18so3260691oiz.7
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gc4FZQoLFpjrjBvJ5zV+ImqklQ0xOESHz74DuFiIHsQ=;
 b=IJc6s7RnxywqkaHHKfqNpelipqAsA6UxO0E7+Zul8oNEFLWqa/GhkRPV+O3LOm6MwE
 T/5T0JwcezmFv7soctyMOxOQkoL5NeADH+EwzLEGXL6hOn+8z6QvWZ5AfP+LE0rYw3ZU
 QmtVrKr8r2LZ0imwens5ke9KAWi4e1XmAJ52zQ0EgVi3BzKOG5MtHg213ScvqYQBVf4k
 zzYY6ITsJEcahMhJJuSUHGLo142bZHHvRAJ9yi6MwJIaglGV0HawBPdnGm0g66kVV13o
 np03stm29+SBYZDuLJH4Je4yQxurKc7zakuZ+/bpoVYvNlkzEEgyputQ8SL6MgoFMDiz
 iJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gc4FZQoLFpjrjBvJ5zV+ImqklQ0xOESHz74DuFiIHsQ=;
 b=OQpRlamvvfIsIAwqJhC0M9zPof1nP0joEE3bqrtraOsDhrTRIvwUDNpuHjclovHz2P
 4d9effYgCGY9hB4ghAkFNaC5f4dZIzDmCHduokcIbT5Je+kxQeSCWiTjkF4hJukAUF9n
 mS50rUa5WUhSLmuPxRWVc5mU5i/oZY9r/i82HiurBenKuO4TeAo8+X4Ku7KuQ8tmy+fy
 /acMemK92P3yTy3rwLJxul0OTPn+eZ8LQZoiFNv1YARp4QDbO3aLHPQEImsPRp7GV5kb
 glYguimCGr9ifR5OO1I6nxlxIL3BIMMd5gTQqXxdswApIWA19/kNIv7LOh7lbkNsCCot
 v8lw==
X-Gm-Message-State: AOAM531W1z2OpNO1V699bR2qRCoyJrp1PCygfPuWj9LFiWzl1WS/c7RO
 oFCMhGmfxt/Q7KMrc3vhv5ocDekSeWPskA==
X-Google-Smtp-Source: ABdhPJwKudWopUJfjFHzJEHBg/99AA9kH0i+C64AaIBO41PqvohhUuBvR51iyIaOkEwkQDDpMbWGhQ==
X-Received: by 2002:a17:90a:f2d3:: with SMTP id
 gt19mr7774206pjb.212.1613234804489; 
 Sat, 13 Feb 2021 08:46:44 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id p8sm12643984pgi.21.2021.02.13.08.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:46:44 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 1/8] mtd: Add helper macro for register_mtd_blktrans
 boilerplate
Date: Sun, 14 Feb 2021 00:45:53 +0800
Message-Id: <20210213164600.409061-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_115205_521680_88B141C9 
X-CRM114-Status: GOOD (  12.69  )
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch introduces the module_mtd_blktrans macro which is a convenience
macro for mtd blktrans modules similar to module_platform_driver.
It is intended to be used by drivers which init/exit section does nothing
but register/unregister the mtd blktrans driver. By using this macro it is
possible to eliminate a few lines of boilerplate code per mtd blktrans
driver.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 include/linux/mtd/blktrans.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 3c668cb1e344..15cc9b95e32b 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -77,5 +77,16 @@ extern int add_mtd_blktrans_dev(struct mtd_blktrans_dev *dev);
 extern int del_mtd_blktrans_dev(struct mtd_blktrans_dev *dev);
 extern int mtd_blktrans_cease_background(struct mtd_blktrans_dev *dev);
 
+/**
+ * module_mtd_blktrans() - Helper macro for registering a mtd blktrans driver
+ * @__mtd_blktrans: mtd_blktrans_ops struct
+ *
+ * Helper macro for mtd blktrans drivers which do not do anything special in
+ * module init/exit. This eliminates a lot of boilerplate. Each module may only
+ * use this macro once, and calling it replaces module_init() and module_exit()
+ */
+#define module_mtd_blktrans(__mtd_blktrans) \
+	module_driver(__mtd_blktrans, register_mtd_blktrans, \
+					deregister_mtd_blktrans)
 
 #endif /* __MTD_TRANS_H__ */
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
