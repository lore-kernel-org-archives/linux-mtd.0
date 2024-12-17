Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D86E7717F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VUdu26X6wzOWOju7HXnzbXn6Gj1Y0NsHrirhlcJBzm8=; b=vOyVFr8eop2x/M
	oz+SlrRKoKx81HunKrLsF/mvTCjCnVLDtPGRYBNlbpG8RUg+ARmv5pTcwzuYkFshWmPYP2gfaUoeG
	bvhOxxPA5DLFPaPeUy6LcM9AnUA32cJK+tmU3Qy08cATOZr6YiPcfcG4kYn+KNe/bi0P+augRg4mr
	8oeqve985TGU/IveYcVnm0hzEhCuv3sxa6Ind4LXWp46xklJ4FQq8zdltsqe+ap6Q4uR9tZa2QVge
	1BKMs5l//8yfOGpptHTCBKovPS9IdU9xkZ5BLMsTFu6qte71qkxUbWJZJzL32QGOrMunEUaI9I5fU
	obIb5q/ruywfs75izoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNY7I-0000000Df8c-0xtN;
	Tue, 17 Dec 2024 14:00:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNY76-0000000Df6D-0RKL
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 13:59:53 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so5266813e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 05:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734443990; x=1735048790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BalPjrw+SoVazsWUvN5RCJ/p48dos+L/bYXBorHovF0=;
        b=RVzJVWM8vumyMLscQyVI/SczX5pIo9W89VnSBREuU9yWNhffFq7hx3X8utX/q3agLY
         AAotRnJ4K1Q0x97Xab0zv+Pxs8sSvOIilNpPYhozHdjhy5adM/5Sv+MjDwyfuuJ3lHKz
         QIHEY8Z5ZnxWZQoiqbYv1rvjAHyFQN6cpXXb2JuiqQSKyPPLzCZnG/yy/bkmZq+rQIhf
         6IqyMcZQ6dU8Br1FWFMiAZjB8M9/iWEi2FdUJU5peN08/Qhao1Sayh9dWKnsyhCfiiTm
         my8Bi5TSGIoISsBRDy0G0PrTQ7OY11HcY0sumFPtmsxKARRs60yTMiD0KbS8uLAwmSt0
         CnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443990; x=1735048790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BalPjrw+SoVazsWUvN5RCJ/p48dos+L/bYXBorHovF0=;
        b=uVi4Pd0egH/B5HF+L5f6H8y9JszEgsXCr9siMlpTuV+fgYvLm+B+C8q4mBgtkZR48d
         xDzc08aQ/3FYThTzPhF5240R1eqm0PAxrcigQiL3FptXDX7U+Igz4MUNZvTR+7Xb5465
         gZCNyOV0w86PwVWEotA6Ee4s2OZgzs0GVnuTAbXHPWrietpyv0/eP32ZfXHElmrSOtyu
         CQm9hRWuLqcEOKIZI/pYngUt0D5+DCFIq1SoroeIuhvguscTYAkq8pOenz/zyhvIfVkj
         wXKyz+zVvy7YQivNYVjp1Q8jn04nrM2J5nk4GcKic2TNI/TgHiQaov12maw680YG61ou
         f84w==
X-Forwarded-Encrypted: i=1; AJvYcCUDp4OcJ8jLepWhTt2Gh/VfBu1FC33AmtOFMHLE/u8JVMoTlC/+I3nHf1Rwrzwn6SLzi22PtI8ZvzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzVe3b1vGx1AhtJHaPvsIg9o5MbQArnPK53tXJo/pXbUFPy6+n
	aWWriuSez276vTJd1OT7MjmFJQjB3F9Qm3NkL2labLdktJ/aLQnjLX/yKTKJWy1nDw==
X-Gm-Gg: ASbGncuz2AwUmvriFPYob5c9ihITsYe7ZKoQhjo0I/qzzQQlW7IWMidb+gDqUbeOSJJ
	BFVoTEPpgE2oGCax/hsxoC1B9prKHLi0DbRMH4v1o8u0HWJVUJIR8NOqaD/z7SoHgv7gADor25d
	aoZK6b/qF53iqAM3AH0SiOO6ba0nw9tFh2Hwjlkuel8X6/IDG1rsoW/qDMNGlGQRSZnIJ10DDLq
	ee5MkTTug3zl7NW0gE6tldqP//6aigIwVK5hSlHQxdVo9ot+KzqIf9Zy8DVoOoQ31ZCEsD5Soak
	2pPJ01bf8loUQs9G6IcbtY/MMAl0aG4jUcMNlkc=
X-Google-Smtp-Source: AGHT+IEMzTk7To/KHvehuFZSSp69SXIfWAKwHSRXr61enVvpIKn1SxRY+NzdaCrB3SykGR8TZ+kXBA==
X-Received: by 2002:a05:6512:ac7:b0:541:3192:64ec with SMTP id 2adb3069b0e04-5413192651amr896514e87.6.1734443989939;
        Tue, 17 Dec 2024 05:59:49 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c001d6sm1152504e87.126.2024.12.17.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:59:49 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: FIX DIVISION BY ZERO in ubinize.c
Date: Tue, 17 Dec 2024 17:00:06 +0300
Message-Id: <20241217140006.268082-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_055952_141137_614A602F 
X-CRM114-Status: GOOD (  13.06  )
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
Variable vi->alignment, whose possible value set allows a zero value at ubinize.c:375, is used as a denominator at ubinize.c:410.

If you look at the code more closely, it will be clear that the vi->alignment parameter is obtained from an external file passed as a command line argument.

A check was also performed if you pass a test.ini file of the following type to the input:

[jffs2-volume]
mode=ubi
image=../jffs2.img
vol_id=1
vol_size=30MiB
vol_type=dynamic
vol_name=jffs2_volume
vol_flags=autoresize
vol_alignment=0

and execute the command:

./ubinize -o ubi.img -p 16KiB -m 512 -s 256 test.ini

we will get the result:

Floating point exception (core dumped)

Corrections explained:

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 ubi-utils/ubinize.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index ac8c1e5..afffaa0 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -406,6 +406,14 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
 		}
 	}
 
+
+	/* Validate alignment to avoid division by zero */
+	if (vi->alignment <= 0) {
+		fprintf(stderr, "Error: alignment value (%d) is invalid. It must be greater than 0.\n", vi->alignment);
+		vi->alignment = 1; /* Set a safe default value */
+		fprintf(stderr, "Warning: alignment set to default value (1).\n");
+	}
+
 	/* Initialize the rest of the volume information */
 	vi->data_pad = ui->leb_size % vi->alignment;
 	vi->usable_leb_size = ui->leb_size - vi->data_pad;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
