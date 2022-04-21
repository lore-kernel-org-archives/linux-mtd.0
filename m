Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113BCC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYR+bVW7/Z+zB9BA7Sxmx0KYLAeenhOebp9xxyWNV2g=; b=fbKarItnMry7DT
	U3kz/X9KJfam3hC1ih/vOuuRcWtAoZG42cO+AINEYA0v7qu/VwRox+7w9CFa70zhtCV4Sh/LvNpeJ
	CwMP4CXoabbiLP+xkRxiMEtpz+IpuMyyD4jfHCDHEljcmGd6qQGBDhUprJvYuRMyShkv2NzhdKIOa
	r7K2mmp7ycxD9o73Rs9UnLCI8MHMEVPyLPgONRQ9J7fetiCyW3P0J0ZHixT6A8cBGTARv/SHQ4+qX
	bSfdpQUO89pCoJqSC3PPOAOxqTAsQ6/QaWTtabXk2yeo8rDV77uqjaODs5aYT7BEehx+ZVh5aoGHR
	uB81CM5wW7Ik8wR1kHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhXla-00DlHf-RN; Thu, 21 Apr 2022 14:26:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhXlX-00DlGL-S6
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 14:26:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id b7so5040146plh.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4T7+aggU/kcRj6JQa3rKYgzeyyPLeJNcurVvJ9HPYa0=;
 b=cAr0uJJyqROFtDSNCkwavqpNX+biOXDCVd6etsjK6txqjWlr6WoW8MsXgSoBAWRc7I
 nKz7c4R9caw/7C5SVRydlNQeoh7jykt9RUWe7ggzwkpOTlirL3qZ6OjvNsPaQ/0Y9WfB
 5ae3mnmNmFPq1ON6xyteiwIXpipQ4oekOKd58PeH32mMYIOtC81FjE4JXIKy9qzVXA14
 x3IRLVW37TCUMhBBO9yVOn/grV2VwaVEk29eLa8w1Hgh+S2zUpAfr5eYV79JjrjXXINI
 wcEnCb3RRAEmv+xh6f+2TZsVHKtz+ZNVxEQ1RNVpL25fHB52xb/ItakvRB/kID6XhnRf
 URxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4T7+aggU/kcRj6JQa3rKYgzeyyPLeJNcurVvJ9HPYa0=;
 b=yPrcUJQLqr28DQd4IBh/29TVmaCEQww51FXg7gDdQVr7x2p3tZ3XUf5YwO4gnWt4W8
 xY5xwBn8iLw7dtO3Mpt/WWVrrY8IwJ4nJhwOW4PB+lqps2hFRUMn6umNTfiurkhVAs/a
 SrV2igjG2IZpwgIFHtzX0ZcBETjMTRXBk6wkxd2rkJEb6mxH6og1Ya6yUsXMwPlrgL0N
 0DbYBcO4oZzO03jvBhJknOg3gGZneF6mRmYcoNqnPP7PrwI16AdA9Pz7ArUIM5Hjk5nb
 tLuhuLeCOwiGvVCIQKSasky98zsCQxriMnG0FexdjSWvrYAiJ7LatAEcfbhB+pBeIwQh
 mlJA==
X-Gm-Message-State: AOAM5325yIV4a6Rna15nRxuhUN6NhIoajzfd7lqoZeZDaoVImS0FeJ1e
 1wAzi7+6Pu+CkV/R7k7ijx0=
X-Google-Smtp-Source: ABdhPJxEJ1e6F832QVoABJA/QpyO0kDUsSL/qkQOdl8AQzdi/zPpYnsvG6vTrR8j7uVMnQBa5npJvg==
X-Received: by 2002:a17:902:c951:b0:15b:55ea:5087 with SMTP id
 i17-20020a170902c95100b0015b55ea5087mr799288pla.76.1650551196968; 
 Thu, 21 Apr 2022 07:26:36 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a056a00198900b00508379f2121sm24510310pfl.52.2022.04.21.07.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 07:26:36 -0700 (PDT)
Message-ID: <aea77eb7-4cc9-c93c-8c45-241dd24773a3@gmail.com>
Date: Thu, 21 Apr 2022 23:26:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, michael@walle.cc, Takahiro.Kuwano@infineon.com
Cc: Bacem.Daassi@infineon.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, p.yadav@ti.com, richard@nod.at, vigneshr@ti.com
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
 <20220421112956.292089-1-michael@walle.cc>
 <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
 <9495fb0f56e187ade9b428fd69d84aec@walle.cc>
 <af0fd418-7097-c2d4-dbbf-8cde0c62f765@microchip.com>
 <5a7ba92487dcb1f776b76dcf069fbdf5@walle.cc>
 <1ffd057e-c66a-7704-4434-1584bf9be701@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <1ffd057e-c66a-7704-4434-1584bf9be701@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_072639_950418_9848D3B2 
