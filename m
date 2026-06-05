Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F57CD6E5D
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 06:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1WFN9/UZXBV+w4Cq/ALHzlsrHUhReXv/9I8NyN62tc=; b=Ktvw6mknnTPHB7
	01t5gQmfsKWHJQNwTWUcUYKuYkUbNZF7PQiseJjkHyzi9JTF4ZjpH6SsnBfbd4Vhhmn0HyGT8Guno
	ghK7pZBu75BkRmoSo1uOChsv7xSH9T5kbcOxUjDlXft1hvhA/6gxer/pFlfGTMtTdfRg0oLX6GNKl
	L4kBnRMR/YVte7GDmsl8Cl4UVkfeNXJT5Hip0qjwTre+tWcNYAC14EC+pnATRSGoEtsT8kWEaLcND
	+juLSSlrkdIjrQlZZzAXGqU3+8Asvr7WyFQCPYoJp7UlQPv29Llyd1q7RNf+L0Kznupp8efCoVE0d
	BKmAPF1uPJh5sl2k0aag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO7A-00000000Acg-1Nib;
	Fri, 05 Jun 2026 06:33:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO77-00000000Abx-2xV2
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 06:33:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D854C5846E;
	Fri,  5 Jun 2026 06:33:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E41095FED1;
	Fri,  5 Jun 2026 06:33:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9172B106A1D96;
	Fri,  5 Jun 2026 08:32:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780641182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oZ+ZvFYXgt3BlDHLx3H6UKrGgUH+GXfiB8/jp4bvNtM=;
	b=sH7jIIJWFPZR4hP+gJQg9HmaSqE1LeB2WEN6Po/fsKY9cA/HNSdDG0U1CgzeUcCesWx90b
	lSCBbKqwsoc9zmbFlWtMDWn4qHzjZXHzfecQeiVqxOIfXx/dOtyaCPHB25uJMMGJSmFmzn
	Qft13lRSJQi8vRmG9Bfg2fuLF/HWp3Dms3fdfUsP+YMydeKnTGwZwRFX9b86yMkphOlM7p
	9x18LnAC/szhbJNdYaqZpyc7DWog5+nX8Eh2NsgnONIUpW5v0+01/3E5Ljjp/HtzAhvIMI
	MtA3y4trl10T711ZDtIOHTAh4oWqLj0RMj4Qd53Pl7BgwXPXKoqtRxzqAwfFkg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <20260604-shrunk-acclaim-25368d7ad63e@spud> (Conor Dooley's
	message of "Thu, 4 Jun 2026 09:36:49 +0100")
References: <20260527175527.2247679-2-s-k6@ti.com>
	<20260528-clergyman-kindling-20971775ba78@spud>
	<eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
	<87cxy92llq.fsf@bootlin.com>
	<20260602-aptly-bunkbed-1bd3a8d63d54@spud>
	<875x3zzkji.fsf@bootlin.com> <20260603-neatly-twine-e89b923f5cb6@spud>
	<87o6hry4d4.fsf@bootlin.com>
	<20260603-balance-encounter-94f69e1577f3@spud>
	<87ik7yydyv.fsf@bootlin.com>
	<20260604-shrunk-acclaim-25368d7ad63e@spud>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 05 Jun 2026 08:32:56 +0200
Message-ID: <87a4t9wl7r.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_233305_911313_E0265E89 
X-CRM114-Status: GOOD (  22.08  )
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

