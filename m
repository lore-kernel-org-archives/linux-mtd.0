Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B531FCCF9EC
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Oct 2025 20:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z3qFBzl8igENgCR7lWdAJhixuWc9XR/cs+OUag7O4IE=; b=JycelneWKxBMBp
	XqkY4rvAeopqihISknd1BiK28qoCrp19xqpPn3qAFI1sWsX2KWMAI0vPAvUgPotpB39VFDuOaGs0X
	uej3UtPzjJzN8EXncppmmcn2qqhZs4N9JT85YLfYIbIdly2uAC7NcAFlokPQITTKBBm6kQnaIhxXu
	LIVsWkO2ztNXrAnHd68d2JyMVpysfLLzPAKbLIumukZNl/zLhQ+wjna2Hlj/Zt6bW6FO9LHn27L/P
	quP2+doWWDwyrFJYkvyKGMm/X5pZ4YEFX6T/JxAW+ESnWykkpI69iFmyvj+O6kVSPK4dpeSQLHCbw
	ijNixuk+iZFVBpIsRqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vM-0000000Cgnz-0RFM;
	Sun, 26 Oct 2025 20:01:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vJ-0000000Cgmn-08UQ
	for linux-mtd@lists.infradead.org;
	Sun, 26 Oct 2025 20:01:06 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so49175695ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2025 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761508864; x=1762113664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=loFf6YthZuGdAEU+/m5xg0plAqeUG12CEHvFSZIWolM=;
        b=kqXMMU5JPnzEhMHvdAlM9RN2j6HxuPJI9kELo57ZVTAL82Tc+Xy2nDZN0PECzdL5SE
         yg+AaGVgZDOrcbXE5I7hiGSDYOmlmC7lfQfVNDAyL9rsQkyCQ3da2aQJ0qqKE/KadFEd
         ZuTczy/kpgpf95W7iAmaXfMf1MZzu8BgwlEczQtHfdoJR8ENEBVP2FLAbTEXYiu+3G4n
         oOECGVfeHwpm656ttW0PZFujBkDnM5CdpeWWWxObGm8I7a8HsYNofJq/z3otcJHMlHxW
         jZ95A6j9mOP2ogLvfiJEAH/JFdU+6ibpm2PfYHz7JTLQXPQJC9R1Fy7qNzHV+lLsZb+K
         OBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761508864; x=1762113664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loFf6YthZuGdAEU+/m5xg0plAqeUG12CEHvFSZIWolM=;
        b=Nl4MDZUQDS4UH+osF/nmb+DUTrqBh8Otl0mK77YwD32V99iPiS5YneAXycLCxv989y
         KKuUmehf/Y/QyleP51gh7xaDKr5vRXAX4tgbhR5uVSCkjaUmIuCLw//Q73rb5gvjvgIv
         TOAy0q1US31qn3QxUrp7rtj14jIUBwkRviXZ/VFh4UpwY7BiI29u1rcObJBl50Jsep2G
         iZaWjYPTqYD1Q1oy5qeHdeKyP/VRLW2s9Fo2Ux01kmdD0sRNWhK4hxHEShaHfWcroGIF
         xEDpCIZGdMJtnQThsCcegATq2xm5KfqHEwoTPRFT5Fb0D+vdsuHgBoP5Y+rjTwQyYovY
         3E7g==
X-Gm-Message-State: AOJu0YyLyAfrf5/1u6niyJLArYuAjPywyhPckVSSIBaj3Hry6MURXINC
	H8EUTZO/+XyeoarQi+zSatM53BC8u5k40LYiOyMGQ1YI6NhFGe6Dpzkd4gSv8A==
X-Gm-Gg: ASbGncu/BhLoUg/bqZwuBIW2d+7TutPNYBVz9ORw/Stbb8Relz73FkqR5BtZ9mUTko7
	eSdCTSq3ubS9gAY94xYFSxslrfy2WiNMYOoNyOgbPf3NUZ6sBElNWR/s0ZtTxRkCDRhCP4ylSJ2
	YhoyMrFJQh2KHBBZkAvdVeH6+vIE4sWBeUJXWjGLx0N4gFxrtE/9uvAE8LX9fFeXWtwzZobtFxs
	rhwSNW0ZwhbORyRnaV0/E2Qhwz9vaiKdfzujkP2/D9x7/qwniMaClq28V6nag1wR+Gt3hl5fVvr
	f72dALH59wEQfvqQf+Fm/wXr1LGqtpjgnbkhJZAk6fQMEtouK4TTr4T9bL7TXBhxqbgBbbSJk+r
	KCUuhiS0EWg7l2575tg7i59ir0n9ymYg9f/BTxUdC124ISPW5XqLfsiN1vRmY6WPEFudN
X-Google-Smtp-Source: AGHT+IGWzDQLPg6JqJ74te0lL4lUVsJO8XEB2HY9ntSL3QUGfhPJYGDn7y0t4mMa+JXLOQLbZmSvoQ==
X-Received: by 2002:a17:903:2c8:b0:281:613:844b with SMTP id d9443c01a7336-2948ba7a7dcmr102231445ad.52.1761508863729;
        Sun, 26 Oct 2025 13:01:03 -0700 (PDT)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf352esm56444675ad.17.2025.10.26.13.01.02
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:01:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/5] mtd-utils: don't include features.h
Date: Sun, 26 Oct 2025 13:00:45 -0700
Message-ID: <20251026200049.25152-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_130105_096083_49357201 
X-CRM114-Status: UNSURE (   8.60  )
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

This is an internal header that's already included with others.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/common.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/common.h b/include/common.h
index 303d30d..d443e17 100644
--- a/include/common.h
+++ b/include/common.h
@@ -26,7 +26,6 @@
 #include <string.h>
 #include <fcntl.h>
 #include <errno.h>
-#include <features.h>
 #include <inttypes.h>
 #include <unistd.h>
 #include <sys/sysmacros.h>
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
