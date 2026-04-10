Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547B8F44863
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkBdZJI2Y2DCt4KrZ/Vq8uRtSf18/D8eLiolEDGJ+zw=; b=WtzYM/ytfgD4n+
	auc4trMc4r3D6rvzaj2Nfcx0fEq2Zaq4zvo1Z4tkdupSwkS2GKXJqiL0mheSRvtrbcBmm+ZHyDaEQ
	+fQcSv4shItcXMHudK0yGNDaXUH9SKNkogN/wpq3I9nwIe9zVTvD1sgvllF3zXTTB0pLct10pv5t9
	CkhmJmPqVyrPn6U3IKVWCqgooRwW83bsqffm8GWp5Wh6SYttXalLGccpgqxY6MPiTng3nUZlvSvCN
	K3O0ZV8AjTdmP7Dh/RkzkXGTqqECiFnleJHaFiV4sfYNy2EOA3Bh7K0p2bPNbim9POEMkEbR4JElT
	znSLLv4MGbvDHFVNnS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC3t-0000000CKJP-2LXw;
	Fri, 10 Apr 2026 13:38:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC3q-0000000CKIj-3s0e
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 13:38:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so2040600a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 10 Apr 2026 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775828294; x=1776433094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJlPJW8FpDciknW1ezsaq3xMTwniBfxMiXGcZYoSCWI=;
        b=Wh+VyatWe7coc9XEHR/uI2e2LpFTlSGgNSwBIAhML42zq5U+9bnPV50RjR/Vm0u3T1
         JpD2GMSMzW/L38Z+5BQcPVLN9U+MAkv90Ey42fDd9RYorhWzdGySgSt2vf/VKFbSi44/
         HR/RvqDEgS8PqN+Q1Bt5AUbNHlkaMID8JafcDA8f/A7Tu+I4oyRs25fK8QPcAwT3/F6d
         bsK60HytGW5C4HJWiXqV18C4rYwwe+/HM5hiW0adbbFvIE/HkshDfY2kDUj3x27Tosj1
         SshAChTSPjY4SVstHFQEmhZSbdHO1+8xODRsoY3IIPWNALBhRlf1UAHHOlw3dFn/OhmZ
         R73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828294; x=1776433094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uJlPJW8FpDciknW1ezsaq3xMTwniBfxMiXGcZYoSCWI=;
        b=SfSaEBubBa0p6uo1EyAJDo8TIRA0Ef1/tKB8DTxKrgsapRw6eyTwg5DegE4Q3PPw9f
         ndIzVrWOYW7rYK3Xy7F0o373Vw+iZGR8QmgBwx+rSv7uPGUNC3/oa+OJUCCYTW4YWfCM
         vxzIKVYVlcSEXQ5jiA0OKKlVE5pzwb8QrKeLSYX+KbkWNf9n6+pqkxqZBMLzYft/N6fz
         4q0x8/YRE7K3kuPtEZRJi6NGs+12sCkcxwB3QjWnEjK5/7FyQ17SoMERcbwcoTy3mqwP
         WmNxsQF9TBfexg2iFHHx29+w+A7ZN7Dzw/IZ8kIz2EvgllCsVsw9abyxOc3p5UBJdbXB
         EdlQ==
X-Gm-Message-State: AOJu0YxA6lp+dgABfaaBnYm8UWLL5utJhocDCgO5+qCdEEvcHGZZ2Aod
	UIepLKi/puRbVdC22+Q4iBQ7hoiioA8PHXV0bReb+ZkUvYLAIq9F/+Gp
X-Gm-Gg: AeBDietRxp7JhMvGP+Ux03WZ1+rl1V3LsiyQL2TgJB93R+gdjHNZZnCpN5eCuboiPC0
	49V0PDPU2F+qCL3oxb6CiKrrLTeCNafBqan2BrTsk5MRE+4PgrKOhHux8XOzlevlNDFx3zlLFxx
	Ydw5SH47GHp4Pa23TpK/FZxuXpqXr/QZP2R7tH2U2tXgvnpoyr4He/m/RhtqU8IOOpo4Ceksr48
	1p4YKGPJLs2jLcLkbRlPn2dF4PDeW+lFkW9tDob0aqIr/EGMR2SxNettQeFdXwF91jM8eO/XcNe
	fdQ9UbjNRzRjxsjqU3bGhaihUCUESWrRiT3u557WfRGWqhhTrfFpkXPO6F2ua3e2gl4kThxdBUl
	UiCxXWa3ezhwrht8dbEUvNzKToJ/DV6qo6E3zc2vU9gqv8gs1czROO0o23CCJg3WAubW5e5CRQP
	b8HGaVssOp4OrX+1LRNXpUAOqtdTzVGDReW04ZJC9UfTokwdvmWeVXVA==
X-Received: by 2002:a17:90b:38c8:b0:35d:a542:2dc4 with SMTP id 98e67ed59e1d1-35e42842cc9mr3680530a91.21.1775828294018;
        Fri, 10 Apr 2026 06:38:14 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.41.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e4122314dsm3442353a91.6.2026.04.10.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:38:13 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH 2/2] mtd: mtdsuper: replace simple_strtoul with kstrtouint
Date: Fri, 10 Apr 2026 21:37:35 +0800
Message-ID: <20260410133739.1632-2-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
In-Reply-To: <20260410133739.1632-1-hechushiguitu666@gmail.com>
References: <20260410133739.1632-1-hechushiguitu666@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_063814_984548_64638C49 
X-CRM114-Status: GOOD (  13.98  )
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

Modernize string-to-number conversion in mtdsuper.c by replacing
simple_strtoul with kstrtouint. This change provides proper type safety
for MTD device numbers which are non-negative integers.

Using kstrtouint avoids unsigned long to int conversion and is more
appropriate for device indices. The debug output format specifier is
updated to %u for unsigned int.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
 drivers/mtd/mtdsuper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdsuper.c b/drivers/mtd/mtdsuper.c
index b7e3763c47f0..c709ff7aa6b5 100644
--- a/drivers/mtd/mtdsuper.c
+++ b/drivers/mtd/mtdsuper.c
@@ -132,12 +132,12 @@ int get_tree_mtd(struct fs_context *fc,

 		} else if (isdigit(fc->source[3])) {
 			/* mount by MTD device number name */
-			char *endptr;
+			unsigned int mtdnr_val;

-			mtdnr = simple_strtoul(fc->source + 3, &endptr, 0);
-			if (!*endptr) {
+			if (kstrtouint(fc->source + 3, 0, &mtdnr_val) == 0) {
+				mtdnr = mtdnr_val;
 				/* It was a valid number */
-				pr_debug("MTDSB: mtd%%d, mtdnr %d\n", mtdnr);
+				pr_debug("MTDSB: mtd%%d, mtdnr %u\n", mtdnr_val);
 				return mtd_get_sb_by_nr(fc, mtdnr, fill_super);
 			}
 		}
--
2.53.0.windows.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
