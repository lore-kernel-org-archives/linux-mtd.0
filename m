Return-Path: <SRS0=yo9c=MP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DCAC4320A
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 14:12:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254F160EB4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jul 2021 14:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 254F160EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cr+0gvJAFBKcljPkIi2XpfzRfeALl55x/mgsh6fuby0=; b=suX22tyi5tQPKh2/UJxrhjCz0c
	M9XzEA9y5Qg6iCNUuQxxyvjg3cPUfbMe0QEWYdky63l+AtJIkZWoJHktFRE6lK/8opZH5Rs+SITzs
	pAx38qWYFvaTQd+n6mtNy8XwGFtPg29FsYgFZtJK+oR2swXTlZsQEFm6YlkKwxGSznd8obANA60ts
	g2d+bHMHB65Eb6JfzlrTr+cDl/Hg9r3AkF2Z3FbLB35rcZWvuCn1g3xwEb0ETGnkKnpz1X4B5nRZv
	80GghvMMdX1bsDM5BX/pH99gSSSYN9hsrFKQk2SzmVgHdrjkCqohT2/mTd3flI4U+w+kaXhjswJD2
	7B4W5d8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6vtZ-004yNl-4a; Fri, 23 Jul 2021 14:11:21 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6vtV-004yMQ-Oi
 for linux-mtd@lists.infradead.org; Fri, 23 Jul 2021 14:11:19 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4GWWSw3q5MzQjpD;
 Fri, 23 Jul 2021 16:11:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1627049468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfwkbO0sCG7uFipRtw8GVMEHGEpnmOQNlVrTicEtUWw=;
 b=Fnd0mdcgpt9S7J6mwlSPUMjxJtoFsTzkk34CHhdzwOTKWKgYt8puQfkyyTGY4kP4p871EC
 0WpNvc51J8kc4AKXE4q8QDiM+UY37zBZjETZmh6ZuJYXO2CXjMmSPL7onPfKmcXk1ODMFa
 k6aty2m1j4uGErf/COran9SF+dSjTlCLBGZK/yvKts+efG09TaJPZ6BF06LVD3rvMT/4YL
 EnskdahUFf+TRgPsyhTBqplWtTmBxqXACeW7w9i5xdKbqEXVmAs7LOVVYLluL95m8LlN0K
 SLCUPj7xpbwdUzGRHX3jKlLZ35LvWMY6bxyOzORuFNhTs+xQ7cQmZqbUvM5cug==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id jNOAYMkZsqwc; Fri, 23 Jul 2021 16:11:03 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: esmt: Use correct name of f25l32qa
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20210620085639.143694-1-mans0n@gorani.run>
 <dad2160dba9070f1516519bdd00207ac@walle.cc>
 <e7fca59e-f7f5-f5f8-9e3b-001c5c938659@gorani.run>
 <f7eeb7645bc2632bb2cf1232d98d7fb4@walle.cc>
From: Sungbo Eo <mans0n@gorani.run>
Message-ID: <7a242258-4481-882a-0912-2ac03b72005a@gorani.run>
Date: Fri, 23 Jul 2021 23:10:55 +0900
MIME-Version: 1.0
In-Reply-To: <f7eeb7645bc2632bb2cf1232d98d7fb4@walle.cc>
Content-Language: en-US
X-Rspamd-Queue-Id: BB96B18B2
X-Rspamd-UID: 13f0fb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_071118_035761_502678FD 
X-CRM114-Status: GOOD (  18.76  )
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

