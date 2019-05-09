Return-Path: <SRS0=HSOd=TJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBBCC04AB1
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 06:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C962173C
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 06:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="exK9K2LR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20C962173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYo1/7xW6bcUaHFnaMQxR3xVQzADcNF9Gp9qdf+DwO8=; b=exK9K2LR61TXk+
	HM5x4jYBoTqImHYE/TECXV5qgBzhN5wODIkrk02kE6v9ySLrc+bpNfFF8QKGrPAsqfkTerxjV9rJg
	Ml0hOv42dz2vQjMk0F3PfH3lyXwUNR13mnzILlzMfLVzECzqjKi/KT8OztU39e49eSVUY0yrZDq9d
	7ffXH5SpXCwjstJmH5AzbQzjGzhsJu7egPzYIxLW8HMp29I9YB9BUFoPhtf/vYwoCmmnK+fL+YjUO
	vj/A7JCobSwBgUvbB204nNSevPcPPOeZqE1aRuL7syw4Ix1nHuc+MlBwKSHoppG1EsRs3k2wLD4yB
	ybSD+JEMPFIasaWCVLfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOcvx-0004mi-Kv; Thu, 09 May 2019 06:53:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOcvt-0004mF-OG
 for linux-mtd@lists.infradead.org; Thu, 09 May 2019 06:53:35 +0000
X-Originating-IP: 90.88.28.253
Received: from xps13 (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr
 [90.88.28.253]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CA35D1C0006;
 Thu,  9 May 2019 06:53:19 +0000 (UTC)
Date: Thu, 9 May 2019 08:53:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] mtd: cfi_util: mark expected switch fall-throughs
Message-ID: <20190509085318.34a9d4be@xps13>
In-Reply-To: <cf70787e-5c3a-d639-1025-7fa15d935732@embeddedor.com>
References: <20190208180202.GA16603@embeddedor>
 <69083203-0720-1943-8549-ddf3cea6060e@embeddedor.com>
 <71df15e7-af2e-0326-78fe-0271a1e240fe@embeddedor.com>
 <20190415104458.7faeec57@xps13>
 <ee1f8c4a-92b0-db9d-6110-3acadeb9e457@embeddedor.com>
 <20190416192408.0e321563@xps13>
 <8df20a3a-3068-1fb7-0421-e6c417550125@embeddedor.com>
 <3034821c-3cd0-b0c5-a6fd-548fd87486a4@embeddedor.com>
 <785015370.48464.1557244145722.JavaMail.zimbra@nod.at>
 <cf70787e-5c3a-d639-1025-7fa15d935732@embeddedor.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_235334_094158_67E1C287 
X-CRM114-Status: GOOD (  20.46  )
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
 Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VzdGF2bywKCiJHdXN0YXZvIEEuIFIuIFNpbHZhIiA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNv
bT4gd3JvdGUgb24gVHVlLCA3IE1heSAyMDE5CjEwOjU5OjM4IC0wNTAwOgoKPiBPbiA1LzcvMTkg
MTA6NDkgQU0sIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPiAKPiA+PiBIaSBhbGwsCj4gPj4K
PiA+PiBUaGFua3MgYSBsb3QgZm9yIHRoaXMsIFJpY2hhcmQ6Cj4gPj4KPiA+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0L2xvZy8/
aD1tdGQlMkZuZXh0JnF0PWdyZXAmcT1mYWxsLXRocm91Z2gKPiA+Pgo+ID4+IFRoZXJlIGFyZSBv
bmx5IHR3byBvZiB0aGVzZSB3YXJuaW5ncyBsZWZ0IHRvIGJlIGFkZHJlc3NlZCBpbgo+ID4+IE1U
RFsxXToKPiA+PiAgCj4gPj4gICAgICAgID4gQEAgLTMyODAsMTIgKzMyODAsMTQgQEAgc3RhdGlj
IHZvaWQgb25lbmFuZF9jaGVja19mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+PiAg
ICAgICAgPiAgICAgICAgICAgICAgICAgICAgICAgaWYgKCh0aGlzLT52ZXJzaW9uX2lkICYgMHhm
KSA9PSAweGUpCj4gPj4gICAgICAgID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGhp
cy0+b3B0aW9ucyB8PSBPTkVOQU5EX0hBU19OT1BfMTsKPiA+PiAgICAgICAgPiAgICAgICAgICAg
ICAgIH0KPiA+PiAgICAgICAgPiArICAgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+ID4+
ICAgICAgICA+Cj4gPj4gICAgICAgID4gICAgICAgY2FzZSBPTkVOQU5EX0RFVklDRV9ERU5TSVRZ
XzJHYjoKPiA+PiAgICAgICAgPiAgICAgICAgICAgICAgIC8qIDJHYiBERFAgZG9lcyBub3QgaGF2
ZSAyIHBsYW5lICovCj4gPj4gICAgICAgID4gICAgICAgICAgICAgICBpZiAoIU9ORU5BTkRfSVNf
RERQKHRoaXMpKQo+ID4+ICAgICAgICA+ICAgICAgICAgICAgICAgICAgICAgICB0aGlzLT5vcHRp
b25zIHw9IE9ORU5BTkRfSEFTXzJQTEFORTsKPiA+PiAgICAgICAgPiAgICAgICAgICAgICAgIHRo
aXMtPm9wdGlvbnMgfD0gT05FTkFORF9IQVNfVU5MT0NLX0FMTDsKPiA+PiAgICAgICAgPiArICAg
ICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLyAgCj4gPj4KPiA+PiAgICAgICAgVGhpcyBsb29r
cyBzdHJhbmdlLgo+ID4+Cj4gPj4gICAgICAgIEluIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMkdi
Ogo+ID4+ICAgICAgICBPTkVOQU5EX0hBU19VTkxPQ0tfQUxMIGlzIHNldCB1bmNvbmRpdGlvbmFs
bHkuCj4gPj4KPiA+PiAgICAgICAgQnV0IHRoZW4sIHVuZGVyIE9ORU5BTkRfREVWSUNFX0RFTlNJ
VFlfMUdiLCB0aGUgc2FtZSBvcHRpb24gaXMgc2V0IG9ubHkKPiA+PiAgICAgICAgaWYgcHJvY2Vz
cyBpcyBldmFsdWF0ZWQgdG8gdHJ1ZS4KPiA+Pgo+ID4+ICAgICAgICBTYW1lIHByb2JsZW0gd2l0
aCBPTkVOQU5EX0hBU18yUExBTkU6Cj4gPj4gICAgICAgIC0gaXQgaXMgc2V0IGluIE9ORU5BTkRf
REVWSUNFX0RFTlNJVFlfNEdiIG9ubHkgaWYgT05FTkFORF9JU19ERFAoKQo+ID4+ICAgICAgICAt
IGl0IGlzIHVuc2V0IGluIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMkdiIG9ubHkgaWYgIU9ORU5B
TkRfSVNfRERQKCkKPiA+Pgo+ID4+ICAgICAgICBNYXliZSB0aGlzIHBvcnRpb24gc2hvdWxkIGJl
IHJld29ya2VkIGJlY2F1c2UgSSBhbSB1bnN1cmUgaWYgdGhpcyBpcyBhCj4gPj4gICAgICAgIG1p
c3NpbmcgZmFsbCB0aHJvdWdoIG9yIGEgYnVnLgo+ID4+Cj4gPj4KPiA+PiBUaGFua3MKPiA+PiAt
LQo+ID4+IEd1c3Rhdm8KPiA+Pgo+ID4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvMTAzNjI1MS8gIAo+ID4gCj4gPiBEaWQgd2UgbWlzcyB0aGlzIHBhdGNoPyBB
RkFJQ1QgaXQgaXMgaW4gLW5leHQgdG9vLgo+ID4gICAKPiAKPiBXaGF0IGlzIHBlbmRpbmcgdG8g
YmUgcmVzb2x2ZWQgYXJlIHRoZXNlIHdhcm5pbmdzOgo+IAo+IGRyaXZlcnMvbXRkL25hbmQvb25l
bmFuZC9vbmVuYW5kX2Jhc2UuYzogSW4gZnVuY3Rpb24g4oCYb25lbmFuZF9jaGVja19mZWF0dXJl
c+KAmToKPiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI2NDo2OiB3
YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0
aHJvdWdoPV0KPiAgICBpZiAoT05FTkFORF9JU19ERFAodGhpcykpCj4gICAgICAgXgo+IGRyaXZl
cnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYzozMjg0OjI6IG5vdGU6IGhlcmUKPiAg
IGNhc2UgT05FTkFORF9ERVZJQ0VfREVOU0lUWV8yR2I6Cj4gICBefn5+Cj4gZHJpdmVycy9tdGQv
bmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOjMyODg6MTc6IHdhcm5pbmc6IHRoaXMgc3RhdGVt
ZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIHRoaXMt
Pm9wdGlvbnMgfD0gT05FTkFORF9IQVNfVU5MT0NLX0FMTDsKPiBkcml2ZXJzL210ZC9uYW5kL29u
ZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI5MDoyOiBub3RlOiBoZXJlCj4gICBjYXNlIE9ORU5BTkRf
REVWSUNFX0RFTlNJVFlfMUdiOgo+ICAgXn5+fgo+IAo+IFRoZSBmaW5hbCB2ZXJzaW9uIG9mIHRo
ZSBwYXRjaCBpbiAtbmV4dCBkb2VzIG5vdCBhZGRyZXNzIHRoZW0uCj4gCgpTZW5kIGEgY29tbWl0
IGZvciB0aGVzZSB0d28gd2FybmluZ3Mgc3RhdGluZyB2ZXJ5IGNsZWFybHkgY2xvc2UgdG8KdGhl
IHRvcCBvZiB0aGUgY29tbWl0IGxvZyB0aGF0IHdlIGRvbid0IGtub3cgd2hldGhlciB3ZSBuZWVk
CmZhbGx0aHJvdWdocyBvciBicmVha3MgdGhlcmUgYW5kIHRoYXQgdGhpcyBpcyBqdXN0IGEgY2hh
bmdlIHRvIGF2b2lkCmhhdmluZyBuZXcgd2FybmluZ3Mgd2hlbiBzd2l0Y2hpbmcgdG8gLVdpbXBs
aWNpdC1mYWxsdGhyb3VnaCBidXQgdGhpcwpjaGFuZ2UgbWlnaHQgYmUgZW50aXJlbHkgd3Jvbmcu
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
