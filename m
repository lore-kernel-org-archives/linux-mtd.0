Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CABC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:50:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6215723340
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6215723340
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FHfhHSGCcMMGyifXCcKR18PH0MUssy850Vz6mBpObFc=; b=GCpuyppXI8gn9vPTUJyCGQdrZ
	KwtzA0wec5CTWIPec+QhSfBfG3IFnVzF8UJ7VManZp5J5kWDua6D8zLXfJLsRt8h5kf7+YgnVboR5
	qDbl84lUSeDQMLYGl2yP/ETWY0QokZjJYkKkZPuNB7ROKhGspWMs0xbteeQI/nFbJtpPaTqzmgI+e
	GvVapSppReChcOJCqjFr+m3k8bMEzLUsK9b3cgHU+qchTpSkg3ebU46C9O0aiED20M6dLYg+6VB3q
	MvTpgdIQU7k748ZBzOzMzP2urSvAYlFtA232bTFF5N9hNPDXtQnDw0wbBjhgffCm0qVu1qX8nIxWn
	Eeq69cIOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2FjZ-0001JK-JN; Wed, 20 Jan 2021 15:49:25 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2FjX-0001IY-73
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 15:49:24 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2A3D022727;
 Wed, 20 Jan 2021 16:49:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611157761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUzrNzLNRcIreZmsLWq69k96pnmltY8SD1QI1C8Xvtc=;
 b=L5pQvWqhEA+gLO4h7w/qbBgpTvDHeGlyG6fzjNFNthQiS4SuUVhd987+sn7ePNgqYGZM4y
 jI7Cco9UbSUoHU1Jg7ygI/FOs3VSTIpAj2WiVGZbAgerBBFYTFLcJnPU25j1m9UweQYQ5K
 Nchsvs9cGuSTWwUZJwoFXYl2wSaiclo=
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 16:49:21 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
In-Reply-To: <8a0e7885-4b9e-be62-eb46-1af74c65afa8@microchip.com>
References: <20210120131914.277363-1-tudor.ambarus@microchip.com>
 <20210120131914.277363-2-tudor.ambarus@microchip.com>
 <b3a61abec8927c7229c27415d2c769a8@walle.cc>
 <ad0cc416-73b7-f626-115f-d192fac17957@microchip.com>
 <447aca9c61a45b05f7869b9747e2c301@walle.cc>
 <8a0e7885-4b9e-be62-eb46-1af74c65afa8@microchip.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <e1e5f647fd9e91538fd730c626beff52@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_104923_374721_425DAF48 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kavyasree.Kotagiri@microchip.com,
 miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wMS0yMCAxNjozOSwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMS8yMC8yMSA1OjAyIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IAo+PiB0aGUgY29udGVudCBpcyBzYWZlCj4+IAo+PiBBbSAyMDIxLTAxLTIwIDE1OjUyLCBz
