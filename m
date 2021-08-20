Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E34FC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D1A6108F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36D1A6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkxKSstcFKRP+j9P686RXfI4K2kijQR6cf5EYPnhsmg=; b=MtqLcDA+eonUdv
	zJ8hgnJhpC8XsAl0UWILft56GMaHQkLbEdVYHMLrz8mlhTIGExxQG6andU9mo0BBauD/rOpvHjLp+
	JIa0KEuI91C/DPqf9eOrrb76Seb+82GHS7vNEFiecSnQOlA2bqrrhOq54yevgCjei43bHcW4dPg1T
	ohrJMt++hxjyj6YmUMzo9fGoGSiSOJ1qZDO/I+sog2InujhYDKsiWn5K7tqRZ6lbMrn0J986NU23h
	5qRHbTZOCpYc+qZzAU1iQIhXGWD/j7tzk8Y5QkG9ZLcTbtEGnP4k9cQBdtsCGhcLpI9nq+7wBRxEC
	t7/EdpEJC8EuMr91kYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3Pl-00B5Nf-GL; Fri, 20 Aug 2021 12:14:25 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3Pf-00B5LS-Jg
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 12:14:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D8D63240002;
 Fri, 20 Aug 2021 12:14:14 +0000 (UTC)
Date: Fri, 20 Aug 2021 14:14:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 08/13] mtd: spinand: Reject 8D-8D-8D op_templates if
 octal_dtr_enale() is missing in manufacturer_op
Message-ID: <20210820141413.6c519255@xps13>
In-Reply-To: <4d428465-59d7-6771-8344-c5090add2a06@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-9-a-nandan@ti.com>
 <20210806210146.3358a85b@xps13>
 <4d428465-59d7-6771-8344-c5090add2a06@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_051419_977609_BCB34715 
