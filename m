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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA43C282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD2D20815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cavnzgqo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3xy1dFU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD2D20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0IvCNeEfRDrzoQJYAGVAd1bvDEzrkHBFfQiNaTDaR4M=; b=cavnzgqoIEK96PV8e1D4swCNIO
	4JgjUKdOBIp2siAW6M0EboIK0cIN5uPEjsCa/l+CvO5ZXA3ox6kNTTkfopw1w3f4Zdd3pSxhGUMlN
	H89z+EMMAm/wzpyoehXnMQof2rbe98ILdnzIWHk+OyF0F+qJMAwcMrk1tjjHKIgFUhS87qDU60Ubd
	ATLLCsasCRuZMgFLM4bYHmlLbaOs0y9laIc9iLMtgakz1PFi7C4iM3axAKckS0YyvDnfUmKO/6E3A
	d7q6FPnjOWgvMDUHVpS8lq+koF84wosXBwCVVNuYeVf3IztS3orW4p7DeBSDz4MsDRdiF7DFcl7PV
	sWbtQwFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvFb-0008Fq-Lb; Sun, 26 May 2019 15:39:55 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvF9-0007dg-Rf
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:32 +0000
Received: by mail-pg1-x541.google.com with SMTP id f25so7654262pgv.10
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y6ZY8vO02Hy486lAm0cFz42e1nZOHREXNeXLc/W486M=;
 b=j3xy1dFUixoQF6dlY2fdz/mywaZVBWw7GvikhDYCaNeoUZnR853AdmwfBLGZmIEZ+5
 j1v4jO+SvuUkUvDTFBRGXx9WhiVy4JNP/MYC41AF5mn+w6injBXJqfKVEKoCNCK0nGPh
 9a6Exar201SNsWXCYaWmbp7JL5D8gM02sjLIoizZW5Y9b+4IgjeXeACleXtZLumi/z8S
 CzzYfu4dulnpdK4nBfHKWBDn4tKLE3n/nwztaoLBP7H5RBQ+8nZ+5+CWyk4HEbYysE5K
 c7aKbxbEmVai1Gr1X+wmjATHQ/owfLFnSTwXCPo4O8ZipjJbXiI+SxsY4yNSyhnK1Dxb
 gv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y6ZY8vO02Hy486lAm0cFz42e1nZOHREXNeXLc/W486M=;
 b=gK717So9fVuHfbu5Mo/1VlX27F1N2eF8h6MFo7nBobd/Yt20n9CtwmB3s8RYdFE6bs
 zHklC6biACuVKoNMc3K0ALGlSJjGPdWDBBA+uf+Y6ESiWKOYWZuqXKbYXFQHeqjpA5LS
 eEm08WzZ3yZVw0N874iliT32PlpIspDFiLwdYL3bUuevaf42HfNwKBVWu1lT2rtG1i65
 nB4c/zbD6vIgNrvDTdK0ikg+wFd1NVGredrJ0SbHypNs+Zy63Gn3BJGtXh4/XEfw3tCn
 m1HIOvuShZJVsFPigh9lMax5lTFSj2RDaujelOMaFk4EhyGVmJPzBGDpTBspkefaC+Ic
 G9Dw==
X-Gm-Message-State: APjAAAWh2Y+F3HOqIByvrHxTmSa6X3FUCAwoEJn54gNpES/DYktUX3w9
 BVsQC5Hp+DoQEHdtJ+VnCvQ=
X-Google-Smtp-Source: APXvYqywYq7bSXQBGjjwOT6dDbH8PQ0yIjfJj/jYcnn+cPekMYucYKUhV2oMFzqoHzm5kpvYlT5phg==
X-Received: by 2002:a63:31d8:: with SMTP id x207mr881784pgx.403.1558885166774; 
 Sun, 26 May 2019 08:39:26 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:26 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 03/11] mtd: cfi_cmdset_0002: Call xip_enable() once only in
 do_write_buffer().
Date: Mon, 27 May 2019 00:38:56 +0900
Message-Id: <20190526153904.28871-4-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083928_141302_4B34388A 
X-CRM114-Status: GOOD (  14.50  )
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

By the removed goto statement it can be called xip_enable() once.
Also for a maintainability refactor it to call the function only once.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Split from the patch v1 3/3.

 drivers/mtd/chips/cfi_cmdset_0002.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index ca41f47c00c1..2654019ee24b 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1892,10 +1892,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			break;
 		}
 
-		if (chip_good(map, adr, datum)) {
-			xip_enable(map, chip, adr);
+		if (chip_good(map, adr, datum))
 			break;
-		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
@@ -1916,13 +1914,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				 cfi->device_type, NULL);
 		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		xip_enable(map, chip, adr);
 		/* FIXME - should have reset delay before continuing */
 
 		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
 		       __func__, adr);
 	}
 
+	xip_enable(map, chip, adr);
+
 	chip->state = FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
