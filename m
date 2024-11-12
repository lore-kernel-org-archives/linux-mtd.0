Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03EDD41D5F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0mFSDnsoD+H2HlMPxLnlhlZfivNoYZlbmFvoTgX+wM=; b=KyROZU71DpSTy6
	Y/IoOv+23xeW8JjB/xnnmPJ9z9w8w+CoGm2zivnEACER0h6ERncLYEHT9dITkr5QksZ83rHp/qY+V
	ry7nOCpBY/EmGKok2KlXgQ/xV17ZwmpSK9cIoZhOMia+SHDuQUb47OmsTmE5Ob/qG5LoTHEoBEpwv
	6CV/dLF1uR6yVQjUlBndab+VXwEHC1DdmEsVxDXNHubyrC0EVGg42bbXBLGYHWpn4/P61IHUKV+XX
	mHTq3PBbnAkjNI3UH/VCZ7R0ZjYUqUZt1naJVTOe/2Bed+72Trjqk7Zd+P3pSH+YHyijDEm5P4GAg
	odAEFlA8sM9LLEuDpfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlAu-00000002Rdl-3mV9;
	Tue, 12 Nov 2024 07:18:56 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAl9c-00000002RV7-3vHj
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 07:18:54 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso3491597a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 23:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731395856; x=1732000656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdTSL3bPyeel70GQs8CTsyCqq5ROgc7uR7+832ivbvc=;
        b=FfpTiWbd/ZRFIaDUqHAKFJVzcooUdHZESz/r57TO1forSdubZKnF6k8tFJ5s32stEU
         d2I3I+o32s4AQXz1vNF9xgmG99Ec2l0DYmnFBgQL73QDRKLToqUaLTl+sJLhZzkhXIP8
         tWmCQ6Oc5Cy5rkiaRIi4Ri/pUD4WDO6DTOi3EliTjwrhvmYhrX8JBG1MMP4fkT1nTG3M
         Eg+7A1QWYmXyhC6O+VOUvyhkPSmhhB7nokvi3K3lL78ZD2GglsRFa+8Ns6/mztToC8b0
         tD4QRX75xwnRy9hAgobcW8okvTJSoaL5gLsnYcCjXeLV4iipTAED42IM7XZqt807R2VA
         XL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731395856; x=1732000656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdTSL3bPyeel70GQs8CTsyCqq5ROgc7uR7+832ivbvc=;
        b=iKCoIf5uCzyaViNUfbsC3Jj7R4o9wma1C9u/h2DpYWSZMy5pkMmU+RUUplxCDSFagK
         y9P5j5TCzTC3j3T5rXkbnm+LHeSCoRyOVcoLohpjyKdwRVilja+zQwLmM0+Md0H9ycKv
         4/1nxhsoawC0hPYmQixbUXeCzyySrWdwT9p5z6jRn86FXSGHtjyJUxXQ1Od0vkzdxsnx
         j7JGbGJOif4KIRTnnF7aYBX3voPz+UBwxSDRJ9FgZ5Sj25m286HCd5M9k+pRahQGlwT8
         iYmv8UQsBThCHdmltCEVAWthYWQYcZJZqQ3AzaW2NAAiJvk5s8C/f2DdAnHG7PwRW3Gu
         GDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkNnhLBm0ch8Zr1LSVA5PkkxflgrgMdsTNtwHVetBNU82KGn0qWE6FeYGulSImwKzJYJVO1/ilGfU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxBZKh9PenrXuRrWL6XczXdv78zLw7P4eVS23DhyMxrZU9PMDm
	Ew7ZvPSe2uFA+I65LsykeEtSOqMNi3V3OvYevfdi6BLB7TJZP81oamK30UAm21CiU5eW4eScIq7
	NIzM+RqtOUTgPMcx5F5axYGyNMN4=
X-Google-Smtp-Source: AGHT+IE+x+lmwr95Cl0SxyEOyPM7jDp+2bQ1c4PhkNzVRShJepB8ezs3sjWk6yOp7X1A5kUB3xiLrt7/re429NJ3bV4=
X-Received: by 2002:a05:6a20:914c:b0:1db:da3b:c45b with SMTP id
 adf61e73a8af0-1dc5f8ee5e4mr2373080637.17.1731395855859; Mon, 11 Nov 2024
 23:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20241107093016.151448-1-linchengming884@gmail.com>
 <437e9c87-fbae-4402-858c-ce6de0a992c7@linaro.org> <CAAyq3Sb-dmmF8YsOdTYxZqX8Wn4d=WiAXkS4bHp5FLn3S+ouXg@mail.gmail.com>
 <01160386-a65f-44b0-ac57-ad77754f01cc@linaro.org> <5a2c8f53-117f-4ffb-9f85-de1ae83ff835@linaro.org>
