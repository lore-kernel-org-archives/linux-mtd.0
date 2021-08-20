Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13963C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 10:28:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52A061101
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 10:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C52A061101
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmb7C+bXzHbtPJwFPLeWZRIgZvjrVJXamyVDJblzn+k=; b=LokV7YE/IZ3/QiH1mdeFvVoDw5
	nRdX9CG0QtZjjeD5mU9wS/fYgupgHjcxXpFuqPEiNfkwfFZSOU42LCPJFRaH6n+dbFYrSIVdilbrX
	sTUkFJThvBonfN4l0vAp4mBmqMQUH0kXjXmclizaw/ZdJmaS9CahyK8BjD1BMHFHSD2BI4JKw9S4N
	KS8dq7Ih/eVnmRWN6RN5r6Drhc+5+Er97gV0L/43+bZgARRQkJcNw9oAcMrI/vyS6TBnDfq/ZjYDw
	eR4S/yj/r9qYgA5iMWSRn95tZqyHIZuZ6GQ1ioZJNEH60yOkk8Qs7gX/za/aRmdam+1193Dtfk5/v
	O2DYYVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH1kk-00Afqs-9k; Fri, 20 Aug 2021 10:27:58 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH1kd-00Afo7-Dz
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 10:27:55 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KARfjF101380;
 Fri, 20 Aug 2021 05:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629455261;
 bh=LFbDbUX2EaSwpbZwr8w88r0d5hrA4CmOyZDN3ofcqD4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=sXTdtAjGEX8oHbDmZvRWhyJnom6E5959SlOtdb3NmYFbMF5iZupF5jpq4EHqzgTUw
 D4+VYaKaVooqWgFEbx1V54vtVAscY3bHJtzIwBB4U5wCYL+9krp7URFm3X+fr59KaW
 2kxA1qfCSytB1ln/L5lSFL/0ao/FNfiNYKsYRTug=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KARf8V126926
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 05:27:41 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 05:27:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 05:27:41 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KARa1C072931;
 Fri, 20 Aug 2021 05:27:37 -0500
Subject: Re: [PATCH 04/13] mtd: spinand: Fix odd byte addr and data phase in
 read/write reg op and write VCR op for Octal DTR mode
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-5-a-nandan@ti.com> <20210806204334.5fedea42@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <a0decde4-c68e-9494-9ce5-97d60916f9ad@ti.com>
Date: Fri, 20 Aug 2021 15:57:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806204334.5fedea42@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_032751_611692_34590AAF 
X-CRM114-Status: GOOD (  32.64  )
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

