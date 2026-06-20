Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70698CD98F2
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jun 2026 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hYTGewY82TX/XbZTSXW/R+Gf7pAbbmcrhGRz8R5QbiY=; b=EqCiZVEtttRoOJ
	E2I6zM5SSrd8zkzcMRPNA/klnAwFV31l2eRnd0YhnugEYmjvcpcbPkB7l7uwevm0Oi8U7hMesAalQ
	LgF/Y4KJcWF/8B76gh8UHMDfS2F5ANxGwRYJG0PJPAPrd7mSrprEC5SZQVvw+ex+pWbkQw34Q4rQY
	lRtBQVSsDZZbDdLhucjEqC3A5vDCzEfq+nkO4PHORxuea2HSQeSLXM06SNVp7MaPGzVeG/PnNsH/+
	YmyzsXhY1tobRGFrM54LTPFtXHtuYD9rurcaESeZgH5qyBHG6NmMsb/2HV/4xtvySY9llgpSBlypS
	ZvpODQJXuxvrDDZ1ZavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waz9W-00000003TMA-03xK;
	Sat, 20 Jun 2026 17:06:42 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waz9T-00000003TLk-0PK4
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jun 2026 17:06:40 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso4379781fa.2
        for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2026 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781975196; x=1782579996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iEduaZP3uRIog+A+9jyhhzskmnge2cwf7E3YRjfZ34=;
        b=gW/VGRIRCn0Uys59chS2GIJM2wkvzM9WcsL/IuTY7wkd6oCkxEKn8xBOBKlZrjZhGR
         n29bIimDTHm5eE8Euxw8fJJ3f8vM2kGQiAj7sT2QHuFnzhrbNLJGvhz57NELtSsHXQi9
         mT6DEoNsf11ex+RQ0+Euz9HyO3YEDIiPVK7v2yn1+p7LsLyymseakU2qTGvXrHneHgdr
         7fPjY133zMrNw/6z/IJj4q5ehvEIBmYH7y1G7oeqmAZGmePjDeWEA++tvbL8r3UqG7ab
         cmemEZkB5CGG+dRqbPIuwDUJSI5gcWTU/zIVqy9vPCGAveOyK8fhS+Q8qndpjF3nZPk3
         QV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781975196; x=1782579996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iEduaZP3uRIog+A+9jyhhzskmnge2cwf7E3YRjfZ34=;
        b=i8Mg2Vi7ui80XiOQcyscXh6xhff8JfYy5QEAKfDUVKjWl550by+XWnmiSdpUGtGm91
         smrw8cT10YyA6aLG8qhtj/E8ve9z/orkwcqyr+GAILP6oiKQLpBGoloi0PJhko67rViS
         dlWJMl7mMJFS6gR4BAmbDy7rvK5uXUZ/IcfKnRL1/BR1+bGRA572PWDI3Kp2RcSdH0go
         cKUvtTD5umpeCpZaZsCD7jskhDqO/h0wbYa/wdAL6UfpxyKwIvevjIY2t2WlO0IKfhrk
         jo1jnBEFuvBtQ3NQKn9WdiWIuDPPefsHkIFpVFUt8O25SpTRecDDv6h6Zjjgy81LCRV1
         cV6w==
X-Gm-Message-State: AOJu0Yx4WIZ9uoap/FaX+zRtLFKkq7cmu1pQs2lswn0n6Cm23+vUXfVC
	bCpUA3imuvwSqm8DXis/S93JaieMijyftujz0R4hSFuOpaHrOkd4i6R/
X-Gm-Gg: AfdE7cn3lg4Zen35D/JNXUyl3MzAdyH8AIxgsjjNotHOr+LzQCikwWIKSie4T0A/v4g
	KaRHurV+dNLGijQT26W9NfF2lcWSJWY++a4jgKFYsmnKLH5aqX5aSH+N+tZkz3+63LbMRaFku5I
	zofFa8Dx/ZB1hUfhzmSx0QOMGJbRaKQmCQ3qkX1325eFbCZj10Bdl3da2C5C7yIt/QbxeDm8RH3
	sYtrqsqfBwEyb3JOG7gw+HpriDePvivaSiJJbrPh5QMmlMKvIhZ5F/o9oRu2h6BCjSfJavOcV7M
	PMpCAGa0Z/73y+eSsG8yNxWnCC0E2vbRV0rXTxpBdutLcNO3RzZkbwfgj6ndg55slh1rAmJSy7+
	UwDZCTWuZmMw8NDZT0WWzxazSZbcYw9C4qtxE5vwI1s7wSUUGB47E4c4pvx3/QXBFi9fx4CKDmM
	6pZqSyse9XFAK7+48UPgeGsqq/3K0zzJh7
X-Received: by 2002:a05:6512:a95:b0:5ad:4c8e:6941 with SMTP id 2adb3069b0e04-5ad5624d140mr1380136e87.0.1781975196247;
        Sat, 20 Jun 2026 10:06:36 -0700 (PDT)
Received: from localhost.localdomain ([195.211.194.218])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad5c2aed03sm600535e87.42.2026.06.20.10.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:06:34 -0700 (PDT)
From: Nikolay Ivchenko <nivchenko.dev@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com,
	Nikolay Ivchenko <nivchenko.dev@gmail.com>
Subject: [PATCH] mtd: mtdpart: fix uninitialized erasesize on MTDPART_OFS_RETAIN error path
Date: Sat, 20 Jun 2026 20:06:03 +0300
Message-ID: <20260620170603.334732-1-nivchenko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_100639_172987_661672CC 
X-CRM114-Status: GOOD (  10.26  )
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

When parsing partition layouts, if a partition requested with
MTDPART_OFS_RETAIN runs out of space, the allocator jumps directly
to 'out_register' to preserve partition numbering.

However, this jump bypasses child->erasesize initialization, leaving
it at zero. When add_mtd_device() is later called on this child, the
registration fails and triggers a WARN_ON() due to the zero ->erasesize.

Fix this by zeroing out child->part.offset and child->part.size, and
initializing child->erasesize to parent->erasesize. This is the exact
same pattern already used just a few lines below in the "out of reach"
error check (child->part.offset >= parent_size) to safely register a
disabled partition.

Reported-by: syzbot+3ae80219c633aca5431c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3ae80219c633aca5431c
Signed-off-by: Nikolay Ivchenko <nivchenko.dev@gmail.com>
---
 drivers/mtd/mtdpart.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 795a94e6b482..7f23f8a1b59c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -118,6 +118,9 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 				part->name, parent_size - child->part.offset,
 				child->part.size);
 			/* register to preserve ordering */
+			child->part.offset = 0;
+			child->part.size = 0;
+			child->erasesize = parent->erasesize;
 			goto out_register;
 		}
 	}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
