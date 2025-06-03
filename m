Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B01AC5AD49
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Jun 2025 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skEhtixFZeYA1P1HQaP+BLQXGtnhYL3u+t997+Dz1sQ=; b=ZNtDy65YIgfCtB
	50tikiFLy5sadmUk9OA7/Zbol6d2Gjb5HgAwqxgG2xYvDE1OtsESQIpseetizww0OXF8ya1ZFdtyv
	0qTQXuCQcH9Z5zu6rertY5AyDVTYFoM8XeJ4QeYKt85gm//FyrCQSjkB8ucJ0s3YnrpBInbMju7se
	ePqcmiZcuNlF0wn4cX1cHF+3zLaLlhUpvrsmgIrB6m1FkMVASlPSzY6qntJs7RNObiCTScgpnbPo6
	ePOZ4UbB7Q4/9Vi52GnZCSRGPr6SokOYYSCVhueF07CBkrLBOK4eXJYV+7cAgd/YPvgkdsUvg36Iv
	i49WsktggoVZv8WTGodg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNts-0000000AVZg-3884;
	Tue, 03 Jun 2025 09:25:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNlM-0000000ATSR-2AUn
	for linux-mtd@lists.infradead.org;
	Tue, 03 Jun 2025 09:16:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4fdc27c4aso1658004f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2025 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748942211; x=1749547011; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jh1UYwF4o07fYlh6QkTVYQ9s6WEqHiVdVyiHbQC+v0=;
        b=icot9bGYXXli7LxemaSvbxxKmFvEp0jdSbABYB4lrJI0yBTrXUTJh0dMDi8iYSD5jJ
         vSmSZv7yIj78SL9WQrnK5HCPQd2dxklPq/0m/icCQSdddVTIgyAiIQtFpDudpFbJ+Xg+
         bAPp9RxKX3cKPUBnQqKkqKVTbvJj6Tg0bDpOrZ59+eEaQT+81As0G99pdS+Gays5EgdZ
         576j1vJ3z2Q6Vh7XPn7vdeDNg5E1wqw4EepfOI+P0N82zHbFH01w8jW7GIBU+DufCeVq
         tBgkXoFSdeLEc+r+w/piHSpdnOairQLUV6EvwnMiKbPSYHh6JlJMkE99Q+TXAxQMf845
         0ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748942211; x=1749547011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jh1UYwF4o07fYlh6QkTVYQ9s6WEqHiVdVyiHbQC+v0=;
        b=XZY33ddCz6mCEDwfIyYtQuR+NldY6nR34hMTiCGfX7BHscUdFO3EMIvcGuEPQAdJSI
         bmULgXuCfHzLgLsiwMcCjb14zF/rIB9lOnsojkL1QbY/nM2xJy2N5R6HymCNn6uinUPK
         3hhxY96Y3K5MvSDAFSrmn5BtN7pg3zSL+zpQw2CpCeTfu0aLUX4qQkT2beI1gqOdguAX
         ubNeIewE/8Mp5jVCuUz3HhcD8V+iPEu3hSILRHrf0x/mifXKa4f0L3KKyJSjiYXRHppm
         GkKsyDKMoGuiff59xNFGrfJ3Mihl+b1yk3vOm3qzCPVjnfV6CbO4yVxvR7TgGOQCvKtS
         YYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXSfw+wN/f/3I2ABo16XCK7sNhLpLoIbijskrYl0DEGmbYl0MbtbV7LXKOzVqem+T+09DiW5TkqH2Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiPvOSQrFyrmQFGSMXK6/uxYq4JUafDL4u3lEoIoV/G1Fw5evm
	F18+pqEXQExropRO0lTWCRv49jLk+AazaYU3kdZLqpeHohwYRM8LeSdN
