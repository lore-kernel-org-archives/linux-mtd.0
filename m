Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B12C54EEB
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 22:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 590D62076F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 22:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GUcrXh28"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 590D62076F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0/bmZvGnX+3JdIhrB1hEP1JA2Lm6GND/v/T5TnfN/Yo=; b=GUcrXh28E/p6UUQnj2u3HLRsL
	44anRb2ptLIJyRP2fIu1tbPR/1vwxZjmqsv7aOLIXJyVTGUkVbXJHypGLPkO6A4tVDXUFhnuKIQyD
	K+LoSJCFzNoD+3rXDcD1KDqJm2n3qfK3MeAFNg9kXofMHDHQpUKIlpVs1A+woVqG6JGgoFEI60oaD
	ceRCL6pLfa3BFlXJgrCGEeAcDjG8X5tD7+hdcltfqzo9J2wHWkA65CDF8hK0po5IN9QxlFuNl/aKn
	aztt6qm2oyMedMGwLsSOZ4SW4hVk3FuMfKVrANGfSz8IG6kv9DySTq4N3wJFGklhVFSPNjtmUiVya
	qI4rOwjLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGrgn-0006id-9E; Tue, 24 Mar 2020 22:06:25 +0000
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGrgj-0006g4-4U
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 22:06:22 +0000
Received: from player168.ha.ovh.net (unknown [10.110.171.131])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 708EA1CDA1B
 for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2020 23:06:14 +0100 (CET)
