Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDD2C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zsPgEyh4yHNkPQ+hzmOBz8T4Wz63Pv3H9nq16Cf1TQM=; b=HZWIP7yzPkE/bS
	YNW2u+RQBkUtTkFhZOeTTTjNxThCQiTvRJFy7LJblmbF/PpuaBVkyzDwZTaaISrXxedS0JdR3DxMg
	YlidpdnfRjVGQcQwJcIzTKOsXue7lj2itmD1ezNatgpJhj3FkXmCMOrK0FGEysWyyXwFeV8MR8UG0
	g+l31COVAy4bBJJDpmkxpalYxgjqPpkS20rWZlQMy2TOCVtulATI9yrb+Ww0kyx0WHaafT1kpXWWC
	+PuBWg94Yh1IByEBxhvKnuYJ9miBawDn88WNnWVCt4VLXAO3EGm5BBxK0KlNeTvAVjYw3Z77guVSu
	5B/r2bJdtRyF4NMLBc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDGo-003fsR-2U;
	Wed, 16 Aug 2023 09:56:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDGk-003frp-2T
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 09:56:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-26b10e52ef8so3036583a91.2
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692179808; x=1692784608;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBbWFhxqqCcGSdxX6L9y8gpcH9P2VcnoWxvrGpmme/g=;
        b=L7NZ5l6xxSfCK6y8MCFY/pEyDTkmWjQSrQCriAsKuhTsoVHCwkaMNEIDDVP5YYvqWX
         bHxajzgVqykRTEfRlBynFp7azUVjqBaHiHD0WAkTWOtok7Jhj+hdq+ykMUzINmANvr0k
         wsilIupRWQhh1eVgUSJ2QT/0c9uxnWBp+UvftskPPxnHXUooyizN78lFjfwXFK9r0HSw
         SQfL7NWliXxvSACCEdcSYCVz5CKKIxORJb7RMU4XaafrgCDFdDqZbDsSv4O6yfhgdB8C
         1SpUKikNr/7eB0Ni9LVke+5aCY2j4nz4LLalS91BhGhPHhvm2xrTfrxJLKx8ItxnEv5i
         YV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692179808; x=1692784608;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WBbWFhxqqCcGSdxX6L9y8gpcH9P2VcnoWxvrGpmme/g=;
        b=RQELtklJWVvtQWpQP+btr15OqD6R6qyB5RVBYg/uG/iTGyZNlAgtYWS20ozwNtb+Ap
         J9+HGMypwsLAZ8j95ALW4FRoknkgadyVZ+Q8Z7cHPLBpaJWKG1fOqUKy+g9KzsjxtKAh
         3tC950QTFVQjbu/ZSCT3kBB+xzmDW86TbifV6XqVkYlfodv8AGWcZHIxa8By09E90STQ
         gEh3TADO8Nb0xpLYmzy0RgzQGmvWDpL0TqnY+37I8jXrBeyl1trCckJ1Ij7/YfmAyHjE
         Z/zprmzsTW4ep3Wzc39b6wKXM+C8F24CvkbUbxk6G20cin5tYBNzEpZVaRgN9ZO8NrA0
         Goww==
X-Gm-Message-State: AOJu0YyHoztMdvdN3efVbEAzO1+R5ZZ3+zNMvC2zccYgCnVBxTHRM7lE
	GBGdxqamwE92JscOTZ7Mbu4=
X-Google-Smtp-Source: AGHT+IHMQqnNNpKK0OYvp3ioa9FinjRPGijehCrG6tg1HNg2sSFi2xL1LWlSANBX4nNGkBsuylbLbw==
X-Received: by 2002:a17:90a:e004:b0:269:21ad:bdec with SMTP id u4-20020a17090ae00400b0026921adbdecmr904692pjy.28.1692179808036;
        Wed, 16 Aug 2023 02:56:48 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a31c600b00267eead2f16sm11610829pjf.36.2023.08.16.02.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 02:56:47 -0700 (PDT)
Message-ID: <44f5a8f7-0bf4-c986-a0dc-dc12d0cb30ca@gmail.com>
Date: Wed, 16 Aug 2023 16:56:44 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: ubi: fastmap: Fix a series of wear leveling problems
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_025650_823926_9F4BA899 
X-CRM114-Status: GOOD (  10.73  )
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

Hi,

I notice a bug report with proposed fixes on Bugzilla [1]. Quoting from it
(only the first problem that is quoted):

> Problem 1: large erase counter for single fastmap data PEB
> 
> Config:
> x86_64 qemu
> flash: nandsim
> CONFIG_MTD_UBI_WL_THRESHOLD=128
> CONFIG_MTD_UBI_FASTMAP=y
> ubi->beb_rsvd_pebs=0
> 
> Running fsstress on ubifs for 3h(fastmap data PEB has large erase counter than others):
> =========================================================
> from              to     count      min      avg      max
> ---------------------------------------------------------
> 0        ..        9:        0        0        0        0
> 10       ..       99:      532       84       92       99
> 100      ..      999:    15787      100      147      229
> 1000     ..     9999:       64     4699     4765     4826
> 10000    ..    99999:        0        0        0        0
> 100000   ..      inf:        1   272935   272935   272935
> ---------------------------------------------------------
> Total               :    16384       84      180   272935
> PEB 8031(ec=272935) is always taken for fastmap data.
> 
> After fix, running fsstress on ubifs for 12h(no pool reservation), no individual peb has big erase counter:
> =========================================================
> from              to     count      min      avg      max
> ---------------------------------------------------------
> 0        ..        9:        0        0        0        0
> 10       ..       99:        0        0        0        0
> 100      ..      999:    16320      609      642      705
> 1000     ..     9999:        0        0        0        0
> 10000    ..    99999:       64    18176    18234    18303
> 100000   ..      inf:        0        0        0        0
> ---------------------------------------------------------
> Total               :    16384      609      710    18303

See Bugzilla for the full thread (with other problems mentioned) and
attached patch series that fixes them.

Zhihao: I asked you on BZ to send your patches to linux-mtd list,
but you didn't respond there. Would you like to send them for
review?

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217787

-- 
An old man doll... just what I always wanted! - Clara

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
