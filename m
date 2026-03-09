Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C4F5513A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 06:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BubxszqPUdSMCkG4oxJ5f9qaDiekwEDecJ2IvXbE31M=; b=lwxnITneayaIMK
	9lEbUTZX8dT1oEQRVZBRmeLwqRIYI3kzDTOTYL++SSjusQS+ApGMFrQ3a8ichXhZcT8m1KILKNyVr
	HGGI4WWZSCeJe15flAXLm4BwSC8/xF3iJcL3jJtOOnRO9Fv1h2+NDLhbBn9jIwGZp5tj2xQtJBkgt
	cfQakpm0wdauM4R94P7ICy7OOTM3gBdNezauvIWbx63LqY18wd2PtQ0JthlbSTB5qOZ44DNYJCs2o
	MOKYv+ssBLavyJyTwPZFWcyIFJEeHmaNtbgjQUkEatYNxhx+CARwcywd+vrxb15xT8bjyc2AjlG0q
	z7FfWZDZqOCE60P1PscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTlY-00000006iAG-2nxa;
	Mon, 09 Mar 2026 06:06:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzTlW-00000006i9o-1I8X
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 06:06:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ae8979dbb2so13468935ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Mar 2026 23:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773036413; x=1773641213; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tWFv1BB7FN3hcOOghSBDtnN98xOSLiQpa+eHf8S5Tyg=;
        b=WW/e8+9kI6GBjWpMp90Gg3fzMPiAO6hd5/Wymus0Z9Yj7QYSQQKirjFPtsRD/NYfV1
         DHlVWJlqNaDWa8j6uLfK5cnuaa5JH8F0daVcIZIfuDh0h1Dv4fSfpfzcg1cz/uMYEk3z
         GsDfpngNMuP8uMUvzwh+zw48LBchipFf31O3uIRwTU+IGL8yeWkqcyN177kydrznX2gF
         rJdegeyZn3FPGVGbYM7hffYeLCCnByWVQrlEuodi1IXFf0Zdw0X4ZD7naolnf0QuSC64
         WdZuhYuG7tlxcU22f+z+P9L7p7zFMKpRdlQkg6CJgomDkOX8K4gMlWcGglw88YIMo1zv
         SEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773036413; x=1773641213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWFv1BB7FN3hcOOghSBDtnN98xOSLiQpa+eHf8S5Tyg=;
        b=Wumc7oD1nUCfe9Okp4zvysViZIf26KUGgfquO7x2XUQjSDSGUyYEtU0Xf7lWCWYUai
         4l3v2/QhPrO8d9LvzPW94c95iwmd0RYWexSogT4sAXbvtIzRno7DCHHgNCVSEVFBTFI2
         0WmLxtRFpdgWBHbmeLqNwIclFk/rEp2ohmxWgWgwPCgkX2qkq0Mp79OpmQ0jXs63guhK
         9lKPbbYL8e1StvFpyppHhNiB/KtKopLZjqR67cwLJpica2PXF6uL9W1XmcHvtpWlkfHc
         24Xld7OeE0rvoSIoaZ97LIupqJp+0sygCMjZfyLIHjchO/4sWSXThoRi0ofPQZBNm/5j
         mYvg==
X-Gm-Message-State: AOJu0YxtRWTl7fLmdi/pMAB/scLCS6b6KzkQvjkeQDQKkaAdB9XWp5e4
	gvBss1TDGGxi/pfXvzu8oM/jSpsE4HHCO5+QjFS/wBEpj7rxS6BMyc0b
X-Gm-Gg: ATEYQzyzBWV1Spzo0dVNOCAu8xpf0pzEprmPinfyTe4sNJ/DV1IZDpq055bZe6Y7SnO
	uDVa9Y1eTbK27SfPU8bHE/+G3w8Stgs+De3d5Xe+TlQE/whCiiojdTl7f7SJ77NFf6UBF0RIP/q
	Q0j1QQ2I6I0r/7e63X0rJ/VAwGqtJLb+S1+JTA8aM6d/kkdCGTJCGNKcGVI0QMl1ud33zTAtzs1
	WXHLnuo/Su2bQFi0M/2FT+8pkEvejrFRbDyJM6qQg/PKpglICgHSfMaTjZ+qzOd0lt4rFwG90ik
	cbJMz7qhbvVdLMVeR9V8L/reGM1151Fi9nk83XU7oAm+EpVzR2d8b7ArK7l+Igob2QF3aZafVTH
	n3sZHEPiBMuWpJ7KSLFAwqljEFxbQMkCRjGbxJzAY+maHuF4zjk/nwORdtaY3+1r9UI5tO6I0w4
	K+j01LL4o546kpgBJyorBXFSvtBqi1aYaKZms6YyiSvIqtz9O43O2nstc=
X-Received: by 2002:a17:902:f70a:b0:2ae:7f4a:8e2e with SMTP id d9443c01a7336-2ae82530c7amr95865405ad.52.1773036412848;
        Sun, 08 Mar 2026 23:06:52 -0700 (PDT)
Received: from localhost.localdomain ([119.204.109.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b1fsm133043635ad.12.2026.03.08.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:06:52 -0700 (PDT)
From: James Kim <james010kim@gmail.com>
To: robert.jarzmik@free.fr,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	James Kim <james010kim@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: docg3: fix use-after-free in docg3_release()
Date: Mon,  9 Mar 2026 15:05:12 +0900
Message-ID: <20260309060512.3634570-1-james010kim@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_230654_371146_9CF3BB36 
X-CRM114-Status: GOOD (  13.11  )
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

In docg3_release(), the docg3 pointer is obtained from
cascade->floors[0]->priv before the loop that calls
doc_release_device() on each floor. doc_release_device() frees the
docg3 struct via kfree(docg3) at line 1881. After the loop,
docg3->cascade->bch dereferences the already-freed pointer.

Fix this by accessing cascade->bch directly, which is equivalent
since docg3->cascade points back to the same cascade struct, and
is already available as a local variable. This also removes the
now-unused docg3 local variable.

Fixes: c8ae3f744ddc ("lib/bch: Rework a little bit the exported function names")
Cc: stable@vger.kernel.org
Signed-off-by: James Kim <james010kim@gmail.com>
---
 drivers/mtd/devices/docg3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 33050a2a80f7..603fd0efc2ea 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2049,7 +2049,6 @@ static int __init docg3_probe(struct platform_device *pdev)
 static void docg3_release(struct platform_device *pdev)
 {
 	struct docg3_cascade *cascade = platform_get_drvdata(pdev);
-	struct docg3 *docg3 = cascade->floors[0]->priv;
 	int floor;
 
 	doc_unregister_sysfs(pdev, cascade);
@@ -2057,7 +2056,7 @@ static void docg3_release(struct platform_device *pdev)
 		if (cascade->floors[floor])
 			doc_release_device(cascade->floors[floor]);
 
-	bch_free(docg3->cascade->bch);
+	bch_free(cascade->bch);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
