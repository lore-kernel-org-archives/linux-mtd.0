Return-Path: <SRS0=Qvgb=JP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A369EC433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 16:59:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 155F9610CB
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 16:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 155F9610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=avSL2HXMk+QzWIjVCO/kZEjwlDlFLg09axg6HH0TIiw=; b=qB3QJVIX3nOeU/OCuNsjklznj
	Jk4+CHI0nVHXgx93jmOXYRwyjWOkmqWt9wDr7gZ0lTPhHOueHTsEo+Yk5M0VMSWl3CgdsaBoPpUwh
	XwQLprcdrDYvezTF8TqK6rOOLELcdqRyz2axDHPuteWxZ4UOFbk3kgTLkrLQthjZtxiaBSB1Y2AbT
	LvpUyyW23W/YQCiu+WH3j/d00ETsOpCNXXFoMJoaSxmZzDmR7TLupcN8bKFxWxxCoxqMW2oZiNMjt
	kA8ZQcRQ0+JSBIjz1RBHB/7AKIPgjrwaL/7Ltyf/SaFkMDxOKTIXL/2nQ6M1M+gzlyfMsytnEn5fU
	Rm2jDADEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYAlX-008KoA-9I; Sun, 18 Apr 2021 16:59:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAlV-008Ko2-AX
 for linux-mtd@desiato.infradead.org; Sun, 18 Apr 2021 16:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=a7z4XegMYo+OkjjZeeWcvq6/tiuPjYPWQG+a4wQcIFE=; b=vxRgEsXdCgscSJkaZ8DmeD6CY0
 YVV+Jf4XcO6eIxUARMnNXFfbjihjmgQzu/SJmZNTfzBU7d+p9rUoTxQIDIQQ9iySnngQ5ASrmWj7c
 x2re1oOzSWxKPoaFOCeU14u+y397dUFstnfA68pPOSUTexiohlWGJTfpIsn3YrfTCYxu0BMNNXouG
 YdwaKL3wVDrYKSx7zTdVzNt9L8muNuSvQZd3wovH7aKmy6t83ZInilYIC5oBUVR9xiJmByEtMpdik
 PL/EsJc/ZmvDyqVCMjiIAHlbfJZOu+VqdLkbNN0m7ZJqOPLgHNgY92sgmqUVRs24ftl50kPH9VSxG
 YZ/uPe1Q==;
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYAlP-00AWk0-W7
 for linux-mtd@lists.infradead.org; Sun, 18 Apr 2021 16:59:20 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4FNbl52FpbzQjmP;
 Sun, 18 Apr 2021 18:59:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1618765151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7z4XegMYo+OkjjZeeWcvq6/tiuPjYPWQG+a4wQcIFE=;
 b=q2YH3CGg6BIVR8AlfECI2iDTT8plxAdLiO7FklKDFVYilsP5XQHV9g3SzdJTq0F6BggVpm
 DOzkxBZABDBD0r+sxyWGeYt1rE1vd/fEKLaJM7e378DATEmeg18McIZxInJvEBUIeEdx5f
 PX81u3NjyRobjhOXYLbeMu2nDXEJubWqDS4A/ejcYMatAOj4QsJRKXudr6viyLoqlA2UHb
 UZ/X6a2x5Vt9haOreAAZPMX/ZcQ02YEyabROHFUHdWhvi1fOR+dkWWCQdXKUA5AwVPvYwI
 uGKxvYP40kRdOjLSQHVOLmsYk7vj9W3ao07qzWahMZIImx1ohR5gAw95n700rg==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id adG7yC-3MJXb; Sun, 18 Apr 2021 18:59:09 +0200 (CEST)
Subject: Re: [PATCH 1/2] mtd: parsers: trx: Allow to specify trx-magic in DT
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
References: <20210315170711.567358-1-hauke@hauke-m.de>
 <20210315170711.567358-2-hauke@hauke-m.de>
 <c596dbe2-a948-81c4-1e4e-e2d6c1b58b44@gmail.com>
From: Hauke Mehrtens <hauke@hauke-m.de>
Message-ID: <a1c7bdbf-8975-94d7-ce93-de45f7104a32@hauke-m.de>
Date: Sun, 18 Apr 2021 18:59:08 +0200
MIME-Version: 1.0
In-Reply-To: <c596dbe2-a948-81c4-1e4e-e2d6c1b58b44@gmail.com>
Content-Language: en-US
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.41 / 15.00 / 15.00
X-Rspamd-Queue-Id: 1E0B217F6
X-Rspamd-UID: 2d6050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_095916_205913_7BE27CE6 
X-CRM114-Status: GOOD (  20.44  )
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

