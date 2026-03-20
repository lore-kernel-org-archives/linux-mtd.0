Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6423B1099B2D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9IJXnCOFFMyrZzbUiSovoA1z2u4dbt0pmuAgjjKt4/M=; b=Ivg7gtDwAvXzDY
	EFA02xSut0BrDFtqIdrBYDqXMguEwfwUidc0gSd8XNW9/c/29uAN8MVWqDTOdmMTImk2zEGcN+C98
	ciykhGxSk74K7wuzi59EsDfxilw1jdjegZz/heITCLDhfB3px4CCX5JW3oE1preHs+wEs4gUZtuZI
	F4DXQg+BlEy7uqm8JXEeirciMw9WR55/r0Lj/ADt+yxOaQVtSaewEBD8/jj78N8ObwKo+Vn7BJ24v
	PzZhFYOo7Tnf3A2JApCqaDGhkLk9HIGiKQyy3nKwZabRK0oYXGh9gt92Wbb+OlCqWt2eZLl4W9CAX
	r7hPZULLCs1z/DQIcpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eIM-0000000DLyK-0Ftc;
	Fri, 20 Mar 2026 18:10:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3eIH-0000000DLwi-2kGb
	for linux-mtd@lists.infradead.org;
	Fri, 20 Mar 2026 18:09:58 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82a73593410so883893b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Mar 2026 11:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774030196; x=1774634996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWO8/AM4WrEkDVDqOucayyy0y80irblT9jEghfxAXWQ=;
        b=Cj7BZcyz7Ay8WjQjgvu91coZTmHslVdMd+hEz8aTR6YFRGcG6jkmamDbDqr3KjPdnD
         Ecu7hi1yleGH1J6VLUczz1Gx+acvE4xf0EMIML6AmQnGb3FJH658cedlI/RPLUWb3D3k
         Ez49D22WHOLn0rqKrLzIWOSMIyhapeojMiGUYBVddBnsB5G340eh3VnudrDHNQb1AxWw
         YZqOq7eFR9XN9kXycJCwuTD5bYy9666AGQrLcZdn97So3C4A0AMgEJ30pjVzYU6tN6fQ
         FtbYIVJePSsCvwDGVJXW0+UdArTSX72aXvQhzA7hRLA8yz579az6cfRX0tJkBbmsBVCm
         LZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774030196; x=1774634996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWO8/AM4WrEkDVDqOucayyy0y80irblT9jEghfxAXWQ=;
        b=jfPIjiMAgU1EG3uxvJZUs3txNuAEFkyA4m5l0vr1P+rlvBnhpwJmSO+eLiiuw9dvAL
         2TSZCezDXA6PdNjKeEQO9AB8Cw1cr8Ywuge9w9VeYO6J4tbItKguos8AKbZrl3oQRPGW
         B7I8drGGB24gTFZZQwLVoqxHuKL746+Mm1hmL8/0srNP4iqZ9oE9//TuSCZrV8sM2OGd
         zR1BtErilIBvfJeDQCUia+fA2lllv/88UdIce3NdWczI8kg56M2+q8JXfJX22mmZiUbN
         TrmH+7C1s4+D4dvn3u/DFjb2xJLZrAlVUFXvlERTSeQhoYCtVrigPvf7K/h76fgH/VPm
         Z78w==
X-Forwarded-Encrypted: i=1; AJvYcCW51ciVLg9D4rBnNc8aAhWcrpEp/xt6awzyAJ93L3/0BrBiLq9zUYe47AyWYyFeID5cEbO7GhbIusI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5zT0SexVH68kTpKn4nw00BAO8dLc/o6+ER/bx+8pW/Fdl9PXt
	aevR5ZQ56S9/z4omxIioXxkNbms1uPHOm+oWDOX9WuD5wgCPHdDdWmd5poUSiw==
X-Gm-Gg: ATEYQzwHN+gggWZxPeIU8w2t0q7svFxqS+SoKMOgb9MugzTH20jgvKHe2F937IUE4ae
	2tDgrdGLTsNiSNmo7bUnB1qlLARBPPzxrDKgbn5NXGcHBai5pz8h0ucCBM5kz46aiM6JngVqFaY
	yT4l0COLM4TW91NkbK/kyjwsDm+xxysVm6JWa8i6kWa24kJvfmYbOHS4BCABQ0uIa1d4AtXuwRE
	mf2cDUuDq2HXWK5IUBd628vKuZ9H/sOpHtW89FaWOYxUVEcgKKdh1pXSNkJscBnn1GCREwrVUsV
	wihmmICPaU0QTzWKVbIY5uK8A0gD7qs5gfRciic1lwg6Tkcr/B4FtNIpiPE64U/qNVstR4rccea
	/ZsFIDnl8/2oteT6n5gVWBnwq61pPhBG4rJLol6RLrVjqLVq29kjTeVFzEPwVPgrU+JnTI1T2il
	/BCOT/T/KMBw/xOB9sniTA984y5f0RZLMoVZmkun+dY3FsjhZjDqUvfLrEac+uFoizk6hByiSBG
	oAgg8MZRG8pajBWX6hkFODNP9WcPRf9kHfOxKvecKllXvVtjA==
X-Received: by 2002:a05:6a00:928f:b0:829:7e6d:cf12 with SMTP id d2e1a72fcca58-82a8c27b910mr3460151b3a.18.1774030196280;
        Fri, 20 Mar 2026 11:09:56 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040d7e56sm2582318b3a.40.2026.03.20.11.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:09:55 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: richard@nod.at,
	akpm@linux-foundation.org
Cc: chengzhihao1@huawei.com,
	hch@infradead.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 0/2] lib/list_sort: Clean up list_sort() scheduling workarounds
Date: Fri, 20 Mar 2026 18:09:36 +0000
Message-ID: <20260320180938.1827148-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_110957_692482_7A0937BB 
X-CRM114-Status: UNSURE (   8.19  )
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

Historically, list_sort() included a hack in merge_final() that
periodically invoked dummy cmp(priv, b, b) calls when merging highly
unbalanced lists. This allowed the caller to invoke cond_resched()
within their comparison callbacks to avoid soft lockups. 

However, an audit of the kernel tree shows that fs/ubifs/ has been the
sole user of this mechanism. For all other generic list_sort() users,
this results in wasted function calls and unnecessary overhead in a
tight loop.

Recent discussions and code inspection confirmed that the lists being
sorted in UBIFS are bounded in size (a few thousand elements at most),
and the comparison functions are extremely lightweight. Therefore,
UBIFS does not actually need to rely on this mechanism.
---
Changes in v3:
- Abandoned the idea of introducing a new list_sort_nonatomic() API.
- Removed the dummy cmp() hack.
- Dropped the cond_resched() calls from UBIFS.
- Split the changes into a 2-patch series.
- Dropped Zhihao Cheng's Reviewed-by tag due to the fundamental change.

Changes in v2:
- Dropped the u8 count rate-limiter in merge() and merge_final().
- Removed cond_resched() calls from UBIFS comparison callbacks.

v2: https://lore.kernel.org/lkml/20260317165905.1482256-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20260315193900.218737-1-visitorckw@gmail.com/

Kuan-Wei Chiu (2):
  ubifs: Remove unnecessary cond_resched() from list_sort() compare
  lib/list_sort: Remove dummy cmp() calls to speed up merge_final()

 fs/ubifs/gc.c     | 2 --
 fs/ubifs/replay.c | 1 -
 lib/list_sort.c   | 9 ---------
 3 files changed, 12 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
