Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40BDC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 06:27:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FDE613B0
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 06:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FDE613B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jsjUfMxjnDGsmPM+uofpzwwaVoNfTCAij1FR7KpAAJg=; b=ovYR2K+YvSpDMhrCFxJrx56nt
	BNV8o3YUkk+fS+ErdaH7IrvmwUhYVf8eOclArK6LHtvRrdas2WvA7EwqkUGlOxHZ8rx4bEePHc2Jq
	wjN+FEiyAlHMPsjDhcOHjivCA8y/dXXeSXX+DTGJQSJqU4hSKsH/7RuKxckay73wVINHxmdpbUw9c
	1JhwAdfAQUQi4iZ0ShWnVztg1KEoi/PtG+3Vul4LFGGDFzaJrNxGQOLpWhJtRPuynQXSPWqGxr171
	I9Jh2uiC99QldQyKxUK68CTaCDLtezJRS4DtxoQNAiHYaZcZXfiqOSUvhpyrmdT5s8UbvkycAr1b7
	4StCRO3XA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYjpx-00BLIK-Li; Tue, 20 Apr 2021 06:26:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjpv-00BLHq-8M
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 06:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Description;
 bh=SrU46qDDYLwkBvgTATl3efNizRVAxtPcf0M1aLn3sFA=; b=1NeYL6Uv0PdxfW8/wzfqkLAFFF
 ldO5W0xk0s51lcdlzALCWQWYnyLlfLxZZO6kah2EEOw0wndul7YFzyen2zkX/B/H1woJ5Uy30ctJA
 UvgCHEqWF+KNVm1pI3vkLUCfT2NfA76nwanRi7sUNF4HJ73gJK6oxTOv0+j14iMgq8W0zLjFeW1Nx
 3sssTiYButpWA0oQxrYVSs2u7OOFrTm2Nu0hr7wwZR+w4Qc0KLy3v5FXVARl2xWAlrWSRyooOdccG
 uNRCWNcuAVhrgzpttdV4w8UL+WrKUsO6/kcp0347/iPYr/FtIX5GjqTJOj24qQcZHhRoKr188OiV0
 0pxKXe4Q==;
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjpp-00BqTt-ST
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 06:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1618899966; x=1621491966;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SrU46qDDYLwkBvgTATl3efNizRVAxtPcf0M1aLn3sFA=;
 b=d46DgHNzL1PLPFop8cYlEJGbNhQVJkVksUo1RF1q8SdWaVuie+v17ni6uwxIOIiV
 y/PDFqlhmKD2Oz/NG5Db1m3MdOwpXneVbdmYHYF8JGsZ/7PR7am/zINC1+NQf6PI
 nFDJCHHQQLtF0qSFK0H+VDJP38c3enl5CGbc4rgPOnE=;
X-AuditID: c39127d2-324b870000001c53-20-607e73fd939d
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1B.1C.07251.DF37E706;
 Tue, 20 Apr 2021 08:26:05 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 20 Apr
 2021 08:26:05 +0200
Received: from Berlix.phytec.de ([fe80::343f:7618:c7ce:97c9]) by
 berlix.phytec.de ([fe80::343f:7618:c7ce:97c9%3]) with mapi id 15.01.2176.009; 
 Tue, 20 Apr 2021 08:26:05 +0200
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
CC: "festevam@gmail.com" <festevam@gmail.com>,
 "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: imx27: No space left to write bad block table
Thread-Topic: imx27: No space left to write bad block table
Thread-Index: AQHXM6LunontHq9bc0Oo8H4U64SrGaq7RC0AgABWswCAAArzAIAAClOAgAAqfACAAPimgA==
Date: Tue, 20 Apr 2021 06:26:05 +0000
Message-ID: <13112dfe42b99e0c5ef340d9382bb76014bb870c.camel@phytec.de>
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <b6c62efc5b24bc0e04f222095573285f0c977216.camel@phytec.de>
 <20210419173608.434f4b8d@xps13>
