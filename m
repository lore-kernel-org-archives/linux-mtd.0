Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8611C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 16:54:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF1C20679
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 16:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iDA7NDge";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="HXxlyEyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF1C20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mzITE8uN/lREJvAfVBpau3mAg7jKSHvIyGUvpBsR52s=; b=iDA7NDgeEHcoL+g9zANtb9Y5d8
	tpbURB4ChfG2TRNLBA33U9UaaX8PXweGvpm1gSYHmuMAo+YKlFH5F5wDQwbPFC7I0sy3jVIpCjH8N
	/AOt0k7thQSA8hjnLC9XOw0Ji1ofaTbKcmJh3ocoDGaD4b1Qfkv3xxtfy3yfIoNgeLf1ZDm2Bfttb
	EG2W62WsEZUUbFNQ4nnpEk9L5SuEB8L0Y/0DBd4QQgwmln/gj3v05tTjsTeqVOErgcDJLYkP4iwr4
	b6Vnu4oSLs+ik4xZjuNVPVjwHOCzkIqvKTGc9dnefihfE8DyEUMvCCgz3B+MZYqxjDOAjmPc8gsbB
	02IjObLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUCxN-0003C4-7z; Mon, 11 Nov 2019 16:54:25 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUCxK-0003Bi-C2
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 16:54:23 +0000
Received: by mail-ua1-x942.google.com with SMTP id z9so3794985uan.3
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2019 08:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
 :content-transfer-encoding;
 bh=mFI4/I6Jeuk6SK5D3wA5k3bfoiLfVkorGOScgjTq8z4=;
 b=HXxlyEypQ8VEXsVNJtiCTzvrT20ebza6u+ZBj6RbBpK7nQ29t8xj60bZTq9aIqEqqN
 222ac4r/b9tzvaWEwB99wKAOPsH4W69Hn61EhKIH5mhXNTIcCX8Hjg6Wg0y+BfFCe6KV
 6sqEhpK/j4t3qX/JUnFbwk5kQGt/pkLB+Ml/ymhb5en5+YypIeuopyPEJekbLtoVEokN
 vtT2KYcDQmzHMgLEnioupPkANr8zLvAD5RY9s744s9DaFZp138lz60SPROyz8Ryl3NnE
 O/wBIPYuhjtsavew0Y78ixh3m9PmD+XvYDWIr4Ep0EfiTC6fjlPCO9O5a3E82FfPPG7i
 O3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc:content-transfer-encoding;
 bh=mFI4/I6Jeuk6SK5D3wA5k3bfoiLfVkorGOScgjTq8z4=;
 b=uTwgLqPFDlU1gH53ocGrWp/2cKiPW1t5qrr5KbSfv6OoSLVROIBBLYNtOqYnov1Riy
 +2cUXZ6HAcAp7cyBxOaWNeAc+E4ox+AW+EcXHaxgesRKR4fgrBAA545J8EiWc7SXB/q+
 BOUim/+VeTYynRvab65EZn916MC4OQstb3kTytMG7X7Y5KV5g8DbA5G4BG7tHc3tdXSw
 dY6w4SfsbDjTRCH9MTM9ooyycCpRL9nbdPeDLnFKZ73BoTc0bWI5b26PekpI4IFxbYZy
 IJ56H9TSNG7uCQrxB3mq7v3uynS8l3XP2vTjBmBPJ509mhT+qqQGGHVzY8rb5vt0v2sx
 uP9A==
X-Gm-Message-State: APjAAAUftOO/rkDdl4pQ7pCcd3x8mA4D54oZKOGZoeLLSzllI2R0ver2
 U99Q+AxkMnk1/OTZT7wYLDTjUhrTRHfscswTLKsY4xjg
X-Google-Smtp-Source: APXvYqxc4LKG2eTEZ+N4taC64ZmmO6imoafwCtRlI9qo2zWHXGPBwRJ2kiaGarvgEkQgB1FrCsBZu+QR+QmWiqJMO4U=
X-Received: by 2002:ab0:7509:: with SMTP id m9mr6469180uap.136.1573491260876; 
 Mon, 11 Nov 2019 08:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20191030113957.1625342-1-angelo.dureghello@timesys.com>
 <20191105194122.4dcee126@xps13> <20191105231709.GB12610@lunn.ch>
 <CALJHbkDoiireW8iNqGgqRRQdQcKjiLVnxUcFBGkgzE=qsba7-A@mail.gmail.com>
