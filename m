Return-Path: <SRS0=mbSa=ZF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33340C17447
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 08:05:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0691B214E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2019 08:05:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A2WMiG+z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=valeo.com header.i=@valeo.com header.b="rgDZNrrH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0691B214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=valeo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=I+KuRjbneY4nzQwLcp9s3rXH00/zn3mp/9Zo45OlaZg=; b=A2W
	MiG+zXamO37Wdp97G0zjbvul+Z7rZME1VmeTIJ3Z6NLsBTMMes80GqiNayEF++aIpQGEoINGIAhQn
	Sw7iK8li2nK0qhM9GLXoyRq8iX2sdn8MJAQca+7pxTJY/MAkQXpi/B2gqmH4NE3eVW1H/sjE6FkWj
	ZQPj39yT2Pw29czA5DmIGFn3fRKOocZaTTUiS2911m5qbgBTMKFhRJ67zFfqL0vkbMyHhjjPGbNB1
	+WY4eL8COE2qbRLf1BmSvJmxiTWc3U2xBU9SVUL1D80Sc++KAz2zyJbQjhlQFMBUQGA1dV8yIr5Mm
	DHDa3ViytVyMqELpcUL3br2NZ3sIsQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUne9-0004Pu-BH; Wed, 13 Nov 2019 08:05:01 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUne5-0004P1-PT
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2019 08:04:59 +0000
Received: by mail-io1-xd2e.google.com with SMTP id j20so1487187ioo.11
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2019 00:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valeo.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=sjKMRCVyVAnRr84HCR20VLI1DBXWihFShpnoVfAYoQs=;
 b=rgDZNrrH9nfx02vvI2T86qoTwo87W78vyuhS4A+Q1/lbS+1BpKz2rLtZPkss+7FIch
 Q1I4PrY36CzjVg810dMpWVTLa0F5xIyojMBfUzDx6bXptXhOjG0vS64fUp42FN9KshJ/
 8XhlGwEvNzDsfM5b93D8X07NPVXMe5WFFB0DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sjKMRCVyVAnRr84HCR20VLI1DBXWihFShpnoVfAYoQs=;
 b=DPzek29hiNs7J2xCn5DcLZmiEmUoPZG4+Yq9p2g4R/GKAWFvy6aL14pNh2jzMebJgo
 djRlvNgCG4Rn3OADVdz4PcnEE66WiiTXaTRXJxw7+K6QarmW0/2Edg/g6V877bHtEaon
 sYGGDVL8WWc1LIXX1ePv10RHWKraolU4zZH/EEZtCOQ5XFcSyJubI+6FJwJs2UgAqpM5
 mWE5PqbEjMJSYi1vr0N25sCB9J3wlk+7XWYvkVkYUHpUIfSC7pAnGt/GZnBx/Yqmlzrb
 O7tQuOxcnHLmUGh1aUvt0+hzFLEfQDBT9R1vg4LhCHFLRVAoPXlcPixZooV6i1lvoiSv
 0lZg==
X-Gm-Message-State: APjAAAUzO7XmBYk/qNoHZ5l1Xd8tEUFriliQbvguBYALlp+2kB7bB2vC
 ZKpxnY0FzLl1Xzu3tMCAxQJoLJHuVGxHw9JgzeVUOXj2TIohUBqLxo9xMdEuSLZFLizSeRUeP7b
 FvC5ZPpQTbkMHO6Cy5G2qkxyOoX74O1dJvSSR5o9fJg==
X-Google-Smtp-Source: APXvYqx2TRqwtc03pwmFFsaueLDqP00QaPB4Dgu85p3i5uUEdXZPJFUiKIgyIzuCwcUJOgmGTcMDgze0h+zEFD5lGTA=
X-Received: by 2002:a05:6638:2b1:: with SMTP id
 d17mr1797458jaq.3.1573632294108; 
 Wed, 13 Nov 2019 00:04:54 -0800 (PST)
MIME-Version: 1.0
From: Balachandra KUMAR <balachandra.kumar.ext@valeo.com>
Date: Wed, 13 Nov 2019 09:04:43 +0100
Message-ID: <CAAHdpOcJcq2spnM9f=9BoycG8oyhw0ufjzF3BemMY2aNFt+5cw@mail.gmail.com>
Subject: ubi corrupted list not counted as bad block
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_000457_987060_529644CF 
X-CRM114-Status: UNSURE (   5.72  )
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

Hi MTD Experts,

 I am hitting the below problem :
UBI assert failed in ubi_wl_init at line 1632
-> ubi_assert(ubi->good_peb_count == found_pebs);

The issue is because, in the scan_peb( ) , a specific PEB is found to
be corrupted in the volume header CRC calculation which is a
UBI_IO_BAD_HDR error.

Later in scan_peb ( ), my target hits the else part saying its an
unexpected corruption.
[attach.c]
else if (!err)
                        /* This corruption is caused by a power cut */
                        err = add_to_list(ai, pnum, UBI_UNKNOWN,
                                          UBI_UNKNOWN, ec, 1, &ai->erase);
                else {
                        /* This is an unexpected corruption */
                       err = add_corrupted(ai, pnum, ec);
                 }

The count of good peb is done as below :
/* code snippet in attach.c */
   ubi->bad_peb_count = ai->bad_peb_count; (this is 0 in my case)
   ubi->good_peb_count = ubi->peb_count - ubi->bad_peb_count;
(total_peb_count(3464) - 0 = 3464) but what about the corrupted one?
   ubi->corr_peb_count = ai->corr_peb_count;   (this is 1)

Why is
good_peb_count = peb_count - bad_peb_count ? (why not minus
corrupt_peb_count or add it to erase list?)

in the ubi_wl_init ( ) , the found_pebs is calculated from erase list
and free list and we skip the corrupted peb list. But the good_count
cotains the corrupted count as well.
So , i hit this problem ->
  ubi_assert(ubi->good_peb_count == found_pebs);

What is the logic behind this good_peb_count?

Thanks
bala

-- 
*This e-mail message is intended for the internal use of the intended 
recipient(s) only.
The information contained herein is 
confidential/privileged. Its disclosure or reproduction is strictly 
prohibited.
If you are not the intended recipient, please inform the sender 
immediately, do not disclose it internally or to third parties and destroy 
it.

In the course of our business relationship and for business purposes 
only, Valeo may need to process some of your personal data. 
For more 
information, please refer to the Valeo Data Protection Statement and 
Privacy notice available on Valeo.com 
<https://www.valeo.com/en/ethics-and-compliance/#principes>*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
