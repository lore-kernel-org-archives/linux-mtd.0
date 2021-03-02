Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E28C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:06:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39FE464E2E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39FE464E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VSI3HG6QgRSBAOod3Lauj2n03XZ4SEUb8inBgsOubHw=; b=YHzsqgEiwKO5k3WJi18CxhCFu
	34HoALiDdwPbcBAKItNYsuF6s6b6EczPcCrnKY5SxNPXbdQSCpiGF31AkDHNIwy4otxOex+wVfB7x
	4uoAe5424AUzu0KWrbEh4+h7ER0w30suLkdxiIVjJir5qdBtD1SoDuI3XzBZWD8V+AyUzHKGJltxD
	aPt0UvsHsasU/HfqIVuI0+gPFQ5l6OYLuUANqOu8sOlRY6e7x/d4u4Xq27RCiAKv8hZ3+ya0bBkyH
	pgjSyG3bCMbd54j1ndRUO/XaMJuKx6CT3psAZDTjEkml2UtRyjEB0PHk4GS31F0ZA9uy7+zBiUWUg
	5yTZjbMgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZcG-006hNz-2J; Wed, 03 Mar 2021 22:05:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTAZ-005KbC-Ct
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=3JlHuWOPny519lb/zyMBEgaPndadrigbre2ILZ7KICM=; b=L70gwjti3LVoLffN4hN07Xk/iD
 pqpKkQ94WRtzfk0wXX7gogBJG/prwi88RPVlhDvlf6R/NPD5wotAE+NZD2f1tKKGv42fgcn9B/WuA
 Uz2V5JgOvl8wbi3J9vAbbQBup6QevnSCSin+DoXpPJ5SalrRf9SZpO0fes3vcaAK8ovDQ2cJ6d2Io
 aatW0HJ/4q1F2ldCkyZzZC8R7yn8LtFHSfZ9OZXH590VJMZWVTGweIa78O4H9Gtu8PUR7X3keua7o
 I6vclWdD5eTp8FBQ8ebfxUCgf9xPg+F9XgX0fC7tjduWhBBy/75SG9QFGm0enJ8eiWGoe6hmumu9d
 S8ZTIZPQ==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8Mx-00HUdf-RO
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:59:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C75A72223E;
 Tue,  2 Mar 2021 17:59:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614704371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3JlHuWOPny519lb/zyMBEgaPndadrigbre2ILZ7KICM=;
 b=aIsuZAW7/uUq74cQH1wwlv/1J3mx4NjhSE0hH9sfWpgoSOpOGr20SMjMytSNk/22A0IEy1
 PuuqQofyh3kiJq25UbGJEB0hyYU5+FP9so/6u1mzW5D5Sn0qy4VIW+RR5NVFZ/4slQeHBe
 o8U3Dia5iS2yciyNfdM6sj1y0jbt2fs=
MIME-Version: 1.0
Date: Tue, 02 Mar 2021 17:59:31 +0100
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Tudor.Ambarus@microchip.com
Subject: Re: [RFC PATCH] mtd: add OTP (one-time-programmable) erase ioctl
In-Reply-To: <a4464459-dc49-d5de-d969-b9ea96b025d6@ti.com>
References: <20210302110927.6520-1-michael@walle.cc>
 <b106264e-987f-cecc-28cb-0724d4af1f4c@ti.com>
 <74df918148be8c9820acc877e39adf3f@walle.cc>
 <a4464459-dc49-d5de-d969-b9ea96b025d6@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <be9c984f7366aa891591f4e2d003a8b1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_165940_413485_3F247D9A 
X-CRM114-Status: GOOD (  14.54  )
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

