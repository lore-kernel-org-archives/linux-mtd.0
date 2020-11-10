Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32244C388F7
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 13:15:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6256F20674
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 13:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iQFjUXXr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pC+b3MKZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6256F20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UBE2wAsrL/TJTBVF9S5aQJ4Eu2b7qr0cfx0kMkOKjek=; b=iQFjUXXrI51hYmFW+Rh+D/YeL
	OyO5axxSExn2ddf71JEzA1hqd6vSI/eOWfTzZ68G9K7csNiwZDTCL47Z49Mgdf8Y0diT2IQ+v7MSi
	rJ5j1+ao0M/2x5pfxhI4xa7oYuiThwpFx5UN4vHEvIDJ1MylWNtTmrppEFPTcJ2EPzcjUrjgRF2rw
	Q9UUWonSSMS6POSdTOuLkb7vB0C0jk79k34PotuEoGT60LcENbjiN22ZE1sonjRHTTirnMcB6A1V+
	y84R+x7BChkfMxQ74M9wujwiLTehyf0I594eL5ASLaC3aXQbeCGhbzxnsfyT1qYwQ1WRuapP0TQxF
	LuJzkReow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcTTg-0004Ve-Kj; Tue, 10 Nov 2020 13:14:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcTTd-0004V4-RO
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 13:14:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AADELJI054024;
 Tue, 10 Nov 2020 07:14:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605014061;
 bh=+g/DEVhJYtkc2T/gQ5S006B5Obb8oIoEMqC2xcIJOzw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pC+b3MKZ7pqRjZxK2n0DR/J+/CrzjdpZq+rjjHw3Oi+FQ/48ZkvhTJe6cEx6/G+P/
 3BTyP4SFK/E452hNZCCrSfUj2pwJuvK5pZZs+OQZkr8S/9l+bKQ4GIOCBqq1QhdR+S
 IoLnS/CVe8CvICcVqxsp8DdNd3hNckufLCEofvRI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AADELeO057954
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 07:14:21 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 07:14:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 07:14:21 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AADEIFb019665;
 Tue, 10 Nov 2020 07:14:19 -0600
