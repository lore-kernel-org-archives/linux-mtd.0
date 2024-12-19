Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AF2E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o/7hcc08H7WhtiaDMaBhsMj2rwGjwE/7U6jZeRXxGBk=; b=t5qaUYiYQTSrSp
	u429l09XUXHFC30DTBCFaCYV3lbi9bSkCuSwJaTa/B9BktZhvLeKC9Fa2W4ZCe6XNf/DMVMxCiKQY
	GnsWreX/v3j1BVDjrxe6rQ7BpHCtVbWBN/jLQ+B85FNoSxcfYcFshqfz54ReJmhXCBZuWxZ0icjtb
	E5sGQxBjSf7vjcpd2BZhCeliX0JH/TKrmgASYf6RJhPfEfQfrv9eGa+500rffNnifRRYs8OLmBo5z
	ggU34NfuB/9jbTTP2kllgTCZBkfKjjt/jfWlAi0TNgC4EueO7uaKrOTHS5N6SguEM8h2oQ2/jCKPL
	XAai6YTb8FPpjKjaYFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGvS-00000001zgb-2MQx;
	Thu, 19 Dec 2024 13:50:50 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGvQ-00000001zg9-44Az
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 13:50:50 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3022598e213so8927621fa.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 05:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734616247; x=1735221047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cceao9boJ8KHq53KkU9dHrscV2Tyyc9k4zFaGkhImbo=;
        b=YPy5aDNQN3nMMQpMgviLac2ygjpPQarS8w30gILvHiULOqWp7gGXDrIrAc4JSciYEU
         70mYn6/fZPy8IhL/QrU6yBdLdjAVNK/suVkHSDPqcV7O9CSEGP5yijxahe3a2ldInfpO
         312iRp3VyuA8KEcnq14qAm/WFSYow7Z6brhHtphI9qnfiVieZ/rntv+zaoWIlzhkimuI
         7OdU/DeDwiibFN1SkSms/cmJtOorC0MAgyg8PtZp+vY+75eIXzCIoSLN84CRAf8RaR5L
         fNdcuorhTHDzLcyu2tqompvbB0xpT1v7lfstGebCFlUWnuInM6CYLzC8iXH/+h8vfQqB
         vVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734616247; x=1735221047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cceao9boJ8KHq53KkU9dHrscV2Tyyc9k4zFaGkhImbo=;
        b=Xi3jAwlH2lbWmd3VvdOMJP3meWTP+L2G/bpzC3n+/x99J9zAHD9M/mUJFbwavF41Hf
         /KlrFtLwOQhMg48yQ2ARGUOT/rhYPKIQxhw644GtEjHJCRRa5YTyznMOVuz/Jqlu7eK2
         Do0zw3SaJz8hleq96PBS8HdOOMnV1qPbtIieE1OH7gLgEqJeaHHwbrIrCPNRattdPKcd
         5mWKooF1kE1Dnv6uBFGVTo5eCtQBHDeqgKKifkCJ7gHUKyirFHErHbBvR4bLniEHXvgh
         f4DOPHmE+BY2kQapLi8agBCMnfgQWJUEaxNlgP1ZO0it2G4m9q++TB4QMvkvcRXxdV/v
         bvWw==
X-Forwarded-Encrypted: i=1; AJvYcCW29F7Nx37xCsxMb+X6gTNO/J98E0WLxTTX+JmiubUG9H4meuxOFPrTCq8g0Kq9yWLMXUxgTo4JxZ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUzYdOcV8u5WLAUH51KNSeEwFxMpYPsZjW4qqqgHhTsC4C+cL+
	pXBaEnkHdTh6WLNEIepVjdU9Vi0Po+6ijB2lcCs9+taKqjFC/GlKeq2imK0oKjfOGA==
X-Gm-Gg: ASbGncsFRGN/xGB5AGYYHnPNtKI+SRR2w19WMxxc+Gx+mVdTDh3r42SceU6/soXAMKb
	7AgWl/EAJkkh7DectGPAL2R5hJdimMfyzxj7M9aZgXsrJZDKHbbS3/2AE2xl8DiJFCGH0Erq/DI
	7y6V4zKVFsiH+JzAUNSZs4bMZufjj7L++cN1DnR1nh221ESyfU2FgNNdLnlomYnBgSD9mJ4KMxv
	EihZl5DxVHA1xzE4Jp5OVgReg5hrIL8zQOhXD8UyILfrF/0MlG/uHr5VnDcUKooW/WKmXru7q6U
	s4d2txQdscQbgDeXAPa8H88u5sidJZQWXjhZeQ==
X-Google-Smtp-Source: AGHT+IHyp4KmSvJ/d0MbHOgcWpwDhAzin4rpj8IoWtDyvO8izQ4a2mOPbMFk78822L0gcn0Qxid4NA==
X-Received: by 2002:a2e:8e86:0:b0:300:27fd:a7cd with SMTP id 38308e7fff4ca-304577ac234mr10842551fa.19.1734616246683;
        Thu, 19 Dec 2024 05:50:46 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bdbfsm2249521fa.45.2024.12.19.05.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 05:50:46 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] misc-utils: add missing error handling for 'bam' allocation in ftl_check.c
Date: Thu, 19 Dec 2024 16:51:03 +0300
Message-Id: <20241219135103.712032-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_055049_011595_4D09B272 
X-CRM114-Status: GOOD (  10.36  )
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
