Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A124C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 09:35:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDAB561166
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 09:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDAB561166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZrUezhByle6YN0E5GwnHOedcs38jPWrAwq3CDx8HZRs=; b=ktx1egDGhRduAG53M+9UaDO+f
	lTrWWgtRifOpKVyGx3LveJWmBJzbiP+DzRyBOM+p0OrTYTdYLJSML2AZyxu8gyYhM8QUx4RWsU6ro
	rDu4FvGWrfoC0dhEi1b60csLZp/zmkfVFovL+RVALGJkmEdDIy0C9ixl6gLcLs9tzy0QWi0KyH9LG
	X9HofzBfA2hJD4mmKWTylTORsN4snsN6u3Tvm4THgillybqmOaZ5csbkGUc9sxwYhoRRSNPizqsUt
	KUM0rXz1/0X7f7CXShX6tNvlJ30uRhl34UDdKHMB/24nvXXrkTGaX0R++iXe2sMvbX7hSEOTU0DlX
	JL+9XoR5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQIv-009Yzb-NI; Mon, 19 Apr 2021 09:34:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQIr-009Ywu-Rk
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 09:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=2bvdZ8YoHK4f9Gnexx7ERmQnHVAqyPaKn674jwrr1sI=; b=22LU0ML3b5aZVLivxiZ/viY6zx
 3/WwOou2xvLJehJvu1uCb2AlCMa0e3+vxdCqqkC9Ed5QWPwHu/ayijxcekNaq8IEanZtFz2SwmXpx
 MeNsI80DFIgD+OcpPH6IkcU4NRn6xbgnLOPRTti0j5VhRNl+BSB+flZkO/qdQlzoa2tGJHElmvWY9
 EuLWvmJaX7UE0bt+3pesDEonMnK4WIiKHxAxjAKoZLkeErMMKdjkzyUWtFPDY9sNfnLaYckSM2V4v
 TJN3tFISmKW5GJ4H1ky7MtAGcRHDF11VTcdNXAwG4JnlB2BVDflb9C3LseH1MOuh/PftnzsqGC0BU
 Ch8EfacQ==;
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQIm-00BEUS-Gq
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 09:34:48 +0000
Received: from [192.168.100.10] (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id 09F2B4640D6;
 Mon, 19 Apr 2021 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1618824879; bh=KEJUUjcZfPmlfs91DJnOZjXYLYg5EpLb1xq9Zcqyy+s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=CgXjTsjueHYsxeCIPqu+l8ldn7KyuRKv0gUoVXHfAhP/SON3EK8PnJETanP/VNyT4
 ibJn2HE1f6ig10mz+g5pl64vv7S2XgZtuF5vA8TyqhA8s/Z3WBfFN+34NSx2FFclYz
 aQYGPth0ccdTRpj7gNzFSSTCzXsVq+SYuxb9feS5V2o77qVAT5y9jOZkNdN92t3/31
 XKkiOLoWygZteGSEYCqCaWj1VDmKcJJGjMJEmTgfyZFzmUwD8j4+kB6xyAOX0Lt9Kc
 GY9bqk6rKV7H4F06+zN4ZR8aMY45xmpsOR2ZfQ9eYWrzY59CktAJDYz84yQ4o4+4vU
 nr/kadZ35NXfw==
Subject: Re: gpmi-nand ecc
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, u-boot@lists.denx.de
References: <a066668f-852e-b3fe-0e91-23f0187d6c20@geanix.com>
 <20210419093244.1f27cb48@xps13>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <f82932ce-ef3d-519b-c9db-2f49b81f8a22@geanix.com>
Date: Mon, 19 Apr 2021 11:34:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210419093244.1f27cb48@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_023444_924598_07A0DCED 
X-CRM114-Status: GOOD (  23.08  )
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

CgpPbiAxOS8wNC8yMDIxIDA5LjMyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFNlYW4sCj4K
PiArIHUtYm9vdCBNTAo+Cj4gU2VhbiBOeWVramFlciA8c2VhbkBnZWFuaXguY29tPiB3cm90ZSBv
biBXZWQsIDE0IEFwciAyMDIxIDE1OjEzOjM5Cj4gKzAyMDA6Cj4KPj4gSGksCj4+Cj4+IEkgaGF2
ZSB0d28gYm9hcmRzIHdpdGggYSBpTVg2VUxMIFNvQyBvbmUgYXR0YWNoZWQgdG8gYSBNaWNyb24g
TkFORCBmbGFzaCAoTVQyOUY0RzA4QUJBRkFXUCkgYW5kIG9uZSBhIFRvc2hpYmEgKFRDNThCVkcy
UzBIVEFJMCkuCj4+Cj4+IEFmdGVyIHVwZGF0aW5nIHRoZSBib2FyZHMgZnJvbSB1LWJvb3QgMjAx
OC4wNyAtPiAyMDIwLjAxLCB0aGUgTWljcm9uIGZpdHRlZCBib2FyZHMgaXMgaGF2aW5nIEVDQyBw
cm9ibGVtcyhpbiB1LWJvb3QpLgo+PiBVLWJvb3QgMjAxOC4wNyBzZWxlY3RzIGVjY19zdHJlbmd0
aCB0byAxOC4KPj4gVS1ib290IDIwMjAuMDEgc2VsZWN0cyBlY2Nfc3RyZW5ndGggdG8gOCwgYnV0
IGlmIEkgaGFyZGNvZGUgdS1ib290IHRvIHJ1biB0aGUgbXhzX25hbmRfbGVnYWN5X2NhbGNfZWNj
X2xheW91dCgpIGl0IHNlbGVjdHMgMTggYml0cy4KPj4KPj4gVGhlIFRvc2hpYmEgYm9hcmRzIGFs
d2F5cyBzZWxlY3RzIDggYml0IGVjY19zdHJlbmd0aCBzbyB0aGV5IGhhdmUgbm8gaXNzdWVzLgo+
Pgo+PiBUaGUga2VybmVsIGRyaXZlciAoZ3BtaS1uYW5kLmMpIHNlZW1zIHRvIGFsc28gdXNlIHRo
ZSBsZWdhY3kgbWV0aG9kIChSZXN1bHRpbmcgMTggYml0cyBpbiBlY2Mgc3RyZW5ndGggZm9yIHRo
ZSBNaWNyb24gTkFORCkuCj4+IEluIGNvbW1vbl9uZmNfc2V0X2dlb21ldHJ5KCk6IEJvdGggY2hp
cC0+ZWNjLnN0cmVuZ3RoIGFuZCBjaGlwLT5lY2Muc2l6ZSBhcmUgMC4KPj4KPj4gSSB3b3VsZCBl
eHBlY3QgZWNjLnN0cmVuZ3RoIHRvIGJlIHNldCB0byA4LCBlYXJsaWVyIGJ1dCBjYW5ub3QgZmlu
ZCB0aGUgc3BvdCB3aGVyZSBpdCBzaG91bGQgYmUgc2V0Lgo+PiBJcyB0aGUgZ3BtaS1uYW5kIGRy
aXZlciBtaXNzaW5nIGEgY2FsbCB0byBuYW5kX2VjY19jaG9vc2VfY29uZigpPwo+PiBNYXliZSB3
ZSBuZWVkIGEgbGVnYWN5IG9wdGlvbiBmb3IgdGhlIGtlcm5lbCBsaWtlIHUtYm9vdC4KPj4KPj4g
V2UgaGF2ZSArMTBLIGJvYXJkcyBkZXBsb3llZCBzbyBpdCdzIG5vdCBzbyBlYXN5IHRvIHN3aXRj
aCBmcm9tIDE4IC0+IDggYml0cy4KPj4gSSBjYW4gZXhwbGljaXQgZml4IHRoaXMgaW4gVS1ib290
IGJ5IGZvcmNpbmcgdGhlIGxlZ2FjeSBtb2RlIHZpYSBhIGR0IGZsYWcsIGJ1dCB0aGUgZ3V0IGZl
ZWxpbmcgc2F5cyB0aGlzIHdpbGwgY29tZSBiYWNrIHRvIGhhdW50IHVzIDopCj4+Cj4+IC9TZWFu
Cj4gSSBob25lc3RseSBkb24ndCBrbm93IGFib3V0IHN1Y2ggaXNzdWUgb24gVS1Cb290IHNpZGUs
IG1heWJlIHlvdSBjYW4KPiB0cnkgdG8gYmUgbW9yZSBzcGVjaWZpYyBvbiB3aGF0IGNvbW1pdCBi
cm9rZSB0aGUgbG9naWMgZm9yIHlvdSBhcyB0aGVyZQo+IGFyZSBub3Qgc28gbWFueSBvZiB0aGVt
IGJldHdlZW4gdGhlIHR3byB2ZXJzaW9uczoKPgo+ICQgZ2l0IGwgdjIwMTguMDcuLnYyMDIwLjAx
IC0tIGRyaXZlcnMvbXRkL25hbmQvcmF3L214c19uYW5kLmMKPiAxZWI2OWFlNDk4NSBjb21tb246
IE1vdmUgQVJNIGNhY2hlIG9wZXJhdGlvbnMgb3V0IG9mIGNvbW1vbi5oCj4gOWFiNWYyMjFhNWUg
bmFuZDogbXhzX25hbmQ6IGFkZCBBUEkgZm9yIHN3aXRjaGluZyBkaWZmZXJlbnQgQkNIIGxheW91
dHMKPiAxZDQzZTI0Yjk0NiBpLk1YNjogbmFuZDogYWRkIG5hbmRiY2IgY29tbWFuZCBmb3IgaW14
Cj4gMTAwMTUwMjU0NWYgQ09ORklHX1NQTF9TWVNfW0RJXUNBQ0hFX09GRjogYWRkCj4gMDQ1Njhi
ZDBiNmQgTVREOiBuYW5kOiBteHNfbmFuZDogQWxsb3cgZHJpdmVyIHRvIGF1dG8gc2V0dXAgRUND
IGluIFNQTAo+IDU2NDVkZjllMDBhIE1URDogTkFORDogbXhzX25hbmRfaW5pdF9kbWE6IE1ha2Ug
bXhzX25hbmRfaW5pdF9kbWEgc3RhdGljCj4gNWFlNTg1YmEzYTggTVREOiBteHNfbmFuZDogRml4
IEJDSCByZWFkIHRpbWVvdXQgZXJyb3Igb24gYm9hcmRzIHJlcXVpcmluZyBFQ0MKPiBhNDMwZmEw
NmE0YSBtdGQ6IG1vdmUgTkFORCBmaWxlcyBpbnRvIGEgcmF3LyBzdWJkaXJlY3RvcnkKCkhpIE1p
cXVlbCwKClRoYW5rcyBmb3IgQ0MnaW5nIHRoZSB1LWJvb3QgbGlzdCA6KQoKY29tbWl0IDYxNmYw
M2RhYmFjYjZjNTAwZThhN2NlYjkyMGNkMDg1NTRjOWZjYWUKQXV0aG9yOiBZZSBMaSA8eWUubGlA
bnhwLmNvbT4KRGF0ZTrCoMKgIE1vbiBNYXkgNCAyMjowODo1MCAyMDIwICswODAwCgogwqDCoMKg
IG10ZDogZ3BtaTogY2hhbmdlIHRoZSBCQ0ggbGF5b3V0IHNldHRpbmcgZm9yIGxhcmdlIG9vYiBO
QU5ECgpUaGlzIGNvbW1pdMKgIF5eIGludHJvZHVjZWQgdGhlIGxlZ2FjeSBmdW5jdGlvbiB0aGF0
IHdhcyB0aGUgInByaW1hcnkiIApiZWZvcmUuCgpHdWVzcyB3ZSBjYW4gc2F5LCB0aGF0IHUtYm9v
dCBicm9rZSBjb21wYXRpYmlsaXR5IHdpdGggdGhlIGtlcm5lbC4KSSBoYXZlIGZpeGVkIG15IHNl
dHVwIGJ5IGVuYWJsaW5nIHRoZSBsZWdhY3kgb3B0aW9uIHZpYSBkdCwgaW4gdS1ib290LgoKL1Nl
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
