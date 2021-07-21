Return-Path: <SRS0=aH78=MN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E59C12002
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 07:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28DC8606A5
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 07:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28DC8606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cMGEKuvppdoJGHwwIha1Hyelhs5oPf6GeYfY6Qmg3I=; b=Zw9qHdupGF7LjMiPU2aGD8StUg
	OZM/9xKHh//AYDLZBnEFpljUrFEhi+2se/vvwbtKu7h6IFLnOC0M3TUHtIJwbBG0uGnA2FK3k6zKF
	mxDJ4h4/C1d0MNLp5NMvQun1C892WNVaKNGoZZG299fjPlITkC3eMZQZdvZXfI+n+7Z71pOEWhwfD
	Epbf/Hk3PfUGJ3MJS73ZW+CLK/NVmo+hqyGPVwVCrt7PoHgcUzo6HOTJJpFRI8JsutejNg1QfyM4t
	/yp8nCWQ/0Nr2otXEwMpyK8yDqeJkwlWf2ON/wYFDpH9PvFvSaNZUspCMxOewVlPpbdyJlRe0oktR
	vnsIaMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m66jC-00Eh7L-OF; Wed, 21 Jul 2021 07:33:14 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m66j6-00Eh6t-O0
 for linux-mtd@lists.infradead.org; Wed, 21 Jul 2021 07:33:10 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0B60822239;
 Wed, 21 Jul 2021 09:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1626852777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yefeDt9yCWP2GQOMIWXJOqK4keRsdVxR6YmSU8cIOCc=;
 b=DLnYU9R3VzJB1dShC9XjHOx/4uS6IT0O9esgEZ0HE4/iJVh1TUXBjBvD/TEGFFzdQInxei
 TaJMoSyxAx1Slpiv2vwrd95ukQOVecs99weyrGmhnMxqBmfmFw/HUjFBxFmnbSP/+OaS48
 HFYjUUZfzue8WeINquYuZBeloxcoaF4=
MIME-Version: 1.0
Date: Wed, 21 Jul 2021 09:32:55 +0200
From: Michael Walle <michael@walle.cc>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: esmt: Use correct name of f25l32qa
In-Reply-To: <e7fca59e-f7f5-f5f8-9e3b-001c5c938659@gorani.run>
References: <20210620085639.143694-1-mans0n@gorani.run>
 <dad2160dba9070f1516519bdd00207ac@walle.cc>
 <e7fca59e-f7f5-f5f8-9e3b-001c5c938659@gorani.run>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f7eeb7645bc2632bb2cf1232d98d7fb4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_003309_026530_6FC5D29E 
X-CRM114-Status: GOOD (  17.14  )
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

