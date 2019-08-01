Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70483C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 340A1214DA
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 06:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ablHO9He";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="D82Zx4D0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 340A1214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1B+i1sEIwipwGl17wHLY4rz0b1564P7Z+m1PJa8bcw=; b=ablHO9HexVT+xO
	BpdRGWhpB4UTYWIYRcaF8BU3dVhgAUFXgYsTw9YsRRuelC9qBG3KJaEy7599AqUmnxh8IsKNBKc8i
	35EkVLRfajh6DwkbJZXkxy4D4o4dRyKv0EiKwwwsknby6YDEMMpzbu1m/PlM9T72ocGz7OWN4jpDp
	rrX8DtPpypkjfL35VAalw7taipXtZosJc+JqFkA+p5nyqvXyYKpEZhjg6GNk7WRL3n8K/Zy6EBfGp
	u9j81Q6NCOXOJB/TmdK88GYONZL974Xlf23G96J4/riGMqQHyzy5IztnLA5O0Fa/22bAd2eivU9gA
	IGRiY0Qu1UzgJ1yVlK1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht4nH-0004Gx-BB; Thu, 01 Aug 2019 06:42:31 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht4nD-00044I-3o
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 06:42:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x716gE2u083842;
 Thu, 1 Aug 2019 01:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564641734;
 bh=zY3/va/JJMLXHu2ZBucuC1YJa86+EEc/yvWStmNyiU8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=D82Zx4D0hzXF/9u1gNe4uW+WnS8m7WohTi0s9nYVxY+Mpf67C/jXPEK8wkBNrJtUN
 8ec6IBg9yNB8jFp2HY6QzJ8kT1JibdsZIjR/DFCiIRRCOVSLmcCradgsqEpEA1DZ9S
 Hi1Qr6vLS0UbvaHhsf6+6BCD5EWNSNDXkGvZkI98=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x716gEEt113903
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Aug 2019 01:42:14 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 01:42:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 01:42:14 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x716gA1e112596;
 Thu, 1 Aug 2019 01:42:11 -0500
Subject: Re: [RFC v1 0/3] *spi-mem: adding setup and callback function
To: Tomer Maimon <tmaimon77@gmail.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
References: <20190729142504.188336-1-tmaimon77@gmail.com>
 <20190729172859.4374a2ad@collabora.com>
 <CAP6Zq1iPXDX_Gtz6ZWYm3JoHgHjdapotVLGw-Lq4tc2X-6eAug@mail.gmail.com>
 <20190730085438.6fe0480b@collabora.com>
 <d8adef3f-e901-2e25-6183-35cb1e53bcda@ti.com>
 <20190730200410.72b2f7d3@collabora.com>
 <CAP6Zq1hfVoS8+VU0rAtKAX7D22qTVHDMosiCRMKV8sQB_m0qOQ@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ac96da83-3b52-c030-cefa-e0d366fc3151@ti.com>
Date: Thu, 1 Aug 2019 12:12:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAP6Zq1hfVoS8+VU0rAtKAX7D22qTVHDMosiCRMKV8sQB_m0qOQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_234227_262843_735C81B9 
X-CRM114-Status: GOOD (  27.29  )
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, bbrezillon@kernel.org,
 richard@nod.at, tudor.ambarus@microchip.com,
 Schrempf Frieder <frieder.schrempf@kontron.de>, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAzMS8wNy8xOSAxOjQ5IFBNLCBUb21lciBNYWltb24gd3JvdGU6Cj4gSGkgVmlnbmVz
