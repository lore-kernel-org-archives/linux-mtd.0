Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D445CC79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 22:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ynhDEl1HMV/abW8HrD1evuDefN32q6dyKyZyo9wYxs=; b=WNza7SJkJhiVKx
	cydYDtm59QfVbQzGmazv1V6qSe5weNHsT5jLY/6DsGxU0qrc8RAzl3LYsiscUiiNYFQ8hQUWc8TEs
	1/Qvrahs20yLjKkkNQQqQNKJokP6raARZl+4PL9SLhiAqoHs8nvIZCAyhUgr+eNu/QGN9uXQD/5bN
	NPn4H5pnCRftkFDGmQ822hNHrWLJwROcmvAs+8CNyEFxINq6b5DToN4f3gYYckvok1eEKMVqFPpHO
	GX5pq1f7TztIpwqPgVjbDBFb/ysv/+yU+l7WRadmPu+v02sE2f7cwzVejtxYu+6taRaZL6Pamkj9g
	AyETEzAvIc4I0lGYbSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cEY-00000003NYC-1U1e;
	Fri, 04 Sep 2026 22:18:06 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cEV-00000003NXF-3Vg5
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 22:18:05 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4b38ea4c63aso1373428b6e.1
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788560282; x=1789165082; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=WU9KgRjGvRGrMVKBV1FggAmPT7Zi5nkBfnPbxBz8VvsFxvdUAVwmsBYZKJpRkPWm96
         IhgJwg1uvP3nAe3wEqjfVAmdlG6lHFczKB5efA2KqB96K5TkxbXfReKQwMNSdMrHoHuw
         vSUhpXydcMYPGCn+SOs9teW1+HNPR7F19jdWWkGEuG5TfD8ehN7QqZDYcC84Kd/DDlya
         O2/D+PCADiIDieNxmbw83x3fphGLrneNSKg4ZD18VfJYPXBigrXeH5brUd41CyrpfBcA
         5pQmxIAaSoH6drPo6ajNgwsGJb9EQMRQVi+UC6pnPHfLowD62e7XJnleIDpnro0KKnMJ
         RoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560282; x=1789165082;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=DCm4qsL5oERbADqcrvThqvUXbasR21mn7Z5L0AodyWCjm7rPUWzpiMJfJ55G5+HJSc
         lODmrGUjKzmZEkAEQTTeaiXK5EQsqMpKG4pK+24fpNu7RPM0zoMQyWSgo8QRrELyHWWR
         6/E8yWSHNP/mtbnzEj6rIEU7QBEiDy70oAjZ5pKsD5aNhQeio7afsSOuXY2wsFmAZA/O
         DWIoZxK3mYxPx/6bJwOU74bz5m821k3ahK5Yd6M8hS7P9ZTyLB8GIpcbJOr5SUsWCpNr
         j9ZTpOm48yMkBll9C3ZaGBCeVRgs+/G9nJEpf/IwTfTelX2J0KOPAoIbGx9T6m8Mab4j
         wrYQ==
X-Gm-Message-State: AFuF++m+Xerjei0Q75TVHEkX8nzqZ40txo+fspYlQXUSslkHgSKn67Ak
	gWlnBB8I9gh8QsnuJUvvhuC+Dqlt8nVq70/752mctJZq4/ASTIOBPeL+
X-Gm-Gg: AYBFou2KpH6BluuaT5Hh9L8UstZps8xH/s24LuLEIP+gDsEKt9jDgJSEqqI0MVrBWf2
	+W6uPShknnTW65GeIlpg90mFJsAHRyj1jYAdF+5XK1Y9474xnd9mQxGLRY9/VSPnt1uU1S1TAB1
	SeFLXIs0OgbxJu/jvK+Bwi//Hn1Pn5MypGXr20QrrXetRfTOL+1z2nSQH+3nwkQx3Dv89auroun
	St40ezSHm7ycescX0ZaCz1TENiLwJ3gGppxYW7zK1iDCz+UV7/KRMBh1ExPseXfLsJ8FZ1UqK2u
	5RcxDpGNriZNjQkhvTlOpOrPvpe19BlLUsNtFmBuBJJv7AOhSmEDJZaIIlS+0rzgSPQgdGkXYh7
	1lCK5R4m9GjxPtesLYMPJyjadeCpfHtO/IXZf4c/6RTFtZdD7NSpP1qIN7mJtYjkFbm28gzMCpc
	+9Ge/avDed6EJ8Ni/NeXI41u6G5FokOKPjpRv9gE7JqzMzwGXOdHXhaY49BLTKCGscI3cfeKyuH
	q2oTTLZxCbHs+KJndgq5syCXneFPwRReNPWyZ07QUhf/w6tGMu7tTAca2IRNcRNjomxUyhIJQox
	aFo0xDejgVEI0tBl+TJArdk04CA5nBP/WqCleCtU5YlMlryy7Ias2CQGb7Te2ia1+kO1A2QAJMe
	fC0hlcqpnTx/yxKDwKg==
X-Received: by 2002:a05:6808:6807:b0:4a3:fb6c:9adf with SMTP id 5614622812f47-4b9622c35abmr8613617b6e.12.1788560282554;
        Fri, 04 Sep 2026 15:18:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c8ed6asm3718199b6e.17.2026.09.04.15.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:18:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 16:17:58 -0600
Subject: [PATCH] mtd: rawnand: sunxi: fix free OOB section offsets
MIME-Version: 1.0
Message-Id: <20260904-submit-sunxi-nand-free-oob-offset-v1-1-cf389b9ac94c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wrCMBBEf6Xss0trLC31V8SHXDZ2hW4kiRIo/
 XcTfRrOMJzZIVFkSnDtdoj04cRBKpxPHdhVy4OQXWVQg5qGZRgxvc3GuYYURtHi0EciDMFg8D5
 RRu3GyzIpP89+gep5RfJcfh+3+5+r5Ek2N3FbGJ0ITdRi11Zt2fXN3AuVDMfxBUIgyQelAAAA
X-Change-ID: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_151803_913637_5A55A459 
X-CRM114-Status: GOOD (  13.72  )
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

The sunxi hardware ECC OOB layout places protected user data before the
ECC bytes for every step. Since variable user-data lengths were
introduced, free sections after the first use sunxi_get_ecc_offset(),
which skips the protected user data and points at the ECC bytes instead.

As a result, the MTD free-OOB interface addresses ECC bytes rather than
the protected user data for those sections. Use sunxi_get_oob_offset() to
point each free section at the beginning of its protected user data. Keep
the special two-byte offset for section zero to reserve the bad block
marker.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..559b42687b1b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2013,7 +2013,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 		return 0;
 	}
 
-	oobregion->offset = sunxi_get_ecc_offset(sunxi_nand, ecc, section);
+	oobregion->offset = sunxi_get_oob_offset(sunxi_nand, ecc, section);
 	oobregion->length = user_data_sz;
 
 	return 0;

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