T24gMy8xOC8yMSA3OjQzIEFNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gT24gMTUuMDMuMjAy
MSAxODowNywgSGF1a2UgTWVocnRlbnMgd3JvdGU6Cj4+IEJ1ZmZhbG8gdXNlcyBhIGRpZmZlcmVu
dCBUUlggbWFnaWMgZm9yIGV2ZXJ5IGRldmljZSwgdG8gYmUgYWJsZSB0byB1c2UKPj4gdGhpcyB0
cnggcGFyc2VyLCBtYWtlIGl0IHBvc3NpYmxlIHRvIHNwZWNpZnkgdGhlIFRSWCBtYWdpYyBpbiBk
ZXZpY2UKPj4gdHJlZS4gSWYgbm8gVFJYIG1hZ2ljIGlzIHNwZWNpZmllZCBpbiBkZXZpY2UgdHJl
ZSwgdGhlIHN0YW5kYXJkIHZhbHVlCj4+IHdpbGwgYmUgdXNlZC4gVGhpcyB2YWx1ZSBzaG91bGQg
b25seSBiZSBzcGVjaWZpZWQgaWYgYSB2ZW5kb3IgY2hvb3NlcyB0bwo+PiB1c2UgYSBub24gc3Rh
bmRhcmQgVFJYIG1hZ2ljLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIYXVrZSBNZWhydGVucyA8aGF1
a2VAaGF1a2UtbS5kZT4KPj4gLS0tCj4+IMKgIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9i
cmNtLHRyeC50eHTCoMKgwqDCoMKgIHzCoCA1ICsrKysrCj4+IMKgIGRyaXZlcnMvbXRkL3BhcnNl
cnMvcGFyc2VyX3RyeC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMSArKysrKysrKysr
KysrKysrKystCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IAo+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLHRyeC50eHQgCj4+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sdHJ4LnR4dAo+PiBpbmRleCBi
Njc3MTQ3Y2E0ZTEuLjcxNWExOGNhMzZiZCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sdHJ4LnR4dAo+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSx0cngu
dHh0Cj4+IEBAIC0yOCw2ICsyOCwxMSBAQCBkZXRlY3RlZCBieSBhIHNvZnR3YXJlIHBhcnNpbmcg
VFJYIGhlYWRlci4KPj4gwqAgUmVxdWlyZWQgcHJvcGVydGllczoKPj4gwqAgLSBjb21wYXRpYmxl
IDogKHJlcXVpcmVkKSBtdXN0IGJlICJicmNtLHRyeCIKPj4gK09wdGlvbmFsIHByb3BlcnRpZXM6
Cj4+ICsKPj4gKy0gdHJ4LW1hZ2ljOiBUUlggbWFnaWMsIGlmIGl0IGlzIGRpZmZlcmVudCBmcm9t
IHRoZSBkZWZhdWx0IG1hZ2ljCj4+ICvCoMKgwqDCoMKgwqDCoMKgIDB4MzA1MjQ0NDggYXMgYSB1
MzIuCj4gCj4gSXQgbWF5IG5lZWQgdG8gYmUgYnJjbSx0cngtbWFnaWMgYW5kIGFjayBmb3Igc2Vu
ZGluZyBhIHNlcGFyYXRlZCAKPiBidC1iaW5kaW5ncyBwYXRjaC4KCk9rLCBJIHdpbGwgcmVuYW1l
IGl0IHRvIGJyY20sdHJ4LW1hZ2ljLgoKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNl
cnMvcGFyc2VyX3RyeC5jIAo+PiBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvcGFyc2VyX3RyeC5jCj4+
IGluZGV4IDg1NDExODIxMzRkNC4uZmQ0MjQ1ODdjYWE0IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L210ZC9wYXJzZXJzL3BhcnNlcl90cnguYwo+PiArKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL3Bh
cnNlcl90cnguYwo+PiBAQCAtNDcsNiArNDcsMjQgQEAgc3RhdGljIGNvbnN0IGNoYXIgKnBhcnNl
cl90cnhfZGF0YV9wYXJ0X25hbWUoc3RydWN0IAo+PiBtdGRfaW5mbyAqbWFzdGVyLAo+PiDCoMKg
wqDCoMKgIHJldHVybiAicm9vdGZzIjsKPj4gwqAgfQo+PiArc3RhdGljIHVpbnQzMl90IHBhcnNl
cl90cnhfZ2V0X21hZ2ljKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+PiArewo+PiArwqDCoMKgIHVp
bnQzMl90IHRyeF9tYWdpYyA9IFRSWF9NQUdJQzsKPj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wOwo+PiArwqDCoMKgIGludCBlcnI7Cj4+ICsKPj4gK8KgwqDCoCBucCA9IG10ZF9nZXRf
b2Zfbm9kZShtdGQpOwo+PiArwqDCoMKgIGlmICghbnApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gdHJ4X21hZ2ljOwo+IAo+IFRoaXMgY2hlY2sgc2VlbXMgcmVkdW5kYW50LCBvZl8gcmV0dXJu
cyAtRUlOVkFMIGFsc28gZm9yIE5VTEwgbm9kZS4KClRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9u
LCBJIHdpbGwgcmVtb3ZlIHRoaXMgY2hlY2suIFRoZW4gaXQgY291bGQgYWxzbyAKYmUgZWFzaWVy
IHRvIGp1c3QgaW5saW5lIHRoaXMgY29kZS4KCj4gCj4gCj4+ICvCoMKgwqAgLyogR2V0IGRpZmZl
cmVudCBtYWdpYyBmcm9tIGRldmljZSB0cmVlIGlmIHNwZWNpZmllZCAqLwo+PiArwqDCoMKgIGVy
ciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAidHJ4LW1hZ2ljIiwgJnRyeF9tYWdpYyk7Cj4+
ICvCoMKgwqAgaWYgKGVyciAhPSAwICYmIGVyciAhPSAtRUlOVkFMKQo+PiArwqDCoMKgwqDCoMKg
wqAgcHJfZXJyKCJmYWlsZWQgdG8gcGFyc2UgXCJ0cngtbWFnaWNcIiBEVCBhdHRyaWJ1dGUsIHVz
ZSAKPj4gZGVmYXVsdDogJWRcbiIsIGVycik7Cj4gCj4gSSdtIG5vdCBuYXRpdmUsIGJ1dCBzaG91
bGRuJ3QgdGhhdCBiZSBzL3VzZS91c2luZy8gPwoKSSBhbSBhbHNvIG5vdCBhIG5hdGl2ZSBzcGVh
a2VyLCBidXQgSSBhZ3JlZSB3aXRoIHlvdSBhbmQgd2lsbCBjaGFuZ2UgdGhpcy4KCkhhdWtlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
