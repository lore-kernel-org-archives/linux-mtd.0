Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC5BC05027
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Feb 2023 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IyUcnUB4CFDeu3uRfFYa8u/qr7QmWHYr0xAXLwSsjOE=; b=ccLzHM0rTeC8A/
	OZ0/I+rVQrivecmhqTXWTnKONXds0dli5wKX+vMP+V8TzE33qvVjn+NzK2Zs+gAJpILO5Tf3FooiP
	gD+Tv+neNj4bsnOGk4H6CETCuWFlyENM3pohvbUw2fWE+jwVU771UMs7nt/2GRVSIfthzATnslw+J
	h5NXc6nX6cb8G/fbkHPAYjQS3O5cm19soHQ+eTwHNwyGO0S3NLS4FesbfY6oSzGEbWwcG2UvyZ0q0
	ikT5KMYYUybCQB1WS93T08DqDpQ/K0m9SSVqfD1tKrmvyd+NZMkJzs3wpUpamSmpasmo1Pzqtlvlt
	TV2NS71TpuosD1iKV1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT46g-00FAdM-V1; Fri, 17 Feb 2023 17:01:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT46e-00FAbJ-A2
	for linux-mtd@lists.infradead.org; Fri, 17 Feb 2023 17:01:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id 19so2210178plo.7
        for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2023 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CmMG6Bjrj55x+g0WwIsSci8pNsPP4XDLQDm9PqSpIM=;
        b=RAUUWFldyLPjGSheNOIq6G8uYWWP0gAKTPALYQvcwHJRP8rIYOBIYIqZ0l0QiOgpI4
         BmRN2EH3XT44R1QVRQbtFM+sez585aP618jvo+nftzHfykjas90LU4RWFK+7D09c9TWG
         HLQW/Q6lD0zd0Os5D/neaKqg0GgxwV8B3Y097zSAQdttWlnzcUlsUYNv/v8k1sSLN9hf
         rWxCPN2Ye+aNIiHB1e9rnXHREG1I+CAMMWuz7Tl/6PoHfcufOJHSspnvCVpb9DEuC8l6
         Iehw0teIWwAQ0cS3KSr3Khnn9aPd4nSTCJ6e+LAApn2yrXIW6suB9yeimWF7QcJTU1qD
         U8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CmMG6Bjrj55x+g0WwIsSci8pNsPP4XDLQDm9PqSpIM=;
        b=bA/bJWCV5K8KItH9/SNNmCECd5ubJAVPkgAxs0LVSnguJ5sRa8Y4vY3qRpykeAzG/f
         /hORvIl60RYkmQDlcoJ9yctmbYNOrm3MlJQczOKEByq9nS2kns26vaW8EMhLglNxWDnf
         nbNRc4X3qwWZMx7KOuRwoxDfLzjFnHU4A9/XuwVYelyT7rNPjIUBeCSbPUO0A94eMh/a
         dpfpGSATeuCY9NCVgDmXbmSvFj1LECWg5et3pisEVPQb1aMK2dd+nT+rTzCQlX5WE5d/
         ZuKmOfMpj/AhEkf5ol3LxeuApUzLAtW5nmhHvEzKwPYtksAQlhtubEjK4UaC5e/fybJI
         ajkw==
X-Gm-Message-State: AO0yUKWRCT31ntiJ/rga2Yl266k+sRwp62AJ1eCrgeKEqUpC5iprT2Xi
	pPc8QYhEiqZN/aL36AaxBr4=
X-Google-Smtp-Source: AK7set/4ilB4G2TkmFxdRwuCoA6bW6LLDRjvY2SEttqZb4vbAwGObXZU5dNtLdu1y+2r/zAwusaHNA==
X-Received: by 2002:a17:903:48f:b0:19a:9610:b237 with SMTP id jj15-20020a170903048f00b0019a9610b237mr1540289plb.45.1676653260569;
        Fri, 17 Feb 2023 09:01:00 -0800 (PST)
Received: from udknight.localhost ([117.30.83.51])
        by smtp.gmail.com with ESMTPSA id jb6-20020a170903258600b0019a7563ff15sm3401546plb.115.2023.02.17.09.00.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2023 09:01:00 -0800 (PST)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 31HH0uab030595;
	Sat, 18 Feb 2023 01:00:56 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 31HGw8bo005510;
	Sat, 18 Feb 2023 00:58:08 +0800
Date: Sat, 18 Feb 2023 00:58:08 +0800
From: Wang YanQing <udknight@gmail.com>
To: miquel.raynal@bootlin.com
Cc: bbrezillon@kernel.org, richard@nod.at, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: eba.c: fix return value overwrite issue in
 try_write_vid_and_data()
Message-ID: <20230217165442.GA28288@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>,
	miquel.raynal@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
	vigneshr@ti.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_090108_371868_D50EAA6C 
X-CRM114-Status: GOOD (  13.42  )
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

The commit 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")
adds helper function, try_write_vid_and_data(), to simplify the code, but this
helper function has bug, it will return 0 (success) when ubi_io_write_vid_hdr()
or the ubi_io_write_data() return error number (-EIO, etc), because the return
value of ubi_wl_put_peb() will overwrite the original return value.

This issue will cause unexpected data loss issue, because the caller of this
function and UBIFS willn't know the data is lost.

Fixes: 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 drivers/mtd/ubi/eba.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 09c408c..4e32b25 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -981,10 +981,17 @@ static int try_write_vid_and_data(struct ubi_volume *vol, int lnum,
 out_put:
 	up_read(&ubi->fm_eba_sem);
 
-	if (err && pnum >= 0)
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1);
-	else if (!err && opnum >= 0)
-		err = ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0);
+	if (err && pnum >= 0) {
+		if (ubi_wl_put_peb(ubi, vol_id, lnum, pnum, 1) != 0) {
+			ubi_warn(ubi, "failed to return physical eraseblock %d",
+				 pnum);
+		}
+	} else if (!err && opnum >= 0) {
+		if (ubi_wl_put_peb(ubi, vol_id, lnum, opnum, 0) != 0) {
+			ubi_warn(ubi, "failed to return physical eraseblock %d",
+				 opnum);
+		}
+	}
 
 	return err;
 }
-- 
1.8.5.6.2.g3d8a54e.dirty

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