T24gMjAyMS0wNy0yMSAxNjozMiwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPiBBbSAy
MDIxLTA3LTE5IDE3OjE5LCBzY2hyaWViIFN1bmdibyBFbzoKPj4gT24gMjAyMS0wNy0xNyAwMTox
MSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIwMjEtMDYtMjAgMTA6NTYsIHNjaHJpZWIg
U3VuZ2JvIEVvOgo+Pj4+IFRoZSBmbGFzaCBJRCBvZiBGMjVMMzJRQSBpcyAweDhjNDAxNiwgd2hl
cmVhcyB0aGF0IG9mIEYyNUwzMlFBKDJTKSBpcwo+Pj4+IDB4OGM0MTE2LiBGMjVMMzJRQSgyUykg
aXMgdGhlIG5ld2VyIHZlcnNpb24gb2YgRjI1TDMyUUEgYW5kIGl0cyBCUG4gCj4+Pj4gYml0cwo+
Pj4+IGFyZSBub24tdm9sYXRpbGUsIHVubGlrZSBpdHMgb2xkZXIgdmVyc2lvbi4KPj4+Pgo+Pj4+
IFJlZmVyZW5jZXM6IAo+Pj4+IGh0dHBzOi8vd3d3LmVzbXQuY29tLnR3L3VwbG9hZC9wZGYvRVNN
VC9kYXRhc2hlZXRzL0YyNUwzMlFBLnBkZgo+Pj4+IFJlZmVyZW5jZXM6Cj4+Pj4gaHR0cHM6Ly93
d3cuZXNtdC5jb20udHcvdXBsb2FkL3BkZi9FU01UL2RhdGFzaGVldHMvRjI1TDMyUUFfMSgyUyku
cGRmCj4+Pgo+Pj4gIkRhdGFzaGVldDoiIHBsZWFzZQo+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBT
dW5nYm8gRW8gPG1hbnMwbkBnb3JhbmkucnVuPgo+Pj4+IC0tLQo+Pj4+IEF0IGZpcnN0IEkgd2Fz
IGdvaW5nIHRvIHNlbmQgYSBuZXcgc3VwcG9ydCBwYXRjaCBvZiBGMjVMMTZQQSgyUyksCj4+Pj4g
YnV0IGJlZm9yZSB0aGF0LCBJIHdhbnRlZCB0byBtYWtlIHN1cmUgaWYgIigycykiIHN1ZmZpeCBp
cyBva2F5IG9yIAo+Pj4+IHVubmVjZXNzYXJ5Lgo+Pj4+IC0tLQo+Pj4+IMKgZHJpdmVycy9tdGQv
c3BpLW5vci9lc210LmMgfCA0ICsrLS0KPj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
c3BpLW5vci9lc210LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2VzbXQuYwo+Pj4+IGluZGV4IGNm
YzkyMThjMTA1My4uNTFiM2ZmNzY0ZWY2IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvZXNtdC5jCj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9lc210LmMKPj4+PiBA
QCAtMTIsOCArMTIsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gZXNtdF9wYXJ0
c1tdID0gewo+Pj4+IMKgwqDCoMKgIC8qIEVTTVQgKi8KPj4+PiDCoMKgwqDCoCB7ICJmMjVsMzJw
YSIsIElORk8oMHg4YzIwMTYsIDAsIDY0ICogMTAyNCwgNjQsCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNFQ1RfNEsgfCBTUElfTk9SX0hBU19MT0NLIHwgCj4+Pj4gU1BJX05P
Ul9TV1BfSVNfVk9MQVRJTEUpIH0sCj4+Pj4gLcKgwqDCoCB7ICJmMjVsMzJxYSIsIElORk8oMHg4
YzQxMTYsIDAsIDY0ICogMTAyNCwgNjQsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgU0VDVF80SyB8IFNQSV9OT1JfSEFTX0xPQ0spIH0sCj4+Pj4gK8KgwqDCoCB7ICJmMjVsMzJx
YSgycykiLCBJTkZPKDB4OGM0MTE2LCAwLCA2NCAqIDEwMjQsIDY0LAo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VDVF80SyB8IFNQSV9OT1JfSEFTX0xPQ0spIH0s
Cj4+Pj4gwqDCoMKgwqAgeyAiZjI1bDY0cWEiLCBJTkZPKDB4OGM0MTE3LCAwLCA2NCAqIDEwMjQs
IDEyOCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VDVF80SyB8IFNQSV9O
T1JfSEFTX0xPQ0spIH0sCj4+Pj4gwqB9Owo+Pj4KPj4+IFR1ZG9yIGhhcyBkZWNpZGUgb24gdGhh
dCBuYW1lIC0gb3IgdGhlIHVzZSBvZiBwYXJlbnRoZXNlcy4gSSBkb24ndCAKPj4+IGhhdmUgYQo+
Pj4gc3Ryb25nIG9waW5pb24gb24gaXQuCj4+Cj4+IEknbSBjb25jZXJuZWQgdGhhdCBhbnkgb3Ro
ZXIgZGV2aWNlcyBkbyBub3QgY29udGFpbiBwYXJlbnRoZXNlcyBpbgo+PiB0aGVpciBtb2RlbCBu
YW1lcy4uLiBJJ20gZmluZSB3aXRoICJmMjVsMzJxYS0ycyIgaWYgcHJlZmVycmVkLgo+IAo+IEhh
dmluZyBhbm90aGVyIGxvb2sgYXQgdGhlIGRhdGFzaGVldCB0aGVyZSBhcmUgZGlmZmVyZW50IHBy
b2R1Y3QKPiBJRHM6IEYyNUwzMlFBLTUwUEcyUywgRjI1TDMyUUEtODZQRzJTLCAuLiB3aGVyZSB5
b3UgY2FuIGFsc28gZmluZAo+IHRoZSAiLTJzIi4KPiAKPiBUaHVzIEknZCBhY3R1YWxseSBwcmVm
ZXIgImYyNWwzMnFhLTJzIi4KCk9oLCB5b3UncmUgcmlnaHQuIFNvIHRoZSAiMlMiIHN1ZmZpeCB3
YXMgYSBpbmRpY2F0b3IgZm9yIGEgY2xhc3Mgb2YgCmRldmljZXMsIG5vdCBmb3IgYSBzaW5nbGUg
ZGV2aWNlLi4uIEkgZGlkbid0IGV2ZW4gbm90aWNlIHRoZXJlIHdhcyBhIApwcm9kdWN0IElEIHRh
YmxlLiB4RAoKSSdsbCBmb2xsb3cgeW91ciBzdWdnZXN0aW9uLiBUaGFua3MhCgo+IAo+IC1taWNo
YWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
