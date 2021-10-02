Return-Path: <SRS0=Xs+q=OW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F227BC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Oct 2021 12:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96A861AEF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Oct 2021 12:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A96A861AEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2F6JMhsQxoA2miVxPhyhVzYXgTs+CXFZDzrsmzCWZIs=; b=0PPdtBwVSU6NzPGH+6vuBG74LU
	FrCIynaZqfj2A7sbykA16NzX4GLd+AMCJF78os1bgWbNFWHZjX0zk7U0LuAeL83+0AMLnlMjJejlw
	HgNBaLNMPXQVpZ0Girwm874yec143rUfpAoLdhn/KqmJpKRx34rz39HHjaOPSsHgHcKGWq9fHQ8hN
	LW/qWFlHgwRkv+O8WBN1H1pZzb3UieWI2v9wNwfZ5j7WjJ0DrSodoiMhhdYnc2ptB39iI543J9QMY
	chgvNzRHEDqTDYBZsmzS4OefWb1+STQSUWAV2XXUNw32dbpvE4i99/f8GQ1F9AdPaPLza6aw5GuNh
	7eKYfckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWebQ-002Cnh-A4; Sat, 02 Oct 2021 12:58:56 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWebB-002ClN-JD; Sat, 02 Oct 2021 12:58:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 55C9222247;
 Sat,  2 Oct 2021 14:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1633179512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnXed4lE4vxp2UnSSsJqfEOiThkrgGMihutI3WHW24I=;
 b=Z43hD3DU24v+2u+ozUm1G3l7gcT++LZMhfNjxo++DC3fhzT7jB1xhNJ3/3hi8bN4Kc7rfK
 3uqtL84twZSChgJDDB5VrLlAPIP9hpgxMTVN5FIiOHvc9d6oUzG/7YsPBIPyOEhPD6vOh7
 GayEWClvp6b5wxyKE0T6L5chIeyFbvc=
MIME-Version: 1.0
Date: Sat, 02 Oct 2021 14:58:26 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, macromorgan@hotmail.com, vigneshr@ti.com,
 jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 09/35] mtd: spi-nor: atmel: Use flash late_init() for
 locking
In-Reply-To: <88abe817-9d2f-35f6-746c-1640b166aab8@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-10-tudor.ambarus@microchip.com>
 <20210816190629.3kg4cbf5d7h7gyk5@ti.com>
 <a9d41aa96a8749b599d4479f18479c5d@walle.cc>
 <88abe817-9d2f-35f6-746c-1640b166aab8@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0fdfe86c904a064ab61cde6eb177555a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_055841_967794_0F04D842 
X-CRM114-Status: GOOD (  25.65  )
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

