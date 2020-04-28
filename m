Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503FFC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 14:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225B6206D7
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 14:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FJvEo26M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gz96JQOf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225B6206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icbrxuuRqQIxd3j0j2GnIf1uk888b7RrbkaQ2xn0OfA=; b=FJvEo26M2jnvQq
	z/LWr1qVBokutP/+bGp9wVwSaoyOX/iw8s8GFNiuX0XZtGaaOjW4jI3b8PM5kA96/3F+A0tzcFm+F
	A4gZ7wkHaCjaSH871djTyGVg9TcXQRqUVHwrflZqBw6QHyAb4nnxtHSvxdEfyJJZPZ8hLznZEb2Ij
	63f3mk5sWDgWzylp6x0M/DM5ty+8r1h8TAqv2k164krVcqbbUatkbQVUaqWSW4fh5Olx7UeyiaBB1
	CynwjZHcW+vQfyJKbYs0LSgacyr2E91jpSFrKYqjtdt54iRxAmO8isEhkMi+/t64Ogb848vep/woV
	ZBaZ3oBTHnKk912IkG8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTR2u-0001kY-T6; Tue, 28 Apr 2020 14:17:12 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTR2s-0001jj-FG
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 14:17:11 +0000
Received: by mail-lj1-x241.google.com with SMTP id y4so21670972ljn.7
 for <linux-mtd@lists.infradead.org>; Tue, 28 Apr 2020 07:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tMguRcMyYXq1NjFYCEi3+OHxr9n8bP8JQQATfonpxco=;
 b=gz96JQOf4s34uWBWWEx66ON1NvS1zeyPO97L8iMcu30zWig9UEKyfT+iZpIoawZo5v
 +Q9zQydHcTF+4Bjmt1w8bSdPnFjrEznv+UEYg23Nd4Wg+4QY6BdOsA3X4WtutdCNSsjm
 4zcfGbBsG1u2lxxDNPUM/QxejKPagDKjpfMiPE/iH1dnDzhqOAgpWBE9thAO4KjggJRh
 SxGwQedF+7abnMPtOdaEYqmdBUH4TzR6oyNnIifesEIcRySb2X1rm9xmBtdT/y0Fp/0g
 Df1oPNwcZwDDwgs2uDpENspIgUCozDV85dqdKCYa5iHFRQhX2GC3ElmH0bRntSeb2Wxf
 aNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tMguRcMyYXq1NjFYCEi3+OHxr9n8bP8JQQATfonpxco=;
 b=Ub7tqd0FAXscBGFkivXV7i1eP5ISlTUHwkpr3VyqtIMQBnuD0XHIOe6jVtb9GMNPs5
 zJgNIcQba/TWj9MHq7mopwexvboXL6m54JpWIWE4O2YnEWCmH9p/HK106E1aSmekqyG7
 AtZ11tBGYB8UTpE9OGD+1lHORVCPkAO/6gruuJgMtyGLXWnDER/qsDXnofyvRfyXoQdX
 bLmBOLKBMm8vSeZnK06xKzdhOoVUs/Q+3P3RJ7D9+XiBW6GqVgJm1R+IqawI5vJa4r29
 f7zJjLZhPU2tNymWu7Va9GHFZWHlsGWytOwkqGlEHeokMcczerNFt66P79qJ4QKZGkHb
 TQww==
X-Gm-Message-State: AGi0PuZBVGfPb5QeHVC+VL/l9AIcK23JIaPKzPpBgTfyWJ0ddShr4Pi1
 vVLdrGickht6x/PfFDAquFuOUoU4gPZay5/etyh0hA==
X-Google-Smtp-Source: APiQypKAwCXRu1gnsqkOPY2GeDtvM+ZMj5mATAuXVIgovirMH7+T2nAtX2o1FjY9kICtbzahxGEcRHj+wVTJXhz0Rmo=
X-Received: by 2002:a05:651c:1058:: with SMTP id
 x24mr18437689ljm.39.1588083427969; 
 Tue, 28 Apr 2020 07:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200403081544.37061-1-yanaijie@huawei.com>
 <20200427155313.43847da8@xps13>
In-Reply-To: <20200427155313.43847da8@xps13>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 16:16:55 +0200
Message-ID: <CACRpkdY06GvLRcfD0pjhJ6woHUY8rxi5hqKPmyS7nrhJ_BXrQA@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of_gemini: remove defined but not used
 symbol 'syscon_match'
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_071710_523654_C7775FEE 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>,
 linux-mtd@lists.infradead.org, Vignesh R <vigneshr@ti.com>,
 Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMjcsIDIwMjAgYXQgMzo1MyBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiBKYXNvbiBZYW4gPHlhbmFpamllQGh1YXdlaS5jb20+
IHdyb3RlIG9uIEZyaSwgMyBBcHIgMjAyMCAxNjoxNTo0NCArMDgwMDoKPgo+ID4gSXQncyBub3Qg
dXNlZCBieSBhbnlvbmUgbm93LCByZW1vdmUgaXQuIEZpeCB0aGUgZm9sbG93aW5nIGdjYyB3YXJu
aW5nOgo+ID4KPiA+IGRyaXZlcnMvbXRkL21hcHMvcGh5c21hcC1nZW1pbmkuYzo0OTozNDogd2Fy
bmluZzog4oCYc3lzY29uX21hdGNo4oCZIGRlZmluZWQKPiA+IGJ1dCBub3QgdXNlZCBbLVd1bnVz
ZWQtY29uc3QtdmFyaWFibGU9XQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IHN5c2Nvbl9tYXRjaFtdID0gewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVh
d2VpLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNv
bT4KPiA+IC0tLQo+Cj4gSSBhbSBub3Qgc3VyZSB0aGlzIGlzIHRoZSByaWdodCBzb2x1dGlvbi4g
VGhpcyBjb21wYXRpYmxlIGhhcyBiZWVuCj4gYWRkZWQgaW4gdGhpcyBkcml2ZXIgYnkgTGludXMg
aW4gOWQzYjUwODZmNmQ0ICgibXRkOiBwaHlzbWFwX29mX2dlbWluaToKPiBIYW5kbGUgcGluIGNv
bnRyb2wiKS4gSSBiZWxpZXZlIGhlIGhhZCBhIGdvb2QgcmVhc29uIHRvIGRvIHNvIGJ1dCB5b3UK
PiBhcmUgcmlnaHQgdGhhdCBpdCBpcyBub3QgdXNlZC4gTGludXMsIGFueSBpbnB1dD8KClJldmll
d2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpJdCdzIHBy
b2JhYmx5IGp1c3QgYSByZW1uYW50IG9mIGVhcmxpZXIgZGV2ZWxvcG1lbnQsIHNvcnJ5IGZvciB0
aGF0LgpXZSBub3cgbG9jYXRlIHRoZSBzeXNjb24gYnkgcGhhbmRsZToKcm1hcCA9IHN5c2Nvbl9y
ZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUobnAsICJzeXNjb24iKTsKCllvdXJzLApMaW51cyBXYWxs
ZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
