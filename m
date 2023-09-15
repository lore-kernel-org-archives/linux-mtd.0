Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44EDCD379F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=48T2DDMxzMEfDYtfCEVUD2qhdSIzLH4CPq3U+eA04b0=; b=hots+le0jst2jb
	RXS6IPx5Jet2hxTbMf9Qm92ZToeTWn2wtLiXwkrMP9zHnHY5yiWRp5mXUcwuWhK4564imvSKdOVgn
	Gc/mJx0mu9fHC4v+VDcgFJlvsARelqNR63vdcUjHEM50b2u6V6OIzDVrmTBhhsf3XMqToAHVKEq1v
	mAVSOeokSUVzFmVle1YtBPGDrDqP/xbweMzMEuBZ70FJCc+fA7UEx8cDIXq7wXJVj16mQFJVWdYTz
	R88/0we22XjJbqqdDsrHNH+xPo5bwSnkMHtsTwK6vWSAq39mY7w72J3m1y86DtQ0xfpU7d48j7GNN
	VWQLnzTra0togkGJQxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFAc-00BId6-2b;
	Fri, 15 Sep 2023 20:12:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFAa-00BIcM-0t
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c35ee3b0d2so20370105ad.2
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808722; x=1695413522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHWelds/0UMwcBpnWos/aLtztFrXjkfJbKPQ2m0GJNU=;
        b=Q3JHjLM6FSp+H4R9o6p7Fj3WvnDsIMcu6Q5ldopy0USJ71vSGRiVQMVaPLX776WqrA
         3LuSTEL8mSjduhsFyY8sVeqHxLhhjUkJ5XfyRmJbj8tPdWQspUlEOqIx+AnUWaHkXrvA
         fZZgs8/yW6Q/MajE29r2Xn76EbGYGQNEuVApw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808722; x=1695413522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHWelds/0UMwcBpnWos/aLtztFrXjkfJbKPQ2m0GJNU=;
        b=DhTSA+oHnflGsdLk2FnmyMRvm8xyTxNNeCbdo4JJ0WrJai6uEocWF2WjKaF95jIE6K
         LOdBq2O7YexeRTkQ6VUm3Eelqk+1sIXMVpUUyloPdSKF8FlyvUECD6liliwgkCSZPxcH
         VTPSfXeU8v+7BO8RdwGLXJsKbeciribolLoJo2NY1GLyCFPNAGuUanu5Bw9MLcsAeLmQ
         DeMXhsJlMfx5uirp2nx3e9xdTHJGwKH3h9bpjJR+A41XQvGSi96BGuX+EbI2Z3dVIUa5
         3qvPO2D2oe/Q6AHHRgI5+BR8aHp8Ss2awZaiLVWFVoDdEVyTzNVzjueJtYqqfjGCSCKq
         +W5A==
X-Gm-Message-State: AOJu0YzLZvuCtlhKifn+cEzJ9dxKwwjmZrFdeJAQj1dwjapxvrwvrvXu
	kxyYzqsGW1Msqu7eEqeUXSIdez60lZyVEi2JeVY=
X-Google-Smtp-Source: AGHT+IHiNyqrliN/74dUaaMOB5YH/EEzt/xoauvDLOTN5wb5Fju0foAYEpaV6viOplTZo5uTNSDJMw==
X-Received: by 2002:a17:902:6bca:b0:1c3:a396:25b5 with SMTP id m10-20020a1709026bca00b001c3a39625b5mr2401710plt.61.1694808721930;
        Fri, 15 Sep 2023 13:12:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iz17-20020a170902ef9100b001b9de4fb749sm3898447plb.20.2023.09.15.13.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:01 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: Annotate struct lpddr_private with __counted_by
Date: Fri, 15 Sep 2023 13:12:00 -0700
Message-Id: <20230915201159.never.112-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=keescook@chromium.org;
 h=from:subject:message-id; bh=gCkXC8MpJaPT99ttxM470YlQxkUzCuh2ydBh0veT0Pw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLqQdMeeixNUCF5z4zedCX95mr3jXFz4Nb5Cs
 5V4tlXbBCCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6kAAKCRCJcvTf3G3A
 Jk8yD/9mHmYeZ4PilIA7bE0IVUOPX8xWImvE2StXacFdcKWj6g3dT1Z+QnG6UZ6K8E0IVbwxtWx
 0/u6hFgLlJcs7VYdQYDz6zlzN2DcqRSOQ2IfFjqwHVOA0VxKOMIZRLlsz2ZXr9Vgx4Lme5dVV+5
 WSjxLhY/Aa77SDYccaT9iTj5whirBeTZ/+vPA6YK7bUhNpaRPqACjOUXlOhpwyirFk+PtJe1rci
 unArKIBK5LaAqs+X0rqDR0pO3sL3YLFldvjdN8siCHGt6iEcP6G2Zp3AV9wjqnjH8UWylOIQX5t
 fBXq2LKhG2ubRtRStk+p6y5uCBHE1/mhxLP8nflD1p74ErUwtR0wgAmkwQ5LQhNX0doFZJIVnh5
 5bnGARcrRIi2/9J4R5T9e27gNXb32m9ldgD/vE+nWoAd78lQuJ/zp/ElqbJ0riOEXSw/Ug+Pjw6
 4zAmyAm0rIrnzbZIezZ9boeyfe7ZalC5ywHALmoK4I5ymlp0BHznG/ylHJKuRCKB9usocw4mMkH
 PkD55lpZ3U7R6j7pjvzZQ5C+9Mlf2siik3YLwqlhEl4kP6MI3UZnuZv0iGx2hMayqeo0ouuOI8V
 J+rkTGfqayqeMzppAHp9ib6o/ji2/JoJYvT2rhZd5I4OllXNs2Rg3m97Ee0Iq0UEYje/AB9V/Ro
 46ySS5G +6Rqb3pg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131204_313941_F5E9E0ED 
X-CRM114-Status: GOOD (  12.38  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct lpddr_private.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/mtd/qinfo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/qinfo.h b/include/linux/mtd/qinfo.h
index 2e3f43788d48..0421f12156b5 100644
--- a/include/linux/mtd/qinfo.h
+++ b/include/linux/mtd/qinfo.h
@@ -24,7 +24,7 @@ struct lpddr_private {
 	struct qinfo_chip *qinfo;
 	int numchips;
 	unsigned long chipshift;
-	struct flchip chips[];
+	struct flchip chips[] __counted_by(numchips);
 };
 
 /* qinfo_query_info structure contains request information for
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