QW0gMjAyMS0xMC0wMSAxMzo0MCwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gOS8xMC8yMSAxMjo0NCBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyAKPj4gdGhlIGNvbnRlbnQgaXMgc2FmZQo+PiAKPj4gQW0gMjAyMS0wOC0xNiAyMTowNiwg
c2NocmllYiBQcmF0eXVzaCBZYWRhdjoKPj4+IE9uIDI3LzA3LzIxIDA3OjUxQU0sIFR1ZG9yIEFt
YmFydXMgd3JvdGU6Cj4+Pj4gTG9ja2luZyBpcyBub3QgZGVzY3JpYmVkIGluIEpFU0QyMTYgU0ZE
UCBzdGFuZGFyZCwgcGxhY2UgdGhlIGxvY2tpbmcKPj4+PiBpbml0IGluIGxhdGVfaW5pdCgpLgo+
PiAKPj4gQnR3LCB3ZSBzaG91bGQgZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHRoZSBibG9jayBwcm90
ZWN0aW9uCj4+IGJpdHMgYW5kIGluZGl2aWR1YWwgYmxvY2sgbG9ja2luZy4gQXQgbGVhc3QgdGhl
IGxhdHRlciBpcyBkZXNjcmliZWQKPj4gaW4gdGhlIFNGRFAgKEkndmUgc2VlbiBpdCBpbiB0aGUg
WFRYIFNGRFAsIGhhdmVuJ3QgY2hlY2tlZCB0aGUKPj4gc3RhbmRhcmQgeWV0KS4KPiAKPiB0aGF0
J3MgcHJvYmFibHkgYSB2ZW5kb3Igc3BlY2lmaWMgdGFibGUsIG5vdCBzb21ldGhpbmcgc3RhbmRh
cmRpemVkIGJ5IAo+IFNGRFAuCgpjb3JyZWN0LgoKPj4+IFlvdSBhcmUgY2hhbmluZyB0aGUgb3Jk
ZXIgb2Ygc2V0dGluZyB0aGUgbG9ja2luZyBvcHMgaGVyZS4gRWFybGllciwKPj4+IHRoZXkKPj4+
IHdlcmUgc2V0IGJlZm9yZSB3ZSBwYXJzZWQgU0ZEUC4gTm93IHRoZXkgYXJlIHNldCBhZnRlciB3
ZSBwYXJzZSBTRkRQLgo+Pj4gVGhvdWdoIEkgZG9uJ3Qgc2VlIGl0IG1ha2luZyBtdWNoIG9mIGEg
ZGlmZmVyZW5jZS4KPiAKPiBSaWdodCwgYXMgdGhlIGxvY2tpbmcgaXMgbm90IGNvdmVyZWQgYnkg
U0ZEUCwgd2Ugc2hvdWxkIHBsYWNlIGl0IGFmdGVyCj4gcGFyc2luZyBTRkRQLgo+IAo+Pj4gCj4+
Pj4gCj4+Pj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNy
b2NoaXAuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9hdG1lbC5jIHwg
MzAgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4+Pj4gCj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYyAKPj4+PiBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
YXRtZWwuYwo+Pj4+IGluZGV4IDFmZWE1Y2FiNDkyYy4uYjkzN2VmNzM0ZTU1IDEwMDY0NAo+Pj4+
IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvYXRtZWwuYwo+Pj4+IEBAIC00OCwxNSArNDgsMTEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzcGlfbm9yX2xvY2tpbmdfb3BzCj4+Pj4gYXRtZWxfYXQyNWZzX2xvY2tpbmdfb3BzID0g
ewo+Pj4+IMKgwqDCoMKgIC5pc19sb2NrZWQgPSBhdG1lbF9hdDI1ZnNfaXNfbG9ja2VkLAo+Pj4+
IMKgfTsKPj4+PiAKPj4+PiAtc3RhdGljIHZvaWQgYXRtZWxfYXQyNWZzX2RlZmF1bHRfaW5pdChz
dHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4+ICtzdGF0aWMgdm9pZCBhdG1lbF9hdDI1ZnNfbGF0ZV9p
bml0KHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4gwqB7Cj4+Pj4gwqDCoMKgwqAgbm9yLT5wYXJh
bXMtPmxvY2tpbmdfb3BzID0gJmF0bWVsX2F0MjVmc19sb2NraW5nX29wczsKPj4+PiDCoH0KPj4+
PiAKPj4+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBhdG1lbF9hdDI1ZnNf
Zml4dXBzID0gewo+Pj4+IC3CoMKgwqAgLmRlZmF1bHRfaW5pdCA9IGF0bWVsX2F0MjVmc19kZWZh
dWx0X2luaXQsCj4+Pj4gLX07Cj4+Pj4gLQo+Pj4+IMKgLyoqCj4+Pj4gwqAgKiBhdG1lbF9zZXRf
Z2xvYmFsX3Byb3RlY3Rpb24gLSBEbyBhIEdsb2JhbCBQcm90ZWN0IG9yIFVucHJvdGVjdAo+Pj4+
IGNvbW1hbmQKPj4+PiDCoCAqIEBub3I6wqDCoMKgIHBvaW50ZXIgdG8gJ3N0cnVjdCBzcGlfbm9y
Jwo+Pj4+IEBAIC0xNDYsMzQgKzE0MiwzMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3Jf
bG9ja2luZ19vcHMKPj4+PiBhdG1lbF9nbG9iYWxfcHJvdGVjdGlvbl9vcHMgPSB7Cj4+Pj4gwqDC
oMKgwqAgLmlzX2xvY2tlZCA9IGF0bWVsX2lzX2dsb2JhbF9wcm90ZWN0ZWQsCj4+Pj4gwqB9Owo+
Pj4+IAo+Pj4+IC1zdGF0aWMgdm9pZCBhdG1lbF9nbG9iYWxfcHJvdGVjdGlvbl9kZWZhdWx0X2lu
aXQoc3RydWN0IHNwaV9ub3IgCj4+Pj4gKm5vcikKPj4+PiArc3RhdGljIHZvaWQgYXRtZWxfZ2xv
YmFsX3Byb3RlY3Rpb25fbGF0ZV9pbml0KHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4gwqB7Cj4+
Pj4gwqDCoMKgwqAgbm9yLT5wYXJhbXMtPmxvY2tpbmdfb3BzID0gJmF0bWVsX2dsb2JhbF9wcm90
ZWN0aW9uX29wczsKPj4+PiDCoH0KPj4+PiAKPj4+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlf
bm9yX2ZpeHVwcyBhdG1lbF9nbG9iYWxfcHJvdGVjdGlvbl9maXh1cHMgPSAKPj4+PiB7Cj4+Pj4g
LcKgwqDCoCAuZGVmYXVsdF9pbml0ID0gYXRtZWxfZ2xvYmFsX3Byb3RlY3Rpb25fZGVmYXVsdF9p
bml0LAo+Pj4+IC19Owo+Pj4+IC0KPj4+PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5m
byBhdG1lbF9wYXJ0c1tdID0gewo+Pj4+IMKgwqDCoMKgIC8qIEF0bWVsIC0tIHNvbWUgYXJlIChj
b25mdXNpbmdseSkgbWFya2V0ZWQgYXMgIkRhdGFGbGFzaCIgKi8KPj4+PiDCoMKgwqDCoCB7ICJh
dDI1ZnMwMTAiLMKgIElORk8oMHgxZjY2MDEsIDAsIDMyICogMTAyNCzCoMKgIDQsIFNFQ1RfNEsg
fAo+Pj4+IFNQSV9OT1JfSEFTX0xPQ0spCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZp
eHVwcyA9ICZhdG1lbF9hdDI1ZnNfZml4dXBzIH0sCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmxhdGVfaW5pdCA9IGF0bWVsX2F0MjVmc19sYXRlX2luaXQgfSwKPj4+PiDCoMKgwqDCoCB7
ICJhdDI1ZnMwNDAiLMKgIElORk8oMHgxZjY2MDQsIDAsIDY0ICogMTAyNCzCoMKgIDgsIFNFQ1Rf
NEsgfAo+Pj4+IFNQSV9OT1JfSEFTX0xPQ0spCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmZpeHVwcyA9ICZhdG1lbF9hdDI1ZnNfZml4dXBzIH0sCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLmxhdGVfaW5pdCA9IGF0bWVsX2F0MjVmc19sYXRlX2luaXQgfSwKPj4+PiAKPj4+PiDC
oMKgwqDCoCB7ICJhdDI1ZGYwNDFhIiwgSU5GTygweDFmNDQwMSwgMCwgNjQgKiAxMDI0LMKgwqAg
OCwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBTRUNUXzRLIHwgU1BJX05PUl9IQVNfTE9DSyB8IAo+Pj4+IFNQSV9OT1JfU1dQX0lTX1ZPTEFU
SUxFKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZml4dXBz
ID0gJmF0bWVsX2dsb2JhbF9wcm90ZWN0aW9uX2ZpeHVwcyB9LAo+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5sYXRlX2luaXQgPSBhdG1lbF9nbG9iYWxfcHJvdGVjdGlvbl9sYXRlX2luaXQg
fSwKPj4+IAo+Pj4gV29uJ3QgeW91IGJlIGJldHRlciBvZmYgc2V0dGluZyB0aGlzIGluIHRoZSBt
YW51ZmFjdHVyZXIgbGF0ZV9pbml0KCk/Cj4+PiBJdAo+Pj4gc2VlbXMgY29tbW9uIGZvciBtb3N0
IGF0bWVsIGZsYXNoZXMuCj4+PiAKPj4+IE9mIGNvdXJzZSwgdGhpcyB3b3VsZCBjYXVzZSBhIHBy
b2JsZW0gZm9yIGF0bWVsIGZsYXNoZXMgdGhhdCBkb24ndCAKPj4+IGhhdmUKPj4+IHRoaXMgYXQg
YWxsLCBzaW5jZSB3ZSB3b3VsZCBzZXQgbG9ja2luZyBmb3IgdGhvc2UgYXMgd2VsbC4gQnV0IEkg
Cj4+PiB0aGluawo+Pj4gd2UgY2FuIGF2b2lkIHRoYXQgYnkgY2hlY2tpbmcgZm9yIFNOT1JfRl9I
QVNfTE9DSyBpbgo+Pj4gc3BpX25vcl9yZWdpc3Rlcl9sb2NraW5nX29wcygpLgo+PiAKPj4gKzEK
Pj4gCj4gCj4gd2UgYWxzbyBoYXZlIHRoZSBhdG1lbF9hdDI1ZnNfbGF0ZV9pbml0KCkgbWV0aG9k
LiBzZXR0aW5nIGl0IHBlcgo+IG1hbnVmYWN0dXJlciB3aWxsIHJlc3VsdAo+IGluIHNldHRpbmcg
dGhlIG1hbnVmYWN0dXJlciBsb2NraW5nIG9wcyBmb3IgYXQyNWZzIGFzIHdlbGwsIHdoaWNoIHdp
bGwKPiBiZSBvdmVyd3JpdHRlbiBieSB0aGUKPiBhdDI1ZnMgbG9ja2luZyBvcHMuIEZvciB0aG9z
ZSB0aGF0IGRvbid0IHN1cHBvcnQgbG9ja2luZyBhdCBhbGwsIHdlCj4gc2hvdWxkIGNsZWFyIHRo
ZSBsb2NraW5nCj4gb3BzIGFzIHlvdSBzYWlkLiBUaGlzIHdpbGwgbWFrZSB0aGUgY29kZSBhIGxp
dHRsZSBkaWZmaWN1bHQgdG8gZm9sbG93Cj4gYW5kIHdlIHJldHVybiBhIGJpdAo+IHRvIHNwYWdo
ZXR0aS4gZGVmaW5pbmcgbGF0ZV9pbml0KCkgdGFrZXMgb25seSBhIGxpbmUgYW55d2F5LiBJIHdv
dWxkCj4ga2VlcCB0aGUgY29kZSBhcyBpdCBpcwo+IGlmIHlvdSBkb24ndCBtaW5kLiBXZSBjYW4g
YXNrIG91cnNlbHZlcyBhYm91dCBzY2FsYWJpbGl0eSB3aGVuIHdlIGhhdmUKPiBsb3RzIG9mIGVu
dHJpZXMsCj4gd2UgY2FuIHJlZXZhbHVhdGUgdGhpcyBpbiB0aGUgZnV0dXJlLiBUZWxsIG1lIGlm
IHlvdSBoYXZlIHN0cm9uZwo+IG9waW5pb25zIG9uIHRoaXMuCgpXaGF0IGFib3V0IHRoZSBmb2xs
b3dpbmc6CgppbnQgYXRtZWxfbGF0ZV9pbml0KHN0cnVjdCBzcGlfbm9yICpub3IpCnsKICAgICBp
ZiAobm9yLT5pbmZvLT5mbGFncyAmIFNQSV9OT1JfSEFTX0xPQ0spCiAgICAgICAgIG5vci0+cGFy
YW1zLT5sb2NraW5nX29wcyA9ICZhdG1lbF9nbG9iYWxfcHJvdGVjdGlvbl9vcHM7Cn0KCk9mIGNv
dXJzZSBpdCBkZXBlbmRzIG9uIHdldGhlciB3ZSBleHBlY3QgdGhlc2Ugb3BzIHRvIGJlIHRoZSBv
bmVzCnVzZWQgZm9yIG1vc3QgYXRtZWwgZmxhc2hlcy4KClRoZSBhdDI1ZnMgd291bGQgdGhlbiBv
dmVyd3JpdGUgdGhlIG9wcyBpbiB0aGVpciAubGF0ZV9pbml0LgoKSW4gYW55IGNhc2UsIEkgZG9u
J3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGVpdGhlciB3YXkuCgotbWljaGFlbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
