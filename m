Return-Path: <SRS0=bXaR=LX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3B9C11F65
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 02:07:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB6E61C99
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 02:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BB6E61C99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:Cc:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pD7yQXVVcQ1FZJtAtEZ3gBJuUsI/aXaXQUij5taFj78=; b=qgE01qXSi+su3U
	XcCLBmHGgxhLEZTQXnk1UO8V/m2lKJcJUQS5SvDvZymssvYUJ1Y2x7D+eFL3hN7R4agIc8uWh/rt6
	nWa6Xr+9F1WN2o/kEeU/4Iw/FOq0ve7NLesYDnVQzVmOzW07of84tEsUVTNFnsqeGdPuGqX2GZOo8
	I4s2/hgug12QVJpNloRYdFd7liyqiMg6R/td5jYeaI3hxC9xqRbpKQFkTGs66tz66JH14TWbWDljM
	vAlQ4BoOHL2sR/Wydxv0xH/x1CkE6WtW9h0tqZNML173Wl09rDzbdPPC5nzs1xQzvJYXv4PuXCK7K
	InxlUHZxmDu9aTSKDKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly39A-009aYp-4I; Tue, 29 Jun 2021 02:06:44 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly395-009aY1-I9
 for linux-mtd@lists.infradead.org; Tue, 29 Jun 2021 02:06:41 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 15T26MCa090185;
 Tue, 29 Jun 2021 10:06:22 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 71EC4CEFBD923918DB20;
 Tue, 29 Jun 2021 10:06:22 +0800 (CST)
In-Reply-To: <20210517073304.sldl5eybdkd6owvl@ti.com>
References: <1621232088-12567-1-git-send-email-zhengxunli@mxic.com.tw>
 <1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw>
 <20210517073304.sldl5eybdkd6owvl@ti.com>
To: tudor.ambarus@microchip.com, vigneshr@ti.com
Cc: broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v5 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
MIME-Version: 1.0
X-KeepSent: 446B46CD:368B90EA-48258703:000A8FB2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF446B46CD.368B90EA-ON48258703.000A8FB2-48258703.000B91E3@mxic.com.tw>
From: zhengxunli@mxic.com.tw
Date: Tue, 29 Jun 2021 10:06:22 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/06/29 AM 10:06:22,
 Serialize complete at 2021/06/29 AM 10:06:22
X-MAIL: TWHMLLG4.macronix.com 15T26MCa090185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_190639_893701_758527FB 
X-CRM114-Status: GOOD (  15.15  )
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

