Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5375DC28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGX6A/4HH0ZU3XiDv7wvT+c8PlAoA0b7eCwXyUd7pvQ=; b=M3nbx49Su/IPnT
	VlxP4m+VNHQd3HwP0QkZcuDks5gzCwEEUeKHq0kceY7sz/kGo2JmXZVmYGluMYCXNEd47hQWA5ht2
	YQKqWtJArvlsa+M3+602x70A7nzzZcSO+bwPzrvKMm1x0B3g46CCEUzOvh+xJqTJ3GWE1FuwDuE6r
	PTpXHNqVHFkjyhJRNk1NerOzfWvaezuPZU2bk85r+nN+f4qKaY7OvYVvQL6UgVVQgqF8Oon2nXEOg
	vHz9sYlY9Ja77bAfKjgWWs2znrLMX227jGwu/zuVfp+mSasgpP6i+Wjj4wT8+Zm5BhccjhuV7qLM5
	iVGjkfk7dyEsIa+qqZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAxV-0000000BUJV-2Ij7;
	Thu, 20 Mar 2025 08:08:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAxT-0000000BUIk-0wHY
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 08:08:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so4762735e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2025 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742458133; x=1743062933; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1dNQaouy98Tj7Lc86GQRnTj99bQ/YCGVWlDSr8eJwdc=;
        b=U/XBILQZREjbMhqHMTLzhUrFJGnIWlRCsXWpD3eI5skMo/0vYsGD++pDo4nWHvXWcj
         fkkQ4kQKzOYjoojijKXFhI9z1egBnkpHAwIC3qy5OhVbHmhoa9yvjr2/E4KL3YlwtxSk
         yuFlowi2QN1/jsh86yJpENbI41Ch7GxETnFYenqAzY77tXdQyv3qG0oy6Yot9zzqqxPi
         OKsjF1Y0LfRKz7PbXgxVoKFumxeXa8mPifgcbLI19aqpRtVTxFEugyCVTBYrlq7wzAUO
         GOGrNvXcWrqhMScvB3lVZALxUSGlLfMVpP3ubpgD5YWLG1hwLmQhYgf0PS4q3zizlHav
         sdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458133; x=1743062933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dNQaouy98Tj7Lc86GQRnTj99bQ/YCGVWlDSr8eJwdc=;
        b=NT33HZkMAtccjyxv2gbaa8e+RQmu8yyDXVbpnv9u91Gj261ghSHMDgfkl8Gg6f/XRF
         GsSunBo0ZdAAOqBVBzqEZM03tLjazSFDEfLL1/q2fQmeQ5YPWofkgp4njJQVit5l2Wuk
         8l56Ig6Heikd8NYjgsIZ0TdYesg+kpJLIuvLb891LKx0vojH2FD7qVYZNhIYFT2+g8Ri
         qnXFsEtwb25mAipi3qaOpnPvyXZUiL7m5yF0G42UDlh5K5GrvsC9uFDXt+AC+ER0H4o+
         JLbNvQUSqdp8vajUI1MolE4vC9LQS0wqWrN9J1vT8MxBKQ66MFKhH0gajh3i0A+CYKra
         e3tg==
X-Forwarded-Encrypted: i=1; AJvYcCVulo7i7ZCCbbOf5Zy/Xbpx5tT4HSMWHXSYR0e9ENyRhD9lBvzPnEl4p4BFIkQyBBUcn2b2q6GPevs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxboxc2Q1l+kZtdgpuBPbYKgCUuvuXetWo24QCv5I4/ZQrPYTab
	L8vv77TwKuCRMGH4GSvRzQkqkLkO91dqu3jUN36iMVGGoHKAqJswHAhtev8Iv5k=
