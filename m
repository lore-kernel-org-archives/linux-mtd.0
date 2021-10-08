Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1988FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 08:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D454A60FD7
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 08:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D454A60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1Mhjga8fO3FQmKTf4c+KUwgW2ElsVgVBXndlWrRfkw=; b=oN3R3m9I3obBmY
	AMQKN9wKDwX8/zLlgBrh2didKFynUGxghGS2QuPYpuVymulWIQQ1z4GFP6YVVacxMi8UXMSh8Xceb
	l3wecSqwfSRVqYj6tVx6MA7oZTS3RI+ZKGbjo3jJd1bTrq1InyShw1nYR4OjJ2ECs9q2w7goqcNIR
	h0deiDiQhN7vRz4mBSjkmwMIOjitOtuGL0OwPMuiGYfg5AiIFyGzz2f6/BEsQj4IpVE4EoyYDENlU
	iF40R6HRk3Jw3ScSDX8GzUufGgEq2Ioq3hV95Cqb1GqxVkKL9abhwBokRA0A8DaqvmEUvDFj0eH0d
	Ea77mke1rk6gRZtlblyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYlDP-0021RR-V9; Fri, 08 Oct 2021 08:26:52 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYlDN-0021Qi-PD
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 08:26:51 +0000
Received: by mail-lf1-x12f.google.com with SMTP id x27so35921606lfa.9
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AJSSe6ehZD2y0+lTg+p0r9JO3AtpJt3pTHVoziNATuU=;
 b=gTeXoQgGto0oDwKOKQ3eEB+pprlsga0tK7DNi6PUIUxeFeeVUgOlhaU1nF3MIwnI1Z
 43LMWDkny7vvHf50bdgTD3A4sQxxgYR4o8Kd3a1D/5d2tWBiuCMT8lYQx4jA8eg+RhnY
 XKHMJ/D7yS7K7XjLrqCOJ6UFymehrU27BaAFV9N3b8kLgN+89MsHAre3fxuWbX2zqwjM
 ZtorI5o1lN+L9GHaf0+jl1+aMj0MRoUkS2lKqF9p74BFNdMeLCoxnBE0mXhKD85V/043
 3d+wN+hr+JeMIcZJcNtn3hN9O0Vqhl8t81FbHKP2kOQ8AAruq230eyYYyAwCQPh8gTKW
 I7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=AJSSe6ehZD2y0+lTg+p0r9JO3AtpJt3pTHVoziNATuU=;
 b=EmubE4YZ6JpkWPTqir0Glj7RGuigVPBlVGN5uUIrmxNpIOJFQFxtoVVnOg8di9iAUc
 QDVEgouBactAvR+rWNXxh17OrxHoPkMKa1WbfsUDd8z8okMbBPWyKy+T3hORf25WOwzv
 FY0ZWvrZwQXXimHml7M6qhr8YjY30yt+Jz9IewbKLgZE2gImj7xSTZXQ/CQs+i4/pnVX
 Sqw5X3yzep/c1P4vdIvLkM4TmhEDZoza8U1VuA9Vi7VMpt9el5qaLi10UdLdxZ2EDvBu
 bkus21cIb4/B5DQKBHMSnoU2sMl9yjdC9LBRROc7M1yi1XBwAly+Yd6+TVHxC93Tbx0S
 T9qQ==
X-Gm-Message-State: AOAM531nRgOhgG7qy+Iorv/Ysq/pREbI2B18cqgDRb9gXmA0Y1zp78QU
 w+8Uh7zzhN0ltaSnXIjqG0U=
X-Google-Smtp-Source: ABdhPJwwbFyI+0EDaRvJnIjJSD3Mp5YMc2e406fENT1Svmw/h9DXbTqQXc/i0K8S3CzR9XAXptFdtA==
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr9029717lfi.309.1633681607342; 
 Fri, 08 Oct 2021 01:26:47 -0700 (PDT)
