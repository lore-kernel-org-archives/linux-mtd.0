Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8E606A32A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VMw4qgWz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hM9YP84u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8H3s9G47mZQ7oDYBzCBmfr7xmIHRmX3R3ZGHzL0qqak=; b=VMw4qgWzOwHjXubMQvBMrPDSCZ
	I3DYl448lQRXiIi/ZF5KV1bLSgM37BgaM3kPpTfsLxFR4InCCmQTX/7Br6UDU+LIwUxv61bjRATwg
	cvni7zd/3ZZa5WQNUIV/fg1pEQJZ2VaYbf6ZlohPVZj6qxVY897/L1gpGorlKt0NyozWtQzR5B7rz
	rcskWzeBs8w+/bWLhvl7ULK918pk65fWTtvlmg6ENZBw/USnDB/O1ETPF9XNFGV/btpfS+KJYs5fk
	zE009LIvVKG+GT3P+HlFtkxK99ICc7OPxaExUPRVXsVVr+4BvbJn27j+OyAHERY6L8OrXlw3qZiQj
	i8xlHXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy7z-0000000BLzF-0Cdl;
	Thu, 19 Nov 2026 09:08:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTy7w-0000000BLyf-30So
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:08:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a05b210703so1162684b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795079300; x=1795684100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEuafh/btliWcWQzu4rL42Kz6r8EMDrqcLczyrhz1a8=;
        b=hM9YP84uXDqUaa4BEK9uos+hzYdxtTphOrvg+pTZa7Gxvd9sILncm9MKpl71PzMUP8
         Ix3fZ9vYJcn59v8tK2saNuqQhJq3MejXTnn1XuL2mPZAHkwXUnZghMw87W8yMr2aQmPf
         FiHQupA9DWMm3Ccl72OT1y7oSKobl1ZUqY451saF1un0Y4UAia1FE2fV8/eEyGmTs0SQ
         fvFOZiLDC2ul8lLLy7LrSO+g2cs9rKQmLEerYzyi+KdxjbWDD23Fmj3RKolc15l/u/Jf
         YmrKrFp3aiASBa+S1DPIhnTjvbRdlAtbQOJhuXpJiKW6Lr9XnIlPRtrcnvPEE+eWPONs
         9pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079300; x=1795684100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEuafh/btliWcWQzu4rL42Kz6r8EMDrqcLczyrhz1a8=;
        b=wemDVAkbt1r1HYtogVbiC18oHa4V6I8nATurjWudC3rYpRH1jbooLBktlrHraBXt6t
         2/TCoPKeCZNZJRmg4o2/rhf1aoKrDvE5QOdZxIOADLracCDj+31/2XMjyqy/D2rUnCEe
         gT63rnp9/wYb6T0covvnT7/2WWnjTxMt8YgKLtpX3N4jCHXjw9vIXm1ex7ufvjxI7s9B
         8Aqv85m+B3ZWAVbcUNu38fwDXcsaIj39J9EzEI3zM6InA1JULNHRNd4dCvg3fVlWPBAS
         fgXTHhfAYyr5wqZyHwbjU6l90KfIQ2Dhav98BelW4fTL7KbjRnRgnayDgHjt2h/MJWly
         uLAg==
X-Gm-Message-State: APuU4Z/T16k6yfwBXjGIKl4eGykdyTRBUQGx9lXjJXSYP1htQmyqlX8t
	C0bx26dg1+KdM4+SMmzRffpcFFQn7xq02MXjwcQs77jW0Dn5nvqyhaZJsNWfFzLX
X-Gm-Gg: AYBFou0SncBXXnIV86MygAeZEfVnuxrq1ypVkvb9pPs7cYA1979a9MBlPAhiRNaIGYq
	j1MLhK/sN4NnC2y2Kt6m2Hy+DtJfgSP/SwM6R9IP2JJa5xHvq6Z66/QB1GsgxJqqYSmBoXW2Wta
	2XKE33Q/OD6Ee576k0Uso+a5ii0evfB92f4zxiI0EALA6cbHCvwaF9F4rUCo1YSJJ3B/eiC9V9y
	cFdXW6K8lmybIKvzjVsC/bdAmgZPIDZZq7jGnIyat7UVs4Sr8CAOP2+UkEAJlX2vI+CPItQY0iq
	792akU0CAARcscyjJ4pM2vnyjHGL721ojWiAFwIJAWOvyQYX1ta6642YtbCKoHh/1cX/JuflGMv
	2AfmUcGS8b2oDBeAbzXa3lNLFRXycolos+TNWnRfEx25p/WmtrFIoL+rLsRU0FdMW6aCP74JxTx
	ZoXw/+B+UVLiEQQgbwNQyJpStolquPTFn/SLZ9qaULMN3YxxADToDxjaBsfhKmdHVCDgeYivRM9
	Ex0foVZGWzUCWHz6YKSK72+0VgsdRD++MqYtxui6IUD/wNQYFipqWqoAH2c/p/s5ui06qDbeRMs
	d6VGU8Q4bHAmyG/b/wCxNyUlsoWS1oHQEA==
