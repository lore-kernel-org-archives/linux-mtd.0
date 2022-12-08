Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC61C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 19:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4SB7zWXy7r0Ly5AneHdxTZ8XqA2mO3K4FYG3o0PVHg=; b=z3Xe/djIwehNg7
	SI3+SCebw9t5nt3O3jxiWDoK41aPR+tQyUhE/cGetGjapsnds25jGjgsyYsbYCJ2/yRV64TEBrWsY
	7tiwZ8WSO89rqnZZN18Jx+z2IUiBP+vM4ArlehbfMQ7qe63F7JYi4PSSlOo0FRuOnUn8E87JHtzBV
	HN/J3qZ6+GMgip0S6p0viRo7zqNQEzlzGELpSpJ6b6jFTq1UhG0RYpExM0WOGP4CfOeQ4yEkkBO6m
	lKbaVXtCwpMo1C0Sct3erzZSp/uyMSeN9sRbvbvJfo6ChL0rXXf8/LC2oepMYGsH+x96m0n1ZZh17
	h/9A/Yn0bEMCaWPdBc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3M7v-008vnM-JN; Thu, 08 Dec 2022 19:00:11 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3M7s-008vkJ-M6
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 19:00:10 +0000
Received: by mail-lf1-x12e.google.com with SMTP id bp15so3415289lfb.13
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 11:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/W799g4H7A5yLGYed0hlGgHikenhP/7pLE1Kadbh3I=;
        b=nrQxW6A1dy3JVnpiM6bAv5BaK8FvE+y0gkEzIokfxCalAzOZJ5a0oVWjA4+Gh7AQaM
         k4sDJV1dDIh0Fvh0rnyLI3Kc1eCT0udwY/zGy2ocYZRMJv8f7CTafDmmHy2ABKvGBVSn
         gV/uWps1aJ+ebUyuPQyQNMKFMfxljFLd62FgdvrcuYjcwvK/VyrQHy6DqtnZKp2bwPN1
         qoP3nKCfQe+AsWbDjQu3myYGeFWhSrGvzg2G3SIIhnfgDKTJY8RbDKLN/HKM89aEDk98
         opbjp1KJUj6R4VCuasJAaDhMvK/8tVAxa0Ttxi0RWIS/6L5YyZKk9XI1VuOTj94v6Mhe
         jb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w/W799g4H7A5yLGYed0hlGgHikenhP/7pLE1Kadbh3I=;
        b=nrDHcm4K0/gd6VbXh7N61lVrA2LexS8xdIz0PPcZ0UeWTCVO7EBOrIYMEQ1uifvGPM
         IBQtebdZoev6I1gBXWLB4IOch0qMRnZlak3fGDwXWpvOBZeg/CEoVvZlqvq1bav0XuKk
         5gipLHQ+2NSmQwGX6H0rvq2dQurMMbwBu3b1vw0OKgiEZNQmnUKW4ZuTcnkC9gYNwcKh
         cTIHO8N6tjhNk2L7VCv54ZGEqA/L9mhSyony+vdGqy5IJryV1ANIMuH1LlIy7zclrbpv
         6KLx06Z/CRQkE+MzSe74Qdx2paYo5pjEDEvG2iIR4ffn0FlczltdOP3KBZE9QilXe+qq
         6jEA==
X-Gm-Message-State: ANoB5pkNU1rsRWsx+RrEdRqnuh9RyQBXjuU9TSOB5GQxV1s2atXpbjR8
	9x1y9xfBnMi0PLb19eBndrQ=
X-Google-Smtp-Source: AA0mqf4nIaT2k1eJAyaUs8xqOeMEt2aTZMz2kwJ+uQkGvVJgp7RGTm0WH64Aoch96jmiRwyaSHfq7Q==
X-Received: by 2002:a05:6512:b8d:b0:4b5:a9ca:9725 with SMTP id b13-20020a0565120b8d00b004b5a9ca9725mr451265lfv.28.1670526005496;
        Thu, 08 Dec 2022 11:00:05 -0800 (PST)
Received: from [172.22.204.227] (ppp85-140-58-71.pppoe.mtu-net.ru. [85.140.58.71])
        by smtp.gmail.com with ESMTPSA id b28-20020a19645c000000b004a100c21eaesm3461986lfj.97.2022.12.08.11.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 11:00:04 -0800 (PST)
Message-ID: <8bf10097-519c-a3de-8a08-d0c5d7ddb2de@gmail.com>
Date: Thu, 8 Dec 2022 21:59:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH] mtd: parsers: scpart: fix __udivdi3 undefined on mips
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 ", Nick Desaulniers" <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 NOGUCHI Hiroshi <drvlabo@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_110008_775705_5F87DF13 
X-CRM114-Status: GOOD (  11.29  )
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

This fixes the following compile error on mips architecture with clang
version 16.0.0 reported by the 0-DAY CI Kernel Test Service:
   ld.lld: error: undefined symbol: __udivdi3
   referenced by scpart.c
   mtd/parsers/scpart.o:(scpart_parse) in archive drivers/built-in.a

As a workaround this makes 'offs' a 32-bit type. This is enough, because
the mtd containing partition table practically does not exceed 1 MB. We
can revert this when the [Link] has been resolved.

Link: https://github.com/ClangBuiltLinux/linux/issues/1635
Fixes: 9b78ef0c7997 ("mtd: parsers: add support for Sercomm partitions")
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
---
 drivers/mtd/parsers/scpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/scpart.c b/drivers/mtd/parsers/scpart.c
index 02601bb33de4..6e5e11c37078 100644
--- a/drivers/mtd/parsers/scpart.c
+++ b/drivers/mtd/parsers/scpart.c
@@ -50,7 +50,7 @@ static int scpart_scan_partmap(struct mtd_info
*master, loff_t partmap_offs,
 	int cnt = 0;
 	int res = 0;
 	int res2;
-	loff_t offs;
+	uint32_t offs;
 	size_t retlen;
 	struct sc_part_desc *pdesc = NULL;
 	struct sc_part_desc *tmpdesc;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
