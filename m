Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4960C433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 12:04:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 738856108B
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 12:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 738856108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Krxvy0O6lS5+O445w75V7F+xxyolInADyKJLWt/kUg=; b=kNcz8IaifselsoM2VI+TomMgtP
	vf/tJ4AMCy38npDYOabaf4kRBD78SkdMHA8tWQlXok5qWJWeyGn6zcYE0rRh9mPv+imucg5lyT4bZ
	kE5bWr7n+NwoaahXAvcCMt6YWMKt3BpKF3e9Pb8dP4XHZqPXC9e0uK2JPjl2EgkiQqwomiw57zl0D
	30JfBsR2pmvqJjscULkBk3qD61ovgsU+js6J4m2qwoKmn8AzJUrqsaSpQXjDktH0vv8Anz2WAdK4q
	iLEjX0jdsXNE89lW2C6zG4JuxKDc+/ICF7+37/1uWaE/RpxIxU1d45gs44PJ0R5KledUMu4xSsPI0
	zieVLsNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTkR3-002Uwd-I1; Tue, 06 Apr 2021 12:03:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTkQz-002UvN-FS
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 12:03:55 +0000
Received: by mail-ed1-x533.google.com with SMTP id w18so16303493edc.0
 for <linux-mtd@lists.infradead.org>; Tue, 06 Apr 2021 05:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=y7rQhNGafNJcq0y6RvylDg37W5/hiegmlBkVQ+9ruP4=;
 b=UIPvF/hP2wfw5P8EQQAkS/Wsb7dXLB1V7QSarGd86T7F9DBJDziQULcm6AQ9dCTS0m
 nuFVPD3wAvkmgYlUabJWENSUqNX8lSfTsLE7KeOKODL6HXpY0LB4PmtFWGFl2AoHuk8G
 CB9S5O6jf2PRVKq/E0ntQj/WTotiaxRLNsLSHBdZdqXit1aObNOmak60iTpzc0zKCtUy
 r/36jfz09jQ9iM10Zn7Hl1F7buR/AqVB5DpFByFOrvtCUNMPuC6PFqOY+zlO8Z3AvYEe
 DuBrzbtYxwJt6RP5Xfqpqgs2qLeXD7bPa/xwJy4gYDzDZKb6enqAd3t7gOppXfc0WtpZ
 qT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=y7rQhNGafNJcq0y6RvylDg37W5/hiegmlBkVQ+9ruP4=;
 b=obt9dhRReSMj6B/4nagRfBvm88j/sTfO3YLjwL2IL1JWfukc9vUAA9RyDizqp7/9Vx
 bpCn+ujrB7HpGAWcgCRaq9EJnICRVQTUIdwLUpqeq7CDXm5pdqtRBBxjfH6/ARMVcFcD
 Bc8YV8b3M2VkFTErq3/e2IALIgs56C58EOPetLesBelgnmag6Ti5yvN/qQZ0scHh0zbb
 ZJV5GX23r0vWlrXvYFQncynzdwi/RYYil/UIpF+9xFmmLtZzZZnaHc/t35OuZVNg30SW
 zzmYpdw3ugU/9lKoIKHpUeUqnFc8/RkwPFFrnnEO4ze/AQFVqLJCG9HxKf/iJ6Yj8yFs
 FRGA==
X-Gm-Message-State: AOAM530OrUAktQF7u1WqlpK2UyyJD0mMwgMk9IiqeWsV5CS+QD1XXbIw
 pB0rwwoOzyh4DXOm64byVrSwFms78bbQVg==
X-Google-Smtp-Source: ABdhPJyUpGWVMgaxTXKDrFDYEq2kJx9MjOD9PLyQfgH9O3pHzNRTspecJZgVupUAEP4DoX3vhvNdCw==
X-Received: by 2002:aa7:cc94:: with SMTP id p20mr37819674edt.353.1617710631166; 
 Tue, 06 Apr 2021 05:03:51 -0700 (PDT)
Received: from [192.168.1.70] (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
 by smtp.gmail.com with ESMTPSA id ly21sm3039004ejb.116.2021.04.06.05.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 05:03:50 -0700 (PDT)
Message-ID: <34544eb22f7661f6fb64af3ed99b1c2092b99a31.camel@gmail.com>
Subject: mtdblock is slow compared to mtd device
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Edgar Lakis <ela@phaseone.com>, Martin Egholm <meg@phaseone.com>
Date: Tue, 06 Apr 2021 14:03:49 +0200
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_130353_917631_615CB301 
X-CRM114-Status: GOOD (  14.84  )
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

Hi

I have an embedded device with two qspi norflash connected to an Xilinx
ZynqMP in parallel. The flash is Micron MT25QU02GCBB8E12

The clock is runnning with 150 MHz, giving a theoretical bandwidth of
150 MB/s.

This also fits what I would expect to measure from mtd0 in bandwith
(Taking the overhead into account).

~ # dd if=/dev/mtd0 of=/dev/null bs=128k count=10
10+0 records in
10+0 records out
1310720 bytes (1.3MB) copied, 0.010963 seconds, 114.0MB/s

Currently part of the norflash is used raw for booting, and some via
UBI / UBIFS. Al this works well with a reasonable bandwidth.

Next I would like to make a section to some readonly production data /
files, so was looking into SquashFS. I noticed it was very slow - so
was looking into the block device used for mounting. Here I noticed
that the speed was much slower than I would expect. Looking further
into the mtdblock device it only gives 3.5 MB/s

~ # dd if=/dev/mtdblock0 of=/dev/null bs=128k count=10
10+0 records in
10+0 records out
1310720 bytes (1.3MB) copied, 0.355392 seconds, 3.5MB/s 

A quick kprobe on mtd_read revealed that mtdblock reads the mtd device
in 512 bytes chunks, destroying the performance.

Looking into mtdblock.c and ftl.c revealed that the flash translation
layer in the kernel in general is hardcoded to 512 bytes sectors, and
also read from the mtd in sector sizes.

The 512 bytes sector size is for me kind of oldschool where all
filesystems where working on this. Has there been any work in making a
translation layer for filesystems block sizes in the 128k or 1024k
range, like I would create the squashfs?

Alternative as I already using UBI for parts of the flash, I am
wondering about using this together with ubiblock. The question is
though if it is faster, and for the second part how it handle locked
flash?

One of the reason I am looking into the squashfs is the readonly
nature, where it fits with the locking capability on the flash chip.
The plan is to write the data as part of production, and afterwards
lock the flash for any other writes. How would UBI handle it, if the
flash is physically locked for writing?

Any comments regarding storing some data (preferable files) in locked
norflash, where the read bandwidth much be close to the bandwidth of
the mtd device is very much welcome.

Thanks ahead.
Claus Stovgaard


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
