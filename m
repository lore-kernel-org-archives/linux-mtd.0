Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB42EE77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 12:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zosJrtRTxBWytEB0lAjOKjSk9Ph92/g2FlPysTATvL0=; b=FhU+xHQvT4P9Fk
	tZeXWUt7mMC0/YBKnx1buyLF/8jTeqpKPVnhPR/UUmuMM+aU0/RMunGglcVmWrqTQHHYaueITqSyi
	8+Td989scLGNObd+naoJF5wt9nZC1mgDAhGSnUU9lMzxFPLZDPq8PHIytxk4XoQWfQCNn9/V2pmAD
	+7GP8x4d0z5xNEXd6kfiJ4XnyIPpHlayJWV1E+6L+FtssJ+TFRVz9sXb7hb0Wyh2bm75Vop2rIU6c
	n2o1C+WIpd0qTn/qH9RD5JKNGm2s0ItTqwNiESnw80hcbQ/nGs5kbTieqKoxUbAEhRz5hjLEwyjhW
	91t9UrRAy4Yxs431D2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFlf-00000001p3J-1YSF;
	Thu, 19 Dec 2024 12:36:39 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFfA-00000001nUQ-401O
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 12:29:58 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e3c47434eso700286e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734611395; x=1735216195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o96sPO7V53sDOZUODJclDkKQUyP4WoHMQMf4eVZlo0U=;
        b=AoHlltJg7HEpRlYafSIo3zuaBWVgaoG3no4YaQ/G8/R1SNGQ160KClyMWQThYGMLQy
         AowhPhOTGmsrVs61yo/hkgzlswJnZ1CogNzGK+nvfNDIOnsdTzfvAnMQoDtiSGLKVC/b
         itKOF4kUq13dTCFwxxQ7HZ1Efxrxx1BbjLWcdxSI/bzIS9q5g0fz1Ps3uLff7WJwhRSV
         DiYxsdftSfN3nVIlNfLlijxqSyaF0j8N4SCPqG/8MyuTAgtU0A8hbhpDod0mF+i2R/5j
         A3BeGq+DB4TlCVDeq82wGCNueJkh+UG7rEanGo8Z3XqnqxNT4tvZtYjGgHznf3FlWuY9
         UTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734611395; x=1735216195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o96sPO7V53sDOZUODJclDkKQUyP4WoHMQMf4eVZlo0U=;
        b=vnh4NwrY0nF9sUugmHFm8WkCrrVFINzbjNjmAL8k8VMoSaLy8WZSW4a9oNDGMrKv4e
         kuj1yxqZY6zRuTEa69Mi9JeDZ6+O15HbUNgUU2wvLEswJryn1FdXnVaqrX5jUWXm1xrP
         PhvBfJZ4EOklGPCpm0PuKy8p1UgA7MQOtg2Ov+OY0vn8wNgBSvFqAzWThkBpHeK35e5V
         pr3t0necRyff3ZKvYtpwoA1VOwf4yaIF3imbcs8F87J0CCIsLATZn4RIo0P5AtxHkCnN
         oqYFVW4+mwJqrsBE6iDQiwIghp5QCVwCjQDLBDpt5hWTjqxWrKevnbCmgo/02ZrwPUoS
         2LwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWynneO8GV4N/0DeJrUKaMnUKtDLmKAGj0JVxHiWMbCu9i71dKArc/Y1CWDFSiizClUY1QhWWR8Zq4=@lists.infradead.org
X-Gm-Message-State: AOJu0YznvlUA6enTJ632ZGZsMTQ01Vd0Vc+jxlFPaPFXaTwHO3JDswGN
	XD173iHm2hFBTT2873q2Lmtq1Frw3oApx3i8GCpk3mK0p9DXuz95WYilcGAy+OJntA==
X-Gm-Gg: ASbGnctgayNMR1OsI8EgMDTXGRvNL268Zo204NjU7uBUE0H92upDNS3BEzuHlilGx3X
	+iLZyVBKexfyj6Of0hW5uaSo4cywp0CG9rgJAveXdUT0gnbSmZKr4gkAwBW6AoJfh4zhtjHlypS
	WaE3V6TYLvo5tYDgKDnKXSu0LDRyZUayYE3xR1zDBkWFbLcxGHnWaqXZQ6Nr65fdqZr3Ih3B64d
	AtE3p6ikqXNZzh0mujJi/dRm6Ryyo+yAL6oOvPWg/ufPoskcwi2+AKkUNzpjdqbqk6QI+8c1UMS
	vF01TU1NeMtOHynhAxXnvKgwbO4SSNIx9czu5w==
X-Google-Smtp-Source: AGHT+IGxAqwJRurj7qV2vs6Z+K8eKsLh3xnBxqP11+jgUBpKe1GoKgTCEqbQPnCP4J7riXgaB4Inwg==
X-Received: by 2002:a05:6512:1254:b0:53e:1b34:fed2 with SMTP id 2adb3069b0e04-541e6745b9amr2433383e87.8.1734611394392;
        Thu, 19 Dec 2024 04:29:54 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f63f5sm158643e87.55.2024.12.19.04.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:29:53 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] misc-utils: fix integer overflow in ftl_check.c
Date: Thu, 19 Dec 2024 15:30:09 +0300
Message-Id: <20241219123009.703272-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_042956_987946_450A2DFA 
X-CRM114-Status: GOOD (  10.62  )
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
Added robust handling for malloc() failure by checking the returnvalueand providing a clear error message.

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