In-Reply-To: <CALJHbkDoiireW8iNqGgqRRQdQcKjiLVnxUcFBGkgzE=qsba7-A@mail.gmail.com>
From: Angelo Dureghello <angelo.dureghello@timesys.com>
Date: Mon, 11 Nov 2019 17:56:20 +0100
Message-ID: <CALJHbkDcku55=NPHjhdofZQW-gB-6J_Sxar55TxuMX609S3YPQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: devices: fix mchp23k256 read and write
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_085422_408653_6DC5787A 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKbWFueSB0aGFua3MuCgpMZXQgbWUga25vdyBpZiBpIG5lZWQgdG8gcHJlcGFyZSBh
IHYxIHdpdGggcHJvcGVyIHRhZ3MgaW4gY2FzZS4KClJlZ2FyZHMsCkFuZ2VsbwoKT24gV2VkLCBO
b3YgNiwgMjAxOSBhdCAxMjoxNyBBTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3Rl
Ogo+Cj4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMDc6NDE6MjJQTSArMDEwMCwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPiA+IEhpIEFuZ2VsbywKPiA+Cj4gPiArIEFuZHJldwo+ID4KPiA+IEFuZ2Vs
byBEdXJlZ2hlbGxvIDxhbmdlbG8uZHVyZWdoZWxsb0B0aW1lc3lzLmNvbT4gd3JvdGUgb24gV2Vk
LCAzMCBPY3QKPiA+IDIwMTkgMTI6Mzk6NTcgKzAxMDA6Cj4gPgo+ID4gPiBEdWUgdG8gdGhlIHVz
ZSBvZiBzaXplb2YoKSwgY29tbWFuZCBzaXplIHNldCBmb3IgdGhlIHNwaSB0cmFuc2Zlcgo+ID4g
PiB3YXMgd3JvbmcuIERyaXZlciB3YXMgc2VuZGluZyBhbmQgcmVjZWl2aW5nIGFsd2F5cyAxIGJ5
dGUgbGVzcwo+ID4gPiBhbmQgZXNwZWNpYWxseSBvbiB3cml0ZSwgaXQgd2FzIGhhbmdpbmcuCj4g
PiA+Cj4gPiA+IGVjaG8gLW4gLWUgIlxceDFcXHgyXFx4M1xceDQiID4gL2Rldi9tdGQxCj4gPiA+
Cj4gPiA+IEFuZCByZWFkIHBhcnQgdG9vIG5vdyB3b3JrcyBhcyBleHBlY3RlZC4KPiA+ID4KPiA+
ID4gaGV4ZHVtcCAtQyAtbjE2IC9kZXYvbXRkMQo+ID4gPiAwMDAwMDAwMCAgMDEgMDIgMDMgMDQg
YWIgZjMgYWQgYzIgIGFiIGUzIGY0IDM2IGRkIDM4IDA0IDE1Cj4gPiA+IDAwMDAwMDEwCj4gPiA+
Cj4gPgo+ID4gTG9va3MgZmluZSBieSBtZSwganVzdCBhZGRlZCBBbmRyZXcgaW4gY2FzZSBoZSB3
YW50cyB0byByZXZpZXcgdGhlCj4gPiBwYXRjaCBhcyBoZSB3YXMgdGhlIG9yaWdpbmFsIGNvbW1p
dHRlci4KPiA+Cj4gPiBBbnl3YXkgeW91J3JlIG1pc3NpbmcgYSBDYzogc3RhYmxlIGFuZCBGaXhl
cyB0YWcgb24KPiA+IDVkYzE3ZmE2ZmI3MCAoIm10ZDogbWNocDIzazI1NjogQWRkIGRyaXZlciBm
b3IgdGhpcyBTUEkgU1JBTSBkZXZpY2UiKQo+Cj4gSGkgTWlxdcSNbAo+Cj4gVGhpcyBpcyB0aGUg
d3JvbmcgZml4ZXMgdGFnLiBUaGUgY29ycmVjdCBvbmUgaXMKPgo+IEZpeGVzOiA0Mzc5MDc1YTg3
MGIgKCJtdGQ6IG1jaHAyM2syNTY6IEFkZCBzdXBwb3J0IGZvciBtY2hwMjNsY3YxMDI0IikKPgo+
IFJldmlld2VkLWJ5OiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Cj4KPiAgICAgQW5kcmV3
CgoKCi0tIApBbmdlbG8gRHVyZWdoZWxsbwpUaW1lc3lzCmVtYWlsOiBhbmdlbG8uZHVyZWdoZWxs
b0B0aW1lc3lzLmNvbQpjZWxsLjogICszOSAzODggODU1MDY2MwoKCi0tIApBbmdlbG8gRHVyZWdo
ZWxsbwpUaW1lc3lzCmVtYWlsOiBhbmdlbG8uZHVyZWdoZWxsb0B0aW1lc3lzLmNvbQpjZWxsLjog
ICszOSAzODggODU1MDY2MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
