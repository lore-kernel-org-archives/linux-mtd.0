Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D284AC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 02:49:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E8AC61369
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 02:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E8AC61369
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:Cc:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=beuZYa5wxrEH8Pqk+Pv5nUHchsGrklL+6IjJYUybtVk=; b=hc3Bx7NcBqsIXcK2gRF7sdpt2
	rsZr3E8evgBe4KcuRh8PJ91NWs2xvDaMyX8bgM2e87fZs+FhMEHkPKtfzYuRweA9IxaE6T/8xv10P
	vCq33muvmc6l0CsGWO2f7f4DVjXHs8agRlKoIt6ApwhMofr60iNUWAu65LF9W42qOI6fvjMYLUHdS
	3nuOCPEHV/s3ero4pITECnW+xnin5VFPSMpya5qU1AuW9n+AialY6Bi8UoabgTB3/kKgJW5Y5aJ0l
	AV75UXjDhkISGamkugNOUaczvfsG4AZXkb+mp68F20mE7xovR6qWM8iNO/NOeawyReSPB5sgHWSBE
	5u1cJOMWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lipmD-00Gldg-K9; Tue, 18 May 2021 02:48:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lipmA-00GldI-BD
 for linux-mtd@desiato.infradead.org; Tue, 18 May 2021 02:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Date:From:Message-ID:MIME-Version:Subject:Cc:To:References:
 In-Reply-To:Sender:Reply-To:Content-ID:Content-Description;
 bh=rV0CD3JHiyUVSvY7udOoPdit2fRKie3txFGbXuiLKyk=; b=10EfczOVaiCIrzxjotj8B7pqyc
 bMWwoX7g84Ynn3uhL5jZd0/VBAmcT7Yj3OtvQsuIwq9oWLwmO6Mtl61VaPpSsRrqsjvylm5rbc7wm
 N0SYzbvU2icelRNUDv9fShi64JOcofZwc0V4/tNAX20Sm/XVC7K/slU3Hv83aqrXTeVo/t3r3NEbD
 7jfJDNmkVaZunkaaLdgQvLF/Smp0bJlWNerXdU39/q0sWmJkGfgQXApDbP1VVYPonEXESvzZV1So5
 EPEteCGi/3VjEZFLyxgyh8FXIDvMkAQjnM0AC7bikspBctfFRHgSCOivjBfS85qlS0AkeoVwUg6GI
 a4hF49Yw==;
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lipm6-00EHBu-D6
 for linux-mtd@lists.infradead.org; Tue, 18 May 2021 02:48:04 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 14I2laUE098161;
 Tue, 18 May 2021 10:47:36 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id B9839244289B2471891F;
 Tue, 18 May 2021 10:47:36 +0800 (CST)
In-Reply-To: <20210517160628.s65h6prjt5mw6bud@ti.com>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-3-git-send-email-zhengxunli@mxic.com.tw>
 <20210517160628.s65h6prjt5mw6bud@ti.com>
To: "Pratyush Yadav" <p.yadav@ti.com>
Cc: broonie@kernel.org, jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org, 
 linux-spi@vger.kernel.org, miquel.raynal@bootlin.com,
 tudor.ambarus@microchip.com
Subject: Re: [PATCH v5 2/2] spi: mxic: patch for octal DTR mode support
MIME-Version: 1.0
X-KeepSent: 3240723E:EAE563CF-482586D9:000E8308;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF3240723E.EAE563CF-ON482586D9.000E8308-482586D9.000F5865@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Tue, 18 May 2021 10:47:36 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/05/18 AM 10:47:36,
 Serialize complete at 2021/05/18 AM 10:47:36
