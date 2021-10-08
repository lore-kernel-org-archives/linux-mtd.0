Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5018FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 12:09:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1DA060F92
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 12:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1DA060F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5qHqK1rphr8hegcyT2dtuGhaKZt/kjNvkVsQHtCAMk=; b=053aIrsltV/i2f
	OSnkJ17Q4doMh+9q0egwJF2y/q6J7qEXR1SCcex+CorTfQPGb1G3Cc5cEIb0JxDUz81DlyfGU3qrQ
	GNdruB/lzSj9leweevv8XqZ5mM/kv4D5OsRr/j4NbndZlLFAXHJdYU/4VLwkd1VVCxN+1ZIcd7EAY
	sli5Ff7zZ5waLDOFXT3osjb1HlMJJeeVREt7b6eXdcO8G/8wkFA86PnWXtwCQP8msATDJV0hO5+kq
	J7ecKqr9Ku6du/6WBSC6efNbhsnJiBoPmaknSgyOyu9TJvQN3mOFjygnwoa1AnQdWy7rHZ6UsOWS6
	B9QNtQc20yeq04zC7DTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYofd-002ePy-4j; Fri, 08 Oct 2021 12:08:13 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYofZ-002ePb-Bb
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 12:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1633694881; x=1636286881;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1rsLIXl7Wbj26wZC4BpAZnncVwWc34nE1qBMxdzoVN8=;
 b=o7r5vrzVUBzmtBafAx/U+PSL3rWFfGQ83SGvlGv64gSZ+jpC9bHFQGckVMwsEAKr
 qlZJ35d+7TvUSKHb1mVOPpAK87M6ZxfHwqaVdK2OK6ay4T8v4ZmSwGXye3GW8mNm
 W0kNHTFG0uDA/jQGBYNZG9nJ3XoKe1FuoRyWfvtB/Mk=;
X-AuditID: c39127d2-c275470000001d24-9e-616034a1c839
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 82.49.07460.1A430616;
 Fri,  8 Oct 2021 14:08:01 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 8 Oct
 2021 14:08:01 +0200
Received: from Berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad]) by
 berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad%3]) with mapi id 15.01.2308.014; 
 Fri, 8 Oct 2021 14:08:01 +0200
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "ceggers@arri.de" <ceggers@arri.de>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Thread-Topic: GPMI iMX6ull timeout on DMA
Thread-Index: AQHXuORDG2iX8NfYYEyb/LtFwX8hRavCPp0AgACYioCAAAkTAIAF4dYAgAAk5gA=
Date: Fri, 8 Oct 2021 12:08:01 +0000
Message-ID: <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211004173351.36a66ccb@xps13> <20211004160620.3guajv5vvtfjrl7c@umbrella>
 <2091909.Mh6RI2rZIc@n95hx1g2>
In-Reply-To: <2091909.Mh6RI2rZIc@n95hx1g2>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-ID: <E0C483733464BE49BC5CF3841675F586@phytec.de>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsWyRoChTHehSUKiwY+XihaNvdcZLXa82sJo
 sfBHA7PF7qZl7BanGltZLA6372O1+Lt9E4sDu8faj/dZPY6t2czqMW9NtcemVZ1sHpuX1Hts
 fLeDyaP/r0EAexSXTUpqTmZZapG+XQJXxoWdG1gLHmlU7O+UbGC8o97FyMkhIWAicWnKbHYQ
 W0hgOZNEy7ryLkYuIPsho8T05dtZIRIbGSWau8CK2ARcJD63fWMDsUUE1CUuTPzMDNLALPCY
 SWLinHNMIAlhAQ2JB++PMkMUaUpc3r+cCcL2kzi9czXYIBYBFYkTi86A1fAKuEks+XaOGWLz
 GkaJY5+mgCU4BbQkpr+ZzAJiMwrISnQ2vAMbxCwgLrHp2XdWiBcEJJbsOc8MYYtKvHz8Dyqu
 INHW0wlUzwFUrymxfpc+RKuFxJy2ecwQtqLElO6H7BA3CEqcnPmEZQKj+CwkG2YhdM9C0j0L
 SfcsJN0LGFlXMQrlZiZnpxZlZusVZFSWpCbrpaRuYgRG8eGJ6pd2MPbN8TjEyMTBeIhRgoNZ
 SYQ33z42UYg3JbGyKrUoP76oNCe1+BCjNAeLkjjv/R6mRCGB9MSS1OzU1ILUIpgsEwenVAOj
 7LuOlwXJO48umjWxNvW2Ld+5SD7elI3Bd9nOze76N8sm7+eL81vZRadmaMV8+3knTv9Fzj3Z
 C4vfmQi3zZ9jd3VKNWvjwmeSZ78H126N1FRaomxvrfd61/qizMaAPyvvx7zNyq8q/nizdtaP
 WRP/1m/TyvuVWxrIKVjcd+7W5E+/2ie+DOJ7pcRSnJFoqMVcVJwIAPh4npbQAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_050809_740717_D63477F5 
