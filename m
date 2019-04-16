Return-Path: <SRS0=Gd7z=SS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BEEC10F13
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 17:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCC53205ED
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2019 17:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2MtukEu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCC53205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTHqt5LhR3VL+dmqYHLUg8xVQtVjW9JHs5AM3NdHo+Y=; b=n2MtukEuovkghg
	fnyePzIl7whPA7MPVwiEzJe8Caf9LjQqD082ZVLM1WxVUpzLOfb6IkMZhCVDOO8Vdwl8ihix1gezN
	2PlcTrOiX7dpFITlRX4S2DjojuDgSoeWUjzuebpSm+yK4Ws974I0HbwbOINmPZzlul/7C9IgJBWBZ
	6TgHLM7eUwrMfOtR+6SD2k9gHBdT/4B5vOWTXjCdePYevDMfwUEiLhuKO4UuhL8BF5+0S5zw5bc++
	SOTj5fzTjIt7TxJTNWrtE9h17/LKjcg5HFuPF9P0pveYs57uv39rxj58qa9aXkAXQ6Q9l4MngSccJ
	wHFXphmESyEx8UaiBR+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGRof-0008PC-II; Tue, 16 Apr 2019 17:24:17 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGRoc-0008Om-D0
 for linux-mtd@lists.infradead.org; Tue, 16 Apr 2019 17:24:16 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 0F28520009;
 Tue, 16 Apr 2019 17:24:09 +0000 (UTC)
Date: Tue, 16 Apr 2019 19:24:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
Message-ID: <20190416192408.0e321563@xps13>
In-Reply-To: <ee1f8c4a-92b0-db9d-6110-3acadeb9e457@embeddedor.com>
References: <20190208180202.GA16603@embeddedor>
 <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
 <71df15e7-af2e-0326-78fe-0271a1e240fe@embeddedor.com>
 <20190415104458.7faeec57@xps13>
 <ee1f8c4a-92b0-db9d-6110-3acadeb9e457@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_102414_597262_2C9FCFAD 
