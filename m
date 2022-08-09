Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE1C19F2D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4siCpG6s84fgjPbQyc8sLcQB7Wgf6rRAoamKHO5tz/I=; b=Fh749KZiRjbPrF
	J+RIlhuZM29MEy5PerLa+46E42ZZxU4TiuZnuNYoU7aA0Vl5xvpntbOWclw3eY/GS5u7foDB7t9df
	lS5C8mnF2YTLwheL1k7mi+mAbcxcOKLqvzULUNEFNfqYELH/SbixQ7NVjL/yU6b8P5CCeSBwVXij+
	0vEQ/vaPyYBMYv3T0/RNAPwFYHV6MuoPhZdgRA3gkIJluRY5R1HSuiGCZWfi0srpkCE9LBuNmvzSj
	10EpTzaVpDw4/fJ01HeXB9toOitSm6bwWDrsTTn9o4JD4JqKDPPRmDNLf40NFxoTJmw5no1HmMSf6
	mY58/w+xfH30GQrueDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLLSv-0031fy-64; Tue, 09 Aug 2022 09:23:57 +0000
Received: from vps.slashdirt.org ([144.91.108.218])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLLSs-0031cj-3S
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 09:23:56 +0000
Received: from smtpclient.apple (tardis.herebedragons.eu [171.22.3.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vps.slashdirt.org (Postfix) with ESMTPSA id 1495C60137;
	Tue,  9 Aug 2022 11:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 vps.slashdirt.org 1495C60137
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=slashdirt.org; s=mail;
	t=1660037023; bh=nQtdOVPgwj8xGJbsqkfgJbadtN+0e2RfaVBT/8PaB5I=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=IFfahgZgq0+RIw9//PO4Dr50zUPVtvCwrkog7xwyS9RVXDIBL/kuAvAgfOND1hS6d
	 DfPKAmMKCbHcCCzc1CfIhJFUE1r90zOeTW91CApV+0tZBfIR2GAXiv1jPiYtZQ9Ni1
	 0SNlSs6X2/PfBBxi1g+AbbqMZ6TCnhJMg+SaDEdw=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3 0/3] mtd: write support for minor-aligned partitions
From: =?utf-8?Q?Thibaut_VAR=C3=88NE?= <hacks+kernel@slashdirt.org>
In-Reply-To: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
Date: Tue, 9 Aug 2022 11:23:38 +0200
Cc: John Thomson <git@johnthomson.fastmail.com.au>
Message-Id: <E33639E3-F4DA-4344-964C-60D88443FD24@slashdirt.org>
References: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
To: linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com,
 richard@nod.at,
 vigneshr@ti.com,
 tudor.ambarus@microchip.com,
 p.yadav@ti.com,
 michael@walle.cc
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_022354_648158_C408527F 
X-CRM114-Status: GOOD (  19.08  )
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

SGksCgpTaW5jZSB0aGVyZSB3ZXJlIG5vIG9iamVjdGlvbnMgaW4gdGhlIHBhc3Qgd2VlaywgY291
bGQgeW91IHBsZWFzZSBjb25zaWRlciBtZXJnaW5nIHRoaXMgcGF0Y2ggc2VyaWVzPwoKVGhhbmtz
LApUaGliYXV0Cgo+IExlIDI5IGp1aWwuIDIwMjIgw6AgMTE6MTYsIFRoaWJhdXQgVkFSw4hORSA8
aGFja3Mra2VybmVsQHNsYXNoZGlydC5vcmc+IGEgw6ljcml0IDoKPiAKPiBUaGlzIHBhdGNoIHNl
cmllcyBlbmFibGUgd3JpdGUgc3VwcG9ydCBmb3IgbWlub3ItYWxpZ25lZCBtdGQgcGFydGl0aW9u
cwo+IG9uIGRldmljZXMgdGhhdCBzdXBwb3J0IG11bHRpcGxlIGVyYXNlc2l6ZXMuCj4gCj4gT24g
c3VwcG9ydGluZyBoYXJkd2FyZSwgdGhleSBlbmFibGUgUlcgb3BlcmF0aW9ucyBvbiBtdGQgcGFy
dGl0aW9ucyB0aGF0Cj4gYnJlYWsgIm1ham9yIiAobGFyZ2VzdCkgZXJhc2VzaXplIGJvdW5kYXJ5
IChlLmcuIHRvbyBzbWFsbCBvciBub3QKPiBjb3JyZWN0bHkgYWxpZ25lZCkgd2l0aG91dCBzYWNy
aWZpY2luZyBwZXJmb3JtYW5jZSAoaS5lLiBmb3JjaW5nCj4gZXZlcnl0aGluZyB0byB1c2UgNEsg
c2VjdG9ycykuIEZpbmFsbHksIHRoZXkgYWRkcmVzcyBhbiBoaXN0b3JpY2FsIEZJWE1FCj4gaW4g
bXRkcGFydC5jLgo+IAo+IFRoZSBmb2xsb3dpbmcgcGVyZm9ybWFuY2UgbnVtYmVycyB3ZXJlIG1l
YXN1cmVkIHdpdGggdjUuMTAga2VybmVsIG9uIE9wZW5XcnQ6Cj4gKENPTkZJR19NVERfU1BJX05P
Ul9VU0VfVkFSSUFCTEVfRVJBU0U9eSBmb3JjZXMgdGhlIHVzZSBvZiB0aGUgbmV3IGNvZGUgcGF0
aCkKPiAKPiBPcGVuV3J0IDUuMTAgcmFtaXBzIE1UNzYyMSB3MjVxMTI4anYgMHhmYzAwMDAgZmly
bXdhcmUgcGFydGl0aW9uIGxlbmd0aAo+IHRpbWUgbXRkIGVyYXNlIGZpcm13YXJlCj4gCj4gV2l0
aG91dCB0aGlzIHBhdGNoOgo+IE1URF9TUElfTk9SX1VTRV80S19TRUNUT1JTPW4JfHkKPiByZWFs
ICAgIDBtIDUwLjg2cwkJfDJtIDExLjY2cwo+IHVzZXIgICAgMG0gMC4wMHMJCXwwbSAwLjAwcwo+
IHN5cyAgICAgMG0gNTAuODBzCQl8MW0gNTYuMjBzCj4gY2FuIHdyaXRlIG1pbm9yLWFsaWduZWQg
cGFydHM/IE58WQo+IAo+IFdpdGggdGhpcyBwYXRjaDoKPiBNVERfU1BJX05PUl9VU0VfVkFSSUFC
TEVfRVJBU0U9bnx5CQl8NEtfU0VDVE9SUz15Cj4gcmVhbCAgICAwbSA1MS42OHMJCXwwbSA1MC44
NXMJfDJtIDEyLjg5cwo+IHVzZXIgICAgMG0gMC4wMHMJCXwwbSAwLjAwcwl8MG0gMC4wMXMKPiBz
eXMgICAgIDBtIDQ2Ljk0cwkJfDBtIDUwLjM4cwl8Mm0gMTIuNDZzCj4gY2FuIHdyaXRlIG1pbm9y
LWFsaWduZWQgcGFydHM/IE58WQkJfFkKPiAKPiAKPiBOQjogVGhpcyBwYXRjaHNldCB3YXMgcHJl
dmlvdXNseSBzdWJtaXR0ZWQgYXMgYSBtb25vbGl0aGljIHBhdGNoIChSRkNbMF0sCj4gdjFbMV0p
LiBXaGlsZSBub3Qgc3VibWl0dGVkIHVwc3RyZWFtIHYyIHdhcyBob3dldmVyIHJldmlld2VkLCB0
ZXN0ZWQgYW5kCj4gYWNjZXB0ZWQgaW4gT3BlbldydCwgYW5kIGJhY2twb3J0ZWQgaW50byB0aGUg
dXBjb21pbmcgMjIuMDMgc3RhYmxlIGJyYW5jaDoKPiBodHRwczovL2dpdGh1Yi5jb20vb3Blbndy
dC9vcGVud3J0L3B1bGwvMzI3MQo+IAo+IFswXSAyMDIxMDEwNDEyMjg1My4xODQyOC0xLWdpdEBq
b2hudGhvbXNvbi5mYXN0bWFpbC5jb20uYXUKPiBbMV0gMjAyMTA2MDgwNDA3MTkuMTQ0MzEtMS1n
aXRAam9obnRob21zb24uZmFzdG1haWwuY29tLmF1Cj4gCj4gQ2hhbmdlcyB2MiAtPiB2MzoKPiAg
LSBTcGxpdCBwYXRjaCBpbnRvIGluY3JlbWVudGFsLCBmdW5jdGlvbmFsbHktc2VwYXJhdGUgY2hh
bmdlcy4KPiAgLSBBZGp1c3RlZCBlcmFzZXNpemVfbWlub3IgYXNzaWdubWVudCBjaGVjayBpbiBz
cGktbm9yL2NvcmUuYwo+ICAtIEFkZHJlc3NlZCBjaGVja3BhdGNoIHdhcm5pbmcgb24gInByaW50
ayhLRVJOX1dBUk5JTkcuLi4iCj4gIC0gRG9jdW1lbnRlZCBuZXcgc3lzZnMgYXR0cmlidXRlCj4g
Cj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAgLSBBZGRlZCBtdGRjb3JlIHN5c2ZzIGF0dHJpYnV0ZSBm
b3IgZXJhc2VzaXplX21pbm9yCj4gIC0gUmVtb3ZlZCBmaW5kaW5nIG1pbm9yIGVyYXNlc2l6ZSBm
b3IgdmFyaWFibGUgZXJhc2UgcmVnaW9ucyBkZXZpY2UsCj4gICAgKHVudGVzdGVkIGFuZCBubyBy
ZXNwb25zZSB0byBSRkMpLgo+ICAtIE1vdmVkIElGX0VOQUJMRUQoKSB0byBndWFyZCBzZXR0aW5n
IGVyYXNlc2l6ZV9taW5vciBpbiBzcGktbm9yL2NvcmUuYwo+ICAtIFJlbW92ZWQgc2V0dGluZyBt
YWpvciBlcmFzZXNpemUgdG8gbWlub3Igd2hlcmUgcGFydGl0aW9uIGJvdW5kYXJpZXMKPiAgICBy
ZXF1aXJlIG1pbm9yIGVyYXNlIHRvIGJlIHdyaXRhYmxlCj4gIC0gU2ltcGxpZmllZCBtaW5vciBi
b3VuZGFyeSBjaGVjayBieSByZWx5aW5nIG9uIG1pbm9yIGJlaW5nIGEgZmFjdG9yCj4gICAgb2Yg
bWFqb3IKPiAKPiBDaGFuZ2VzIFJGQyAtPiB2MToKPiAgLSBGaXhlZCB1bmluaXRpYWxpemVkIHZh
cmlhYmxlIHNtYXRjaCB3YXJuaW5nCj4gCj4gVGhpYmF1dCBWQVLDiE5FICgzKToKPiAgbXRkOiBt
dGRwYXJ0OiB3cml0ZSBzdXBwb3J0IGZvciBtaW5vci1hbGlnbmVkIHBhcnRpdGlvbnMKPiAgbXRk
OiBzcGktbm9yOiBzZXQgZXJhc2VzaXplX21pbm9yIGluIHNwaV9ub3Jfc2VsZWN0X2VyYXNlKCkK
PiAgbXRkOiBzcGktbm9yOiBhbGxvdyBvdmVycmlkaW5nIHVuaWZvcm0gZXJhc2UKPiAKPiBEb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWNsYXNzLW10ZCB8ICA4ICsrKysrKwo+IGRyaXZl
cnMvbXRkL210ZGNvcmUuYyAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysrKwo+IGRyaXZl
cnMvbXRkL210ZHBhcnQuYyAgICAgICAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKysrKysr
Ky0tLS0tLS0KPiBkcml2ZXJzL210ZC9zcGktbm9yL0tjb25maWcgICAgICAgICAgICAgICB8IDEw
ICsrKysrKysKPiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyAgICAgICAgICAgICAgICB8IDEz
ICsrKysrKystLQo+IGluY2x1ZGUvbGludXgvbXRkL210ZC5oICAgICAgICAgICAgICAgICAgIHwg
IDIgKysKPiA2IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQo+IAo+IAo+IGJhc2UtY29tbWl0OiBlMGRjY2MzYjc2ZmIzNWJiMjU3YjQxMTgzNjdhODgzMDcz
ZDczOTBlCj4gLS0gCj4gMi4zMC4yCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
