Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9460C369BC
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFVMPJzq1m75a7TKxxVWmnJHAKEHB4Uwiz/Lre8X6VI=; b=S6q+7cOTUXH0Tk
	1Cr5tz4YS8q7AxbRRfhZRqkLYhmzzxzWWGgxJrwTtPMi+7BE+M6ZBRXhWoECEarZOIowxkPflCbDz
	KEmy3FDzLVSkBATyLY4IVqrjlUeTRB6S8ia4lMdvQvJKGcXHMbLsXMVu9Hl8/D1x8HKITT9wpCeja
	e0JCsnLEML+NYVl7HGnQMBQo0QZiwAhdB8Gj847IZdyCtd4YGkxKhuAPjEVM7LTOZ0VbM2ihY4HOC
	vhCu62hCwHNXXbWzFG6lThMDYOF59CMRKJsDFqa/6rh/UkVaBe4CLUHEnFOx1E6v1H7aot2vgl2eu
	ZEwygJRLxe4djeYCL1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOnm-00000004gn6-1s3v;
	Wed, 25 Sep 2024 09:59:18 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stOmR-00000004gVY-15yh
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 09:57:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2AAABE0004;
	Wed, 25 Sep 2024 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727258268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ty4/y3Jxu7Plk8pWyWkojbI6PSWYseKcvwhL4r+Fr70=;
	b=oK2KliJ3sE2eBBPA18DPlVQIcj0IxjMMqXloudsKnqCy9lustdss2TdcROKN1CRJw2+YvT
	ZSIiwcHjHTR6xFc6Yum/4yxEi9a2cJ1X16WcU3P+FpncjQq9xFqHCwwnY5GlE4ZFvhBmqW
	lzmnULfYUcJfzV3gCwsw32zofU9oOsof1tn0Ncm1P5dKuMImziaQFemm9IWpqTh6QEfA6f
	BmgddcU9i1W9ke1JlxtEcQ6VIK2KMT0fKO0HZSiWDVqrJLgFgaWYRgm1g0h7h6TmVTv49Q
	admQ2l39BAcnLZENYsqnERVLSacWZHSwHh6jT3dBMBybE6xeuUELODycTqKing==
Date: Wed, 25 Sep 2024 11:57:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Alvin Zhou <alvinzhou.tw@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratyush@kernel.org, mwalle@kernel.org, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw, AlvinZhou
 <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>, Bough Chen
 <haibo.chen@nxp.com>
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal
 flash
Message-ID: <20240925115746.22cdd8fe@xps-13>
In-Reply-To: <79406f2b-8411-4059-b959-9e543944fb9c@linaro.org>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
	<20240718034614.484018-7-alvinzhou.tw@gmail.com>
	<97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
	<CAPhrvRR3U9=0DuG_FQ81ZJq+RLe6Bn9YO831Mx2n3NkeV3MCdA@mail.gmail.com>
	<368cd6fb-cab1-44ad-af46-651d9323bc19@linaro.org>
	<618e4514-791b-4a73-a1ba-45170a21e453@linaro.org>
	<79406f2b-8411-4059-b959-9e543944fb9c@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_025756_192644_3FAA0825 
X-CRM114-Status: GOOD (  23.75  )
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

