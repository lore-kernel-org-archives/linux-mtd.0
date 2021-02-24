Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF5EC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 21:03:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C2F64E60
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 21:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C2F64E60
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0VtzctfAciePlbADJNMUVhjukusYMQR4Rcy2YsnEYXA=; b=rvjcYG5PMiIZw/Kf3Ecp+7zb0
	BlQw+Jftx8jxv/SlGYRMVJlMNbQWhYiJvoOESUC6a8YNrwVYpCUAVk1fcFsPKbg2SQdsz0NSdcbU2
	Ee8yhTbFSKVNQwQ67yHQM3zD06mocmb9+FunEFj81wmTmxGzfyT1Npw8f5y1VRNO8TsAYKgHCs+nn
	jE2RHYUrG7riJI2GBixwP0c2rEHQF2+QXcQnfQQ4oQjFhxUfSYE0vJhEuy1uqKO59D6Q6tcEP1D+L
	L4AGS1wdOi2nm8niupK6NTyFVQmavrJQyX/Ud1Ck8YSfnT9BpE7jY0Lz6bGw0++Sl5x3zeg9uX1gz
	6fRvsVZow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF1Hm-00089t-5V; Wed, 24 Feb 2021 21:01:30 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF1Hj-00089U-LN
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 21:01:28 +0000
Received: by mail-yb1-xb35.google.com with SMTP id l8so3206141ybe.12
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2021 13:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oNOJCv96V2W2oiF3R22dF2MhqbWN/9wIBc5R81MAbG8=;
 b=Oj66rqmFCj1oZG5mcctMLdE8WopD4kxLQzOMCysvpcWagEg/435Upf00UDNpJpepTz
 TKxck5a6VqwGKlDBLhND1QrqqxHD8RHFF8Gzw3SrmKThy/yBtNSowzjAQTDpYGl4XEv1
 ohV/Gt+75AoO7McrARs4e4Foe8DoRodOysovwG23+HRqM/w1UamueJX4gsPdORMeNzDu
 Nw0vCHVdUttZ2u0L3mY/Vze+ZohwTykVT64Fq+J2CFgFI6izKiogt2asRmJFnKzZF2VR
 LQ+cTS+UOCLVxA/QFFTp3Aeg/GySGciOZRwxFvB2TZQJ7mn/tbzCzXUbXU+7UtVR0P3j
 yVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oNOJCv96V2W2oiF3R22dF2MhqbWN/9wIBc5R81MAbG8=;
 b=HSherOZlQKntKNh5zFXcgANPjcYkFF3qpp/j52ufX5ZipjZquahlL5RL4tnXej7qZH
 xj0QGJnOpigjFOaUnZt/WQXy41YAhmDJZHh9codWDoQq8+cgoNfcWqYQPLycROmeAq/7
 Flmeh22SpqUyX71JbU+Fms80BTw5Cr17sy6H2BWTwOG7794vj9O9qEKCV7dK7wBe1atk
 f34A0/eqhHjA1UMR/5VYonR8hwmnezk761AcxHbvT/Hlh2hFhQh/+oy2raS1VVUM4XLI
 s2x9mE3I9kUc1TKP1xxCVL0PR151FPMvDGhCN15+Q08Pj8RnFhFol6VtWsNprYvGhaky
 LarQ==
X-Gm-Message-State: AOAM532lh+4zmTV2/t8JYzfhdw/UnJtw5p43eZL7VBSEouIqNXZ7fbjr
 3GnFE8Fi1bxkTHOceb7Bw3I0IeSQK3RqoVM6zXI=
X-Google-Smtp-Source: ABdhPJykxKsUxsj58MI1Rbl2fvDXH6b809ZrxV1OH6WJSgCBEfcMBAHGNDV8YUTJBoGOX3RnsxoCjOfPLntOJ95q3Kg=
X-Received: by 2002:a25:d94b:: with SMTP id q72mr47291810ybg.135.1614200484280; 
 Wed, 24 Feb 2021 13:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20210222201655.32361-1-noltari@gmail.com>
 <20210224080210.23686-1-noltari@gmail.com>
In-Reply-To: <20210224080210.23686-1-noltari@gmail.com>
From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 24 Feb 2021 13:01:13 -0800
Message-ID: <CAN8TOE_Eg6zYqy8wLtrNcTiCQdcihM7wGM5JHw=bh4=b1CL-_A@mail.gmail.com>
Subject: Re: [PATCH v2] nand: brcmnand: fix OOB R/W with Hamming ECC
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_160127_718865_BD7D601D 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBGZWIgMjQsIDIwMjEgYXQgMTI6MDIgQU0gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFz
Cjxub2x0YXJpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gRml4ZXM6IDI3YzViMTdjZDFiMSAoIm10ZDog
bmFuZDogYWRkIE5BTkQgZHJpdmVyICJsaWJyYXJ5IiBmb3IgQnJvYWRjb20gU1RCIE5BTkQgY29u
dHJvbGxlciIpCgpGV0lXLCBJIGNvdWxkIGJlbGlldmUgdGhpcyB3YXMgYnJva2VuLiBXZSB3ZXJl
bid0IHRlc3RpbmcgSGFtbWluZyBFQ0MKKG5vciBKRkZTMikgYXQgdGhlIHRpbWUsIHNvIGl0IGNv
dWxkIGVhc2lseSBoYXZlIG9idmlvdXMgYnVncyBsaWtlCnRoaXMuCgpBbmQgc2luY2UgSSBnb3Qg
dGhpcyBmYXIsIGFuZCBJJ20gc3RpbGwgaW4gTUFJTlRBSU5FUlMsIEkgZ3Vlc3M6CgpBY2tlZC1i
eTogQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
