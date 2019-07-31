Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37ED5C32751
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 16:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06FCF206B8
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 16:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DSuAfIVc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G94Ti44U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06FCF206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4lyHrhgN5ul0Uwy+Qk9ECjCJp1L1zuNRK507rY+vejM=; b=DSu
	AfIVctr8LTfCQ3hMQ5JUgR9RYpaiFVjDNCub2+Gux9SG5rAbnD9otaGkAlop0PtIRzPvy58U7nqqz
	M+1NLQZeaaL2GXC0svhAPkaOWV/IpE5INtb9hACuMZDYR8SdFWOgmqHLaCbBnJbWWRv+XFsgra4Q8
	m85VbiNKrjIWAS3HMYEN9Vik+fZNWZBiA58A6dIqfQDpQimvgaoTpgfLagzuAm2qVeI0F+T27kQkt
	OO/V0/o0NljnVAhT5WZ8k4yIvEImpS2nxt3XcyFxaflIl/WH1tbtsA6gYqB/9QHUkxtaKQ6AUuRFc
	T25WIO7ByCT8r1MdMryEiC+4H8sOGrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsrPF-0005V8-Vk; Wed, 31 Jul 2019 16:24:49 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsrPC-0005Un-78
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 16:24:47 +0000
Received: by mail-lf1-x142.google.com with SMTP id v85so47838461lfa.6
 for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2019 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UrlrXQzIkFofr+wa9Zu3zCqVLmDfj5DpHDvVM9uQwcs=;
 b=G94Ti44Uhwnsekg7IjF4EKnQCMK3ISYhZXTsEpaqZPef/69s4B/0XSXey1G0gNsmU7
 1qsHM/a62KdT/qLoIFGOkbg2RU8N/vA0lU5Uy1/DglUbMxc49xZaZoNQfCJ4jXVpIYrZ
 LDd9pAA3EKsIFXdqrA0UzN+/7GyAgedW/S7/9cbAnODrpvawv6PFrYe/QZ6xEg1kmJqD
 QKZc0tGdApistl3gTaiSP90Yf1SlS7Cgq+/G1ylW/ZJPaNU5KimHqLmSF07Xjbt45+cJ
 hoch9MNaFRFdw5o6manhTQejjZf7ElEw4RC5TvctJMq0YidvSfAMMnhVUfAt2IYiwMRg
 dcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UrlrXQzIkFofr+wa9Zu3zCqVLmDfj5DpHDvVM9uQwcs=;
 b=jCngSsxFKWJOxwffX0kfPc7n+dZfj810rI/1GjdeH0rj+tS/8sT5/rTEMoxJ1hYx4q
 BFj4SOtEN1CNwRvmSk0IqTKRBGc9xWhMsqgWJ6PAVFs1IeNzTE1RcZpSuJsFQ8QhvH9P
 LFe5XZ7EF/jBLaWkUHWG+CFvl+tonPGjhk6fLN2O/7xE5JOm+XrL4E2gAmSsUpkdNRbf
 nHNJ8+uYhk3Aa9OdOG0C9BjczxaCywSS1PqZfqxj+sdXTFprxKHGFTht/vRZfyX49R0d
 kfU5/T045040MPoA7852RLEP+X2MJDIfkiIIsxPBayh4hmgspmmrkKWoOloTPdll14yt
 3Q2A==
X-Gm-Message-State: APjAAAVRumtIoS5qCnKd19Uqfpj4u4rCMOavhI2cebQBjDaTpun1xS5M
 o6vl6UXOo1qvSZwC6K4QxE7I4IDvppkeHLxhDQ7IhzYE
X-Google-Smtp-Source: APXvYqyFVhEFBHIHbhvJOKyCyRv0un3+TjIh9JjJ8oeupIVE8FFyDeGuIF6Op6LadkXReFOhh9vWnOKUKvGu7qDUu3U=
X-Received: by 2002:a19:ae0d:: with SMTP id f13mr57330274lfc.123.1564590281913; 
 Wed, 31 Jul 2019 09:24:41 -0700 (PDT)
MIME-Version: 1.0
From: Sergeant Peppercorn <speppercorn109@gmail.com>
Date: Wed, 31 Jul 2019 09:24:31 -0700
Message-ID: <CAMxq0fNSWrUFMmmTs8Ri9gFOvS+KQJvZN3-_KuiqXi9bbmCB0Q@mail.gmail.com>
Subject: UBIFS ECC errors
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_092446_283488_026CD5D6 
X-CRM114-Status: GOOD (  10.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

I've seen this type of error posted before but I seem to be having a
different issue. I am being plagued with the following problem while
trying to mount our rootfs which is a UBIFS NAND partition. The
differences I see between our occurrences and others is that this is
extremely intermittent, and in some cases, it recovers and then boots
correctly, but in other cases, it continues, making the unit unusable.
I have been postulating anything from bad NAND hardware to power
supply issues to UBI bugs, etc. I am running a very old kernel
(3.12.10 with TI patches for ARM Sitara AM355x CPUs) which works just
find except for this issue, but this issue seems to be happening also
with a 4.9.88 kernel with NXP iMX patches on different hardware, so I
have a difficult time accepting that it is due to the age of the
kernel. That being said, I am open to anything, as this seems to be an
impossible problem. Any tips as to how to debug this would be greatly
appreciated. I would rather not have to re-flash many thousands of
units in the field if there is any sort of other solution. A patched
kernel or uboot with different kernel boot parameters would be the
ideal solution, if it exists. Thanks in advance for any help.

UBIFS: background thread "ubifs_bgt0_0" started, PID 779
UBIFS: recovery needed
UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read only 126976 bytes, retry
UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read only 126976 bytes, retry
UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read only 126976 bytes, retry
UBI error: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read 126976 bytes
UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read only 126976 bytes, retry
UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read only 126976 bytes, retry
UBI warning: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read only 126976 bytes, retry
UBI error: ubi_io_read: error -74 (ECC error) while reading 126976
bytes from PEB 679:4096, read 126976 bytes
UBIFS error (pid 1): ubifs_recover_leb: corrupt empty space LEB
7:2048, corruption starts at 2241
UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 7:4289
UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 bytes from LEB 7:4289
UBIFS error (pid 1): ubifs_recover_leb: LEB 7 scanning failed
UBIFS: background thread "ubifs_bgt0_0" stops
Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
