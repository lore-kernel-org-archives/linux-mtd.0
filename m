Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B845E7717F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2024 19:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eHTtJOJ+tqOmcQhXS6bJQwgaR9I1zh+HqN6IUK1fmgg=; b=GTeni1n0uZNos+
	mP2Y13TQXNtObfN4tsEf5yjvCoe+qsC3q1oOXHIANYUi3JhFTyRzoN4UHi8Uo3UML//1lbc6Py6aS
	1RQr/C6y3gbrpi5b+GPM/ZH8YYBxZ444z4S68iamB1812I87yT6b3y2gWsz0jY61CXOXQ7nK3wVyR
	2MYFoHeH+l1bX9vcMsRWpP9CnMQYFZ1UI9O8p4E4hiBHQNINe3wX/PQMP0L+8X5e1s21hoPPpCcV3
	ti9aVHq23vdSAy+k6yHzmq56UiBzcktXtRObcT+gALY6iBwhVaQT//k9spUFUSpi6/mCgKgywFpBc
	ypC/c7eDZ4fHiopjMofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLoin-00000001bkC-1ZO9;
	Thu, 12 Dec 2024 19:19:37 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo5m-00000001Si3-2dfH
	for linux-mtd@lists.infradead.org;
	Thu, 12 Dec 2024 18:39:19 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-540215984f0so1024339e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2024 10:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734028756; x=1734633556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rc7SKuFCmbe5vhW6+bkyOtDoOBUCqhadja26WCpHm7E=;
        b=My8EkbRi0b5ytmIMM9gbEafdPseGHAJKIG80PTIgK/zrc4Oi0pkes/IQXWY1fOK6Ph
         udgCQGXGBpN3cmR4mn36Np3vRCsZsKO52J905Fau6vbTsRbwES3tMpmRnVlqgdPO3FCs
         FSikcAlvPQH3KMu/AFjaRny/QgtQkNJFiZy5Ns66FEBaI3mKiEdiEbVNHQe+0vMr6gck
         oz9bKUtqU6aA8lBUK6f43x9OwiGM/7WlW9Xt8pZM3iU9JWXQJLdYz9AinPCKd2Ao4BH0
         5QBWdq4z0diiGHZIyKAmxfx31701GY6xL62wecUoSgXRT/zjSlrtrChLS+FkbGJgxN80
         LEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028756; x=1734633556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc7SKuFCmbe5vhW6+bkyOtDoOBUCqhadja26WCpHm7E=;
        b=Wfr6bOSRDcVYCpyvx/wJU5YZToEE6kzIjlDdAXDNZhNrrhHJ+m5cx7w6En1KgaK5yU
         FNqwfz6yJStp+rfMLI4ohhWxF3OGL2oobaeRE/U9Zc9Brom2ISqWw7UTmyIBWz2g9bhJ
         icQWNH+rql7ojU8KxcM6K2fj2l9jrrxAIp+euyYI4lK9rxIla7Bwhgj/e6QBtqvX3mTE
         yLdtF3tSfH1/XR47tKRj45qBxgnVaQu7//aa6JTWratO0yuX322X1EhKvDHSQTKZ7OUh
         BRrkRm72Gz84Hi3RtDLXHnzpulPta2CSVsPyATTwhO7AJGKjf70uaj0NLGtCS5wh594n
         nThg==
X-Forwarded-Encrypted: i=1; AJvYcCWqBEpLyqAQJpJjm0WoA9B4M5YgtSp3u46ScE1t0t3jjXhEEpCEzB7SEUI+pehtjJXWZwhzu7Mpa34=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuyzpHIe2KlnnFpwmnSTYSOnFqB+Du2tI1Z+rDLSwW/lTejc3O
	n5WJR8q/2gAJs1+HwaRyPr8uM/ngAzowyjq69fKsTTltayWq9ndv
X-Gm-Gg: ASbGncu+1IVtaQ+ltS2Jc3LIUTFSkAKQite9dr59O/yIlBqwL314nRj/A8MxEXhLw5D
	812muNXTk0RzKB1Gned6TzIfApBoahp9fTazjg4KqY6uuS0CgrwYmGIYyHFleAiqoVMJ4p0mrLj
	lgOWHEaouXzmgbdqyimRTULejrHSw9yuPE0tPhgCEWrOPTpFceQ4IJxZ3J5xC/5gCZx1lGes/X1
	YmvnXnsvbX7/rpqGk43tJI+1NvRGOL9ZdPNNd8O9vLCYUWXaTgY62Dl4z92tfa9ivKCqemEelzh
	5OF/VYzILl4c8hvN+/T7FO2Zv0z+tVnfumygQbA=
X-Google-Smtp-Source: AGHT+IE/fK15SvK7chrAJ4h34jCC9hfhKw/1O8b5R8QZRdqc7fZXsculhi3XJexR11uN9Q5oKSB64w==
X-Received: by 2002:a05:6512:2393:b0:53d:a3a7:fe84 with SMTP id 2adb3069b0e04-54034100277mr685739e87.8.1734028756132;
        Thu, 12 Dec 2024 10:39:16 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401d13aefasm1465728e87.140.2024.12.12.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:39:15 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] nand-utils:  Fix integer overflow in nandflipbits.c
Date: Thu, 12 Dec 2024 21:39:28 +0300
Message-Id: <20241212183928.75259-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_103918_666503_BA334FA3 
X-CRM114-Status: GOOD (  10.07  )
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
The value of an arithmetic expression 'bit_to_flip->block * mtd.eb_size + blkoffs' is a subject to overflow because its operands are not cast to a larger data type before performing arith$

Corrections explained:
Prevent arithmetic overflow in OOB read operation
Resolved an issue where the calculation of the offset in the OOB read operation could overflow due to operands not being cast to a larger data type. Specifically, the multiplication of bi$

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 nand-utils/nandflipbits.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nand-utils/nandflipbits.c b/nand-utils/nandflipbits.c
index 7066408..ef663c6 100644
--- a/nand-utils/nandflipbits.c
+++ b/nand-utils/nandflipbits.c
@@ -251,7 +251,7 @@ int main(int argc, char **argv)
 			bufoffs += mtd.min_io_size;
 
 			ret = mtd_read_oob(mtd_desc, &mtd, fd,
-					   bit_to_flip->block * mtd.eb_size +
+					   (long long)bit_to_flip->block * (long long)mtd.eb_size +
 					   blkoffs,
 					   mtd.oob_size, buffer + bufoffs);
 			if (ret) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