X-CRM114-Status: GOOD (  31.58  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBGcmks
IDIwIEF1ZyAyMDIxIDE2OjU2OjUwCiswNTMwOgoKPiBPbiAwNy8wOC8yMSAxMjozMSBhbSwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEFwdXJ2YSwKPiA+IAo+ID4gQXB1cnZhIE5hbmRhbiA8
YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUsIDEzIEp1bCAyMDIxIDEzOjA1OjMzCj4gPiAr
MDAwMDoKPiA+ICAgCj4gPj4gVGhlIFNQSSBOQU5EIGNvcmUgZG9lc24ndCBrbm93IGhvdyB0byBz
d2l0Y2ggdGhlIGZsYXNoIHRvIE9jdGFsIERUUgo+ID4+IG1vZGUgKGkuZS4gd2hpY2ggb3BlcmF0
aW9ucyB0byBwZXJmb3JtKS4gSWYgdGhlIG1hbnVmYWN0dXJlciBoYXNuJ3QKPiA+PiBpbXBsZW1l
bnRlZCB0aGUgb2N0YWxfZHRyX2VuYWJsZSgpIG1hbnVmYWN0dXJlcl9vcCwgdGhlIFNQSSBOQU5E
IGNvcmUKPiA+PiB3b3VsZG4ndCBiZSBhYmxlIHRvIHN3aXRjaCB0byA4RC04RC04RCBtb2RlIGFu
ZCB3aWxsIGFsc28gbm90IGJlIGFibGUKPiA+PiB0byBydW4gaW4gMVMtMVMtMVMgbW9kZSBkdWUg
dG8gYWxyZWFkeSBzZWxlY3RlZCA4RC04RC04RCByZWFkL3dyaXRlCj4gPj4gY2FjaGUgb3BfdGVt
cGxhdGVzLgo+ID4+Cj4gPj4gU28sIGF2b2lkIGNob29zaW5nIGEgT2N0YWwgRFRSIFNQSSBvcF90
ZW1wbGF0ZSBmb3IgcmVhZF9jYWNoZSwKPiA+PiB3cml0ZV9jYWNoZSBhbmQgdXBkYXRlX2NhY2hl
IG9wZXJhdGlvbnMsIGlmIHRoZSBtYW51ZmFjdHVyZXJfb3AKPiA+PiBvY3RhbF9kdHJfZW5hYmxl
KCkgaXMgbWlzc2luZy4gIAo+ID4gCj4gPiBBZnRlciBsb29raW5nIGF0IHlvdXIgcHJldmlvdXMg
Y29tbWl0IEkgZG9uJ3Qgc2VlIHdoeSB0aGlzIHBhdGNoIHdvdWxkCj4gPiBiZSBuZWVkZWQuIG9j
dGFsX2R0cl9lbmFibGUoKSBvbmx5IHVwZGF0ZXMgdGhlIG1vZGUgd2hlbiBpdCBzdWNjZWVkcyBz
bwo+ID4gSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlzIHJlYWxseSBuZWVkZWQuCj4gPiAgIAo+
IAo+IEkgYWRkZWQgaXQgdG8gcHJldmVudCBhbnkgZXJyb3JzIGhhcHBlbmluZyBkdWVzIHRvIGEg
bWlzc2luZyBpbXBsZW1lbnRhdGlvbiBvZiBvY3RhbF9kdHJfZW5hYmxlKCkgZnJvbSBtYW51ZmFj
dHVyZXIgZHJpdmVyIHNpZGUuCj4gU28sIGlmIHRoZSBtYW51ZmFjdHVyZXJzIHNraXBzIHRoZSBv
Y3RhbF9kdHJfZW5hYmxlKCkgaW1wbGVtZW50YXRpb24sIHdlIHdhbnQgdGhlIHNwaW5hbmQgY29y
ZSB0byBydW4gaW4gMXMtMXMtMXMgbW9kZS4KCkkgc3RpbGwgZG9uJ3QgZ2V0IHRoZSBwb2ludDog
eW91IGZhaWwgdGhlIHByb2JlIGlmIHRoZSBvY3RhbCBiaXQgaXMKZW5hYmxlZCBidXQgdGhlIG1h
bnVmYWN0dXJlciBkaWQgbm90IGltcGxlbWVudCBvY3RhbF9kdHJfZW5hYmxlKCksIHNvCmhvdyBj
b3VsZCB3ZSBoYXZlIGlzc3Vlcz8gTWF5YmUgSSBhbSBvdmVybG9va2luZyBzb21ldGhpbmcgdGhv
dWdoLCBidXQKdGhpcyBzZWVtZWQgY29tcGxldGVseSByZWR1bmRhbnQgdG8gbXkgZXllcyBzbyBm
YXIuCgo+IAo+IFJlYWQvd3JpdGUvdXBkYXRlIG9wIHZhcmlhbnQgc2VsZWN0aW9uIGhhcHBlbnMg
aW4gc2VsZWN0X29wX3ZhcmlhbnQoKSwgbXVjaCBiZWZvcmUgb2N0YWxfZHRyX2VuYWJsZSgpLiBT
byBqdXN0IGNoZWNrIGlmIHRoZXJlIGlzIGEgZGVmaW5pdGlvbiBvZiBvY3RhbF9kdHJfZW5hYmxl
IGluIG1hbnVmYWN0dXJlciBvcHMgYW5kIHRoZW4gb25seSB1c2UgOEQgb3AgdmFyaWFudHMuCj4g
Cj4gUmVtb3ZpbmcgdGhpcyB3b3VsZG4ndCBicmVhayBhbnl0aGluZyBpbiB0aGUgY3VycmVudCBp
bXBsZW1lbnRhdGlvbi4KPiBEbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgdGhpcz8KPiAKPiA+
Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4KPiA+
PiAtLS0KPiA+PiAgIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyB8IDcgKysrKysrLQo+ID4+
ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Cj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRk
L25hbmQvc3BpL2NvcmUuYwo+ID4+IGluZGV4IDE5ZDhhZmZhYzA1OC4uODcxMWU4ODdiNzk1IDEw
MDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4+ICsrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4+IEBAIC0xMDI4LDYgKzEwMjgsOCBAQCBzdGF0
aWMgaW50IHNwaW5hbmRfbWFudWZhY3R1cmVyX21hdGNoKHN0cnVjdCBzcGluYW5kX2RldmljZSAq
c3BpbmFuZCwKPiA+PiAgIAkJaWYgKGlkWzBdICE9IG1hbnVmYWN0dXJlci0+aWQpCj4gPj4gICAJ
CQljb250aW51ZTsgIAo+ID4+ICAgPj4gKwkJc3BpbmFuZC0+bWFudWZhY3R1cmVyID0gbWFudWZh
Y3R1cmVyOyAgCj4gPj4gKwo+ID4+ICAgCQlyZXQgPSBzcGluYW5kX21hdGNoX2FuZF9pbml0KHNw
aW5hbmQsCj4gPj4gICAJCQkJCSAgICAgbWFudWZhY3R1cmVyLT5jaGlwcywKPiA+PiAgIAkJCQkJ
ICAgICBtYW51ZmFjdHVyZXItPm5jaGlwcywKPiA+PiBAQCAtMTAzNSw3ICsxMDM3LDYgQEAgc3Rh
dGljIGludCBzcGluYW5kX21hbnVmYWN0dXJlcl9tYXRjaChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2Ug
KnNwaW5hbmQsCj4gPj4gICAJCWlmIChyZXQgPCAwKQo+ID4+ICAgCQkJY29udGludWU7ICAKPiA+
PiAgID4+IC0JCXNwaW5hbmQtPm1hbnVmYWN0dXJlciA9IG1hbnVmYWN0dXJlcjsgIAo+ID4+ICAg
CQlyZXR1cm4gMDsKPiA+PiAgIAl9Cj4gPj4gICAJcmV0dXJuIC1FTk9UU1VQUDsKPiA+PiBAQCAt
MTA5Nyw2ICsxMDk4LDEwIEBAIHNwaW5hbmRfc2VsZWN0X29wX3ZhcmlhbnQoc3RydWN0IHNwaW5h
bmRfZGV2aWNlICpzcGluYW5kLAo+ID4+ICAgCQl1bnNpZ25lZCBpbnQgbmJ5dGVzOwo+ID4+ICAg
CQlpbnQgcmV0OyAgCj4gPj4gICA+PiArCQlpZiAoc3BpbmFuZF9vcF9pc19vY3RhbF9kdHIoJm9w
KSAmJiAgCj4gPj4gKwkJICAgICFzcGluYW5kLT5tYW51ZmFjdHVyZXItPm9wcy0+b2N0YWxfZHRy
X2VuYWJsZSkKPiA+PiArCQkJY29udGludWU7Cj4gPj4gKwo+ID4+ICAgCQluYnl0ZXMgPSBuYW5k
ZGV2X3Blcl9wYWdlX29vYnNpemUobmFuZCkgKwo+ID4+ICAgCQkJIG5hbmRkZXZfcGFnZV9zaXpl
KG5hbmQpOyAgCj4gPj4gICA+ID4gVGhhbmtzLCAgCj4gPiBNaXF1w6hsCj4gPiAKPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiA+ICAgCj4gCj4gVGhhbmtzLAo+IEFw
dXJ2YSBOYW5kYW4KCgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
