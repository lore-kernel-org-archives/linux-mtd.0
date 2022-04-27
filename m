Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B56C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 04:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rR2p1r5gRbf4yyhY2mDdKatNZKzK5SwioqINIULH4O4=; b=rI/Kp4LkZ/GEYc
	ZShQFKNGHIQbt8ddAARF8d7EKeXpSZE2ngDhy0ML1meAL1TrqnHUMiHAcvURD0d460FkSZruYlCtW
	//MYAC1XjK0XjjIRgWq99MS+uNGA9gr2/Z5nDYsMRdPklD7QeVOHVDh2o5f4Cy3n+eTKYnaauN5Cz
	dPdPR+Zgo5jiSSyKBROYb89mTUUNy4Le++nDV3enUXrgYfuUwdKZwqIxkCbPh4yrB0qQG9UiHzRNP
	S/eTuaN5Ur3bk3W8w1Q/4eDYYpnHeBx+zZFWH0bw2I8a6ZXhx/ZkZxXNw8ehRpiu/OUYI2x+fwX6z
	GCF4cWbiDGrdY9w1VgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njZ6q-00HLvN-9K; Wed, 27 Apr 2022 04:17:00 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njZ6n-00HLuU-M1
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 04:16:59 +0000
Received: by mail-pf1-x436.google.com with SMTP id b15so573152pfm.5
 for <linux-mtd@lists.infradead.org>; Tue, 26 Apr 2022 21:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=kEgOHcJquVXZtzJwaBmljioOV0INXFo5vs0nPbmIhpY=;
 b=G6R85WIleG2Pbf9Z9ewSmZVCAPLyHJghitN7fOFL3hpxYbQ7AZn1pg+AcHoQupt+fV
 mDumg/GqoDOijPI3a64Ak7AMA19nzYadR6sYs9RAcKZcuj5uIX7sWPzA+PI7ZXIm/buq
 arcf8fhMmLXwOAl3G+UoiFgUFMG86FHqqb9Xtvgeyks8VhGxN65uo/p0j+YqfTFs5ayV
 5/uPbpYgAnT0c97tzy4SK6j64wxeodmLYkTq/5ntIztzi9dyGROYQn5D5B/h3XyBVAUV
 QUEDtzRhU7/Iz7BMvo0KvQIcEowtaKvqVFtCQVzU1H+5QxassfedNkD9V/K8AQTGYA5g
 eksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=kEgOHcJquVXZtzJwaBmljioOV0INXFo5vs0nPbmIhpY=;
 b=LJ2r7XjmrQD0ujI85ocLQ2WoBYYIXHp0a/1dg1I0Yk44hSTmUCGENPUMIP8I2zCy3Z
 cWa7khcqSAmeToVh9LkNPjaUtDA0U1g4mKs+42t0EBf4JeQPmYvQENGEMZtaEKtACxRg
 ZBWS+EFixPxQXp8VmJoeXCzv2slPhz0mc5zN8CwqdyHxlhBSJqwYK0QYrf1qGtX+nLjn
 pwWe3hOs+PQN928wYEUIgt9tTmpk4fxNIcC6bzoSq+NaKInxP/zUfRHjzQVr7IxiqMqt
 LM1f/9M82HeHFHGWtcGMFnxahqmBfRQsQflDxKmOwConVgQ2IRWdR2juFdKg1ShL+JzK
 HSww==
X-Gm-Message-State: AOAM533HLjhNaMUYGQuOy3dTrJeHDRLJiFc00dYkuCDbvALvVv8DoW7k
 OGDZ24OYx1y/jJp0q5jnOR8=
X-Google-Smtp-Source: ABdhPJxaOxHESjx2KQEjH+HeQlkvon2Qg/aYsOMXKCWxemKhUZWKVb2+pwnsl15RzIk+IiBhqZQuJQ==
X-Received: by 2002:a63:9143:0:b0:3ab:5074:aa75 with SMTP id
 l64-20020a639143000000b003ab5074aa75mr10826838pge.298.1651033015470; 
 Tue, 26 Apr 2022 21:16:55 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 f186-20020a62dbc3000000b0050d3aa8c904sm10479456pfg.206.2022.04.26.21.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 21:16:54 -0700 (PDT)
Message-ID: <29e04234-3cdc-ff52-ca9b-2055464c3861@gmail.com>
Date: Wed, 27 Apr 2022 13:16:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
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
 <aea77eb7-4cc9-c93c-8c45-241dd24773a3@gmail.com>
In-Reply-To: <aea77eb7-4cc9-c93c-8c45-241dd24773a3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_211657_759859_73B4EA7E 
X-CRM114-Status: GOOD (  20.91  )
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

