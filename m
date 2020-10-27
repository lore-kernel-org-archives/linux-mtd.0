Return-Path: <SRS0=AizK=EC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4165C4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 21:54:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AAC020759
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 21:54:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5TM2S/J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=genevatech.net header.i=@genevatech.net header.b="AyxXUzuV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AAC020759
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=genevatech.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O29dMb6ONukfs8LqotzDvIqLGKpDT7DHbJ2PU3YcdTA=; b=n5TM2S/JxdVzyvdGTZGJQbCC3I
	HzFKxp9pQh7XP94UI8uM6x2bkic9jpYQlDUriI4SsDmorG6w+3jHPq3JE24wSO7YPoTgckv1fuQH0
	WcFt98A3gJ1lvwQB7dctLey0QuOl76xbRp6LM7eHzd0P52Whyam/WXa7IG5Z3KlkspgYFsC7iF/c+
	lhRaBjVGbwoNnd2nFhxt0qV5LGZxCPsaYLyCDQ5L1tUdjt62V4HThffUHgcapP8x7vXHM9RGJpUGu
	815LUGsvO2q9Bk2zTzMvUwDDCMX2zxJJhDZh9pG3r2omBaZfQlXBJOcZA1U/wKKiUbrIqauZkVRt6
	21QxiQjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXWuR-0003Ek-Hi; Tue, 27 Oct 2020 21:53:39 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXWuN-0003Cc-LN
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2020 21:53:37 +0000
Received: by mail-vs1-xe35.google.com with SMTP id d19so1745121vso.10
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2020 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=genevatech.net; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=m0quw2aGpJf6MvAzJItfNSSNg9bXfvHfYmxBsQNGtAE=;
 b=AyxXUzuVB/aKAnjnOB3EaiHwdQSRX4Fh0s1CnDEFeIweuwVcWmrc9Jfwvm8/Pw63du
 ubIW23WDTqlYBWgBWLmrS3dh0tlR5ubYx8tetfas8jp4/XQBw4sC+bOYyD9qW0XMYzbn
 NGkiL2vxO/r3w6GQR7fLAADS530AP+fSdEyVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=m0quw2aGpJf6MvAzJItfNSSNg9bXfvHfYmxBsQNGtAE=;
 b=BIoDpBid7Qtn0f+1DAQvUcpCxfycCvopU8Igl5NPjnqogS4Lu51zt0brxRSdYUa6SG
 kcUGFEY/r1x2K87P1khmxUhMyEkBmnWjZzXExixQi935DzZA3sSl8ZY9qhxqZn0GDQ1e
 KVcJbZeHBbcyeJE3mumHhOz4T9xvIqYuKtITS1X44AG4Ld46DMDwBgi0oIUkvBK4Znyv
 stIG39wcgmSaQ9bzOyIQGzZzFvZWu0ZjoQdGhu7mJJyBavXrTXuSwK4cz9EPLfxdjHbQ
 Oqjc5OPDJv8q2LVbj1K0yfVm+ezxZdXV5nl7hSu5aIQvHbS3huqvaFSvR5qEBH2vMQlR
 j3Vg==
X-Gm-Message-State: AOAM5334eV+Qw7YdZk5r5w9IeJGh3kNX7eqEZWMNsKZWqXrySPu59xd6
 4mUuxrAVusW6S86FHTr3rDJZmG+eYM1z8RjUvVH967mCT5lfPl5+fLdMLfPwrXpnva3Lyl5sNZn
 bINV7G0fJz5sXnaO/D69aqKwDHD6D32+S/TQAmodCatgrog==
X-Google-Smtp-Source: ABdhPJzT/sshgRgH7fEU1epeml+Yyn6ZTEalJ72VQIKVRnJBuJI38vLm/c98VbXw5IxEGJU1vz3skfoLPBD73IvWz38=
X-Received: by 2002:a67:f691:: with SMTP id n17mr3373449vso.56.1603835613485; 
 Tue, 27 Oct 2020 14:53:33 -0700 (PDT)
MIME-Version: 1.0
From: Maurice Smulders <maurice.smulders@genevatech.net>
Date: Tue, 27 Oct 2020 15:53:22 -0600
Message-ID: <CACxOKoK+JjjbKg9XAEQgyatq=hOjY6ugc+iyQ3trNipzD7snDQ@mail.gmail.com>
Subject: UBIRENAME failure modes
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_175335_812791_250E434A 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

I know that UBI is built for resilience, but I have a simple question.
This is inside an unserviceable device once deployed, so we have to be
99.99999% sure that it is recoverable in a SHTF case..

volume layout:
- rootfs_0 and 1 : UBIFS
- linux_0 and 1 (raw uboot loadable linux kernel - NO filesystem

when loading a firmware update, the script creates a rootfs_new and
linux_new, and once complete and the code is verified to be correct an
ubirename is executed. The rootfs installation is done in the
alternate volume, so actual running code is not affected.

+ time ubirename /dev/ubi0 linux_1 linux_old_1 rootfs_1 rootfs_old_1
linux_new linux_1 rootfs_new rootfs_1
real    0m 2.32s
user    0m 0.00s
sys     0m 0.69s

How big is the critical window of this rename? 0.69s or (way) less? If
power is lost during this very short 0.69s, what could happen? Is
there any chance of an undefined state, or would either the old or new
config be active?

- Maurice

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
