Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F17EE14D0
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Sep 2023 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIG46Za6Br++zhw85YV0u/HwfUpdXy7z63Eu2ig1jko=; b=3wM+2FzMovUUcY
	lcausZ8PWaMnd7AEVTMw42FudV7xWXbh/mpmDZub5Pg95HDHVfA1sT4+Wzl/x/wAgubQAVRm4dk/K
	+jJdve/J+Eak+wmImnF3x42F0Tdcle8eB5ECcWTgcOZ8FtTHXektVI59Dx1ZLB6+q8GMkM3G28ggO
	wFZqfaQSOc2Dc5zXI4fM4C6kd3nPpUugH4tPBN5gH3j/YFMwROEyws72mT97Kvl8S09FkUpVyamVr
	c5wufm+iKBKi5p9hsmNbg/uYhZsSdIrglwQcQzk2huLyhG1f3aW0Ii4t7ZUHHSaYQ8PhQyOSMTWuO
	wNDLattHA9o+ZL6TKDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBaR-00Bi6C-2K;
	Thu, 07 Sep 2023 09:46:07 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBaP-00Bi5D-0R
	for linux-mtd@lists.infradead.org;
	Thu, 07 Sep 2023 09:46:06 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso5610191fa.0
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694079962; x=1694684762; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvypY1QvOnO1QpwUl4niGa+iAzfXQOe8HmG4CVoVLg4=;
        b=tntLxhAz3NbqSgvYGnAZvwhoonSmBPjIIcdCMSPk/jWFL079t2as8PeAPilW7tIkZ4
         tONlc4wMw6zx49qC36BIopzCmzjXeUNsRmIwylNlepg1UVxlI5uDeD3Ym5vjvzqJeRGC
         /ZkHd2CmWY0h604qxtmP8Vutr/KHuQPJeF/otYswB7xRVRdGZRt1xezJK30QEMgATJh5
         KOWRq9tW4fIclr9B4sBGEL5yaVJy5IgKX+C1kXt92LJX2SnhZpl/KGP12KpJtel8B11U
         tra8nh6HpGDK1p0Q1yKSWvgts2GhYHze53FWVE6XPRRWIUi2fhnw5JHcDtWR7w8LQMlQ
         nSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694079962; x=1694684762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvypY1QvOnO1QpwUl4niGa+iAzfXQOe8HmG4CVoVLg4=;
        b=a28Il7N3updHheN5YidBOV7DhnWMSARsLmRBcpJwxl5cTVoAuJLhydU8Xe5Ns/rIMR
         0vlXvfGRydcI6+gGINif7V2le3hnm/EXGk0+DsAs+Bvz00io8XmzJatM6dcC/Z4EM1fZ
         DcZE5U0E6ysMwiw6GKoVeGpBNQ6iY49NOQOkK9cp3Kdx1/gAtX3yDJZ3xnc76JbFUOgp
         gYfpJjWjgeaWeercmPiTqJmBYuZBh9njXquw4bX6vHNYSM8AwFXvPdPUr0n0LeO+fz0I
         130JeY3uaK8579S5WvmkfHXqVgvzSCVSQEOpSrfXaPcvNLfz2hUyQwqXS5Lt4QIEmvm9
         GDbg==
X-Gm-Message-State: AOJu0Yw+r5Y7/CqtMLBHj5Ubm1EAsbP35xsJtrQLlc6n2+4hLbv3zfUe
	3vWsJpIa+6Lputzmvn9W1cB1ow==
X-Google-Smtp-Source: AGHT+IGva/E5JZtevG6ujo6b6PECKPAbrIbpmfBsxECwWywCO2LQ9gYoz4P3195aEYeblt4HJCGTvw==
X-Received: by 2002:a05:651c:21b:b0:2b9:e230:25ce with SMTP id y27-20020a05651c021b00b002b9e23025cemr4389569ljn.12.1694079961945;
        Thu, 07 Sep 2023 02:46:01 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.137])
        by smtp.gmail.com with ESMTPSA id f8-20020a1709067f8800b009a1a5a7ebacsm9991110ejr.201.2023.09.07.02.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 02:46:01 -0700 (PDT)
Message-ID: <f9e60fe4-b7aa-4a13-b1b9-f4d3d429eb62@linaro.org>
Date: Thu, 7 Sep 2023 10:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/41] mtd: spi-nor: atmel: convert flash_info to new
 format
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-17-291a0f39f8d8@kernel.org>
 <aba618e2-ad74-d716-c8d7-e77588b22509@linaro.org>
 <4a25955300a53a36a842f4e8bd3a2e1a@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <4a25955300a53a36a842f4e8bd3a2e1a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_024605_193704_D72B551A 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA5LzcvMjMgMDk6MTMsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiArwqDCoMKgIHsKPj4+
ICvCoMKgwqDCoMKgwqDCoCAuaWQgPSBTTk9SX0lEKDB4MWYsIDB4NjYsIDB4MDEpLAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC5uYW1lID0gImF0MjVmczAxMCIsCj4+Cj4+IG5pdHBpY2ssIHdlIHNoYWxs
IHJlc3BlY3QgdGhlIG9yZGVyIG9mIHRoZSBtZW1iZXJzIGRlY2xhcmVkIGluCj4+IGZsYXNoX2lu
Zm8gc3RydWN0Lgo+IAo+IEFzIG1lbnRpb25lZCBpbiBteSBmaXJzdCByZXBseSwgeW91J3JlIGZp
bmUgd2l0aCBrZWVwaW5nIHRoZSBpZAo+IGZpcnN0PyBBZnRlciB0aGlzIHNlcmllcywgd2UgY2Fu
IHN3YXAgdGhlIG5hbWUgYW5kIGlkIG1lbWJlcnMgaW4KPiBzdHJ1Y3QgZmxhc2hfaW5mby4KPiAK
PiBGb3IgYWxsIHRoZSBvdGhlciBtZW1iZXJzLCB0aGV5IHNob3VsZCBiZSB1c2VkIGNvbnNpc3Rl
bnRseS4gU28KPiB3ZSBjb3VsZCBhbHNvIHN3YXAgdGhlIG1lbWJlcnMgaW4gZmxhc2hfaW5mby4K
CkknbSBvaywgc291bmRzIGdvb2QuCj4gCj4+IEFuZCBJJ2xsIGxldCB5b3UgZG91YmxlIGNoZWNr
IGlmIHRoZSBjb252ZXJzaW9uIGlzIGFjY3VyYXRlIDpELgo+Pgo+PiBSZXZpZXdlZC1ieTogVHVk
b3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgo+IAo+IFNvIEknbGwgY29udmVy
dCB0aGF0IG9uZSBpbiBhbiBBY2tlZC1ieTogZm9yIGFsbCB0aGUgY29udmVyc2lvbgo+IHBhdGNo
ZXM/Cj4gCgpObywgSSdsbCBhZGQgdGhlbSBhZnRlcndhcmRzLCBJJ2QgbGlrZSB0byBjaGVjayB3
aGF0IEkgc2tpcHBlZCBvbiBmaXJzdApyZXZpZXcuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
