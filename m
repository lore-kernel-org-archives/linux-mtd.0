Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9030C33CB1
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 07:58:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD17B24679
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 07:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qnHn5sIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD17B24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnWJPOOQvQ5QIpnWMNZBcVLTohRSqlCE7CE5F1l7HpQ=; b=qnHn5sIyP74RR7
	wzBSHEh10jPvUafd5QGunNag/a3svvSUF2fzpWdgqo3GHepUUQ2SK6f9/VUyb7HMw2gtPFc/SV3CG
	A7sG73l7/qhcITOrcMiQk7QonglwoOTyIJrIVE/1W4BQSDrF+D98n/mUJXyE4uX5c6tLk+vqAJosp
	k9Z+l3AjGJ8Yh/shgATTz8lGfl/tN3ihIXqc5it9VMrxWfWtNL7EQdWrdKp9ZvKyRPdOcy0N7HeDE
	UPQ0jZyU8aKYnHqHGRe+xrfUOpFOrDGk7L2xE9ENJjElEjR2f0GE3/h4UN/jycvXt6b8gg4ZTX2AY
	n7avXbPaHLn+8F4vNiFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irdZE-0007rM-0p; Wed, 15 Jan 2020 07:58:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irdZ7-0007bo-9S
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 07:58:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 992E0293209;
 Wed, 15 Jan 2020 07:58:09 +0000 (GMT)
Date: Wed, 15 Jan 2020 08:58:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Wojtaszczyk, Piotr" <WojtaszczykP@cumminsallison.com>
Subject: Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
Message-ID: <20200115085806.218b6b32@collabora.com>
In-Reply-To: <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
 <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_235813_607499_50BC93B4 
