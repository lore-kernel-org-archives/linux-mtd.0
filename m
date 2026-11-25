Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B6606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1OGumJV6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFA+iU5R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qRoRNO/+vTjKlFJgUbgmwkc+5sIna1HbysQWNNAokWs=; b=1OGumJV6nmGO1f8AQWs3npxqLp
	4Xn04GK8kHm4C7DqSwMz4eVg7GHnFyggfnpYaHoqMFRnvNfCYeOHMTdUXGCfnaxGW5CLEhMUNT4r4
	rCcHoErr7zA5kAkkyJdgUK6BRJRyUUETY43tM8vbcBzhMgyDeuRlepPRWN7F1rare8uYFRZkNXWAp
	EH/SqwCo8l4kvxbPA9i22ehb4FGaWdCVFtI1naY5zrpKWh2QFch+nKNoQj48MEUcb69gyNSNm+rSY
	T5HccZh+EaG14TBRlOzL9mtrnxzAl2OZ3XvlWSPqsZ2b3UAWz49BEj+C07rvgYxgpXjx1HPrpgAOd
	SMuhq62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBXI-00000009j8d-1iEs;
	Wed, 25 Nov 2026 11:51:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBX0-00000009ixo-0g73
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 11:51:37 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso1903760a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 03:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607481; x=1796212281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkancunSX1kzbBE3OARY16RCkvG9MfPLza4pw9wRR9A=;
        b=UFA+iU5RjCyR4G8OLB+kcnSjmmewiHqhV356+4xwVKzOI2joUXgWc2xVUxFxIlYOLE
         Cwovgirku9Xt2pJCbTrstb6CF22hDh+uy/0gKbEHm0AkL9XJXECnIjfF0Fk4C8Bxgw/c
         ypx6ElYqqLQNSBYGIOO2VsBDVfLJd8FIUd9Ghz+URnP/6DCFftdWWsLKEsadOq4mDuTq
         OCWlOSXGhVj/LY+HbqfAZqNJXdsnynGw+LbU/FgXtVqkTXRiK0/Oc1R438BE1hOy1qpz
         KB8ByjE7ZCOjVqfsm39wt8RnNo+LPpH9bklruR8dw2VJPslBrcF79Hn992TILIv3Zq9f
         mWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607481; x=1796212281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkancunSX1kzbBE3OARY16RCkvG9MfPLza4pw9wRR9A=;
        b=f62tsgh7HFxJeXFBdGO5AKnAq79VDLgtul7dASWMo7ajEgodfmtSdFKhQ1WMIHJWAo
         yIpdlPCJD5VL7Ij/9Ue6jCi5IK2Xzu3AzlKkhfFSV0881parIdd9wuZDVNY+A6QJg3+l
         07WtJmsu3wjVHqhWUuJwlB1E38QFMGqh0k8i6/GBah+9fsWYbYIV3qyjx5VyCFFRGpVR
         UBkkxPjKec0oALqUcPPeTB7iAuPI01lgESyxanePbD/czf9k1WEngZMnwF9+OpE8RbWV
         fecjdjI/dkINu62u4VbS5XwFGcPgPnDI+VVurYyEPBP+LtDDZtb3inFGL+m/UGJ7ln77
         zRUw==
X-Gm-Message-State: APuU4Z+0G8c2VmrE34F0Ww2C8owpS4nY8XOFKWPU+6SDY6/mSG8CmQJG
	Ez2yFDAZ1mXoAKl9t8v+OTYE4L34lfCRgyy8z26OhitVeXsnUEByyV84
X-Gm-Gg: AZFdTZfo7YheKK8UrRQMIh3vN+3u0pvdKVbwFAsWfeJ+FHji8RPK2ArN/aL1wZ/tId2
	WC1uHSskMsVW6Lk55p0iRyb2QS5CY2r9yK2ZJKWvLUoJEXxJamlbWnEA7teYcg7f6rY5gKFZPK7
	81B7JF/xWidIOliSZaMxJMqiQAdW5P5aqmdpf8VHqmhDyswbGjSb1OfjnWXJR5dfXyrEEp1tMx0
	0GFBsTxDimiKC2Z+xZQ5PobySz6q6q6QxPlgCZySzDoRzClrlpek5/8HD/Zd3d7IIWcmFXM3nAe
	DmWHHKe1lhBgi7BG2Aw3yriMXzipx5OhMjJKP9ALUIiGzMhVXP2ty0Tr8NkiiZ30H8WOTk6Gx/I
	C24kR3f4EFN7N9XG6pHL0E2MWi9NGmoj99FMCwhg88wXk/8tcjzYvNzW7A+b6kqlIiMOkCSv329
	c4Z43vY2MCotNAWmbQ2VYI871IEhp16F38kj4nmqLQ1oORwYSIgfEB6zt15/e9yg/kZ7utpjDWl
	hec/IlmVe63EUUWb+BEO3NXEpPSGR1FkU8XZbl7MyNPrgfdAD8zA4/bZKFntRORtFvR7245o+yB
	sOMxYloivm8ZaxJN/oHIZzu0BI5BKKLDgQ==
X-Received: by 2002:a17:90b:554e:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b41c95be86mr16142813a91.45.1795607480949;
        Wed, 25 Nov 2026 03:51:20 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm30569662a91.15.2026.11.25.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:51:20 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Wed, 25 Nov 2026 19:51:08 +0800
Message-Id: <20261125115108.4147741-4-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125115108.4147741-1-leeonion.muyu@gmail.com>
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
 <20261125115108.4147741-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_035123_433302_1D1A186B 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

r852_do_dma() feeds the buffers provided by the NAND core straight
to dma_map_single(), which is only valid for linear-map addresses,
but the driver never declares NAND_USES_DMA.  Because of this,
nand_base cannot know the controller DMAs these buffers and never
bounces non-linear-map ones.  Such buffers are not hypothetical:
mtdblock's write cache is vmalloc'ed and UBIFS passes vmalloc'ed
LPT buffers.

Declare NAND_USES_DMA so that nand_base bounces non-linear-map
buffers through chip->data_buf, and advertise the hardware's
512-byte alignment requirement through chip->buf_align so that
misaligned linear buffers are bounced as well, like the other
DMA-capable controllers do.

Fixes: 67e054e919248 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..a68f58c81d6c 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -640,6 +640,9 @@ static int r852_register_nand_device(struct r852_device *dev)
 	if (dev->readonly)
 		dev->chip->options |= NAND_ROM;
 
+	dev->chip->options |= NAND_USES_DMA;
+	dev->chip->buf_align = R852_DMA_LEN;
+
 	r852_engine_enable(dev);
 
 	if (sm_register_device(mtd, dev->sm))
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