SGksCgpBbSAyMDIxLTA3LTE5IDE3OjE5LCBzY2hyaWViIFN1bmdibyBFbzoKPiBPbiAyMDIxLTA3
LTE3IDAxOjExLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBBbSAyMDIxLTA2LTIwIDEwOjU2LCBz
Y2hyaWViIFN1bmdibyBFbzoKPj4+IFRoZSBmbGFzaCBJRCBvZiBGMjVMMzJRQSBpcyAweDhjNDAx
Niwgd2hlcmVhcyB0aGF0IG9mIEYyNUwzMlFBKDJTKSBpcwo+Pj4gMHg4YzQxMTYuIEYyNUwzMlFB
KDJTKSBpcyB0aGUgbmV3ZXIgdmVyc2lvbiBvZiBGMjVMMzJRQSBhbmQgaXRzIEJQbiAKPj4+IGJp
dHMKPj4+IGFyZSBub24tdm9sYXRpbGUsIHVubGlrZSBpdHMgb2xkZXIgdmVyc2lvbi4KPj4+IAo+
Pj4gUmVmZXJlbmNlczogCj4+PiBodHRwczovL3d3dy5lc210LmNvbS50dy91cGxvYWQvcGRmL0VT
TVQvZGF0YXNoZWV0cy9GMjVMMzJRQS5wZGYKPj4+IFJlZmVyZW5jZXM6Cj4+PiBodHRwczovL3d3
dy5lc210LmNvbS50dy91cGxvYWQvcGRmL0VTTVQvZGF0YXNoZWV0cy9GMjVMMzJRQV8xKDJTKS5w
ZGYKPj4gCj4+ICJEYXRhc2hlZXQ6IiBwbGVhc2UKPj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBTdW5n
Ym8gRW8gPG1hbnMwbkBnb3JhbmkucnVuPgo+Pj4gLS0tCj4+PiBBdCBmaXJzdCBJIHdhcyBnb2lu
ZyB0byBzZW5kIGEgbmV3IHN1cHBvcnQgcGF0Y2ggb2YgRjI1TDE2UEEoMlMpLAo+Pj4gYnV0IGJl
Zm9yZSB0aGF0LCBJIHdhbnRlZCB0byBtYWtlIHN1cmUgaWYgIigycykiIHN1ZmZpeCBpcyBva2F5
IG9yIAo+Pj4gdW5uZWNlc3NhcnkuCj4+PiAtLS0KPj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9l
c210LmMgfCA0ICsrLS0KPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4+IAo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvZXNt
dC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9lc210LmMKPj4+IGluZGV4IGNmYzkyMThjMTA1My4u
NTFiM2ZmNzY0ZWY2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9lc210LmMK
Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvZXNtdC5jCj4+PiBAQCAtMTIsOCArMTIsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gZXNtdF9wYXJ0c1tdID0gewo+Pj4gwqDC
oMKgwqAgLyogRVNNVCAqLwo+Pj4gwqDCoMKgwqAgeyAiZjI1bDMycGEiLCBJTkZPKDB4OGMyMDE2
LCAwLCA2NCAqIDEwMjQsIDY0LAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNF
Q1RfNEsgfCBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9TV1BfSVNfVk9MQVRJTEUpIAo+Pj4g
fSwKPj4+IC3CoMKgwqAgeyAiZjI1bDMycWEiLCBJTkZPKDB4OGM0MTE2LCAwLCA2NCAqIDEwMjQs
IDY0LAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VDVF80SyB8IFNQSV9OT1Jf
SEFTX0xPQ0spIH0sCj4+PiArwqDCoMKgIHsgImYyNWwzMnFhKDJzKSIsIElORk8oMHg4YzQxMTYs
IDAsIDY0ICogMTAyNCwgNjQsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNFQ1RfNEsgfCBTUElfTk9SX0hBU19MT0NLKSB9LAo+Pj4gwqDCoMKgwqAgeyAiZjI1bDY0
cWEiLCBJTkZPKDB4OGM0MTE3LCAwLCA2NCAqIDEwMjQsIDEyOCwKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgU1BJX05PUl9IQVNfTE9DSykgfSwKPj4+IMKgfTsK
Pj4gCj4+IFR1ZG9yIGhhcyBkZWNpZGUgb24gdGhhdCBuYW1lIC0gb3IgdGhlIHVzZSBvZiBwYXJl
bnRoZXNlcy4gSSBkb24ndCAKPj4gaGF2ZSBhCj4+IHN0cm9uZyBvcGluaW9uIG9uIGl0Lgo+IAo+
IEknbSBjb25jZXJuZWQgdGhhdCBhbnkgb3RoZXIgZGV2aWNlcyBkbyBub3QgY29udGFpbiBwYXJl
bnRoZXNlcyBpbgo+IHRoZWlyIG1vZGVsIG5hbWVzLi4uIEknbSBmaW5lIHdpdGggImYyNWwzMnFh
LTJzIiBpZiBwcmVmZXJyZWQuCgpIYXZpbmcgYW5vdGhlciBsb29rIGF0IHRoZSBkYXRhc2hlZXQg
dGhlcmUgYXJlIGRpZmZlcmVudCBwcm9kdWN0CklEczogRjI1TDMyUUEtNTBQRzJTLCBGMjVMMzJR
QS04NlBHMlMsIC4uIHdoZXJlIHlvdSBjYW4gYWxzbyBmaW5kCnRoZSAiLTJzIi4KClRodXMgSSdk
IGFjdHVhbGx5IHByZWZlciAiZjI1bDMycWEtMnMiLgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
