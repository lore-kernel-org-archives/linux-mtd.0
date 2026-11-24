Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1CB606A31E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tma32wee;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZgYV7MAz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Mmkr5cGn98OLoTYDZj7xaQ5E2tkwys+FXGEDIsph0U=; b=tma32weevuNuCaNEfQLre4cjlm
	iTE6OC3MSEviAJQWHyNPlY1HwZFnt/iUG1V1/7k/6MrjrujjQpMC9REh2LDVKwY2U7dDOlUZ+Jrfi
	IE4YHgv+pDJtdHVNCpo4Jyd7dt6JGmAR9efziI2PTch3ROkGdx5tYzk+Y6EDTbOWOFWegkDOLt0NE
	7k8Kepwlw7ho4g7IIzPTuz9IQ+9soQOCeA1narUA+hoM8uuarM1U5CVvvN3ENAJhwiwvkzN7GaCTg
	wN8LFJ0LoNP4oMTdYEySQ5MgM35BWLYSUGijHt9AQtfp4h0wK2nbWNzZiGkmJpyxm4SKGcABf5FIT
	iJirkx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgiv-00000005PIs-1bHa;
	Tue, 24 Nov 2026 02:57:37 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgir-00000005PHX-18ND
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 02:57:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2f04244c3d0so33206015ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2026 18:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795489052; x=1796093852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGzjYYK2RrRv1SuL2YUffxkbeCFA16ZG+Je/ZdpQngg=;
        b=ZgYV7MAzL6soPloywDH7lABwT9s978eksE1t1iE1xNJ/G/vhUrFWUQxIRVHNBGEzJV
         QLEyrobTOGpgrKeHBanmqDADtA4Z4sr/Qx0vPlLLILujytk4e5NIRmH8d94tBVH5LxEF
         EYjcgY7zT1PAbmSVuA7efa00611t3n8wrF5kzL36KrT6DBZfXhq58ddIx/g7oh6ZA8cr
         HOUoO0J/tSv7xvjDX8cHhZBVWGC/QkfXLtSHfeXolV59dJhzXIEX+mEqkbBZOlQsWoCt
         o/3C4enV0rZvSIqhUM0esSTnNjHASrbqiNl2uQZafjpwU+5sYpawNXaPr9L6Ghr3iW72
         yomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489052; x=1796093852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGzjYYK2RrRv1SuL2YUffxkbeCFA16ZG+Je/ZdpQngg=;
        b=1IIztiYVUz79tZIG4TN7YSehkbB6r/mpz5paXOpdOTdyhtqOC7C3MKpLXUGqzy7ECC
         pNZS/WrrE9E/+iyznOAhZ6kbvavNpfnBD99q7EIdMTlhKJql+sWq9sjy1nrklFeCbb2L
         EE4mvv6UaAEzVFdVpMpDqohmSIVkfsB6ad5cfx4Fx0ev5h7X6KEM4/ZhZQfC55amQc7g
         VTRDHwQOIm2CcLghCgTYjmSdBO2GZXssbsTnnCoROv/hK/RlJvEb6E1F6/r6A/4j/V6t
         kE9vDnbuTNpJ1w7xyMjCp1fxGpeCY5zzNgHjM9opKZxAohR5lkznPSbIKYTY+hp2f0Ma
         A8Rw==
X-Gm-Message-State: APuU4Z/UvIPjBI5NyRgckBr7U2Bc4RKgnIEEplWPcK5IOxEmVURUbXLg
	rO4gvXWp7ZOx8A6eZa2SuL4Cln1OkwFAOXanIn1dHTlWcq5tEnx0A2hu
X-Gm-Gg: AZFdTZfSRwMnad4Zz7lzsbUBhCk/Bz9PuUu9eRA9XkVQGvjq/kiRB3XHoQ2fkLGzDZq
	889NmkGXuOqrzsy2fFwzK3bu39cF7xxlkE/maD8H0S2lxVi2QzvEJUoBWYzTatAINSjCAYJlIW4
	HOobQP09GbVGLAYg2BcGYXmzXWDMUqLfY5vwOpvYm6f2/u0+FfouBXQRnA7slnwdZ+NEEN6giS1
	VmIO0ReQlrOUYtUTopEK7yNYPnA7Tfc9fQq30+J5FK0C/Av+Mfo/No00CRaWiUKu39hn0dj4I9t
	3wDqP8SgnrRx0P6SAi39V1uEL1WK3UM8jdyW6NQNG4iJep4MPhYy/YKesxf8tHuy0JLiJwTkPlG
	vEr4c8683TGD822i6Q3sQP85X9wpPd+ewQKcjPjprww3uc0X9NRAM7/rOI4wVGX+B8Nexi0wNzR
	A+s9kaGW+JDAC+D6wP8sV5mYkY/GHdOF0nGg5jxcB4RBLz9n1PKe6HMWQbcaWY6/6BMhFk60Zo6
	cQDVmQK5P7mR/DL7sSmxGdM+b3qV9pDUmuWTw/mkv+OJLUWjHX33U1Ax6dwJWODlUNLTBbr8sfK
	QF3kHydc+CCpSHbiB0D6t83ZZji62UWCeGP3UHfZDgXScSDZ/8+VGIc=