X-CRM114-Status: GOOD (  30.73  )
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

SGkgQ2hyaXN0aWFuLA0KDQpPbiBGcmksIDIwMjEtMTAtMDggYXQgMTE6NTUgKzAyMDAsIENocmlz
dGlhbiBFZ2dlcnMgd3JvdGU6DQo+ICsgc2V0IFBIWVRFQyBkZXZlbG9wZXJzIG9uIChCKUNDDQo+
IA0KPiBPbiBNb25kYXksIDQgT2N0b2JlciAyMDIxLCAxODowNjoyMCBDRVNULCBIYW4gWHUgd3Jv
dGU6DQo+ID4gQ291bGQgeW91IHBsZWFzZSB0cnkgdG8gYWRkIGNsb2NrIGRpcy9lbmFibGUgd2hl
biBzZXR0aW5nIGNsb2NrIHJhdGUsIGluDQo+ID4gY2FzZQ0KPiA+IGNsb2NrIGdsaXRjaGVzLg0K
PiA+IA0KPiA+IGNsa19kaXNhYmxlX3VucHJlcGFyZShyLT5jbG9ja1swXSk7DQo+ID4gY2xrX3Nl
dF9yYXRlKHItPmNsb2NrWzBdLCBody0+Y2xrX3JhdGUpOw0KPiA+IGNsa19wcmVwYXJlX2VuYWJs
ZShyLT5jbG9ja1swXSk7DQo+ID4gDQo+IA0KPiBXaXRoIHRoaXMgY2hhbmdlLCB3ZSBtYWRlIG92
ZXIgMjAwMCBzdWNjZXNzZnVsIHJlYm9vdHMgd2l0aG91dCBhbnkgR1BNSSBETUENCj4gdGltZW91
dCBwcm9ibGVtcyENCj4gDQo+IEZyb20gUEhZVEVDIChvdXIgQlNQIHN1cHBsaWVyKSwgSSBnb3Qg
c29tZSBwb3NzaWJsZSBiYWNrZ3JvdW5kIGZvciB0aGlzDQo+IHByb2JsZW0uIEZvciBvbGRlciBy
ZXZpc2lvbnMgb2YgSU1YNkRRIHRoZXJlIHdhcyBhbiBlcnJhdGEgKEVSUjAwNzExNywgWzFdKQ0K
PiBpbiB0aGUgUk9NIGJvb3Rsb2FkZXIgd2hpY2ggdHJpZ2dlcnMgYSBzaW1pbGFyIC8gdGhlIHNh
bWUgYmVoYXZpb3I6DQo+IA0KPiA+IEZvciByYXcgTkFORCBib290LCBST00gc3dpdGNoZXMgdGhl
IHNvdXJjZSBvZiBlbmZjX2Nsa19yb290IGZyb20gUExMMl9QRkQyDQo+ID4gdG8gUExMMy4gVGhl
IHJvb3QgY2xvY2sgaXMgcmVxdWlyZWQgdG8gYmUgZ2F0ZWQgYmVmb3JlIHN3aXRjaGluZyB0aGUN
Cj4gPiBzb3VyY2UNCj4gPiBjbG9jay4gSWYgdGhlIHJvb3QgY2xvY2sgaXMgbm90IGdhdGVkLCBj
bG9jayBnbGl0Y2hlcyBtaWdodCBiZSBwYXNzZWQgdG8NCj4gPiB0aGUgZGl2aWRlciB0aGF0IGZv
bGxvd3MgdGhlIGNsb2NrIG11eCwgYW5kIHRoZSBkaXZpZGVyIG1pZ2h0IGJlaGF2ZQ0KPiA+IHVu
cHJlZGljdGFibHkuDQo+ID4gLi4uDQo+ID4gVGhpcyBwcm9ibGVtIGNhbiBhbHNvIG9jY3VyIGVs
c2V3aGVyZSBpbiBhcHBsaWNhdGlvbiBjb2RlIGlmIHRoZSByb290DQo+ID4gY2xvY2sNCj4gPiBp
cyBub3QgcHJvcGVybHkgZ2F0ZWQgd2hlbiB0aGUgY2xvY2sgY29uZmlndXJhdGlvbiBpcyBjaGFu
Z2VkLg0KPiANCj4gSW4gbXkgY2FzZSAoTGludXggYm9vdCBvbiBpLk1YNlVMTCksIEkgcmVjb2du
aXplZCB0aGF0IG9uIHRoZSAzcmQgY2FsbCBvZg0KPiBncG1pX25mY19hcHBseV90aW1pbmdzKCks
IHRoZSByYXRlIG9mIHItPmNsb2NrWzBdIGlzIGNoYW5nZWQgDQo+IA0KPiAtIGZyb206IDIyIE1I
eiAoQ1MyQ0RSOjpFTkZDX0NMS19QUkVEPTYgYW5kIENTMkNEUjo6RU5GQ19DTEtfUE9ERj0zKQ0K
PiAtIHRvOiAgMTAwIE1IeiAoQ1MyQ0RSOjpFTkZDX0NMS19QUkVEPTQgYW5kIENTMkNEUjo6RU5G
Q19DTEtfUE9ERj0xKQ0KPiANCj4gVGhlIHByb3Bvc2FsIGZyb20gZnJvbSBIYW4gWHUNCj4gPiBj
bGtfZGlzYWJsZV91bnByZXBhcmUoci0+Y2xvY2tbMF0pOw0KPiA+IGNsa19zZXRfcmF0ZShyLT5j
bG9ja1swXSwgaHctPmNsa19yYXRlKTsNCj4gPiBjbGtfcHJlcGFyZV9lbmFibGUoci0+Y2xvY2tb
MF0pOw0KPiBkaXNhYmxlcyBvbmx5IENDR1I0OjpDRzE0IFtSQVdOQU5EX1VfR1BNSV9CQ0hfSU5Q
VVRfR1BNSV9JT19DTEtfRU5BQkxFXQ0KPiBkdXJpbmcNCj4gdGhlIHJhdGUgY2hhbmdlLiBXaGls
ZSB0aGlzIHdvcmtzIHZlcnkgZmluZSBvbiBteSBzeXN0ZW0sIHRoaXMgcHJvYmFibHkNCj4gZG9l
c24ndA0KPiBmdWxmaWxsIHRoZSByZXF1aXJlbWVudHMgaW4gdGhlIGVycmF0YSBkZXNjcmlwdGlv
bjoNCj4gDQo+ID4gRm9yIG90aGVyIG9jY3VycmVuY2VzIGluIGFwcGxpY2F0aW9uIGNvZGUsIHRo
ZSBmb2xsb3dpbmcgcHJvY2VkdXJlIHNob3VsZA0KPiA+IGJlDQo+ID4gZm9sbG93ZWQgdG8gY2hh
bmdlIHRoZSBjbG9jayBjb25maWd1cmF0aW9uIGZvciB0aGUgZW5mY19jbGtfcm9vdDoNCj4gPiAx
KSBHYXRlIChkaXNhYmxlKSB0aGUgR1BNSS9CQ0ggY2xvY2tzIGluIHJlZ2lzdGVyIENDTV9DQ0dS
NC4NCj4gPiAyKSBHYXRlIChkaXNhYmxlKSB0aGUgZW5mY19jbGtfcm9vdCBiZWZvcmUgY2hhbmdp
bmcgdGhlIGVuZmNfY2xrX3Jvb3QNCj4gPiBzb3VyY2UNCj4gPiAgICBvciBkaXZpZGVycyBieSBj
bGVhcmluZyBDQ01fQ0NHUjJbQ0c3XSB0byAy4oCZYjAwLiBUaGlzIGRpc2FibGVzIHRoZQ0KPiA+
ICAgIGlvbXV4X2lwdF9jbGtfaW9fY2xrLg0KPiA+IDMpIENvbmZpZ3VyZSBDQ01fQ1MyQ0RSIGZv
ciB0aGUgbmV3IGNsb2NrIHNvdXJjZSBjb25maWd1cmF0aW9uLg0KPiA+IDQpIEVuYWJsZSBlbmZj
X2Nsa19yb290IGJ5IHNldHRpbmcgQ0NNX0NDR1IyW0NHN10gdG8gMuKAmWIxMS4gVGhpcyBlbmFi
bGVzDQo+ID4gdGhlDQo+ID4gICAgaW9tdXhfaXB0X2Nsa19pb19jbGsuDQo+ID4gNSkgRW5hYmxl
IHRoZSBHUE1JL0JDSCBjbG9ja3MgaW4gcmVnaXN0ZXIgQ0NNX0NDR1I0DQo+IA0KPiBJIGdvdCBh
bm90aGVyIHNvbHV0aW9uIGZyb20gUEhZVEVDIChbMl0sIG5vdCBsZW5ndGh5IHRlc3RlZCB5ZXQp
LCB3aGljaA0KPiBkaXNhYmxlcyBhbGwgR1BNSS9CQ0ggY2xvY2tzIG9uIENDR1I0ICh2ZXJpZmll
ZCB3aXRoIGEgSlRBRyBkZWJ1Z2dlcik6DQo+IC0gQ0NHUjQ6OkNHMTUgIFtSQVdOQU5EX1VfR1BN
SV9JTlBVVF9BUEJfQ0xLX0VOQUJMRV0NCj4gLSBDQ0dSNDo6Q0cxNCAgW1JBV05BTkRfVV9HUE1J
X0JDSF9JTlBVVF9HUE1JX0lPX0NMS19FTkFCTEVdDQo+IC0gQ0NHUjQ6OkNHMTMgIFtSQVdOQU5E
X1VfR1BNSV9CQ0hfSU5QVVRfQkNIX0NMS19FTkFCTEVdDQo+IC0gQ0NHUjQ6OkNHMTIgIFtSQVdO
QU5EX1VfQkNIX0lOUFVUX0FQQl9DTEtfRU5BQkxFXQ0KPiAtIENDR1I0OjpDRzYgICBbUEwzMDFf
TVg2UVBFUjFfQkNIQ0xLX0VOQUJMRV0NCj4gDQo+IENDTV9DQ0dSMltDRzddIGlzIHVzZWQgZm9y
IElPTVVYX0lQVF9DTEtfSU9fRU5BQkxFIG9uIGkuTVg2VUxMLCBzbyBzdGVwIDIuDQo+IHNlZW1z
IG5vdCB0byBhcHBseSBoZXJlLiBBY3R1YWxseSBJIGRvbid0IGtub3cgaG93IHRvIGdhdGUgRU5G
Q19DTEtfUk9PVC4NCj4gDQo+IEkgd2lsbCBjeWNsaWMgdGVzdCB0aGUgc29sdXRpb24gZnJvbSBQ
SFlURUMgb3ZlciB0aGUgd2Vla2VuZC4NCj4gDQo+IEBIYW4gWHU6IFNob3VsZCBJIHByZWZlciB0
aGUgc29sdXRpb24gZnJvbSBQSFlURUM/DQo+IEBTdGVmYW4gUmllZG11ZWxsZXI6IEFyZSB5b3Ug
d2lsbGluZyB0byBjb21taXQgdGhpcyB1cHN0cmVhbT8NCg0KWWVzIHN1cmUsIEkgY2FuIHByZXBh
cmUgYSBwYXRjaCBiZWdpbm5pbmcgb2YgbmV4dCB3ZWVrLg0KQlRXLCB3ZSBoYXZlIHNlZW4gdGhl
c2UgRE1BIHRpbWVvdXQgaXNzdWVzIG9uIHRoZSBpLk1YNiBTT0NzIGFzIHdlbGwuIFNvIHRoaXMN
CmZpeCBpcyBub3Qgb25seSBmb3IgdGhlIGkuTVggNlVMTC4NCg0KUmVnYXJkcywNClN0ZWZhbg0K
DQo+IA0KPiByZWdhcmRzDQo+IENocmlzdGlhbg0KPiANCj4gDQo+IFsxXSBodHRwczovL3d3dy5u
eHAuY29tL2RvY3MvZW4vZXJyYXRhL0lNWDZEUUNFLnBkZg0KPiBbMl0gDQo+IGh0dHBzOi8vZ2l0
LnBoeXRlYy5kZS9saW51eC1tYWlubGluZS9jb21taXQvP2g9djUuMTAuNDgtcGh5JmlkPTg2Njkz
OWVhODExMDc2NGQ5YzEyYWY5NjBkNzQ2ZTJmN2Y1ZGViZTMNCj4gDQo+IA0KPiANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
