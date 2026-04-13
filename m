Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC25EBFD01
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 06:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h7wnt024nwsHnp7RZx4S22H2EBx/TzcfQ7lhv9JuSo=; b=1RZKiMcN3L/HSh0i0eXUmn7uEh
	AJfrjsEqtrEDF+njPjkA8OQ0Uyu69CX2CsuBLBUuFWP3WGcja7lbmp99eNJlEKnQwgqYFGxU5PmMA
	x91n0/lkK8jQzoDPTNQlD0C2pqJtGM1NOFTi5Bu2mN4YYtVskcC9fvmRtsErc21K0Qhv2Yu2JyPdW
	4tGw5umyzulC4rURulwPQrkpE7JguIW+3NUzSGWJiZA0urJnPLH+5wPj2HvaCFIMV0eeLRwsRWhGD
	CdW+2u2FwgcOT4hJXwP9pVN5cNSWRylMVi1J87Yc61ivr1hIEnXBLr625KA7h8qKaegHh89haMxTz
	94Qy4Z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAiu-0000000F4Zf-1ngi;
	Mon, 13 Apr 2026 06:24:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAir-0000000F4Z6-29qB
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 06:24:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-48374014a77so56280175e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 23:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776061475; x=1776666275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=68rztNcaSqWy06z6jMLcJ0QzbRTa9AwIyCbs9lpmxq0=;
        b=kb6wCxnsL/zfPSdSuo2K6WRXJ+vdjmsifAFvdtA+GzpYUfUQdmHonSrRRnwWZaZnO9
         6WlmnTuvahO8ntxgSEoifVQgjMO9uF4ClG4jWtijQ4K0wEXjT6VNwxAGlhNCzt+f6Mex
         avJyzDwfSW+nQeHQz0gT5bO8r535FLa/Odk95ze2jDKVhbe7NSCq+zsGuiPOnJj6kEas
         B/8jdPVNfnVuxoTK/e5BfeBty/K2ORDONCJMfW/egiVZuQ4rHNr77838eodJFYcMa+Y0
         vsT9zQq2yc7bA3eWeBTFWwoV7pdjPe2/qoVC9QWasAtlNr4bSr5+JpwYh5QjZuXr4/PN
         KmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061475; x=1776666275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=68rztNcaSqWy06z6jMLcJ0QzbRTa9AwIyCbs9lpmxq0=;
        b=F/ish/fUZkXiffQHaGJXtB3+bpf5mKpdpVHvtkaWTGIzhu/EWsRsCDC+I7XDTnh5xl
         VWHEKCHZxLFGp+s/WKUENlYejporx8KJokVvH9rxW2uWOdbOTElG8Gm6INt/hJH9rbvX
         ad1crA2DcBifxWccr169C+vsSp34E10zEPEGeX3kNUg+FKt3BCfpnbvF1byG17SpUpSJ
         a8H8ZMxj5HTXQLAx1cj8tgDrnsU5XVvu9KLXXZPWVevQTsad43HabprSssopN0egd6gq
         fNstPRp2OstqrycAE0IqsGv+er/sBXWyAFUvbJD0MhjA+NMEo1r5dQoj+OaVg9EK4YrR
         MZVg==
X-Forwarded-Encrypted: i=1; AFNElJ/NZxR839ZpM7rz90nG3OFYsDlVYxz8pJFDpRZ8f/0hkAubDv+NzG10ldarL8S00oWxYwP1gVTh51E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxls2Vp52UUCN5yaccvKtPGEC5PUsDPwupp2ExJRbSVIA9AU05S
	xkLLXil9PvN/vWLFnCEYYWY9tFMQ0hZ3fIk7aPPo4+yvuK34BvnEZBbGk2Yc646c9eA=
X-Gm-Gg: AeBDievAHi3LVx3Z01/pV4FndlsceQQ8P5rtJf7e4W/MF6TPlD1oPfY3kF1gpLezTWY
	oWOoKGiZOFqVg0QTe1/b5TaWUDUK+AZw0i4lt3q7KmmXppToEL2+jb5ssegPH4PqWxlWKcqrxMA
	0/emn52mnEVl78qppHtkvY4Awt2nQvyKJ+LbasoWkI9QUNkVPlODuQEW1YCYW0kazqoRsekf814
	EU0YtorVcNeFi1sKRyhgIULRpklpUX63KljCnNOnQDZJay/pOriIUeGkpNME07U/5+PEGPK+bwS
	xbO/zVHXYAch5nD8xOk6/o/pM3xweWIaTZbo+kk9JS/4n0gHL9F7r33fXRahjGb5fHmgXQtBqK+
	s4K13yrNh7j/4+0F0tRrNISLMSiJ3s5dbdS3L4TeIp1AL0UTv01lLG2roh1AZWJfoc2OmVTSFyK
	z9FuTgG5CFviLyzEIAZtypJLmK81729Tpr9SW1qY/9TuEIVsge2Mi8mAIY
X-Received: by 2002:a05:600c:820b:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488d685b878mr164492595e9.18.1776061475505;
        Sun, 12 Apr 2026 23:24:35 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d688da2csm90017425e9.34.2026.04.12.23.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 23:24:35 -0700 (PDT)
Message-ID: <9143c346-5716-41ba-be38-bb533b0996a7@sigma-star.at>
Date: Mon, 13 Apr 2026 08:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nftl_format: prevent unsigned underflow in INFTL virtual
 unit calculation
To: Anton Moryakov <ant.v.moryakov@gmail.com>, linux-mtd@lists.infradead.org
References: <20260127123100.47486-1-ant.v.moryakov@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260127123100.47486-1-ant.v.moryakov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_232437_567732_9703ADEC 
X-CRM114-Status: UNSURE (   7.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 1/27/26 1:31 PM, Anton Moryakov wrote:
> @@ -371,6 +371,8 @@ int main(int argc, char **argv)
>   		maxzones = meminfo.size / meminfo.erasesize;
>   		pezstart = startofs / meminfo.erasesize + 1;
>   		pezend = startofs / meminfo.erasesize + ezones - 1;
> +		if (ezones < 2)
> +   			exit(EXIT_FAILURE);
>   		numvunits = (ezones - 2) * PERCENTUSED / 100;
>   		for (ezone = pezstart; ezone < maxzones; ezone++) {
>   			if (BadUnitTable[ezone] != ZONE_GOOD) {

I think at the very least we should produce some sort of error message
if this is triggered. Maybe a simple `assert(ezones >= 2)` should be
preferred here?

Greetings,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
