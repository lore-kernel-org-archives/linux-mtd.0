Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CB4C36001
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdrJwE6M2PxdIw1sqLkxyxhMesKM/Ro3FQkDVUINDlU=; b=BDmoPoSgQ/2Tqv
	W74682dQF5rsop0SoQu9PuH9pfGCBS6Idv48TI7k4FFd0TlKtQiL2DUR7Z9D8XpVGNvGFZvcFOuux
	O4Wb468RFKc4t5KR53bmecQoCLYcL2HVh1Y8I+mDvOpoX8+ovx/gIxmU3sQhbnAB9kzpm6KYh5QYH
	OeCLLmH2wnOMdb2UYBH7kjMlBI3tGxoncrw589l7b+yGu3HHmyiqh56ae1J/CCYUzlv+vpf9GxOVh
	ivQ1+ctuBUGehxR06uq2q7nmSu3XCmbv09iVfcG8BDb9jRf4KreesxfMgFz3yHAPW0LWE8/QQiyVw
	rLT3dHwlwsLgsHW2dx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvIMH-0000000Cc2s-3qAj;
	Thu, 20 Mar 2025 16:03:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvI5c-0000000CZbc-2I6C
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 15:45:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3912c09be7dso625914f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742485547; x=1743090347; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrf584PxMsH6/Jh6HwYl2KNT4s5oL8tjFSmMaaJHl78=;
        b=QQh3CY3YuX9QGpJLKLwFx2YEzojIbl4gOPoAfD5/HJcfL/uEHd9wfrLdOrT4/J+7q+
         Q7E/+Eou40gmbm+YjtNxDU+1lShvYInnYxrC3OKLnnckbL4WiXtIyoEn/3uuA7zB0+Yt
         m/mubHHHTTx1NxTBu+N35jZgXN0cwX+0fJFfIxMDFq/kLoktfSBwf3mdz8jbavLLmZaN
         Ddosz9Jf8vgc2ZsSx9r6Yc+/oPPV7gX5fpyRREPM7kDUxyz64gSVV74knqjqnFmeydal
         vRiWkOUYFAPb68Hk732BqVEQWqUhTegBI9suATV/h/urQl9DmFCJq5JoGFVw+63mn/b0
         o14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485547; x=1743090347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrf584PxMsH6/Jh6HwYl2KNT4s5oL8tjFSmMaaJHl78=;
        b=rUlz8TEWjWXF5TzJGrOep4bt4n1y3RC0ixCh8vngQk0LRND2YgXNqMdel1+IO+OzQB
         oUwtKJntx/QdhgwTi6eISdTg+pVwaH+rwuwifkL7ZVrBMpizvykKdVFEVvVQe2k09o+d
         prIFvOkPBie4xNzawH9C19NQQLJnlvRDiLoXWdbql3vixzMgc5CumYVKLeUQp6WpOimK
         UcvwzJ3VSe+GhJofuOMM0Z+m5mnAVg8HL8ruE7a6lwh9rY8JpslhBmsysVWSrDLg+3KQ
         3j3ejXYvfvAqzlnldUNZbS6C7LGr1xC5W8ypA4tlASaAl4BCXUxDQaBMPw959XClkWzI
         /EYw==
X-Forwarded-Encrypted: i=1; AJvYcCWZbgNuDNXeG4IC+4leNOAmrA2sdOz74bgLZU8VzsrNOxsDR60JeEKAxsITtYHjc4/Zz10p+P6CDKs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFq7PePI8+ps0PinvsWo2RgBYYcVNpV8/Xi2oJjKG9JR2Z4Yq2
	EtnKwlEBoT1L9mLAL8x123KfF3xueO0N4QWhRZIxQ+1gImZ4hFPKOTdciUeFnaU=
X-Gm-Gg: ASbGncvfs8SkDSd23NgpnPXhlOo8EbeMsSmyBAP58dRtf90RH96hCirpsn5ME3nTO+w
	KiCvfkrB/NjNiR2lv1NjjvxDPdVCHllDOA7Brd+AXoO4MwM9K5K9TyloUckq9iCRNFssiIk49kM
	WZMIarKhLk+MnNLuAUFF7akBNOE4UN0vw94sB0vNFru4ykv+sd9Ie0+0LWim9b0Bh3exXa1+XzM
	jrh9a7v2GiwEhO6HHz/8lsdsn7COHMqSVcLWO7MOidZw0yMBbsAXyCddouGoU7B3GraLSVY0yom
	8frZm8nHkCJDI8fmEsBDHtNTUX0Zk9CUwNER+bYwdfSoYv8FokMfBA==
