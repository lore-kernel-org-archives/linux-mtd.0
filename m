Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01408C4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AACrqFwOmluikGhw3OHN4xJ8tHLwL2UQ6rcnGvPJrw=; b=nxJ58kDZAYA4qp
	4yfrcSvavYq6CerBnakICdnfbwg4ztxCtPwypLUIAFGUSG83olJXRB7NYK6W/TXGp+1iDULQE5q+2
	4F6PJ6ZhqJ4Mjmr4wVFLTNjmP0EWl+jkFk8TATdvrFn725SeUQ+4b0rlRiuxDFOxc16tAcQHqtGgz
	iwjdkO0tmwWIlY7Qzq1bKtjAXTJjPHSluSf9y9VSJtq9bSH5WZApFa33Faxp/d1rw9vbD19xbqhnO
	3EyosOn1qpru6Smz50utnKwIOqMUKopPSp/tbF2wVy+hoWrtQyDmtOLzzuJGKCIoWn24Wl/0ie+hk
	7fTH8haAJ+X6tT7JIfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGYf-002ohr-2u;
	Fri, 12 Jan 2024 12:22:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOGYb-002ogO-0H
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 12:22:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40e68d836bcso1274975e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Jan 2024 04:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705062141; x=1705666941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtlU36uyfmVOSAoFzZu2ZVc5JD+SszGLOhYaPwWBHmg=;
        b=ewYXx1oaupCg+MSTuIP8zTIiRi3vQoIOh7x3V7xr0D8Kyv7JB6ClOdzW9vtEnqfBzQ
         8Sv7geGpXY0a4CH7wI+0sD0uXjht/L6Cf96gpauKCt6kCOSW/bUv08aA5tvDDDfbD0FW
         YStjjoBJPjwRQ4aKk9/rTCB4JdGElt7ivdXTOFZ2RwK+NKW+sW8nmW3Hqx7Ym7rob352
         Swsd7S9JwMDSzvaIui7nH9vm32dgkjuYEGsw8G5WDz2M75sKFYJ3GBvcs6m1+pV5J8W1
         4Q6HqrtOXj2UlQZ+cnOl1bSsy8iyqa4mqqilru5y+sk9imKgSVWNcM8XX5RIAuxr2kvQ
         0Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705062141; x=1705666941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtlU36uyfmVOSAoFzZu2ZVc5JD+SszGLOhYaPwWBHmg=;
        b=ewyH5aLUKJTin5GO5hPjPi/J1ydK7mQKhto5Er5780Lsnr31oeUvhvoBdc9I5ZAPtG
         XO4kpH7VjBIeXo3dkv/0sGtM4Q6BS7TY4uETIMfJNgFNQ1L/HWMt1/iYHrLbeUeCLrVU
         ey56jnE/LTdjx/UsR5LmtASh4p7ar67FSUyYUtIpsL6fLp34H+j4bi2W5J09lL1bJdzn
         xgXFVHlCYugfKCsS46CE01d2mkGFvHxWFYYMOYdMqsJxbYM5TXhf2pFLqq6L4jd/KiRa
         UGjY1tlDc9iWT3p1JyIKIWqqKMyJZSFDaoOO1d3XRh9W4md6Nx2Se2jtT46LS36QIgf0
         swOQ==
X-Gm-Message-State: AOJu0YzDanIGHxsiw+9qPnOEUaaOv/HgwQTk4mzwIdSsVim4JSS5WP9q
	OSbEbGHoSCkN2akctcV8yuT+4dUG+o/ybk0ky89zzHPW4G4=
X-Google-Smtp-Source: AGHT+IHyTQ+nOcaMSWyZtQjR4Y38UdBmi111o7zarWN+kuU8bZ12GrVpAGktiIJRWwtalceiv1rEmQ==
X-Received: by 2002:a05:600c:154f:b0:40e:5423:966b with SMTP id f15-20020a05600c154f00b0040e5423966bmr718142wmg.95.1705062140982;
        Fri, 12 Jan 2024 04:22:20 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c4fc800b0040e549c77a1sm9530967wmq.32.2024.01.12.04.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 04:22:20 -0800 (PST)
