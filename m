Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9729BC5DF74
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 02:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYMlLDKnspUzx5MZ5sImNw2tFFekj5WYx1o8NBsuC+M=; b=zcSj3n+KDsVHT5
	GD9ckYRSPR205NgDdZnTN0QOilC9z/RugYrvr6LWBtqJ92ny96dlxHA9IhBGnjuzy1IWJK9azW/zD
	YekX81Iw6PbhgN4oNHjpZszEX2AEiHV33fXstjBiAx/WPsEwoRymOmNGiSDSkXEjBxiXT299ndVrb
	2csDJ/9ITaFX0jsSyqWbhoKliT+Y/hgxuzN/YZsnSkEUaF+MtAIHUKraCRijEECCkFWPErhm52ZqY
	Z19Rklv2mUPueWaFG6CUl5KrIZHyutDZ+8/gkY1MoIfUZkJLdx21ryiZYBAPn90gidjMUkcl4ykl3
	67Jp8bCLvLd77mud0vuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9HR-000000075ID-3u0G;
	Tue, 18 Aug 2026 02:10:21 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9HN-000000075H3-1Tnl
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 02:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1787019015;
	bh=R7ClDPED5fZAM18u5fygTm93ZxEhU7uCx11V791hrQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EORos9mrakUPaNFszQxJ4bjPi+bBtBukE8p4IwP5/GXIUyuo/H4QAn/9J/j3HMRK8
	 f+emRH04+5kfsO9HFo52CkqL9Lf7pl2Y1uDiHbYSLP6mGmtsF+OnvS7Ppb+s9kvdVs
	 1Mjzhtb1ED9Pd+U/2YUoM2sOBOL0/BeZFXr35MNuPbZWRpcV68lIaWAekgPLEenf4G
	 MG+w0caMw2xI3FwmOtpRuXy4k8mPRkn/vh/tTHWDN0pdS7V+kZm0SAY5iBoXXWS4nh
	 beSTTJ6MvbeEtVp//3WVldKn+XamX+TOgi9WDvABiQi5Lw5GpfXmHhnjbc3m5cZC8C
	 TlNcKusDrWjLw==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id F1B461F0
	for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 11:10:15 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=ZBh5VC8Y;
	dkim-atps=neutral
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 582538CC
	for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 11:10:14 +0900 (JST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so7679266a91.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2026 19:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1787019013; x=1787623813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blAtEYI9MivA6nQmBBbGkLtbWjRSXRisfP4s1nyOg10=;
        b=ZBh5VC8YxR1OJ6QiJUX7F0XRtUkh8Q2YhMEmO2ehz0g7z1Az9xOlSBZTkug6T3VzvL
         +7VCfjWnB2bi+61D2CAXypdIHBe1Pb4v5YEkt0103yRYwPk0lOBEcI7PUUQ+WL3/BPVI
         iptTlY8gXm4NZCndnLKnEo+Sw9CsCc6i8eFfs6Tjv8S4F74g37LHgLgUdEbZYHD3giGm
         u8Ci/F/LYJOz7uOoEwD6t44t4n3NsKZ8hImsePPSjskc1lBsNmNaF2g0CSpsq32JiMTQ
         ZxZX7YGcJHNG5CzvTwQZEW90Jk9b23GS1cpQFTazEc6FWOnbm2f7dMaRZYTOWdUMrJRT
         OB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787019013; x=1787623813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blAtEYI9MivA6nQmBBbGkLtbWjRSXRisfP4s1nyOg10=;
        b=CLryYNTE81C3H0uO95CtsmHnGFK4800IyjqthX0tMTYeKysGuednHrvwFbqc1Uptdi
         4slNnYn4ErPnuQtTwKVu2Ow47k6+DaNEaZTzDsku73bRBkZL2tu5QjyrsuGvydioze/J
         NF4Ot4G+gcbLsYmZzTcIsEdZLT5rp/mmfK5/32Ylm10L5lwbazqG6LwuT0W9HKSb1gli
         DiAWBzou6d77SycZb4ZeIIGoGLmnUAPYQSmqsP/zSoYdvo6i8R9Upmgrk4/tOOnnic8/
         +fEp0IhkF/wy9fRO2m5uOfrhRQGQ1SCRjcacNmMtEUoIMmCdttD9pQaFV46EQTAGZWxh
         lLGg==
X-Forwarded-Encrypted: i=1; AHgh+RotWH4uqO0TiDBPpaKuYiAhx4qBLEJltxIDQYQZ1ATtFU9b1n7nQoTbJYh05GKnRtJCtBhvTFuBvl8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9wmYG9CiNk3AnXFAkF00iaRCeop9cO23Ko8p+lDLQyI/b2lHD
	3wHuj3pX/s3dG/JM9CIbf0vfTwl8/mO6DehDOrzUgpP8H1hNbY60+xy8hknUCydVbnSYjEvB0oK
	OhdCP14522E12qCImzWqerf39UpS60EMnTfFbtF6g5UVSKjAV/CpO0F6vvG4aeTiuzk+T
X-Gm-Gg: AR+sD120/iSkKcGJSeybNhAYZcPnSNnr9TbacfLca/0BCB7ljjFLJ4YKOUJeClmG7NL
	SBtwWL648qSt3mG2TG/httH5RyHy01zPTPdQpDeAJ7kgtbtvKOg7mVNbqpwvcjtOXAYBHbxyZ/+
	ojEGdd6wu227/1oFL1BuYpkgMAvDkVRs8FpgJ1ZiNgDkAR8SLv46RJpIOUuwUIHCO9BmKNu0+Kd
	2SN55kj4vzPDddj42rwgj5myqkIHWo70OsqLEQqpItBl6PD9y+/QKyuAG/Iuf1seCNk9EeEtzAM
	ZcmnTTil0Rzho9qrrsr+pMvfIcMmJ5rSkh4Z3PKPbu3q9G7J0xTwxbWi1n4q0RdsvyQzqxJhzAW
	KYt/z5SYz0lLWOJZzy+ZMPQiWTH2fsIM/A8Eeu0tcjbUybPeJ
X-Received: by 2002:a17:90b:58e5:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-3933caf3a05mr31691935a91.7.1787019013228;
        Mon, 17 Aug 2026 19:10:13 -0700 (PDT)
X-Received: by 2002:a17:90b:58e5:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-3933caf3a05mr31691826a91.7.1787019012676;
        Mon, 17 Aug 2026 19:10:12 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3954d3b40basm4255804a91.14.2026.08.17.19.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:10:12 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Tue, 18 Aug 2026 02:09:34 +0000
Subject: [PATCH v6.12.y 1/2] mtd: ubi: skip programming unused bits in ubi
 headers
MIME-Version: 1.0
Message-Id: <20260818-ubi-backports-v1-1-324d6816d2ae@atmark-techno.com>
References: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
In-Reply-To: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
To: stable@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>
X-Mailer: b4 0.16-dev-a9e92
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=HJvhoiOjIe9nNu2RlsGRExOAzZRI5eQ3mmYZZFbmpC8=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBqg78Aze2trKQWuMUsy+egLC2N65QMVPDv0JLYk
 Ku9l/EaYquJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCaoO/AAAKCRDyimB/1oxx
 B1SBD/4+WmZjfcNBAm4smlV1jtTsrwmhFLvWXUO0TYKQTEwOdlAls43b8TSVhWWqbwsTN27Mwsr
 5HTdMQr7k6W/vYMfFiEzFCxszmPK5bRGyn8gEC2VMImlF7d3pjUpzKZLJ/bvN9uAuAz/uynL8z1
 VcwpI+KZ2GTzqLy7kjDC3+FtOr78VOoUTYK3yl7yG9Hw+fcFekgkvNLWWVdDnY1rf+21WC1brbB
 Gg/rqSXUCEHHd7nZDLyjxL+P8Nalm3tPJJ58PzJc8S2CyRa9r1RUV0ZYHxutbgPTW51bQpEmJHl
 du7ezOT+PY06mqj5x5POXbH7qUNDnm8yAG6Fjw49o+uSU5Hs6x0XeHa+8fgbVz9iuajLRv6A7l9
 F3BgnEVx8OQIxQrNASwajS70HbJsMvtQP2WgeZtpH/Zw6ECyDsfUyNG+Z3S8TlJGGI/rzsYFuPa
 Xb4NFnmptcFRuhDonOJtyT+cDHKO5Dbvu6I7l4i24JWvImNhpf+LSR9fqPAoiZn83Bs9aFT58vl
 cgiXJg3M7CtdlRKTv4ZpZ/n2FDhCuNuR8JZgcq8NN13MIbxo3kuoFfuNKyuYct7qcASoi5xH/vX
 EJsU+NXr/a2kF0a0pBhDKi2F9DIerkcM8MH6II3I3esuHLzlqrhWuKNyO2bLaUyb4ZhrIsp4G/y
 3aOh2DJqpbhhZXA==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_191017_627206_8DD4D806 
X-CRM114-Status: GOOD (  14.07  )
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
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
(cherry picked from commit 77530d1a78ca5c274e37d6494a965223672630b2)
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/mtd/ubi/io.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index a4999bce435f..915eb64cb001 100644
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
2.55.0.dirty



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
