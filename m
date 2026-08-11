Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4791DC5AD7B
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbXE/BgUlgKdxJRNbK1M6UzHRRni+jAVHiZjr2o0AB4=; b=kA31gjlqr9g1oG
	0qPfqVSNqcUmjxQTbv3GBbX9rUGDkhbxwRqvb5r8azBGQkND21cpVIrJlP8lR19PKmpLDAOl8XUAC
	gE/iBlpuFPgDgI8+b+iRFT0+P77GvhAyYgrib2Jd+88bL8LQq0Tx7o7M6dNCa0Uh6fcyZKU93VYPR
	g1a2b5eMG8xwOXAEYRcSxZz4oEUjUc4lhE7QSGQGiVEwuSfIWI8Df3pM2dISGHjNKKtc0xf1k9V5L
	pbMz5fYtp0kZz7CorvcVJB0ETNrCiylaYyn+YYeC1PKqc4iadru9HjTBfn/P3eEU19GkTOAenCZ6J
	ujTVmNcQUmI4zlgjC9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYy-0000000DMRA-15G9;
	Tue, 11 Aug 2026 06:02:12 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYv-0000000DMPq-2W03
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:10 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6aea94f96c4so1516181eaf.2
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428129; x=1787032929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvW+vlkykLKhHUV+ggRmJqGjwZhBqy5a9qXoHb1/+wE=;
        b=OcPl5cz+f4Xf6TvX7i0c+PRxnc/Sk35TiDRTziT2/j2yDq50JycaaqqtPDg9PmvswF
         6CV3SFhYZ2wngKQOMzyEL9+92JMgQ5Tenmtj+/O7QGcCicDxmNKcjJfUzNX2BP7Xl0mt
         /7MTgla5/JSG9pOePF9H9cLv4GguE5sTDx4DY0TeQxzaUy0mKruFipnZj0R7EdgkOh1M
         bguuJoEwptzT5/0R90CO3wTtaMe81kIOPV2m38YzeIotK6wDk+OGahdyzRuHrHWiglm6
         4j8gUXdocU8ddSwfV2AaPlpVp2jhi7mM7ST5Orjz/oThapBXRxsyPxePUXXHiboSH7Gj
         ZY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428129; x=1787032929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvW+vlkykLKhHUV+ggRmJqGjwZhBqy5a9qXoHb1/+wE=;
        b=m1jii2brjaub9DsNKfwLOccv0qv52jqB4NGHcf0LGsxpl51Qh4qQf5JGnIhv0ok4TR
         CGzG55IeoOcoZCgZ1ePd1GCTiSzLD128tqL5hyoeOxQRVbl2b8DopI7MTaUBVbmDFF4b
         rngbfRlvfbA/ksCykDiedsMFsAQY+H6mGh40ouOSmF4R6GGxQHs7haiJDVUG257sEpa1
         Uy5kmxxOmxIKJwdLsffoPk8ux7zld7CYsqk0Yqt5zqMyBwdcYXLvwSUD4/6rMrHqzRpK
         GT4tJRbfpIX7zhZfHXelrfBgi9lvLKzxZaf5p3DNM5XRyyW5qFECOs07UqOQKqVS0fhE
         9Fhg==
X-Gm-Message-State: AOJu0Yyv+COXoNmYiMOKcDY6gonjF4xNIIJSDxLYZKCuyakyZ7tTdnrA
	Ti3tU+3Hs2k0JRN6pm6D628kgaXuuVZ+3wGIWTCDq9gFW0npkdq3+NYCxOQ/ug==
X-Gm-Gg: AR+sD12ScGaSNcVKO+mf8CJXp1NvV7l03Km+39uRVEELQZyvuX1Uqe54fWIeSZjoOac
	SKByghKXd+WykK9uU7l9IWYsr5NJ9wGMYlpZQEvYX6xh/oy92PZv3XySoIKd1vUJEGitWXfUmq4
	sDznFmpQmUq1erMXAyv/4wZzoHc4Gy9ZO4JNYDHeHMsENMrLwykiD9bo4BVoR/o5WnSwoZILYZ0
	ymvjK7KLHZwwxv2It7sDOf9PBnIhNSLKnCnjWu0d57o35EaSMD0kSRhtGNbjwURCwYpgwlUuMC7
	/2SlWdwkOQdhM8osr7kbpaB/rHGIoq4fZI2Qm0tuz3gcdrKmD5+IAYolLS9aBwxvGjbr2wtpS0m
	1oYHHk4BgVU4h+bocSZXFpEqviM+3v8TYlX16wYdsb5N2l07qayUY/n3uyEJK7WrhaI0v4HlLMz
	kdqEO5TC8AH0VGnaUDBC83YIEoCkkRQd5ZURjPpbjXH66fR5ceFIqWCiG/fjiNLZA3etznWmdTN
	Tqq8cEx7fcDe8d0FtElMecIYz2lXr+pmHgf1HrFu/IaAvzy87s73sO1vrNwVdrsbb98NDD7FwhK
	jBDZBuZKxoDSoc2vmQLmfDgVMiao3ZGrswzWziuYlI+etQCJz1JGNXpdus7nJowIMffHB4thMAb
	bjOO6uH9rIGJbm1ZUVuKvt9sZ1G4=
X-Received: by 2002:a05:6820:2015:b0:6b0:4d2c:1bf1 with SMTP id 006d021491bc7-6b0a2ff070amr388872eaf.11.1786428128806;
        Mon, 10 Aug 2026 23:02:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:01:59 -0600
Subject: [PATCH 1/3] mtd: rawnand: sunxi: propagate user-data allocation
 errors
MIME-Version: 1.0
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-1-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230209_646633_4401DC8F 
X-CRM114-Status: GOOD (  13.87  )
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

sunxi_nfc_maximize_user_data() returns -ENOMEM when its per-step
length array cannot be allocated, but the caller ignores that error.
The NULL array then makes sunxi_nfc_user_data_sz() report the fixed
four-byte fallback, which is not the layout that the variable-length
setup calculated.

Return the setup error so an allocation failure cannot silently select
and validate a different OOB layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..108161fe10cb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2072,6 +2072,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	int total_user_data_sz = 0;
 	int nsectors;
 	int ecc_mode;
+	int ret;
 	int i;
 
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
@@ -2169,9 +2170,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	 * The rationale for variable data length is to prioritize maximum ECC
 	 * strength, and then use the remaining space for user data.
 	 */
-	if (nfc->caps->reg_user_data_len)
-		sunxi_nfc_maximize_user_data(nand, mtd->oobsize, ecc->bytes,
-					     nsectors);
+	if (nfc->caps->reg_user_data_len) {
+		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
+						   ecc->bytes, nsectors);
+		if (ret)
+			return ret;
+	}
 
 	if (total_user_data_sz == 0)
 		for (i = 0; i < nsectors; i++)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
