Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3CAC00A89
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:22:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8735D20791
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k4Dqc+RC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8735D20791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O565m3bMf/0qP6/XSqMt6+dN70ytwfrpheJ5wVWBe/I=; b=k4Dqc+RC0DV44Qh16uEmSyaUd
	VRy5th7B7Oq5U7TBXlvu+zX9SvGMW1y9Cbi+78MC45zGEBOIkCVe3dMpSb3Re+JaL82lbbU8v7esn
	gYgk03l6ja31+TxbayR4B2q52OrptHg3xob6+CFNpqZBPRA30NTeVJF3VKJsfV4URPME4/xlTxNPq
	ThtRRa2jF5u7bkbQbJDqK81zDF7aMImpgZ3nLBamtaV/ULvfwHVcbNO0nbeWVY7JI15F+Ab4sZ7Yg
	Ff5vvZsSLjWd62cs50/QuVJtpu8ai4ofkOe213Qym8m41m3+H2jN1+76JUxFFL+bkMyeB6Tow8P6s
	H7V6t7JAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYY4X-0003sD-Vv; Fri, 30 Oct 2020 17:20:18 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYY4V-0003rh-F1
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:20:16 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E107AFF808;
 Fri, 30 Oct 2020 17:20:10 +0000 (UTC)
Date: Fri, 30 Oct 2020 18:20:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mtd: nand: ecc-hamming: Clarify the logic around rp17
Message-ID: <20201030182009.646d4ce0@xps13>
In-Reply-To: <20201029113425.26f83231@xps13>
References: <20201029083847.21128-1-miquel.raynal@bootlin.com>
 <20201029102705.GR18329@kadam> <20201029113425.26f83231@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_132015_656718_6575DC6F 
