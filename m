Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F271C2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 20:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LVwEmWJ4g1HOePXUT2JPvoMfsn0sXBdzaFd11Vnkm38=; b=vT/GmmyWjWH7hx
	T2trmPZrV2FEX6hhDU7zILNnUAUQBy4frJoy/UA5lTd4vVJilhDR3zqmsB7ZHQUI3xL1R9r1oXw3Z
	yGyysnt6/uCZj3i0oKXVc3UEBaZkE7WHqDyOVrqtPbvqpPpWoE3Q5wpmv1jVPcx7AtSA/D9osXBht
	tfYyViorfhk92J0Hn0Nd1VZITT4/xyIyp7B3NUsodkYKjxEHeP9iJjizBXFNB9MoJ6o3WrqahNTWu
	mBKPJSBUs5o/O8ZWuxZOZoSISEs7tICEPtEGe7UgLwVv/K8BglppRdRukUX/KbfcpRp/tJPvUOnYd
	xBnEJc7QOfVSq6guG5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRS1-00000008jff-3EOD;
	Fri, 07 Aug 2026 20:45:57 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsRRz-00000008jfM-28Yr
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 20:45:56 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so21469796d6.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2026 13:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786135553; x=1786740353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7/TzG19dQMDabhaRtUh/yPQ9FO/UIWoBDpgtREKn1g=;
        b=nk6J3Im8m+fjMFUhbBcz+Vx+DyoFRRQ0xuAxy/zQ2/QRNQl1YkqAA9QlUzNLcY42zv
         xB305sGf2lmCAsBL7xIMsSRdhRlLoFsHBJ+RfQB7pl9zgbO4B7Cs8ckxWUc5fp/MN9pN
         j1dLWFQIp6w/LfjSLuNt/NKULm5NJfQZyOYAfK9Ay4lm9zBx6LwddYgtUmuRejxwVRck
         eSet6fSD7kyliRn+njaOC43XXfntOOKOIZ+IQ4A+vAN3KD20vJ2OO894YNV8Y7fR3LNP
         fXxtj3/JY9hgEJiww+tfzUsrFptLIPEZRPjZCc1l7+qjRsY2CpTy/VIWd/VifQ/IbN5E
         5k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786135553; x=1786740353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7/TzG19dQMDabhaRtUh/yPQ9FO/UIWoBDpgtREKn1g=;
        b=MVBdeJDupzsT2zgjnAdK+ZBJ+//MaffCGiCTCuO8OTPxn3ySaupHaYk2ZHQyvxQyOR
         uLf1GySBs64eRAxeqAOU+g7M3aHppzvrh/8LdeleqiMiXtYh7I7BW/287RsWTT2sn5/s
         dJiWfWTiQHvDEm8DKEsUFspzeMyVpXScmSMe7uVDfPwB80KYfszUw9RB2AJpuchS2OQh
         aJexrN/djV4Ug54/iyYO0paMinGcyaBNHu+0eRNrlkLoKBhGMG3IwtE2I0PaA7VdWktv
         9XEyYaA4xL6wB6YvwAcFFOd4D3GL/I58l7dEcLtQCNECBTo3PNf/oXLVXBhAF8V3E4Sq
         cvbQ==
X-Forwarded-Encrypted: i=1; AHgh+RqycT4vOtDcBAN8BpTsxwwzjUK8EXbmjwUMxOEZc2pwbNH3uPSp5Rm6TRE6ZFBYA3/SZfKwLnj7y/U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yynx1h/I3zPkxkCUD4yZHaI7iXsdiV3shsYVhD4USXL63yV/MAE
	CXpi6+050Hh8ZZ1qQmAOU2nshaVwFE70ml7e8XkFymATDZpOwde4NJbM
X-Gm-Gg: AR+sD139HDIy3vLCo0AGIDZJDV5B0cssnq8VL5IvgAJ9+myWlanBaiW3t+igNL8i6Tm
	u4AZQOzYnTEfHJN6ZWZlz93ngcuBSmeL4HQEX9cbnLAsfjDKkQCacQd6x4tdD+ReaHW+5rdhHDB
	GkidHKhLXLYr9iWS09zjAud3vF3GxaTo3etqxC9l86FXGeYuipgR4CKkzO1EVFMeLKQ1ElOTymD
	q1JWL2ybWmi5QwZTooY9RTDS4VBnz+RhWRplqWcXYfGqbxKStvFX0WHK9vw24kzNSxflvYAGpB4
	vijH9JJoDXJwq1FF0kPUZzfJzs8yxBsgVTUCZFBlXCE5WLsjhfsKkX4GeYOmBQ5fiskB07Eb+44
	96AzsxiYQ06cB5QEWusJBk1TH8TGHgDSmZmojQdHovzVPZIOQDoc+xmYGosmVLojcIdDU3zLF/x
	njYdA71GGIqstUxP9u4V9xhmWs6f4Fu5VYUuYu/DAsTJdVwfJFzCh3RF7f5LsBz5DNK8n+GWBrI
	7KeIsLhSckPrT+4ujhjsbyAxsYx8i+dfTSw2vb33dRs6SSpNkZ8utTeQFvwlsEA5WsfaSaqpg==
X-Received: by 2002:a05:6214:f2e:b0:8a0:d08c:a720 with SMTP id 6a1803df08f44-90a34675d70mr38903586d6.17.1786135553553;
        Fri, 07 Aug 2026 13:45:53 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a918ecbesm16865366d6.9.2026.08.07.13.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:45:52 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] mtd: ubi: Release device reference on busy detach
Date: Fri,  7 Aug 2026 16:45:50 -0400
Message-ID: <20260807204550.1016755-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_134555_550860_AB27E526 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

ubi_detach_mtd_dev() obtains a device reference through ubi_get_device()
before checking whether the UBI device is busy. The busy return path drops
ubi->ref_count but leaves the device reference held, so the device object
cannot be released after a later detach.

Drop the device reference before returning -EBUSY.

Fixes: 7e84c961b2eb ("mtd: ubi: introduce pre-removal notification for UBI volumes")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/mtd/ubi/build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 674ad87809df..ee6ce4471b25 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1105,6 +1105,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	ubi->ref_count -= 1;
 	if (ubi->ref_count) {
 		if (!anyway) {
+			put_device(&ubi->dev);
 			spin_unlock(&ubi_devices_lock);
 			return -EBUSY;
 		}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
