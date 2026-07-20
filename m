Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7ECC44515
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/75elj4QtQ2VFWUlHNTU6CRMmM2Z37JJYF6lVB+bxw=; b=HJnfdB26kSjXFK
	UjkD5/iSuFoS2ZLrcEX4j6k2B9ABSh/dGS2aaUJkaWHzP8i/F6PB05n2CfEGuOGrNtTkk1ZTcXER3
	tEp/GDU8PLBtSX0T2sKPpbUO1Tz/mnatHLY/EnlRwZMgqZSvfArYKmfbnhCIksE4kVZ3p4Rp/gSQa
	OFhC/TFiQmxJ92Rbn3rJohK7ljv3P7k7yT5uDxm2TYQAswQsHZp1m3UmFteAEdWiuKSXQTLKY0ndH
	O75okJb9oxZLfzjg5oKH2MUndG0g7YJanI/dctuS2UQOSwA6LPy7qS44WAJhZNy9hsIdPMFAu+1+Z
	WD4/MBk7YT0v2FsKpI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlok6-00000006vns-0Gcw;
	Mon, 20 Jul 2026 14:13:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlok3-00000006vmO-46QC
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 14:13:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2caea3f742bso122053135ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2026 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784556791; x=1785161591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b8XF7nrzvK9JY0N2y+Fglwp5PAhvkeA4CdEStxZj/5I=;
        b=ShfrAtY8yK/hjQ4OUnkSsNGpyzzw7vxm0DFJoAMT0EodpJREjbeKhjc/qrWuqQeNc5
         yEy3czrVGnH2KN94o1IBv7Hguai11WGvNabngTSDYP8lDpSs3P/uuzPtawg9LD2gvBcw
         x18zVVxPMu3lgCZQEn+C0Wz6S7iwW4MSFi5LAuqqatKubBqtl91uMbL0FFKwfEAdbmKa
         dzZTuVnBgZKJbRs2LMKCLWjselVLuXH85zuUfqjVyAwWBHT0vH8h4iEjb3rZTR1E65ZJ
         nCcwTmPKwzYksT3QM0NhXHdoYG9to+vdYRT+EajvKsoFvmvhzaByPMQH+0WgBkoazFpA
         G95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556791; x=1785161591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8XF7nrzvK9JY0N2y+Fglwp5PAhvkeA4CdEStxZj/5I=;
        b=ra4poI/lSh4DUj+fiqXBe8Jyw85Ev/LN02e4as8NMd9aRAHlioAuU59zWwqOLCrR8o
         Xnga3QSOn9vyLU+sxv7N/IQP0qQYkbF0yplFmGXRV+rx+V45nIuy0xnJ8K1uTDEz0pNS
         PBtki13SzBcGuoNVSbszrFVzIef1StuGwtu9JTa11NvBkgzzSFqkFSJRIocrWZjHzHG2
         t1HLdRiCQlrQb7kx//IoasHpqeCML+j0hWu7IfD2y+fzLmLIl0mNMeaetuyY2cv9uY9V
         3Jy7cMABor5w2j854I2SPWuKyRsFVvCGRYz/PlaKHcCVRb2/IKyDaLXN7887Xts6e4pM
         hHsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZUfJK8CGX/Gqyqgyy7ZcnfRPNYa4DJB0AAPF8Qs7jCCErzYl+CH5nbphtXhVktckD9HdDtZpLkDI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9KQSKWM49EP07eIDTe6SfUGf8tJU6srYnHgYXAdbLBfMwJVuE
	SytY4cc538Q7HCYA+BnDOd9BnvZbU+JfJSwQIjzcTZXlgOj43bvVshpv
X-Gm-Gg: AR+sD13+cySbcA+xWuTRjv6A6fO1FwvQz3DjgJSVKfXUlmWM06vm9XIjKIrshzPVApl
	0mkOvkrtzozAdu3YTOZT22XQAM/qys/VDVKfV817G/fHnQBmIAPpzukWE2RNZPnADoJiHp3bXET
	AFG1SHNSDE9WunzIoLcgOhIE2VnLkzB/5cL/xDBKjmrHMAobMKQufBom6E7VG0bI2+GOBGrdp+0
	XKZTm4UrywzlRTHcRMye7p6iCEBGc2GYV1QO3N/rzcm7v5usPqv0/HDiKOI+7BwYiD7KRGBV5iT
	2qJPRN0BsCR8rzEChDIuy9MFmdEiMVheScg0FgCzqEDg4IXStTRL1LhojduK8rdRGoTRPjmVV0E
	IRnIc8h0dskcPbA9tEWoRFkj0NSGbqHxzcwIThnn4IH7x5ereNjryt1oYhpV1uRxrXrFfNnGmfD
	mlNbfbvOTszkgGwDJmxCdKN1k3cILPRwAyY1SjZw/Q6y88ePi6RlFfAvZDMHLJHiDq7uM=
X-Received: by 2002:a17:902:cecd:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2cf34a4c9d7mr151190115ad.40.1784556790807;
        Mon, 20 Jul 2026 07:13:10 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf34730e35sm57578155ad.64.2026.07.20.07.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:13:10 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	tudor.ambarus@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: takahiro.kuwano@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: sfdp: check the length of the SCCR map
Date: Mon, 20 Jul 2026 23:11:04 +0900
Message-ID: <20260720141104.2054417-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720141104.2054417-1-sammiee5311@gmail.com>
References: <20260720141104.2054417-1-sammiee5311@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_071312_018003_28C90413 
X-CRM114-Status: GOOD (  13.48  )
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

The spi_nor_parse_sccr() sizes its buffer from the table length the
flash reports in the SFDP parameter header. But it then reads DWORD1
and DWORD22 without ever checking the table is that long.

So if a flash reports a length of one, the buffer is only four bytes
while DWORD22 sits at byte offset 84. With a length of zero kmalloc()
returns ZERO_SIZE_PTR rather than an error, so the NULL check doesn't
catch it and the first read dereferences it.

To fix this, reject a table that's too short for the highest DWORD the
parser reads, the way spi_nor_parse_4bait() already does. The table is
optional, so this isn't fatal. The spi_nor_parse_sfdp() warns and
carries on.

The spi_nor_parse_sccr_mc() doesn't need the same check. It works out
the number of dice from the length it allocated with, so its highest
index stays inside the buffer.

Fixes: 7ab8b810757a ("mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index ece8bbd4bc47..98559536d41b 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1266,6 +1266,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 }
 
 #define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE		BIT(31)
+#define SFDP_SCCR_DWORD_MIN				22
 
 /**
  * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
@@ -1284,6 +1285,9 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 	size_t len;
 	int ret;
 
+	if (sccr_header->length < SFDP_SCCR_DWORD_MIN)
+		return -EINVAL;
+
 	len = sccr_header->length * sizeof(*dwords);
 	dwords = kmalloc(len, GFP_KERNEL);
 	if (!dwords)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
