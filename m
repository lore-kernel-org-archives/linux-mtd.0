Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5431C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9B7jj4zcewBYq3APL1J7/ZiOU3uolfJ/F0Y+ZNayCnI=; b=ujWK/JCriiuyiY
	BiFy2H3404p01oIvcc4MNOHSJFbg9xn03w56HeJzfiSFkgc7KaJ8plH4Kk+7L2jDpg1FG8mLOk3VS
	HJCsv1uTFSvlcDbEXkbr1MIf+vjzsBUbrZOFiVjxawP4lk0Wc6KdLCc4MmcMoXuEq8XI6DhJmCiiF
	zTIrlPhU2QicH59ugJw0rMAV+yQfIgaa0tLZ3SXpiNiDriFbMcEPSh2Na470Mn3Og+uTe5KL8vUIS
	THee7BkzdXWlUv3QV9UOfHwGhBZGOXJAVkkicgHlRbZ/pWtfHwpCer3iIcDAtZN+W18ZQAnJuqgGt
	BM33EFpYfIr5k92mEVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfLez-00ABlt-J8; Fri, 15 Apr 2022 13:06:49 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfLeu-00ABlJ-A5
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 13:06:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23FD6VGD051337;
 Fri, 15 Apr 2022 08:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650027992;
 bh=Ve5xYqL0vSew6zIe9aVuRNUvwNXQm0EYwplrOk14rUc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=vyVbrHcPYrc7p31oFsSy1C9miGI/Bzk/0QeWtYKd3cqMEZLncyZPk1vJbW1DdCVLU
 jy+u8aakdjX/sFLkrHHyF/vk9iO6VXf734/BKWlf5WbRymLKKXMrySVJWMYMEIz5rL
 zEW1xqWfF4JyOuQiFzj9OEDqMOEIvAPK9muaJORo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23FD6VGK128449
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 Apr 2022 08:06:31 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 15
 Apr 2022 08:06:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 15 Apr 2022 08:06:31 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23FD6SkE028604;
 Fri, 15 Apr 2022 08:06:28 -0500
Message-ID: <5d8ba4e2-a281-5d0f-d65f-bb0121165b73@ti.com>
Date: Fri, 15 Apr 2022 16:06:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Content-Language: en-US
To: Romain Naour <romain.naour@smile.fr>, Roger Quadros <rogerq@kernel.org>,
 <krzysztof.kozlowski@canonical.com>, <miquel.raynal@bootlin.com>,
 <tony@atomide.com>
CC: <robh@kernel.org>, <kishon@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
 <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
