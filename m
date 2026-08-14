Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218EBC5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TQbvUay42NbIcLUga/hoySqpo85kaHnCfwXA4WIdkiA=; b=ssqyzVrJ9CoSq3
	YHtr1JT1m4VslZifRt/gw2hbyF3iFs44gBSO0dUYNUTSg6LN3CMX5DRhjMDf6c/EZ22gA9N6nMKP9
	FexVLW8RvDjuWVzTbcMeoEeqa5PDEWrcii6oW06lGC+Fx+x7VxuOUWysEveLfHhkXDjBVRM+Y9Frv
	PDSDhT4VBoKAd8tFkF6aHXnDQLkP9pX8sqTwMjk1oFahgqfdxpmZ9kc7m1X3FcASB2eicGRL/uh9O
	Trtb7T9DqmvR0cGEeJVlPdPKSMopqdpVp+YiK3gyvjA28y+428uFVtPE2cHZlQmgFkwewpvKmLHbl
	iJqsFfVkTkm5LYdHkmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wun5T-00000002GEF-28nD;
	Fri, 14 Aug 2026 08:16:23 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wun5P-00000002GDi-2n2l
	for linux-mtd@lists.infradead.org;
	Fri, 14 Aug 2026 08:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786695377;
	bh=SYk2jvmCIRtwNpXyEndM5dF0jL/F42Tf0xqZ49dKTPY=;
	h=From:Date:Subject:To:Cc:From;
	b=ea5SuGEswGI80VKjhp/uX422ElLMLSLwOXg81RAWsMIJYh45OlXS8tkPZG9TA14I9
	 hH0qcNc6TUylPHmzvMUBj5EqdsmNPp5NYqRc5EBXolwHSkwKxrnqcdt6eW74kz7OFF
	 8vUWN6GCIft67XkLKzLymmpKepLBylen2GRqK2qvy75W7gLCOnR5XPrB+diLu3iH+u
	 TihzVcvapGTQ6oVE+0ZJ4az3C/5xZUv2NKP6SlIq1/vp8gQG7ndCRebFT/tJ+KCZPx
	 h+ZOOCjHmT8XEzUpOMNNPHYI7TGEt/+l/3Yhe8sJQwxMF4SBNr/oofNBmhf0WU93bU
	 coiYA6AoFiaJA==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 50EAF64E
	for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 17:16:17 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=dLaBmN3A;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id B080464E
	for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 17:16:16 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so21089265ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 01:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786695376; x=1787300176; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l+a1HHuceYnWDLRxnCKGr+NZPKuWd1/Y9/oQSG5Bpfs=;
        b=dLaBmN3AYdIzaR39cYm+xgvW+lGwPd+efOkScgCugGuTr5mB04MbVsOg8LPOMLWAtZ
         fTF5HRUL3ZDgv2crPk8EgEtXmD1yjEX6h8Meg9z/XfeD+J2f0bqCba3d3+ffd9SopTy5
         NCT2ZIbe4XdQrelSPDjoMSVm9g6T+5iEzHNC2UcflvohzPeWUxvXxHrz/M22B9fUB1PH
         zVx1mH2Rhc4G5yAv7745gntutwNUsRJ09xt6lAZ/lcFq+ZlXbp+6Si1uV5FHVGX4+Uf/
         byzIGlF7YUPxY62v2ThSs7/RvdHt0WZ0s8Ln+8EHd8ZfvxA45KMYgofOKSB/oNiMG3Ol
         B79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786695376; x=1787300176;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l+a1HHuceYnWDLRxnCKGr+NZPKuWd1/Y9/oQSG5Bpfs=;
        b=SSfPoJqc7Imla2fVd2sUj/ntcK1e8yKhqYokerArKV7njN68HXwVsz90Z3T1I6ixG5
         OZgMHRLoKLXetyWNP/0eTm160fxKpUi7uEwpIPArnff18NRN5XTn22EI/BGU3gL7TLif
         BxXBhC4cak1ZYneWS6WUQEhuYzOOuMC/iyrmXW7YswetHghz1QQx1OVy+TvI39YVUR9G
         0aWto5cziRbPQiVFSZSWafIR1REOuoADj8bsLi9gXkMBnBag8KrBeeE1ypuzTf4dzTDR
         W6ScUMDMpnVyeY3tjp4e6Al8ofrYEm0nYmPRumk2cjmMpfVqOBJYCnW+Wiko8Le+3Np1
         T1cw==
