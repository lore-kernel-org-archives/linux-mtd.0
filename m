Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B421C369AB
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Apr 2025 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=unMMy3Rl5Iuzv1CenFV+Vm2AuF5GxEztWMIEcdim8Zg=; b=SRtnhjNdWZk9rq
	k3GRMvUEW3K7W+SWp5r98bRYBSdFoK9POsx97k2Gtf5CABtZaz6S7pY/a5KWd0pVtUX4h52hJXtPJ
	xEpvQ/fjOntOAdum6AsQB3eGEJl6RM7Nba7V0UObI5tbOeMDOX2DKtnX6lzr58MMTghdiRSSe9kmu
	H4EP4sgYtNqPRA6t0yZts6+ZhZ5eZ041g4gncCMWmdiMlKXeFYeop4YHy9T0C9i1Pksi9LvgXSJZ/
	cb/LppZaX2ReFVyX6wX3keW5l5v4pvD2NxQqT2qdJDLvZRKibdJbTlz9NqvfW2pZqtsY2Jk6Tautb
	4BvL1zDxv7mOX+7Dew0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Aa-0000000Ezhs-1Kyq;
	Thu, 24 Apr 2025 18:19:32 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81AW-0000000EzgR-1lo5
	for linux-mtd@lists.infradead.org;
	Thu, 24 Apr 2025 18:19:30 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1664890e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Apr 2025 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745518766; x=1746123566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5B5kIwGVzkLius8rkeKAr83FZivIqzOs6nI34vNLelo=;
        b=hjiMLYdniEwbASCNKSZ271Yq4OD6RUWq/IHZligCfiIMc4Wyga8TKJuIu+q0BIPMyi
         WgoOqMIeCN3dCpum2JZ8VPuG8wDvOQOrG2zGYPk4nVo+J9FvtPJfqQ8tJ76QxhVXXGKk
         VsAOVgummG1fZue2spE+WR6Uzozh62Tzo3CTLOSHdOsO7JrpzGz72rzTsx2fgYckNMJ1
         DoVP7BOAT7EDApJCVeckxfMQ2uaw8HpOeAIPzLSq5odg0ZuvfH5BYB7e11lfZMVYUnux
         t8agnj8o0DRewKDDFmieUDnn/cUP30jmghx+yP0SnxgNromQosXvd4Rjh5Gqc8RiTyCW
         2Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518766; x=1746123566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B5kIwGVzkLius8rkeKAr83FZivIqzOs6nI34vNLelo=;
        b=V+Hkz1X3KRtRen2Ks4AqsG66HzWlwtSa2kCYNl75UNHCYKPCQVrFaB/3/93rhBtyjX
         DAZNxJ4FlUe4vlrcjxUHVPc2tY0NoKLi4ZZedr1Z/EMJjWRdKx4WFra4aq4IeoBT1GBz
         s/VoS0a1IfgeJQas1DZZ0YrwNmS0QXwpF+N+ztfSoFANh+b1jAJpINgfy6wjT/QfE9fz
         LeFX/twrjRVHWotOBbXbVChmvGFvQi2LLfs+kdoZWPb5tsKTBx7KsL8Bs/waGhuo17Mw
         rrA3Kx9MInNwY5N7/0LzFjPw1eczcD03l6DqAYAMICNxR5HqSKeBSEOcWGBbStspOxCO
         QmpQ==
X-Gm-Message-State: AOJu0YxM2wU+Mns8K/FUhrNRhFkZpKe9MX0bStKXhv0EfxmHm/3Kle7C
	LuMg4x8kvH4ZDTBDWrgA6J2E8gVXeZFtIjYYmS6imYWWzIv80GU6yJ4N0BhX
X-Gm-Gg: ASbGncu647SO0W2UCxrBPVrIdEp3DUsccVS1JYxPZRy8MUzm+DfkuFmhpcc38axIXXa
	AVfDM9GjakDZBEnPiTJHa4+Tgj3rGHtihnJ0eAyPHFij05DdsmSFcG1g2H4jx5J0AobOJjfZJds
	7gc7DN3uIpW+8dNJmfApyPVaMmLOvuKtGilWu5fFSbl+BoBWq5DX24Ern6Xz3NJcAv+zH/dBXBk
	hycPSrB+DVomrf3tzrdR8qoyFMiQx4r8lpsqptMrnJna4nVoMExqkjq3oK/Ou7TqcSA0nj8k08v
	rgj8OOjYYVFlHFt1RMB8Ux8Ml5vLF6/3maujyH7fQP4cdhTkvJ6o5w3/yGX8XoZNbxTEUzhSsBZ
	HofABN76s
X-Google-Smtp-Source: AGHT+IEjeP3+TXiidDIKHuY9X7atCTjn/xITmvX9wjVWl3Lk9JbsDwrvYbOyy1qD0GwdJm2MUJ1cDg==
X-Received: by 2002:a2e:a9a9:0:b0:2ff:d0c4:5ffe with SMTP id 38308e7fff4ca-3179e6e5d70mr15177891fa.16.1745518765448;
        Thu, 24 Apr 2025 11:19:25 -0700 (PDT)
Received: from anton-desktop.. (109-252-120-31.nat.spd-mgts.ru. [109.252.120.31])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cce729d7sm3661191fa.0.2025.04.24.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:19:24 -0700 (PDT)
From: ant.v.moryakov@gmail.com
To: linux-mtd@lists.infradead.org
Cc: AntonMoryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] ubifs-utils: common: fix memory leak in devtable.c
Date: Thu, 24 Apr 2025 21:19:22 +0300
Message-Id: <20250424181922.17531-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_111928_493359_93CBAE68 
X-CRM114-Status: UNSURE (   7.84  )
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

From: AntonMoryakov <ant.v.moryakov@gmail.com>

Report of the static analyzer:
Dynamic memory, referenced by 'line', is allocated at devtable.c:356 
by calling function 'getline' and lost at devtable.c:388. 
(line: while (getline(&line, &len, f) != -1) {)

Correct explained:
Now line is freed in any exit scenario via out_close which eliminates this error.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.co

---
 ubifs-utils/common/devtable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/common/devtable.c b/ubifs-utils/common/devtable.c
index 7347f09..2e581ff 100644
--- a/ubifs-utils/common/devtable.c
+++ b/ubifs-utils/common/devtable.c
@@ -392,6 +392,7 @@ int parse_devtable(const char *tbl_file)
 
 out_close:
 	fclose(f);
+	free(line);
 	free_devtable_info();
 	return -1;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
