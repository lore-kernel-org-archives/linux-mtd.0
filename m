Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BBAC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvxWw8wndj0gw5XbiKRCvoWYTer2APGHaHY/0NMyqkM=; b=qGNlKM0i6XCUYT
	Ih7ge/JYFnYgVC9ay0qhaJdAxQ/a1Fd/4YIwcT2umLFjbdoDfvYIsW1+pYkllTp0/V77yxFK2qGN3
	QuUgsjC65vT6UMTzKWA00l2D5FT4VvTLggdoj30dQghZBD/XNmmPMB8nw+Gkd3/KJ9hcZt5/2K4Ij
	PeQ1TKbgVqppDbbLwBUgeiLNXevu8WivsiGWi+PpVdRhqj5+CWruGHPwDtO3wdbN1Dpd8n2sAw1vC
	2uIvPKMfdN+Tur/Kej2nb/04/VKtu9RK5PTbzgfvPHFfZZENy9CEV/aAy9KsUP5zVBdQR2y4iY6xR
	MCSoyikESZLvKV83JQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUga-00B7xo-PY; Fri, 15 Jul 2022 23:25:29 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUMH-00AyG9-Lc
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 23:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657926269; x=1689462269;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PqYK+pJsEeTGdedFUyk34TlXrWN6NUmeCGCj0d02tQk=;
  b=GFDD4hWKFQjuCjGgErwx/LFJ72XKvOE3u2St6/PHfZPwk4M7Iw6Fkj/k
   eGGR0QQTEzIUkYFSM31xEIdCdC5qi4+2m5KFX/KnKlClD30zR9L/HcNgV
   cG0ubO8NKatkoj3o03dZdrZSOZShP3xovNZOcqSs93MHQSLsW8v/qEiL3
   w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jul 2022 16:04:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 16:04:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 16:04:28 -0700
