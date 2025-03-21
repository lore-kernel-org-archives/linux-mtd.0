Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9E8C35FF3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Mar 2025 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9Ng9PAdvpKcaAqejtHnYc5kFrcoxgBKbBv/xzA+J5g=; b=TcaWqtpIG9mNRJ
	LGiYiwoh5mIkOwYEmiaSuZ7S9cUPoBx2wFhXjlCEFZ+GDOhxOBxFiEUWoxZGRq4rUyqkuHtQp1oro
	/fO7N1JokDPPWCInsOPHdpfmM3FcqZtSmmv4IRgEX5Ie7Zyl25XOzkLZhTjAQUwZaIGscPD6TQCg/
	Y8SczSvfysk28R0GLyfvmitnKLnF/0gjYv1CPw0Z+ZagbMKu+PJtAazm7TmkdZhV/QuHMQ8D46+ro
	sX7QEJ9Fx1Fx78nSYm74mNdlQZA5C4oGIdZ498BE3uUmpXpj6rwEZESyAzzBxhALC8hcoutGaPfv0
	qCYOOCLCB9nI+lFjbi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvY9y-0000000EIUd-2JDZ;
	Fri, 21 Mar 2025 08:55:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvY9w-0000000EITg-0SmJ
	for linux-mtd@lists.infradead.org;
	Fri, 21 Mar 2025 08:55:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-225fbdfc17dso27487635ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2025 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742547319; x=1743152119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJKvcArfphhGJ6qkMORPEc4KtGrr1vGvXCT60cabfro=;
        b=Hj9YmScly1Jss1HROXsc1WmoL/Zcp+856efA8DxCHdZeaNsDI4z/6DJPBhhV+ynpcV
         LE6bPP2IMcAP/eqbLFiE4UUm7BxZm1WHVl0IiP6KEB9BghBzOgFra087xoapxQ9OUQ7N
         4lqCzBfYTAhOL+GpIrF3bE8kb8d13t3S0iTL3pacLQCKC92gXBZne2tbNPXHa3SmGF22
         ggLnvI1CS8hfTLnvFI6x59SFMVtS+Dg4kCfs48uiY0xiCsgaRRhAP6sFtszicPMSS9fO
         3xXod8FRsGI5gew/+G6o5bk71oyOfkAYEiWiWzbX2lEW3us7omoZC7PLpV4Gk3pEO+iM
         sS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742547319; x=1743152119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJKvcArfphhGJ6qkMORPEc4KtGrr1vGvXCT60cabfro=;
        b=CLJJ3fvtnwXQ+ZoPUwDPw+j8TIxsw6JX5QEZ8WiBpU5gSps7tl00p9DJ3OtZUXb3WO
         VveP3ag4h1lZUmihL2v0vCnHMcB6OYBFJ4g5VnJuP8a07HiHARcuKtBt2TVwJgJqHtjR
         hcg/+Gp6Hq29X5yeClcFAMD5L5h1aXyYObDMSKNrR9m4wVHEXbusIVtFIviQgY45fV9p
         YcGOaotjDS62KDGzeUOA14jR05Pzxk9Og6EdCUSP7ii6wpMdy8eivyTGMMLkJtNSks9t
         gxH9Z+zdUE2WPdc2I7tRrjLn4Dta747AmzZYtLJ0JOUWj+b6EoSEISF2geyJ+xBBnjVV
         GdRA==
X-Forwarded-Encrypted: i=1; AJvYcCUc06v4CrpSItpZUe7fUmBk57zh7jXGTJ2oDc/2KtDEcaFhqYHWsj7U+P2TJKUtyJAKIvWz0r/Ft2M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzU3Y8NXZx90klBs692ZE52xpJR0Lt9/ZXjn2282+f16GZ/fb62
	p7or9/6L8Fn926T2suLVCU8f+j9IgBneS8FhXD8wET8+mgNXYCWH
X-Gm-Gg: ASbGncvLsZlkJUyrYMSNI+kIZB/yRt34FV+QAlIgALuoVQCGds1qWV7pCPfprkee8wG
	RrF2TkEsCzmlXHcWDTMbsXFl1Jfim0mLaHWOrQQjooaRp61gZ5UTAGiUZmVQrQwSkw+fD/t55hX
	KKlu2I2ETMNBGM0yvdTiBFpwytFtGTqL26c0vj9pMcp08EqClvgxi1AFhJmyQWBXx9hqzpFAror
	WQgzE7wQjJ6UAa+dOwZrrUgCoPd3e1AOB6vdC8vZapgJg9rKWCbqFreVkc6WE5ZPEjTW1cj9M84
	oA5ERx+wbgaz8Gz2ywoqtcHyQKhhmgxyu8mbSQNED+doPvhnYqgOm66wCIO5M3goeOojL4CtCwl
	BDWXj6Gu+dAzMORB96ao=