From: Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_060644_536429_8C783F31 
X-CRM114-Status: GOOD (  20.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxNS8wNC8yMDIyIDExOjU5LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
TGUgMjEvMTIvMjAyMSDDoCAxNDoxNywgUm9nZXIgUXVhZHJvcyBhIMOpY3JpdMKgOgo+PiBIaSwK
Pj4KPj4gVEkncyBBTTY0IFNvQyBjb250YWlucyBvbmUgR1BNQyBtb2R1bGUuIEFkZCBkcml2ZXIg
c3VwcG9ydCBmb3IgaXQuCj4gCj4gV2hhdCdzIHRoZSBzdGF0dXMgb2YgdGhlIEdQTUMgaW50ZXJm
YWNlIG9uIEszIGFyY2hpdGVjdHVyZSwgZXNwZWNpYWxseSBmb3IgQU02NSwKPiBBTTYyIGFuZCBv
dGhlciBKYWNpbnRvIDcgQ1BVIGRldmljZXMgPwo+IAo+IFRJIGN1cnJlbnRseSBkb24ndCByZWNv
bW1lbmQgdG8gdXNlIGl0IGZvciBub3cgZXZlbiBpZiB0aGVyZSBhcmUgc3RpbGwgc29tZSBHUE1D
Cj4gdXNlIGNhc2Ugd2l0aCBGUEdBIGRldmljZXM6Cj4gCj4gaHR0cHM6Ly9lMmUudGkuY29tL3N1
cHBvcnQvcHJvY2Vzc29ycy1ncm91cC9wcm9jZXNzb3JzL2YvcHJvY2Vzc29ycy1mb3J1bS85OTQx
OTEvYW02NDQyLWFtNjR4LWdwbWMtc3VwcG9ydAo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZCBv
bWFwLWdwbWMgc3VwcG9ydCBmb3IgQU02NCBTb2MgYnV0IGFzIG9mIGtlcm5lbCA1LjE4LXJjMiwK
PiB0aGVyZSBpcyBubyBkZXZpY2V0cmVlIHVzaW5nIHRpLGFtNjQtZ3BtYy4KPiAKPiBUaGlzIHBh
dGNoIHNlZW1zIG1pc3NpbmcgKGF0IGxlYXN0KToKPiBodHRwczovL2dpdC50aS5jb20vY2dpdC90
aS1saW51eC1rZXJuZWwvdGktbGludXgta2VybmVsL2NvbW1pdC8/aD10aS1saW51eC01LjEwLnkm
aWQ9NTVjMTAyYTc1ZDM5OTg5NmM3Mzk2MjI5Y2Q2ODdiZjk3YWZiNWNmNgoKSXQncyBub3QgaG93
IExLTUwgZGV2ZWxvcG1lbnQgcHJvY2VzcyB3b3JrcyAtIGRyaXZlciBjaGFuZ2VzIGhhcyB0byBi
ZSBzZW50IGZpcnN0CmFuZCB0aGVuIERUIGNoYW5nZXMgIGFzIHRoZXkgYWNjZXB0ZWQgYnkgZGlm
ZmVyZW50IG1haW50YWluZXJzIGFuZCB0aHJvdWdoIGRpZmZlcmVudCB0cmVlcy4KCj4gCj4gVGhh
bmtzIQo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPj4KPj4gY2hlZXJzLAo+PiAtcm9n
ZXIKPj4KPj4gQ2hhbmdlbG9nOgo+PiB2NAo+PiAtIG1vdmUgY29tcGF0aWJsZSBtYXRjaCB0YWJs
ZSB0byBoZWFkZXIgZmlsZSBzbyBpdCBjYW4gYmUgdXNlZCBieQo+PiBHUE1DIGRyaXZlciBldmVu
IHdoZW4gTkFORCBkcml2ZXIgaXMgbm90IGVuYWJsZWQgb3IgYXMgYSBtb2R1bGUuCj4+IEdQTUMg
ZHJpdmVyIGlzIGFsd2F5cyBlbmFibGVkIGFzIGJ1aWx0LWluLgo+PiAtIFNlbGVjdCBPTUFQX0dQ
TUMgZHJpdmVyIGZyb20gTVREX05BTkRfT01BUDIgZHJpdmVyIGNvbmZpZyBhcwo+PiBPTUFQX0dQ
TUMgaXMgbm90IGVzc2VudGlhbCBmb3IgQVJDSF9LMyBib290Lgo+Pgo+PiB2Mwo+PiAtIHVzZSBj
b21wYXRpYmxlIG1hdGNoIHRhYmxlIGZvciBjaGVja2luZyBmb3IgTkFORCBjb250cm9sbGVyIG5v
ZGUgaW4KPj4gR1BNQyBkcml2ZXIuCj4+Cj4+IHYyCj4+IC0gdXBkYXRlIERUIGJpbmRpbmcgZG9j
IHRvIG1ha2UgcmVnLW5hbWVzIGFuZCBwb3dlci1kb21haW5zIHByb3BlcnR5Cj4+IHJlcXVpcmVk
IG9ubHkgZm9yIHNwZWNpZmljIFNvQy4KPj4KPj4gUm9nZXIgUXVhZHJvcyAoNCk6Cj4+ICAgIGR0
LWJpbmRpbmdzOiBtZW1vcnktY29udHJvbGxlcnM6IHRpLGdwbWM6IEFkZCBjb21wYXRpYmxlIGZv
ciBBTTY0Cj4+ICAgIG1lbW9yeTogb21hcC1ncG1jOiBBZGQgc3VwcG9ydCBmb3IgR1BNQyBvbiBB
TTY0IFNvQwo+PiAgICBtZW1vcnk6IG9tYXAtZ3BtYzogVXNlIGEgY29tcGF0aWJsZSBtYXRjaCB0
YWJsZSB3aGVuIGNoZWNraW5nIGZvciBOQU5ECj4+ICAgICAgY29udHJvbGxlcgo+PiAgICBtdGQ6
IHJhd25hbmQ6IG9tYXAyOiBTZWxlY3QgR1BNQyBkZXZpY2UgZHJpdmVyIGZvciBBUkNIX0szCj4+
Cj4+ICAgLi4uL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy90aSxncG1jLnlhbWwgIHwgMjMg
KysrKysrKysrLQo+PiAgIGRyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jICAgICAgICAgICAgICAg
ICAgICB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0KPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9L
Y29uZmlnICAgICAgICAgICAgICAgICAgfCAgMSArCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
b21hcDIuYyAgICAgICAgICAgICAgICAgIHwgIDUgKy0KPj4gICBpbmNsdWRlL2xpbnV4L3BsYXRm
b3JtX2RhdGEvbXRkLW5hbmQtb21hcDIuaCAgfCAgOSArKystCj4+ICAgNSBmaWxlcyBjaGFuZ2Vk
LCA2NyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPj4KPiAKCi0tIApCZXN0IHJlZ2Fy
ZHMsCkdyeWdvcmlpLCBVa3JhaW5lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
