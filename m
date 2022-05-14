Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C526FC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 14 May 2022 02:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqP7Gn02f9sDHs9ayWc9l/OLlLVfkY0qekpPRYZ4aUE=; b=J3V8lyYQ/VVkX0guieb3HQAK76
	mNZbL9TrNb0pD464atMXTHEYVxU5znf6WimNl7J5IdJH1r60n7B2VimcZbJvPTluX8EWN3QH5w99e
	AoSx1kmSS+QcpHcoJVqxfEHrFQda4poFU3IahWj+4DWhae/mraLCKUz8T9pTiCg5/c5/LrB+iAou7
	o57yl0+PJfGBgzZpgGD3rMwBbA9qbLZtmTz7PQkLmhNM3gnMyBG0145SEBUX2yov4Pw3nqAUs1KA6
	HgNuHZv32k1UihykhjMVSWROGHPpDyYFEcMaAKq6BnXv6icpR1etgEVR8xWoZ0MkW5k7SO0WCb9n7
	VP2q4sow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nphHJ-000YJK-7Y; Sat, 14 May 2022 02:13:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nphHG-000YH3-0O
 for linux-mtd@lists.infradead.org; Sat, 14 May 2022 02:13:07 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L0TXX73tlzfbJx;
 Sat, 14 May 2022 10:11:40 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:12:56 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 10:12:56 +0800
Subject: Re: [PATCH -next] mtd: st_spi_fsm: add missing
 clk_disable_unprepare() stfsm_remove()
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <vigneshr@ti.com>
References: <20220513100322.2664431-1-yangyingliang@huawei.com>
 <20220513122248.146d6944@xps13>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <0d7ee262-6286-ec41-884e-3ab5863b68b4@huawei.com>
Date: Sat, 14 May 2022 10:12:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220513122248.146d6944@xps13>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_191306_244118_54274332 
X-CRM114-Status: GOOD (  12.40  )
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

SGksCgpPbiAyMDIyLzUvMTMgMTg6MjIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGksCj4KPiB5
YW5neWluZ2xpYW5nQGh1YXdlaS5jb20gd3JvdGUgb24gRnJpLCAxMyBNYXkgMjAyMiAxODowMzoy
MiArMDgwMDoKPgo+PiBDbG9jayBzb3VyY2UgaXMgcHJlcGFyZWQgYW5kIGVuYWJsZWQgYnkgY2xr
X3ByZXBhcmVfZW5hYmxlKCkKPj4gaW4gcHJvYmUgZnVuY3Rpb24sIGJ1dCBubyBkaXNhYmxlIG9y
IHVucHJlcGFyZSBpbiByZW1vdmUgZnVuY3Rpb24uCj4gCQkJIG5vdCBkaXNhYmxlZCBvciB1bnBy
ZXBhcmVkCj4KPiBPdGhlcndpc2UgbG9va3MgZ29vZC4KRG8gSSBuZWVkIHRvIHJlc2VuZCBpdCA/
CgpUaGFua3MsCllhbmcKPgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lp
bmdsaWFuZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9kZXZpY2VzL3N0X3Nw
aV9mc20uYyB8IDIgKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyBiL2RyaXZlcnMv
bXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCj4+IGluZGV4IDk4Mzk5OWMwMjBkNi4uZDMzNzdiMTBm
YzBmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwo+PiAr
KysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwo+PiBAQCAtMjEyNiw2ICsyMTI2
LDggQEAgc3RhdGljIGludCBzdGZzbV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPj4gICB7Cj4+ICAgCXN0cnVjdCBzdGZzbSAqZnNtID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7Cj4+ICAgCj4+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGZzbS0+Y2xrKTsKPj4gKwo+
PiAgIAlyZXR1cm4gbXRkX2RldmljZV91bnJlZ2lzdGVyKCZmc20tPm10ZCk7Cj4+ICAgfQo+PiAg
IAo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