X-CRM114-Status: GOOD (  19.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Kees Cook <keescook@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gTW9uLCAxNSBBcHIKMjAxOSAwNzo1NzoxMSAtMDUwMDoKCj4gSGkgTWlxdWVs
LAo+IAo+IE9uIDQvMTUvMTkgMzo0NCBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEd1
c3Rhdm8sCj4gPiAKPiA+ICJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9y
LmNvbT4gd3JvdGUgb24gV2VkLCAxMCBBcHIKPiA+IDIwMTkgMTY6MTY6NTEgLTA1MDA6Cj4gPiAg
IAo+ID4+IEhpIGFsbCwKPiA+Pgo+ID4+IElmIG5vIG9uZSBjYXJlcyBJJ2xsIGFkZCB0aGlzIHRv
IG15IHRyZWUgZm9yIDUuMi4gIAo+ID4gCj4gPiBXaGljaCB0cmVlIGFyZSB5b3UgdGFsa2luZyBh
Ym91dD8KPiA+ICAgCj4gCj4gVGhpcyBvbmU6Cj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3VzdGF2b2Fycy9saW51eC5naXQvbG9nLz9oPWZvci1u
ZXh0L2tzcHAKPiAKPiA+IFBsZWFzZSBsZXQgdGhlIE1URCBtYWludGFpbmVycyB0YWtlIHBhdGNo
ZXMgdGhyb3VnaCB0aGVpciB0cmVlLiBXZQo+ID4gbWlnaHQgYmUgbGF0ZSBidXQgdGhpcyBpcyBk
ZWZpbml0ZWx5IG5vdCBhIGdvb2QgcmVhc29uIHRvIGJ5cGFzcyB1cy4KPiA+ICAgCj4gSXQncyBh
IGJpdCBjb25mdXNpbmcgd2hlbiBwYXRjaGVzIGFyZSBiZWluZyBpZ25vcmVkIGZvciBtb3JlIHRo
YW4gdHdvCj4gbW9udGhzOgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9w
YXRjaC8xMDQwMDk5Lwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8x
MDQwMTAwLwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMDQwMDk4
Lwo+IAoKUGF0Y2hlcyBwb3N0ZWQgYXQgLXJjNiByaWdodCBiZWZvcmUgdGhlIGxhc3QgcmVsZWFz
ZT8gQ29tZSBvbiEgR3VzdGF2bywKd2UgYWx3YXlzIHNwZW5kIG1vcmUgdGltZSBmb3IgeW91IHRo
YW4gZm9yIG90aGVyIGNvbnRyaWJ1dG9ycyBiZWNhdXNlIHdlCmRvIG5vdCB0cnVzdCB5b3VyIGNo
YW5nZXMuIFdlIGNvdWxkIGFwcGx5IHRoZW0gYmxpbmRseSBidXQgd2UgZG9uJ3QgZG8KdGhhdCBm
b3Igb3RoZXIgKHdvcnRoeSkgY29udHJpYnV0aW9ucywgc28gd2h5IHNoYWxsIHdlIGRvIGl0IGZv
ciB5b3U/CgpJIHRoaW5rIHlvdSBjb3VsZCBhdCBsZWFzdCBmbGFnIHRoZXNlIGNoYW5nZXMgYXMg
ImF1dG9tYXRpYyBhbmQKdW52ZXJpZmllZCIgaW4gdGhlIGNvbW1pdCBsb2cgc28gdGhhdCB3aGVu
IGdpdCBibGFtaW5nLCBwZW9wbGUgY291bGQKa25vdyB0aGF0IHRoZSBhZGRpdGlvbmFsIGV4cGxp
Y2l0IC8qIGZhbGx0aHJvdWdoICovIGNvbW1lbnQgbWlnaHQgYmUKd3JvbmcgYW5kIHdhcyBqdXN0
IGFkZGVkIGluIG9yZGVyIHRvIGxpbWl0IHRoZSBudW1iZXIgb2Ygd2FybmluZ3Mgd2hlbgplbmFi
bGluZyB0aGUgZXh0cmEgR0NDIHdhcm5pbmcuCgo+IENlcnRhaW5seSwgUmljaGFyZCBXZWluYmVy
Z2VyIHJlcGxpZWQgdG8gdGhpcyBvbmUuIEJ1dCBJIGNvdWxkbid0Cj4gZmluZCBhIHRyZWUgdG8g
d2hpY2ggdGhpcyBwYXRjaCB3YXMgYXBwbGllZCwgaW4gY2FzZSBpdCBhY3R1YWxseQo+IHdhcy4K
PiAKPiBJdCdzIGEgY29tbW9uIHByYWN0aWNlIGZvciBtYWludGFpbmVycyB0byByZXBseSBzYXlp
bmcgdGhhdCBhIHBhdGNoCj4gaGFzIGJlZW4gZmluYWxseSBhcHBsaWVkLCBhbmQgaW4gbW9zdCBj
YXNlcyB0aGV5IGFsc28gZXhwbGljaXRseQo+IG1lbnRpb24gdGhlIHRyZWUgYW5kIGJyYW5jaCB0
byB3aGljaCBpdCB3YXMgYXBwbGllZC4gQWxsIHRoaXMgaW5mbwo+IGlzIHJlYWxseSBoZWxwZnVs
IGZvciBwZW9wbGUgd29ya2luZyBhbGwgb3ZlciB0aGUgdHJlZS4KCkl0IGlzIGNvbW1vbiBwcmFj
dGljZSBmb3IgY29udHJpYnV0b3JzIHRvIHVuZGVyc3RhbmQgd2hhdCB0aGV5CmFyZSBkb2luZyBi
ZWZvcmUgc3VibWl0dGluZyBhIGNoYW5nZSBhbmQgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCB5b3UK
Y2xlYXJseSBkb24ndCB0cnkgdG8gZG8uCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
