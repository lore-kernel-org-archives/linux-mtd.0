Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BF7C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 19:40:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D070C60FE7
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 19:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D070C60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aNbYqsZyoW/WtwuG+S3kISJ8o6BZzFdUHqUzye0aumc=; b=jr+fwZpXU0fQIg0fc0oLaNjtZ
	9wBFU37rFxrgXs7pITETfWbC5Mot/cPzfVk99+jDhatRWdGV3KCJ5SvzEDbSArIxo+zphI6vNS/DH
	143PHYxnA9zOhFfz02LxEzyhM/eDqZ9fa/b1W+jXAWb1MQ7ibyyxbVilshWKlNna+v7qiJgpCbCOa
	sVixzfTEl4OpcV1lMR4C0GBqcsfRtPX9xUGIOvx/ATvw5UCMNDdh7Pdx6dlDp3wqpYEH8TJYXveuh
	bB30rAJOWtQ02QTBjOypKl8H0i7xc2rcNCqVCWQ1537vXZk3+vBX3/RNsrGuNx/6SGGgVAc69BuP3
	FciR4gOAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj5Zb-001koX-N6; Tue, 18 May 2021 19:40:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5Za-001ko9-08
 for linux-mtd@desiato.infradead.org; Tue, 18 May 2021 19:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1949R6RPybbycyWXO2h77GZUR5Nth/R/z4LsfKYIQrM=; b=3HgA8SZx6q6wWaMNX5JtJdB9iX
 XeqVI8MlEAS9cnK3eJXc+TOmGS3ML4CG28IKvJRWkQFh6gYorv+pB45ktBPLumIJnHHTa/AGqNBxa
 VLGoVE+Z0meB3epD5o70S1c86WopYGdPUlEq7C7nhqUQjZBPu5ppq1MAsGVJ0m4muKUPqg/xqefZz
 pl+njxeZhhdwQfpTxYVABL3JuapXRzw7WSsY0HxgT5sl8axI4wxSUft9Fe4b9V2k8NyeeFMTF27j4
 KqEPbXMgC+wR8ZOabvYhNQQJoaSa/FZvcS1GexQNTeDZ2FsYuW929H3KjeAGt9TmFYLjzgk3iJ+6A
 OzKd8osw==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj5ZW-00Ev3V-7F
 for linux-mtd@lists.infradead.org; Tue, 18 May 2021 19:40:08 +0000
Received: (qmail 10945 invoked from network); 18 May 2021 19:39:52 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 18 May 2021 19:39:52 -0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
 <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
 <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
 <f79a55f2-3f89-55a9-5cee-ae50d1fc0a47@david-bauer.net>
 <bccdfd0008c0f5482ae9f1b78dba3624@walle.cc>
From: David Bauer <mail@david-bauer.net>
Message-ID: <b650bf50-0a66-e772-5ebb-5336fa818e02@david-bauer.net>
Date: Tue, 18 May 2021 21:39:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <bccdfd0008c0f5482ae9f1b78dba3624@walle.cc>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_124006_599130_54E0524D 
X-CRM114-Status: GOOD (  34.64  )
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

SGkgTWljaGFlbCwKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwgd2FzIG5vdCBmZWVsaW5nIHdl
bGwgcGFzdCB3ZWVrLgoKT24gNS8xMC8yMSAxOjIyIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+
IEhpIERhdmlkLAo+IAo+IEFtIDIwMjEtMDUtMTAgMTM6MDQsIHNjaHJpZWIgRGF2aWQgQmF1ZXI6
Cj4+IE9uIDUvMTAvMjEgMTI6NTYgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiBBbSAyMDIx
LTA1LTEwIDEyOjI3LCBzY2hyaWViIERhdmlkIEJhdWVyOgo+Pj4+IE9uIDUvMTAvMjEgMTE6MzUg
QU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4+IEFtIDIwMjEtMDUtMTAgMTE6MjgsIHNjaHJp
ZWIgRGF2aWQgQmF1ZXI6Cj4+Pj4+PiBPbiA1LzEwLzIxIDEwOjAwIEFNLCBNaWNoYWVsIFdhbGxl
IHdyb3RlCj4+Pj4+Pgo+Pj4+Pj4gWy4uLl0KPj4+Pj4+Cj4+Pj4+Pj4+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGZsYXNoX2luZm8gYm9ob25nX3BhcnRzW10gPSB7Cj4+Pj4+Pj4+ICvCoMKgwqAgLyog
Qm9Ib25nIE1pY3JvZWxlY3Ryb25pY3MgKi8KPj4+Pj4+Pj4gK8KgwqDCoCB7ICJiaDI1cTEyOGFz
IiwgSU5GTygweDY4NDAxOCwgMCwgNjQgKiAxMDI0LCAyNTYsCj4+Pj4+Pj4KPj4+Pj4+PiBJIGNv
dWxkbid0IGZpbmQgIkJvSG9uZyIgaW4gSkVQMTA2QkMuIDB4NjggKHdpdGhvdXQgY29udGludWF0
aW9uIGNvZGVzKQo+Pj4+Pj4+IGlzICJDb252ZXggQ29tcHV0ZXIiLiBTbyB0aGlzIGlzIHdyb25n
LiBPVE9IIEknbSBub3Qgc3VyZSwgaG93IG1hbnkKPj4+Pj4+PiBTUEkgZmxhc2hlcyAiY29udmV4
IGNvbXB1dGVyIiBoYXZlLCBpZiBhbnkgOykgVGhpcyBjb21wYW55IHdhcyBicm91Z2h0Cj4+Pj4+
Pj4gYnkgSFAgaW4gdGhlIGVuZC4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIGFueSBjYXNlLCB0aGlzIHBh
dGNoIGRlcGVuZHMgb24gaG93IHdlIGhhbmRsZSBjb250aW51YXRpb24gY29kZXMgb3IKPj4+Pj4+
PiBpZiB3ZSBjYW4gaGFuZGxlIHRoZW0gYXQgYWxsLiBPciBpZiB0aGlzIGZsYXNoIGp1c3QgbGll
IGFib3V0IGl0cwo+Pj4+Pj4+IG1hbnVmYWN0dXJlciBpZCBhbmQgZG9uJ3QgYW5kIENDLgo+Pj4+
Pj4KPj4+Pj4+IEZpcnN0IG9mIGFsbCwgQm9Ib25nIGFuZCBCb3lhIG1pY3JvZWxlY3Ryb25pY3Mg
c2VlbXMgdG8gYmUgdGhlIHNhbWUKPj4+Pj4+IGNvbXBhbnksIGFzIHRoZWlyIGRhdGFzaGVldHMg
c2VlbSB0byBjb3B5IGVhY2ggb3RoZXIuIFRoZXJlJ3Mgbm90IG11Y2gKPj4+Pj4+IGluZm9ybWF0
aW9uIGFib3V0IGVpdGhlciBvZiBib3RoLCBzbyBJJ2Qgc2F5IHRoYXQncyBhIGZhaXIgYXNzdW1w
dGlvbi4KPj4+Pj4+Cj4+Pj4+PiBSZWdhcmRpbmcgdGhlIGNvbnRpbnVhdGlvbiBjb2RlcywgQm95
YSBpcyBsaXN0ZWQgaW4gYmFuayBuaW5lLCBob3dldmVyCj4+Pj4+PiBpbiB0aGlzIGNhc2UgSSBz
aG91bGQgY3VycmVudGx5IHJlYWQgYW4gYWxsIDB4N2YgSUQgc2hvdWxkbid0IEk/Cj4+Pj4+Cj4+
Pj4+IEknZCBndWVzcyBzbywgeWVzLgo+Pj4+Pgo+Pj4+Pj4gVGhlIGRhdGFzaGVldCBhbHNvIG9u
bHkgc3BlY2lmaWVzIDMgYnl0ZXMgYXMgYSByZXR1cm4gdmFsdWUgZm9yCj4+Pj4+PiByZWdpc3Rl
ciAweDlmaCA6KAo+Pj4+Pgo+Pj4+PiBZZWFoLiBTbywgdGhpcyBmbGFzaCBmYWxscyBpbnRvIHRo
ZSBzYW1lIGNhdGVnb3J5ICJzaW1wbHkgaGlqYWNrcwo+Pj4+PiBhIG1hbnVmIGlkIiBhcyBhbGwg
dGhlIG90aGVyIGZsYXNoZXMuCj4+Pj4KPj4+PiBGcm9tIGEgcXVpY2sgY2hlY2ssIHRoaXMgaXMg
YWxzbyBiZSB0aGUgY2FzZSBmb3IgR2lnYURldmljZXMgYW5kIFhNQy4KPj4+Pgo+Pj4+IE15IHNw
b250YW5lb3VzIGlkZWEgd291bGQgYmUgdG8gZXh0ZW5kIHN1cHBvcnQgZm9yIEpFREVDIElEcyB0
byByZWFkCj4+Pj4gdGhlIHVwIHRvIDkgYmFua3Mgb2YgdGhlIHZlbmRvciBJRCBhbmQgZml4IHVw
IHRoZSBleGlzdGluZyBvZmZlbmRlcnMuCj4+Pgo+Pj4geW91IG1lYW4gZ2lnYWRldmljZXMgYW5k
IHhtYz8gSSdkIHByZXN1bWUgdGhleSBhcmUgYWxzbyBsYWNraW5nIHRoZQo+Pj4gY29udGludWF0
aW9uIGJ5dGVzLgo+Pgo+PiBDb3JyZWN0LCBzYW1lIHN0b3J5IHdpdGggdGhlbS4KPj4KPj4+Cj4+
Pj4gVG8gbm90IGJyZWFrIGV4aXN0aW5nIGJvYXJkcywgd2UgY291bGQgZWl0aGVyIHNraXAgdGhl
IGNvbnRpbnVhdGlvbgo+Pj4+IGJ5dGVzIG9mIHRoZSBrZXJuZWwgSUQgZGVmaW5pdGlvbnMgZm9y
IGFsbCBmbGFzaCBjaGlwcyBvciBmbGFnIHRoZQo+Pj4+IGFscmVhZHkgZXhpc3Rpbmcgb25lcyBh
bmQgb25seSBwZXJmb3JtIHRoaXMgb24gc3VjaCBmbGFnZ2VkIGNoaXBzLgo+Pj4+Cj4+Pj4gUGVy
c29uYWxseSwgSSdkIHNheSB0aGF0IG9ubHkgcGVyZm9ybWluZyB0aGlzIG9uIGV4aXN0aW5nIGNo
aXBzIHdvdWxkCj4+Pj4gYmUgYmV0dGVyLCBhcyBuZXcgdmVuZG9ycyB3aXRoIHRoaXMgdmlvbGF0
aW9uIHNjaGVtZSBtaWdodCBwcm9iYWJseQo+Pj4+IGFwcGVhciBhbmQgY2F1c2UgY29uZmxpY3Rz
Lgo+Pj4+Cj4+Pj4gQXMgd2Ugc3RpbGwgbGFjayBhdXRvIGRldGVjdGlvbiBmb3IgbmV3IGNoaXBz
IHdpdGggdGhhdCwgY29uZmlndXJpbmcKPj4+PiB0aGUgZmxhc2ggY2hpcCB1c2VkIHdpdGggdGhl
IGNoaXAgbmFtZSB2aWEgRFQgd291bGQgYWxsb3cgdG8gc2V0IHRoZQo+Pj4+IGV4YWN0IGNoaXAg
dXNlZCBhbmQgYWxzbyB2YWxpZGF0ZSBpZiB0aGUgbWFudWZhY3R1cmVyIC8gcHJvZHVjdCBhZnRl
cgo+Pj4+IHRoZSBjb250aW51YXRpb24gYml0cyBtYXRjaGVzIHRoZSBvbmUgcmVhZCBmcm9tIHRo
ZSBjaGlwLgo+Pj4+Cj4+Pj4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+Pgo+Pj4gSWYgeW91J2QgYXNr
IG1lLCB1bmxlc3MgdGhlcmUgaXMgYSByZWFsIHdvcmxkIGNvbmZsaWN0LCBJJ2QganVzdCBnbwo+
Pj4gYWhlYWQgYW5kIGFkZCB0aGVtIGFzIGlzLiBJZiB0aGVyZSBpcyBhIGNvbmZsaWN0IHdlJ2Qg
bmVlZCB0byBmaW5kCj4+PiBhIHBlciBkZXZpY2UgcmVzb2x1dGlvbiBmb3IgaXQuCj4+Cj4+IE9r
YXksIEknbGwgcmVzZW5kIGEgdjIgd2l0aCB0aGUgcmVtb3ZlZCBjb3B5cmlnaHQgdGhlbi4KPiAK
PiBDb3VsZCB5b3UgYWxzbyBhcHBseSBteSBTRkRQIHBhdGNoIFsxXSBhbmQgc2VuZCB0aGUgZHVt
cCAoaWYgdGhlcmUKPiBpcyBhbnkpPyBVbmZvcnR1bmF0ZWx5LCBJIGNhbid0IHRoaW5rIG9mIGEg
Z29vZCB3YXkgdG8gZG8gdGhhdCBhbG9uZwo+IHdpdGggdGhlIHBhdGNoIGFuZCBpZiB0aGlzIGlu
IHNvbWUgd2F5IHJlZ2FyZGVkIGFzIGNvcHlyaWdodGVkIG1hdGVyaWFsLgo+IFNvIGZlZWwgZnJl
ZSB0byBzZW5kIGl0IHRvIG1lIHByaXZhdGVseS4gSSdtIHN0YXJ0aW5nIHRvIGJ1aWxkIGEKPiBk
YXRhYmFzZS4KCkJhZCBuZXdzLCBJJ20gbm90IGFibGUgdG8gZ2V0IGEgU0ZEUCB3aXRoIHlvdXIg
cGF0Y2hlcywgYXMgdGhlIFNGRFAgZXh0cmFjdGlvbgpmYWlscyBhdCB0aGUgdmVyc2lvbiBjaGVj
ay4KCklzIHRoZXJlIGFueXRoaW5nIGVsc2UgSSBjYW4gdHJ5PwoKQmVzdApEYXZpZAoKPiAKPj4+
IFRoZXJlIGlzIGFub3RoZXIgcHJvYmxlbTogc2hhcmVkIGRldmljZSBpZHMgcGVyIHZlbmRvci4g
U29tZSAobW9zdD8pCj4+PiBmbGFzaCB2ZW5kb3Igc2hhcmUgZGV2aWNlIGlkcyBvbiAic2ltaWxh
ciIgZmxhc2hlcywgd2hpY2ggd2Ugc3RpbGwKPj4+IG5lZWQgdGVsbCBhcGFydCBpbiB0aGUga2Vy
bmVsLiBTbyB0ZWNobmljYWxseSwgdGhpcyBpcyB0aGUgc2FtZSBwcm9ibGVtCj4+PiBhcyB3aXRo
IG5vbi1leGlzdGluZyBjb250aW51YXRpb24gYnl0ZXMuIFR3byBkaWZmZXJlbnQgZmxhc2hlcyBz
aGFyaW5nCj4+PiB0aGUgc2FtZSBpZC4gRm9yIG5vdywgd2UgbG9vayBmb3IgZGlmZmVyZW5jZXMg
aW4gdGhlIFNGRFAuCj4+Pgo+Pj4gUmlnaHQgbm93LCB0aGUgZmxhc2ggaXMgcHJvYmVkIGZpcnN0
IGJ5IGl0cyBpZCBhbmQgdGhlIHRoZSBTRkRQIGlzCj4+PiByZWFkIGFuZCBwYXJzZWQuIFRoZXJl
IGFyZSBpZGVhcyB0byBmaXJzdCByZWFkIHRoZSBTRkRQLiBIYXZpbmcgdGhpcwo+Pj4gbWlnaHQg
Y29tZSBpbiBoYW5keSBoZXJlLCB0b28uIEVnLiB3ZSBjb3VsZCBmaW5nZXJwcmludCB0aGUgZmxh
c2gKPj4+IGJ5IGl0cyBTRkRQLgo+Pgo+PiBJIHdhcyBhbHNvIHRoaW5raW5nIGFib3V0IHRoYXQg
YW5kIHdlJ3JlIGFsc28gYWxyZWFkeSBiaXR0ZW4gYnkgaWRlbnRpY2FsCj4+IEpFREVDIElEcyBm
b3IgZGlmZmVyZW50IG1vZGVscy4gSXQncyByZWFsbHkgYSBwaXR5IHRoYXQgdGhlcmUgaXMgbm8g
cmVhbAo+PiB1bmlxdWUgbW9kZWwgaWRlbnRpZmllciBmb3IgdXMgdG8gdXNlLCB3aGljaCBpcyBu
b3QgaGFja2VkIHRvIHN1cHBvcnQKPj4gbGVnYWN5IGltcGxlbWVudGF0aW9ucyBsaWtlIHdpdGgg
dGhpcyBjaGlwIDooCj4gCj4gVW5mb3J0dW5hdGVseSwgdGhleSBhcmVuJ3QgbGVnYWN5IGFuZCBu
ZXcgY2hpcHMgc3RpbGwgaGF2ZSB0aGlzCj4gYmVoYXZpb3IuLgo+IAo+IC1taWNoYWVsCj4gCj4g
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIxMDUwMzE1NTY1MS4zMDg4
OS0xLW1pY2hhZWxAd2FsbGUuY2MvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