X-Google-Smtp-Source: AGHT+IGyCMWa37Dvs/TzLf7iByEW28q3MViZ+Q6mT039F5INAer/8VtuAML2MoSCgOzIkzs+v33v8w==
X-Received: by 2002:a17:902:d481:b0:224:1074:63af with SMTP id d9443c01a7336-22780e10a2dmr35388865ad.34.1742547318930;
        Fri, 21 Mar 2025 01:55:18 -0700 (PDT)
Received: from [192.168.127.151] (sp49-98-248-31.mse.spmode.ne.jp. [49.98.248.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da3fdsm11276525ad.183.2025.03.21.01.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 01:55:18 -0700 (PDT)
Message-ID: <d19a0265-a95a-48bb-9020-9f3b2f938bba@gmail.com>
Date: Fri, 21 Mar 2025 17:55:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
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
 <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_015520_153249_71C91EDA 
X-CRM114-Status: GOOD (  36.27  )
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

T24gMy8yMS8yMDI1IDEyOjQ1IEFNLCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDMv
MjAvMjUgMjowNiBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+IE9uIFRodSwgTWFyIDIwLCAyMDI1
IGF0IDI6NDTigK9BTSBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IHdy
b3RlOgo+Pj4KPj4+IEhpLCBSb2IsCj4+Pgo+Pj4gT24gMy8xOS8yNSAxMTozMCBQTSwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4+Pj4gT24gV2VkLCBNYXIgMTksIDIwMjUgYXQgMDY6NDc6NDRQTSArMDkw
MCwgVGFrYWhpcm8gS3V3YW5vIHdyb3RlOgo+Pj4+PiBUaGVyZSBhcmUgaW5maW5lb24gZmxhc2hl
cyBbMV0gdGhhdCByZXF1aXJlIDggZHVtbXkgY3ljbGVzIGZvciB0aGUKPj4+Pj4gMS0xLTEgUmVh
ZCBJRCBjb21tYW5kLiBTaW5jZSB0aGUgY29tbWFuZCBpcyBub3QgY292ZXJlZCBieSBKRVNEMjE2
Cj4+Pj4+IG9yIGFueSBvdGhlciBzdGFuZGFyZCwgZ2V0IHRoZSBudW1iZXIgb2YgZHVtbXkgY3lj
bGVzIGZyb20gRFQgYW5kIHVzZQo+Pj4+PiB0aGVtIHRvIGNvcnJlY3RseSBpZGVudGlmeSB0aGUg
Zmxhc2guCj4+Pj4KPj4+PiBJZiBSZWFkIElEIGZhaWxzLCB0aGVuIGNvdWxkbid0IHlvdSBqdXN0
IHJldHJ5IHdpdGggZHVtbXkgY3ljbGVzPyBPcgo+Pj4KPj4+IEkgdGhpbmsgUmVhZCBJRCB3b24n
dCBmYWlsIHdoZW4gdGhlIG9wIHJlcXVpcmVzIDggZHVtbXkgY3ljbGVzLCBpdAo+Pj4gcHJvYmFi
bHkganVzdCByZWFkcyBnYXJiYWdlIG9uIHRoZSBmaXJzdCA4IGN5Y2xlcywgc28gd2UgcmlzayB0
byB3cm9uZ2x5Cj4+PiBtYXRjaCBvdGhlciBmbGFzaCBJRHMuCj4+Pgo+Pj4+IHdvdWxkIHVuY29u
ZGl0aW9uYWxseSBhZGRpbmcgZHVtbXkgY3ljbGVzIGFkdmVyc2VseSBhZmZlY3Qgb3RoZXIgY2hp
cHM/Cj4+Pgo+Pj4gQWRkaW5nIDggZHVtbXkgY3ljbGVzIHRvIGNoaXBzIHRoYXQgZG9uJ3QgbmVl
ZCBpdCwgd291bGQgbWVhbiBpZ25vcmluZwo+Pj4gdGhlIGZpcnN0IGJ5dGUgb2YgdGhlIGZsYXNo
IElELCB0aHVzIHdlIGFnYWluIHJpc2sgdG8gd3JvbmdseSBtYXRjaAo+Pj4gYWdhaW5zdCBvdGhl
ciBmbGFzaCBJRHMuCj4+Pgo+Pj4+Cj4+Pj4gT3RoZXJ3aXNlLCBhZGQgYSBzcGVjaWZpYyBjb21w
YXRpYmxlIHRvIGltcGx5IHRoaXMgcmVxdWlyZW1lbnQuIEFkZGluZwo+Pj4+IHF1aXJrIHByb3Bl
cnRpZXMgZG9lc24ndCBzY2FsZS4KPj4+Cj4+PiBEbyB5b3UgbWVhbiBhIGZsYXNoIG5hbWUgY29t
cGF0aWJsZSwgbGlrZSAiY3lyczE3YjUxMixzcGktbm9yIj8KPj4KPj4gWWVzLCBidXQgdGhhdCdz
IG5vdCB0aGUgZm9ybWF0IG9mIGNvbXBhdGlibGUgc3RyaW5ncy4KPj4KPj4+IFRoZQo+Pj4gcHJv
YmxlbSB0aGF0IEkgc2VlIHdpdGggdGhhdCBpcyB0aGF0IHdlIG5vIGxvbmdlciBiaW5kIGFnYWlu
c3QgdGhlCj4+PiBnZW5lcmljIGplZGVjLHNwaS1ub3IgY29tcGF0aWJsZSwgc28gcGVvcGxlIG5l
ZWQgdG8gdXBkYXRlIHRoZWlyIERUIGluCj4+PiBjYXNlIHRoZXkgdXNlL3BsdWctaW4gYSBkaWZm
ZXJlbnQgZmxhc2ggb24gdGhlaXIgYm9hcmQuCj4+Cj4+IFRoaXMgY2hpcCBpcyBjbGVhcmx5ICpu
b3QqIGNvbXBhdGlibGUgd2l0aCBhIGdlbmVyaWMgY2hpcC4KPiAKPiBJIHRoaW5rIGl0IGlzIGNv
bXBhdGlibGUuIFRoZSBjaGlwIGRlZmluZXMgdGhlIFNGRFAgKHNlcmlhbCBmbGFzaAo+IGRpc2Nv
dmVyYWJsZSBwYXJhbWV0ZXJzKSB0YWJsZXMuIEF0IHByb2JlIHRpbWUgd2UgcGFyc2UgdGhvc2Ug
dGFibGVzIGFuZAo+IGluaXRpYWxpemUgdGhlIGZsYXNoIGJhc2VkIG9uIHRoZW0uCj4gCj4gV2Ug
ZG9uJ3QgZXZlbiBjYXJlIGFib3V0IHRoZSBjaGlwIElELCBpZiBhbGwgdGhlIGZsYXNoIHBhcmFt
ZXRlcnMgY2FuIGJlCj4gZGlzY292ZXJlZCB2aWEgU0ZEUC4gVW5mb3J0dW5hdGVseSB0aGVzZSB0
YWJsZXMgZG8gbm90IGRlc2NyaWJlIGFsbCB0aGUKPiBmbGFzaCBjYXBhYmlsaXRpZXMgKGJsb2Nr
IHByb3RlY3Rpb24gYmVpbmcgb25lKS4gT3Igd29yc2UsIG1hbnVmYWN0dXJlcnMKPiBtYW5nbGUg
dGhlc2UgdGFibGVzLgo+IAo+IFNvIHZlbmRvcnMgbmVlZCB0byBpZGVudGlmeSBjaGlwcyB0byBl
aXRoZXIgZml4IHRob3NlIHRhYmxlcyB2aWEgc29tZQo+IHF1aXJrcyBhZnRlciB0aGUgcGFyc2lu
ZyBpcyBkb25lLCBvciB0byBzcGVjaWZ5IHN1cHBvcnQgdGhhdCdzIG5vdAo+IGNvdmVyZWQgYnkg
dGhvc2UgdGFibGVzLgo+IAo+IEZvciBiYXNpYyBvcHMsIGZsYXNoZXMgdGhhdCBnZXQgdGhlIFNG
RFAgdGFibGVzIHJpZ2h0LCBkb24ndCBldmVuIG5lZWQgYQo+IGZsYXNoIGVudHJ5IGRlZmluZWQs
IHdlIGRvbid0IGNhcmUgYWJvdXQgdGhlaXIgSUQsIHdlIGp1c3QgaW5pdGlhbGl6ZQo+IHRoZSBm
bGFzaCBzb2xlbHkgYmFzZWQgb24gU0ZEUC4KPiAKPiBJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwg
dGhpcyBmbGFzaCBuZWVkcyBpZGVudGlmaWNhdGlvbiB0byBmaXggc29tZQo+IHdyb25nIFNGRFAg
ZmllbGQsIGl0IGNvcnJlY3RzIGp1c3QgdGhlIG1vZGUgY3ljbGVzIGZvciB0aGUgRkFTVCBSRUFE
Cj4gY29tbWFuZC4gQWxsIHRoZSBvdGhlciBjb21tYW5kcyBzZWVtIGZpbmUgYWNjb3JkaW5nIHRv
IHBhdGNoIDMvMy4KPiAKPj4KPj4gWW91IGhhdmUgdGhlIHNhbWUgcHJvYmxlbSB3aXRoIGEgcHJv
cGVydHkuIFVzZXJzIGhhdmUgdG8gYWRkIG9yIHJlbW92ZQo+IAo+IFRydWUuIEl0J3MgdGhlIHNh
bWUgcHJvYmxlbS4gRXZlbiBpZiB3ZSBzcGVjaWZ5IHRoZSBkdW1teSBjeWNsZXMgdmlhIGEKPiBw
cm9wZXJ0eSwgdGhlIG5leHQgcGx1Z2dlZC1pbiBmbGFzaCB3aWxsIHVzZSB0aG9zZS4gV2UgY2Fu
IG9mIGNvdXJzZQo+IGZhbGxiYWNrIHRvIHRoZSBTRkRQIG9ubHkgaW5pdCBpZiB0aGUgSUQgZG9l
c24ndCBtYXRjaCBhbnkgZmxhc2ggZW50cnksCj4gYnV0IHRoZSBwcm9ibGVtIGlzIHRoZSBzYW1l
Lgo+IAo+PiB0aGUgcHJvcGVydHkgaWYgdGhlIGZsYXNoIGNoYW5nZXMuIEFueW9uZSB0aGlua2lu
ZyB0aGV5IGNhbiB1c2UgdGhpcwo+PiBjaGlwIGFzIGEgY29tcGF0aWJsZSAybmQgc291cmNlIGlz
IFNPTC4KPj4KPiAKPiBJIHRoaW5rIHRoZSBwcm9wZXJ0eSB2cyBjb21wYXRpYmxlIGRlY2lzaW9u
IHJlc3VtZXMgYXQgd2hldGhlciB3ZQo+IGNvbnNpZGVyIHRoYXQgdGhlIGR1bW15IGN5Y2xlcyBy
ZXF1aXJlbWVudCBmb3IgUmVhZCBJRCBpcy93aWxsIGJlCj4gZ2VuZXJpYyBvciBub3QuCj4gCj4g
SSBub3RpY2VkIHRoYXQgd2l0aCBoaWdoZXIgZnJlcXVlbmNpZXMgb3IgcHJvdG9jb2wgbW9kZXMg
KGUuZywgb2N0YWwKPiBEVFIpLCBmbGFzaGVzIHRlbmQgdG8gcmVxdWlyZSBtb3JlIGR1bW15IGN5
Y2xlcy4gSSB0aGluayB3aXRoIHRpbWUsCj4gd2UnbGwgaGF2ZSBtb3JlIGZsYXNoZXMgd2l0aCBz
dWNoIHJlcXVpcmVtZW50LiBUYWthaGlybyBjYW4ganVtcCBpbiBhbmQKPiB0ZWxsIGlmIGl0J3Mg
YWxyZWFkeSB0aGUgY2FzZSB3aXRoIElGWC4KPiAKSW5maW5lb24gU0VNUEVSIGZsYXNoIGZhbWls
aWVzIChTMjVIeC1UL1MyOEh4LVQpIHJlcXVpcmVzIGR1bW15IGN5Y2xlcyBpbgpSZWFkIElELCBk
ZXBlbmRpbmcgb24gQ29uZmlndXJhdGlvbiBSZWdpc3RlciBzZXR0aW5nLiBUaGF0IGlzIHRvIHN1
cHBvcnQKaGlnaGVyIGZyZXF1ZW5jaWVzLiBCeSBmYWN0b3J5IGRlZmF1bHQgZHVtbXkgaXMgMCBp
biAxUy0xUy0xUyBhbmQgaXQgd29ya3MKdXAgdG8gMTMzTUh6LiBVc2VycyBjYW4gY2hhbmdlIHRo
ZSBzZXR0aW5nIHRvIHN1cHBvcnQgaGlnaGVyIGZyZXF1ZW5jaWVzLgoKPiBUaHVzIGluc3RlYWQg
b2YgaGF2aW5nIGxvdHMgb2YgbmV3IGNvbXBhdGlibGVzIGZvciB0aGlzLCBJIGxlYW4gdG93YXJk
cwo+IGhhdmluZyB0aGlzIHByb3BlcnR5LiBJJ20gc3RpbGwgb3BlbiBmb3IgdGhlIGNvbXBhdGli
bGUgaWRlYSwgSSBqdXN0Cj4gd2FudGVkIHRvIGV4cGxhaW4gYmV0dGVyIHdoZXJlIHdlIGFyZS4K
PiAKPiBUaGFua3MsCj4gdGEKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
