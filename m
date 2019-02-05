Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296DFC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 18:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 031A5217D6
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 18:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RNRxPcD/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 031A5217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOECmlGumHTZobfaVtAHX5yj9P1kR1SSEw5qBTuV8gg=; b=RNRxPcD/4sf/Km
	ujR0CcagbWYz0JkuTnDc70WVC0gSERRmmdKvCgfq6H0YW7V1wnIUZpuhXhr5dquxRIoIfblvfDxEy
	40ZzER+5h5LsiLSbHAROtb61jqTfu/57TnXkMGWiJ4f735G90oY96tMOOS0YaeKx/mwWnI7uV2rkT
	4jkTYQQWK1OKdlt85SL4/GGSjTwWJlokPsLi7N0kA9eUrmtQLl71wjUjOZEg0qfHu28ZAveruMr/4
	rXS/rAqTsL4VSWQDUr9nrdYQW+GGX14GB9SFFFWYYe6uPSvAJd6yLjKkIHvD38PD+w5KA/eHEoNrA
	dHn/3HX/Y8w7fvUYdgZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr5sJ-0004Tz-EI; Tue, 05 Feb 2019 18:55:15 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr5sE-00043s-LH
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 18:55:13 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 749001C0009;
 Tue,  5 Feb 2019 18:54:58 +0000 (UTC)
Date: Tue, 5 Feb 2019 19:54:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 8/9] mtd: rawnand: ingenic: Add support for the JZ4725B
Message-ID: <20190205195457.171cd3e3@xps13>
In-Reply-To: <1549384157.1610.0@crapouillou.net>
References: <20190204190426.11618-1-paul@crapouillou.net>
 <20190204190426.11618-8-paul@crapouillou.net>
 <20190205151256.1bb3dab0@xps13> <1549384157.1610.0@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_105510_850995_323AA987 
