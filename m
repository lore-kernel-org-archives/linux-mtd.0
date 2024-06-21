Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D2CC27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 04:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKDdNdu2Tyxt6Cm/3QjBQxSYAXw8J4FxSAyAGwkHIbU=; b=a9FpgUpt8ZPe9ovzUSxQrSScAG
	3silPs/YDha2fjP13soGTKnRe8z0VXZTJlYYdNuDatcV680OOJyVw0ky0ZV+gE9QIjPGm7RMYXkqL
	l+buwhM4Dy6A9l88Q5CiAktnguXPmZa8eA3cUxgwYyDMo+iFe1MGh3uOgi6QKPSCV94kC8dk6Y/iY
	t3zsF60lifls46a4NMSRksz14IXsb/xdF+siP45y+d5PkYAjEiS6L0LYJ9nL/I0b+xuykmJrE6jJF
	gSqmA2HGdTHLYv9f1tB2x1ycWtlEtKhnlXUhm7T0vTmVAuym3KgIjzMaTCMRe00F61dXxQS7Stzbv
	q0W+pgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWJN-00000007h7w-1vCn;
	Fri, 21 Jun 2024 04:55:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWJI-00000007h6z-3bVJ
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 04:55:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4W54gg5ZQfz1N7wp;
	Fri, 21 Jun 2024 12:51:11 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id ED958180060;
	Fri, 21 Jun 2024 12:55:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 12:55:27 +0800
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Gagan Sidhu <broly@mac.com>
CC: Daniel Golle <daniel@makrotopia.org>, Richard Weinberger <richard@nod.at>,
	ZhaoLong Wang <wangzhaolong1@huawei.com>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, yangerkun <yangerkun@huawei.com>, yi zhang
	<yi.zhang@huawei.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
 <E3E2C13C-1E52-46F2-BE2D-D2592C3369DB@mac.com>
 <F2DCFCE7-68FA-4C09-AE5B-09F2233575F1@mac.com>
 <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com>
 <303502000.252057.1718647746641.JavaMail.zimbra@nod.at>
 <90A90DA4-8B68-432D-9577-0D3635AF84BB@mac.com>
 <296007365.252185.1718649153090.JavaMail.zimbra@nod.at>
 <3841F21D-CA54-456C-9D9C-F06EEA332A30@mac.com>
 <136290141.252319.1718650375432.JavaMail.zimbra@nod.at>
 <ZnCcsPA-flVcxiAT@makrotopia.org>
 <C20708FB-0626-475E-A996-DE42ACF57A8B@mac.com>
 <C7514984-8CEB-4D1F-A896-BD6E653D311B@mac.com>
 <251ae039-9f46-081b-a7ee-fe47de268865@huawei.com>
 <EFEC7C06-A3B2-46D6-99F4-ADA7F7199188@mac.com>
 <45d2ef27-95cc-16c4-8b0a-4413421d785b@huawei.com>
 <772249DB-434C-4AB9-AE6B-1CB684E1E11A@mac.com>
 <e562e94b-274d-4a82-3dad-d3e1109a2607@huawei.com>
 <7558AC97-FFFC-4593-B946-9F8FBD8D62FA@mac.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <da6f4aa8-e79d-d70a-eeb5-0068ffc1ef52@huawei.com>
Date: Fri, 21 Jun 2024 12:55:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7558AC97-FFFC-4593-B946-9F8FBD8D62FA@mac.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_215541_255449_47B6E628 
X-CRM114-Status: GOOD (  25.78  )
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