aCwKPiAKPiBEb2VzIHlvdXIgbmV3IG1lcmdlIHZlcnNpb24gd2lsbCBzdXBwb3J0IGRpcmVjdCBz
cGktbWVtIEFQST8KPiAKCgpObywgSSBkb24ndCBoYXZlIGEgZHJpdmVyIHRvIHRlc3Qgb3V0IGRp
cm1hcCBBUElzLiBTbywgdGhhdCB3b3VsZCBuZWVkCnRvIGJlIGFkZGVkIHNlcGFyYXRlbHkgb24g
dG9wLgoKSSBoYXZlIHBvc3RlZCBuZXh0IHZlcnNpb24gb2YgbXkgc2VyaWVzIGhlcmUgKGV4cGVj
dCBtb3JlIHJldmlzaW9ucyk6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY292ZXIvMTE0
MDI2OS8KCkZlZWwgZnJlZSB0byB0ZXN0IGFuZCByZWJhc2UgZGlybWFwIEFQSSBhZGRpdGlvbiBv
biB0b3Agb2YgaXQuCgpSZWdhcmRzClZpZ25lc2gKCgo+IFRoYW5rcywKPiAKPiBUb21lcgo+IAo+
IE9uIFR1ZSwgMzAgSnVsIDIwMTkgYXQgMjE6MDQsIEJvcmlzIEJyZXppbGxvbgo+IDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbSA8bWFpbHRvOmJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPj4KPiB3cm90ZToKPiAKPiAgICAgT24gVHVlLCAzMCBKdWwgMjAxOSAyMzoxODoyNSArMDUz
MAo+ICAgICBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20gPG1haWx0bzp2aWdu
ZXNockB0aS5jb20+PiB3cm90ZToKPiAKPiAgICAgPiBPbiAzMC1KdWwtMTkgMTI6MjQgUE0sIEJv
cmlzIEJyZXppbGxvbiB3cm90ZToKPiAgICAgPiA+IFRyaW1tZWQgdGhlIHJlY2lwaWVudCBsaXN0
IGEgYml0IGFuZCB1c2VkIEZyaWVkZXIncyBuZXcgYWRkcmVzcy4KPiAgICAgPiA+ICtTZXJnZXkK
PiAgICAgPiA+Cj4gICAgID4gPiBPbiBNb24sIDI5IEp1bCAyMDE5IDIzOjU1OjA1ICswMzAwCj4g
ICAgID4gPiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20gPG1haWx0bzp0bWFpbW9u
NzdAZ21haWwuY29tPj4KPiAgICAgd3JvdGU6Cj4gICAgID4gPsKgIMKgCj4gICAgID4gPj4gSGkg
Qm9yaXMsCj4gICAgID4gPj4KPiAgICAgPiA+PiBUaGFua3MgZm9yIHRoZSBwcm9tcHQgcmVwbHks
Cj4gICAgID4gPj4KPiAgICAgPiA+Pgo+ICAgICA+ID4+Cj4gICAgID4gPj4gT24gTW9uLCAyOSBK
dWwgMjAxOSBhdCAxODoyOSwgQm9yaXMgQnJlemlsbG9uCj4gICAgIDxib3Jpcy5icmV6aWxsb25A
Y29sbGFib3JhLmNvbSA8bWFpbHRvOmJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPj4KPiAg
ICAgPiA+PiB3cm90ZToKPiAgICAgPiA+PsKgCj4gICAgID4gPj4+IEhpIFRvbWVyLAo+ICAgICA+
ID4+Pgo+ICAgICA+ID4+PiBPbiBNb24sIDI5IEp1bCAyMDE5IDE3OjI1OjAxICswMzAwCj4gICAg
ID4gPj4+IFRvbWVyIE1haW1vbiA8dG1haW1vbjc3QGdtYWlsLmNvbQo+ICAgICA8bWFpbHRvOnRt
YWltb243N0BnbWFpbC5jb20+PiB3cm90ZToKPiAgICAgPiA+Pj7CoCDCoAo+ICAgICA+ID4+Pj4g
TGF0ZWx5IHdlIGhhdmUgd29ya2luZyBvbiBGbGFzaCBpbnRlcmZhY2UgdW5pdCAoRklVKSBTUEkK
PiAgICAgZHJpdmVyIHRoYXQKPiAgICAgPiA+Pj4+IHVzaW5nIHNwaS1tZW0gaW50ZXJmYWNlLCBP
dXIgRklVIEhXIG1vZHVsZSBzdXBwb3J0IGRpcmVjdAo+ICAgICBGbGFzaCBSZC8vV3IuCj4gICAg
ID4gPj4+Pgo+ICAgICA+ID4+Pj4gSW4gb3VyIFNPQyAoMzIgYml0IGR1YWwgY29yZSBBUk0pIHdl
IGhhdmUgMyBGSVUncyB0aGF0IHVzaW5nCj4gICAgIG1lbW9yecKgIMKgCj4gICAgID4gPj4+IG1h
cHBpbmcgYXMgZm9sbG93OsKgIMKgCj4gICAgID4gPj4+Pgo+ICAgICA+ID4+Pj4gRklVMCAtIGhh
dmUgMiBjaGlwIHNlbGVjdCBhbmQgZWFjaCBvbmUgaGF2ZSAxMjhNQiBtZW1vcnkKPiAgICAgbWFw
cGluZyAodG90YWzCoCDCoAo+ICAgICA+ID4+PiAyNTZNQiBtZW1vcnkgbWFwcGluZynCoCDCoAo+
ICAgICA+ID4+Pj4gRklVMSAtIGhhdmUgNCBjaGlwIHNlbGVjdCBhbmQgZWFjaCBvbmUgaGF2ZSAx
MjhNQiBtZW1vcnkKPiAgICAgbWFwcGluZyAodG90YWzCoCDCoAo+ICAgICA+ID4+PiA1MTJNQiBt
ZW1vcnkgbWFwcGluZynCoCDCoAo+ICAgICA+ID4+Pj4gRklVMiAtIGhhdmUgNCBjaGlwIHNlbGVj
dCBhbmQgZWFjaCBvbmUgaGF2ZSAxNk1CIG1lbW9yeQo+ICAgICBtYXBwaW5nICh0b3RhbMKgIMKg
Cj4gICAgID4gPj4+IDMyTUIgbWVtb3J5IG1hcHBpbmcpwqAgwqAKPiAgICAgPiA+Pj4+Cj4gICAg
ID4gPj4+PiBUb3RhbGx5IDgwME1CIG1lbW9yeSBtYXBwaW5nLgo+ICAgICA+ID4+Pj4KPiAgICAg
PiA+Pj4+IFdoZW4gdGhlIEZJVSBkcml2ZXIgcHJvYmUgaXQgZG9uJ3Qga25vdyB0aGUgc2l6ZSBv
ZiBlYWNoCj4gICAgIEZsYXNoIHRoYXQKPiAgICAgPiA+Pj4+IGNvbm5lY3RlZCB0byB0aGUgRklV
LCBzbyB0aGUgZW50aXJlIG1lbW9yeSBtYXBwaW5nIGlzCj4gICAgIGFsbG9jYXRlZCBmb3IgZWFj
aMKgIMKgCj4gICAgID4gPj4+IEZJVcKgIMKgCj4gICAgID4gPj4+PiBhY2NvcmRpbmcgdGhlIEZJ
VSBkZXZpY2UgdHJlZSBtZW1vcnkgbWFwIHBhcmFtZXRlcnMuwqAgwqAKPiAgICAgPiA+Pj4KPiAg
ICAgPiA+Pj4gRG8geW91IG5lZWQgdGhvc2UgbWFwcGluZ3MgdG8gYmUgYWN0aXZlIHRvIHN1cHBv
cnQgc2ltcGxlIHJlZwo+ICAgICBhY2Nlc3Nlcz8KPiAgICAgPiA+Pj7CoCDCoAo+ICAgICA+ID4+
Pj4gSXQgbWVhbnMsIGlmIHdlIGVuYWJsZSBhbGwgdGhyZWUgRklVJ3MgdGhlIGRyaXZlcnMgd2ls
bCB0cnkKPiAgICAgdG8gYWxsb2NhdGXCoCDCoAo+ICAgICA+ID4+PiB0b3RhbGx5IDgwME1CLsKg
IMKgCj4gICAgID4gPj4+Pgo+ICAgICA+ID4+Pj4gSW4gMzJiaXQgc3lzdGVtIGl0IGlzIHByb2Js
ZW1hdGljIGJlY2F1c2UgdGhlIGtlcm5lbCBoYXZlCj4gICAgIG9ubHkgMUdCCj4gICAgID4gPj4+
PiBvZiBtZW1vcnkgYWxsb2NhdGlvbiBzbyB0aGUgdm1hbGxvYyBjYW5ub3QgdGFrZSA4MDBNQi4K
PiAgICAgPiA+Pj4+Cj4gICAgID4gPj4+PiBXaGVuIGltcGxlbWVudGluZyB0aGUgRklVIGRyaXZl
ciBpbiB0aGUgbXRkL3NwaS1ub3Igd2UKPiAgICAgYWxsb2NhdGluZyBtZW1vcnnCoCDCoAo+ICAg
ICA+ID4+PiBhZGRyZXNzIG9ubHnCoCDCoAo+ICAgICA+ID4+Pj4gZm9yIGRldGVjdGVkIEZsYXNo
IHdpdGggZXhhY3Qgc2l6ZSAodXN1YWxseSB3ZSBhcmUgbm90IHVzaW5nCj4gICAgIDEyOE1CwqAg
wqAKPiAgICAgPiA+Pj4gRmxhc2gpLCBhbmQgaW4gdGhhdCBjYXNlIHVzdWFsbHkgd2UgYWxsb2Nh
dGluZyBtdWNoIGxlc3MKPiAgICAgbWVtb3J5LsKgIMKgCj4gICAgID4gPj4+Pgo+ICAgICA+ID4+
Pj4gVG8gc29sdmUgdGhpcyBpc3N1ZSB3ZSBuZWVkZWQgdG8gb3ZlcmNvbWUgdHdvIHRoaW5nczoK
PiAgICAgPiA+Pj4+Cj4gICAgID4gPj4+PiAxLsKgIMKgIEdldCBhcmd1bWVudCBmcm9tIHRoZSB1
cHBlciBsYXllciAoc3BpLW1lbSBsYXllcikKPiAgICAgPiA+Pj4+IDIuwqAgwqAgQ2FsbGluZyB0
aGUgZ2V0IGFyZ3VtZW50IGZ1bmN0aW9uIGFmdGVyIFNQSV9OT1JfU0NBTgo+ICAgICBmdW5jdGlv
bi7CoCDCoAo+ICAgICA+ID4+PiAodGhlIE1URCBGbGFzaCBzaXplIGZpbGxlZCBpbsKgIFNQSV9O
T1JfU0NBTiBmdW5jdGlvbikKPiAgICAgPiA+Pj4KPiAgICAgPiA+Pj4gVGhhdCdzIGNsZWFybHkg
YnJlYWtpbmcgdGhlIGxheWVyaW5nIHdlJ3ZlIHRyaWVkIHRvIHJlc3RvcmUKPiAgICAgd2l0aCB0
aGUKPiAgICAgPiA+Pj4gc3BpLW5vci9zcGktbWVtIHNwbGl0LCBhbmQgSSBkb24ndCBzZWUgd2h5
IHRoaXMgaXMgbmVlZGVkCj4gICAgIHNpbmNlIHdlIG5vdwo+ICAgICA+ID4+PiBoYXZlIGEgd2F5
IHRvIGNyZWF0ZSBkaXJlY3QgbWFwcGluZ3MgZHluYW1pY2FsbHkgKHdpdGggdGhlCj4gICAgIGRp
cm1hcCBBUEkpLgo+ICAgICA+ID4+PiBIYXZlIHlvdSB0cmllZCBpbXBsZW1lbnRpbmcgdGhlIGRp
cm1hcCBob29rcyBpbiB5b3VyIGRyaXZlcj/CoCDCoAo+ICAgICA+ID4+Cj4gICAgID4gPj4KPiAg
ICAgPiA+PsKgIFNvcnJ5IGJ1dCBJIHdhc24ndCBmYW1pbGlhciB3aXRoIHRoZSBkaXJlY3QgbWFw
cGluZyBpbiB0aGUKPiAgICAgc3BpLW1lbSwgaXQKPiAgICAgPiA+PiBzZWVtcyBpdCBuZWVkZWQg
dG8gaW1wbGVtZW50ZWQgaW4gdGhlIG0yNXA4MCBkcml2ZXIgYXMgd2VsbCwgYW0KPiAgICAgSSBj
b3JyZWN0P8KgCj4gICAgID4gPgo+ICAgICA+ID4gVGhlcmUncyB0aGlzIHBhdGNoIFsxXSBmbG9h
dGluZyBhcm91bmQuIElJUkMsIFNlcmdleSB3YXMgd2FpdGluZyBmb3IKPiAgICAgPiA+IHRoZSBt
MjVwODAgLT4gc3BpLW5vciBtZXJnZSB0byBzZW5kIGEgdjUuIFZpZ25lc2gsIGFueSB1cGRhdGVz
Cj4gICAgIG9uIHRoYXQKPiAgICAgPiA+IG9uZT8gSWYgeW91IGRvbid0IGhhdmUgdGltZSB0byB3
b3JrIG9uIHRoYXQsIG1heWJlIFNlcmdleSBjb3VsZAo+ICAgICBzZW5kIGEKPiAgICAgPiA+IHY1
Lgo+ICAgICA+ID7CoCDCoAo+ICAgICA+Cj4gICAgID4gSSBkaWQgc2VuZCBhbiB1cGRhdGVkIHNl
cmllcyBvZiBtZXJnaW5nIG0yNXA4MCB0byBzcGktbm9yIGxhc3QKPiAgICAgd2VlayBhbmQKPiAg
ICAgPiBoYXZlIHJlY2VpdmVkIGZldyBjb21tZW50cy4gV2lsbCByZXNwaW4gb25lIG1vcmUgdmVy
c2lvbiB0aGlzIHdlZWsKPiAgICAgPiAobW9zdGx5IGJ5IHRvbW9ycm93KS4KPiAKPiAgICAgT2th
eSwgZ3JlYXQhCj4gCgotLSAKUmVnYXJkcwpWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