X-Gm-Gg: ASbGncuzdQwb0a4TOogMMSxMWtYeuu/tDd3I0TPAW3tZTXO3/HZoQCjok1OaULCT1N5
	dzKTqiV7w4CdFcaEjh6UJIs96r6dSm5dOnQldT+qnOZ3Zm5LcRRvLPyu7MB5jo6Sodwdowuct2u
	YT2csR5wuNfyXXkRM1+eJdJhIdLY7bCrFRQEU4zcbF93TCT6QfDenfqvwRNgUitM7lge3jSmEf0
	lwpuoijt1jWVG6j6M0a/esxIm8z+uN14np3ahty+Etx7jujjH0/QrYlRUlC/JzxB0nctuKJevhK
	4REQSZngBN0ERTUZPosgk1N3di4MrFiYIK1nRqv4Wj/MB0nHECxDqg==
X-Google-Smtp-Source: AGHT+IEpNphOUcl8BMlObgU3154HRqgtwN4r8WKPgpi9ZDbKaMMX9iBtJ2Z82iqYT+hxjWitnw7qvg==
X-Received: by 2002:a05:600c:3b83:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-43d4954da8cmr17714315e9.13.1742458133406;
        Thu, 20 Mar 2025 01:08:53 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f3328bsm40596905e9.1.2025.03.20.01.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 01:08:51 -0700 (PDT)
Message-ID: <ba99ef52-0c98-45a9-91e0-4fd205649e00@linaro.org>
Date: Thu, 20 Mar 2025 08:08:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] mtd: spinand: Use more specific naming for the
 reset op
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-1-45c1e074ad74@bootlin.com>
 <9004166e-5535-4024-8114-9fdb217407bb@linaro.org>
 <87v7skrgjl.fsf@bootlin.com>
 <f1111d1b-a111-4171-9467-450d90a14c0a@linaro.org>
 <87iko50vvb.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87iko50vvb.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_010855_295513_3CD19594 
X-CRM114-Status: GOOD (  30.50  )
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