In-Reply-To: <20210419173608.434f4b8d@xps13>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-ID: <E121B311575A164B88EE4A7517A00C3F@phytec.de>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsWyRoChTPdvcV2CwfyTNhYPr/pbvPm0mNli
 1dSdLBa7m5axWxxu38fqwOoxb021x467Sxg9ds66y+6xeUm9R/9fgwDWKC6blNSczLLUIn27
 BK6M318ushVcMKx492wrewPjGoMuRk4OCQETiReNu9m7GLk4hASWM0nsfvKYFSQhJPCQUWLX
 ETuIxCZGiUkrT4El2ARcJD63fWMDsUUErCXubNnLClLELPCCUeLE8S+MIAlhASuJm1vWMMIU
 Hf/3hxnCDpP4cGcimM0ioCrx+/NjMJtXwE1iw9+prBDb9jNJLDy3hwUkwSmgIzF97l6wzYwC
 shKdDe+YQGxmAXGJTc++s0L8ICCxZM95ZghbVOLl439QcQWJtp5OoHoOoHpNifW79CFaLSTa
 Tlxlg7AVJaZ0P2SHuEFQ4uTMJywTGMVnIdkwC6F7FpLuWUi6ZyHpXsDIuopRKDczOTu1KDNb
 ryCjsiQ1WS8ldRMjMD4PT1S/tIOxb47HIUYmDsZDjBIczEoivPdraxKEeFMSK6tSi/Lji0pz
 UosPMUpzsCiJ827gLQkTEkhPLEnNTk0tSC2CyTJxcEo1MEZ5VeZ7ud5+43hQ0aV9xivd168O
 dgh5fdTwrHhlzL9XfNFb3eWHzlpwmXS8XmJ/dp2f8KNPijPT59pvSNyta8DrPu/Pz7eFHfJ6
 03peTGRru+PsliSssOlLq+OK/MsFzxpV6jis7zXOjWfcXTU7OrSau/hnbXPKv/hgNf2ORfaN
 zR0hy8p5lFiKMxINtZiLihMBSiZFhr0CAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_232610_093626_DB8BE935 
X-CRM114-Status: GOOD (  44.68  )
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