Message-ID: <97c11a15-210b-4dff-a046-bb2873062282@linaro.org>
Date: Fri, 12 Jan 2024 12:22:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: tkuw584924@gmail.com, linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <bb98a601-5c76-4273-820e-2b1c9b449820@linaro.org>
 <2e781c2efd663fea6d4a75fac36f144a@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2e781c2efd663fea6d4a75fac36f144a@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_042241_146394_3191335E 
X-CRM114-Status: GOOD (  16.92  )
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

CgpPbiAxLzEyLzI0IDEyOjAxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4gK8KgwqDCoCBzdHJ1
Y3QgbXRkX2VyYXNlX3JlZ2lvbl9pbmZvICptdGRfcmVnaW9uOwo+Pj4gK8KgwqDCoCB1MzIgZXJh
c2Vfc2l6ZTsKPj4+ICvCoMKgwqAgdTggZXJhc2VfbWFzazsKPj4KPj4gcHV0IHRoZSB1OCBsYXN0
IHRvIGF2b2lkIHN0YWNrIHBhZGRpbmcKPiAKPiBJIGRvbid0IHRoaW5rIHRoYXQgaXMgYSB0aGlu
Zy4gRXZlbiBpZiBpdCB3ZXJlLCBpdCBtaWdodCBjbGFzaAo+IHdpdGggdGhlIFJDVC4KClJDVCBh
cyBpbiByZXZlcnNlIENocmlzdG1hcyB0cmVlPyBpZiB3ZSBwdXQgdTggYXQgdGhlIGVuZCB3ZSds
bCByZXNwZWN0ClJDVCBhbmQgd2l0aG91dCBwYWRkaW5nIGhvbGVzIGluIHRoZSBzdGFjay4KCj4g
Cj4gSSBjb3VsZG4ndCBmaW5kIGFueXRoaW5nIGFib3V0IGhvdyBhdXRvbWF0aWMgdmFyaWFibGVz
IGFyZSBwbGFjZWQKPiBpbiBtZW1vcnkuIEknZCBzYXkgaXRzIG5vdCBzcGVjaWZpZWQgaW4gdGhl
IHN0YW5kYXJkIGFuZCB0aGUgY29tcGlsZXIKPiBpcyBmcmVlIHRvIGRvIG9wdGltaXphdGlvbnMg
aGVyZSBvciBqdXN0IGtlZXAgdGhlIGNvbnRlbnRzIGluCj4gcmVnaXN0ZXJzICg/ISkuCj4gCgpJ
IGNhbid0IHRlbGwuCgo+IEFueSBzdHl0bGUgcmVjb21tZW5kYXRpb25zIGZvciBzcGktbm9yPyBJ
IHByZWZlciBSQ1QsIGJ1dCBpZiB3ZSB3YW50Cj4gdG8gc2F5IGRlY2xhcmF0aW9uIG9yZGVyIGRv
ZXNuJ3QgbWF0dGVyLCBJJ20gZmluZSB3aXRoIHRoYXQgdG9vLgoKUkNUIG9yIENUIHdpdGggc3Rh
Y2sgcGFkZGluZyBpbiBtaW5kIDopLiBCdXQgdGhhdCdzIGp1c3QgY29tbW9uIHNlbnNlLCBJCmd1
ZXNzLgoKPiAKPj4+ICsKPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgIXNwaV9ub3JfcmVnaW9uX2lz
X2xhc3QoJnJlZ2lvbltpXSk7IGkrKykKPj4+ICvCoMKgwqDCoMKgwqDCoCA7Cj4+PiArCj4+PiAr
wqDCoMKgIG5fcmVnaW9ucyA9IGkgKyAxOwo+Pgo+PiBhbGwgdGhpcyBqdXN0IHRvIGdldCB0aGUg
bnVtYmVyIG9mIHJlZ2lvbnM/IGhvdyBhYm91dCBzYXZpbmcgdGhlIG51bWJlcgo+PiBvZiByZWdp
b25zIHNvbWV3aGVyZSBhbmQgdXNlIGl0IGV2ZXJ5d2hlcmU/Cj4gCj4gVGhpcyB3aG9sZSByZWdp
b24gdGhpbmcgc2hvdWxkIGJlIHJld3JpdHRlbiB0byBub3Qgc3RvcmUgdGhlc2UgbWFnaWMKPiBi
aXRzIGluIHRoZSBvZmZzZXQuCj4gCgp5ZWFoLCBwcm9iYWJseS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