X-Gm-Message-State: AOJu0YxqdqTQNAMeNmS4DQ7/jWXWKyEboIXOZuMdnd6jiS0g7exYegNT
	meZVmdqYYkyslgw0RkrPpl/t9CYvCOjUPUey71c5zLa8MmwqJidmEuLh8Gc7NRIOvoc9bAb3lnH
	Uz+lOWMR+gkF/RyPWAxt34KjQ4FTpZD6Jph0eeBbNq6H4HJJzXQ7wBIrGGWSJrzY+Azk3
X-Gm-Gg: AR+sD10sPECVfCqCDzdZBrtUoEtT265qWTFG4P2/RMZF1MPzt6fNqW6UKAqqiIFylzL
	msb1eIcJo7un0YvTBB3g88I9Z8C0iUvanDW2WRF9U5DCf++04Ink1Fi+HzDzyVU9KSXJfM6OoA/
	3EBbvPmMlGLwC1JUxg0WllXUkF7hoqFvJdh7m/VQMh/O9qS4LFGKApx8PcpVpPLfSlHltp/xKDc
	19lobfGXuLNxj2Q96giDBcV6VFCxvsq4GWTYqMpLe7hhSrou2CrPZnNUmfzX5n+EtZv1/rxgStS
	A0aEUSmCrfC3vn/1830EAvIAawM/drqcv5n8Mr+CCwlt7kev2509ppu7WUy7GCHOVw4WlPchgSe
	AvwB/OarxzEVmSIPYUh9NY/UjYzAFAZavWs9xOVkKl076Ke4V
X-Received: by 2002:a17:903:1b23:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d3b08727e4mr49756235ad.6.1786695375606;
        Fri, 14 Aug 2026 01:16:15 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d3b08727e4mr49755535ad.6.1786695375124;
        Fri, 14 Aug 2026 01:16:15 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d3ae7da3d8sm6380515ad.30.2026.08.14.01.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:16:14 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Fri, 14 Aug 2026 08:15:58 +0000
Subject: [PATCH RFC] mtd: spinand: winbond: enable continuous read for
 W25N04LW
MIME-Version: 1.0
Message-Id: <20260814-w25n04lw-contread-v1-1-2968b07c962d@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAL3OfmoC/0WNywrCMBREf6XctYG8GmK3gh/gVrqoya1GJNUkb
 YXSfzdq0OUZZuYsEDE4jNBUCwScXHSDz8A2FZhL589InM0MnHJFNZNk5rWn8jYTM/gUsLOECql
 rVNRojZB394C9e34+j3DY76D9hnE8XdGk91upBXyM2ZhK9ydsqqLjf53ALZPKaiFp30wC2nV9A
 XVUJf29AAAA
