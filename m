Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573D2CCF9F8
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 05:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2lT7fyf2KLuSimSWmC0RWrUSgzBBW9KpyU0SkYRbjI=; b=eTjQSxoWvVgsFv
	9Cj/uKk+PQC9L+VmmIiYKSP31DZNK5YFLGYU6+WftPcMkN0KQg5b0vbw/KKjcPx/q9ERR2oDq9ITx
	ijmm3pj9jj8T5b/fnaMzHGGNx0huqLUwwxvLDx0bLwga3WknPpl9d/djMNn+SIJqMo0vnRY8xdP1q
	9M1LValOfwpHP34YkDMTHWxaT8cT4i+kT/TDs2jrkcVh+quZaSz53eyz9SCWB5x9cwuTjV4AHMStv
	x9xKJMyUVAbr9X84PIcP+sVDHiwOUI2Kujx5wkKTHgtXADlgLBX01mRuje4KxxIysAGicAt2QFBIo
	h37AHxDvV2uUcZJEHsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsx2-0000000EuJB-2WcA;
	Thu, 06 Nov 2025 05:54:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsx0-0000000EuIF-0q6Y
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 05:54:27 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2951a817541so7742025ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2025 21:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762408465; x=1763013265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeNNU3zakAOXs/yWODz5gzeTeAq5p633IpP2qw5Jk7I=;
        b=dX5y9/5L6Crma3fymXJvWF5GRiL4QzaTKiPu9xhz8cNxaMdxX/gMBXLSUZBliCYy5i
         762mzTHhJXvXpoasSccrl5/cdEhhF0EQhjobyErWBmkN7ehK4Bamrv9cWypkANKO5yTx
         Pih8mVnvAa1KWEQEeXoGcBk0byUh78aI/pg+ph3gTm7eSpoHSuiuOzZgFmgb9n38R1Pi
         CboJZyQjpZTCaxFKjopNjSBaFuCwM6yVl00sktraczUvtJeT+5yV8PGtH9tE+THFWqlw
         yPtCJ5uBY+Ur2XsW3OpwgJk88AjdhJD4RzQHeT8W4oen7X81dn1gOMFMJupXTRE2x7lX
         qxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762408465; x=1763013265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeNNU3zakAOXs/yWODz5gzeTeAq5p633IpP2qw5Jk7I=;
        b=wnggzpCX09KlX1tGha8xTh/iuVtnAUePF8DwGLRiffP8n7C9Cgb7ryrlIWCohpA9+w
         Dztj7SmaXTvcD4AlpIdY69+WIfUT9Vu21+RFQlPTU//S2xfj0CAL0eEcZp4+tA7skOeu
         9lXtIfj/6LTQF0uTRP3Utl6qaR7WzeR3vwHyHX0CIqoeA/P/VO2zdRRFP4F5Q0RWWknu
         V8tVkVthxaoXhOWr2OcxnmdFKLxxJ5SLO1uKh/EFOIaiwKr5fvo/QvSC6DLZ0kwwsbVN
         duCgouQOwi8u1ygsUu0YgqcKMebDN/IsCtcDP9JagtyUIqtrRiBKJNjlU/CBq8PYIlW4
         iOrA==
X-Forwarded-Encrypted: i=1; AJvYcCVuIxOBK5chUVnCwXC9WQpEPx654JkYGqWTcoXMq6JNzITlA5rQ14sWE+rlrJ5dgcNQDYH774YAMG4=@lists.infradead.org
X-Gm-Message-State: AOJu0YysYRZf+shaxymbMjLJCQwLzcP76meZiOKoP+MS5G6J/ILYt+AJ
	DC66vOV7xQIv3/plIo4sXgPqVp0xdmK+SSfabwTMU/BB+3zYSO1rYIvY
X-Gm-Gg: ASbGncstFCgsaqum5pt15uhj40nRTQyyoGLcRC9J4S9SdJ4+Flpke4brKAGUcCG7ybX
	89EdHPI6u8HHreYPwOHweV3j5u8v7gjWncsPGVLFtJK211t3QXMcMMcgRbkhvMJQWpFAW7oIaDd
	TEqQcjOBWKryYg/gxHRaP0QRw9bianIVmWdjjLae0IB3zVtx3HSkdBNl6VPksgqUvWS+j58VNgr
	vWoVTkUTzXYvf+yNUn/DPGuGTFSBHg3+igs31TgYbE+V5e0gnQLme63hxElaJ+cmXIKzEi91MYR
	xRbkkLOkNKJ41irFFr4t/CUL02vIOAZ18tWKXDlxYx8aad0kignR4B1kMG+rfvzQFxB/+X2u1rw
	twnraTz18Hbq7FvUTSK3faWf1VyU6l3JmisQFONbRCsYSauszmLrF+OjwNytjEcn/QegPzERGIs
	2NYOuXq/Dt9xdgXXk6hd4m+Vg=
X-Google-Smtp-Source: AGHT+IH+TDqjcsT4LgnsJNDYdaPUbOW4zaulnASJiwtAFqEUZlSphmRmwHYwXI4vF3z+DMqsOeG7SQ==
X-Received: by 2002:a17:902:f550:b0:295:9db1:ff3b with SMTP id d9443c01a7336-2962ad0c562mr89323605ad.6.1762408464968;
        Wed, 05 Nov 2025 21:54:24 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cc6595sm14513195ad.98.2025.11.05.21.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 21:54:24 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 071F7802F6;
	Thu,  6 Nov 2025 13:57:21 +0800 (CST)
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
Subject: [PATCH 1/1] mtd: ubi: skip programming unused bits in ubi headers
Date: Thu,  6 Nov 2025 13:49:40 +0800
Message-Id: <20251106054940.2728641-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251106054940.2728641-1-linchengming884@gmail.com>
References: <20251106054940.2728641-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_215426_264704_B619FA2C 
X-CRM114-Status: GOOD (  12.07  )
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
 drivers/mtd/ubi/io.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index a4999bce4..c21242a14 100644
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
@@ -1150,6 +1152,11 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 		return -EROFS;
 	}
 
+	if (ubi->vid_hdr_shift)
+		memset((char *)p, 0xFF, ubi->vid_hdr_alsize - UBI_VID_HDR_SIZE);
+	else
+		memset((char *)p + UBI_VID_HDR_SIZE, 0xFF, ubi->vid_hdr_alsize - UBI_VID_HDR_SIZE);
+
 	err = ubi_io_write(ubi, p, pnum, ubi->vid_hdr_aloffset,
 			   ubi->vid_hdr_alsize);
 	return err;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
