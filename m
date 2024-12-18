Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37926E77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 10:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q8hviNLqh4t5LbqZxeCPltcD06BBUAFBQp2gaZt8DbA=; b=Z/GD0pNQbtmcwf
	T5al64qUBjexHNIxpXmp/pLPLi5LhFeE3X5iYnjGUZoGhS4fRRDHVXUJT1IvPPzAgx7Ade8j8F2xD
	ZWyvzMrzKA4iPtxPgxazsQryRjo7myq3qaTmdRF4/KZpNWVIJP0Gojj93mRmiTBIv5yeXZKBqufTt
	zJpksyDRN2j7PQawpf7EDma2L57QZWDpmuGv62yR4S4Dvv3yepV1EyGYFxLJMO/p3iIuTO75HA630
	qPZv+JHhDQpIbWtsMoebl4vhIQTal2DAv3/zbjItsNdSbcAYLoKlYMxn5m0VdTyFoEAxPBH2tPXD2
	AjYBpGEgEu927Vm1BAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrO8-0000000GHEh-1jsh;
	Wed, 18 Dec 2024 10:34:44 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrO6-0000000GHDk-1BMY
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 10:34:43 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5401e6efffcso7193200e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734518080; x=1735122880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=joi2cSg/t4OGMBo4Xoyqshd6QjAdm7EZbvasit41MKY=;
        b=MV2vDKGaWj6ZXJOYoQ7Gqf7Qa+nK7MUKPkM17ADA/RZYxTRyQ+b4KOwFZwGQk4GXh9
         haOa6b6HH+2xUZD+kz7JzpKCosjnYGzOlUN4rnPXPKWYW42hrbezBdw0CI8TnnW8Nwwd
         9nOHPrTBQCmm5GYocJFMeuIR7LL4q+tVgha44umGWHtE0SC/n9nSQ5L2igUjkU4ozgUL
         AxWaWNGuNqbyA93P54w38oSEOnf9lbJ0NKI5kC6UhWLLQ/nRnP7kRXOumFws5p99juja
         GzKlGVV8eszorKVRGC6uByNhbh6eE9Btcv6J1J3zymTr1xGcdnUnu/mkteXplYAnNKDE
         JvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734518080; x=1735122880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=joi2cSg/t4OGMBo4Xoyqshd6QjAdm7EZbvasit41MKY=;
        b=uDrPCd8FdR3Uf4cVa3qHy7hsxa49cG+2a5qSHQBidoT8N6EZ2gM4iytZQjPXgyTcxT
         PYwSVannOo5qKD4V1n2pdx2KOSujspsNLTE47uOvszC7JlfyP5kIzbBC/cVHTGKt3UIH
         zwznJZsMJ/NRqYPDliBJz1fUuLzfwBFDs5MBQoxidmatyUDLoNBy4YFTHYdguRn9ZE1l
         vQ9ObuAe2NyGqvpgMxhjRpeBRDw3pr2s4VPcrg2yOFWlZq4ioaLNtUKzT0Wnxfdhccrd
         WX5c3f11kKQ50S8oOmkbin+3tnyH0yDxgSXMhS6khkvvaHyhqyTGgZcq7328+PP7Ja+r
         898g==
X-Forwarded-Encrypted: i=1; AJvYcCUl6QaMpFd4tVSBJK40sKPIp9OBdMy85ZCLhK7dZMgLBIOIlUuCaHkRL+MiCxzK9y85w/ocW5pHLBE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcbFsbXV+7mEEzUrY6NcKUtrapik9uSAJVDMPbJJ236LvIUMFW
	eis6qx8a5ya9orqh0ZAVayzcQ6yijaqDgYh+03Q9NOKhfpzLJT2s
X-Gm-Gg: ASbGncv3Dbf/MesoPuA09NjQBRTRlFv+wxjNONCEgbCSKQ90a3/wol+gmxEilGUuWUn
	ViqSpmGUI/vZUfJ+tKSddJ6l6/yeTRaFQz1u4df80JuhzFf1h7HCNcHz+e5feg+RpHNRh446CRj
	lXjm7+R+sAtV3rRIfDYGnZ7LvTSgFOfpYDGE/oLGjXoQAiKPxfdtpj4DVGHTEnKif4aRTyFyBSM
	snntLqM/K+kLDfH3zLCTo8mMBDViU3eOBq4wNfq9/oEebeTe2xooOFangHCVqh9xvLeHkq6KTOl
	La9WxqeYWWdare/xmCPTbvlgopVcEGo7TBM3wQ==
X-Google-Smtp-Source: AGHT+IG5//Rbu/YCzABiKU0SxIMRKbl8qj6irAHn++SOn7qYvE8r3LpJce2mYKFtDcBQ76nSwj02vw==
X-Received: by 2002:a05:6512:1106:b0:540:2da2:f288 with SMTP id 2adb3069b0e04-541e6740354mr848231e87.9.1734518080104;
        Wed, 18 Dec 2024 02:34:40 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13f6esm1412287e87.221.2024.12.18.02.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 02:34:38 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] misc-utils: fix integer overflow in ftl_check.c
Date: Wed, 18 Dec 2024 13:34:55 +0300
Message-Id: <20241218103455.480067-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_023442_321493_05B77D94 
X-CRM114-Status: GOOD (  10.41  )
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

Report of the static analyzer:
An integer overflow may occur due to arithmetic operation (multiplication) between variable 'nbam' and value '4' of 'sizeof(u_int)', when 'nbam' is in range 

Corrections explained:
Avoid arithmetic overflow that could cause an incorrect amount of memory to be allocated.
Handle memory allocation errors (malloc).
The code is robust and safe for large nbam values.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 misc-utils/ftl_check.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/misc-utils/ftl_check.c b/misc-utils/ftl_check.c
index 5b2dae5..fe43a24 100644
--- a/misc-utils/ftl_check.c
+++ b/misc-utils/ftl_check.c
@@ -120,8 +120,17 @@ static void check_partition(int fd)
 
 	/* Create basic block allocation table for control blocks */
 	nbam = (mtd.erasesize >> hdr.BlockSize);
+	if (nbam > SIZE_MAX / sizeof(u_int)) {
+		fprintf(stderr, "Error: nbam value too large, potential overflow detected.\n");
+		free(bam);
+		return;
+	}
 	bam = malloc(nbam * sizeof(u_int));
 
+	if (!bam) {
+		perror("malloc failed");
+		return;
+	}
 	for (i = 0; i < le16_to_cpu(hdr.NumEraseUnits); i++) {
 		if (lseek(fd, (i << hdr.EraseUnitSize), SEEK_SET) == -1) {
 			perror("seek failed");
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