Subject: Re: [PATCH] mtd: spi-nor: Fix multiple typos
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 <linux-mtd@lists.infradead.org>
References: <20201107134151.1071327-1-j.neuschaefer@gmx.net>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <7463ff20-6791-35f4-8824-fa1423c50099@ti.com>
Date: Tue, 10 Nov 2020 18:44:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201107134151.1071327-1-j.neuschaefer@gmx.net>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_081425_999593_FC2F8974 
X-CRM114-Status: GOOD (  23.34  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxMS83LzIwIDc6MTEgUE0sIEpvbmF0aGFuIE5ldXNjaMOkZmVyIHdyb3RlOgo+IFNp
Z25lZC1vZmYtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+
CgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgYnV0IGEgY29tbWl0IG1zZyBpcyBleHBlY3RlZCBob3dl
dmVyIHRyaXZpYWwgdGhlCnBhdGNoIG1heWJlLiBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJp
Y3QgY29tcGxhaW5zIGFib3V0IHRoZSBzYW1lOgoKV0FSTklORzogTWlzc2luZyBjb21taXQgZGVz
Y3JpcHRpb24gLSBBZGQgYW4gYXBwcm9wcmlhdGUgb25lCgpSZWdhcmRzClZpZ25lc2gKCj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jICB8IDQgKystLQo+ICBkcml2ZXJzL210ZC9z
cGktbm9yL3NmZHAuYyAgfCAyICstCj4gIGluY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCB8IDIg
Ky0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMKPiBpbmRleCAwMzY5ZDk4YjJkMTJlLi44NWMwNzA0OTQ1MjU5IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMKPiBAQCAtMTQ0Nyw3ICsxNDQ3LDcgQEAgc3RhdGljIGludCBzcGlfbm9y
X2VyYXNlX211bHRpX3NlY3RvcnMoc3RydWN0IHNwaV9ub3IgKm5vciwgdTY0IGFkZHIsIHUzMiBs
ZW4pCj4gCj4gIC8qCj4gICAqIEVyYXNlIGFuIGFkZHJlc3MgcmFuZ2Ugb24gdGhlIG5vciBjaGlw
LiAgVGhlIGFkZHJlc3MgcmFuZ2UgbWF5IGV4dGVuZAo+IC0gKiBvbmUgb3IgbW9yZSBlcmFzZSBz
ZWN0b3JzLiAgUmV0dXJuIGFuIGVycm9yIGlzIHRoZXJlIGlzIGEgcHJvYmxlbSBlcmFzaW5nLgo+
ICsgKiBvbmUgb3IgbW9yZSBlcmFzZSBzZWN0b3JzLiAgUmV0dXJuIGFuIGVycm9yIGlmIHRoZXJl
IGlzIGEgcHJvYmxlbSBlcmFzaW5nLgo+ICAgKi8KPiAgc3RhdGljIGludCBzcGlfbm9yX2VyYXNl
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5zdHIpCj4gIHsKPiBA
QCAtMjUzNyw3ICsyNTM3LDcgQEAgc3BpX25vcl9zZWxlY3RfdW5pZm9ybV9lcmFzZShzdHJ1Y3Qg
c3BpX25vcl9lcmFzZV9tYXAgKm1hcCwKPiAgCQl9Cj4gCj4gIAkJLyoKPiAtCQkgKiBPdGhlcndp
c2UsIHRoZSBjdXJyZW50IGVyYXNlIHNpemUgaXMgc3RpbGwgYSB2YWxpZCBjYW5kaXRhdGUuCj4g
KwkJICogT3RoZXJ3aXNlLCB0aGUgY3VycmVudCBlcmFzZSBzaXplIGlzIHN0aWxsIGEgdmFsaWQg
Y2FuZGlkYXRlLgo+ICAJCSAqIFNlbGVjdCB0aGUgYmlnZ2VzdCB2YWxpZCBjYW5kaWRhdGUuCj4g
IAkJICovCj4gIAkJaWYgKCFlcmFzZSAmJiB0ZXN0ZWRfZXJhc2UtPnNpemUpCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRw
LmMKPiBpbmRleCBlMmE0M2QzOWViNWY0Li4wNWIyMmM2NTc2ODMyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRw
LmMKPiBAQCAtNTksNyArNTksNyBAQCBzdHJ1Y3Qgc2ZkcF9iZnB0X3JlYWQgewo+IAo+ICBzdHJ1
Y3Qgc2ZkcF9iZnB0X2VyYXNlIHsKPiAgCS8qCj4gLQkgKiBUaGUgaGFsZi13b3JkIGF0IG9mZnNl
dCA8c2hpZnQ+IGluIERXT1JEIDxkd29hcmQ+IGVuY29kZXMgdGhlCj4gKwkgKiBUaGUgaGFsZi13
b3JkIGF0IG9mZnNldCA8c2hpZnQ+IGluIERXT1JEIDxkd29yZD4gZW5jb2RlcyB0aGUKPiAgCSAq
IG9wIGNvZGUgYW5kIGVyYXNlIHNlY3RvciBzaXplIHRvIGJlIHVzZWQgYnkgU2VjdG9yIEVyYXNl
IGNvbW1hbmRzLgo+ICAJICovCj4gIAl1MzIJCQlkd29yZDsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9tdGQvc3BpLW5vci5oIGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oCj4gaW5k
ZXggNjBiYWMyYzBlYzQ1Ni4uNTgyZWUwNGVlZWEyMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L210ZC9zcGktbm9yLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9zcGktbm9yLmgKPiBA
QCAtNDA2LDcgKzQwNiw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRldmljZV9ub2RlICpzcGlf
bm9yX2dldF9mbGFzaF9ub2RlKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gICAqIEBuYW1lOgl0aGUg
Y2hpcCB0eXBlIG5hbWUKPiAgICogQGh3Y2FwczoJdGhlIGhhcmR3YXJlIGNhcGFiaWxpdGllcyBz
dXBwb3J0ZWQgYnkgdGhlIGNvbnRyb2xsZXIgZHJpdmVyCj4gICAqCj4gLSAqIFRoZSBkcml2ZXJz
IGNhbiB1c2UgdGhpcyBmdWN0aW9uIHRvIHNjYW4gdGhlIFNQSSBOT1IuCj4gKyAqIFRoZSBkcml2
ZXJzIGNhbiB1c2UgdGhpcyBmdW5jdGlvbiB0byBzY2FuIHRoZSBTUEkgTk9SLgo+ICAgKiBJbiB0
aGUgc2Nhbm5pbmcsIGl0IHdpbGwgdHJ5IHRvIGdldCBhbGwgdGhlIG5lY2Vzc2FyeSBpbmZvcm1h
dGlvbiB0bwo+ICAgKiBmaWxsIHRoZSBtdGRfaW5mb3t9IGFuZCB0aGUgc3BpX25vcnt9Lgo+ICAg
Kgo+IC0tCj4gMi4yOC4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