X-Received: by 2002:a05:6a00:3007:b0:8a0:3ed7:93a7 with SMTP id d2e1a72fcca58-8c5d314d98cmr4789290b3a.32.1795079299712;
        Thu, 19 Nov 2026 01:08:19 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb93d023sm2372941b3a.47.2026.11.19.01.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:08:19 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:08:14 +0800
Message-Id: <20261119090814.1355651-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119090055.1255028-1-ping.li@horizon.auto>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_010820_759852_B9188B6D 
X-CRM114-Status: GOOD (  13.48  )
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

mtdchar_read() and mtdchar_write() use mtd_kmalloc_up_to() for their
bounce buffer.  Under memory fragmentation this helper halves the
requested size until kmalloc() succeeds, so a userspace read()/write()
of a few megabytes may silently degrade into many small mtd_read()/
mtd_write() calls: more per-chunk overhead, and device drivers whose
backend cost scales with the number of transactions pay a visible
throughput penalty.

The ioctl paths (MEMREAD/MEMWRITE) already use kvmalloc() for the same
purpose (83208e106a8e8 "mtdchar: use kvmalloc() for potentially large
allocations").  Use kvmalloc() in the read/write paths too: it tries
kmalloc() first and falls back to vmalloc() when the buddy allocator
cannot serve the request contiguously, so the buffer keeps its original
size instead of shrinking.

The size is still capped at KMALLOC_MAX_SIZE, as mtd_kmalloc_up_to()
did.

Most low-level MTD drivers only memcpy() the buffer, so vmalloc'd
buffers are fine there; controllers that DMA directly into the buffer
(brcmnand, gpmi, cadence, atmel, ...) check is_vmalloc_addr()/
virt_addr_valid() and fall back to a bounce path already.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/mtdchar.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac7293..442fac076940 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -148,7 +148,13 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	/*
+	 * Cap the buffer like mtd_kmalloc_up_to() used to; kvmalloc()
+	 * then falls back to vmalloc() when the fragmented buddy
+	 * allocator cannot serve the request contiguously.
+	 */
+	size = min_t(size_t, count, KMALLOC_MAX_SIZE);
+	kbuf = kvmalloc(size, GFP_KERNEL);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -192,7 +198,7 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 		if (!ret || mtd_is_bitflip_or_eccerr(ret)) {
 			*ppos += retlen;
 			if (copy_to_user(buf, kbuf, retlen)) {
-				kfree(kbuf);
+				kvfree(kbuf);
 				return -EFAULT;
 			}
 			else
@@ -204,13 +210,13 @@ static ssize_t mtdchar_read(struct file *file, char __user *buf, size_t count,
 				count = 0;
 		}
 		else {
-			kfree(kbuf);
+			kvfree(kbuf);
 			return ret;
 		}
 
 	}
 
-	kfree(kbuf);
+	kvfree(kbuf);
 	return total_retlen;
 } /* mtdchar_read */
 
@@ -237,7 +243,13 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(mtd, &size);
+	/*
+	 * Cap the buffer like mtd_kmalloc_up_to() used to; kvmalloc()
+	 * then falls back to vmalloc() when the fragmented buddy
+	 * allocator cannot serve the request contiguously.
+	 */
+	size = min_t(size_t, count, KMALLOC_MAX_SIZE);
+	kbuf = kvmalloc(size, GFP_KERNEL);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -245,7 +257,7 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 		len = min_t(size_t, count, size);
 
 		if (copy_from_user(kbuf, buf, len)) {
-			kfree(kbuf);
+			kvfree(kbuf);
 			return -EFAULT;
 		}
 
@@ -292,12 +304,12 @@ static ssize_t mtdchar_write(struct file *file, const char __user *buf, size_t c
 			buf += retlen;
 		}
 		else {
-			kfree(kbuf);
+			kvfree(kbuf);
 			return ret;
 		}
 	}
 
-	kfree(kbuf);
+	kvfree(kbuf);
 	return total_retlen;
 } /* mtdchar_write */
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
