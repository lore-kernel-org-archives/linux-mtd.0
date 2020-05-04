Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D3FC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 17:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235B02068E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 17:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBTr/pS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 235B02068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNtUqWzhmzsxglohpZkDops9EUOLTYGtbphbYtIp2bc=; b=OBTr/pS0+o9MyY
	jypG9ZZD5Htfxm96kmXbtra4lSOyqzknrxrgzPiNJSr3d1dt9TtFtneWz7rtMnT2DNJ9WD2cd7g/+
	vbRMP9BFCCxhzUgt0mY4yfZsQW72fkVrjOliruNB1u6Gu3HDcEReUi4p8UQvzWZVsWIiOlqwfjRfF
	JuaPEw/KhERvlKMBDIxdyWRXuZaXDw86TdVDYle/X1SYDOK11UlHA3h+Js++4hJkKlQaocOjt7YhC
	TMB3UAYzEJ4OeVCfK8vpw5gFlk7wm/xHv+mpYXGk6T6l/wdjmDqjJrZLZDPFrTf44V4lfuat2d2as
	mOBwGKQ1cn7iQb6RGLcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVevd-00071J-62; Mon, 04 May 2020 17:30:53 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVeva-00070q-0y
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 17:30:52 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id EFDA2100009;
 Mon,  4 May 2020 17:29:37 +0000 (UTC)
Date: Mon, 4 May 2020 19:29:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
Message-ID: <20200504192936.2973c3bf@xps13>
In-Reply-To: <CAKekbevhWqsYSacTFCp+XEv7nBjL7tbo_wkOiCDZ1UYPf=RoeA@mail.gmail.com>
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
 <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
 <20200109160352.6080e1e5@xps13>
 <CAKekbeucdjZgttQfHeiXH6S92He2qkKGsQcEqz_4_okHzDK16A@mail.gmail.com>
 <20200109182807.04c8866a@xps13> <20200502200806.1d6b1cba@xps13>
 <CAKekbevhWqsYSacTFCp+XEv7nBjL7tbo_wkOiCDZ1UYPf=RoeA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_103050_199306_C48F12BC 
X-CRM114-Status: GOOD (  19.79  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrYW1hbC5kYXN1QGJyb2FkY29tLmNvbT4gd3JvdGUgb24g
TW9uLCA0IE1heSAyMDIwIDExOjIwOjE2Ci0wNDAwOgoKPiBPbiBTYXQsIE1heSAyLCAyMDIwIGF0
IDI6MDggUE0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGkgS2FtYWwsCj4gPgo+ID4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGUgb24gVGh1LCA5IEphbiAyMDIwCj4gPiAxODoyODowNyArMDEwMDoK
PiA+ICAKPiA+ID4gSGkgS2FtYWwsCj4gPiA+Cj4gPiA+IEthbWFsIERhc3UgPGthbWFsLmRhc3VA
YnJvYWRjb20uY29tPiB3cm90ZSBvbiBUaHUsIDkgSmFuIDIwMjAgMTA6MjU6NTkKPiA+ID4gLTA1
MDA6Cj4gPiA+ICAKPiA+ID4gPiBNaXF1ZWwsCj4gPiA+ID4KPiA+ID4gPiBZZXMgdGhlIGlzc3Vl
IGlzIHN0aWxsIG9wZW4uIEkgd2FzIHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSBzdWdnZXN0aW9u
Cj4gPiA+ID4gYW5kIGRpZCBub3QgZ2V0IGEgcmVwbHkgb24gdGhlIHF1ZXN0aW9uIEkgaGFkCj4g
PiA+ID4KPiA+ID4gPiBSaWNoYXJkIHdyb3RlIDoKPiA+ID4gPiAiU28gdGhlIHJpZ2h0IGZpeCB3
b3VsZCBiZSBzZXR0aW5nIHRoZSBwYXJlbnQncyBvb3BzX3BhbmljX3dyaXRlIGluCj4gPiA+ID4g
bXRkX3BhbmljX3dyaXRlKCkuCj4gPiA+ID4gVGhlbiB3ZSBkb24ndCBoYXZlIHRvIHRvdWNoIG10
ZHBhcnQuYyIKPiA+ID4gPgo+ID4gPiA+IEhvdyBkbyBJIGdldCBhY2Nlc3MgdG8gdGhlIHBhcnRz
IHBhcmVudCBpbiB0aGUgY29yZSA/LiBNYXliZSBJIGFtCj4gPiA+ID4gbWlzc2luZyBzb21ldGhp
bmcuICAKPiA+ID4KPiA+ID4gSSB0aGluayB0aGUgc29sdXRpb24gaXMgdG8gc2V0IHRoZSBvb3Bz
X3BhbmljX3dyaXRlIG9mIHRoZSByb290IHBhcmVudCwgaW5zdGVhZCBvZiB1cGRhdGluZyB0aGUg
ZmxhZyBvZiB0aGUgbXRkIGRldmljZSBpdHNlbGYgKHdoaWNoIGlzIG1heWJlIGEgcGFydGl0aW9u
KS4KPiA+ID4KPiA+ID4gV291bGQgdGhpcyBoZWxwPwo+ID4gPgo+ID4gPiBodHRwczovL3d3dy5z
cGluaWNzLm5ldC9saXN0cy9saW51eC1tdGQvbXNnMTA0NTQuaHRtbCAgCj4gPgo+ID4gSSdtIHBp
bmdpbmcgeW91IGhlcmUgYXMgd2VsbCwgYXMgSSB0aGluayB5b3UgcmFpc2UgYSByZWFsIGlzc3Vl
LCBhbmQgd2UKPiA+IGFncmVlZCBvbiBhIHNvbHV0aW9uLCB3aGljaCBjYW4gbm93IGJlIGVhc2ls
eSBzZXR1cCB3aXRoIHRoZSBhYm92ZQo+ID4gY2hhbmdlIHdoaWNoIGhhcyBiZWVuIGFwcGxpZWQg
YW5kIHN1cHBvcnQgZm9yIGZ1bmN0aW9ucyBsaWtlOgo+ID4KPiA+ICAgICAgICAgc3RhdGljIGlu
bGluZSBzdHJ1Y3QgbXRkX2luZm8gKm10ZF9nZXRfbWFzdGVyKHN0cnVjdCBtdGRfaW5mbyAqbXRk
KQo+ID4gICAgICAgICBzdGF0aWMgaW5saW5lIHU2NCBtdGRfZ2V0X21hc3Rlcl9vZnMoc3RydWN0
IG10ZF9pbmZvICptdGQsIHU2NCBvZnMpCj4gPiAgICAgICAgIHN0YXRpYyBpbmxpbmUgYm9vbCBt
dGRfaXNfcGFydGl0aW9uKGNvbnN0IHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ID4gICAgICAgICBz
dGF0aWMgaW5saW5lIGJvb2wgbXRkX2hhc19wYXJ0aXRpb25zKGNvbnN0IHN0cnVjdCBtdGRfaW5m
byAqbXRkKQo+ID4gIAo+IAo+IFNvIEkgc2hvdWxkIG9ubHkgc2V0ICBtYXN0ZXItPm9vcHNfcGFu
aWNfd3JpdGUgIHdpdGggdGhlIG5ldyBjb2RlID8uCgpZZXMsIGlmIHlvdSBjYW4gc3RpbGwgcmVw
cm9kdWNlIHRoZSBpc3N1ZSBhbmQgaXQgc29sdmVzIHlvdXIgcHJvYmxlbSwKdGhlbiBpdCdzIEkg
dGhpbmsgYSBuaWNlIGZpeC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