X-CRM114-Status: GOOD (  18.68  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Zoltan
 Szubbocsev <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxNCBKYW4gMjAyMCAyMDo0NjoxNyArMDAwMAoiV29qdGFzemN6eWssIFBpb3RyIiA8
V29qdGFzemN6eWtQQGN1bW1pbnNhbGxpc29uLmNvbT4gd3JvdGU6Cgo+IE9uIDEvMTQvMjAgMzox
MiBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IENyYXAuIEknbGwgbm90IHJlc2VuZCBpbW1l
ZGlhdGVseSBhcyB0aGlzIGlzIGFuIFJGQywgSSBleHBlY3QKPiA+IGZlZWRiYWNrIG9uIHRoaXMg
cHJvcG9zYWwgYmVmb3JlIHNlbmRpbmcgYW4gYWN0dWFsIHBhdGNoLgo+ID4gCj4gPiAKPiA+IFRo
YW5rcywKPiA+IE1pcXXDqGwKPiA+ICAgCj4gCj4gSGkgTWlxdcOobCwgaGVyZSBhcmUgc29tZSBt
eSBjb21tZW50czoKPiAKPiArc3RhdGljIGludCBtaWNyb25fbmFuZF9hdm9pZF9zaGFsbG93X2Vy
YXNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gKwkJCQkJICAgdW5zaWduZWQgaW50IGViKQo+
ICt7Cj4gKwlzdHJ1Y3QgbWljcm9uX25hbmQgKm1pY3JvbiA9IG5hbmRfZ2V0X21hbnVmYWN0dXJl
cl9kYXRhKGNoaXApOwo+ICsJdW5zaWduZWQgaW50IHBhZ2UgPSBlYiAqIG5hbmRkZXZfcGFnZXNf
cGVyX2VyYXNlYmxvY2soJmNoaXAtPmJhc2UpOwo+ICsJdTggKmRhdGFidWYgPSBuYW5kX2dldF9k
YXRhX2J1ZihjaGlwKTsKPiArCWludCByZXQsIGk7Cj4gKwo+ICsJbWVtc2V0KGRhdGFidWYsIDB4
RkYsIG5hbmRkZXZfcGFnZV9zaXplKCZjaGlwLT5iYXNlKSk7Cj4gKwo+ICsJLyogTWljcm9uIGFk
dmlzZXMgdG8gb25seSB3cml0ZSBvZGQgcGFnZXMgKi8KPiArCWZvciAoaSA9IDA7IGkgPCBNSUNS
T05fU0hBTExPV19FUkFTRV9NSU5fUEFHRTsgaSArPSAyLCBwYWdlICs9IDIpIHsKPiArCQlpZiAo
IShtaWNyb24tPndyaXR0ZW5wW2ViXSAmIEJJVChpKSkpIHsKPiArCQkJcmV0ID0gbmFuZF93cml0
ZV9wYWdlX3JhdyhjaGlwLCBkYXRhYnVmLCBmYWxzZSwgcGFnZSk7Cj4gKwkJCWlmIChyZXQpCj4g
KwkJCQlyZXR1cm4gcmV0Owo+ICsJCX0KPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+IAo+
IFNob3VsZG4ndCB3ZSBwcm9ncmFtIG9ubHkgdGhlIE9PQiBhcmVhIG9mIHRoZSBwYWdlcyB0byAw
J2VzPyBQcm9ncmFtbWluZyBwYWdlcyB0byAweEZGIAo+IHdoaWNoIGFyZSBhbHJlYWR5IDB4RkYg
dGFrZXMgbW9yZSB0aW1lIGFuZCBkb2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2UuCgpIbSwgSSdt
IHByZXR0eSBzdXJlIHdlIHNob3VsZCBzZXQgaW4tYmFuZCBkYXRhIHRvIDAsIG5vdCAweGZmLgpQ
cm9ncmFtbWluZyBvbmx5IHRoZSBPT0IgcG9ydGlvbiBtaWdodCBub3QgYmUgZW5vdWdoIGZvciB0
aGUgaW50ZXJuYWwKImlzIHBhZ2Ugd3JpdHRlbj8iIGxvZ2ljIHRvIHJldHVybiB0cnVlLgoKPiAK
PiBBbHNvIGFmdGVyIHBvd2VyIGxvc3MgYWxsIGZsYWdzIGluIG1pY3Jvbi0+d3JpdHRlbnAgYXJl
IGdvbmUgc28gdGhlIAo+IG1pY3Jvbl9uYW5kX2F2b2lkX3NoYWxsb3dfZXJhc2Ugd2lsbCBwZXJm
b3JtIG9uIGFsbCBQRUJzIGNhdXNpbmcgcGVyZm9ybWFuY2UgbG9zcy4KClllcywgdGhhdCdzIGEg
cGVyZm9ybWFuY2UgaGl0IHdlJ2xsIGhhdmUgdG8gYWNjZXB0IGZvciBub3cuCgo+IAo+IEluc3Rl
YWQgd2UgY291bGQgY2hlY2sgYSBmbGFnIGluIE9PQiBhcmVhIG9mIGZpcnN0IHBhZ2Ugb2YgdGhl
IFBFQiB3ZSBhcmUgYWJvdXQgdG8gZXJhc2UgCj4gYW5kIGNsZWFyIHRoZSBmbGFnIGJpdC9iaXRz
IHdoZW4gMTZ0aCBwYWdlIG9mIHRoZSBQRUIgZ2V0cyBwcm9ncmFtbWVkLiBTaW1taWxhciB0byBi
YWQgCj4gYmxvY2sgbWFyay4KCldlbGwsIHRoYXQgZG9lc24ndCB3b3JrIHdlbGwgYmVjYXVzZToK
CjEvIHByb2dyYW1taW5nIGEgcGFnZSB0aGF0IGhhcyBhbHJlYWR5IGJlIHByb2dyYW1tZWQgaXMg
bm90IGFsd2F5cwogICBhbGxvd2VkICh5b3UgbXVzdCBoYXZlIHN1Yi1wYWdlIHdyaXRlIHN1cHBv
cnQgYW5kIHRoZSBwYWdlIG11c3QgaGF2ZQogICBiZWVuIHByb2dyYW1tZWQgbGVzcyB0aGFuIHRo
ZSBudW1iZXIgb2Ygc3VicGFnZSB3cml0ZXMpCjIvIGNvbnRyb2xsZXIgc2lkZSBFQ0NzIGFyZSBp
biB0aGUgd2F5LCBhbmQgd2UgZG9uJ3QgaGF2ZSBhIHByb3BlcgogICBzb2x1dGlvbiB0byBkZXNj
cmliZSB1bnByb3RlY3RlZCBPT0IgcmVnaW9ucy4gRXZlbiBpZiB3ZSBoYWQKICAgdGhhdCBpbiBw
bGFjZSwgdGhlcmUgbWlnaHQgbm90IGV2ZW4gYmUgc3VjaCB1bnByb3RlY3RlZCBPT0IgbGVmdAog
ICAoc29tZSBjb250cm9sbGVycyBwcm90ZWN0L3VzZSB0aGUgd2hvbGUgT09CIGFyZWEpCgpOb3Rl
IHRoYXQgdGhlIHdyaXRlcyB3ZSBkbyBpbiBtaWNyb25fbmFuZF9hdm9pZF9zaGFsbG93X2VyYXNl
KCkgd2lsbApjb3JydXB0IGRhdGEgcHJlc2VudCBpbiB0aG9zZSBwYWdlcywgYnV0IHRoYXQgc2hv
dWxkbid0IGJlIGEgcHJvYmxlbSwKYmVjYXVzZSB3ZSB3YW50IHRvIGVyYXNlIHRoZW0gYW55d2F5
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