5ZyoIDIwMjQvNi8yMSAxMjoyNywgR2FnYW4gU2lkaHUg5YaZ6YGTOgo+IAo+IAo+PiBPbiBKdW4g
MjAsIDIwMjQsIGF0IDk6MDMgUE0sIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgo+Pgo+PiDlnKggMjAyNC82LzIxIDEwOjA5LCBHYWdhbiBTaWRodSDlhpnpgZM6
Cj4+PiBUaGFua3MsCj4+PiBHYWdhbgo+Pj4+IE9uIEp1biAyMCwgMjAyNCwgYXQgNzo1OSBQTSwg
WmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiDl
nKggMjAyNC82LzIxIDY6MDYsIEdhZ2FuIFNpZGh1IOWGmemBkzoKPj4+Pj4gaGkgemhpaGFvLAo+
Pj4+PiBzbyBpIGFzc3VtZSBteSBjcnVkZSBwYXJhcGhyYXNlIGlzIGNvcnJlY3Q/IHRoYXQgaSBt
YXkgaGF2ZSB1bmludGVudGlvbmFsbHkgcG9pbnRlZCB0aGUgZmluZ2VyIGF0IHlvdSwgYnV0IHRo
ZSByZWFsIGlzc3VlIGlzIEdMVUVCSSBleGlzdGluZyB3aXRoIEJMT0NLIG9uIHRoZSBzYW1lIHZv
bHVtZT8KPj4+Pgo+Pj4+IFVoaGgsIEkgZG9uJ3QgdGhpbmsgSSBtZWFuIHRoaXMuIFdlIHdpbGwg
bWFrZSBpdCBjbGVhciBhZnRlciBnZXR0aW5nIHRoZSBsYXllcnMnIGluZm9ybWF0aW9uIGFib3V0
IHlvdXIgZGV2aWNlLgo+Pj4+IEV2ZXJ5dGhpbmcgZ29lcyB3ZWxsIGZyb20geW91IGd1eXMgdGFs
a2luZywgdGhpcyBwYXRjaCBkaWQgcmVqZWN0IHRoZSBtdGRibG9jayBsb2FkaW5nIGZyb20gYSBn
bHVlYmkgZGV2aWNlLCB3aGljaCBtYXkgbGVhZCBib290aW5nIGZhaWxlZCBpZiB5b3VyIHJvb3Rm
cyBkZXBlbmRzIG9uIGEgbXRkYmxvY2sod2hpY2ggaXMgZ2VuZXJhdGVkIGZyb20gdGhlIGdsdWVi
aSBkZXZpY2UpLgo+Pj4+ICBGcm9tIHlvdXIgZGVzY3JpcHRpb24gJ3Nwb2tlIHRvIGEgdXNlciwg
Z2F2ZSBoaW0gYSBidWlsZCB3aXRob3V0IE1URF9HTFVFQkksIHJlc3RvcmluZyBjaGFuZ2VzIG1h
ZGUgYnkgKEhBSEFIQSB5b3UgYXJlISBodWF3ZWkpLCBpdCBib290ZWQgZmluZScuIE9uZSB0aGlu
ZyBJJ20gY3VyaW91cyBhYm91dCwgaWYgdGhlIGRldmljZSBib290cyBmcm9tIHRoZSBtdGRibG9j
ayh3aGljaCBpcyBnZW5lcmF0ZWQgZnJvbSBnbHVlYmkgZGV2aWNlKSwgdGhlIGdsdWViaSBkZXZp
Y2Ugd29uJ3QgYmUgZ2VuZXJhdGVkIGJlY2F1c2UgeW91IGhhdmUgdHVybmVkIG9mZiB0aGUgQ09O
RklHX01URF9VQklfR0xVRUJJLCB0aGVuIHRoZSBkZXZpY2UgYm9vdHMgc3VjY2Vzc2Z1bGx5LCB3
aGljaCBtZWFucyB0aGF0IHlvdXIgcm9vdGZzIGlzIG1vc3QgbGlrZWx5IGxvYWRlZCBmcm9tIHVi
aWJsb2NrMF8wLiBNeSBxdWVzdGlvbnMgYXJlOgo+Pj4+IFExLiBBY2NvcmRpbmcgdG8gcHJldmlv
dXMgdGFsa2luZywgdGhlIGJvb3RpbmcgY29uZmlndXJhdGlvbiBpcwo+Pj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9kcml2ZXJzL210ZC9tdGRjb3JlLmMj
TDc3NCwgd2h5IHRoZSBkZXZpY2UgY291bGQgYm9vdCBmcm9tIHViaWJsb2NrMF8wPyhpdCBsb29r
cyBsaWtlIHRoYXQgdGhlIGRldmljZSB1c2VzIGNvbmZpZyBmcm9tIGh0dHBzOi8vZ2l0Lm9wZW53
cnQub3JnLz9wPW9wZW53cnQvb3BlbndydC5naXQ7YT1ibG9iO2Y9dGFyZ2V0L2xpbnV4L2dlbmVy
aWMvcGVuZGluZy01LjE1LzQ5My11Ymktc2V0LVJPT1RfREVWLXRvLXViaWJsb2NrLXJvb3Rmcy1p
Zi11bnNldC5wYXRjaDtoPTI2NmE2MzMxYzJhY2MwZjdjMTdkOWFjNzJmNTQ2NTlkMzFiNTYyNDk7
aGI9SEVBRCBbcG9pbnRlZCBieSBSaWNoYXJkXSkuIEknbSB1bmZhbWlsYXIgd2l0aCBvcGVud3J0
KE1heWJlIHlvdSBhbmQgRGFuaWVsIGtub3cgbXVjaCksIGlzIHRoYXQgcG9zc2libGUgdGhlIGRl
dmljZSBjb3VsZCBhdXRvbWF0aWNhbGx5IGNob29zZSBib290IGRldmljZSBpbiB0aGUgb3Blbndy
dCBmcmFtZXdvcms/Cj4+PiB5ZXMsIHRoYXQgcGF0Y2ggd2lsbCwgZWZmZWN0aXZlbHksIGFsbG93
IGFuIOKAnGF1dG9zZWxlY3TigJ0gb2YgdGhlIHViaSBwYXJ0aXRpb24gYmVjYXVzZSBpdCBsb29r
cyBmb3IgdGhlIHN0cmluZyDigJxyb290ZnPigJ0gaW4gdGhlIHViaS1mb3JtYXR0ZWQgZmlsZS4K
Pj4+IG9uY2UgaXQgZmluZHMgdGhlIOKAnHJvb3Rmc+KAnSBwYXJ0aXRpb24sIGl0IHdpbGwgcmVu
YW1lIGl0IHRvIOKAnHViaeKAnSBhbmQgdGhhdCB3aWxsIGJlIHNldCBhcyB0aGUgYm9vdC9yb290
IHBhcnRpdGlvbgo+Pgo+PiBPaCwgbWF5YmUgSSBrbm93IHdoYXQgaGFzIGhhcHBlbmVkLiBBY2Nv
cmRpbmcgdG8gdGhlIGNvbmZpZ3VyYXRpb24gb2YgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRz
L2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvbXRkL210ZGNvcmUuYyNMNzc0LCBvcGVud3J0IGRl
Y2lkZXMgdG8gYm9vdCByb290ZnMgZnJvbSBtdGRibG9jayh3aGljaCBpcyBnZW5lcmF0ZWQgZnJv
bSB0aGUgZ2x1ZWJpIGRldmljZSksIGJlY2F1c2UgdGhlIG10ZCBjaGFyIGRldmljZSAod2hpY2gg
aXMgZ2VuZXJ0YXRlZCBmcm9tIGdsdWViaSBkZXZpY2UpIGlzIGZvdW5kIGJ5IG9wZW53cnQuIEhv
d2V2ZXIsIHRoaXMgcGF0Y2ggc3RvcHMgZ2VuZXJhdGluZyBtdGRibG9jayBmcm9tIGdsdWViaSBk
ZXZpY2UsIHNvIHRoZSBtb3VudGluZyBmYWlsZWQgYnkgbWlzc2VkIG10ZGJsb2NrLiBBZnRlciBk
aXNhYmxpbmcgdGhlIENPTkZJR19NVERfVUJJX0dMVUVCSSwgdGhlIGdsdWViaSBkZXZpY2UgaXMg
bm90IGdlbmVyYXRlZCwgc28gb3BlbndydCBkZWNpZGVzIHRvIGJvb3Qgcm9vdGZzIGZyb20gdWJp
YmxvY2swXzAsIHRoZW4geW91ciBkZXZpY2UgYm9vdGVkIHN1Y2Nlc3NmdWxseS4KPj4gVGhlIGtl
eSBpcyB0aGUgcm9vdGZzIGRldmljZSBqdWRnZW1lbnQgaW4gb3BlbndydCwgb3BlbndydCBjaG9v
c2VzIHRoZSByb290ZnMgZGV2aWNlIGFjY29yZGluZyB0byB0aGUgZXhpc3RlbmNlIG9mIG10ZCBj
aGFyIGRldmljZSwgb3BlbndydCBub3QgY2hlY2sgd2hldGhlciB0aGUgY29ycmVzcG9uZGluZyBt
dGRibG9jayBleGlzdHMgYmVmb3JlIG1vdXRpbmcgaXQuIFNob3VsZCBvcGVud3J0IGNoZWNrIHRo
ZSBleGlzdGVuY2Ugb2YgbXRkYmxvY2sgYmVmb3JpbmcgdXNpbmcgaXQ/IE9yIG1heWJlIG9wZW53
cnQgY291bGQgdHVybiB0byB1c2UgdWJpYmxvY2sgaWYgdGhlIG10ZGJsb2NrIGRldmljZSBpcyBu
b3QgZm91bmQ/Cj4gCj4gYXMgaSB1bmRlcnN0YW5kIGl0LCB0aGUgb3BlbndydCBwYXRjaCByZXF1
aXJlcyB0aGUgbXRkYmxvY2sgZGV2aWNlIHRvIGV4aXN0IGJlZm9yZSBmaW5kaW5nIGl0LiBpdCBk
b2VzIG5vdCByZWx5IG9uIGdsdWViaSB0byBnZW5lcmF0ZSBhbnl0aGluZy4KClllcywgb3Blbndy
dCBrbm93cyBub3RoaW5nIHVuZGVyIHRoZSBtdGQgbGF5ZXIoV2hhdGV2ZXIgdGhlIG10ZCBpcyAK
Z2VuZXJhdGVkIGJ5IGEgZ2x1ZWJpIGRldmljZSBvciB0aGUgbXRkIGlzIGEgcmVhbCBwaHlzaWNh
bCBuYW5kIGZsYXNoKS4gCkkgbWVhbiwgdGhlIGxheWVycycgaW5mb3JhbXRpb24gb24geW91ciBk
ZXZpY2UgY291bGQgYmUoVGhlIHNxdWFzaGZzIAppbWFnZSBpcyBzdG9yZWQgaW4gVUJJIHZvbHVt
ZSB1YmkwXzAuKToKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKGlyB1
YmlibG9jazBfMAptdGRYKG5hbmQpIC0+IFVCSShob2xkcyB2b2x1bWUgdWJpMF8wKQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICDihpggbXRkMTIoZ2x1ZWJpKSAtPiBtdGRi
bG9jazEyCgpUaGUgb3BlbndydCBvbmx5IHNlZXMgdWJpYmxvY2swXzAsIG10ZDEyIGFuZCBtdGRi
bG9jazEyKFRoZSB1YmkwXzAgYW5kIApnbHVlYmkgYXJlIG5vdCBhd2FyZWQgYnkgb3BlbndydCku
IFRoZSBvcGVud3J0IGRldGVjdHMgdGhhdCBtdGQxMiBoYXMgCmxhYmVsICdsaW51eCxyb290ZnMn
IGluIGRldmljZSB0cmVlLCBzbyBpdCB0cmllcyBtb3V0aW5nIG10ZGJsb2NrMTIgCndpdGhvdXQg
Y2hlY2tpbmcgdGhlIGV4aXN0ZW5jZSBvZiBtdGRibG9jazEyLgpDb3VsZCB0aGF0IGJlIHBvc3Np
YmxlPwoKPiAKPiB0aGUgbXRkIGNoYXIgZGV2aWNlIGlzIG5vdCBnZW5lcmF0ZWQgZnJvbSBnbHVl
YmkuIG9wZW53cnQgZG9lcyBub3QgdXNlIGdsdWViaSBhdCBhbGwuIGkgd2FzIGp1c3QgYmVpbmcg
cGFyYW5vaWQgYW5kIGhhZCB0b28gbWFueSBvcHRpb25zIGVuYWJsZWQuCj4gCS1ob3dldmVyLCBt
eSBwYXJhbm9pYSBoYXMgaWxsdW1pbmF0ZWQgYW4gaXNzdWUgd2l0aCByZWdhcmRzIHRvIEdMVUVC
SSBhbmQgVUJJX0JMT0NL4oCZcyBjb2V4aXN0ZW5jZS4KPiAKPiBodHRwczovL2dpdC5vcGVud3J0
Lm9yZy8/cD1vcGVud3J0L29wZW53cnQuZ2l0O2E9YmxvYjtmPXRhcmdldC9saW51eC9nZW5lcmlj
L3BlbmRpbmctNS4xNS80MDAtbXRkLW10ZHNwbGl0LXN1cHBvcnQucGF0Y2g7aD00NmVmMTVkMTI3
ZGZiNjg2ZTQ0NThmZDU4MzhjM2VhZWM4YWEyY2Q3O2hiPUhFQUQKPiAKPiBvcGVud3J0IHJlbGll
cyBvbiBkZXZpY2UgdHJlZSwgaW4gdGhpcyBjYXNlIHdpdGggYXR0cmlidXRlIOKAnGZpeGVkLXBh
cnRpdGlvbuKAnSBhbmQgYWRkaXRpb25hbCBwYXJhbWV0ZXIKPiBvcGVud3J04oCZcyBzcGxpdF9y
b290ZnNfZGV2IG1lcmVseSByZXF1aXJlcyBhIHBhcnRpdGlvbiB3aXRoIHRoZSBsYWJlbCByb290
ZnMgdG8gYmUgdXNlZCwgYW5kIGl0IHdpbGwgYXV0b21hdGljYWxseSBjcmVhdGUgdGhlIHJvb3Rm
cyAoaWYgdGhlIHNwbGl0dGluZyBjcml0ZXJpYSkgYXJlIHNhdGlzZmllZC4KPiAKPiBzcGxpdF9y
b290ZnNfZGV2IHJlcXVpcmVzLCBhcyBhIHByZXJlcXVpc2l0ZSwgdGhhdCB0aGVyZSBpcyBhIHBh
cnRpdGlvbiBvbiB0aGUgZmxhc2ggdGhhdCBjYW4gYmUg4oCcc3BsaXTigJ0uIGFmdGVyIHRoYXQs
IGl0IHdpbGwgcmVseSBvbiB1YmkgdG8gY3JlYXRlIHJvb3RmcyBmb3IgYm9vdC4KPiAJLWnigJlt
IGEgbGl0dGxlIGxhenkgcmlnaHQgbm93IG9uIGV4cGxhaW5pbmcgdGhlIGRldGFpbHMsIGJ1dCB0
cnVzdCBtZSBpdCBkb2VzbuKAmXQgbmVlZCBnbHVlYmkgdG8gY3JlYXRlIHRoZSBibG9jayBkZXZp
Y2UuCj4gCj4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