In-Reply-To: <5a2c8f53-117f-4ffb-9f85-de1ae83ff835@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 12 Nov 2024 15:16:46 +0800
Message-ID: <CAAyq3SbVkRmUbeuaf8_HMsdug+roRxvQjw9nanD5W5JDfOmpfw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: replace dummy buswidth from addr to data
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_231737_002423_228F0584 
X-CRM114-Status: GOOD (  19.75  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI05bm0MTHmnIgxMuaXpSDpgLHkuowg5LiL5Y2IMzowNuWvq+mBk++8mgo+Cj4KPgo+IE9uIDEx
LzEyLzI0IDY6NDUgQU0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gPgo+ID4KPiA+IE9uIDExLzEy
LzI0IDI6NDIgQU0sIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+ID4+IEhpIFR1ZG9yLAo+ID4+Cj4g
Pj4gVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiDmlrwgMjAyNOW5tDEx
5pyIMTHml6Ug6YCx5LiAIOS4i+WNiDY6MTjlr6vpgZPvvJoKPiA+Pj4KPiA+Pj4KPiA+Pj4KPiA+
Pj4gT24gMTEvNy8yNCA5OjMwIEFNLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiA+Pj4+IEZyb206
IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPj4+Pgo+ID4+Pj4g
VGhlIGRlZmF1bHQgZHVtbXkgY3ljbGUgZm9yIE1hY3Jvbml4IFNQSSBOT1IgZmxhc2ggaW4gT2N0
YWwgT3V0cHV0Cj4gPj4+PiBSZWFkIE1vZGUoMS0xLTgpIGlzIDIwLgo+ID4+Pj4KPiA+Pj4+IEN1
cnJlbnRseSwgdGhlIGR1bW15IGJ1c3dpZHRoIGlzIHNldCBhY2NvcmRpbmcgdG8gdGhlIGFkZHJl
c3MgYnVzIHdpZHRoLgo+ID4+Pj4gSW4gdGhlIDEtMS04IG1vZGUsIHRoaXMgbWVhbnMgdGhlIGR1
bW15IGJ1c3dpZHRoIGlzIDEuIFdoZW4gY29udmVydGluZwo+ID4+Pj4gZHVtbXkgY3ljbGVzIHRv
IGJ5dGVzLCB0aGlzIHJlc3VsdHMgaW4gMjAgeCAxIC8gOCA9IDIgYnl0ZXMsIGNhdXNpbmcgdGhl
Cj4gPj4+PiBob3N0IHRvIHJlYWQgZGF0YSA0IGN5Y2xlcyB0b28gZWFybHkuCj4gPj4+Pgo+ID4+
Pj4gU2luY2UgdGhlIHByb3RvY29sIGRhdGEgYnVzd2lkdGggaXMgYWx3YXlzIGdyZWF0ZXIgdGhh
biBvciBlcXVhbCB0byB0aGUKPiA+Pj4+IGFkZHJlc3MgYnVzd2lkdGguIFNldHRpbmcgdGhlIGR1
bW15IGJ1c3dpZHRoIHRvIG1hdGNoIHRoZSBkYXRhIGJ1c3dpZHRoCj4gPj4+PiBpbmNyZWFzZXMg
dGhlIGxpa2VsaWhvb2QgdGhhdCB0aGUgZHVtbXkgY3ljbGUtdG8tYnl0ZSBjb252ZXJzaW9uIHdp
bGwgYmUKPiA+Pj4+IGRpdmlzaWJsZSwgcHJldmVudGluZyB0aGUgaG9zdCBmcm9tIHJlYWRpbmcg
ZGF0YSBwcmVtYXR1cmVseS4KPiA+Pj4KPiA+Pj4gVGhpcyBpcyBzdGlsbCB2ZXJ5IHdyb25nIGFu
ZCB0aGUgYGZpeGAgaXMgd29ya2luZyBqdXN0IGJ5IGNoYW5jZS4KPiA+Pj4gQ29uc2lkZXIgd2hh
dCBoYXBwZW5zIHdoZW4gb25lIHJlcXVpcmVzIDEwIGR1bW15IGN5Y2xlcy4gQlRXLCBkb2VzIHRo
aXMKPiA+Pj4gZml4IGEgcmVhbCBwcm9ibGVtLCBvciBpdCdzIGp1c3QgYSB0aGVvcmV0aWNhbCBm
aXg/Cj4gPj4KPiA+PiBJbiAxLTEtOCBtb2RlLCBzZXR0aW5nIHRoZSBkdW1teSBidXN3aWR0aCB0
byBtYXRjaCB0aGUgZGF0YQo+ID4+IGJ1c3dpZHRoIGVuc3VyZXMgYSBkdW1teSBidXN3aWR0aCBv
ZiA4LCB3aGljaCBjYW4gYWNjb21tb2RhdGUKPiA+PiBhbGwgdHlwZXMgb2YgZHVtbXkgY3ljbGVz
Lgo+ID4+Cj4gPj4gVGhpcyBwYXRjaCByZXNvbHZlcyBhIHNpZ25pZmljYW50IGlzc3VlIGluIDEt
MS04IG1vZGUsIGFzIGRlc2NyaWJlZCBhYm92ZS4KPiA+Pgo+ID4KPiA+IHNoYWxsIHdlIGFkZCBh
IGZpeGVzIHRhZyB0aGVuLCBhbmQgYSBjYyB0byBzdGFibGU/Cj4KPiBJIG5lZWQgYSBwYXRjaCB0
b2RheSBpZiB5b3Ugd2FudCBpdCBpbnRlZ3JhdGVkIGluIHRoZSBTUEkgTk9SIFBSLgo+IE90aGVy
d2lzZSB3ZSdsbCBxdWV1ZSBvbmUgaW4gdGhlIC1yYyBwaGFzZS4KClN1cmUsIHNvIGRvIEkgbmVl
ZCB0byBzdWJtaXQgYSBzZWNvbmQgdmVyc2lvbiBvZiB0aGUgcGF0Y2gKd2l0aCB0aGUgRml4ZXMg
dGFnIGFuZCBjYyBpdCB0byBzdGFibGU/CgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