X-CRM114-Status: GOOD (  25.16  )
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
Cc: Richard Weinberger <richard@nod.at>, kernel test robot <lkp@intel.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGUg
b24gVGh1LCAyOSBPY3QgMjAyMAoxMTozNDoyNSArMDEwMDoKCj4gSGkgRGFuLAo+IAo+IERhbiBD
YXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4gd3JvdGUgb24gVGh1LCAyOSBPY3Qg
MjAyMAo+IDEzOjI3OjA1ICswMzAwOgo+IAo+ID4gT24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMDk6
Mzg6NDdBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4gPiBUaGlzIGNvZGUgaGFz
IGJlZW4gd3JpdHRlbiBpbiAyMDA4IGFuZCBpcyBmaW5lLCBidXQgaW4gb3JkZXIgdG8ga2VlcAo+
ID4gPiByb2JvdHMgaGFwcHksIEkgdGhpbmsgaXQncyB0aW1lIHRvIGNoYW5nZSBhIGxpdHRsZSBi
aXQgdGhpcyBjb2RlIGp1c3QKPiA+ID4gdG8gY2xhcmlmeSB0aGUgZGlmZmVyZW50IHBvc3NpYmxl
IHZhbHVlcyBvZiBlY2NzaXplX211bHQuIEluZGVlZCwgdGhpcwo+ID4gPiB2YXJpYWJsZSBtYXkg
b25seSB0YWtlIHRoZSB2YWx1ZSAxIG9yIDIgYmVjYXVzZSBzdGVwX3NpemUsIGluIHRoZSBjYXNl
Cj4gPiA+IG9mIHRoZSBzb2Z0d2FyZSBIYW1taW5nIEVDQyBlbmdpbmUgbWF5IG9ubHkgYmUgMjU2
IG9yIDUxMi4gRGVwZW5kaW5nCj4gPiA+IG9uIHRoZSB2YWx1ZSBvZiBlY2NzaXplX211bHQsIGFu
IGV4dHJhIHJwMTcgdmFyaWFibGUgaXMgc2V0LCBvciBub3QKPiA+ID4gYW5kIHRyaWdnZXJzIHRo
ZSBmb2xsb3dpbmcgd2FybmluZzoKPiA+ID4gCj4gPiA+ICAgICAgc21hdGNoIHdhcm5pbmdzOgo+
ID4gPiAgICAgIGVjY19zd19oYW1taW5nX2NhbGN1bGF0ZSgpIGVycm9yOiB1bmluaXRpYWxpemVk
IHN5bWJvbCAncnAxNycuCj4gPiA+IAo+ID4gPiBBcyBoaWdobGlnaHRlZCBieSBEYW4gQ2FycGVu
dGVyLCBpZiB0aGUgb25seSBwb3NzaWJsZSB2YWx1ZXMgZm9yCj4gPiA+IGVjY3NpemVfbXVsdCBh
cmUgMSBhbmQgMiwgdGhlbiB0aGUgY29kZSBpcyBmaW5lLCBidXQgIml0J3MgaGFyZCB0bwo+ID4g
PiB0ZWxsIGp1c3QgZnJvbSBsb29raW5nIi4KPiA+ID4gCj4gPiA+IFNvIGluc3RlYWQgb2Ygc2hp
ZnRpbmcgc3RlcF9zaXplLCBsZXQncyB1c2UgYSB0ZXJuYXJ5IGNvbmRpdGlvbiB0bwo+ID4gPiBh
c3NpZ24gdG8gZWNjc2l6ZV9tdWx0IHRoZSBvbmx5IHR3byBwb3NzaWJsZSB2YWx1ZXMgYW5kIGNs
YXJpZnkgdGhlCj4gPiA+IGRyaXZlcidzIGxvZ2ljLgo+ID4gPiAKPiA+ID4gTm93IHRoYXQgdGhl
IHNpdHVhdGlvbiBpcyBjbGFyaWZpZWQgZm9yIGh1bWFucywgc2V0IHJwMTcgdG8gMCBpbiBhbgo+
ID4gPiBlbHNlIGJsb2NrIHRvIGtlZXAgcm9ib3RzIHNpbGVudCBhcyB3ZWxsLiAgICAKPiA+IAo+
ID4gU21hdGNoIHdpbGwgcGFyc2UgaXQgY29ycmVjdGx5IHdpdGgganVzdCB0aGUgdGVybmFyeSBj
aGFuZ2UgYnV0IHRoZXJlCj4gPiBtaWdodCBiZSBvdGhlciBjaGVja2VycyB3aGljaCB3YW50IHRo
ZSB0aGUgZWxzZSBzdGF0ZW1lbnQuICBJJ20gbm90Cj4gPiBzdXJlLiAgR0NDIGRvZXNuJ3Qgc2Vl
bSB0byB3YXJuIGFib3V0IHVuaW5pdGlhbGl6ZWQgdmFyaWFibGVzIHRoZXNlCj4gPiBkYXlzLiAg
Cj4gCj4gV2VsbCwgSSB0aG91Z2h0IGFib3V0IHRoaXMgYWZ0ZXIgaGF2aW5nIHdyaXR0ZW4gdGhl
IGNvbW1pdCBsb2csIEkKPiBhbWVuZGVkIHRoZSBjb21taXQgdG8ganVzdCBrZWVwIHRoZSB0ZXJu
YXJ5IGNoYW5nZSBhbmQgSSBmb3Jnb3QgdG8gZHJvcAo+IHRoaXMgcGFydCBvZiB0aGUgY29tbWl0
IGxvZy4KPiAKPiBTbyBpZiB0aGUgY2hhbmdlIGxvb2tzIGdvb2QgdG8geW91IEkgY2FuIHNpbXBs
eSBkcm9wIHRoZSBsYXN0IHBhcmFncmFwaAo+IHdoZW4gYXBwbHlpbmcuCgpHQ0Mga2VlcHMgY29t
cGxhaW5pbmcuLi4KCmdjY19yZWNlbnRfZXJyb3JzCnwtLSBoODMwMC1yYW5kY29uZmlnLW0wMzEt
MjAyMDEwMjkKfCAgIGAtLSBkcml2ZXJzLW10ZC1uYW5kLWVjYy1zdy1oYW1taW5nLmMtZWNjX3N3
X2hhbW1pbmdfY2FsY3VsYXRlKCktZXJyb3I6dW5pbml0aWFsaXplZC1zeW1ib2wtcnAxNy0uCmAt
LSB4ODZfNjQtcmFuZGNvbmZpZy1tMDAxLTIwMjAxMDI5CiAgICBgLS0gZHJpdmVycy1tdGQtbmFu
ZC1lY2Mtc3ctaGFtbWluZy5jLWVjY19zd19oYW1taW5nX2NhbGN1bGF0ZSgpLWVycm9yOnVuaW5p
dGlhbGl6ZWQtc3ltYm9sLXJwMTctLgoKSSdsbCBmaXggbXkgcGF0Y2ggYW5kIGluaXRpYWxpemUg
cnAxNyB0byAwLCBpdCBkb2VzIG5vdCBodXJ0IGFueXdheS4uLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