SGksIE1pcXVlbCwKCk9uIDMvMTkvMjUgNTozMiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4+
Pj4+IC0jZGVmaW5lIFNQSU5BTkRfUkVTRVRfT1AJCQkJCQlcCj4+Pj4+ICsjZGVmaW5lIFNQSU5B
TkRfUkVTRVRfMVNfMF8wX09QCQkJCQkJXAo+Pj4+IEhpLCBNaXF1ZWwsCj4+Pj4KPj4+PiBIYXZl
IHlvdSBzZWVuIGFueSByZXNldCBvcCB3aXRoIGFkZHJlc3Mgb3IgZGF0YT8gSWYgbm90LCBJJ20g
bm90IHJlYWxseQo+Pj4+IHN1cmUgd2hldGhlciB3ZSBzaGFsbCBjaGFuZ2UgdGhlIG5hbWUgZm9y
IHRoZXNlIGJhc2ljIG9wZXJhdGlvbnMuCj4+Pj4KPj4+PiBDaGFuZ2luZyB0aGVtIHRvIDFTLTAt
MCBtYXkgYWxzbyBpbmRpY2F0ZSB0aGF0IHRoZXJlIGFyZSByZXNldHMgd2l0aAo+Pj4+IGFkZHJl
c3Mgb3IgZGF0YSBmaWVsZHMsIHdoaWNoIEkgZmluZCBjb25mdXNpbmcuCj4+Pj4KPj4+PiBJIHRo
aW5rIHRoZSBjaGFuZ2UgaXMgZ29vZCBmb3IgcmVhZHMgYW5kIHdyaXRlcy4gSSdsbCBjaGVjayBm
dXJ0aGVyIGluCj4+Pj4gdGhlIHNlcmllcyBhbmQgbGV0IHlvdSBrbm93Lgo+Pj4KPj4+IEkgd2Fu
dCB0byByZW5hbWUgdGhpcyBtYWNybyBmb3IgdHdvIHJlYXNvbnM6Cj4+PiAtIFdlIG1pZ2h0IHNl
ZSBpbiB0aGUgbmVhciBmdXR1cmUgdGhlIGFkZGl0aW9uIG9mIDhELTAtMCBvcHMgKEkgcGxhbiBv
bgo+Pj4gICB3b3JraW5nIG9uIGl0KS4KPj4+IC0gSSB3b3VsZCBsaWtlIHNvbWUga2luZCBvZiBo
YXJtb255IGFtb25nIHRoZXNlIG1hY3Jvcy4KPj4+Cj4+PiBOb3csIHdoZXRoZXIgaXMgc2hvdWxk
IGJlIG5hbWVkIGxpa2UgSSBwcm9wb3NlZCBvciBqdXN0Cj4+PiBTUElOQU5EX1JFU0VUX09QXzFT
LCBJIGhhdmUgbm8gc3Ryb25nIHByZWZlcmVuY2UgYW5kIEkgY2FuIGNoYW5nZSB0aGF0Cj4+PiBp
biBhbiB1cGNvbWluZyB2ZXJzaW9uLgo+Pj4KPj4+IFdoaWNoIG9uZSB3b3VsZCB5b3UgcHJlZmVy
Pwo+Pgo+PiBJIGRvbid0IGtub3cuIFdoaWNoIG9uZSBpcyBiYWNrZWQgdXAgYnkgYSBzdGFuZGFy
ZD8KPiAKPiBXZWxsLCBhcyBmYXIgYXMgSSBrbm93LCBub25lIG9mIHRoZSBTUEkgTkFORCBkZXZp
Y2VzIGZvbGxvdyBhIHZlcnkKPiBzcGVjaWZpYyBzdGFuZGFyZC4gTW9zdCB2ZW5kb3JzIGluIHBy
YWN0aWNlIGZvbGxvdyBzaW1pbGFyIGNvbnZlbnRpb25zLAo+IGJ1dCB0aGV5IGFsbCBkZXZpYXRl
IGEgYml0IGZyb20gaXQuCj4gCj4+IEpFU0QyMTZGIGRlZmluZXMKPj4gIihBbi1Cbi1Dbik6IENv
bW1hbmQgbW9kZSBub21lbmNsYXR1cmUgdXNlZCB0byBpbmRpY2F0ZSB0aGUgbnVtYmVyIG9mCj4+
IGFjdGl2ZSBwaW5zIHVzZWQgZm9yIHRoZSBpbnN0cnVjdGlvbiAoQSksIGFkZHJlc3MgKEIpLCBh
bmQgZGF0YSAoQyksIGFuZAo+PiB0aGUgZGF0YSByYXRlIHVzZWQgZm9yIGVhY2guIERhdGEgcmF0
ZXMobikgY2FuIGJlIHNpbmdsZSAoUykgYW5kIGR1YWwgKEQpLiIKPj4KPj4gQWxzbywgIih4LXkt
eikgbm9tZW5jbGF0dXJlIGlzIGVxdWl2YWxlbnQgdG8oQVMtQlMtQ1MpIHVubGVzcyBvdGhlcndp
c2UKPj4gbm90ZWQuIgo+Pgo+PiBXaGF0J3MgYW4gImFjdGl2ZSBwaW4iPwo+Pgo+PiBUaGVuIGlm
IEkgbG9vayBhdCBKRVNEMjUxLTEuMDEgYW5kIEpFU0QyNTFDLCAoQW4tQm4tQ24pIGlzIHJlZmVy
cmVkIHRvCj4+IGFzICJwcm90b2NvbCBtb2RlIi4gV3JpdGUgRW5hYmxlLCB3aGljaCBpcyBqdXN0
IGFuIGluc3RydWN0aW9uIGNvbW1hbmQKPj4gd2l0aCBubyBhZGRyZXNzIG9yIGRhdGEsIGlzIHNl
ZW4gYXMgYSByZXF1aXJlZCBjb21tYW5kIGluIGJvdGggNEQtNEQtNEQKPj4gYW5kIDhELThELThE
IHByb3RvY29sIG1vZGVzLCBhbmQgaXQncyBkZWZpbmVkIGFzIGEgIjEuQSIgdHJhbnNhY3Rpb24K
Pj4gZm9ybWF0IGNvbW1hbmQuIEFuZCB0aGUgdHJhbnNhY3Rpb24gZm9ybWF0IGlzOgo+PiAnJycK
Pj4gVGhlIGZvbGxvd2luZyB0cmFuc2FjdGlvbiBmb3JtYXRzIGFyZSB1c2VkIGluIFByb2ZpbGUg
MS4wIG1vZGUgOEQtOEQtOEQ6Cj4+IEZvcm1hdCAxLkE6IENvbW1hbmQgYW5kIENvbW1hbmQgRXh0
ZW5zaW9uCj4+IEZvcm1hdCAxLkI6IENvbW1hbmQsIENvbW1hbmQgRXh0ZW5zaW9uLCA0LWJ5dGUg
QWRkcmVzcywg4oCYbuKAmSBMYXRlbmN5Cj4+IEN5Y2xlcywgYW5kIFJlYWQgRGF0YQo+PiBGb3Jt
YXQgMS5DOiBDb21tYW5kLCBDb21tYW5kIEV4dGVuc2lvbiwgYW5kIDQtYnl0ZSBBZGRyZXNzCj4+
IEZvcm1hdCAxLkQ6IENvbW1hbmQsIENvbW1hbmQgRXh0ZW5zaW9uLCA0LWJ5dGUgQWRkcmVzcywg
YW5kIFdyaXRlIERhdGEKPj4gJycnCj4+Cj4+IFNvIGFjY29yZGluZyB0byB0aGVzZSBzdGFuZGFy
ZHMgbWF5YmUgd2Ugc2hhbGwgcmVmZXIgdG8gaXQgYXM6Cj4+IFdSRU4tOEQtOEQtOEQtMUE/IFRo
aXMgc2VlbXMgbGVzcyBpbnR1aXRpdmUgdGhhbiA4RC0wLTAsIGJ1dCBJIHRoaW5rIGl0Cj4+IGFs
bCBkZXBlbmRzIG9uIHdoYXQncyBhbiAiYWN0aXZlIHBpbiIuIEkgdGhpbmsgaXQgZGVzY3JpYmVz
IHRoZSBwcm90b2NvbAo+PiBtb2RlLCBhbmQgbm90IHdoYXQncyBhY3R1YWxseSBzZW50IG9uIHRo
ZSBsaW5lLiBBcyB3ZSBzYXcsIFdSRU4gaXMKPj4gY29uc2lkZXJlZCBhbiA4RC04RC04RCBjb21t
YW5kLCBhbmQgbm90IGFuIDhELTAtMCBjb21tYW5kLgo+Pgo+PiBGb3IgZHVhbCBtb2RlLCB3aGlj
aCBpcyBub3QgY292ZXJlZCBieSB4U1BJLCBJIGd1ZXNzIHdlIGNhbiB1c2UgdGhlCj4+IHNpbmds
ZSBzcGkgdHJhbnNhY3Rpb24gZm9ybWF0cyAwLntBLEIsQywuLi59Lgo+Pgo+PiBIb3cgZG8geW91
IGZlZWwgYWJvdXQgYSBPUC1Bbi1Cbi1Dbi10cmFuc2FjdGlvbi1mb3JtYXQsCj4+IAl3aGVyZSBB
LCBCLCBDIGlzIHsxLCAyLCA0LCA4fQo+PiAJbiBpcyB7UywgRH0KPj4gCXRyYW5zYWN0aW9uIGZv
cm1hdCBpcyB7MCwxLDIsM317QSxCLEMsLi4ufQo+Pgo+PiBDYXJlIG11c3QgYmUgdGFrZW4gY2Fy
ZSBvZiBhdCB0aGUgdHJhbnNhY3Rpb24gZm9ybWF0LCBhcyBJIHNlZSB0aGVyZSBhcmUKPj4gYSBm
ZXcsIGRlcGVuZGluZyBvbiB0aGUgeFNQSSBwcm9maWxlIGFuZCBwcm90b2NvbCBtb2RlLgo+IAo+
IEkgbXVzdCBhZG1pdCBJIHJlYWxseSBkaXNsaWtlIHRoZSB0cmFuc2FjdGlvbiBmb3JtYXQgYWJi
cmV2aWF0aW9uIGJlY2F1c2UKCkknbSBub3QgaW4gbG92ZSB3aXRoIHRoZSAidHJhbnNhY3Rpb24g
Zm9ybWF0IiBlaXRoZXIuCgo+IGl0IGlzIHNwZWNpZmljIHRvIGEgc3BlYyB3ZSBkbyBub3QgZm9s
bG93IGFuZCBpcyBub3QgZXhwbGljaXQuIEkgaGF2ZSBhCj4gc3Ryb25nIHByZWZlcmVuY2UgdG93
YXJkcyBrZWVwaW5nIGp1c3QgIkFuLUJuLUNuIiwgbGlrZSBJIGRpZCBpbiB0aGlzCgpPa2F5LgoK
PiBzZXJpZXMuIElmIHBlb3BsZSBhcmUgaW4gZG91YnQsIHRoZXkgY2FuIGNoZWNrIHdoYXQgaXMg
aW4gdGhlIG9wLCBpdCBpcwo+IHNlbGYgZXhwbGFuYXRvcnkuIEkgY2hvc2UgdGhpcyBpbiB0aGUg
Zmlyc3QgcGxhY2UgYmVjYXVzZSBpdCBpcyBtb3JlCj4gZXhwbGljaXQgdGhhbiBqdXN0ICJBbiIg
d2hpY2ggbWF5IGZlZWwgbGlrZSBhIGNyb3BwZWQKPiBhY3JvbnltLiBGdXJ0aGVybW9yZSwgbW9z
dCBvY3RhbCBjYXBhYmxlIGRhdGFzaGVldHMgSSd2ZSBsb29rZWQgYXQgc2VlbQo+IHRvIHVzZSB0
aGUgIkFuLUJuLUNuIiBmb3JtYXQsIGV2ZW4gZm9yIHNpbmdsZSBvcGNvZGVzLgoKU28gZm9yIFJF
U0VULCBXUkVOLCBXUkRJIGFuZCBvdGhlciBvcGNvZGVzIHRoYXQgZG9uJ3QgcmVxdWlyZSBhZGRy
ZXNzCmFuZCBkYXRhLCBhcmUgdGhvc2UgZGF0YXNoZWV0cyByZWZlcnJpbmcgdG8gdGhlc2Ugb3Bj
b2RlcyBhcyAxLTEtMSBjb21tYW5kcz8KQ2FuIHlvdSBwb2ludCBtZSB0byBvbmUgb2YgdGhlc2Ug
ZGF0YXNoZWV0cywgcGxlYXNlPwoKSW4gU1BJIE5PUiwgV1JFTiBpcyBqdXN0IFdSRU4sIHJlZ2Fy
ZGxlc3Mgb2YgdGhlIG51bWJlciBvZiBsaW5lcyBpdCBpcwpzZW50IG9uLCAxLCA0LCBvciA4LiBI
b3cgd291bGQgeW91IG1vZGVsIGl0IGhlcmUsIDEtMC0wLCA0LTAtMCwgOC0wLTAKdXNpbmcgdGhl
IHNhbWUgb3Bjb2RlPwoKPiAKPiBTbyB1bmxlc3MgdGhlcmUgYXJlIHN0cm9uZyBhcmd1bWVudHMg
YWdhaW5zdCwgSSdkIHByZWZlciB0byBrZWVwIHRoZQo+IGN1cnJlbnQgZm9ybWF0dGluZy4gVEJI
LCBpdCBpcyBub3Qgc2V0IGluIHN0b25lIGFuZCBjYW4gc3RpbGwgZXZvbHZlCj4gbGF0ZXIgaWYg
dGhhdCdzIG5lZWRlZC4KCkkgZmluZCB0aGUgbmFtaW5nIHNjaGVtZSBBbi1Cbi1DbiBnb29kLCBJ
J20gYXJndWluZyB0aGF0IGl0J3Mgbm90IG5lZWRlZApldmVyeXdoZXJlLCBvcGNvZGUgb25seSBj
b21tYW5kcyBhcmUgYmV0dGVyIG9mZiB3aXRoIGl0LCBJIHRoaW5rLgoKQ2hlZXJzLAp0YQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
