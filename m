Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90518CDB47A
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 02:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmorceFVmShjHGjzzz53pEKmHG/aEyQLb/+YEpLb4JQ=; b=l9MGOF/r5ysLn/
	zJvMRIiw594s0yBfjDiaDSgygcNmfYTcZStNubhLC9ALutefdYf8k6ZLcHELXzrFWu32qyBD94dcO
	YWxp25us/8/Cfg6rQx5yRQMTAnzAfeR9p2TQl/RGh5Wq4kMq/nkyJVkXO+xUxZLdagyziPEN2LdV/
	0W6S4AKr7cIwD4oH/za5dk9D0pTKcov0qE3uEauX+DeDMT+eEORMiDeXPaaIENhVhmQ69BnAJlfxJ
	nREYCWZi78IoPVJVBdC4CDSGYR3JFQINwc1qoCWFLrU/LciS73lfTp1Shq2QvcCD41aBX1q3+gHxN
	vk1u7FizAavfrDxXlA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjsj-0000000BR1U-2bqN;
	Fri, 14 Nov 2025 02:49:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjsf-0000000BR0b-0lA1
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 02:49:46 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-343f35d0f99so967138a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2025 18:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763088584; x=1763693384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D9Z7Z5u/cgpb/w/GR7Wd+ItF+Fj8eOwQSf05yxiiOA=;
        b=CCaELUbjFTmJWdicjcmoBgXr9oiN98OjOPjSQZLCIUW95JlyEEtkwxW2j/TL2hgC7I
         mpDAveTi1754Xj2F74sNoHmQ44qBraBiZWwF/YjpZ9OuaHDW4I4spzZ7ZT6wOXBBvuBJ
         mza5v2yLj1KS68WTzj/UWUHz3fA/H4rw0ucZiailUKa1LG9wb2fUNEEEmvkYOEO5X5Uv
         XhXBor79/2fgauKDxY0ps6atl0EJ+Dyq4bfBxQpFr7sEe7RzMU2k2oss6U0odH3ZRY8l
         sBtC2TnhggrgypfCG6WHjneAWy1MLu4/845QxsvWEgZWyu5G6I+SYiCDplViNghEDR60
         LFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763088584; x=1763693384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5D9Z7Z5u/cgpb/w/GR7Wd+ItF+Fj8eOwQSf05yxiiOA=;
        b=ohG93e5EwTo8baX1EMipndoW2B+4l5WeaLEvTvW7EZcisapQGXthUYF6OkZ0PFecw8
         3LMKtaJcoTGdwSmJToHoRMaxMSG2yZuqa2Fp3JnHzbAe8Ilo6AfKr1DhwIyKT0Z+T6Rq
         FaTfreJaexq8BwG2Qn5fxdl3vNHJqFrXvsUDlVRcCWJPBErXgIciLZG/B9d8xB1BMzBj
         EPp9hU1Yf3khD2h9BfzjRubz6DzJ17jWNoP+ZsQPkQ6PE6gSYTEk+uP/0GeK0DnS4BO3
         JTHsYOMTYcY4STGrDea6s34pX+aKIA6z3fojtWfW79dDJ8T8SmPEATKaIV4ogGJ7P4ad
         2w3A==
X-Forwarded-Encrypted: i=1; AJvYcCXXL01oghawxvQKxAmRQdP3m+yBTp1fX/r1YzaPqtlSfEDgsbq1AvFtR6ZTANMHumzvPB6JyjxmlAw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwQS80597Z5Bv8Fn1v13r7uYlEJAjh3MmJWqZUcBXN3A8PUHkV
	wWXjquTrMmXgxnjfmu1Wg0QxKtt7Ry5P+mI1R/yquissg3r26i091RGk
