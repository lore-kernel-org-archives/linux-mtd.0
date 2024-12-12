Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43188E7717F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2024 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mBJojk6VCBEDKLkIEUiJz2O/twiW4pD+VPr4YA41PPg=; b=IXVPj9Akg13myp
	pyD1lpXcPXvawX0LvL1Hwx2tGGSO1G1aFcuD995MnKS9MhzWfAVw8983HMUM0eRtgbzShahnbg8w6
	lUVMyjcACgxbZNAA+tGaXSCJhSNLkLLTqu8U3tlIUX3MgmQ6bm6Jb/rekjRD8qQ8+AqYv+jMSoRcB
	NNViXMQjxRufFAL963yQqfT+uWJ1szyX+IdCU9QFUm4qUn/zX9RBfIlbQQh+ezlb3Fi/2INY/9wml
	cKmrxESV4pbxub7UVqyj9AmIOe/hoOc412fy0TSeXRAuTQ6YQEVfYj8H0IVy1aZZ7ALZxOLUtCS58
	57pWNreGNsq2E0JrGnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLn7R-00000001DEs-06AU;
	Thu, 12 Dec 2024 17:36:57 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLml3-000000018T6-1ujT
	for linux-mtd@lists.infradead.org;
	Thu, 12 Dec 2024 17:13:50 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-540215984f0so937078e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2024 09:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734023627; x=1734628427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9BcecuYcmDSHCbSRIk014IUFsWGwdT9TWUaQI0m9W8=;
        b=L1znop6q+Y3SCVz3dcojjXrlnVlZTQoDbNQQTJsk/4L6K0fqzPQpTeSdZCs0ES9h11
         cp9XWYVvMU9fR2MT7QJ6xz/EZ4Pue6bZ/JdLE9sIOWVB45lEYUjb97r+waxRfQNBnR6X
         R2/5siLcJZvcNsdV7O5V7PQfNcEno7VOuWhLuAYxJ08mbDns8wwtFB7sCFqisPEhDb8P
         ttuu2Tf6hCt9FeGzVjMmc2lwRaIAdH3Y3alA4XrsHY3KVDzhBnMYrDfIxAV1P7D7PpMK
         J2V6WRPx6OYTuJZ5Yf+EyWhptrTfZx7ipr5oTi8LEzNgmm+rcFvZ3/neh+5XL13Wz9oS
         ngtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023627; x=1734628427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9BcecuYcmDSHCbSRIk014IUFsWGwdT9TWUaQI0m9W8=;
        b=aJD9MPkKRZdNEQPFOpfNBXMzOwDIqxZS5eMT3cMcJ25aLrdqQVUezCtCGIMS3zMbYd
         6LLgkt/BqR15KVTtM/X7sqlGYjBzkwslcwXctWmPIsJc0r3v+meIykg1NiicKBjfBfXC
         LBU8I6A6GNfB9q+rEY50GRggjpeU1V0xxfPWBCOp3wDWjHeVbdScVVL/J3HVILqtI1xD
         f44ct7Uiif9YSHbYqKNJ2G9kKElhPqNGhwGmRz6PEIdk+SMgkyFWEru8U8HiZueWZzip
         qdUCxm0GE4kdgR16jPeB8AJnPKFV3t0fDVlVfJoEYN1iQS+0JOWLAeIqXcWbOIgM6m9g
         S7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZWDbYNCpkvL5zsa/6I5+nNIho6vXpczYLJfoDDA+X2VxPnc/hdZUpTenmbbBQReWDBQ0sTHP1TZM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyfuywZa9fvBuHlGOAtPbGI4aY6XOtFoSEj/uWYcACHyBTkxkrZ
	LwiBUjXYfyUz9vxsnFbK+xQp5XLnV1dA7VYowEQwx28fSIt9xcCTRpDcLtl0hkkdPA==
X-Gm-Gg: ASbGncsjx0HJkj7W01h8NmLOqDmr7yuUyzGmymQ8QYxvAEQPHubATPyNYcr3VOnt/om
	SnJQYkxCMcX2UXkIiXFJP70W25BQWdtSnPqMsAp5PASl8cKa8fBw3o1AhyNOfSOtKfySuBTsV9N
	6kZuPGdkh9e1kd3LV3SbzFO43AejB8zTcGTWKCroi/cmoKTKGbfG7ORaWwSV+elHjW9KGOtq84e
	72qEYTKuDHgOhbhkCns2v+83mJYxgbL7w1sjkcsBgi6eoa/FGEebFvMg0MpGpmuPvnTluH7qmqq
	U00mtOLz/sZIcx8pbhzW7kZ0jUpPO3Q4Eva/Jdk=
X-Google-Smtp-Source: AGHT+IFe57dzqm2B2fQae7C23VJXQyiCVTxRmzOsygghXynlxZ0dAH97nSBMbmIoZne+5IkM/WpPkg==
X-Received: by 2002:a05:6512:220f:b0:53e:3988:f682 with SMTP id 2adb3069b0e04-54034106350mr638915e87.18.1734023626553;
        Thu, 12 Dec 2024 09:13:46 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ef509c093sm1756664e87.112.2024.12.12.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:13:45 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
Date: Thu, 12 Dec 2024 20:13:58 +0300
Message-Id: <20241212171358.53333-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_091349_490644_AF8A1AD2 
X-CRM114-Status: GOOD (  11.53  )
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
The value of an arithmetic expression 'reginfo->offset + i * reginfo->erasesize' is a subject to overflow 
because its operands are not cast to a larger data type before performing arithmetic

Corrections explained:
Added casting reginfo->offset to long long

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 ubi-utils/mtdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 7dff0de..850297b 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -203,7 +203,7 @@ static void print_region_map(const struct mtd_dev_info *mtd, int fd,
 		ret_locked = ret_bad = errno_locked = errno_bad = 0;
 
 	for (i = 0; i < reginfo->numblocks; ++i) {
-		start = reginfo->offset + i * reginfo->erasesize;
+		start = (long long)reginfo->offset + i * reginfo->erasesize;
 		printf(" %*i: %08lx ", width, i, start);
 
 		if (ret_locked != -1) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