X-Google-Smtp-Source: AGHT+IGdH1lgoJr0bazg0fksi9pHBFYCBH5/M+YEIFTTKoDR0hUthlDLaxA5qHXNw5jfyW9M5ZzTEw==
X-Received: by 2002:a5d:588e:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3997f90e00cmr1069f8f.29.1742485546807;
        Thu, 20 Mar 2025 08:45:46 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb93csm23779355f8f.86.2025.03.20.08.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 08:45:46 -0700 (PDT)
Message-ID: <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
Date: Thu, 20 Mar 2025 15:45:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
To: Rob Herring <robh@kernel.org>
Cc: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bacem Daassi <Bacem.Daassi@infineon.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Mark Brown <broonie@kernel.org>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
 <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
 <20250319233024.GA2625856-robh@kernel.org>
 <a3818477-5a67-43ad-8961-88fa02916968@linaro.org>
 <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_084548_599521_857E586C 
X-CRM114-Status: GOOD (  29.60  )
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

CgpPbiAzLzIwLzI1IDI6MDYgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFRodSwgTWFyIDIw
LCAyMDI1IGF0IDI6NDTigK9BTSBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5v
cmc+IHdyb3RlOgo+Pgo+PiBIaSwgUm9iLAo+Pgo+PiBPbiAzLzE5LzI1IDExOjMwIFBNLCBSb2Ig
SGVycmluZyB3cm90ZToKPj4+IE9uIFdlZCwgTWFyIDE5LCAyMDI1IGF0IDA2OjQ3OjQ0UE0gKzA5
MDAsIFRha2FoaXJvIEt1d2FubyB3cm90ZToKPj4+PiBUaGVyZSBhcmUgaW5maW5lb24gZmxhc2hl
cyBbMV0gdGhhdCByZXF1aXJlIDggZHVtbXkgY3ljbGVzIGZvciB0aGUKPj4+PiAxLTEtMSBSZWFk
IElEIGNvbW1hbmQuIFNpbmNlIHRoZSBjb21tYW5kIGlzIG5vdCBjb3ZlcmVkIGJ5IEpFU0QyMTYK
Pj4+PiBvciBhbnkgb3RoZXIgc3RhbmRhcmQsIGdldCB0aGUgbnVtYmVyIG9mIGR1bW15IGN5Y2xl
cyBmcm9tIERUIGFuZCB1c2UKPj4+PiB0aGVtIHRvIGNvcnJlY3RseSBpZGVudGlmeSB0aGUgZmxh
c2guCj4+Pgo+Pj4gSWYgUmVhZCBJRCBmYWlscywgdGhlbiBjb3VsZG4ndCB5b3UganVzdCByZXRy
eSB3aXRoIGR1bW15IGN5Y2xlcz8gT3IKPj4KPj4gSSB0aGluayBSZWFkIElEIHdvbid0IGZhaWwg
d2hlbiB0aGUgb3AgcmVxdWlyZXMgOCBkdW1teSBjeWNsZXMsIGl0Cj4+IHByb2JhYmx5IGp1c3Qg
cmVhZHMgZ2FyYmFnZSBvbiB0aGUgZmlyc3QgOCBjeWNsZXMsIHNvIHdlIHJpc2sgdG8gd3Jvbmds
eQo+PiBtYXRjaCBvdGhlciBmbGFzaCBJRHMuCj4+Cj4+PiB3b3VsZCB1bmNvbmRpdGlvbmFsbHkg
YWRkaW5nIGR1bW15IGN5Y2xlcyBhZHZlcnNlbHkgYWZmZWN0IG90aGVyIGNoaXBzPwo+Pgo+PiBB
ZGRpbmcgOCBkdW1teSBjeWNsZXMgdG8gY2hpcHMgdGhhdCBkb24ndCBuZWVkIGl0LCB3b3VsZCBt
ZWFuIGlnbm9yaW5nCj4+IHRoZSBmaXJzdCBieXRlIG9mIHRoZSBmbGFzaCBJRCwgdGh1cyB3ZSBh
Z2FpbiByaXNrIHRvIHdyb25nbHkgbWF0Y2gKPj4gYWdhaW5zdCBvdGhlciBmbGFzaCBJRHMuCj4+
Cj4+Pgo+Pj4gT3RoZXJ3aXNlLCBhZGQgYSBzcGVjaWZpYyBjb21wYXRpYmxlIHRvIGltcGx5IHRo
aXMgcmVxdWlyZW1lbnQuIEFkZGluZwo+Pj4gcXVpcmsgcHJvcGVydGllcyBkb2Vzbid0IHNjYWxl
Lgo+Pgo+PiBEbyB5b3UgbWVhbiBhIGZsYXNoIG5hbWUgY29tcGF0aWJsZSwgbGlrZSAiY3lyczE3
YjUxMixzcGktbm9yIj8KPiAKPiBZZXMsIGJ1dCB0aGF0J3Mgbm90IHRoZSBmb3JtYXQgb2YgY29t
cGF0aWJsZSBzdHJpbmdzLgo+IAo+PiBUaGUKPj4gcHJvYmxlbSB0aGF0IEkgc2VlIHdpdGggdGhh
dCBpcyB0aGF0IHdlIG5vIGxvbmdlciBiaW5kIGFnYWluc3QgdGhlCj4+IGdlbmVyaWMgamVkZWMs
c3BpLW5vciBjb21wYXRpYmxlLCBzbyBwZW9wbGUgbmVlZCB0byB1cGRhdGUgdGhlaXIgRFQgaW4K
Pj4gY2FzZSB0aGV5IHVzZS9wbHVnLWluIGEgZGlmZmVyZW50IGZsYXNoIG9uIHRoZWlyIGJvYXJk
Lgo+IAo+IFRoaXMgY2hpcCBpcyBjbGVhcmx5ICpub3QqIGNvbXBhdGlibGUgd2l0aCBhIGdlbmVy
aWMgY2hpcC4KCkkgdGhpbmsgaXQgaXMgY29tcGF0aWJsZS4gVGhlIGNoaXAgZGVmaW5lcyB0aGUg
U0ZEUCAoc2VyaWFsIGZsYXNoCmRpc2NvdmVyYWJsZSBwYXJhbWV0ZXJzKSB0YWJsZXMuIEF0IHBy
b2JlIHRpbWUgd2UgcGFyc2UgdGhvc2UgdGFibGVzIGFuZAppbml0aWFsaXplIHRoZSBmbGFzaCBi
YXNlZCBvbiB0aGVtLgoKV2UgZG9uJ3QgZXZlbiBjYXJlIGFib3V0IHRoZSBjaGlwIElELCBpZiBh
bGwgdGhlIGZsYXNoIHBhcmFtZXRlcnMgY2FuIGJlCmRpc2NvdmVyZWQgdmlhIFNGRFAuIFVuZm9y
dHVuYXRlbHkgdGhlc2UgdGFibGVzIGRvIG5vdCBkZXNjcmliZSBhbGwgdGhlCmZsYXNoIGNhcGFi
aWxpdGllcyAoYmxvY2sgcHJvdGVjdGlvbiBiZWluZyBvbmUpLiBPciB3b3JzZSwgbWFudWZhY3R1
cmVycwptYW5nbGUgdGhlc2UgdGFibGVzLgoKU28gdmVuZG9ycyBuZWVkIHRvIGlkZW50aWZ5IGNo
aXBzIHRvIGVpdGhlciBmaXggdGhvc2UgdGFibGVzIHZpYSBzb21lCnF1aXJrcyBhZnRlciB0aGUg
cGFyc2luZyBpcyBkb25lLCBvciB0byBzcGVjaWZ5IHN1cHBvcnQgdGhhdCdzIG5vdApjb3ZlcmVk
IGJ5IHRob3NlIHRhYmxlcy4KCkZvciBiYXNpYyBvcHMsIGZsYXNoZXMgdGhhdCBnZXQgdGhlIFNG
RFAgdGFibGVzIHJpZ2h0LCBkb24ndCBldmVuIG5lZWQgYQpmbGFzaCBlbnRyeSBkZWZpbmVkLCB3
ZSBkb24ndCBjYXJlIGFib3V0IHRoZWlyIElELCB3ZSBqdXN0IGluaXRpYWxpemUKdGhlIGZsYXNo
IHNvbGVseSBiYXNlZCBvbiBTRkRQLgoKSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoaXMgZmxh
c2ggbmVlZHMgaWRlbnRpZmljYXRpb24gdG8gZml4IHNvbWUKd3JvbmcgU0ZEUCBmaWVsZCwgaXQg
Y29ycmVjdHMganVzdCB0aGUgbW9kZSBjeWNsZXMgZm9yIHRoZSBGQVNUIFJFQUQKY29tbWFuZC4g
QWxsIHRoZSBvdGhlciBjb21tYW5kcyBzZWVtIGZpbmUgYWNjb3JkaW5nIHRvIHBhdGNoIDMvMy4K
Cj4gCj4gWW91IGhhdmUgdGhlIHNhbWUgcHJvYmxlbSB3aXRoIGEgcHJvcGVydHkuIFVzZXJzIGhh
dmUgdG8gYWRkIG9yIHJlbW92ZQoKVHJ1ZS4gSXQncyB0aGUgc2FtZSBwcm9ibGVtLiBFdmVuIGlm
IHdlIHNwZWNpZnkgdGhlIGR1bW15IGN5Y2xlcyB2aWEgYQpwcm9wZXJ0eSwgdGhlIG5leHQgcGx1
Z2dlZC1pbiBmbGFzaCB3aWxsIHVzZSB0aG9zZS4gV2UgY2FuIG9mIGNvdXJzZQpmYWxsYmFjayB0
byB0aGUgU0ZEUCBvbmx5IGluaXQgaWYgdGhlIElEIGRvZXNuJ3QgbWF0Y2ggYW55IGZsYXNoIGVu
dHJ5LApidXQgdGhlIHByb2JsZW0gaXMgdGhlIHNhbWUuCgo+IHRoZSBwcm9wZXJ0eSBpZiB0aGUg
Zmxhc2ggY2hhbmdlcy4gQW55b25lIHRoaW5raW5nIHRoZXkgY2FuIHVzZSB0aGlzCj4gY2hpcCBh
cyBhIGNvbXBhdGlibGUgMm5kIHNvdXJjZSBpcyBTT0wuCj4gCgpJIHRoaW5rIHRoZSBwcm9wZXJ0
eSB2cyBjb21wYXRpYmxlIGRlY2lzaW9uIHJlc3VtZXMgYXQgd2hldGhlciB3ZQpjb25zaWRlciB0
aGF0IHRoZSBkdW1teSBjeWNsZXMgcmVxdWlyZW1lbnQgZm9yIFJlYWQgSUQgaXMvd2lsbCBiZQpn
ZW5lcmljIG9yIG5vdC4KCkkgbm90aWNlZCB0aGF0IHdpdGggaGlnaGVyIGZyZXF1ZW5jaWVzIG9y
IHByb3RvY29sIG1vZGVzIChlLmcsIG9jdGFsCkRUUiksIGZsYXNoZXMgdGVuZCB0byByZXF1aXJl
IG1vcmUgZHVtbXkgY3ljbGVzLiBJIHRoaW5rIHdpdGggdGltZSwKd2UnbGwgaGF2ZSBtb3JlIGZs
YXNoZXMgd2l0aCBzdWNoIHJlcXVpcmVtZW50LiBUYWthaGlybyBjYW4ganVtcCBpbiBhbmQKdGVs
bCBpZiBpdCdzIGFscmVhZHkgdGhlIGNhc2Ugd2l0aCBJRlguCgpUaHVzIGluc3RlYWQgb2YgaGF2
aW5nIGxvdHMgb2YgbmV3IGNvbXBhdGlibGVzIGZvciB0aGlzLCBJIGxlYW4gdG93YXJkcwpoYXZp
bmcgdGhpcyBwcm9wZXJ0eS4gSSdtIHN0aWxsIG9wZW4gZm9yIHRoZSBjb21wYXRpYmxlIGlkZWEs
IEkganVzdAp3YW50ZWQgdG8gZXhwbGFpbiBiZXR0ZXIgd2hlcmUgd2UgYXJlLgoKVGhhbmtzLAp0
YQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