X-Gm-Gg: ASbGncvej3qwluFWsM+XOgALzvRvJ8/VRsIj1O+Ngl3ERzLxnl9Wc+5xaP2fMXRtN+h
	RoBe/kEy5h3ikqpnqdxKGBlVzVd8fxndhvOJWNDIofZtqsER6yrC+hjYZa3E0IxqxBGA+RsaAYM
	RIaAT4GVfMbSgiRskWVAcZAuyhttraiInv7uGeZ1PhD+DQtbF0ocRPLJHBDuTSf6xKGyNNkNqsx
	Y14w4bYJT6W5feT6IpnwyxFlyvxnLAUorxWJHfmmo5yNkWavO/eNjeiFCfH1lNviGu/bcJfyXyP
	H3XgeVczMNEQnk5Jj88gC4E7vhlC6cqsbcngfHHxCg0+ru0i7cw84TYDxEKqKZ88mmxruyz+b/O
	UV46CLi/HrnOGB5HHCfyd/umPlroA+XccI0rVcfhGDMUgcHc8L54/eQ9xt3n+XL5V2N+nCfo3zB
	RRNizrr+PTOo2le1Oo1gkDQ7FRhmpa5yxY/g==
X-Google-Smtp-Source: AGHT+IHLZ4Y11EjkEnPFEjZxGWu0dFKQkEZR5WZECy49z7o4E+nToMqB2eeJNfh0z3SWnTW5ruWgHg==
X-Received: by 2002:a17:90b:17cc:b0:33b:bf8d:6172 with SMTP id 98e67ed59e1d1-343fa74be0amr1536731a91.34.1763088583893;
        Thu, 13 Nov 2025 18:49:43 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37818885fsm3306517a12.38.2025.11.13.18.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 18:49:43 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id DD759801D4;
	Fri, 14 Nov 2025 10:52:26 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/1] mtd: ubi: skip programming unused bits in ubi headers
Date: Fri, 14 Nov 2025 10:44:52 +0800
Message-Id: <20251114024452.2927429-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114024452.2927429-1-linchengming884@gmail.com>
References: <20251114024452.2927429-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_184945_233767_36E57840 
X-CRM114-Status: GOOD (  11.65  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch prevents unnecessary programming of bits in ec_hdr and
vid_hdr that are not used or read during normal UBI operation. These
unused bits are typcially already set to 1 in erased flash and do not
need to be explicitly programmed to 0 if they are not used.

Programming such unused areas offers no functional benefit and may
result in unnecessary flash wear, reducing the overall lifetime of the
device. By skipping these writes, we preserve the flash state as much as
possible and minimize wear caused by redundant operations.

This change ensures that only necessary fields are written when preparing
UBI headers, improving flash efficiency without affecting functionality.

Additionally, the Kioxia TC58NVG1S3HTA00 datasheet (page 63) also notes
that continuous program/erase cycling with a high percentage of '0' bits
in the data pattern can accelerate block endurance degradation.
This further supports avoiding large 0x00 patterns.

Link: https://europe.kioxia.com/content/dam/kioxia/newidr/productinfo/datasheet/201910/DST_TC58NVG1S3HTA00-TDE_EN_31442.pdf

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/ubi/io.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index a4999bce4..dfb9c27c0 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -868,6 +868,8 @@ int ubi_io_write_ec_hdr(struct ubi_device *ubi, int pnum,
 		return -EROFS;
 	}
 
+	memset((char *)ec_hdr + UBI_EC_HDR_SIZE, 0xFF, ubi->ec_hdr_alsize - UBI_EC_HDR_SIZE);
+
 	err = ubi_io_write(ubi, ec_hdr, pnum, 0, ubi->ec_hdr_alsize);
 	return err;
 }
@@ -1150,6 +1152,14 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 		return -EROFS;
 	}
 
+	if (ubi->vid_hdr_shift) {
+		memset((char *)p, 0xFF, ubi->vid_hdr_shift);
+		memset((char *)p + ubi->vid_hdr_shift + UBI_VID_HDR_SIZE, 0xFF,
+		       ubi->vid_hdr_alsize - (ubi->vid_hdr_shift + UBI_VID_HDR_SIZE));
+	} else {
+		memset((char *)p + UBI_VID_HDR_SIZE, 0xFF, ubi->vid_hdr_alsize - UBI_VID_HDR_SIZE);
+	}
+
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			   ubi->vid_hdr_alsize);
 	return err;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