SGkgTWlxdWVsLA0KDQpPbiBNb24sIDIwMjEtMDQtMTkgYXQgMTc6MzYgKzAyMDAsIE1pcXVlbCBS
YXluYWwgd3JvdGU6DQo+IEhpIFN0ZWZhbiwNCj4gDQo+ID4gPiBJbnRlcmVzdGluZy4gTWF5YmUg
SSBvdmVybG9va2VkIHRoZSBiZWxvdyBjb21taXQgd2hlbiBhcHBseWluZy4gSW5kZWVkLA0KPiA+
ID4gQkJUIG1heSBiZSBjb25zaWRlcmVkIGFzIGJhZCBibG9ja3MsIHNvIEkgd29uZGVyIGlmIHRo
ZSBiZWxvdyBjaGFuZ2UgaXMNCj4gPiA+IHZhbGlkIG5vdy4uLg0KPiA+ID4gDQo+ID4gPiBHdWls
bGF1bWUsIHdvdWxkIHlvdSBoYXZlIGEgd2F5IHRvIHJldmVydCB0aGlzIHBhdGNoIG9uIHRvcCBv
Zg0KPiA+ID4gbGludXgtbmV4dD8gU3RlZmFuLCB3b3VsZCB5b3UgbWluZCBnaXZpbmcgbW9yZSBk
ZXRhaWxzIG9uIHRoZSB0ZXN0aW5nDQo+ID4gPiBwcm9jZWR1cmU/ICANCj4gPiANCj4gPiBJIGhh
dmUgdGVzdGVkIHRoaXMgb24gYW4gaS5NWCA2IGJ5IHNpbXVsYXRpbmcgdHdvIGJhZCBCQlQgYmxv
Y2tzIGJ5IHNpbXBseQ0KPiA+IHJldHVybmluZyAtRUlPIGluIG5hbmRfZXJhc2VfbmFuZCB3aGVu
IHRoZSBibG9jayB0byBiZSBlcmFzZWQgaXMgb25lIG9mDQo+ID4gdGhlDQo+ID4gZmlyc3QgdHdv
IEJCVCBibG9ja3MuDQo+ID4gDQo+ID4gSSBoYXZlIHNlZW4gdGhpcyBvbmNlIG9uIGEgY3VzdG9t
ZXIgYm9hcmQgYnV0IHdlcmUgbm90IGFibGUgdG8gcmVwcm9kdWNlDQo+ID4gaXQNCj4gPiBhbnlt
b3JlLCB0aHVzIHRoZSBzaW11bGF0aW9uIG9mIHRoZSB0d28gYmFkIGJsb2Nrcy4NCj4gPiANCj4g
PiBXaXRob3V0IHRoZSBwYXRjaCBiZWxvdyBuZXcgdmVyc2lvbnMgb2YgdGhlIEJCVCBjYW4gbm8g
bG9uZ2VyIGJlIHdyaXR0ZW4NCj4gPiB0bw0KPiA+IHRoZSBmaXJzdCB0d28gYmxvY2tzIHJlc2Vy
dmVkIGZvciB0aGUgQkJUIGJ1dCB0aGV5IGFyZSBzdGlsbCBldmFsdWF0ZWQgdG8NCj4gPiByZWFk
DQo+ID4gdGhlIEJCVCBmcm9tIGR1cmluZyBib290IGR1ZSB0aGUgbGFjayBvZiBhIHRlc3QgaWYg
dGhlc2UgYmxvY2tzIGFyZSBiYWQuDQo+ID4gU28NCj4gPiBjaGFuZ2VzIHRvIHRoZSBCQlQgYWZ0
ZXIgdGhlc2UgdHdvIGJsb2NrcyB0dXJuIGJhZCBhcmUgb25seSBrZXB0IGFuZCB1c2VkDQo+ID4g
dW50aWwgdGhlIG5leHQgcmVib290IHdoZXJlIGFnYWluIHRoZSBvbGQgdmVyc2lvbiBvZiB0aGUg
dHdvIHdvcm4gYmxvY2tzDQo+ID4gaXMNCj4gPiB1c2VkIGFzIGEgYmFzaXMuDQo+ID4gDQo+ID4g
SSB0cmllZCB0byB1c2UgdGhlIHNhbWUgbWVjaGFuaXNtIHRoYXQgaXMgdXNlZCB0byBpZGVudGlm
eSBiYWQgYmxvY2tzDQo+ID4gZHVyaW5nIGENCj4gPiBzY2FuIGZvciBiYWQgYmxvY2tzLiBCdXQg
bWF5YmUgSSBtaXNzZWQgc29tZXRoaW5nIHRoZXJlPyBPciB3ZXJlIG15DQo+ID4gYXNzdW1wdGlv
bnMgd3JvbmcgaW4gdGhlIGZpcnN0IHBsYWNlPw0KPiANCj4gSG9uZXN0bHkgSSBkb24ndCBrbm93
IHdoYXQgaXMgd3JvbmcgZXhhY3RseSBpbiB0aGlzIHBhdGNoLg0KPiANCj4gV2Ugd2lsbCByZXZl
cnQgdGhlIGNvbW1pdCBhcyBpdCBjbGVhcmx5IGJyZWFrcyBzb21ldGhpbmcgZnVuZGFtZW50YWwN
Cj4gYW5kIHRoZSBtZXJnZSB3aW5kb3cgaXMgdG9vIGNsb3NlIHRvIGFkb3B0IGEgaGFja2lzaCBh
dHRpdHVkZS4NCj4gDQo+IEkgd291bGQgcHJvcG9zZSB0aGUgZm9sbG93aW5nIHRlc3RzIHdpdGgg
eW91ciBib2FyZDoNCj4gLSBIYWNrIHRoZSBjb3JlIHRvIGFsbG93IHlvdXJzZWxmIHRvIGFjY2Vz
cyBiYWQgYmxvY2tzIGZyb20gdXNlcnNwYWNlDQo+ICAgZm9yIHRlc3RpbmcgcHVycG9zZXMuDQo+
IC0gV2l0aCB0aGUgYmVsb3cgY29tbWl0LCB5b3Ugc2hvdWxkIGhhdmUgdGhlIHNhbWUgYmVoYXZp
b3IgdGhhbg0KPiAgIHJlcG9ydGVkIGJ5IEZhYmlvLg0KPiAtIFJldmVydCB0aGUgY29tbWl0Lg0K
PiAtIE1hbnVhbGx5IGNoYW5nZSB0aGUgYmFkIGJsb2NrIG1hcmtlcnMgKG5hbmRkdW1wLCBmbGFz
aF9lcmFzZSwNCj4gICBuYW5kd3JpdGUpIHRvIGRlY2xhcmUgdGhlIHR3byB0YWJsZXMgYmFkLiBS
ZWJvb3QgYW5kIG9ic2VydmUgaWYgdGhlcmUNCj4gICBhcmUgYW55IGlzc3Vlcy4gWW91IGNhbiB0
cnkgdG8gd29yayBmcm9tIHRoZXJlLg0KDQpUaGFua3MgZm9yIHRoZSBpbnB1dCEgSSB3aWxsIGZv
bGxvdyB5b3VyIHN1Z2dlc3Rpb25zIGFuZCBsZXQgeW91IGd1eXMga25vdyBteQ0KZmluZGluZ3Mu
DQoNClJlZ2FyZHMsDQpTdGVmYW4NCg0KPiANCj4gPiA+IC0tLTg8LS0tDQo+ID4gPiANCj4gPiA+
IGNvbW1pdCBiZDljOWZlMmFkMDQ1NDY5NDBmNGE5OTc5ZDY3OWU2MmNhZTZhYTUxDQo+ID4gPiBB
dXRob3I6IFN0ZWZhbiBSaWVkbXVlbGxlciA8cy5yaWVkbXVlbGxlckBwaHl0ZWMuZGU+DQo+ID4g
PiBEYXRlOiAgIFRodSBNYXIgMjUgMTE6MjM6MzcgMjAyMSArMDEwMA0KPiA+ID4gDQo+ID4gPiAg
ICAgbXRkOiByYXduYW5kOiBiYnQ6IFNraXAgYmFkIGJsb2NrcyB3aGVuIHNlYXJjaGluZyBmb3Ig
dGhlIEJCVCBpbg0KPiA+ID4gTkFORA0KPiA+ID4gICAgIA0KPiA+ID4gICAgIFRoZSBibG9ja3Mg
Y29udGFpbmluZyB0aGUgYmFkIGJsb2NrIHRhYmxlIGNhbiBiZWNvbWUgYmFkIGFzIHdlbGwuIFNv
DQo+ID4gPiAgICAgbWFrZSBzdXJlIHRvIHNraXAgYW55IGJsb2NrcyB0aGF0IGFyZSBtYXJrZWQg
YmFkIHdoZW4gc2VhcmNoaW5nIGZvcg0KPiA+ID4gdGhlDQo+ID4gPiAgICAgYmFkIGJsb2NrIHRh
YmxlLg0KPiA+ID4gICAgIA0KPiA+ID4gICAgIE90aGVyd2lzZSBpbiB2ZXJ5IHJhcmUgY2FzZXMg
d2hlcmUgdHdvIEJCVCBibG9ja3Mgd2VhciBvdXQgaXQgbWlnaHQNCj4gPiA+ICAgICBoYXBwZW4g
dGhhdCBhbiBvYnNvbGV0ZSBCQlQgaXMgdXNlZCBpbnN0ZWFkIG9mIGEgbmV3ZXIgYXZhaWxhYmxl
DQo+ID4gPiAgICAgdmVyc2lvbi4NCj4gPiA+ICAgICANCj4gPiA+ICAgICBTaWduZWQtb2ZmLWJ5
OiBTdGVmYW4gUmllZG11ZWxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPg0KPiA+ID4gICAg
IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
DQo+ID4gPiAgICAgTGluazogDQo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
dGQvMjAyMTAzMjUxMDIzMzcuNDgxMTcyLTEtcy5yaWVkbXVlbGxlckBwaHl0ZWMuZGUNCj4gPiA+
IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmJ0LmMNCj4g
PiA+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYw0KPiA+ID4gaW5kZXggZGNlZDMy
YTEyNmQ5Li42ZTI1YTVjZTViYTkgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2JidC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Ji
dC5jDQo+ID4gPiBAQCAtNTI1LDYgKzUyNSw3IEBAIHN0YXRpYyBpbnQgc2VhcmNoX2JidChzdHJ1
Y3QgbmFuZF9jaGlwICp0aGlzLA0KPiA+ID4gdWludDhfdA0KPiA+ID4gKmJ1ZiwNCj4gPiA+ICB7
DQo+ID4gPiAgICAgICAgIHU2NCB0YXJnZXRzaXplID0gbmFuZGRldl90YXJnZXRfc2l6ZSgmdGhp
cy0+YmFzZSk7DQo+ID4gPiAgICAgICAgIHN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19t
dGQodGhpcyk7DQo+ID4gPiArICAgICAgIHN0cnVjdCBuYW5kX2JidF9kZXNjciAqYmQgPSB0aGlz
LT5iYWRibG9ja19wYXR0ZXJuOw0KPiA+ID4gICAgICAgICBpbnQgaSwgY2hpcHM7DQo+ID4gPiAg
ICAgICAgIGludCBzdGFydGJsb2NrLCBibG9jaywgZGlyOw0KPiA+ID4gICAgICAgICBpbnQgc2Nh
bmxlbiA9IG10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOw0KPiA+ID4gQEAgLTU2MCw2ICs1
NjEsMTAgQEAgc3RhdGljIGludCBzZWFyY2hfYmJ0KHN0cnVjdCBuYW5kX2NoaXAgKnRoaXMsDQo+
ID4gPiB1aW50OF90DQo+ID4gPiAqYnVmLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
aW50IGFjdGJsb2NrID0gc3RhcnRibG9jayArIGRpciAqIGJsb2NrOw0KPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgbG9mZl90IG9mZnMgPSAobG9mZl90KWFjdGJsb2NrIDw8IHRoaXMtICAN
Cj4gPiA+ID4gYmJ0X2VyYXNlX3NoaWZ0OyAgDQo+ID4gPiAgDQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAvKiBDaGVjayBpZiBibG9jayBpcyBtYXJrZWQgYmFkICovDQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoc2Nhbl9ibG9ja19mYXN0KHRoaXMsIGJkLCBvZmZzLCBi
dWYpKQ0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4g
PiA+ICsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFJlYWQgZmlyc3QgcGFnZSAq
Lw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgc2Nhbl9yZWFkKHRoaXMsIGJ1Ziwgb2Zm
cywgbXRkLT53cml0ZXNpemUsIHRkKTsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlm
ICghY2hlY2tfcGF0dGVybihidWYsIHNjYW5sZW4sIG10ZC0+d3JpdGVzaXplLA0KPiA+ID4gdGQp
KSB7DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gTWlxdcOobCAgDQo+IA0K
PiBUaGFua3MsDQo+IE1pcXXDqGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