SGkgVHVkb3IsICBWaWduZXNociwNCg0KSG9wZSB5b3WhpnJlIGhhdmluZyBhIGdyZWF0IGRheSEN
Cg0KV291bGQgeW91IGhlbHAgdG8gcmV2aWV3IHRoaXMgc2VyaWVzPw0KDQoiUHJhdHl1c2ggWWFk
YXYiIDxwLnlhZGF2QHRpLmNvbT4gd3JvdGUgb24gMjAyMS8wNS8xNyCkVaTIIDAzOjMzOjA2Og0K
DQo+ICJQcmF0eXVzaCBZYWRhdiIgPHAueWFkYXZAdGkuY29tPiANCj4gMjAyMS8wNS8xNyCkVaTI
IDAzOjMzDQo+IA0KPiBUbw0KPiANCj4gIlpoZW5neHVuIExpIiA8emhlbmd4dW5saUBteGljLmNv
bS50dz4sIA0KPiANCj4gY2MNCj4gDQo+IDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4s
IDxsaW51eC1zcGlAdmdlci5rZXJuZWwub3JnPiwgDQo+IDx0dWRvci5hbWJhcnVzQG1pY3JvY2hp
cC5jb20+LCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sIA0KPiA8YnJvb25pZUBrZXJuZWwu
b3JnPiwgPGphaW1lbGlhb0BteGljLmNvbS50dz4NCj4gDQo+IFN1YmplY3QNCj4gDQo+IFJlOiBb
UEFUQ0ggdjUgMS8yXSBtdGQ6IHNwaS1ub3I6IG1hY3Jvbml4OiBhZGQgc3VwcG9ydCBmb3IgTWFj
cm9uaXggDQpvY3RhZmxhc2gNCj4gDQo+IE9uIDE3LzA1LzIxIDAyOjE0UE0sIFpoZW5neHVuIExp
IHdyb3RlOg0KPiA+IFRoZSBvY3RhZmxhc2ggaXMgYW4geFNQSSBjb21wbGlhbnQgb2N0YWwgRFRS
IGZsYXNoLiBBZGQgc3VwcG9ydA0KPiA+IGZvciB1c2luZyBpdCBpbiBvY3RhbCBEVFIgbW9kZS4N
Cj4gPiANCj4gPiBUcnkgdG8gdmVyaWZ5IHRoZSBmbGFzaCBJRCB0byBjaGVjayB3aGV0aGVyIHRo
ZSBmbGFzaCBtZW1vcnkgaW4gb2N0YWwNCj4gPiBEVFIgbW9kZSBhbmQgU1BJIG1vZGUgYXJlIGNv
cnJlY3QuIFdoZW4gcmVhZGluZyBJRCBpbiBPQ1RBTCBEVFIgbW9kZSwNCj4gPiBJRCB3aWxsIGFw
cGVhciBpbiBhIHJlcGVhdGVkIG1hbm5lci4gZXg6IElEWzBdID0gMHhjMiwgSURbMV0gPSAweGMy
LA0KPiA+IElEWzJdID0gMHg5NCwgSURbM10gPSAweDk0Li4uIFJlYXJyYW5nZSB0aGUgb3JkZXIg
c28gdGhhdCB0aGUgSUQgY2FuIA0KcGFzcy4NCj4gPiANCj4gPiBUaGUgb2N0YWZsYXNoIHNlcmll
cyBjYW4gYmUgZGl2aWRlZCBpbnRvIHRoZSBmb2xsb3dpbmcgdHlwZXM6DQo+ID4gDQo+ID4gTVgy
NSBzZXJpZXMgOiBTZXJpYWwgTk9SIEZsYXNoLg0KPiA+IE1YNjYgc2VyaWVzIDogU2VyaWFsIE5P
UiBGbGFzaCB3aXRoIHN0YWNrZWQgZGllLihTaXplIGxhcmdlciB0aGFuIDFHYikNCj4gPiBMTS9V
TSBzZXJpZXMgOiBVcCB0byAyNTBNSHogY2xvY2sgZnJlcXVlbmN5IHdpdGggYm90aCBEVFIvU1RS
IA0Kb3BlcmF0aW9uLg0KPiA+IExXL1VXIHNlcmllcyA6IFN1cHBvcnQgc2ltdWx0YW5lb3VzIFJl
YWQtd2hpbGUtV3JpdGUgb3BlcmF0aW9uIGluIA0KbXVsdGlwbGUNCj4gPiAgICAgICAgICAgYmFu
ayBhcmNoaXRlY3R1cmUuIFJlYWQtd2hpbGUtd3JpdGUgZmVhdHVyZSB3aGljaCBtZWFucyByZWFk
DQo+ID4gICAgICAgICAgIGRhdGEgb25lIGJhbmsgd2hpbGUgYW5vdGhlciBiYW5rIGlzIHByb2dy
YW1pbmcgb3IgZXJhc2luZy4NCj4gPiANCj4gPiBNWDI1TE0gOiAzLjBWIE9jdGFsIEkvTw0KPiA+
ICAtaHR0cHM6Ly93d3cubXhpYy5jb20udHcvTGlzdHMvRGF0YXNoZWV0L0F0dGFjaG1lbnRzLzc4
NDEvDQo+IE1YMjVMTTUxMjQ1RywlMjAzViwlMjA1MTJNYiwlMjB2MS4xLnBkZg0KPiA+IA0KPiA+
IE1YMjVVTSA6IDEuOFYgT2N0YWwgSS9PDQo+ID4gIC1odHRwczovL3d3dy5teGljLmNvbS50dy9M
aXN0cy9EYXRhc2hlZXQvQXR0YWNobWVudHMvNzUyNS8NCj4gTVgyNVVNNTEyNDVHJTIwRXh0cmVt
ZSUyMFNwZWVkLCUyMDEuOFYsJTIwNTEyTWIsJTIwdjEuMC5wZGYNCj4gPiANCj4gPiBNWDY2TE0g
OiAzLjBWIE9jdGFsIEkvTyB3aXRoIHN0YWNrZWQgZGllDQo+ID4gIC1odHRwczovL3d3dy5teGlj
LmNvbS50dy9MaXN0cy9EYXRhc2hlZXQvQXR0YWNobWVudHMvNzkyOS8NCj4gTVg2NkxNMUc0NUcs
JTIwM1YsJTIwMUdiLCUyMHYxLjEucGRmDQo+ID4gDQo+ID4gTVg2NlVNIDogMS44ViBPY3RhbCBJ
L08gd2l0aCBzdGFja2VkIGRpZQ0KPiA+ICAtaHR0cHM6Ly93d3cubXhpYy5jb20udHcvTGlzdHMv
RGF0YXNoZWV0L0F0dGFjaG1lbnRzLzc3MjEvDQo+IE1YNjZVTTFHNDVHLCUyMDEuOFYsJTIwMUdi
LCUyMHYxLjEucGRmDQo+ID4gDQo+ID4gTVgyNUxXIDogMy4wViBPY3RhbCBJL08gd2l0aCBSZWFk
LXdoaWxlLVdyaXRlDQo+ID4gTVgyNVVXIDogMS44ViBPY3RhbCBJL08gd2l0aCBSZWFkLXdoaWxl
LVdyaXRlDQo+ID4gTVg2NkxXIDogMy4wViBPY3RhbCBJL08gd2l0aCBSZWFkLXdoaWxlLVdyaXRl
IGFuZCBzdGFjayBkaWUNCj4gPiBNWDY2VVcgOiAxLjhWIE9jdGFsIEkvTyB3aXRoIFJlYWQtd2hp
bGUtV3JpdGUgYW5kIHN0YWNrIGRpZQ0KPiA+IA0KPiA+IEFib3V0IExXL1VXIHNlcmllcywgcGxl
YXNlIGNvbnRhY3QgdXMgZnJlZWx5IGlmIHlvdSBoYXZlIGFueQ0KPiA+IHF1ZXN0aW9ucy4gRm9y
IGFkZGluZyBPY3RhbCBOT1IgRmxhc2ggSURzLCB3ZSBoYXZlIHZhbGlkYXRlZA0KPiA+IGVhY2gg
Rmxhc2ggb24gcGxhdGVmb3JtIHp5bnEtcGljb3plZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBaaGVuZ3h1biBMaSA8emhlbmd4dW5saUBteGljLmNvbS50dz4NCj4gDQo+IFJldmlld2VkLWJ5
OiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+DQoNClRoYW5rcywNClpoZW5neHVuDQoN
Cg0KDQpDT05GSURFTlRJQUxJVFkgTk9URToNCg0KVGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2ht
ZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gDQphbmQvb3IgcGVyc29u
YWwgZGF0YSwgd2hpY2ggaXMgcHJvdGVjdGVkIGJ5IGFwcGxpY2FibGUgbGF3cy4gUGxlYXNlIGJl
IA0KcmVtaW5kZWQgdGhhdCBkdXBsaWNhdGlvbiwgZGlzY2xvc3VyZSwgZGlzdHJpYnV0aW9uLCBv
ciB1c2Ugb2YgdGhpcyBlLW1haWwgDQooYW5kL29yIGl0cyBhdHRhY2htZW50cykgb3IgYW55IHBh
cnQgdGhlcmVvZiBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSANCnRoaXMgZS1tYWlsIGlu
IGVycm9yLCBwbGVhc2Ugbm90aWZ5IHVzIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgdGhpcyBtYWls
IGFzIA0Kd2VsbCBhcyBpdHMgYXR0YWNobWVudChzKSBmcm9tIHlvdXIgc3lzdGVtLiBJbiBhZGRp
dGlvbiwgcGxlYXNlIGJlIA0KaW5mb3JtZWQgdGhhdCBjb2xsZWN0aW9uLCBwcm9jZXNzaW5nLCBh
bmQvb3IgdXNlIG9mIHBlcnNvbmFsIGRhdGEgaXMgDQpwcm9oaWJpdGVkIHVubGVzcyBleHByZXNz
bHkgcGVybWl0dGVkIGJ5IHBlcnNvbmFsIGRhdGEgcHJvdGVjdGlvbiBsYXdzLiANClRoYW5rIHlv
dSBmb3IgeW91ciBhdHRlbnRpb24gYW5kIGNvb3BlcmF0aW9uLg0KDQpNYWNyb25peCBJbnRlcm5h
dGlvbmFsIENvLiwgTHRkLg0KDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg0KDQoNCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0NCg0KQ09ORklERU5USUFMSVRZIE5PVEU6DQoNClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNo
bWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGFuZC9vciBwZXJzb25h
bCBkYXRhLCB3aGljaCBpcyBwcm90ZWN0ZWQgYnkgYXBwbGljYWJsZSBsYXdzLiBQbGVhc2UgYmUg
cmVtaW5kZWQgdGhhdCBkdXBsaWNhdGlvbiwgZGlzY2xvc3VyZSwgZGlzdHJpYnV0aW9uLCBvciB1
c2Ugb2YgdGhpcyBlLW1haWwgKGFuZC9vciBpdHMgYXR0YWNobWVudHMpIG9yIGFueSBwYXJ0IHRo
ZXJlb2YgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlLW1haWwgaW4gZXJyb3Is
IHBsZWFzZSBub3RpZnkgdXMgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSB0aGlzIG1haWwgYXMgd2Vs
bCBhcyBpdHMgYXR0YWNobWVudChzKSBmcm9tIHlvdXIgc3lzdGVtLiBJbiBhZGRpdGlvbiwgcGxl
YXNlIGJlIGluZm9ybWVkIHRoYXQgY29sbGVjdGlvbiwgcHJvY2Vzc2luZywgYW5kL29yIHVzZSBv
ZiBwZXJzb25hbCBkYXRhIGlzIHByb2hpYml0ZWQgdW5sZXNzIGV4cHJlc3NseSBwZXJtaXR0ZWQg
YnkgcGVyc29uYWwgZGF0YSBwcm90ZWN0aW9uIGxhd3MuIFRoYW5rIHlvdSBmb3IgeW91ciBhdHRl
bnRpb24gYW5kIGNvb3BlcmF0aW9uLg0KDQpNYWNyb25peCBJbnRlcm5hdGlvbmFsIENvLiwgTHRk
Lg0KDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