SGkgVHVkb3IsCgpPbiA0LzIxLzIwMjIgMTE6MjYgUE0sIFRha2FoaXJvIEt1d2FubyB3cm90ZToK
PiAKPiAKPiBPbiA0LzIxLzIwMjIgMTA6NTYgUE0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNv
bSB3cm90ZToKPj4gT24gNC8yMS8yMiAxNjo0MiwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEVY
VEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+Pj4KPj4+IEFtIDIwMjItMDQtMjEgMTU6
MTMsIHNjaHJpZWIgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOgo+Pj4KPj4+Pj4gSWYgdGhl
IHBhcnNpbmcgd291bGRuJ3QgY2hhbmdlIGFueSBydW50aW1lIHBhcmFtZXRlcnMgd2Ugd291bGRu
J3QKPj4+Pj4gaGF2ZSB0aGlzIHByb2JsZW0gYXQgYWxsLiBubz8KPj4+Pgo+Pj4+IEl0IGRvZXNu
J3QgY2hhbmdlLCBfYnV0XyBpdCBzZXRzIHRoZSBjb3JyZWN0IG51bWJlciBvZiBhZGRyZXNzIG5i
eXRlcy4KPj4+Cj4+PiBJdCBjaGFuZ2VzIG5vci0+YWRkcl93aWR0aCB3aGljaCBtaWdodCBiZSB1
c2VkIGZvciBhbGwgY29tbWFuZHMKPj4KPj4gbm8sIGl0IF9zZXRzXyB0aGUgbm9yLT5hZGRyX3dp
ZHRoLiBub3ItPmFkZHJfd2lkdGggaXMgaW5pdGlhbGl6ZWQgb25seQo+PiBpbiBCRlBULCB3aGVy
ZSBCRlBUIGlzIHByZXNlbnQuIE5vIGNoYW5nZSBkb25lLgo+Pgo+Pj4gZXhjZXB0IHRoZSByZWFk
X3NmZHBfZGF0YSgpLiBJdCBjaGFuZ2VzIGl0IGJlZm9yZSB3ZSBhcmUgZW50ZXJpbmcKPj4+IHRo
ZSA0IGJ5dGUgbW9kZS4gQWxzbyBwYXJzZV9zZmRwIGNoYW5nZXMgdGhlIG9wY29kZXMuIEl0IHNl
ZW1zIHRoaXMKPj4+IHdhcyB0aGUgcmVhc29uIGZvciB0aGUgU05PUl9GX0hBU180QkFJVCBmbGFn
IGluIHRoZSBmaXJzdCBwbGFjZSwKPj4+IHNvIHRoZSBjb3JlIGRvZXNuJ3QgY29udmVydCB0aGUg
b3Bjb2RlcyBhZ2Fpbi4KPj4+Cj4+Pj4+IFRoZSBwYXJzZV9zZmRwKCkgc2hvdWxkIG9ubHkgY2hh
bmdlIG1lbWJlcnMgb2Ygc3RydWN0Cj4+Pj4+IHNwaV9ub3JfZmxhc2hfcGFyYW1ldGVycywgdGhl
IGNhbGxlciB3aWxsIHRoZW4gZGVjaWRlIGlmIHRoZXkKPj4+Pj4gc2hvdWxkIGJlIHVzZWQgYW5k
IG1vcmUgaW1wb3JhbnRseSAqd2hlbiogdGhleSBzaG91bGQgYmUgdXNlZC4KPj4+Pgo+Pj4+IHRo
aXMgd291bGQgbWVhbiBpbnRyb2R1Y2luZyBhIG5vci0+cGFyYW1zLT5hZGRyX25ieXRlcywgd2hp
Y2gKPj4+PiBpcyByZWR1bmRhbnQgd2l0aCBTTk9SX0ZfSEFTXzRCQUlULgo+Pj4KPj4+IFNvPyBU
aGUgU0ZEUCB0YWJsZSBoYXMgYm90aCBpbmZvcm1hdGlvbiwgSSBkb24ndCBzZWUgYSBwcm9ibGVt
Cj4+PiB3aXRoIHRoYXQuIEFuZCBJJ20gbm90IHN1cmUgdGhleSBhcmUgcmVkdW5hbnQsIEkgdGhp
bmsgYSBmbGFzaAo+Pj4gY2FuIGhhdmUgNCBieXRlIGFkZHJlc3NlcyBhbmQgbm8gNEJBSVQgdGFi
bGUuCj4+Cj4+IHJpZ2h0LCBidXQgdGhpcyBpcyBub3Qgc29tZXRoaW5nIHRoYXQgd2UgYXJlIGFk
ZHJlc3NpbmcgcmlnaHQgbm93Lgo+Pj4KPj4+IEFuZCBpZiBpdCB3b3VsZCBiZSByZWR1bmRhbnQg
d2h5IGRvIHdlIG5lZWQgdGhhdCBlbXB0eQo+Pj4gY2FzZSBiZWxvdy4uCj4+Pgo+Pj4+PiBUaGVu
IHlvdSBjYW4gZG8gdGhlIHNhbmUgdGhpbmcgaW4gc3BpX25vcl9zZXRfYWRkcl93aWR0aCgpOgo+
Pj4+PiBzZXR0aW5nIHRoZSBhZGRyX3dpZHRoLgo+Pj4+Pgo+Pj4+PiBSaWdodCBub3cgaXQnczoK
Pj4+Pj4KPj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zZXRfYWRkcl93aWR0aChzdHJ1Y3Qgc3Bp
X25vciAqbm9yKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgwqDCoMKgIGlmIChub3ItPmZsYWdzICYg
U05PUl9GX0hBU180QkFJVCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9y
LT5hZGRyX3dpZHRoID0gNDsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgwqDCoMKgIGlmIChub3ItPmFk
ZHJfd2lkdGgpIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogYWxyZWFk
eSBjb25maWd1cmVkIGZyb20gU0ZEUCAqLwo+Pj4+PiArwqDCoMKgwqDCoMKgIH0KPj4+Pj4gLi4K
Pj4+Cj4+PiBoZXJlLgo+Pj4KPj4+Pj4KPj4+Pj4gU29tZXRpbWVzIGl0IHdpbGwgc2V0IGFkZHJf
d2lkdGgsIHNvbWV0aW1lcyBpdCB3aWxsIG5vdCBiZSBzZXQKPj4+Pj4gYW5kIGV2ZXJ5IG9uY2Ug
aW4gYSB3aGlsZSA0Ynl0ZSBtb2RlIGlzIGRldGVybWluZWQgYnkgU0ZEUCBidXQKPj4+Pj4gaXQg
aXMgbm90IGNvbmZpZ3VyZWQgKFNOT1JfRl9IQVNfNEJBSVQpLgo+Pj4+Cj4+Pj4gd2hpY2ggaXMg
Z29vZCEgd2UgcHJlZmVyIHVzaW5nIDRiIG9wY29kZXMgdGhhbiBlbnRlcmluZyA0Ynl0ZSBhZGRy
ZXNzCj4+Pj4gbW9kZS4KPj4+Cj4+PiBZb3UgZGlkbid0IHVuZGVyc3RhbmQgbXkgcG9pbnQuIEFs
bCB0aGUgYXNzaWdubWVudHMgb2YgYWRkcl93aWR0aAo+Pj4gYXJlIGNsdXN0ZXJlZCBhcm91bmQg
aW4gdGhlIGNvZGUuIFdoeSBjYW4ndCB3ZSBoYXZlIHRoZW0gaW4gYSBjb21tb24KPj4KPj4gc2V0
IGluIGJmcHQgYW5kIHRoZW4gYXQgdXBkYXRlZCBhdCBmbGFzaCBpbml0LiBJdCdzIG5vdCBzcHJl
YWQKPj4gdGhyb3VnaG91dCB0aGUgY29kZS4KPj4KPj4+IHBsYWNlLiBXZSBldmVuIGhhdmUgdGhp
cyBwbGFjZSBhbHJlYWR5OiBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKCkuCj4+PiBBbHNvIHlvdSBj
b3VsZCBwcm9iYWJseSBnZXQgcmlkIG9mIHRoYXQgImRvbid0IGNoYW5nZSBvcGNvZGVzCj4+PiBp
ZiBTTk9SX0ZfSEFTXzRCQUlUIGlzIHNldCIgdGhpbmd5IGlmIHRoZSBwYXJzaW5nIGNvZGUgd291
bGRuJ3QKPj4+IGNoYW5nZSB0aGUgb3Bjb2RlcyBidXQgcmV0dXJucyB0aGUgcGFyc2VkIG9uZXMg
Zm9yIHRoZSBjb3JlCj4+PiB0byBkZWNpZGUgd2hhdCB0byB1c2UuIFdpdGggdGhlIGJlbmVmaXQg
b2YgYmV0dGVyIHJlYWRhYmlsaXR5Cj4+PiBhbmQgbGVzc2VyIGJ1Z3MuCj4+Pgo+Pgo+PiBJIHRo
aW5rIEkgdW5kZXJzdG9vZCB5b3UgZnJvbSB0aGUgYmVnaW5uaW5nLiBCb3RoIGFwcHJvYWNoZXMg
YXJlIGZpbmUKPj4gSU1PLCBidXQgc2VlbXMgdGhhdCB5b3UgY2FyZSBhYm91dCB5b3Vycywgc28g
bGV0J3MgaW1wbGVtZW50IHlvdXIKPj4gc3VnZ2VzdGlvbi4gVGFrYWhpcm8sIHdpbGwgeW91IGhh
bmRsZSBpdCwgb3IgZG8geW91IHdhbnQgbWUgdG8gZG8gaXQ/Cj4+Cj4gSSB3YW50IHlvdSB0byBk
byBpdCwgcGxlYXNlLgo+IApEbyB5b3UgcGxhbiB0byBoZWxwIG9uIGFub3RoZXIgaW1wbGVtZW50
YXRpb24gc2hvcnRseT8KT3IgY2FuIHdlIGdvIHdpdGggdGhpcyBvbmUgZm9yIG5vdz8KCkJlc3Qg
UmVnYXJkcywKVGFrYWhpcm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