QW0gMjAyMS0wMy0wMiAxNzozMywgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+IE9uIDMv
Mi8yMSA5OjQ5IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBBbSAyMDIxLTAzLTAyIDE2OjMw
LCBzY2hyaWViIFZpZ25lc2ggUmFnaGF2ZW5kcmE6Cj4+PiBIaSwKPj4+IAo+Pj4gT24gMy8yLzIx
IDQ6MzkgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4gVGhpcyBtYXkgc291bmQgbGlrZSBh
IGNvbnRyYWRpY3Rpb24gYnV0IHNvbWUgU1BJLU5PUiBmbGFzaGVzIHJlYWxseQo+Pj4+IHN1cHBv
cnQgZXJhc2luZyB0aGVpciBPVFAgcmVnaW9uIHVudGlsIGl0IGlzIGZpbmFsbHkgbG9ja2VkLiBI
YXZpbmcgCj4+Pj4gdGhlCj4+Pj4gcG9zc2liaWxpdHkgdG8gZXJhc2UgYW4gT1RQIHJlZ2lvbiBt
aWdodCBjb21lIGluIGhhbmR5IGR1cmluZwo+Pj4+IGRldmVsb3BtZW50Lgo+Pj4+IAo+Pj4+IFRo
ZSBpb2N0bCBhcmd1bWVudCBmb2xsb3dzIHRoZSBPVFBMT0NLIHN0eWxlLgo+Pj4+IAo+Pj4+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4+Pj4gLS0tCj4+
Pj4gT1RQIHN1cHBvcnQgZm9yIFNQSS1OT1IgZmxhc2hlcyBtYXkgYmUgbWVyZ2VkIHNvb246Cj4+
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjEwMjE2MTYyODA3LjEzNTA5
LTEtbWljaGFlbEB3YWxsZS5jYy8KPj4+PiAKPj4+PiAKPj4+PiBUdWRvciBzdWdnZXN0ZWQgdG8g
YWRkIHN1cHBvcnQgZm9yIHRoZSBPVFAgZXJhc2Ugb3BlcmF0aW9uIG1vc3QgCj4+Pj4gU1BJLU5P
Ugo+Pj4+IGZsYXNoZXMgaGF2ZToKPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
dGQvZDRmNzRiMWItZmExYi05N2VjLTg1OGMtZDgwN2ZlMWY5ZTU3QG1pY3JvY2hpcC5jb20vCj4+
Pj4gCj4+Pj4gCj4+Pj4gVGhlcmVmb3JlLCB0aGlzIGlzIGFuIFJGQyB0byBnZXQgc29tZSBmZWVk
YmFjayBvbiB0aGUgTVREIHNpZGUsIG9uY2UKPj4+PiB0aGlzCj4+Pj4gaXMgZmluaXNoZWQsIEkg
Y2FuIHBvc3QgYSBwYXRjaCBmb3IgbXRkLXV0aWxzLiBUaGVuIHdlJ2xsIGhhdmUgYQo+Pj4+IGZv
dW5kYXRpb24KPj4+PiB0byBhZGQgdGhlIHN1cHBvcnQgdG8gU1BJLU5PUi4KPj4+PiAKPj4+PiDC
oGRyaXZlcnMvbXRkL210ZGNoYXIuY8KgwqDCoMKgwqAgfMKgIDcgKysrKysrLQo+Pj4+IMKgZHJp
dmVycy9tdGQvbXRkY29yZS5jwqDCoMKgwqDCoCB8IDEyICsrKysrKysrKysrKwo+Pj4+IMKgaW5j
bHVkZS9saW51eC9tdGQvbXRkLmjCoMKgwqAgfMKgIDMgKysrCj4+Pj4gwqBpbmNsdWRlL3VhcGkv
bXRkL210ZC1hYmkuaCB8wqAgMiArKwo+Pj4+IMKgNCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4gCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L210ZGNoYXIuYyBiL2RyaXZlcnMvbXRkL210ZGNoYXIuYwo+Pj4+IGluZGV4IDMyMzAzNWQ0ZjJk
MC4uZGE0MjNkZDAzMWFlIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNoYXIuYwo+
Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNoYXIuYwo+Pj4+IEBAIC02NjEsNiArNjYxLDcgQEAg
c3RhdGljIGludCBtdGRjaGFyX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCAKPj4+PiB1X2ludAo+
Pj4+IGNtZCwgdV9sb25nIGFyZykKPj4+PiDCoMKgwqDCoCBjYXNlIE9UUEdFVFJFR0lPTkNPVU5U
Ogo+Pj4+IMKgwqDCoMKgIGNhc2UgT1RQR0VUUkVHSU9OSU5GTzoKPj4+PiDCoMKgwqDCoCBjYXNl
IE9UUExPQ0s6Cj4+Pj4gK8KgwqDCoCBjYXNlIE9UUEVSQVNFOgo+Pj4gCj4+PiBUaGlzIGlzIG5v
dCBhIFNhZmUgSU9DVEwuIFdlIGFyZSBkZXN0cm95aW5nIE9UUCBkYXRhLiBOZWVkIHRvIGNoZWNr
IAo+Pj4gZm9yCj4+PiB3cml0ZSBwZXJtaXNzaW9uIGJlZm9yZSBhbGxvd2luZyB0aGUgaW9jdGwg
cmlnaHQ/Cj4+IAo+PiBBaCB5ZXMsIG9mIGNvdXJzZS4gQnV0IHRoaXMgbWFrZXMgbWUgd29uZGVy
IHdoeSBPVFBMT0NLCj4+IGlzIGNvbnNpZGVyZWQgYSBzYWZlIGNvbW1hbmQuIEFzIHdlbGwgYXMg
TUVNTE9DSyBhbmQKPj4gTUVNVU5MT0NLLiBBbmQgTUVNU0VUQkFEQkxPQ0suIFNob3VsZG4ndCB0
aGVzZSBhbHNvCj4+IHJlcXVpcmUgd3JpdGUgcGVybWlzc2lvbnM/Cj4+IAo+IAo+IFdlbGwsIG9u
ZSBhcmd1bWVudCB3b3VsZCBiZSB0aGF0IExPQ0svVU5MT0NLIGluIGl0c2VsZiB3b24ndCBtb2Rp
ZnkgCj4gZGF0YQo+IGFuZCB0aHVzIGRvZXMgbm90IG5lZWQgd3JpdGUgcGVybWlzc2lvbi4uIEFs
dGhvdWdoIGNhbiBicmljayBhIGZsYXNoCj4gZnJvbSBldmVyIGJlaW5nIHdyaXRhYmxlIGFnYWlu
IGFuZCBjaGFuZ2UgY29udGVudCBvZiBmbGFzaCByZWdpc3RlcnMuCgpXaGV0aGVyIG5vdCB5b3Ug
Y2FuIGJyaWNrIGEgZGV2aWNlIChJIGFncmVlIHdpdGggeW91KSwgaXQgaXMgd3JpdGluZwp0byB0
aGUgcHJvdGVjdGlvbiBiaXRzLiBCdXQgd2hhdCBpcyBtb3JlIGltcG9yYW50IGlzIHRoYXQgT1RQ
TE9DSwppcyBhY3R1YWxseSB3cml0ZS1vbmNlLgoKPiBJIGFtIGZpbmUgd2l0aCBtb3ZpbmcgdGhl
c2UgdG8gcmVxdWlyZSB3cml0ZSBwZXJtaXNzaW9ucyBhcyB3ZWxsCj4gKHByb2JhYmx5IE9UUExP
Q0sgYXMgd2VsbCkuCgpPaywgSSdtIHVuc3VyZSBhYm91dCBNRU1TRVRCQURCTE9DSywgdGhvdWdo
LgoKLW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
