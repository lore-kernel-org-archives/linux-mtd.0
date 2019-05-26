Return-Path: <SRS0=EZ/G=T2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FBDC282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:41:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1878E20815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:41:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhf+jeiB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfSJ0tXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1878E20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bDrRfHKYzHQTNildEybmBW4DWyRbXazYqtcUytY4qd4=; b=hhf+jeiBFoudUw+p8B2dtmTxpF
	tNsBODjV58rm3KuzFdiWvl5bLLL5VSsV9f17syDt9OSJNbrv0IMkgQT7suuWzq20L+eWMRRPYOZ3N
	6sA6NtbaXc8tU93j1CQAJhDUiCwX+TxlwqTtuVN/QA0HjFMrj99v9kx++ysxvuOCyCmQZtb3DSs3c
	l2AbAzPvu1TssOuaxPgxgUe0x4QGUM5pipCpW9ZsgveumQvKXCADORZQfaxF7LI8glflsVe4q8WKm
	Hs4oRktHdvo0BcOcxmwXhkf3ig5NC/XAtWKHUMLEgL+VExn6Qsofox1CqoKs0cOHpJq2/2nnTk+l+
	f+3m87kQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvH4-0002oP-KP; Sun, 26 May 2019 15:41:26 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvFP-00080W-Lz
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:53 +0000
Received: by mail-pg1-x541.google.com with SMTP id a3so7670153pgb.3
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I+Nla+eYiRgNyjc6CFBwjIMp6EjQQX4EWjH7ft2Hovc=;
 b=BfSJ0tXZcaSX94MMZmOPoYNgexH+djrsPZWFh5ukesK8D8+u6rOx2xc6SdKuwNka0m
 kTq7U02jrDBZGm23IFteiTdGg4Gi7P8Wm9fjG/Sp56O85APCqw5ciAUMdBb106tp9XE3
 CveHveAolHejTBuQ+hLhHgZgACJjbKEc+USLm/qwBzam6P/syxy2HP7KNppJeel54I7S
 qgxmJBikLx7372iAH0/OlXlcYqyXjOwRyIQ7unMGU4wN57GeUil64USmO2u7AjoAGYQS
 iKJOcqXoDQqJ/1G/P2pf8aSIORmDjfaycbLBC+UCOxvsDEh0E43tTfujF60Z3MZSKN3T
 Jltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I+Nla+eYiRgNyjc6CFBwjIMp6EjQQX4EWjH7ft2Hovc=;
 b=jyKQjNXQOi1wdpRVoju2NZ6zOe8gz+cYIDolvOqTxZ1z57JJ9pS98jAMkbClAQJGIi
 rtXSeMlkD4OjexS5EWCYfILRzdwFAaqugA5JmSd8o3Sx959MMokDCKRjc5R2FOtNRGUp
 0jhGS/cvP7grb0lrNxfeHTJhW6+YcVCuK3nxxMdmhRugAzs5ZNyQP9aTxkRVpiEqUlN8
 SO12NxrcSVcBuSdg8ZbSWp0vWTTK+E1R4DgDRpCLC8TVi6AHrBTEcxhkLjoEhVpPIs82
 k7htmW1ycE+Hf5dIkYz1jYauGjplVN3Q2iyVYM9Tyii6m4vyLH+rwDhjkXfaf3b0BIr/
 bwBw==
X-Gm-Message-State: APjAAAWPJPca8CxSGsiSD0QH4okCF2VEOu29KUHp0jEU8sfDnhonZHJG
 6Y6CU+7Z5vH/+N2YfvGjvGY=
X-Google-Smtp-Source: APXvYqz0m5JPYn2XV0YMXz1lxzU0skjM+F6VTaxdww1XwugTT14tAYdDv6JKkSp9DKLClHAlXWgduw==
X-Received: by 2002:a17:90a:80c7:: with SMTP id
 k7mr24686087pjw.90.1558885182995; 
 Sun, 26 May 2019 08:39:42 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:42 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 11/11] mtd: cfi_cmdset_0002: Disable write buffer functions
 if FORCE_WORD_WRITE is 1
Date: Mon, 27 May 2019 00:39:04 +0900
Message-Id: <20190526153904.28871-12-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083944_222726_F0F5DA99 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
So the compile warning messages are output if FORCE_WORD_WRITE is 1.
To resolve this disable the write buffer functions if FORCE_WORD_WRITE is 1.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v5:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 477bc3d65e68..2144221029e9 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -51,7 +51,9 @@
 
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#if !FORCE_WORD_WRITE
 static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#endif
 static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info *);
 static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_amdstd_sync (struct mtd_info *);
@@ -202,6 +204,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd)
 }
 #endif
 
+#if !FORCE_WORD_WRITE
 static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -211,6 +214,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
 }
+#endif /* !FORCE_WORD_WRITE */
 
 /* Atmel chips don't use the same PRI format as AMD chips */
 static void fixup_convert_atmel_pri(struct mtd_info *mtd)
@@ -1836,6 +1840,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+#if !FORCE_WORD_WRITE
 static int __xipram do_write_buffer_wait(struct map_info *map,
 					 struct flchip *chip, unsigned long adr,
 					 map_word datum)
@@ -2064,6 +2069,7 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 
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