Y2hyaWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4+IE9uIDEvMjAvMjEgNDowNSBQ
TSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3Ivc3N0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NzdC5jCj4+Pj4+IGluZGV4IDAwZTQ4
ZGEwNzQ0YS4uZDZlMTM5NmFiYjk2IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL3NzdC5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMKPj4+Pj4gQEAg
LTgsNiArOCwzOSBAQAo+Pj4+PiAKPj4+Pj4gwqAjaW5jbHVkZSAiY29yZS5oIgo+Pj4+PiAKPj4+
Pj4gK3N0YXRpYyBpbnQgc3N0MjZ2Zl9sb2NrKHN0cnVjdCBzcGlfbm9yICpub3IsIGxvZmZfdCBv
ZnMsIHVpbnQ2NF90Cj4+Pj4+IGxlbikKPj4+Pj4gK3sKPj4+Pj4gK8KgwqDCoMKgIHJldHVybiAt
RU9QTk9UU1VQUDsKPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+PiArc3RhdGljIGludCBzc3QyNnZmX3Vu
bG9jayhzdHJ1Y3Qgc3BpX25vciAqbm9yLCBsb2ZmX3Qgb2ZzLCAKPj4+Pj4gdWludDY0X3QKPj4+
Pj4gbGVuKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgwqAgaWYgKG9mcyA9PSAwICYmIGxlbiA9PSBu
b3ItPnBhcmFtcy0+c2l6ZSkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
c3BpX25vcl9nbG9iYWxfYmxvY2tfdW5sb2NrKG5vcik7Cj4+Pj4gCj4+Pj4gCj4+Pj4gU29tZSBi
bG9ja3MgbWlnaHQgbm90IGJlIHVubG9ja2VkIGJlY2F1c2UgdGhleSBhcmUgcGVybWFuZW50bHkK
Pj4+PiBsb2NrZWQuIERvZXMgaXQgbWFrZSBzZW5zZSB0byByZWFkIEJQTlYgb2YgdGhlIGNvbnRy
b2wgcmVnaXN0ZXIKPj4+PiBhbmQgYWRkIGEgZGVidWcgbWVzc2FnZSBoZXJlPwo+Pj4gCj4+PiBJ
dCB3b3VsZCwgeWVzLiBJZiBhbnkgYmxvY2sgaXMgcGVybWFuZW50bHkgbG9ja2VkIGluIHRoZSB1
bmxvY2tfYWxsCj4+PiBjYXNlLAo+Pj4gSSdsbCBqdXN0IHByaW50IGEgZGJnIG1lc3NhZ2UgYW5k
IHJldHVybiAtRUlOVkFMLiBTb3VuZHMgZ29vZD8KPj4gCj4+IHNwaV9ub3Jfc3JfdW5sb2NrKCks
IGF0bWVsX2F0MjVmc191bmxvY2soKSBhbmQgCj4+IGF0bWVsX2dsb2JhbF91bnByb3RlY3QoKQo+
PiB3aWxsIHJldHVybiAtRUlPIGluIGNhc2UgdGhlIFNSIHdhc24ndCB3cml0YWJsZS4KPiAKPiBZ
b3UgbWVhbiBpbiB0aGUgc3BpX25vcl93cml0ZV9zcl9hbmRfY2hlY2soKSBjYWxscy4gLUVJTyBp
cyBmaW5lCj4gdGhlcmUgaWYgd2hhdCB3ZSB3cm90ZSBpcyBkaWZmZXJlbnQgdGhhbiB3aGF0IHdl
IHJlYWQgYmFjaywgaXQgd291bGQKPiBpbmRpY2F0ZSBhbiBJTyBlcnJvci4KPiAKPiBHQlVMSyBj
b21tYW5kIGNsZWFycyBhbGwgdGhlIHdyaXRlLXByb3RlY3Rpb24gYml0cyBpbiB0aGUgQmxvY2sK
PiBQcm90ZWN0aW9uIHJlZ2lzdGVyLCBleGNlcHQgZm9yIHRob3NlIGJpdHMgdGhhdCBoYXZlIGJl
ZW4gcGVybWFuZW50bHkKPiBsb2NrZWQgZG93bi4gU28gZXZlbiBpZiB3ZSBoYXZlIGZldyBibG9j
a3MgcGVybWFuZW50bHkgbG9ja2VkLCBpLmUuCj4gQ1IuQlBOViA9PSAxLCB0aGUgR0JVTEsgY2Fu
IGNsZWFyIHRoZSBwcm90ZWN0aW9uIGZvciB0aGUgcmVtYWluaW5nCj4gYmxvY2tzLiBTbyBub3Qg
cmVhbGx5IGFuIElPIGVycm9yLCBidXQgcmF0aGVyIGFuIC1FSU5WQUwsIGJlY2F1c2UKPiB0aGUg
dXNlciBhc2tzIHRvIHVubG9jayBtb3JlIHRoYW4gd2UgY2FuLgoKRG9lc24ndCBFSU5WQUwgaW5k
aWNhdGUgd3JvbmcgcGFyYW1ldGVycywgYnV0IGRvZXMgbm90aGluZz8gSW4gdGhpcwpjYXNlLCB1
bmxvY2sgd291bGQgYmUgcGFydGlhbGx5IHN1Y2Nlc3NmdWwuCgpJbiBhbnkgY2FzZSwgbXkgcG9p
bnQgd2FzIHRoYXQgZGVwZW5kaW5nIG9uIHRoZSB1bmRlcmx5aW5nIGxvY2tpbmcKb3BzLCBlaXRo
ZXIgLUVJTyBvciAtRUlOVkFMIGlzIHJldHVybmVkIGlmIHNwaV9ub3JfdW5sb2NrKCkgZmFpbHMK
Zm9yIHRoZSBzYW1lIHJlYXNvbiwgdGhhdCBpcyB1bmxvY2soKSB3YXNuJ3QgcG9zc2libGUgYmVj
YXVzZSBvZgpzb21lIHNvcnQgb2YgaGFyZHdhcmUgd3JpdGUgcHJvdGVjdGlvbi4gQW5kIElNSE8g
aXQgc2hvdWxkIHJldHVybgp0aGUgc2FtZSBlcnJubyAod2hhdGV2ZXIgdGhlIGNvcnJlY3QgZXJy
bm8gaXMgaW4gdGhpcyBjYXNlKS4KCi1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
