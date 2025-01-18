Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F628C02185
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jan 2025 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Z0ploZzvGNsfa1yRgVmC653qXMT7cYmvhnqLrzafJM=; b=BhiR7Oxh8UUh74
	FaDELuxYzarmrpZUCAnDAoz97c4jNPsYvz2gsegfp2WzfxsyiFJ0YaOxKXxN9Z8cpUf2vyM8HLJj5
	RbTUGd2as5UUkrM7YVQ6eQXUzPXKdjuE4hIkWII9LDR/2zCeovQtPhXbwzo8sQEI5zfuVGW7VItis
	yPcMUFjrK0x8i2Qezbw6wPtF6HB6f0Dc8GUKVodM3qSHiqlN+XPcj4kc0RaFXfuHeaIeGWqkxIe6N
	mq5V4SWYU7uuxQ0qiVGtFE6QFCy8W4g4pMJYYDlgtnbGZfZV1cU3ko0ihbiek05/jNGtiAEGt7M3r
	w+jzjt6JWMjPqHhB02CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ3mK-00000001zBw-1a0b;
	Sat, 18 Jan 2025 08:02:00 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ3mH-00000001zBV-232V
	for linux-mtd@lists.infradead.org;
	Sat, 18 Jan 2025 08:01:58 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d9f06f8cf2so5397600a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 18 Jan 2025 00:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737187316; x=1737792116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5leNx52nYflWbnaQnHIYDvl9jkvolVSYl21uZakQUk=;
        b=MFpjp0V5g301vNYA12CTYHFNfKz8bdgLy2cBK7SKTIv8KsBmmpMNle9Jj2J5Dq4mD/
         T1ctRjDj+DkPvGqLfWPjyzMOCUcAZAj/GiUCEY9tRtvJFL7CLScT7wpaeMiVfRDsd+r0
         LeBeagOxxEwW9yXYwQ6e3+DxYOUzQppNhLlH2sm4jw6Fn7HOZE9gvulKWOBc7RLRrqFm
         17NEuixgkLdFyGp4ImGTD2Nbgur/mS5xbMwAZhc+uCRMm3K3QTWGZ2TBXd3yzn1ni8jC
         /VH/jq55ASCy4dduBqajuMWLeZFYiOw7e5e89MLMOiBcSPJt61Zl3ZTWWPZ9AortOd2E
         1+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737187316; x=1737792116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5leNx52nYflWbnaQnHIYDvl9jkvolVSYl21uZakQUk=;
        b=CfvNsyuQLi6kVv/WKE+ZpR8VfaNcqOLC/3ldUzHTWlZAtsdM+e3/IixHTQBQd9dF/y
         bR6tlCpNDDDfE/jW9dl+rzQ86UfGTQrwXFRXPHLEBND13oKjxaCmMc0pKXEAf6hDkZfS
         6pSA0HMMdt6P2q8a4zgU78Yq49Zxt+E4z9hPp/Bzl0aqCK6bDoSFWTwGirFlg5YfReQU
         5SIhcAo2ynf6+I6hJFqD5pJe1HvIOuerT+W6G5nbI+mHfwqVMckFgeG9wmb3wcgAL0lp
         RFyfMcKE+dACpqalCuzt0fENw3h2a6O4uqRYfKqj8ysU+hwsGa0BJtTAYFZ+VBmXMAdn
         qJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCWLD3SNG+pvZ8LcUkJZghywuDZeobgGyDxRsCrVsuADY10QaH4hjOyYI1aCzhsq3zRQKDrDeXfEUa0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf/BEZlQ5VVyNHd5EHnJTm+R9SFp4koTU9LRbDKeOOrEvXmF02
	aPICQXZsNWVf2ZwbMdLkKcR4aCkR7p5/3m2eoHLXLnV2o8fSZv0gmYITDV2GyND+5lZGUUGZLhe
	8W1dYa0l3Z8rq3lWpoal3nBpRyeA=
X-Gm-Gg: ASbGncvDnJlQVJNgOcmVPmZi5YIUDkVjdjzNpUDJAYOTkQ+Z4ZY46h9V2YRU+IUeQRz
	9/Op6q1bZdUkpUgYVO3lsHwBvM39HJvh7LiICAOH+PDCrmvzNOvKW
X-Google-Smtp-Source: AGHT+IHDnUsA55LVvEL1oC8NsKW/4MnBth+XIP4g5Ck5snp17XQSxX2cERW4luQVwUAsqSDcbgeZfPjBNTsK8F64rgU=
X-Received: by 2002:a05:6402:35d3:b0:5d0:feec:e15d with SMTP id
 4fb4d7f45d1cf-5db7d2f9af6mr4227036a12.8.1737187315435; Sat, 18 Jan 2025
 00:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com> <87v7ufnc0w.fsf@bootlin.com>
 <CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com> <87plkli9fj.fsf@bootlin.com>
