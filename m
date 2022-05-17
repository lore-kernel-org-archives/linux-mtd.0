Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A13DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 May 2022 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myv1eKQRkzUg1R0hnt9B5nfaJspehhktWrMeVwBeFv8=; b=nb8RejGzpSBeJ2
	CZ0I6oC21Sc9W/1Lxk6NodpzVz/q0c/uzdDKH6+o1FawbjKnQSS3wrzHt1fx/+e6Mm83wqL/5Wida
	RUxOOQ+/2ZdLF+5J1BjZZxiNZoTpvoyozY6cU8OpTCItBHUUA/ybQ/0lZqltoFWBWxpQzO/E/vBMZ
	T+BwUAUphIb3fNKIf5rhS3iK4Atjuhiqkr1R731jzGSglj78mMQClinIeyPiwzGci8+U393elKPs4
	Qb8EUyWvG4N2QbkFEo6ZedLNshOG7sKybOR7XH8YcXiZCjHTvyXiNyPlS/DeciWj6I/hNV67WUeYp
	jQa+sDZpozZcV8cYs2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqwSM-00DbUL-ES; Tue, 17 May 2022 12:37:42 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqwS6-00DbMX-Tl; Tue, 17 May 2022 12:37:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE49DC000A;
 Tue, 17 May 2022 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652791039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNk04l4NOC/ZJltN0oDjVZ65rbHSyBSEB0Mh7KZb4cs=;
 b=OKixoUAzBr0gjNgzwuuG4zDfpZTtIoGcuyz32KgTQOL5Mfi1xjZ3bxpVMYENvIMfEWjIow
 DuMjb7DygiJTTAKOtK1OZ2Uq97GgnHKuRqV0sHmvATc1wocToGkA7df1t79N2f/Pm45YUh
 Oreu5M87LqSYIjJwhEsON/UF/1iWRVrqxIPfUGzPLbFwFF3OE/SefLKxQsPz2y5fYHMRoO
 ev5RYWF495gBDLTRZnJdXRGA0UKZ7s6oQ5CfYlxlWZfMvfB0S3Z3VuxhpQVfur7qxNFskI
 k5asL+EjpMo2FEvhuDOr+BSajbrGL/n5qOkypWHkEEhBpBbqVXnkuOAJzlwB8Q==
Date: Tue, 17 May 2022 14:37:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <andrew@aj.id.au>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <richard@nod.at>, <joel@jms.id.au>,
 <tudor.ambarus@microchip.com>, <chin-ting_kuo@aspeedtech.com>,
 <linux-aspeed@lists.ozlabs.org>, <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v7 00/11] spi: spi-mem: Convert Aspeed SMC
 driver to spi-mem
Message-ID: <20220517143713.47676b4c@xps-13>
In-Reply-To: <a17b2446-f5a6-d606-8ef4-3931b8bc94da@kaod.org>
References: <20220509175616.1089346-1-clg@kaod.org>
 <165272636363.750911.14933122170662994904.b4-ty@kernel.org>
 <20220517110509.2e6xbwot63yl6a3c@ti.com>
 <a17b2446-f5a6-d606-8ef4-3931b8bc94da@kaod.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_053727_472092_28F61F4D 
X-CRM114-Status: GOOD (  28.50  )
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