Received: from wbg (h-158-174-22-41.NA.cust.bahnhof.se. [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id l11sm183866lfg.39.2021.10.08.01.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 01:26:46 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
Subject: Re: [PATCH 1/1] mtd: block2mtd: add support for an optional custom
 MTD label
In-Reply-To: <20211008092748.6b47fce6@xps13>
References: <20211005080359.170360-1-troglobit@gmail.com>
 <20211008092748.6b47fce6@xps13>
Date: Fri, 08 Oct 2021 10:26:46 +0200
Message-ID: <87wnmnrkft.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_012649_844141_CC9AD14A 
X-CRM114-Status: GOOD (  17.91  )
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

CkhpIE1pcXXDqGwhCgpPbiBGcmksIE9jdCAwOCwgMjAyMSBhdCAwOToyNywgTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gdHJvZ2xvYml0QGdtYWlsLmNv
bSB3cm90ZSBvbiBUdWUsICA1IE9jdCAyMDIxIDEwOjAzOjU5ICswMjAwOgo+PiBbc25pcF0KPj4g
QEAgLTMwNCw3ICszMDcsNyBAQCBzdGF0aWMgc3RydWN0IGJsb2NrMm10ZF9kZXYgKmFkZF9kZXZp
Y2UoY2hhciAqZGV2bmFtZSwgaW50IGVyYXNlX3NpemUsCj4+ICAKPj4gIAlsaXN0X2FkZCgmZGV2
LT5saXN0LCAmYmxrbXRkX2RldmljZV9saXN0KTsKPj4gIAlwcl9pbmZvKCJtdGQlZDogWyVzXSBl
cmFzZV9zaXplID0gJWRLaUIgWyVkXVxuIiwKPj4gLQkJZGV2LT5tdGQuaW5kZXgsCj4+ICsJCWRl
di0+bXRkLmluZGV4LCBsYWJlbCA/IGxhYmVsIDoKPiBDYW4geW91IHB1dCB0aGlzIG9uIHRoZSBu
ZXh0IGxpbmU/CgpTdXJlIHRoaW5nIQoKPj4gQEAgLTM4MSw4ICszODQsOCBAQCBzdGF0aWMgaW50
IGJsb2NrMm10ZF9zZXR1cDIoY29uc3QgY2hhciAqdmFsKQo+PiAgCS8qIDgwIGZvciBkZXZpY2Us
IDEyIGZvciBlcmFzZSBzaXplLCA4MCBmb3IgbmFtZSwgOCBmb3IgdGltZW91dCAqLwo+PiAgCWNo
YXIgYnVmWzgwICsgMTIgKyA4MCArIDhdOwo+PiAgCWNoYXIgKnN0ciA9IGJ1ZjsKPj4gLQljaGFy
ICp0b2tlblsyXTsKPj4gLQljaGFyICpuYW1lOwo+PiArCWNoYXIgKnRva2VuWzNdOwo+IFRoaXMg
bnVtYmVyIGRlc2VydmVzIGEgZGVmaW5lIGFuZCBzaG91bGQgYmUgdXNlZCBsYXRlciBvbiBhcyB3
ZWxsLgoKT0ssIEknbGwgc2VlIHdoYXQgSSBjYW4gZG8sIGl0J3MgZm9yIHRoZSBwb3NpdGlvbmFs
IG1vZHVsZSBhcmd1bWVudHMsCnNvIGEgRk9PX01BWF9BUkdTIG9yIHN0aCwgSSBndWVzcyAuLi4K
Cj4+IEBAIC0zOTUsNyArMzk4LDcgQEAgc3RhdGljIGludCBibG9jazJtdGRfc2V0dXAyKGNvbnN0
IGNoYXIgKnZhbCkKPj4gIAlzdHJjcHkoc3RyLCB2YWwpOwo+PiAgCWtpbGxfZmluYWxfbmV3bGlu
ZShzdHIpOwo+PiAgCj4+IC0JZm9yIChpID0gMDsgaSA8IDI7IGkrKykKPj4gKwlmb3IgKGkgPSAw
OyBpIDwgMzsgaSsrKQoKdXNlZCBoZXJlIGFzIHdlbGwgLi4uCgo+PiAgCQl0b2tlbltpXSA9IHN0
cnNlcCgmc3RyLCAiLCIpOwoKQnV0IHdoYXQgYWJvdXQgZWFjaCBzZXBhcmF0ZSBhcmcsIGlzIHRo
ZXJlIGFueSBjb252ZW50aW9uPyAgSSdsbCBzZWUKd2hhdCBJIGNhbiBmaW5kIGluIG90aGVyIG1v
ZHVsZXMuCgo+PiAgCWlmIChzdHIpIHsKPj4gQEAgLTQxNCw3ICs0MTcsNyBAQCBzdGF0aWMgaW50
IGJsb2NrMm10ZF9zZXR1cDIoY29uc3QgY2hhciAqdmFsKQo+PiAgCQlyZXR1cm4gMDsKPj4gIAl9
Cj4+ICAKPj4gLQlpZiAodG9rZW5bMV0pIHsKPj4gKwlpZiAodG9rZW5bMV0gJiYgc3RybGVuKHRv
a2VuWzFdKSkgewo+Cj4gVGhpcyBjaGFuZ2UgaXMgbm90IHJlbGF0ZWQgdG8geW91ciBjb21taXQg
SSBiZWxpZXZlLCBwbGVhc2Ugc3BsaXQgaWYKPiBteSBhc3N1bXB0aW9uIGlzIHJpZ2h0LgoKV2Vs
bCwgaXQncyBhIGxvZ2ljYWwgY29uc2VxdWVuY2Ugb2YgYWRkaW5nIGFub3RoZXIgbW9kdWxlIGFy
Z3VtZW50LCBidXQKeW91J3JlIHJpZ2h0LCB0aGlzIGNvdWxkIGJlIGhpdCBiZWZvcmUgYXMgd2Vs
bCBpZiBzb21lb25lIGFkZGVkIG11bHRpcGxlCmNvbW1hcyB3aXRob3V0IGFyZ3VtZW50LiAgKFRo
YXQgYnJlYWtzIGVyYXNlX3NpemUgZGVmYXVsdCB2YWx1ZS4pCgpNYXliZSB0aGlzIGFuZCB0aGUg
ZGVmaW5lcyBmaXQgaW4gdGhlIHNhbWUgc2VwYXJhdGUgImNsZWFudXAiIHBhdGNoPwoKPj4gLQlh
ZGRfZGV2aWNlKG5hbWUsIGVyYXNlX3NpemUsIHRpbWVvdXQpOwo+PiArCWlmICh0b2tlblsyXSkg
ewo+PiArCQlsYWJlbCA9IHRva2VuWzJdOwo+PiArCQlwcl9pbmZvKCJVc2luZyBjdXN0b20gTVRE
IGxhYmVsICclcycgZm9yIGRldiAlc1xuIiwgbGFiZWwsIG5hbWUpOwo+IE5vdCBzdXJlIHRoaXMg
cXVhbGlmaWVzIGFzIGFuIGluZm8gbG9nIG1lc3NhZ2UsIHBlcmhhcHMgYSBkZWJ1ZyBvbmUKPiB3
b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlPwoKT0shICAoSnVzdCB0cmllZCB0byBmb2xsb3cgdGhl
IHNhbWUgbG9nIGxldmVsIHVzZWQgZm9yIGVyYXNlX3NpemUuKQoKVGhhbmsgeW91IGZvciB0aGUg
cmV2aWV3LCBJJ2xsIHBvc3QgYSB2MiBsYXRlciB0b2RheSwgb3IgZHVyaW5nIHRoZQp3ZWVrZW5k
IDopCgpDaGVlcnMKIC9Kb2FjaGltCiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