X-CRM114-Status: GOOD (  25.44  )
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

CgpPbiA0LzIxLzIwMjIgMTA6NTYgUE0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90
ZToKPiBPbiA0LzIxLzIyIDE2OjQyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gQW0gMjAyMi0wNC0yMSAxNToxMywgc2Nocmll
YiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206Cj4+Cj4+Pj4gSWYgdGhlIHBhcnNpbmcgd291
bGRuJ3QgY2hhbmdlIGFueSBydW50aW1lIHBhcmFtZXRlcnMgd2Ugd291bGRuJ3QKPj4+PiBoYXZl
IHRoaXMgcHJvYmxlbSBhdCBhbGwuIG5vPwo+Pj4KPj4+IEl0IGRvZXNuJ3QgY2hhbmdlLCBfYnV0
XyBpdCBzZXRzIHRoZSBjb3JyZWN0IG51bWJlciBvZiBhZGRyZXNzIG5ieXRlcy4KPj4KPj4gSXQg
Y2hhbmdlcyBub3ItPmFkZHJfd2lkdGggd2hpY2ggbWlnaHQgYmUgdXNlZCBmb3IgYWxsIGNvbW1h
bmRzCj4gCj4gbm8sIGl0IF9zZXRzXyB0aGUgbm9yLT5hZGRyX3dpZHRoLiBub3ItPmFkZHJfd2lk
dGggaXMgaW5pdGlhbGl6ZWQgb25seQo+IGluIEJGUFQsIHdoZXJlIEJGUFQgaXMgcHJlc2VudC4g
Tm8gY2hhbmdlIGRvbmUuCj4gCj4+IGV4Y2VwdCB0aGUgcmVhZF9zZmRwX2RhdGEoKS4gSXQgY2hh
bmdlcyBpdCBiZWZvcmUgd2UgYXJlIGVudGVyaW5nCj4+IHRoZSA0IGJ5dGUgbW9kZS4gQWxzbyBw
YXJzZV9zZmRwIGNoYW5nZXMgdGhlIG9wY29kZXMuIEl0IHNlZW1zIHRoaXMKPj4gd2FzIHRoZSBy
ZWFzb24gZm9yIHRoZSBTTk9SX0ZfSEFTXzRCQUlUIGZsYWcgaW4gdGhlIGZpcnN0IHBsYWNlLAo+
PiBzbyB0aGUgY29yZSBkb2Vzbid0IGNvbnZlcnQgdGhlIG9wY29kZXMgYWdhaW4uCj4+Cj4+Pj4g
VGhlIHBhcnNlX3NmZHAoKSBzaG91bGQgb25seSBjaGFuZ2UgbWVtYmVycyBvZiBzdHJ1Y3QKPj4+
PiBzcGlfbm9yX2ZsYXNoX3BhcmFtZXRlcnMsIHRoZSBjYWxsZXIgd2lsbCB0aGVuIGRlY2lkZSBp
ZiB0aGV5Cj4+Pj4gc2hvdWxkIGJlIHVzZWQgYW5kIG1vcmUgaW1wb3JhbnRseSAqd2hlbiogdGhl
eSBzaG91bGQgYmUgdXNlZC4KPj4+Cj4+PiB0aGlzIHdvdWxkIG1lYW4gaW50cm9kdWNpbmcgYSBu
b3ItPnBhcmFtcy0+YWRkcl9uYnl0ZXMsIHdoaWNoCj4+PiBpcyByZWR1bmRhbnQgd2l0aCBTTk9S
X0ZfSEFTXzRCQUlULgo+Pgo+PiBTbz8gVGhlIFNGRFAgdGFibGUgaGFzIGJvdGggaW5mb3JtYXRp
b24sIEkgZG9uJ3Qgc2VlIGEgcHJvYmxlbQo+PiB3aXRoIHRoYXQuIEFuZCBJJ20gbm90IHN1cmUg
dGhleSBhcmUgcmVkdW5hbnQsIEkgdGhpbmsgYSBmbGFzaAo+PiBjYW4gaGF2ZSA0IGJ5dGUgYWRk
cmVzc2VzIGFuZCBubyA0QkFJVCB0YWJsZS4KPiAKPiByaWdodCwgYnV0IHRoaXMgaXMgbm90IHNv
bWV0aGluZyB0aGF0IHdlIGFyZSBhZGRyZXNzaW5nIHJpZ2h0IG5vdy4KPj4KPj4gQW5kIGlmIGl0
IHdvdWxkIGJlIHJlZHVuZGFudCB3aHkgZG8gd2UgbmVlZCB0aGF0IGVtcHR5Cj4+IGNhc2UgYmVs
b3cuLgo+Pgo+Pj4+IFRoZW4geW91IGNhbiBkbyB0aGUgc2FuZSB0aGluZyBpbiBzcGlfbm9yX3Nl
dF9hZGRyX3dpZHRoKCk6Cj4+Pj4gc2V0dGluZyB0aGUgYWRkcl93aWR0aC4KPj4+Pgo+Pj4+IFJp
Z2h0IG5vdyBpdCdzOgo+Pj4+Cj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zZXRfYWRkcl93aWR0
aChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAobm9y
LT5mbGFncyAmIFNOT1JfRl9IQVNfNEJBSVQpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbm9yLT5hZGRyX3dpZHRoID0gNDsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAo
bm9yLT5hZGRyX3dpZHRoKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
YWxyZWFkeSBjb25maWd1cmVkIGZyb20gU0ZEUCAqLwo+Pj4+ICvCoMKgwqDCoMKgwqAgfQo+Pj4+
IC4uCj4+Cj4+IGhlcmUuCj4+Cj4+Pj4KPj4+PiBTb21ldGltZXMgaXQgd2lsbCBzZXQgYWRkcl93
aWR0aCwgc29tZXRpbWVzIGl0IHdpbGwgbm90IGJlIHNldAo+Pj4+IGFuZCBldmVyeSBvbmNlIGlu
IGEgd2hpbGUgNGJ5dGUgbW9kZSBpcyBkZXRlcm1pbmVkIGJ5IFNGRFAgYnV0Cj4+Pj4gaXQgaXMg
bm90IGNvbmZpZ3VyZWQgKFNOT1JfRl9IQVNfNEJBSVQpLgo+Pj4KPj4+IHdoaWNoIGlzIGdvb2Qh
IHdlIHByZWZlciB1c2luZyA0YiBvcGNvZGVzIHRoYW4gZW50ZXJpbmcgNGJ5dGUgYWRkcmVzcwo+
Pj4gbW9kZS4KPj4KPj4gWW91IGRpZG4ndCB1bmRlcnN0YW5kIG15IHBvaW50LiBBbGwgdGhlIGFz
c2lnbm1lbnRzIG9mIGFkZHJfd2lkdGgKPj4gYXJlIGNsdXN0ZXJlZCBhcm91bmQgaW4gdGhlIGNv
ZGUuIFdoeSBjYW4ndCB3ZSBoYXZlIHRoZW0gaW4gYSBjb21tb24KPiAKPiBzZXQgaW4gYmZwdCBh
bmQgdGhlbiBhdCB1cGRhdGVkIGF0IGZsYXNoIGluaXQuIEl0J3Mgbm90IHNwcmVhZAo+IHRocm91
Z2hvdXQgdGhlIGNvZGUuCj4gCj4+IHBsYWNlLiBXZSBldmVuIGhhdmUgdGhpcyBwbGFjZSBhbHJl
YWR5OiBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKCkuCj4+IEFsc28geW91IGNvdWxkIHByb2JhYmx5
IGdldCByaWQgb2YgdGhhdCAiZG9uJ3QgY2hhbmdlIG9wY29kZXMKPj4gaWYgU05PUl9GX0hBU180
QkFJVCBpcyBzZXQiIHRoaW5neSBpZiB0aGUgcGFyc2luZyBjb2RlIHdvdWxkbid0Cj4+IGNoYW5n
ZSB0aGUgb3Bjb2RlcyBidXQgcmV0dXJucyB0aGUgcGFyc2VkIG9uZXMgZm9yIHRoZSBjb3JlCj4+
IHRvIGRlY2lkZSB3aGF0IHRvIHVzZS4gV2l0aCB0aGUgYmVuZWZpdCBvZiBiZXR0ZXIgcmVhZGFi
aWxpdHkKPj4gYW5kIGxlc3NlciBidWdzLgo+Pgo+IAo+IEkgdGhpbmsgSSB1bmRlcnN0b29kIHlv
dSBmcm9tIHRoZSBiZWdpbm5pbmcuIEJvdGggYXBwcm9hY2hlcyBhcmUgZmluZQo+IElNTywgYnV0
IHNlZW1zIHRoYXQgeW91IGNhcmUgYWJvdXQgeW91cnMsIHNvIGxldCdzIGltcGxlbWVudCB5b3Vy
Cj4gc3VnZ2VzdGlvbi4gVGFrYWhpcm8sIHdpbGwgeW91IGhhbmRsZSBpdCwgb3IgZG8geW91IHdh
bnQgbWUgdG8gZG8gaXQ/Cj4gCkkgd2FudCB5b3UgdG8gZG8gaXQsIHBsZWFzZS4KCj4gVGhhbmtz
LAo+IHRhCgpUaGFuayB5b3UhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