X-MAIL: TWHMLLG4.macronix.com 14I2laUE098161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_194802_714523_B3F4BE5F 
X-CRM114-Status: GOOD (  15.30  )
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
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksDQoNCiJQcmF0eXVzaCBZYWRhdiIgPHAueWFkYXZAdGkuY29tPiB3cm90ZSBvbiAyMDIxLzA1
LzE4IKRXpMggMTI6MDY6MzA6DQoNCj4gIlByYXR5dXNoIFlhZGF2IiA8cC55YWRhdkB0aS5jb20+
IA0KPiAyMDIxLzA1LzE4IKRXpMggMTI6MDYNCj4gDQo+IFRvDQo+IA0KPiAiWmhlbmd4dW4gTGki
IDx6aGVuZ3h1bmxpQG14aWMuY29tLnR3PiwgDQo+IA0KPiBjYw0KPiANCj4gPGxpbnV4LW10ZEBs
aXN0cy5pbmZyYWRlYWQub3JnPiwgPGxpbnV4LXNwaUB2Z2VyLmtlcm5lbC5vcmc+LCANCj4gPHR1
ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4sIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwg
DQo+IDxicm9vbmllQGtlcm5lbC5vcmc+LCA8amFpbWVsaWFvQG14aWMuY29tLnR3Pg0KPiANCj4g
U3ViamVjdA0KPiANCj4gUmU6IFtQQVRDSCB2NSAyLzJdIHNwaTogbXhpYzogcGF0Y2ggZm9yIG9j
dGFsIERUUiBtb2RlIHN1cHBvcnQNCj4gDQo+IE9uIDE3LzA1LzIxIDAyOjE0UE0sIFpoZW5neHVu
IExpIHdyb3RlOg0KPiA+IERyaXZlciBwYXRjaCBmb3Igb2N0YWwgRFRSIG1vZGUgc3VwcG9ydC4N
Cj4gPiANCj4gPiBPd2luZyB0byB0aGUgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgaXMg
bm90IHN1cHBvcnQgZHRyDQo+ID4gb3BlcmF0aW9uLiBCYXNlZCBvbiBQcmF0eXVzaCBwYXRjaCAi
c3BpOiBzcGktbWVtOiBhZGQgc3BpX21lbV9kdHINCj4gDQo+IEkgZG9uJ3QgbGlrZSB0aGUgIkJh
c2VkIG9uIFByYXR5dXNoIHBhdGNoIi4gUGxlYXNlIG1lbnRpb24gdGhlIGNvbW1pdCANCj4gaGFz
aCBzbyBpdCBpcyBtdWNoIGVhc2llciB0byBmaW5kIGxhdGVyLiBGb3IgZXhhbXBsZSwgc2F5aW5n
IGJhc2VkIG9uIA0KPiBjb21taXQgNTM5Y2Y2OGNkNTFiIChzcGk6IHNwaS1tZW06IGFkZCBzcGlf
bWVtX2R0cl9zdXBwb3J0c19vcCgpLCANCj4gMjAyMS0wMi0wNCkgaXMgbXVjaCBiZXR0ZXIuDQo+
IA0KPiBCdXQgd2hpbGUgd2UgYXJlIG9uIHRoaXMgdG9waWMsIEkgZG9uJ3QgdGhpbmsgaXQgaXMg
bmVlZGVkIGFsbCB0aGF0IA0KPiBtdWNoLiBQZW9wbGUgdXNlIHByZS1leGlzdGluZyBBUElzIGFs
bCB0aGUgdGltZS4gSSBkb24ndCBzZWUgYW55IG5lZWQgdG8gDQoNCj4gc3BlY2lmaWNhbGx5IHBv
aW50IGl0IG91dC4gIFNvIEkgdGhpbmsgc2F5aW5nICJDYWxsIA0KPiBzcGlfbWVtX2R0cl9zdXBw
b3J0c19vcCgpIHRvIC4uLiIgaXMgYmV0dGVyLg0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlv
bi4NCiANCj4gPiBfc3VwcG9ydHNfb3AoKSIgYWRkIHNwaV9tZW1fZHRyX3N1cHBvcnRzX29wKCkg
dG8gc3VwcG9ydCBkdHIgYW5kDQo+ID4ga2VlcCBjaGVja2luZyB0aGUgYnVzd2lkdGggYW5kIGNv
bW1hbmQgYnl0ZXMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWmhlbmd4dW4gTGkgPHpoZW5n
eHVubGlAbXhpYy5jb20udHc+DQo+ID4gLS0tDQoNClRoYW5rcywNClpoZW5neHVuDQoNCg0KQ09O
RklERU5USUFMSVRZIE5PVEU6DQoNClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5
IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIA0KYW5kL29yIHBlcnNvbmFsIGRhdGEs
IHdoaWNoIGlzIHByb3RlY3RlZCBieSBhcHBsaWNhYmxlIGxhd3MuIFBsZWFzZSBiZSANCnJlbWlu
ZGVkIHRoYXQgZHVwbGljYXRpb24sIGRpc2Nsb3N1cmUsIGRpc3RyaWJ1dGlvbiwgb3IgdXNlIG9m
IHRoaXMgZS1tYWlsIA0KKGFuZC9vciBpdHMgYXR0YWNobWVudHMpIG9yIGFueSBwYXJ0IHRoZXJl
b2YgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgDQp0aGlzIGUtbWFpbCBpbiBlcnJvciwg
cGxlYXNlIG5vdGlmeSB1cyBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIHRoaXMgbWFpbCBhcyANCndl
bGwgYXMgaXRzIGF0dGFjaG1lbnQocykgZnJvbSB5b3VyIHN5c3RlbS4gSW4gYWRkaXRpb24sIHBs
ZWFzZSBiZSANCmluZm9ybWVkIHRoYXQgY29sbGVjdGlvbiwgcHJvY2Vzc2luZywgYW5kL29yIHVz
ZSBvZiBwZXJzb25hbCBkYXRhIGlzIA0KcHJvaGliaXRlZCB1bmxlc3MgZXhwcmVzc2x5IHBlcm1p
dHRlZCBieSBwZXJzb25hbCBkYXRhIHByb3RlY3Rpb24gbGF3cy4gDQpUaGFuayB5b3UgZm9yIHlv
dXIgYXR0ZW50aW9uIGFuZCBjb29wZXJhdGlvbi4NCg0KTWFjcm9uaXggSW50ZXJuYXRpb25hbCBD
by4sIEx0ZC4NCg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQoNCg0KDQo9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQoNCkNP
TkZJREVOVElBTElUWSBOT1RFOg0KDQpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1h
eSBjb250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBhbmQvb3IgcGVyc29uYWwgZGF0YSwg
d2hpY2ggaXMgcHJvdGVjdGVkIGJ5IGFwcGxpY2FibGUgbGF3cy4gUGxlYXNlIGJlIHJlbWluZGVk
IHRoYXQgZHVwbGljYXRpb24sIGRpc2Nsb3N1cmUsIGRpc3RyaWJ1dGlvbiwgb3IgdXNlIG9mIHRo
aXMgZS1tYWlsIChhbmQvb3IgaXRzIGF0dGFjaG1lbnRzKSBvciBhbnkgcGFydCB0aGVyZW9mIGlz
IHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZlIHRoaXMgZS1tYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHVzIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgdGhpcyBtYWlsIGFzIHdlbGwgYXMgaXRz
IGF0dGFjaG1lbnQocykgZnJvbSB5b3VyIHN5c3RlbS4gSW4gYWRkaXRpb24sIHBsZWFzZSBiZSBp
bmZvcm1lZCB0aGF0IGNvbGxlY3Rpb24sIHByb2Nlc3NpbmcsIGFuZC9vciB1c2Ugb2YgcGVyc29u
YWwgZGF0YSBpcyBwcm9oaWJpdGVkIHVubGVzcyBleHByZXNzbHkgcGVybWl0dGVkIGJ5IHBlcnNv
bmFsIGRhdGEgcHJvdGVjdGlvbiBsYXdzLiBUaGFuayB5b3UgZm9yIHlvdXIgYXR0ZW50aW9uIGFu
ZCBjb29wZXJhdGlvbi4NCg0KTWFjcm9uaXggSW50ZXJuYXRpb25hbCBDby4sIEx0ZC4NCg0KPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
