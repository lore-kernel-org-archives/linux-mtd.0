Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65E0C369C4
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Apr 2025 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gETz/F2hMWPLy4Rv3gVO8SIhNHgm2wnS7TnurNkXuA=; b=EBXJbqmupB0gXD
	9lSde62k2kJAQhgChESkTrJn7eNjwUVBaPcaPlRWbAeFrZswU0JjrlhaSSbAuPn5znVez54IDuI9Q
	jrwha3qlX4C91Pf40n0cWC0WLvnnZLUkNgDWB7La7Pm9dogJ2Hq0R9y7zQQHeYA+hWFP8ujmdKJer
	YjPG2o/2IBBKJ1hCNxzUPLDKmOEv3gzjswh7BeYOCaLbnLj8wsBCLq9X1LeqJGVHOUTA/tcFGVc86
	iDWMTkkZ6aaXG3Oc64h6GlfHLjWXDw2e08+s7BUbYblq7Qecfv2bo+q4VUCTH5pWJ6BSMbT2GDRc4
	77KVJ1k4VVg3zKGptslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54l2-0000000A5f0-3jul;
	Wed, 16 Apr 2025 15:33:00 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u540f-00000009wfa-0GPC
	for linux-mtd@lists.infradead.org;
	Wed, 16 Apr 2025 14:45:07 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 8C527A043A;
	Wed, 16 Apr 2025 16:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=wFlL4KarMxsmLqV1w7R0
	LsLYAx1qNHc06GmS7Bj9QUk=; b=OmuQI8F8KMvtkDJldQhE18/bshVriV8cyxk1
	/pwejPGI9fBRCs+etuap7iO7jDAYGwyuvE6LYKN8UPK9PQCb6KW+hjAzZCn4qPMP
	Lx4SqgEnub/cENFPHlGzDM9gzNkWNGuyHpDG6+iQs5iia4qBu/C4C8EKk5BhiI9I
	YsIU78NQd+h23S3yapOYQDVS/nPYb4iLNM7PvWVqrzdPs1jCR1GIwucaPX/l4cdA
	Y9IUolu567Miqn3ylgKDY2cFDDOj8p7QdYtd9Rkex5BHQFPUNSVvy+3yr+1JFQgL
	8uZw70xORd/xStGC78KKoDqkeC4Zu8BdlXosRVUiWhosD8wH2sqr+avkYQO9wQBv
	Nngs2USiIH1wLHas8dRKSO8zveNay4pmENjkBQ1hN05T6bNrxM2T0i0MS56tD5ko
	WU4qJ122Y8cVcef63AzdNnVjlO86x9Q9+hmaSHCqvSffLoPt/TAuFihyM5kimrUy
	242HKbEUSB7A0Aj8JgPz/VJHg9/CR+OlZC4FOUIA3yJApOVYqVl6uG4sf1A8K9pi
	scSaSgoDtT4EDcUZAl7AT1OsEVE/b15/cl+KPWTox4IBzYyFFLhLem609CBdVLX6
	/72k/0tDnNZr2kBaIetGQ9BPaKDt3F+e+74mCVMkQzHkSNko2UiSm5t3XB4c0YQH
	IfEq9hw=
Message-ID: <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
Date: Wed, 16 Apr 2025 16:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
To: Richard Weinberger <richard@nod.at>
CC: Michael Walle <mwalle@kernel.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, pratyush <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250415180434.513405-1-csokas.bence@prolan.hu>
 <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
 <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
 <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853647664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_074505_566286_8833667C 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDI1LiAwNC4gMTYuIDE1OjA5LCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4g
LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBWb246ICJDc8Oza8OhcyBCZW5jZSIg
PGNzb2thcy5iZW5jZUBwcm9sYW4uaHU+Cj4+Pj4gQWRkIE1URF9TUElfTk9SX1BBUkFOT0lEIGNv
bmZpZyBvcHRpb24gZm9yIHZlcmlmeWluZyBhbGwgd3JpdHRlbiBkYXRhIHRvCj4+Pj4gcHJldmVu
dCBzaWxlbnQgYml0IGVycm9ycyB0byBiZSB1bmRldGVjdGVkLCBhdCB0aGUgY29zdCBvZiBoYWx2
aW5nIFNQSQo+Pj4+IGJhbmR3aWR0aC4KPj4+Cj4+PiBXaGF0IGlzIHRoZSB1c2UgY2FzZSBmb3Ig
dGhpcz8gV2h5IGlzIGl0IHNwZWNpZmljIHRvIFNQSS1OT1IKPj4+IGZsYXNoZXM/IE9yIHNob3Vs
ZCBpdCByYXRoZXIgYmUgYW4gTVREICJmZWF0dXJlIi4gSSdtIG5vdCBzdXJlCj4+PiB3aGV0aGVy
IHRoaXMgaXMgdGhlIHJpZ2h0IHdheSB0byBkbyBpdCwgdGh1cyBJJ2QgbG92ZSB0byBoZWFyIG1v
cmUKPj4+IGFib3V0IHRoZSBiYWNrZ3JvdW5kIHN0b3J5IHRvIHRoaXMuCj4+Cj4+IFdlbGwsIG91
ciBjYXNlIGlzIHF1aXRlIHNwZWNpZmljLCBidXQgd2Ugd2FudGVkIHRvIHByb3ZpZGUgYSBnZW5l
cmFsCj4+IHNvbHV0aW9uIGZvciB1cHN0cmVhbS4gSW4gb3VyIGNhc2Ugd2UgaGF2ZSBhIGNvbXBv
bmVudCBpbiB0aGUgZGF0YSBwYXRoCj4+IHRoYXQgY2FuIGNhdXNlIGEgYnVyc3QgYml0IGVycm9y
LCBvbiBhdmVyYWdlIGFmdGVyIGFib3V0IGEgaHVuZHJlZAo+PiBtZWdhYnl0ZXMgd3JpdHRlbi4K
PiAKPiBIbW0uIFNvLCB0aGVyZSBpcyBhIHNlcnZlIGhhcmR3YXJlIGlzc3VlIHlvdSdyZSB3b3Jr
aW5nIGFyb3VuZC4KPiAKPj4gV2UgX2NvdWxkXyBtYWtlIGl0IE1URC13aWRlLCBpbiBvdXIgY2Fz
ZSB3ZSBvbmx5IGhhdmUgYSBOT1IgRmxhc2gKPj4gb25ib2FyZCBzbyB0aGlzIGlzIHdoZXJlIHdl
IGFkZGVkIGl0LiBJZiBpdCB3ZXJlIGluIHRoZSBNVEQgY29yZSwgd2hlcmUKPj4gd291bGQgaXQg
bWFrZSBzZW5zZT8KPiAKPiBJJ20gbm90IHNvIHN1cmUgd2hldGhlciBpdCBtYWtlcyBzZW5zZSBh
dCBhbGwuCj4gSW4gaXQncyBjdXJyZW50IGZvcm0sIHRoZXJlIGlzIG5vIHJlY292ZXJ5LiBTbyBh
bnl0aGluZyBub24tdHJpdmlhbAo+IG9uIHRvcCBvZiB0aGUgTVREIHdpbGwganVzdCBzZWUgYW4g
LUVJTyBhbmQgaGFzIHRvIGdpdmUgdXAuCj4gRS5nLiBhIGZpbGVzeXN0ZW0gd2lsbCByZW1vdW50
IHJlYWQtb25seS4KCkluIG91ciBjYXNlLCB3ZSB1c2UgVUJJRlMgb24gdG9wIG9mIFVCSSwgd2hp
Y2ggaW4gdGhpcyBjYXNlIGNob29zZXMgCmFub3RoZXIgZXJhc2VibG9jayB0byBob2xkIHRoZSBk
YXRhIGluc3RlYWQsIHRoZW4gcmUtdGVzdHMgKGVyYXNlK3dyaXRlIApjeWNsZXMpIHRoZSBvbmUg
d2hpY2ggZ2F2ZSAtRUlPLiBTaW5jZSB0aGUgYnVzIGVycm9yIGlzIG9ubHkgdHJhbnNpZW50LCAK
aXQgZ29lcyBhd2F5IGJ5IHRoaXMgdGltZSwgYW5kIHRodXMgVUJJRlMgd2lsbCByZWNvdmVyIGZy
b20gdGhpcyBjbGVhbmx5LgoKU28geWVzLCBpdCBpcyB1cCB0byB0aGUgRlMvdXBwZXIgbGF5ZXJz
IHRvIGhhbmRsZSB0aGUgZXJyb3IuIElmIGl0IGNhbid0IApyZWNvdmVyIGZyb20gdGhpcywgdGhl
biB5ZXMsIGl0IHdpbGwgZ2l2ZSB1cCBhbmQgZW50ZXIgc29tZSAnc2FmZSBtb2RlJyAKKGUuZy4g
cmVtb3VudCBybykuIEJ1dCBhdCBsZWFzdCBpdCAqZG9lcyogZ2V0IG5vdGlmaWVkIHRoYXQgdGhl
cmUgaXMgCnNvbWV0aGluZyB1cCwgYW5kIGhhcyBhIGNoYW5jZSB0byByZWFjdC4gQmVmb3JlIGl0
IGp1c3QgdGhvdWdodCAKZXZlcnl0aGluZyB3YXMgd3JpdHRlbiB3aXRoIG5vIGVycm9ycywgYW5k
IHRoZW4gdGhlcmUgd291bGQgYmUgZGF0YSAKY29ycnVwdGlvbiAqb24gdGhlIG5leHQgcmVhZCou
Cgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKCkJlbmNlCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