Received: from [10.110.97.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 16:04:27 -0700
Message-ID: <4dbc7c90-5192-0c51-5c57-4f1dcfa62ff5@quicinc.com>
Date: Fri, 15 Jul 2022 16:04:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: <clg@kaod.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
	<quic_ggregory@quicinc.com>, <quic_jiles@quicinc.com>,
	<tudor.ambarus@microchip.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
 <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
 <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
 <1ce1ac2fabf7e46e303da01782469355@walle.cc>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <1ce1ac2fabf7e46e303da01782469355@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_160429_816556_4C8504E6 
X-CRM114-Status: GOOD (  32.01  )
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

SGksCgpPbiA3LzE1LzIwMjIgMzo1MiBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAK
PiBBbSAyMDIyLTA3LTE1IDIyOjE1LCBzY2hyaWViIEphZSBIeXVuIFlvbzoKPj4gT24gNy8xNC8y
MDIyIDc6MzAgQU0sIEphZSBIeXVuIFlvbyB3cm90ZToKPj4+IE9uIDcvMTQvMjAyMiA3OjIxIEFN
LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4+IEFtIDIwMjItMDctMTQgMTY6MTYsIHNjaHJpZWIg
TWljaGFlbCBXYWxsZToKPj4+Pj4gQW0gMjAyMi0wNy0xNCAxNTo0Nywgc2NocmllYiBKYWUgSHl1
biBZb286Cj4+Pj4+PiBPbiA3LzE0LzIwMjIgMTI6NDEgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6
Cj4+Pj4+Pj4gV2hhdCBkb2VzICJkb2Vzbid0IGJvb3QgYXQgYWxsIiBtZWFuPyBBcmUgdGhlcmUg
YW55IGtlcm5lbCBzdGFydHVwCj4+Pj4+Pj4gbWVzc2FnZXM/Cj4+Pj4+Pgo+Pj4+Pj4gSSdtIHNo
YXJpbmcgdGhlIGVycm9yIG1lc3NhZ2VzIGJlbG93Lgo+Pj4+Pgo+Pj4+PiBUaGFua3MuCj4+Pj4+
Cj4+Pj4+PiBbwqDCoMKgIDAuNzQ4NTk0XSBzcGktbm9yIHNwaTAuMDogdzI1cTUxMm53cSAoNjU1
MzYgS2J5dGVzKQo+Pj4+Pj4gW8KgwqDCoCAwLjg2NTIxNl0gc3BpLWFzcGVlZC1zbWMgMWU2MjAw
MDAuc3BpOiBDRTAgcmVhZCBidXN3aWR0aDo0IAo+Pj4+Pj4gWzB4NDA2YzA3NDFdCj4+Pj4+PiBb
wqDCoMKgIDAuODcyODMzXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+
Pj4+IFvCoMKgwqAgMC44Nzc5ODRdIFdBUk5JTkc6IENQVTogMSBQSUQ6IDEgYXQgZHJpdmVycy9t
dGQvbXRkY29yZS5jOjU4Mwo+Pj4+Pj4gYWRkX210ZF9kZXZpY2UrMHgyOGMvMHg1M2MKPj4+Pj4+
IFvCoMKgwqAgMC44ODcyMzddIENQVTogMSBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWlu
dGVkCj4+Pj4+PiA1LjE1LjQzLUFVVE9JTkMtZGlydHktMjM4MDFhNiAjMQo+Pj4+Pgo+Pj4+PiBD
b3VsZCB5b3UgcGxlYXNlIHRyeSBpdCBvbiB0aGUgbGF0ZXN0ICh2YW5pbGxhKSBsaW51eC1uZXh0
Pwo+Pj4+Cj4+Pj4gb3Igc3BpLW5vci9uZXh0IFsxXSBhcyB0aGVyZSBhcmUgcXVpdGUgYSBsb3Qg
b2YgY2hhbmdlcy4gVGhlCj4+Pj4gcGF0Y2hlcyBzaGFsbCBiZSBiYXNlZCBvbiB0aGF0Lgo+Pj4K
Pj4+IE9rYXkuIExldCBtZSB0cnkgdGhhdC4gSSB0ZXN0ZWQgaXQgdXNpbmcgNS4xNS40MyB3aXRo
IGJhY2stcG9ydGVkCj4+PiBzcGktbm9yIHBhdGNoZXMgZnJvbSB0aGUgbGF0ZXN0LiBJJ2xsIGJh
Y2stcG9ydCBtb3JlIGNoYW5nZXMgZnJvbQo+Pj4gdGhlIHNwaS1ub3IvbmV4dCBhbmQgd2lsbCB0
ZXN0IHRoZSBJTkZPKDB4ZWY2MDIwLCAwLCAwLCAwKSBzZXR0aW5nCj4+PiBhZ2Fpbi4KPj4KPj4g
SSB0ZXN0ZWQgdGhlIHNldHRpbmcgYWdhaW4gYWZ0ZXIgY2hlcnJ5IHBpY2tpbmcgYWxsIFNQSSBy
ZWxhdGluZyBjaGFuZ2VzCj4+IGZyb20gdGhlICdmb3ItbmV4dCcgYnJhbmNoIG9mCj4+IGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaSByZXBv
c2l0b3J5Lgo+IAo+IFRoYXQgaXMgbm90IHRoZSB0cmVlIEkgbWVudGlvbmVkIGluIG15IHByZXZp
b3VzIG1haWwuIFdoeSBkbyB5b3UKPiBjaGVycnktcGljayB0aGUgY2hhbmdlcyBpbnN0ZWFkIG9m
IGp1c3QgdHJ5aW5nIHRoZSBzcGktbm9yL25leHQKPiB0cmVlPwoKSSBjb21wYXJlZCBpdCB3aXRo
IApnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4
LmdpdCNzcGktbm9yL25leHQgCnRvby4gUmVzdWx0IGlzIHN0aWxsIHRoZSBzYW1lLgoKPj4gTm8g
bHVjayEgSXQncyBzdGlsbCBtYWtpbmcgdGhlIHNhbWUgd2FybmluZyBkdW1wIGF0ICdhZGRfbXRk
X2RldmljZScKPj4gc2luY2UgJ210ZC0+ZXJhc2VzaXplJyBpcyBjaGVja2VkIGFzIDAuCj4+Cj4+
IEkgdHJhY2VkIGl0IGZ1cnRoZXIgdG8gY2hlY2sgaWYgdGhlIGVyYXNlc2l6ZSBpcyBwcm9wZXJs
eSBwYXJzZWQgZnJvbQo+PiB0aGUgc2ZkcCBhbmQgY2hlY2tlZCB0aGF0IGVyYXNlIG1hcCBzZWVt
cyBwYXJzZWQgYW5kIGluaXRpYWxpemVkCj4+IGNvcnJlY3RseSBpbiAnc3BpX25vcl9wYXJzZV9i
ZnB0JyBidXQgcHJvYmxlbSBpcywgYSB0YXJnZXQKPj4gbXRkLT5lcmFzZXNpemUgaXMgbm90IHBy
b3Blcmx5IHNlbGVjdGVkIGluICdzcGlfbm9yX3NlbGVjdF9lcmFzZScgc2luY2UKPj4gdGhlICd3
YW50ZWRfc2l6ZScgdmFyaWFibGUgaXMgaW5pdGlhbGl6ZWQgYXMgc2VjdG9yIHNpemUgb2YgaW5m
byB0YWJsZQo+PiBzbyBhIHNlbGVjdGVkIHRhcmdldCBtdGQtPmVyYXNlc2l6ZSBpcyBhbHNvIDAg
c28gbG9va3MgbGlrZSBpdCdzIHRoZQo+PiByZWFzb24gd2h5IGl0IGNhbid0IGluaXRpYWxpemUg
bXRkIGRldmljZSBpZiB3ZSB1c2UKPj4gSU5GTygweGVmNjAyMCwgMCwgMCwgMCkuCj4gCj4gSGF2
ZSBhIGxvb2sgYXQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMjA1MTAx
NDAyMzIuMzUxOTE4NC0yLW1pY2hhZWxAd2FsbGUuY2MvIAo+IAo+IHdhbnRlZF9zaXplIGNhbiBi
ZSAwLiBJbiB0aGlzIGNhc2Ugc3BpX25vcl9zZWxlY3RfdW5pZm9ybV9lcmFzZSgpCj4gc2hvdWxk
IHJldHVybiB0aGUgYmlnZ2VzdCB2YWxpZCBlcmFzZSB0eXBlLiBDb3VsZCB5b3UgcGxlYXNlIGNo
ZWNrIHRoYXQKPiAoMSkgc3BpX25vcl9zZWxlY3RfdW5pZm9ybV9lcmFzZSgpIHJldHVybiBub24t
TlVMTAo+ICgyKSBjaGVjayB3aGF0IHZhbHVlIGVyYXNlLT5zaXplIGhhcyAoSSBndWVzcyBpdCBz
aG91bGQgYmUgNjRrIGluIHlvdXIgCj4gY2FzZSkKPiAKPiAgRnJvbSB3aGF0IHlvdSB0ZWxsIG1l
IGVyYXNlLT5zaXplIHNob3VsZCBiZSB6ZXJvLiBJZiB0aGF0IGlzIHRoZQo+IGNhc2UgbG9vayBh
dCBzcGlfbm9yX3BhcnNlX2JmcHQoKSB3aGVyZSB0aGUgZXJhc2Ugc2l6ZXMgYXJlIHBhcnNlZC4K
PiBBbHNvIHRha2UgYSBsb29rIGF0IHNwaV9ub3JfcGFyc2VfNGJhaXQoKSB3aGVyZSB0aGUgZXJh
c2UgdHlwZXMgbWlnaHQKPiBiZSBjbGVhcmVkIGFnYWluLgo+IAo+IEkndmUgY2hlY2tlZCB5b3Vy
IFNGRFAgZGF0YSBhbmQgaXQgY29udGFpbnMgdGhyZWUgdmFsaWQgZXJhc2Ugc2l6ZXMKPiBhbmQg
b3Bjb2RlcyBmb3IgM2J5dGUgYWRkcmVzc2luZyBhbmQgdHdvIHZhbGlkIGVyYXNlIG9wY29kZXMg
Zm9yIDQKPiBieXRlIGFkZHJlc3NpbmcuIFNvIHRoYXQgbG9va3MgYWxsIGdvb2QuIEFmdGVyIGFs
bCB0aGUgU0ZEUCBwYXJzaW5nCj4gSSBleHBlY3QgdGhhdCB5b3UgaGF2ZSB0d28gdmFsaWQgZXJh
c2UgdHlwZXM6Cj4gIMKgLSBlcmFzZSBzaXplIDQwOTYgd2l0aCBlcmFzZSBvcGNvZGUgMjFoCj4g
IMKgLSBlcmFzZSBzaXplIDY1NTM2IHdpdGggZXJhc2Ugb3Bjb2RlIERDaAoKSSBjaGVja2VkIFNG
RFAgaXMgcGFyc2VkIGFuZCB0aGVzZSB0aHJlZSBlcmFzZSBzaXplcyBhcmUgZW51bWVyYXRlZApp
biB0aGUgZm9yIGxvb3AgaW4gc3BpX25vcl9zZWxlY3RfdW5pZm9ybV9lcmFzZSgpLgoKNjU1MzYK
MAo0MDk2Cgo+PiBBbHNvLCBjaGVja2VkIHRoYXQgdGhlIG10ZC0+ZXJhc2VzaXplIGlzIHNldCB0
byA0MDk2IGlmIEkgZW5hYmxlCj4+IENPTkZJR19NVERfU1BJX05PUl9VU0VfNEtfU0VDVE9SUyBz
byB0aGUgU1BJIGZsYXNoIGNhbiBiZSBpbml0aWFsaXplZAo+PiB3aXRoIHRoZSBJTkZPKDB4ZWY2
MDIwLCAwLCAwLCAwKSBzZXR0aW5nIGJ1dCwgaXQgc2hvdWxkIGNvdmVyIGV2ZW4KPj4gd2hlbgo+
PiB0aGUgY29uZmlndXJhdGlvbiBpcyBub3QgZW5hYmxlZC4gSSB0aGluaywgdGhpcyBwYXRjaCBz
aG91bGQgZ28gYXMgaXQKPj4gaXMuIFRoZSBlcmFzZXNpemUgc2VsZWN0aW5nIGlzc3VlIGNvdWxk
IGJlIGZpeGVkIHVzaW5nIGEgc2VwYXJhdGUKPj4gcGF0Y2guCj4+IEFyZSB5b3Ugc3RpbGwgc3Vy
ZSB0aGF0IHRoZSBJTkZPKDB4ZWY2MDIwLCAwLCAwLCAwKSB3b3JrcyBpbiB0aGUKPj4gbGF0ZXN0
IHNwaS1uZXh0Pwo+IAo+IEkndmUgZ290IHR3byB0ZXN0ZWQtYnkncyB3aXRoIHR3byBkaWZmZXJl
bnQgZmxhc2hlcywgc28geWVzLCBJJ20KPiBwcmV0dHkgc3VyZSBpdCB3b3JrcyBpbiBwcmluY2lw
bGUuIEl0IG1pZ2h0IHN0aWxsIGJlIHNvbWV0aGluZwo+IHdyb25nIHdpdGggeW91ciBmbGFzaCB0
aG91Z2guCgpZZXMsIEkgcmVhZCB0aGUgdGhyZWFkIHlvdSBhcmUgdXBzdHJlYW1pbmcgY3VycmVu
dGx5LgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA1MTAxNDAyMzIuMzUxOTE4NC0x
LW1pY2hhZWxAd2FsbGUuY2MvCgpXZXJlIHRob3NlIHRlc3RlZCBpbiBDT05GSUdfTVREX1NQSV9O
T1JfVVNFXzRLX1NFQ1RPUlMgZW5hYmxlZCBidWlsZD8KCkFzIEkgc2FpZCBhYm92ZSwgbWluZSBh
bHNvIHdvcmtzIGlmIEkgZW5hYmxlIHRoZSBjb25maWcgYnV0IHdlIHNob3VsZAptYWtlIGl0IHdv
cmsgd2l0aG91dCB0aGUgY29uZmlnLCByaWdodD8KCi1KYWUKCj4gLW1pY2hhZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