In-Reply-To: <87plkli9fj.fsf@bootlin.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Sat, 18 Jan 2025 16:01:19 +0800
X-Gm-Features: AbW1kvbuP1oX6dA8N9eTWfkJNkhk_jjPkci2MVDNJ_NvAWDSgqY1yCzwxCljkio
Message-ID: <CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller Driver
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_000157_532993_652420D2 
X-CRM114-Status: GOOD (  32.13  )
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

T24gU2F0LCBKYW4gMTgsIDIwMjUgYXQgMjoyNuKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMTcvMDEvMjAyNSBhdCAxOTo1ODozOSAr
MDgsIEtlZ3VhbmcgWmhhbmcgPGtlZ3VhbmcuemhhbmdAZ21haWwuY29tPiB3cm90ZToKPgo+ID4g
SGVsbG8gTWlxdWVsLAo+ID4KPiA+IE9uIFRodSwgSmFuIDE2LCAyMDI1IGF0IDI6NTTigK9BTSBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Pgo+ID4+
IEhlbGxvIEtlZ3VhbmcsCj4gPj4KPiA+PiBPbiAxNy8xMi8yMDI0IGF0IDE4OjE2OjUwICswOCwg
S2VndWFuZyBaaGFuZyB2aWEgQjQgUmVsYXkgPGRldm51bGwra2VndWFuZy56aGFuZy5nbWFpbC5j
b21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiA+ICtzdGF0aWMgaW50IGxzMXhfbmFuZF9v
cF9jbWRfbWFwcGluZyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBzdHJ1Y3QgbHMxeF9uYW5kX29w
ICpvcCwgdTggb3Bjb2RlKQo+ID4+ID4gK3sKPiA+PiA+ICsgICAgIHN0cnVjdCBsczF4X25hbmRf
aG9zdCAqaG9zdCA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsKPiA+PiA+ICsgICAg
IGludCByZXQgPSAwOwo+ID4+Cj4gPj4gVGhpcyByZXR1cm4gY29kZSBpcyB1bnVzZWQuCj4gPj4K
PiA+PiA+ICsKPiA+PiA+ICsgICAgIG9wLT5yb3dfc3RhcnQgPSBjaGlwLT5wYWdlX3NoaWZ0ICsg
MTsKPiA+PiA+ICsKPiA+PiA+ICsgICAgIC8qIFRoZSBjb250cm9sbGVyIGFic3RyYWN0cyB0aGUg
Zm9sbG93aW5nIE5BTkQgb3BlcmF0aW9ucy4gKi8KPiA+PiA+ICsgICAgIHN3aXRjaCAob3Bjb2Rl
KSB7Cj4gPj4gPiArICAgICBjYXNlIE5BTkRfQ01EX1NUQVRVUzoKPiA+PiA+ICsgICAgICAgICAg
ICAgb3AtPmNtZF9yZWcgPSBMUzFYX05BTkRfQ01EX1NUQVRVUzsKPiA+PiA+ICsgICAgICAgICAg
ICAgYnJlYWs7Cj4gPj4gPiArICAgICBjYXNlIE5BTkRfQ01EX1JFU0VUOgo+ID4+ID4gKyAgICAg
ICAgICAgICBvcC0+Y21kX3JlZyA9IExTMVhfTkFORF9DTURfUkVTRVQ7Cj4gPj4gPiArICAgICAg
ICAgICAgIGJyZWFrOwo+ID4+ID4gKyAgICAgY2FzZSBOQU5EX0NNRF9SRUFESUQ6Cj4gPj4gPiAr
ICAgICAgICAgICAgIG9wLT5pc19yZWFkaWQgPSB0cnVlOwo+ID4+ID4gKyAgICAgICAgICAgICBv
cC0+Y21kX3JlZyA9IExTMVhfTkFORF9DTURfUkVBRElEOwo+ID4+ID4gKyAgICAgICAgICAgICBi
cmVhazsKPiA+PiA+ICsgICAgIGNhc2UgTkFORF9DTURfRVJBU0UxOgo+ID4+ID4gKyAgICAgICAg
ICAgICBvcC0+aXNfZXJhc2UgPSB0cnVlOwo+ID4+ID4gKyAgICAgICAgICAgICBvcC0+YWRkcnNf
b2Zmc2V0ID0gMjsKPiA+PiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPj4gPiArICAgICBjYXNl
IE5BTkRfQ01EX0VSQVNFMjoKPiA+PiA+ICsgICAgICAgICAgICAgaWYgKCFvcC0+aXNfZXJhc2Up
Cj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4+ID4g
KyAgICAgICAgICAgICAvKiBEdXJpbmcgZXJhc2luZywgcm93X3N0YXJ0IGRpZmZlcnMgZnJvbSB0
aGUgZGVmYXVsdCB2YWx1ZS4gKi8KPiA+Pgo+ID4+IC4uLgo+ID4+Cj4gPj4gPiArc3RhdGljIHZv
aWQgbHMxeF9uYW5kX3RyaWdnZXJfb3Aoc3RydWN0IGxzMXhfbmFuZF9ob3N0ICpob3N0LCBzdHJ1
Y3QgbHMxeF9uYW5kX29wICpvcCkKPiA+PiA+ICt7Cj4gPj4gPiArICAgICBzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwID0gJmhvc3QtPmNoaXA7Cj4gPj4gPiArICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10
ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+ID4+ID4gKyAgICAgaW50IGNvbDAgPSBvcC0+YWRkcnNb
MF07Cj4gPj4gPiArICAgICBzaG9ydCBjb2w7Cj4gPj4gPiArCj4gPj4gPiArICAgICAvKiByZXN0
b3JlIHJvdyBhZGRyZXNzIGZvciBjb2x1bW4gY2hhbmdlICovCj4gPj4gPiArICAgICBpZiAob3At
PmlzX2NoYW5nZV9jb2x1bW4pIHsKPiA+PiA+ICsgICAgICAgICAgICAgb3AtPmFkZHIyX3JlZyA9
IHJlYWRsKGhvc3QtPnJlZ19iYXNlICsgTFMxWF9OQU5EX0FERFIyKTsKPiA+PiA+ICsgICAgICAg
ICAgICAgb3AtPmFkZHIxX3JlZyA9IHJlYWRsKGhvc3QtPnJlZ19iYXNlICsgTFMxWF9OQU5EX0FE
RFIxKTsKPiA+PiA+ICsgICAgICAgICAgICAgb3AtPmFkZHIxX3JlZyAmPSB+KG10ZC0+d3JpdGVz
aXplIC0gMSk7Cj4gPj4gPiArICAgICB9Cj4gPj4KPiA+PiBUaGlzIGxvb2tzIHZlcnkgc3VzcGlj
aW91cy4gWW91IHNob3VsZCBub3QgaGF2ZSB0byBkbyB0aGF0IGFuZCB0byBiZQo+ID4+IGhvbmVz
dCwgSSBkb24ndCB1bmRlcnRhbmQgd2hhdCB0aGlzIG1lYW5zLgo+ID4+Cj4gPiBUaGUgTG9vbmdz
b24tMSBOQU5EIGNvbnRyb2xsZXIgcmVxdWlyZXMgYSBmdWxsIGFkZHJlc3MgKGNvbHVtbiBhZGRy
ZXNzCj4gPiArIHJvdyBhZGRyZXNzKS4KPiA+IEhvd2V2ZXIsIG5hbmRfY2hhbmdlX3JlYWRfY29s
dW1uX29wKCkgZnVuY3Rpb24gb25seSBwcm92aWRlcyB0aGUKPiA+IGNvbHVtbiBhZGRyZXNzLiBU
aGVyZWZvcmUsIHRoZSByb3cgYWRkcmVzcyBtdXN0IGJlIHJlc3RvcmVkLgo+ID4gVGhlIGFib3Zl
IGxvZ2ljIHJldHJpZXZlcyB0aGUgcm93IGFkZHJlc3MgZnJvbSB0aGUgYWRkcjFfcmVnIGluIG9y
ZGVyCj4gPiB0byByZXN0b3JlIHRoZSByb3cgYWRkcmVzcy4KPgo+IElmIGl0IG5lZWRzIHRoZSBm
dWxsIG9mZnNldCwgaXQncyBwcm9iYWJseSBub3QgYSBjaGFuZ2UgY29sdW1uCj4gY29tbWFuZC4K
Pgo+IFdoYXQgeW91IGRvIGhlcmUgaXMgdmVyeSByaXNreSBhbmQgY2xlYXJseSBub3QgZnV0dXJl
IHByb29mLCBJJ2QgcHJlZmVyCj4gdG8gYXZvaWQgaXQuIElmIGFueXRoaW5nIGhhcHBlbnMgaW4g
dGhlIGNvcmUgYmV0d2VlbiB0aGUgcmVhZDAgYW5kIHRoZQo+IGNvbHVtbiBjaGFuZ2UsIHlvdXIg
bG9naWMgYnJlYWtzLCBhbmQgdGhlcmUgYXJlIGNoYW5jZXMgdGhhdCB0aGlzIHdpbGwKPiBoYXBw
ZW4gYXQgc29tZSBwb2ludC4KPgo+IEFyZSB5b3Ugc3VyZSB5b3UgaW1wbGVtZW50ZWQgaXQgY29y
cmVjdGx5PyBXaGF0IGlmIHlvdSBwcm92aWRlIDAgYXMgcGFnZQo+IG9mZnNldD8gSWYgdGhlcmUg
aXMgbm8gY2hhbmdlIGNvbHVtbiBwb3NzaWJsZSwgbWF5YmUgdGhlIGJlc3QgdGhpbmcgaXMKPiB0
byBub3Qgc3VwcG9ydCBpdC4KClVuZGVyc3Rvb2QuCkkgd2lsbCBpbXByb3ZlIC5wYXJzZV9hZGRy
ZXNzIHdpdGggcmVnbWFwX3VwZGF0ZV9iaXRzKCkgdG8gYXZvaWQgdGhpcwpyZXN0b3JlIGxvZ2lj
LgoKPgo+IC4uLgo+Cj4gPj4gPiArc3RhdGljIGludCBsczF4X25hbmRfY29udHJvbGxlcl9pbml0
KHN0cnVjdCBsczF4X25hbmRfaG9zdCAqaG9zdCkKPiA+PiA+ICt7Cj4gPj4gPiArICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXYgPSBob3N0LT5kZXY7Cj4gPj4gPiArICAgICBzdHJ1Y3QgZG1hX2NoYW4g
KmNoYW47Cj4gPj4gPiArICAgICBzdHJ1Y3QgZG1hX3NsYXZlX2NvbmZpZyBjZmcgPSB7fTsKPiA+
PiA+ICsgICAgIGludCByZXQ7Cj4gPj4gPiArCj4gPj4gPiArICAgICBob3N0LT5yZWdtYXAgPSBk
ZXZtX3JlZ21hcF9pbml0X21taW8oZGV2LCBob3N0LT5yZWdfYmFzZSwgJmxzMXhfbmFuZF9yZWdt
YXBfY29uZmlnKTsKPiA+PiA+ICsgICAgIGlmIChJU19FUlIoaG9zdC0+cmVnbWFwKSkKPiA+PiA+
ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGhvc3QtPnJl
Z21hcCksICJmYWlsZWQgdG8gaW5pdCByZWdtYXBcbiIpOwo+ID4+ID4gKwo+ID4+ID4gKyAgICAg
Y2hhbiA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAicnh0eCIpOwo+ID4+ID4gKyAgICAgaWYgKElT
X0VSUihjaGFuKSkKPiA+PiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2
LCBQVFJfRVJSKGNoYW4pLCAiZmFpbGVkIHRvIHJlcXVlc3QgRE1BIGNoYW5uZWxcbiIpOwo+ID4+
ID4gKyAgICAgaG9zdC0+ZG1hX2NoYW4gPSBjaGFuOwo+ID4+ID4gKwo+ID4+ID4gKyAgICAgY2Zn
LnNyY19hZGRyID0gaG9zdC0+ZG1hX2Jhc2U7Cj4gPj4gPiArICAgICBjZmcuc3JjX2FkZHJfd2lk
dGggPSBETUFfU0xBVkVfQlVTV0lEVEhfNF9CWVRFUzsKPiA+PiA+ICsgICAgIGNmZy5kc3RfYWRk
ciA9IGhvc3QtPmRtYV9iYXNlOwo+ID4+Cj4gPj4gRG9uJ3QgeW91IG5lZWQgYSBkbWFfYWRkcl90
IGhlcmUgaW5zdGVhZD8gWW91IHNoYWxsIHJlbWFwIHRoZSByZXNvdXJjZS4KPiA+Pgo+ID4gU29y
cnksIEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZC4KPiA+ICdkbWFfYmFzZScgaXMgYWxyZWFkeSBv
ZiB0eXBlIGRtYV9hZGRyX3QuCj4KPiBJIGRpZG4ndCBpZGVudGlmeSB3aGVyZSB0aGUgZG1hX2Jh
c2Ugd2FzIHJlbWFwcGVkLCBidXQgaWYgdGhhdCdzIGFscmVhZHkKPiBkb25lIHRoZW4gd2UncmUg
Z29vZC4KClBlcmhhcHMgSSBtaXN1bmRlcnN0YW5kIHRoZSB1c2FnZSBvZiBkbWFfbWFwX3Jlc291
cmNlKCkuIGRtYV9iYXNlIGlzCnRoZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCB3aWxsIGJlIHdyaXR0
ZW4gdG8gdGhlIERNQSBjb250cm9sbGVyCnJlZ2lzdGVyIGF0IGxhc3QuIEl0IHNob3VsZCBiZSBk
ZWZpbmVkIGFzIHRoZSBwaHlzX2FkZHJfdCB0eXBlIGFuZCBzZXQKdG8gJ3Jlcy0+c3RhcnQnIGRp
cmVjdGx5IHdoZW4gcHJvYmluZy4gQW0gSSByaWdodD8KCj4KPiBUaGFua3MsCj4gTWlxdcOobAoK
CgotLSAKQmVzdCByZWdhcmRzLAoKS2VndWFuZyBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
