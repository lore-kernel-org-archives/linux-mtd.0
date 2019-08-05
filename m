Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E06C0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACE17205F4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5isY1u/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hd6RkWeI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACE17205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mCh7aFGeSg+t/Uu2Fb9+3fuCCryqBwZVBp6Zbd/sW50=; b=E5isY1u/OrU+9xKW2ia4hi/FU9
	1F8TI+8pIz2bpoaGw/YQP5Odn5mD64M3zuix4zBA9QBrxQ6nUMxlMZ8IRNbbMNFshODFZfjs52knD
	DzHGX3KTlfZ9Nf3m4sMSd7jNooBAxZT1RFcLTiLtXMciB9WaiHex8doddYVa13ElT8fTE5dBNWjx8
	tNzjm5F5z6lw49dk/Gv2ZDb7OMDzOJOwYj8KOTUSsJy/eSWz+Mzqh94aNuB1NjO9qwUn0IOGgDYkj
	DW1VxxISbjOm45e/jIQ/XFFvxEnyZ6FWBnKjMdp0Bq4wVMdJHZXjVcWNKf2MIzMUFkifsQoh3IZvs
	ty/mjsFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huiIZ-0006aX-UN; Mon, 05 Aug 2019 19:05:35 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huiH3-0003dX-4f
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 19:04:02 +0000
Received: by mail-pg1-x541.google.com with SMTP id i18so40206507pgl.11
 for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2019 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IBNIDOyGRy5eBAC8UE7PYjHALkNYM5MnCb2mIjeTu5Y=;
 b=Hd6RkWeI2+nqhZa9bvzlL2XEDA0h90BE7fbu2Nf2HV9621G8fQ+ozwRdxbzIYdESL+
 mI3XTeCVHXZIFuoPV7q5MHOwGgRhqewW5pkLN/sSftSvRHoxMXVX4QDiKBJxQ/rX7B/o
 0P/9akSsSETg9oFWuvcEUe8W3nJZGchDRGif7vGwpgriiMp7ss9wnyoZgUuGpW6GWIts
 tT3Abob3tHPPlOP/UxD/qKp+67LJkAuQSSZRZcrPB14JSNnNd4f2ujuWmw/kX6ILaXz1
 407fcSgF71g30kPtHBu98XqPd3lNOQqsSkPAwDNiIyi40tfVHGVB3MD0mXwt/cd1k+p9
 4POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IBNIDOyGRy5eBAC8UE7PYjHALkNYM5MnCb2mIjeTu5Y=;
 b=uVX6p7aFjaCg+pzb7B/GyzxToGejclMvsWGN7RtX4EDwoLyUCfg0Jx0kxG0a8FHSO/
 fi/zxvjvy5x7aCmGgbv35xgjC5EopbQoD12JrQ0QaFxIcNcEsFbC901MibXNUhSpB3Ur
 Tj6MIlM6eQKznHUsuBqGL8Ttbg5qztfFHGZ9oSjA/CMDCbRygd+Tu1JRRlGx9mazGH2U
 12zQ8IQbzSx8hur37MCBRA3w+r0wTnRgJxUQEwNwY/J6sQ58jT1Dc5INsPWKJ/+ELuIU
 OPjxI9oy46H4lTsXnAxuSyieFiAXSof5koMtkTcveHt5w9wlhUnHSk3gKt/OaRuO6I2K
 79rg==
X-Gm-Message-State: APjAAAVn978tRQLE99NTBGZO/nZNqFcCTVohb1kBn4MFjplh+dMR+XUZ
 IovKnAbYaZ3f/fDMw+kDnmU=
X-Google-Smtp-Source: APXvYqwsoLhvCbMHHQHw/9J21I2XJoBZ/n8XBEvZ28OYv6WY4frLIvgotyJJ/wy0R/BsQH7XQ1UK1w==
X-Received: by 2002:a65:514c:: with SMTP id g12mr138118341pgq.76.1565031840086; 
 Mon, 05 Aug 2019 12:04:00 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id q198sm88045579pfq.155.2019.08.05.12.03.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 12:03:59 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v8 9/9] mtd: cfi_cmdset_0002: Disable write buffer functions
 if FORCE_WORD_WRITE is 1
Date: Tue,  6 Aug 2019 04:03:26 +0900
Message-Id: <20190805190326.28772-10-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805190326.28772-1-ikegami.t@gmail.com>
References: <20190805190326.28772-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_120401_342933_E17158AF 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some write buffer functions are not used when FORCE_WORD_WRITE is set to 1.
So the compile warning messages are output if FORCE_WORD_WRITE is 1. To
resolve this disable the write buffer functions if FORCE_WORD_WRITE is 1.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v7:
- None.

Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.
- Address the ./scripts/checkpatch.pl issue.

Changes since v5:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 6f6fadb54e5e..5bfa80e0345d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -61,7 +61,9 @@
 
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#if !FORCE_WORD_WRITE
 static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#endif
 static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info *);
 static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_amdstd_sync (struct mtd_info *);
@@ -256,6 +258,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd)
 }
 #endif
 
+#if !FORCE_WORD_WRITE
 static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -265,6 +268,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
 }
+#endif /* !FORCE_WORD_WRITE */
 
 /* Atmel chips don't use the same PRI format as AMD chips */
 static void fixup_convert_atmel_pri(struct mtd_info *mtd)
@@ -1928,6 +1932,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+#if !FORCE_WORD_WRITE
 static int __xipram do_write_buffer_wait(struct map_info *map,
 					 struct flchip *chip, unsigned long adr,
 					 map_word datum)
@@ -2157,6 +2162,7 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 
 	return 0;
 }
+#endif /* !FORCE_WORD_WRITE */
 
 /*
  * Wait for the flash chip to become ready to write data
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
