Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BDBD1712A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0y1SSHINeXuo6yue6G56+3sRHqWyw9hcDNXdsdql4A=; b=RZDv6pB8dkZr3O
	px/NAmRy+anGiuBvZ3xsgyYz++62uaJDDwnby6H980VQ8/s/rbgkbgzzsZus1ScoHkxPKR+V3ul8F
	/lTlfIoYJqc/2pEQUCDd0aN4ZuHkQF7+pPv4M/Fx/Z2Bl0oTaUgr+WSjqf0jR8TdP7W4f3MSAzMxl
	ukR9Sl1qzoZeIWDeKiIvkdRn9X4b94FsT7r6Y9qAAx+JZS5xL7UteSYEfYxDlp7/k5JotDFcFa7iW
	wSPAADalGEpgsnLTb+pd1IiOAk1HIaDHOTVckoN/acWCAvJi4x7YQRqLK3KGYGpqha4o8eD2sXqL4
	38LqRHWNYESXYJKH90ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2y0R-00000008Qw4-285f;
	Mon, 21 Oct 2024 19:23:55 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2y0O-00000008Qve-1F2s
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 19:23:54 +0000
Received: by mail-qk1-x742.google.com with SMTP id af79cd13be357-7b152a23e9aso343060085a.0
        for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2024 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729538630; x=1730143430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=azVhWkTON+FdUuDJCnDalFMyRq2c73guXW73oN1dCx0=;
        b=Xx4tOc0V+X3u8GmUSflFGPSadtg6+Gn3JdnIbnxAZ76yonoei4ALu6VrxMLvqpSUTW
         q5Vd+qTQv+YS6bDFXVa4rWvgFHTzVyb46USMIYgdcOwD1476EUNZdZH525j9/XYBZB3L
         w0u9yGjGc5Dbw2AU1L1blM4T4IiW7OeCzXGW2aFtRzXQGsKxwb2ySQgCEKTypfjnNNdB
         H+1SYP9zBUY4pz3ggUEFcP4kA30ag0IRjh4xlPQtAmi8yQWL0Xfd59blGRO7GPSAuGE7
         uH6EedrhGLPmnB5L7QFO7ECemc8SA5aUBU/lpGCHUKgk5vrrwHWN2dBYtdbwAMtO/RyK
         14hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729538630; x=1730143430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azVhWkTON+FdUuDJCnDalFMyRq2c73guXW73oN1dCx0=;
        b=MZamHwlymu1METl8advvwRv77QxkYy6LOK0k9d01U6GJKca60xazmU5jRgeciH2MsO
         P8JTSB2KukkxD0eCxpx+Bf0DYbrojaAE3KR7MnIZFgTWc2fWWBf+Bs3ad67UBT7V0RiR
         yguekF7ofQNwTihVrDHU4tvBIpWs6HOcQYiVbM5uEw2XiE169u6SOYZhHbbLQIU0zICv
         v20sfIbO4g4Hxi04VZOj0sEO9aRB7GUuraGDVoZgtXqdOtAibLHnUwqH7WAcy0r586hk
         0++7OCtFd3v2HBINr0NiY5fZvVoVNXvxPrkhGOx6QbY4UlBzqeyXyNRAFMDEsPJ0faaO
         Lm1g==
X-Gm-Message-State: AOJu0YyoPsZgYDBgxppiH/C7G4+Y81/ieLTo2UQxvQn3TT7/5vipAGWF
	PEhoVyE+U0I09Ekt5ywjBmt28+w6Jwgqn3nDLwpvh9g/OS/uFevD
X-Google-Smtp-Source: AGHT+IHTBbdtVJZZwu0aMRlGkayDW6F+51357edYWImqBkE88LYI/eeseiGS/kQxnTdw1BpjY8HMJA==
X-Received: by 2002:a05:6214:5890:b0:6cb:7ce7:c093 with SMTP id 6a1803df08f44-6cde15d02bfmr153911576d6.37.1729538630036;
        Mon, 21 Oct 2024 12:23:50 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce0091aae1sm20512716d6.71.2024.10.21.12.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 12:23:49 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	dinghao.liu@zju.edu.cn,
	arnd@arndb.de,
	scott.bauer@intel.com,
	kbusch@kernel.org,
	heinzm@redhat.com,
	snitzer@redhat.com
Cc: linux-mtd@lists.infradead.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] mtd: diskonchip: Cast an operand to uint64_t to prevent potential uint32_t overflow in inftl_partscan()
Date: Mon, 21 Oct 2024 14:23:21 -0500
Message-Id: <20241021192320.8464-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_122352_363945_C80AF1FB 
X-CRM114-Status: GOOD (  11.83  )
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

From: Zichen Xie <zichenxie0106@gmail.com>

This was found by a static analyzer.
There may be a potential integer overflow issue in
inftl_partscan(). parts[0].size is defined as "uint64_t"
while mtd->erasesize and ip->firstUnit are defined as 32-bit
unsigned integer. The result of the calculation will be limited
to 32 bits without correct casting.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: 18a5bf270532 ("dm: add unstriped target")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 8db7fc424571..70d6c2250f32 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1098,7 +1098,7 @@ static inline int __init inftl_partscan(struct mtd_info *mtd, struct mtd_partiti
 		    (i == 0) && (ip->firstUnit > 0)) {
 			parts[0].name = " DiskOnChip IPL / Media Header partition";
 			parts[0].offset = 0;
-			parts[0].size = mtd->erasesize * ip->firstUnit;
+			parts[0].size = (uint64_t)mtd->erasesize * ip->firstUnit;
 			numparts = 1;
 		}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