X-Gm-Gg: ASbGncsRYCozwqJlfXaFybD4yS0fNv3xH0d8OGDz8NpkwAQ+L/8RVsMvGpU5BncLVyL
	Z5+TBM50JomBsK2yJ+zPVu12/n+4atlTsKLAitqpbdceiT5ixnDYzvyEsAwkwfx551fToTYp76w
	gsX3qdjjBgTg7v6QKWt+lN8RkRl8lj/1ru17CEbkKKxLX1xkXckYGWNQ5IW752jZJ5sXcXTIAtY
	FH8AkFI6IQBParUJU1Zpie51mk2pa4CNZooMskMwWdLfj67ioyM3l1W5IO2hWjqo7WGoqe1sSod
	xJGS6b198CD1Ztxj02CeqiNdEqpuOHhZQPV1yNRWfXc3o2PzOizT9LNmhgI6UdBP1GeLY2Evl82
	XByb1cCKaDMkgFS19
X-Google-Smtp-Source: AGHT+IE/MmCkDw7zCq3ur3i1vuJxdnSH1+it9qEiuWWWBKHTcyCC908pg1AngYiOBUPTs/E/DeZd6w==
X-Received: by 2002:a05:6000:2407:b0:3a4:e082:c8f4 with SMTP id ffacd0b85a97d-3a4f89e2ec5mr12889553f8f.47.1748942210472;
        Tue, 03 Jun 2025 02:16:50 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8besm17789682f8f.16.2025.06.03.02.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:16:50 -0700 (PDT)
Message-ID: <08ef60a0-b78c-47a8-abb7-2de08303ae4d@gmail.com>
Date: Tue, 3 Jun 2025 11:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: nand: qpic_common: prevent out of bounds
 access of BAM arrays
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mark Brown <broonie@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lakshmi Sowjanya D <quic_laksd@quicinc.com>
References: <20250529-qpic-snand-avoid-mem-corruption-v2-0-2f0d13afc7d2@gmail.com>
 <KuueBg3qliXMt9QN9kV_5_on2xJV-BEWZAsktO_Ce-Fq1iBAPCFypbYUVZxlV4LjF0AUZG57KqiXZZ3uefQrXw==@protonmail.internalid>
 <20250529-qpic-snand-avoid-mem-corruption-v2-2-2f0d13afc7d2@gmail.com>
 <68c54d56-3e44-4f43-8bd6-f6b7fa1f379b@linaro.org>
 <28db650d-a911-4df9-9ad4-f926ea0683e6@gmail.com> <87a56qp7um.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87a56qp7um.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_021652_567149_3BB98E38 
X-CRM114-Status: GOOD (  11.33  )
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

MjAyNS4gMDYuIDAyLiAxNTo1NCBrZWx0ZXrDqXNzZWwsIE1pcXVlbCBSYXluYWwgw61ydGE6Cj4g
Cj4gT24gMzAvMDUvMjAyNSBhdCAxMzowNzozNSArMDIsIEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21h
aWwuY29tPiB3cm90ZToKPiAKPj4gMjAyNS4gMDUuIDMwLiAxMDo1NiBrZWx0ZXrDqXNzZWwsIEJy
eWFuIE8nRG9ub2dodWUgw61ydGE6Cj4+Cj4+IC4uLgo+Pgo+Pj4gVGhpcyBvbmUgZG9lc24ndCBh
cHBseSB0byAtbmV4dAo+Pgo+PiBJdCBpcyBiZWNhdXNlIHRoZSBzZXJpZXMgaXMgYmFzZWQgb24g
dGhlIFNQSSB0cmVlLCBhbmQgLW5leHQgY29udGFpbnMgYW5vdGhlcgo+PiBjaGFuZ2UgZm9yICdk
cml2ZXJzL210ZC9uYW5kL3FwaWNfY29tbW9uLmMnIHdoaWNoIGNvbWVzIGZyb20gdGhlIE1URCB0
cmVlLgo+Pgo+PiBJdCBjYW4gYmUgYXBwbGllZCBieSBzcGVjaWZ5aW5nIHRoZSAnTScgc3dpdGNo
IGZvciBiNCBzaGF6YW0uCj4gCj4gSSBzdWdnZXN0IHlvdSByZWJhc2Ugb24gLXJjMSAod2hlbiBp
dCdzIG91dCkgYW5kIHJlc2VuZCB0byBzaW1wbGlmeQo+IE1hcmsncyBsaWZlLgoKSSB3aWxsIGRv
IHRoYXQsIHRoYW5rcyEKClJlZ2FyZHMsCkdhYm9yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
