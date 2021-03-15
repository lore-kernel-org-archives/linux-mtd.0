Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D325CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:48:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2301164E01
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2301164E01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A35ZALd3+QS9ZJp47ox6tDn+6boSu0EBlnGcYgQG3Ic=; b=nDJe1cj4iJh9ZgGTHaIF+1JBw
	VGgABmwo63nMixq2F/9I/EpUc3eSAK0Ent68I4YYRlbDQVsnemWvhsm4gmrJLA1WibVO2Apg2+LdB
	NWfsgJywKred+bCxV4KqBMeleq/1JJiiLIWxbpkrpGCCCcMlqlhZKslYh16cPANfqYxLTu8iHrCuF
	tcmGOw1ZeW2eFMW+QTMTey0JjdOh/73o9LWuFSgceCDV5QOp6wDq7DRu8c0zJfobX8nmw2i7djZ4C
	lPAHUqEO5P8R/7cuOwKbSK3B9scHHWAD1yacCZ6a6QTcVq73KfzpqK6IX5govhfEKOehha+8do7sE
	US66bqHLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLitc-00FHyL-1b; Mon, 15 Mar 2021 08:48:16 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLipb-00FGqR-52
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 08:44:16 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2C26D2223A;
 Mon, 15 Mar 2021 09:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615797839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VlBMa73oUNhgqahkkJ/v5GrlplUITEafwXYLlGTsDi8=;
 b=OV9/C/NVygge90wUmoSeYTCQkkDhqkG4EL0mSeoHU4tEF2ulHRZ50O94CBVJH98/7vY9Z7
 rZHtxpWfJhVMX25lgikgmknxNoH+t4MDqS8rHsTW6lbHvF4FYQhsg1S2tGswzuEJCXY6ZU
 7zE9vRHo9P1YEtMFQGMusfIJlF+jkVs=
MIME-Version: 1.0
Date: Mon, 15 Mar 2021 09:43:58 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: vigneshr@ti.com, p.yadav@ti.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
In-Reply-To: <65691b2a-134d-b1f2-617e-5ef09df9a742@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <7fb8af561eda06444ee0e0c592147af7@walle.cc>
 <65691b2a-134d-b1f2-617e-5ef09df9a742@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <b3c6bf8a225711f678eeee2d72ac603f@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_084408_406418_FA3E723B 
X-CRM114-Status: GOOD (  13.70  )
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

QW0gMjAyMS0wMy0xNSAwNzowOSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMy82LzIxIDE6MTkgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgCj4+IHRoZSBjb250ZW50IGlzIHNhZmUKPj4gCj4+IEFtIDIwMjEtMDMtMDYgMTA6NTAsIHNj
aHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4+IEl0IG1ha2VzIHRoZSBjb3JlIGZpbGUgYSBiaXQgc21h
bGxlciBhbmQgcHJvdmlkZXMgYmV0dGVyIHNlcGFyYXRpb24KPj4+IGJldHdlZW4gdGhlIFNvZnR3
YXJlIFdyaXRlIFByb3RlY3Rpb24gZmVhdHVyZXMgYW5kIHRoZSBjb3JlIGxvZ2ljLgo+Pj4gQWxs
IHRoZSBuZXh0IGdlbmVyaWMgc29mdHdhcmUgd3JpdGUgcHJvdGVjdGlvbiBmZWF0dXJlcyAoZS5n
Lgo+Pj4gSW5kaXZpZHVhbAo+Pj4gQmxvY2sgUHJvdGVjdGlvbikgd2lsbCByZXNpZGUgaW4gc3dw
LmMuCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNA
bWljcm9jaGlwLmNvbT4KPj4+IC0tLQo+PiAKPj4gWy4uXQo+PiAKPj4+IEBAIC0zNTU0LDYgKzMx
NTIsOSBAQCBpbnQgc3BpX25vcl9zY2FuKHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0IAo+Pj4g
Y2hhcgo+Pj4gKm5hbWUsCj4+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4gCj4+PiArwqDCoMKgwqAgaWYgKG5vci0+cGFy
YW1zLT5sb2NraW5nX29wcykKPj4gCj4+IFNob3VsZCB0aGlzIGJlIGluIHNwaV9ub3JfcmVnaXN0
ZXJfbG9ja2luZ19vcHMoKSwgdG9vPyBJLmUuCj4+IAo+PiB2b2lkIHNwaV9ub3JfcmVnaXN0ZXJf
bG9ja2luZ19vcHMoKSB7Cj4+IMKgwqDCoCBpZiAoIW5vci0+cGFyYW1zLT5sb2NraW5nX29wcykK
Pj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiAuLgo+PiB9Cj4gCj4gWWVzLCB0aGUgY2hlY2tp
bmcgc2hvdWxkIGJlIGRvbmUgaW5zaWRlIHNwaV9ub3JfcmVnaXN0ZXJfbG9ja2luZ19vcHMsCj4g
d2lsbCBtb3ZlIGl0Lgo+IAo+IEJ0dywgd2hhdCBkbyB5b3UgZmluZCBhIGJldHRlciBuYW1lLCBz
cGlfbm9yX3JlZ2lzdGVyX2xvY2tpbmdfb3BzIG9yCj4gc3BpX25vcl9pbml0X2xvY2tpbmdfb3Bz
PyBBcHBsaWVzIHRvIE9UUCBhcyB3ZWxsLgoKcHJvYmFibHkgcmVnaXN0ZXJfbG9ja2luZ19vcHMo
KSwgYXMgbG9uZyBhcyB0aGUgZnVuY3Rpb24ganVzdCBkb2VzCnRoYXQuCgpGb3IgT1RQLCBJIHdh
bnQgdG8gcHJvdmlkZSBudm1lbSBzdXBwb3J0LCB0b28uIFRodXMgaXQgd2lsbCBub3QKb25seSBy
ZWdpc3RlciB0aGUgbXRkIG9wcyBhbmQgdGh1cyBzcGlfbm9yX290cF9pbml0KCkgd2lsbCBiZQpi
ZXR0ZXIgZm9yIG15IGNhc2UuCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