SGkgQWx2aW4sCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCAyNCBTZXAg
MjAyNCAwODoxNzoyNiArMDEwMDoKCj4gT24gOS8yNC8yNCA3OjM2IEFNLCBUdWRvciBBbWJhcnVz
IHdyb3RlOgo+ID4gCj4gPiAKPiA+IE9uIDkvMjQvMjQgNzoyNiBBTSwgVHVkb3IgQW1iYXJ1cyB3
cm90ZTogIAo+ID4+Cj4gPj4KPiA+PiBPbiA5LzI0LzI0IDQ6MjUgQU0sIEFsdmluIFpob3Ugd3Jv
dGU6ICAKPiA+Pj4gSGkgVHVkb3IsCj4gPj4+Cj4gPj4+IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4g5pa8IDIwMjTlubQ55pyIMjPml6Ug6YCx5LiAIOS4i+WNiDI6NTTl
r6vpgZPvvJogIAo+ID4+Pj4KPiA+Pj4+IEhpLCBBbHZpbiwKPiA+Pj4+Cj4gPj4+PiBJIHF1aWNr
bHkgc2tpbW1lZCBvdmVyIHRoZSBwcmV2aW91cyA1IHBhdGNoZXMgYW5kIHRoZXkgYXJlIGxvb2tp
bmcgZmluZS4KPiA+Pj4+Cj4gPj4+PiBJIGRvbid0IGdldCB0aGlzIHBhdGNoIGhvd2V2ZXIuCj4g
Pj4+Pgo+ID4+Pj4gT24gNy8xOC8yNCA0OjQ2IEFNLCBBbHZpblpob3Ugd3JvdGU6ICAKPiA+Pj4+
PiBGcm9tOiBBbHZpblpob3UgPGFsdmluemhvdUBteGljLmNvbS50dz4KPiA+Pj4+Pgo+ID4+Pj4+
IEFkZGluZyBNYW51ZmFjdHVyZSBJRCAweEMyIGluIGxhc3Qgb2YgSUQgdGFibGUgYmVjYXVzZSBv
Zgo+ID4+Pj4+IE9jdGFsIEZsYXNoIG5lZWQgbWFudWZhY3R1cmVyIGZpeHVwIGZvciBlbmFibGlu
Zy9kaXNhYmxpbmcKPiA+Pj4+PiBPY3RhbCBEVFIgbW9kZS4KPiA+Pj4+Pgo+ID4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEphaW1lTGlhbyA8amFpbWVsaWFvQG14aWMuY29tLnR3Pgo+ID4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEFsdmluWmhvdSA8YWx2aW56aG91QG14aWMuY29tLnR3Pgo+ID4+Pj4+IC0tLQo+
ID4+Pj4+ICBkcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCA0ICsrKy0KPiA+Pj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pj4+Cj4g
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4+Pj4+IGluZGV4IGYwMzk4MTlhNTI1Mi4uMWE4
Y2NlYmRmZTBlIDEwMDY0NAo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9u
aXguYwo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4+Pj4+
IEBAIC0yMDAsNyArMjAwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jv
bml4X25vcl9wYXJ0c1tdID0gewo+ID4+Pj4+ICAgICAgICAgICAgICAgLm5hbWUgPSAibXgyNWwz
MjU1ZSIsCj4gPj4+Pj4gICAgICAgICAgICAgICAuc2l6ZSA9IFNaXzRNLAo+ID4+Pj4+ICAgICAg
ICAgICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLLAo+ID4+Pj4+IC0gICAgIH0KPiA+Pj4+
PiArICAgICB9LAo+ID4+Pj4+ICsgICAgIC8qIE5lZWQgdGhlIG1hbnVmYWN0dXJlciBmaXh1cHMs
IEtlZXAgdGhpcyBsYXN0ICovCj4gPj4+Pj4gKyAgICAgeyAuaWQgPSBTTk9SX0lEKDB4YzIpIH0K
PiA+Pj4+PiAgfTsKPiA+Pj4+PiAgCj4gPj4+Pgo+ID4+Pj4gQ291bGQgeW91IHBsZWFzZSBlbGFi
b3JhdGUgd2h5IHlvdSBuZWVkIGp1c3QgdGhlIG1hbnVmYWN0dXJlciBpZCBoZXJlPyBJCj4gPj4+
PiB3b3VsZCBoYXZlIGV4cGVjdGVkIHRvIHNlZSBhIHNwZWNpZmljIGZsYXNoIGVudHJ5IGluc3Rl
YWQuICAKPiA+Pj4KPiA+Pj4gR3JhdGVmdWwgdG8gTWljaGFlbCBmb3IgdGhlIHZhbHVhYmxlIHN1
Z2dlc3Rpb24uIFRoaXMgYWRkaXRpb24gb2YgdGhlCj4gPj4+IE1hY3Jvbml4IG1hbnVmYWN0dXJl
ciBJRCBlbmFibGVzIHRoZSBmaXh1cCBmdW5jdGlvbnMgc3VjaCBhcwo+ID4+PiBtYWNyb25peF9u
b3Jfc2V0X29jdGFsX2R0ciB0byBiZSBleGVjdXRlZCB3aXRob3V0IHRoZSBuZWVkIHRvCj4gPj4+
IGNyZWF0ZSBzZXBhcmF0ZSBJRCBlbnRyaWVzIGZvciBlYWNoIE9jdGFsIERUUiBOT1IgRmxhc2gg
aW4gdGhlCj4gPj4+IGZsYXNoX2luZm8uCj4gPj4+ICAKPiA+Pgo+ID4+IEFoLCBuaWNlLiBPa2F5
IHRoZW4uIEknbSBnb2luZyB0byByZXZpZXcgdGhlIHJlc3Qgb2YgdGhlIHBhdGNoZXMuIFRoZXkK
PiA+PiBsb29rIHByb21pc2luZyA7KS4gIAo+ID4gCj4gPiBhaCwgYnV0IHRoZW4geW91J2xsIGFs
d2F5cyBoYXZlIGEgbWF0Y2hlZCBJRCwgc28geW91IGJyZWFrIHRoZSBnZW5lcmljCj4gPiBmbGFz
aCBwcm9iaW5nIGZvciBtYWNyb25peC4gSXMgdGhhdCBjb3JyZWN0PyAgCj4gCj4gQW5zd2VyaW5n
IG15c2VsZjogaXQncyBmaW5lLiBHZW5lcmljIGZsYXNoIHByb2JlIGp1c3QgZmlsbHMgYSBuYW1l
LAo+IHdoaWNoIHdlIGRvbid0IHJlYWxseSBjYXJlIGFib3V0LgoKSSB3YXMgYWxzbyBhIGJpdCBz
dXJwcmlzZWQgYnkgdGhlIGRpZmYsIHdvdWxkIHlvdSBtaW5kIGZpbGxpbmcgYSBtb3JlCmNvbXBs
ZXRlIHdpdGggZGV0YWlscyBvbiB0aGUgYWN0dWFsIGdvYWwgb2YgdGhpcyBlbnRyeSAoaGF2aW5n
IGFsbApNYWNyb25peCBmbGFzaGVzIHRvIGdldCB0aGUgZml4dXBzLCB3aXRob3V0IGNyZWF0aW5n
IHNlcGFyYXRlIElECmVudHJpZXMgZm9yIGVhY2ggb2YgdGhlIGZsYXNoZXMpCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