T24gMDQvMDYvMjAyNiBhdCAwOTozNjo0OSArMDEsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgSnVuIDA0LCAyMDI2IGF0IDA5OjE0OjE2QU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhpIENvbm9yLAo+PiAKPj4gPj4gPj4gPiBSaWdodCwg
YW5kIHRoaXMgSSBndWVzcyBpcyB3aGF0IHNjdXBwZXJzIGxldHRpbmcgdGhlIGNvbnRyb2xsZXIg
ZHJpdmVyCj4+ID4+ID4+ID4gc29ydCB0aGUgY29uZmlndXJhdGlvbiBvdXQgaXRzZWxmIGFuZCBs
ZWF2aW5nIHRoZSBwcm9wZXJ0eSBhcy1pcy4KPj4gPj4gPj4gPiBJdCBjb3VsZCBiZSB0aGF0IHRo
ZSBzcGVlZCBpbiBzcGktbWF4LWZyZXF1ZW5jeSBpcyBsb3dlciB0aGFuIHRoZSAiYmFzZQo+PiA+
PiA+PiA+IHNwZWVkIiBvZiB0aGUgY29udHJvbGxlciBidXQgYmVjYXVzZSBvZiBib2FyZCByb3V0
aW5nIG9yIGRldmljZQo+PiA+PiA+PiA+IGNhcGFiaWxpdHkgdGhhdCB0aGUgdHVuZWQgbW9kZSBp
cyBzdGlsbCByZXF1aXJlZCwgcmlnaHQ/Cj4+ID4+ID4+IAo+PiA+PiA+PiBJIGRvIG5vdCBhY3R1
YWxseSBleHBlY3QgYW55IHR1bmVkIG1vZGUvZnJlcXVlbmN5IHRvIGJlIG1hbmRhdG9yeS4KPj4g
Pj4gPgo+PiA+PiA+IEkgdGhpbmsgeW91IG1pc3VuZGVyc3Rvb2QgbXkgdXNlIG9mICJyZXF1aXJl
ZCIsIEkgbWVhbnQgdGhhdCB0aGUgbmV3Cj4+ID4+ID4gcHJvcGVydHkvaW5mb3JtYXRpb24gd2Fz
IG5lZWRlZCBpbiB0aGUgc2NlbmFyaW8gSSBkZXNjcmliZWQsIG5vdCB0aGF0IGl0Cj4+ID4+ID4g
c2hvdWxkIGJlIGEgcmVxdWlyZWQgcHJvcGVydHkgaW4gYSBiaW5kaW5nLgo+PiA+PiAKPj4gPj4g
WWVzIEkgbWlzdW5kZXJzdG9vZCB0aGUgdGVybSBpbmRlZWQuIEhvd2V2ZXIgSSBzdGlsbCBmYWls
IHRvIGNhdGNoIHdoYXQKPj4gPj4geW91IG1lYW50IGhlcmUsIEknbSBzb3JyeS4gV291bGQgeW91
IG1pbmQgcmVwaHJhc2luZz8KPj4gPgo+PiA+IEkgd2FzIHRhbGtpbmcgYWJvdXQgYSBzY2VuYXJp
byB3aGVyZSB5b3Ugd2FudCB0byB1c2UgdGhlIHR1bmVkIG1vZGUgdG8KPj4gPiBhY2hpZXZlIHRo
ZSBtYXhpbXVtIHJhdGUgYmVjYXVzZSBvZiB0aGUgZGV2aWNlIGFuZC9vciBib2FyZCBjb25maWd1
cmF0aW9uLAo+PiA+IGJ1dCB0aGUgcmF0ZSBpcyBiZWxvdyB0aGUgcG9pbnQgd2hlcmUgdGhlIGNv
bnRyb2xsZXIgd291bGQgbmVlZCB0dW5pbmcuCj4+ID4gU2F5IHRoZSBjb250cm9sbGVyIG5lZWRz
IHR1bmluZyBhYm92ZSA4IEh6IGJ1dCB0aGUgY29uZGl0aW9ucyByZXF1aXJlCj4+ID4gdHVuaW5n
IHRvIGFjaGlldmUgbW9yZSB0aGFuIDUgSHouIEluIHRoaXMgZXhhbXBsZSwgaWYgdGhlIGRldmlj
ZSBjYW4gZG8KPj4gPiA2IEh6LCBzcGktbWF4LWZyZXF1ZW5jeSAoaW4gdGhlIGN1cnJlbnQgZm9y
bSkgd291bGQgYmUgc2V0IHRvIDYgSHosIGFuZAo+PiA+IHRoZSBjb250cm9sbGVyIHdvdWxkIG5v
dCBlbmFibGUgdGhlIHR1bmVkIG1vZGUsIGxlYWRpbmcgdG8gcHJvYmxlbXMKPj4gPiBiZWNhdXNl
IHRoZSBpbmZsZWN0aW9uIHBvaW50IGRldGVybWluZWQgZnJvbSB0aGUgY29udHJvbGxlciBjb21w
YXRpYmxlCj4+ID4gb2YgOCBIeiB3b3VsZCBub3QgaGF2ZSBiZWVuIHJlYWNoZWQuCj4+IAo+PiBJ
IGRvbid0IHRoaW5rIHRoaXMgaXMgYSByZWFsIHNpdHVhdGlvbi4gSWYgdGhlICJjb25kaXRpb25z
IiwgYXMgeW91IHNheQo+PiAoaWUuIFBDQiByb3V0aW5nLCBtb3N0bHkpIHJlcXVpcmUgdHVuaW5n
IGFib3ZlIDUsIHRoZW4gc3BpLW1heC1mcmVxdWVuY3kKPj4gc2hvdWxkIGJlIDUuCj4KPiBUaGVu
IHR1bmluZyBtb2RlIHdvdWxkIG5ldmVyIGJlIHVzZWQuCgpXZWxsLCB0aGlzIGlzIGV4YWN0bHkg
d2hhdCB3ZSBwcm9wb3NlIGluIHRoaXMgc2VyaWVzLCBhIHdheSB0byBpbmRpY2F0ZQp0d28gbWF4
aW11bSBmcmVxdWVuY2llcywgb25lIHRoYXQganVzdCB3b3JrcyAobGlrZSBiZWZvcmUpIGFuZCBh
IGhpZ2hlcgpmcmVxdWVuY3kgdGhhdCBpcyBvbmx5IHJlYWNoYWJsZSBhZnRlciBhbiBleHRyYSB0
dW5pbmcgcHJvY2VkdXJlLgoKPiBSZW1lbWJlciwgdGhpcyBpcyBhIHRoZW9yZXRpY2FsIHdvcmxk
Cj4gd2hlcmUgc3BpLW1heC1mcmVxdWVuY3kgd291bGQgY29udGFpbiB0aGUgdHVuZWQgZnJlcXVl
bmN5IGFuZCB0aGUKPiBjb250cm9sbGVyIHdhcyB1c2luZyBjb21wYXRpYmxlLXNwZWNpZmljIHNw
ZWVkIHRocmVzaG9sZHMgdG8gZGV0ZXJtaW5lCj4gaWYgdHVuaW5nIHdhcyByZXF1aXJlZC4KClRo
YXQgaXMgbm90IHdoYXQgd2UgYXJlIHByb3Bvc2luZy4gSSBkb24ndCB0aGluayBpbmRpY2F0aW5n
IHRoZSAiYWZ0ZXIKdHVuaW5nIiBmcmVxdWVuY3kgaW4gYSBwcm9wZXJ0eSB0aGF0IGhhcyBsb25n
IGJlZW4gdXNlZCBmb3IgYW4gYWx3YXlzCnJlYWNoYWJsZSBmcmVxdWVuY3kgaXMgd2lzZS4gSGVu
Y2UgZWl0aGVyIHRoZSB1c2Ugb2YgYW4gYXJyYXkgKHRoZQpzZWNvbmQgZW50cnkgY291bGQgY29u
dGFpbiBhIGhpZ2hlciBmcmVxdWVuY3kpIG9yIGEgc2Vjb25kYXJ5CnNwaS1tYXgtZnJlcXVlbmN5
LXdoYXRldmVyIHByb3BlcnR5LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
