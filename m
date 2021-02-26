Return-Path: <SRS0=yHHw=H4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F04AC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Feb 2021 15:58:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A645664EE7
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Feb 2021 15:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A645664EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WESyGM8q1WeCjjX7XsDxCV1S8IoGr4/IEbfIEWZW6N0=; b=GHlA5RsKFTgUIGCOxR0JtpFfCZ
	U23K/UneVHdKkS4XpNDOQdCQfWFEEEvtmikEMQ407GExmku57bdwur43yAfHC7acC/CtVufegMTsz
	G4rBtfKu0a1URLWoo15bHBAJih7v7rPhQZQ844atvBhybeZ7F5j0x1gzOjLge8WGhL9/E62k3o9MG
	dCfh4MuFbQy/WAB/YR8epgiUjV+XY1+J/h46+ioqix9OKRe+ND4zvrgajwGHuFxeFbKN5guLrUmGX
	UFdOp/3bNNT5iBSppZufw9dc5ZM7Al6PXtle2Gr+MIFYKTHCxl/qjMeI5aCMyWCX4cxq0LQivXMpa
	J2S1ONww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFfUo-0007cz-VN; Fri, 26 Feb 2021 15:57:38 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFfUm-0007cP-Ss
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2021 15:57:37 +0000
Received: by mail-ot1-x332.google.com with SMTP id b16so9507557otq.1
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2021 07:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=a9auBE5oaJ34tYPM6c7yGkElPdNLKhg8U0XidX9ywd4=;
 b=qGdiz43S7OSfu7mtRPyCXjNWx2NYGpqPRrKBYedI206Vp+fXLdEsSptKdythVhVwO8
 54sCauhVOsyN8VZELTjEbV9SnmVB7IQpJOycEYDj1XRuS2dLFRgPSdRC+w3Kp21UP2Hk
 qeVLpE091yrcMSt2jh9Mq+Z2QmJNyyiRfsh7xKo4XAMZkEuxuH7MUw2+RcX0UbqVKY3n
 voA+0Ip+gvKg4OZsikW3HibfLlI6FUX2JSqJAclBi7MRgbUmV/S0RcjUNO75xCogPOjv
 qgzbAfkgyHtsFRT+YL/JAtoxwxeS5155if4YLaQ0VeD/aSybl5OmuvBbbPERxFcOxu9j
 UCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=a9auBE5oaJ34tYPM6c7yGkElPdNLKhg8U0XidX9ywd4=;
 b=pOZyb5jud3drfbqOGkrGtJhGvRojuSdFt3sFAlJwpYKMZ9gl4Vs4u01GV8ssUS0IRZ
 huWeSCPH7yu0wIW9+qVRcm4hD9LGEcAbXNFhbxMJ+2faC/shEubcuJ86+pERqnHW3yDZ
 4D90R2akY1pZGhfkd/+y8aRQBi6wGD5dNyf4twAkBk6zMieLBIZtp5gqRGKpZYKd29qq
 B4y60BFvxaM+SbILDIL6avImqVemsuWSozCCFW55MVeUAOYlXXw6QlbxAratxN/ciPm3
 qB7YnWJFG0DxeVcS0vQlzxXnih67MzlIjrANHyuiU1AZYYqM0H2ptvDrrm/AFEkTfE+x
 R89w==
X-Gm-Message-State: AOAM531DTcPreqveSVN4mlQ8mQJCWtjYZ8DJh6YpSl/UVkxsgXpX/QXQ
 OD+cvbrn1YSXqCLjggTrSb6H2AWDt7/He/zCT3hjv3UboKU=
X-Google-Smtp-Source: ABdhPJx5nWosP3395iq/2YnGwuRz3WwKC4zkTlzKpPGfZAnLDLxUMwa8QoKCIZXyVsjQ/3BV7xWWY77a8B9UeUNbuV0=
X-Received: by 2002:a9d:77c6:: with SMTP id w6mr2744835otl.179.1614355055004; 
 Fri, 26 Feb 2021 07:57:35 -0800 (PST)
MIME-Version: 1.0
From: Alexander Bykov <kozyavk@gmail.com>
Date: Fri, 26 Feb 2021 18:57:24 +0300
Message-ID: <CAH+riKsGjQ5wyehExguAq2tY21jqCi3MhXYg3PNRL-n5tTJUdw@mail.gmail.com>
Subject: MTD partition size limit
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_105736_982751_C938B1BA 
X-CRM114-Status: GOOD (  12.32  )
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

Hi.
Do I understand correctly that If I want to use MTD/UBI/UBIFS on a raw
NAND device I must partition it in chunks of less than 2GB each?
I'm trying to install the latest linux kernel on an old Allwinner A10
tablet which has 8GB NAND attached.

erase_flash works.

ubiformat fails with
libmtd: error!: cannot seek mtd1 to offset -2147483648

ubiattach fails with error 22 (Invalid argument)

I spent a couple of days trying to figure it out by googling around
but I couldn't.
There are  topics on your mailing list which suggest that there was
such a limitation a decade ago.
https://linux-mtd.infradead.narkive.com/FZMzDabu/partition-size-limit-of-ubifs
https://linux-mtd.infradead.narkive.com/zoKaKZMU/3gb-limit-2-gb-limit
But on the other hand I couldn't find other information about MTD/UBI
size limitations on your site or on the Internet. And there are a
couple of examples where 4GB partitions were suggested:
https://linux-sunxi.org/Mainline_NAND_Howto#Define_NAND_partitions_in_DTS
https://groups.google.com/g/linux-sunxi/c/PxMmiCe0Deg?pli=1

Before this attempt to install a modern OS I'd been using a prebuilt
Debian server image made by the other person.
It uses 3.4-3.6 kernel with MTD driver from Allwinner (AFAIK). This
driver exposes only the block interface to the NANAD device but it
works just fine. This tablet has been doing his little work at my home
24/7 for the last 5 or so years without a single (noticeable) FS
failure.
I don't know, maybe it uses some FTL inside?
Now, with a modern kernel and new MTD driver I can't use a simple
block device because it has four bad blocks and mkfs.ext4 just fails
to format it.

Thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