SGkgTWlxdcOobCwKCk9uIDA3LzA4LzIxIDEyOjEzIGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhpIEFwdXJ2YSwKPiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9u
IFR1ZSwgMTMgSnVsIDIwMjEgMTM6MDU6MjkKPiArMDAwMDoKPiAKPj4gSW4gT2N0YWwgRFRSIFNQ
SSBtb2RlLCAyIGJ5dGVzIG9mIGRhdGEgZ2V0cyB0cmFuc21pdHRlZCBvdmVyIG9uZSBjbG9jawo+
PiBjeWNsZSwgYW5kIGhhbGYtY3ljbGUgaW5zdHJ1Y3Rpb24gcGhhc2VzIGFyZW4ndCBzdXBwb3J0
ZWQgeWV0LiBTbywKPj4gZXZlcnkgRFRSIHNwaV9tZW1fb3AgbmVlZHMgdG8gaGF2ZSBldmVuIG5i
eXRlcyBpbiBhbGwgcGhhc2VzIGZvcgo+PiBub24tZXJyYXRpYyBiZWhhdmlvdXIgZnJvbSB0aGUg
U1BJIGNvbnRyb2xsZXIuCj4+Cj4+IFRoZSBvZGQgbGVuZ3RoIGNtZCBhbmQgZHVtbXkgcGhhc2Vz
IGdldCBoYW5kbGVkIGJ5IHNwaW1lbV9zZXR1cF9vcCgpCj4+IGJ1dCB0aGUgb2RkIGxlbmd0aCBh
ZGRyZXNzIGFuZCBkYXRhIHBoYXNlcyBuZWVkIHRvIGJlIGhhbmRsZWQgYWNjb3JkaW5nCj4+IHRv
IHRoZSB1c2UgY2FzZS4gRm9yIGV4YW1wbGUgaW4gT2N0YWwgRFRSIG1vZGUsIHJlYWQgcmVnaXN0
ZXIgb3BlcmF0aW9uCj4+IGhhcyBvbmUgYnl0ZSBsb25nIGFkZHJlc3MgYW5kIGRhdGEgcGhhc2Uu
IFNvIGl0IG5lZWRzIHRvIGV4dGVuZCBpdAo+PiBieSBhZGRpbmcgYSBzdWl0YWJsZSBleHRyYSBi
eXRlIGluIGFkZHIgYW5kIHJlYWRpbmcgMiBieXRlcyBvZiBkYXRhLAo+PiBkaXNjYXJkaW5nIHRo
ZSBzZWNvbmQgYnl0ZS4KPj4KPj4gSGFuZGxlIGFkZHJlc3MgYW5kIGRhdGEgcGhhc2VzIGZvciBP
Y3RhbCBEVFIgbW9kZSBpbiByZWFkL3dyaXRlCj4+IHJlZ2lzdGVyIGFuZCB3cml0ZSB2b2xhdGls
ZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIG9wZXJhdGlvbnMKPj4gYnkgYWRkaW5nIGEgc3VpdGFi
bGUgZXh0cmEgYnl0ZSBpbiB0aGUgYWRkcmVzcyBhbmQgZGF0YSBwaGFzZS4KPj4KPj4gQ3JlYXRl
IHNwaW1lbV9zZXR1cF9yZWdfb3AoKSBoZWxwZXIgZnVuY3Rpb24gdG8gZWFzZSBzZXR0aW5nIHVw
Cj4+IHJlYWQvd3JpdGUgcmVnaXN0ZXIgb3BlcmF0aW9ucyBpbiBvdGhlciBmdW5jdGlvbnMsIGUu
Zy4gd2FpdCgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0
aS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDI2ICsrKysr
KysrKysrKysrKysrKysrKy0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPj4gaW5kZXggMmU1OWZhZWNj
OGY1Li5hNTMzNGFkMzRmOTYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPj4gQEAgLTY1LDEyICs2
NSwyNyBAQCBzdGF0aWMgdm9pZCBzcGluYW5kX3NldHVwX29wKGNvbnN0IHN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCwKPj4gICAJfQo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB2b2lkIHNw
aW5hbmRfc2V0dXBfcmVnX29wKGNvbnN0IHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwK
Pj4gKwkJCQkgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+IAo+IFNhbWUgcmVtYXJrIGFib3V0IHRo
ZSBuYW1pbmcuIEluIGZhY3QgSSBiZWxpZXZlIHdlIGNvdWxkIGhhdmUgdGhpcwo+IGxvZ2ljIGlu
IF9zZXR1cF9vcCgpIChvciB3aGF0ZXZlciBpdHMgbmFtZSkgYW5kIGFkZCBhIHNwZWNpZmljCj4g
cGFyYW1ldGVyIGZvciBpdD8KPiAKCk9rYXksIEkgd2lsbCBhZGQgYSBwYXJhbWV0ZXIgaW4gYXJn
dW1lbnQgYW5kIGluY2x1ZGUgdGhpcyBsb2dpYyBpbiAKX3NldHVwX29wKCkuCgo+PiArewo+PiAr
CWlmIChzcGluYW5kLT5yZWdfcHJvdG8gPT0gU1BJTkFORF9PQ1RBTF9EVFIpIHsKPj4gKwkJLyoK
Pj4gKwkJICogQXNzaWduaW5nIHNhbWUgZmlyc3QgYW5kIHNlY29uZCBieXRlIHdpbGwgcmVzdWx0
IGluIGNvbnN0YW50Cj4+ICsJCSAqIGJpdHMgb24gdGhzIFNQSSBidXMgYmV0d2VlbiBwb3NpdGl2
ZSBhbmQgbmVnYXRpdmUgY2xvY2sgZWRnZXMKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdGhlCj4gCgpPay4KCj4+ICsJCSAqLwo+PiArCQlvcC0+YWRkci52YWwgPSAob3AtPmFkZHIu
dmFsIDw8IDgpIHwgb3AtPmFkZHIudmFsOwo+IAo+IEkgYW0gbm90IHN1cmUgdG8gdW5kZXJzdGFu
ZCB3aGF0IHlvdSBkbyBoZXJlPwo+IAoKSW4gT2N0YWwgRFRSIG1vZGUsIDIgYnl0ZXMgb2YgZGF0
YSBhcmUgc2VudCBpbiBhIGNsb2NrIGN5Y2xlLiBTbywgd2UgCm5lZWQgdG8gYXBwZW5kIG9uZSBl
eHRyYSBieXRlIHdoZW4gc2VuZGluZyBhIHNpbmdsZSBieXRlLiBUaGlzIGV4dHJhIApieXRlIHdv
dWxkIGJlIHNlbnQgb24gdGhlIG5lZ2F0aXZlIGVkZ2UuCgpJdCB3aWxsIG1ha2Ugc2Vuc2UgdG8g
a2VlcCBib3RoIHRoZSBieXRlcyBzYW1lLCBhcyB3aGVuIGl0IHdpbGwgYmUgc2V0IApvbiB0aGUg
U1BJIHBpbnMsIHRoZSBiaXRzIG9uIHRoZSBTUEkgSU8gcG9ydHMgd2lsbCByZW1haW4gY29uc3Rh
bnQgCmJldHdlZW4gdGhlIHBvc2l0aXZlIGFuZCBuZWdhdGl2ZSBlZGdlcyAoYXMgMSBjb21wbGV0
ZSBieXRlIGlzIHNldCBpbiAKb25lIGNsb2NrIGVkZ2UgaW4gTVNCIG9yZGVyKS4gVGhlcmUgYXJl
IG5vIHJlc3RyaWN0aW9ucyBieSB0aGUgCm1hbnVmYWN0dXJlcnMgb24gdGhpcywgdGhlIHJlbGV2
YW50IGFkZHJlc3MgYnl0ZSBuZWVkcyB0byBiZSBvbiBwb3NpdGl2ZSAKZWRnZSBhbmQgc2Vjb25k
IGJ5dGUgb24gbmVnYXRpdmUgZWRnZSBpcyBkb24ndCBjYXJlLgoKPj4gKwkJb3AtPmFkZHIubmJ5
dGVzID0gMjsKPj4gKwkJb3AtPmRhdGEubmJ5dGVzID0gMjsKPj4gKwl9Cj4gCj4gU3BhY2UKPiAK
Ck9rLgoKPj4gKwlzcGluYW5kX3NldHVwX29wKHNwaW5hbmQsIG9wKTsKPj4gK30KPj4gKwo+PiAg
IHN0YXRpYyBpbnQgc3BpbmFuZF9yZWFkX3JlZ19vcChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNw
aW5hbmQsIHU4IHJlZywgdTggKnZhbCkKPj4gICB7Cj4+IC0Jc3RydWN0IHNwaV9tZW1fb3Agb3Ag
PSBTUElOQU5EX0dFVF9GRUFUVVJFX09QKHJlZywKPj4gLQkJCQkJCSAgICAgIHNwaW5hbmQtPnNj
cmF0Y2hidWYpOwo+PiArCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gU1BJTkFORF9HRVRfRkVBVFVS
RV9PUChyZWcsIHNwaW5hbmQtPnNjcmF0Y2hidWYpOwo+IAo+IFlvdSBjYW4gZG8gdGhpcywgYnV0
IGluIGEgZGlmZmVyZW50IGNvbW1pdC4KPiAKCkdvdCBpdC4KCj4+ICAgCWludCByZXQ7Cj4+ICAg
Cj4+ICsJc3BpbmFuZF9zZXR1cF9yZWdfb3Aoc3BpbmFuZCwgJm9wKTsKPj4gICAJcmV0ID0gc3Bp
X21lbV9leGVjX29wKHNwaW5hbmQtPnNwaW1lbSwgJm9wKTsKPj4gICAJaWYgKHJldCkKPj4gICAJ
CXJldHVybiByZXQ7Cj4+IEBAIC04MSwxMCArOTYsMTAgQEAgc3RhdGljIGludCBzcGluYW5kX3Jl
YWRfcmVnX29wKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwgdTggcmVnLCB1OCAqdmFs
KQo+PiAgIAo+PiAgIHN0YXRpYyBpbnQgc3BpbmFuZF93cml0ZV9yZWdfb3Aoc3RydWN0IHNwaW5h
bmRfZGV2aWNlICpzcGluYW5kLCB1OCByZWcsIHU4IHZhbCkKPj4gICB7Cj4+IC0Jc3RydWN0IHNw
aV9tZW1fb3Agb3AgPSBTUElOQU5EX1NFVF9GRUFUVVJFX09QKHJlZywKPj4gLQkJCQkJCSAgICAg
IHNwaW5hbmQtPnNjcmF0Y2hidWYpOwo+PiArCXN0cnVjdCBzcGlfbWVtX29wIG9wID0gU1BJTkFO
RF9TRVRfRkVBVFVSRV9PUChyZWcsIHNwaW5hbmQtPnNjcmF0Y2hidWYpOwo+IAo+IFNhbWUgaGVy
ZS4KPiAKClllcyEKCj4+ICAgCj4+IC0JKnNwaW5hbmQtPnNjcmF0Y2hidWYgPSB2YWw7Cj4+ICsJ
c3BpbmFuZF9zZXR1cF9yZWdfb3Aoc3BpbmFuZCwgJm9wKTsKPj4gKwltZW1zZXQoc3BpbmFuZC0+
c2NyYXRjaGJ1ZiwgdmFsLCBvcC5kYXRhLm5ieXRlcyk7Cj4+ICAgCXJldHVybiBzcGlfbWVtX2V4
ZWNfb3Aoc3BpbmFuZC0+c3BpbWVtLCAmb3ApOwo+PiAgIH0KPj4gICAKPj4gQEAgLTU0Nyw2ICs1
NjIsNyBAQCBzdGF0aWMgaW50IHNwaW5hbmRfd2FpdChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNw
aW5hbmQsCj4+ICAgCXU4IHN0YXR1czsKPj4gICAJaW50IHJldDsKPj4gICAKPj4gKwlzcGluYW5k
X3NldHVwX3JlZ19vcChzcGluYW5kLCAmb3ApOwo+PiAgIAlyZXQgPSBzcGlfbWVtX3BvbGxfc3Rh
dHVzKHNwaW5hbmQtPnNwaW1lbSwgJm9wLCBTVEFUVVNfQlVTWSwgMCwKPj4gICAJCQkJICBpbml0
aWFsX2RlbGF5X3VzLAo+PiAgIAkJCQkgIHBvbGxfZGVsYXlfdXMsCj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAKClRoYW5rcywK
QXB1cnZhIE5hbmRhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