Received: from RCM-web3.webmail.mail.ovh.net
 (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
 (Authenticated sender: rafal@milecki.pl)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id ABA4110BA1488;
 Tue, 24 Mar 2020 22:06:05 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 23:06:05 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: fix calculating partition end address
In-Reply-To: <20200324225859.56b2a301@xps13>
References: <20200309074445.23524-1-zajec5@gmail.com>
 <20200309150424.4b75af66@xps13>
 <6125d86fee0c83653cc281b3069e1587@milecki.pl>
 <20200324225859.56b2a301@xps13>
User-Agent: Roundcube Webmail/1.4.2
Message-ID: <9fe546f30130cf3569cd139d559d9c44@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 9534964837141483206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggtgfgfffhvffujghffgfkgihisehtkehjtddtreejnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudeikedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_150621_339155_B9768A9C 
X-CRM114-Status: GOOD (  19.12  )
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
Cc: Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGV5LAoKT24gMjAyMC0wMy0yNCAyMjo1OCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBSYWZhxYIg
TWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+IHdyb3RlIG9uIE1vbiwgMDkgTWFyIDIwMjAgMTU6
MTk6MTAKPiArMDEwMDoKPiAKPj4gT24gMjAyMC0wMy0wOSAxNTowNCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4gPiBSYWZhxYIgTWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlIG9uIE1v
biwgIDkgTWFyIDIwMjAgMDg6NDQ6NDUKPj4gPiArMDEwMDoKPj4gPgo+PiA+PiBGcm9tOiBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+ID4+ID4+IFRoaXMgZml4ZXMgY2hlY2sg
Zm9yIHBhcnRpdGlvbnMgdGhhdCBkb24ndCBzdGFydCBhdCBiZWdpbm5pbmcgb2YgdGhlaXIKPj4g
Pj4gcGFyZW50cy4gTWlzc2luZyBwYXJ0aXRpb24ncyBvZmZzZXQgaW4gZm9ybXVsYSBjb3VsZCBy
ZXN1bHQgaW4gZm9yY2luZwo+PiA+PiByZWFkLW9ubHkgaW5jb3JyZWN0bHkuCj4+ID4+ID4+IEZp
eGVzOiA2NzUwZjYxYTEzYTAgKCJtdGQ6IGltcHJvdmUgY2FsY3VsYXRpbmcgcGFydGl0aW9uIGJv
dW5kYXJpZXMgPj4gd2hlbiBjaGVja2luZyBmb3IgYWxpZ25tZW50IikKPj4gPj4gU2lnbmVkLW9m
Zi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+PiA+PiAtLS0KPj4gPj4g
IGRyaXZlcnMvbXRkL210ZHBhcnQuYyB8IDIgKy0KPj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiA+PiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbXRkcGFydC5jIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4+ID4+IGluZGV4IDczMjhjMDY2
YzViYS4uYzY4M2I0MzJjYzVlIDEwMDY0NAo+PiA+PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0
LmMKPj4gPj4gKysrIGIvZHJpdmVycy9tdGQvbXRkcGFydC5jCj4+ID4+IEBAIC01MjQsNyArNTI0
LDcgQEAgc3RhdGljIHN0cnVjdCBtdGRfcGFydCAqYWxsb2NhdGVfcGFydGl0aW9uKHN0cnVjdCA+
PiBtdGRfaW5mbyAqcGFyZW50LAo+PiA+PiAgCQkJcGFydC0+bmFtZSk7Cj4+ID4+ICAJfQo+PiA+
PiA+PiAtCXRtcCA9IHBhcnRfYWJzb2x1dGVfb2Zmc2V0KHBhcmVudCkgKyBzbGF2ZS0+bXRkLnNp
emU7Cj4+ID4+ICsJdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5v
ZmZzZXQgKyA+PiBzbGF2ZS0+bXRkLnNpemU7Cj4+ID4KPj4gPiBJIHRoaW5rIHlvdSBhcmUgZG9p
bmcgdGhlIGNoYW5nZSBhdCB0aGUgd3JvbmcgcGxhY2UsIGlmIHlvdSB3YW50IHRvCj4+ID4gY2hl
Y2sgd2hlcmUgdGhlIHBhcnRpdGlvbiAqc3RhcnRzKiB5b3Ugc2hvdWxkIGRvIGl0IGEgZmV3IGxp
bmVzIGFib3ZlLgo+PiA+IEJ1dCBJIHRoaW5rIHRoZSBjaGVjayBzaG91bGQgYmUgaGVyZSBhcyB3
ZWxsLCBwcm9iYWJseS4KPj4gCj4+IFRoZSBjaGVjayB3aGVyZSB0aGUgcGFydGl0aW9uICpzdGFy
dHMqIGlzIE9LIGFuZCBJIGRvbid0IG1lYW4gdG8gCj4+IGNoYW5nZQo+PiBpdC4gVGhlIGJ1ZyBp
cyBhYm91dCBjYWxjdWxhdGluZyBhYnNvbHV0ZSAqZW5kKiBhZGRyZXNzIG9mIHBhcnRpdGlvbi4K
Pj4gCj4+IAo+PiA+IEFueXdheSwgSSBqdXN0IGFwcGxpZWQgb24gbXkgbG9jYWwgdHJlZSBhIHBh
dGNoIHJld3JpdGluZyBhIGJpdCB0aGUKPj4gPiBwYXJ0aXRpb25pbmcgc2NoZW1lLCBjb3VsZCB5
b3UgcGxlYXNlIHJlYmFzZSBvbiB0b3Agb2YgdG9kYXkncwo+PiA+IG10ZC9uZXh0IGFuZCByZXNl
bmQgdGhpcyBwYXRjaCB1cGRhdGVkPwo+PiA+Cj4+ID4gSGVyZSBpcyB0aGUgY2hhbmdlIHRoYXQg
SSd2ZSBkb25lIGF0IHRoaXMgcGxhY2U6Cj4+ID4gCS0gICAgICAgdG1wID0gcGFydF9hYnNvbHV0
ZV9vZmZzZXQocGFyZW50KSArIHNsYXZlLT5tdGQuc2l6ZTsKPj4gPiAJKyAgICAgICB0bXAgPSBt
dGRfZ2V0X21hc3Rlcl9vZnMoY2hpbGQsIDApICsgY2hpbGQtPnNpemU7Cj4+IAo+PiBJJ2xsIGdp
dmUgaXQgYSB0cnkuCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHlvdXIgZml4IHRoaXMgd2Vl
aywgZG8geW91IHRoaW5rIHlvdSBjYW4gcmViYXNlCj4gYW5kIHJlc2VuZCBzb29uPwoKSXQncyBu
b3QgbmVlZGVkIGFueW1vcmUgYXMgeW91IGZpeGVkIHRoaXMgYnVnIGluIHlvdXIgY29tbWl0IHJl
d29ya2luZwpwYXJ0aXRpb25zLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