X-Change-ID: 20260814-w25n04lw-contread-03485e60c88e
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.16-dev-a9e92
X-Developer-Signature: v=1; a=openpgp-sha256; l=3706;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=SYk2jvmCIRtwNpXyEndM5dF0jL/F42Tf0xqZ49dKTPY=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBqfs7N8ZJymqdIHDBK3Th24JwLfVjEV6WH3g985
 YkZOf9q8VCJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCan7OzQAKCRDyimB/1oxx
 B6I7D/40Iv0Wfp9s04/LUaxfpxm0ljaQrgrpsylPyi3MeDXK/Ha38dZGijMS9JXz+nyY/qV5qS2
 zKNP7BjXL3pfFUZpzgOGqSYoaeIWBLBq0pjy2XPqXUf+ZTv0gLAJq0M3lw7IXIVjVRFwtlG8jYQ
 jA0lqcUJCSqcLzKYcCChpFslFdtPvROkcLeVOZrZXcSyblJNk/1geIo1kQPB9SvfsTizlAMzEpk
 72YgmbGzofut627PIg1gF9bgn18z+ViPLO6EsVBAzNy+PDUlOXvM7f6zbb0HYZLCzrGh1Jt7Na/
 inNFAAl92u59PE2XAz7WX7r3j7mTAu0SZF8DGQ3u2/JCCiM5QV/6SpdDds4eFyYbsVj9ic01SAm
 YUOYQtqhL05uiQCotoajIRLnfnJxOlaM5uquERMQQVhfxX8/b1AHZakOcOQOq1kG1hwsBFQ2pkb
 sJ1cLi94S89zqvfJjFdUSgwqzGaqLd+eXIa+TdfOmIahTFZwJtuL0EZndwXcRk63zinRBwcn+Ks
 0KsxBMicS32qy7lWswHiFtxbrYKi9nLNNSvbyZn8AF64RGoKlhfH7hhthA6nAtA0rtfLLVCI329
 +xJbxCEitB4hka3pH7SZLSrKal8wHmRkj1aEmxZBXWgAlsZX/80sDRKD0vYcHQLdOad+emNbFPl
 IauZeGr8CWRuieA==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_011621_622757_5368C005 
X-CRM114-Status: GOOD (  14.06  )
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

This enables continuous read for W25N04LW:
- The ops are basically the same as cont_read_cache_dual_quad_dtr_variants
without the speed limit (this chip has no HFREQ flag that would change
the required delays) and without DTR ops (not supported)
- w25n0xjw_set_cont_read() can be reused

Unfortunately on my system (i.MX 8ULP LPSPI) the first time continuous
read is used spinand_read_from_cache_op() falls into this if and
disables continuous read, so this didn't go any further:
     /*
      * Dirmap accesses are allowed to toggle the CS.
      * Toggling the CS during a continuous read is forbidden.
      */
     if (nbytes && req->continuous) {
             /*
              * Spi controller with broken support of continuous
              * reading was detected. Disable future use of
              * continuous reading and return -EAGAIN to retry
              * reading within regular mode.
              */
             spinand->cont_read_possible = false;
             return -EAGAIN;
     }

I'm leaving this patch for anyone who could have hardware for this (or
eventually myself after I have time to check the SPI driver...)

Fun fact:
nanddump -C is about 9% faster than nanddump on large data (tried 10MB)
even if continuous read is not supported.

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/mtd/nand/spi/winbond.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 171f4c264220..ad735f73945b 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -203,6 +203,13 @@ static SPINAND_OP_VARIANTS(cont_read_cache_dual_quad_dtr_variants,
 		/* The 1S_1D_1D variant would require 4.5 dummy bytes, this is not possible */
 		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
 
+static SPINAND_OP_VARIANTS(cont_read_cache_variants,
+		WINBOND_CONT_READ_FROM_CACHE_1S_4S_4S_OP(6, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_4S_4S_OP(0, 2, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
@@ -780,11 +787,13 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb2, 0x23),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS_WITH_CONT(&read_cache_variants,
+							&write_cache_variants,
+							&update_cache_variants,
+							&cont_read_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_CONT_READ(w25n0xjw_set_cont_read)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),

---
base-commit: 0f1b5abff55b580facccc16324ede60b048bd23c
change-id: 20260814-w25n04lw-contread-03485e60c88e
prerequisite-change-id: 20260812-w25n04lw-3e9146d8340f:v3
prerequisite-patch-id: 3fbc1f74bfc7bbcd5dd7ecf62a7e5b0352cacbb2

Best regards,
--  
Dominique Martinet <dominique.martinet@atmark-techno.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