SGkgQ8OpZHJpYywKCmNsZ0BrYW9kLm9yZyB3cm90ZSBvbiBUdWUsIDE3IE1heSAyMDIyIDE0OjAz
OjAyICswMjAwOgoKPiBQcmF0eXVzaCwKPiAKPiBPbiA1LzE3LzIyIDEzOjA1LCBQcmF0eXVzaCBZ
YWRhdiB3cm90ZToKPiA+IEhpIENlZHJpYywKPiA+IAo+ID4gT24gMTYvMDUvMjIgMDc6MzlQTSwg
TWFyayBCcm93biB3cm90ZTogIAo+ID4+IE9uIE1vbiwgOSBNYXkgMjAyMiAxOTo1NjowNSArMDIw
MCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6ICAKPiA+Pj4gVGhpcyBzZXJpZXMgYWRkcyBhIG5l
dyBTUEkgZHJpdmVyIHVzaW5nIHRoZSBzcGktbWVtIGludGVyZmFjZSBmb3IgdGhlCj4gPj4+IEFz
cGVlZCBzdGF0aWMgbWVtb3J5IGNvbnRyb2xsZXJzIG9mIHRoZSBBU1QyNjAwLCBBU1QyNTAwIGFu
ZCBBU1QyNDAwCj4gPj4+IFNvQ3MuCj4gPj4+Cj4gPj4+ICAgKiBBU1QyNjAwIEZpcm13YXJlIFNQ
SSBNZW1vcnkgQ29udHJvbGxlciAoRk1DKQo+ID4+PiAgICogQVNUMjYwMCBTUEkgRmxhc2ggQ29u
dHJvbGxlciAoU1BJMSBhbmQgU1BJMikKPiA+Pj4gICAqIEFTVDI1MDAgRmlybXdhcmUgU1BJIE1l
bW9yeSBDb250cm9sbGVyIChGTUMpCj4gPj4+ICAgKiBBU1QyNTAwIFNQSSBGbGFzaCBDb250cm9s
bGVyIChTUEkxIGFuZCBTUEkyKQo+ID4+PiAgICogQVNUMjQwMCBOZXcgU3RhdGljIE1lbW9yeSBD
b250cm9sbGVyIChhbHNvIHJlZmVycmVkIGFzIEZNQykKPiA+Pj4gICAqIEFTVDI0MDAgU1BJIEZs
YXNoIENvbnRyb2xsZXIgKFNQSSkKPiA+Pj4KPiA+Pj4gWy4uLl0gIAo+ID4+Cj4gPj4gQXBwbGll
ZCB0bwo+ID4+Cj4gPj4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2Jyb29uaWUvc3BpLmdpdCBmb3ItbmV4dAo+ID4+Cj4gPj4gVGhhbmtzIQo+ID4+
Cj4gPj4gWzAyLzExXSBkdC1iaW5kaW5nczogc3BpOiBDb252ZXJ0IHRoZSBBc3BlZWQgU01DIGNv
bnRyb2xsZXJzIGRldmljZSB0cmVlIGJpbmRpbmcKPiA+PiAgICAgICAgICBjb21taXQ6IGNlOTg1
OGVhNDk5ZGEwMjU2ODRhN2E1ZjE5ODIzYzJjM2YxNGJkY2UKPiA+PiBbMDMvMTFdIHNwaTogc3Bp
LW1lbTogQ29udmVydCBBc3BlZWQgU01DIGRyaXZlciB0byBzcGktbWVtCj4gPj4gICAgICAgICAg
Y29tbWl0OiA5YzYzYjg0NmU2ZGY0M2U1YjNkMzEyNjNmN2RiNTQ1ZjMyZGVlZGEzCj4gPj4gWzA0
LzExXSBzcGk6IGFzcGVlZDogQWRkIHN1cHBvcnQgZm9yIGRpcmVjdCBtYXBwaW5nCj4gPj4gICAg
ICAgICAgY29tbWl0OiA5ZGEwNmQ3YmRlYzdkYWQ4MDE4YzIzYjE4MGU0MTBlZjJlN2E0MzY3Cj4g
Pj4gWzA1LzExXSBzcGk6IGFzcGVlZDogQWRqdXN0IGRpcmVjdCBtYXBwaW5nIHRvIGRldmljZSBz
aXplCj4gPj4gICAgICAgICAgY29tbWl0OiBiYjA4NGY5NGUxYmNhNGE1YzRmNjg5ZDdhYTliNDEw
MjIwYzFlZDcxCj4gPj4gWzA2LzExXSBzcGk6IGFzcGVlZDogV29ya2Fyb3VuZCBBU1QyNTAwIGxp
bWl0YXRpb25zCj4gPj4gICAgICAgICAgY29tbWl0OiA1Nzg1ZWVkZWU0MmMzNGNmZWM0OTYxOTlh
ODBmYThlYzlkZGNmN2ZlCj4gPj4gWzA3LzExXSBzcGk6IGFzcGVlZDogQWRkIHN1cHBvcnQgZm9y
IHRoZSBBU1QyNDAwIFNQSSBjb250cm9sbGVyCj4gPj4gICAgICAgICAgY29tbWl0OiA1MzUyNmFi
MjdkOWMyNTY1MDRmMjY3NzEzYWVhNjBkYjdhZjE4ZmIwCj4gPj4gWzA4LzExXSBzcGk6IGFzcGVl
ZDogQ2FsaWJyYXRlIHJlYWQgdGltaW5ncwo+ID4+ICAgICAgICAgIGNvbW1pdDogZWVhZWMxZWEw
NWMwZTBmMDhlMDRjNjg0NGYyMGNjMjRhMmZjYzBmNCAgCj4gPiAKPiA+IEkgaGF2ZSByZXBlYXRl
ZGx5IG9iamVjdGVkIHRvIHRoaXMgcGF0Y2ggWzBdWzFdWzJdIGFuZCB5b3UgaGF2ZQo+ID4gcmVw
ZWF0ZWRseSBkZWNpZGVkIHRvIG5vdCBhZGRyZXNzIG15IG9iamVjdGlvbnMuICAgCj4gVGhhdCdz
IGEgdmVyeSBoYXJzaCB3YXkgb2Ygc2F5aW5nIHRoaW5ncy4gSSBkaWQgbm90IGRlY2lkZSBhbnl0
aGluZwo+IG9yIGlnbm9yZSB5b3VyIGNvbW1lbnRzLiBJIGFuc3dlcmVkIHlvdXIgcXVlc3Rpb25z
IGFuZCBhY2tub3dsZWRnZWQKPiB0aGF0IGluZGVlZCB0aGUgcmVhZCB0cmFpbmluZyB3YXMgZG9u
ZSB1bmRlciB0aGUgZGlybWFwIGhhbmRsZXIgYnV0Cj4gdGhpcyB3YXMgbm90IGEgY29uY2VybiB0
b2RheSBzaW5jZSB3ZSBoYWQgYWxsIHRoZSByZXF1aXJlZCBpbmZvcm1hdGlvbgo+IGZyb20gc3Bp
bWVtLgo+IAo+IFdlIHdhaXRlZCBfdG9nZXRoZXJfLCA1IG9yIDYgd2Vla3MsIGZvciBtb3JlIGlu
cHV0cyBvbiBob3cgdG8gYWRkcmVzcwo+IHRoZSBjb25jZXJucyB5b3UgcmFpc2VkIHJlZ2FyZGlu
ZyB0aGUgc3VzdGFpbmFiaWxpdHkgb2YgdGhpcyBtZXRob2QuCj4gCj4gPiBJIHdvbid0IHNwZW5k
IGFueSBtb3JlIHRpbWUgZmlnaHRpbmcgaXQuICAgCj4gVGhpcyBpcyBub3QgYSBmaWdodC4gSSBk
b24ndCBrbm93IHdoeSB5b3UgaW50ZXJwcmV0IGl0IHRoYXQgd2F5Lgo+IAo+IE5vdywgc2luY2Ug
eW91IG9iamVjdCBzbyBleHBsaWNpdGx5LCBhbmQgc2luY2UgdGhpcyBwYXRjaHNldCBoYXMKPiBu
b3QgcmVhY2hlZCB0aGUgTGludXgga2VybmVsIHlldCwgd2Ugc2hvdWxkIGNvbnNpZGVyIGRyb3Bw
aW5nIGl0Lgo+IEkgcmF0aGVyIGRvIHRoYXQgdGhhbiBwdXNoIGNyYXAgaW4gbWFpbmxpbmUuIEJ1
dCB0aGVuLCBwbGVhc2UsCj4gcHJvdmlkZSBzb2x1dGlvbnMgYW5kIG5vdCBvbmx5IG9iamVjdGlv
bnMgIQo+IAo+ID4gQnV0IEkgd2lsbCBzYXkgdGhhdCB5b3Ugc2hvdWxkIG5vdCBleHBlY3QgYW55
Cj4gPiBndWFyYW50ZWVzIHRoYXQgU1BJIE5PUiBvciBTUEkgTkFORCB3aWxsIG5vdCBicmVhayB5
b3VyIGNhbGlicmF0aW9uIGluCj4gPiB0aGUgZnV0dXJlIGlmIHRoZXkgZGVjaWRlIHRvIG1vdmUg
dGhlIGRpcm1hcF9jcmVhdGUoKSBjYWxsIGFyb3VuZC4gIAo+IAo+IElmIHRoYXQncyB0aGUgY2Fz
ZSBvbmUgZGF5LCB3ZSBoYXZlIG11bHRpcGxlIHNvbHV0aW9ucyA6Cj4gCj4gICAgLSBzdG9wIGRv
aW5nIHRoZSB0cmFpbmluZwoKTm90IHJlYWxseSBhbiBvcHRpb24sIGlzbid0IGl0PwoKPiAgICAt
IG1vdmUgdGhlIHRyYWluaW5nIHRvIHRoZSBhcHByb3ByaWF0ZSBoYW5kbGVyIGlmIGl0IGV4aXN0
cwoKU29ycnkgZm9yIGp1bXBpbmcgaW4gc28gbGF0ZSwgYnV0IHdoeSBub3QgdXNpbmcgdGhpcyBz
b2x1dGlvbiBhbHJlYWR5CmlmIHRoZXJlIGFyZSBjb25jZXJucyBhYm91dCB0aGUgY3VycmVudCBs
b2NhdGlvbj8gSXQgZG9lcyBub3QgbG9vayBsaWtlCmEgY29tcGxleCBzb2x1dGlvbiB0byBpbXBs
ZW1lbnQsIGJ1dCBJIG1pZ2h0IGJlIG92ZXJsb29raW5nIHNvbWV0aGluZy4KClRoaXMgY2FuIGFs
c28gYmUgZG9uZSBmb3IgdGhlIG5leHQga2VybmVsIHJlbGVhc2UuCgo+ICAgIC0gdXNlIGEgZGVm
YXVsdCB2YWx1ZQo+ICAgPj4gWzExLzExXSBtdGQ6IHNwaS1ub3I6IGFzcGVlZDogc2V0IHRoZSBk
ZWNvZGluZyBzaXplIHRvIGF0IGxlYXN0IDJNQiBmb3IgQVNUMjYwMAo+ID4+ICAgICAgICAgIGNv
bW1pdDogNzNhZTk3ZTNjYWJiNTgwNjM5ZjAyZjEyYTE5MjMyNGE1M2M0YmViYgo+ID4+ICAKPiA+
IAo+ID4gWzBdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9zcGktZGV2ZWwt
Z2VuZXJhbC9wYXRjaC8yMDIyMDMyNTEwMDg0OS4yMDE5MjA5LTktY2xnQGthb2Qub3JnLwo+ID4g
WzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9zcGktZGV2ZWwtZ2VuZXJh
bC9wYXRjaC8yMDIyMDIxNDA5NDIzMS4zNzUzNjg2LTktY2xnQGthb2Qub3JnLwo+ID4gWzJdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDIwODE5MDYzNi5oNmR1Ymt0a211b3N2ZHhv
QHRpLmNvbS8gIAo+IAo+IFJlZ2FyZHMsCj4gCj4gQ8OpZHJpYy4KCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
