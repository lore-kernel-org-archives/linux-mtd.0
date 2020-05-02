Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9835C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 18:08:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11A4206CD
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 18:08:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0S65+6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11A4206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PS2zlHIPZXhh3/d1GxqrWTlzp5OuJeJ1G0yZEnNcWg=; b=W0S65+6MLQMyqo
	9l/FnGvLqn6RkCgPxS9G3T/ogR/7ylXAxN+fmwIBFf29P9YvpNqXgxSB1uWwQIte8bFK43QpUYFqv
	ngvj8oPF4m1OlV9+M60uaGB9ERDvj8HmU2Tx9iUOAtAoqnML1zOoM+1TRttQVgDInt1NLsA4WgcCy
	imE1EDOIIrR0H9x1XLUVOhu3ztp9apLswPS6MvaeUshzcr/KJuQ0SnzSBK4+TPa6f6WKk6Jknj0Fx
	EOO0tDzUBgqmLWTw5Kb0YbfO4uouR05+c+AgR6SW5m4l+5X/68Lsp3ELejy8rS8efPFmcGDQukZzR
	nMEidKPiwDBVdD05hgig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUwYe-0002Re-KM; Sat, 02 May 2020 18:08:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUwYc-0002Ql-15
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 18:08:11 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 52B56C0005;
 Sat,  2 May 2020 18:08:07 +0000 (UTC)
Date: Sat, 2 May 2020 20:08:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
Message-ID: <20200502200806.1d6b1cba@xps13>
In-Reply-To: <20200109182807.04c8866a@xps13>
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
 <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
 <20200109160352.6080e1e5@xps13>
 <CAKekbeucdjZgttQfHeiXH6S92He2qkKGsQcEqz_4_okHzDK16A@mail.gmail.com>
 <20200109182807.04c8866a@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_110810_208035_B5D37050 
X-CRM114-Status: GOOD (  15.15  )
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

SGkgS2FtYWwsCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZSBvbiBUaHUsIDkgSmFuIDIwMjAKMTg6Mjg6MDcgKzAxMDA6Cgo+IEhpIEthbWFsLAo+IAo+IEth
bWFsIERhc3UgPGthbWFsLmRhc3VAYnJvYWRjb20uY29tPiB3cm90ZSBvbiBUaHUsIDkgSmFuIDIw
MjAgMTA6MjU6NTkKPiAtMDUwMDoKPiAKPiA+IE1pcXVlbCwKPiA+IAo+ID4gWWVzIHRoZSBpc3N1
ZSBpcyBzdGlsbCBvcGVuLiBJIHdhcyB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgc3VnZ2VzdGlv
bgo+ID4gYW5kIGRpZCBub3QgZ2V0IGEgcmVwbHkgb24gdGhlIHF1ZXN0aW9uIEkgaGFkCj4gPiAK
PiA+IFJpY2hhcmQgd3JvdGUgOgo+ID4gIlNvIHRoZSByaWdodCBmaXggd291bGQgYmUgc2V0dGlu
ZyB0aGUgcGFyZW50J3Mgb29wc19wYW5pY193cml0ZSBpbgo+ID4gbXRkX3BhbmljX3dyaXRlKCku
Cj4gPiBUaGVuIHdlIGRvbid0IGhhdmUgdG8gdG91Y2ggbXRkcGFydC5jIgo+ID4gCj4gPiBIb3cg
ZG8gSSBnZXQgYWNjZXNzIHRvIHRoZSBwYXJ0cyBwYXJlbnQgaW4gdGhlIGNvcmUgPy4gTWF5YmUg
SSBhbQo+ID4gbWlzc2luZyBzb21ldGhpbmcuICAKPiAKPiBJIHRoaW5rIHRoZSBzb2x1dGlvbiBp
cyB0byBzZXQgdGhlIG9vcHNfcGFuaWNfd3JpdGUgb2YgdGhlIHJvb3QgcGFyZW50LCBpbnN0ZWFk
IG9mIHVwZGF0aW5nIHRoZSBmbGFnIG9mIHRoZSBtdGQgZGV2aWNlIGl0c2VsZiAod2hpY2ggaXMg
bWF5YmUgYSBwYXJ0aXRpb24pLgo+IAo+IFdvdWxkIHRoaXMgaGVscD8KPiAKPiBodHRwczovL3d3
dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1tdGQvbXNnMTA0NTQuaHRtbAoKSSdtIHBpbmdpbmcg
eW91IGhlcmUgYXMgd2VsbCwgYXMgSSB0aGluayB5b3UgcmFpc2UgYSByZWFsIGlzc3VlLCBhbmQg
d2UKYWdyZWVkIG9uIGEgc29sdXRpb24sIHdoaWNoIGNhbiBub3cgYmUgZWFzaWx5IHNldHVwIHdp
dGggdGhlIGFib3ZlCmNoYW5nZSB3aGljaCBoYXMgYmVlbiBhcHBsaWVkIGFuZCBzdXBwb3J0IGZv
ciBmdW5jdGlvbnMgbGlrZToKCglzdGF0aWMgaW5saW5lIHN0cnVjdCBtdGRfaW5mbyAqbXRkX2dl
dF9tYXN0ZXIoc3RydWN0IG10ZF9pbmZvICptdGQpCglzdGF0aWMgaW5saW5lIHU2NCBtdGRfZ2V0
X21hc3Rlcl9vZnMoc3RydWN0IG10ZF9pbmZvICptdGQsIHU2NCBvZnMpCglzdGF0aWMgaW5saW5l
IGJvb2wgbXRkX2lzX3BhcnRpdGlvbihjb25zdCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKCXN0YXRp
YyBpbmxpbmUgYm9vbCBtdGRfaGFzX3BhcnRpdGlvbnMoY29uc3Qgc3RydWN0IG10ZF9pbmZvICpt
dGQpCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