X-Received: by 2002:a17:902:f547:b0:2f0:60c4:9d1b with SMTP id d9443c01a7336-2f060c4a58dmr104313945ad.62.1795489052233;
        Mon, 23 Nov 2026 18:57:32 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm60823275ad.9.2026.11.23.18.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:57:31 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH v2 2/2] mtd: mtdchar: use mtd_alloc_buf() for the read/write bounce buffers
Date: Tue, 24 Nov 2026 10:57:22 +0800
Message-Id: <20261124025722.1476247-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124025722.1476247-1-leeonion.muyu@gmail.com>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
 <20261124025722.1476247-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_185733_447816_B5463A82 
X-CRM114-Status: GOOD (  16.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtdchar_read() and mtdchar_write() so far rely on
mtd_kmalloc_up_to(), which halves the requested size until the
allocation succeeds.  Under heavy memory fragmentation a
multi-megabyte read()/write() thus silently degrades into many
small mtd_read()/mtd_write() calls, which is visible when the
low-level driver cost scales with the number of transactions
(e.g. drivers forwarding each call to a remote controller).

Use mtd_alloc_buf() instead.  Devices whose driver did not opt
into vmalloc'd buffers keep the current behaviour; vmalloc-safe
drivers keep the requested size.  Also update the comment above
mtdchar_read(), which still described the old mitigation.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/mtdchar.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac72931..0142cad65aee3 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -111,10 +111,12 @@ static int mtdchar_close(struct inode *inode, struct file *file)
  *   FIXME: This _really_ needs to die. In 2.5, we should lock the
  *   userspace buffer down and use it directly with readv/writev.
  *
- * The implementation below, using mtd_kmalloc_up_to, mitigates
+ * The implementation below, using mtd_alloc_buf(), mitigates
  * allocation failures when the system is under low-memory situations
- * or if memory is highly fragmented at the cost of reducing the
- * performance of the requested transfer due to a smaller buffer size.
+ * or if memory is highly fragmented.  Devices whose driver did not
+ * opt into vmalloc'd buffers get a reduced buffer size, while
+ * vmalloc-safe drivers keep the requested size, so large transfers
+ * are not degraded into many small ones.
  *
  * A more complex but more memory-efficient implementation based on
  * get_user_pages and iovecs to cover extents of those pages is a
@@ -148,7 +150,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	kbuf = mtd_alloc_buf(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -192,7 +194,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 		if (!ret || mtd_is_bitflip_or_eccerr(ret)) {
 			*ppos += retlen;
 			if (copy_to_user(buf, kbuf, retlen)) {
-				kfree(kbuf);
+				mtd_free_buf(kbuf);
 				return -EFAULT;
 			}
 			else
@@ -204,13 +206,13 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 				count = 0;
 		}
 		else {
-			kfree(kbuf);
+			mtd_free_buf(kbuf);
 			return ret;
 		}
 
 	}
 
-	kfree(kbuf);
+	mtd_free_buf(kbuf);
 	return total_retlen;
 } /* mtdchar_read */
 
@@ -237,7 +239,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	kbuf = mtd_alloc_buf(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -245,7 +247,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 		len = min_t(size_t, count, size);
 
 		if (copy_from_user(kbuf, buf, len)) {
-			kfree(kbuf);
+			mtd_free_buf(kbuf);
 			return -EFAULT;
 		}
 
@@ -292,12 +294,12 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 			buf += retlen;
 		}
 		else {
-			kfree(kbuf);
+			mtd_free_buf(kbuf);
 			return ret;
 		}
 	}
 
-	kfree(kbuf);
+	mtd_free_buf(kbuf);
 	return total_retlen;
 } /* mtdchar_write */
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
