Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6FECAC59A
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Sep 2025 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G5kgyCw3jCRv+akibYUHSMD7iawGtcuiZ1/usvWFKv8=; b=YYRTXaFV3s37nt
	p0XklFmaEcPwpBRbqr1ogwXYjYtyGvHWHFFyTqqIu9e8qkrc49FHvFgdMgNt1M2zNvHVQsM8i79yV
	4kzabyOc3AMmmTemKKFCJPqmCBqLIpoXY+2zYm5V4kOvaCE8XAmW9A+4ZcJ8+aIEKOLIquK+apgIM
	1C91xhABxqzgYMrpNRq9mLBhZCuf3C5S2qCK/QJqqmuBiP+qttiZofj+38pZxSdsgW/tM5nTiAEkD
	nWATDq0oOc1Otq6FAvv9RNUWOpeNgD3lR8VtlJI15ZaFyg4U/P29iYa1g2Dl/LOq0NI+jKG3KLsvg
	rd1rIArS2WPu+NYaZs9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJcM-00000000tF3-4AnQ;
	Thu, 18 Sep 2025 18:44:30 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJcL-00000000tEV-1P9t
	for linux-mtd@lists.infradead.org;
	Thu, 18 Sep 2025 18:44:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7761b83fd01so1355896b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 18 Sep 2025 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758221068; x=1758825868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8zgmbahM1VfgP+dW3KRwovtdnR9tCk8bO4aKfh2zws=;
        b=UMI5pxrOroAh+JBraAP9ZK1X18twFTE62ntGOMSAH7AhqB1S6uu/c3I95p9a7L6yLH
         G7uZci//6adb0jdoDsuVgMyMgAdUl1HS5pQDNkUS5eYkTSARKS1ppM8oEX108YJg3XiH
         c30WAMma70nmdeJODQi9iG0nMbKZ/QF5cjXQiPUbRHCaSaw71fwA6RBVacLZjOsPckn5
         vWJWVSn/zeyMY44Ci0mHE5P9+DIIGtTEUV2IVD9MxGmDu1dYRaM3IdNuOnK46Id2TOXs
         Jf+tC/kftdjW25v0bdUf5WGXUHMLLEV79X3qvBnh6rVjGw8jT+ZnYTHtSK4rrATNG94F
         kkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758221068; x=1758825868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8zgmbahM1VfgP+dW3KRwovtdnR9tCk8bO4aKfh2zws=;
        b=CAz1vgYszDICwGEMI5XPbG2pfo5iy51f0ANMrpu+wzCpTDDjUdC8PNQJ+C+q76OThD
         VIpnvsE+s4NAJ2hFWFKqZ+H5R3NvmLfg6YrqBlrdzEuYW0DJi8wKa0fIy0AtDn6IPZ1p
         g4azlTAsjdDfQEp5Qg/gxmsMegYfcBixOb5ITz8fN/vjIFeosmuO8XdSO2cyxYOHGfZY
         rBMFpLoWYFByNS+U1UUpV1wgJono4U36D6S35OO/DjSPoDFsnNaAIlZnzJFU6MJ3hJD0
         v/VdYKZ/MvtZg1W8YDmPhp74MhorDD1jAVpVwzbxM1KiFBIoRJM53qp/aO5ZC6fuVNfo
         tXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUTYEvE/eJ1PXJAyAA3OnrbdzYZNca6N91j8SJue4xis5JRd/Q+PFNpncQT06VtT823gvpAhnFM4eg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZVk/SOj1A5VZNiOXa77ZVwDGGd4yzOxqLKpe2sJAJ96v7XWPQ
	83lr6m89QQv4adFcBys1jjMqsXwXuK3afTlNua/mMkXSwNryDc9B6WLe
X-Gm-Gg: ASbGnctOPDMqi6Ds3xYrKSY4wv4xrkDgLf07rV+/Oxhba9E/HnrCrBcFBNWSyKhxL62
	KIPpZkDhWgyGZ7F6zukbVkddNQxinV3Pen7/wTZubgRZ5BhqBJYb0LtezKYsbHb+JPGTDlURBVF
	wYO3vTyumYb8OCjmqdBH2XcdRZTlCBNniXUPj5Rf4gZllpOFsik17bzEgX4QBIu+QeACWSWn8ZA
	PWGPXvTEPmSo9pswba97hbqGISUA1n5c5Prsmi3EvxlcF+OJp9+cY+kEOwJNelPFyuzXC6rUHBw
	uM/c//LTThGnR9gByvjHS6otSAb0VltTjIEgTDiPhUO865wlMzOMTOBG/T0JhEujq9hVpcgPY4+
	BT6iDatwiYb9xLgGnZMzlTNwc23YaUFpijViYodGxs60Ov1dTXtQ/a04bJLaw
X-Google-Smtp-Source: AGHT+IES0nh3YJZduE+bzFAmjo4n9/IGmSy36TfhXM3u3Sd6MomrUkG0ZxjN3Mi9LkDFwohHkOZtBQ==
X-Received: by 2002:a05:6a20:3d1c:b0:245:ffe1:5609 with SMTP id adf61e73a8af0-29270503242mr768026637.44.1758221068102;
        Thu, 18 Sep 2025 11:44:28 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cff22bdb5sm3051926b3a.94.2025.09.18.11.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 11:44:27 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] mtd: cfi: use struct_size() helper for cfiq allocation
Date: Fri, 19 Sep 2025 00:14:14 +0530
Message-ID: <20250918184420.76047-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_114429_377425_CCF37072 
X-CRM114-Status: GOOD (  11.10  )
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

Documentation/process/deprecated.rst recommends against performing
dynamic size calculations in the arguments of memory allocator
function due to the risk of overflow. Such calculations can
wrap around and result in a smaller allocation than what the caller
was expecting.

Replace the size calculation in cfiq allocation with struct_size()
helper to make the code clearer and handle the overflows correctly.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 drivers/mtd/chips/cfi_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index a04b6174181c..e254f9cd2796 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -208,7 +208,7 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	if (!num_erase_regions)
 		return 0;
 
-	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	cfi->cfiq = kmalloc(struct_size(cfi->cfiq, EraseRegionInfo, num_erase_regions), GFP_KERNEL);
 	if (!cfi->cfiq)
 		return 0;
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