X-CRM114-Status: GOOD (  20.82  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Mathieu Malaterre <malat@debian.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKCgpbLi4uXQoKPiA+PiAgKwo+ID4+ICArc3RhdGljIHZvaWQgano0NzI1Yl9iY2hf
aW5pdChzdHJ1Y3QgaW5nZW5pY19lY2MgKmJjaCwKPiA+PiAgKwkJCSAgICAgc3RydWN0IGluZ2Vu
aWNfZWNjX3BhcmFtcyAqcGFyYW1zLCBib29sIGVuY29kZSkgIAo+ID4gCj4gPiBJIGRvbid0IGtu
b3cgdGhlIElQIGJ1dCAnZW5jb2RlJyBsb29rcyBzdHJhbmdlLCB3aGF0IGlzIGl0IHN1cHBvc2Vk
IHRvCj4gPiBtZWFuPyAgCj4gCj4gSXQgaXMgdXNlZCB0byB0b2dnbGUgYmV0d2VlbiBjYWxjdWxh
dGluZyB0aGUgRUNDIGNvZGVzIGZvciBhIGdpdmVuIHNldCBvZiBkYXRhLAo+IGFuZCB1c2luZyBz
dXBwbGllZCBFQ0MgY29kZXMgdG8gdmVyaWZ5IGEgc2V0IG9mIGRhdGEuCj4gCj4gSSBqdXN0IHJl
dXNlZCB0aGUgZnVuY3Rpb24gYW5kIHBhcmFtZXRlciBuYW1lcyB0aGF0IHdlcmUgdXNlZCBpbiB0
aGUKPiBqejQ3ODAtYmNoIGRyaXZlciwgdGhhdCdzIHdoZXJlIHRoZSAnZW5jb2RlJyBjb21lcyBm
cm9tLgoKCkkgc2VlLCBzbyBpdCBpcyBraW5kIG9mIGEgImRlcml2ZSIgdnMuICJ2ZXJpZnkiIGlu
Zm9ybWF0aW9uLiBQbGVhc2UKYWRkIGEgY29tbWVudCBleHBsYWluaW5nIHRoZSBwYXJhbWV0ZXIg
bmFtZSB0aGVuLgoKPiA+PiAgK3sKPiA+PiAgKwl1MzIgcmVnOwo+ID4+ICArCj4gPj4gICsJLyog
Q2xlYXIgaW50ZXJydXB0IHN0YXR1cy4gKi8KPiA+PiAgKwl3cml0ZWwocmVhZGwoYmNoLT5iYXNl
ICsgQkNIX0JISU5UKSwgYmNoLT5iYXNlICsgQkNIX0JISU5UKTsKPiA+PiAgKwo+ID4+ICArCS8q
IEluaXRpYWxpc2UgYW5kIGVuYWJsZSBCQ0guICovCj4gPj4gICsJd3JpdGVsKDB4MWYsIGJjaC0+
YmFzZSArIEJDSF9CSENDUik7Cj4gPj4gICsJd3JpdGVsKEJDSF9CSENSX0JDSEUsIGJjaC0+YmFz
ZSArIEJDSF9CSENTUik7Cj4gPj4gICsKPiA+PiAgKwlpZiAocGFyYW1zLT5zdHJlbmd0aCA9PSA4
KQo+ID4+ICArCQl3cml0ZWwoQkNIX0JIQ1JfQlNFTF9NQVNLLCBiY2gtPmJhc2UgKyBCQ0hfQkhD
U1IpOwo+ID4+ICArCWVsc2UKPiA+PiAgKwkJd3JpdGVsKEJDSF9CSENSX0JTRUxfTUFTSywgYmNo
LT5iYXNlICsgQkNIX0JIQ0NSKTsgIAo+ID4gCj4gPiBIZXJlIHlvdSB3cml0ZSB0byBCQ0hfQkhD
U1Igb3IgQkNIX0JIQ0NSIGRlcGVuZGluZyBvbgo+ID4gcGFyYW1zLT5zdHJlbmd0aC4uLgo+ID4g
ICAKPiA+PiAgKwo+ID4+ICArCWlmIChlbmNvZGUpCj4gPj4gICsJCXdyaXRlbChCQ0hfQkhDUl9F
TkNFLCBiY2gtPmJhc2UgKyBCQ0hfQkhDU1IpOwo+ID4+ICArCWVsc2UKPiA+PiAgKwkJd3JpdGVs
KEJDSF9CSENSX0VOQ0UsIGJjaC0+YmFzZSArIEJDSF9CSENDUik7ICAKPiA+IAo+ID4gLi4uYW5k
IGhlcmUgZGVwZW5kaW5nIG9uIGVuY29kZS4KPiA+IAo+ID4gQ2FuIHlvdSBleHBsYWluIGEgYml0
PyAgCj4gCj4gQkNIX0JIQ1NSIC8gQkNIX0JIQ0NSIGFyZSBzZXQgYW5kIGNsZWFyIHJlZ2lzdGVy
cyBmb3IgdGhlIEJDSF9CSENSCj4gcmVnaXN0ZXIsIHdoaWNoIGlzIGl0c2VsZiByZWFkLW9ubHku
IFRoZSBCU0VMIGZpZWxkIGlzIHVzZWQgdG8gdG9nZ2xlCj4gYmV0d2VlbiBhIHN0cmVuZ3RoIG9m
IDQgKGlmIGNsZWFyZWQpIGFuZCA4IChpZiBzZXQpLCB3aGlsZSB0aGUgRU5DRQo+IGZpZWxkIGNv
bmZpZ3VyZXMgdGhlIElQIGZvciAnZW5jb2RpbmcnIG1vZGUuCgpBbGwgY2xlYXIuIENhbiB5b3Ug
YWRkIGEgc2hvcnQgY29tbWVudCB0byBleHBsYWluIGl0IHNvbWV3aGVyZT8KCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
