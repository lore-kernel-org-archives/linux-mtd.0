Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFFAC001DF
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 02:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJ0o7pJcG9cnfg7mK1cJ9zUB6mnYOVOCYHrbEEZOdlE=; b=S1k3VOLIbRYWYBEn3PxJXYSMdB
	Fsd/BvBAnuATeITwHbpGpHCaaDdSRt4aO+MsF5CSYSPRmIf1VO+gK+gjHfYBdwFkS0t4SV9a9VCwW
	8P1anK2HCJf8VLJdsJTKgtSYtYHbgazjLmdAd4iKgw2/Z3txUuGbQ7kZSAC4QaP3YkuctqsTQNJFt
	jvXkJzLNX5C3PMcyS713mAfOr4Q5TkbpG47Mt0GX6frTOh8DB7UmNOxCd9ecyLT57JgcvoH0X4qvg
	gW5jQ3Un0N76nmGTM6XO9/EETYvGLGQAFyegSn66SncTfghQUUgQfHUXHRjYVr4v79xiLUaV5FAWO
	bRnIxJeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtfFY-0011mL-1p;
	Fri, 20 Oct 2023 02:28:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtfFU-0011lD-0Y
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 02:28:30 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SBT0C5RDSzvQCn;
	Fri, 20 Oct 2023 10:23:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 20 Oct 2023 10:28:09 +0800
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: Richard Weinberger <richard@nod.at>, ZhaoLong Wang
	<wangzhaolong1@huawei.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <dpervushin@embeddedalley.com>, Artem Bityutskiy
	<Artem.Bityutskiy@nokia.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, yi zhang <yi.zhang@huawei.com>,
	yangerkun <yangerkun@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com>
 <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <891e554b-c133-6378-3a65-836fc9147e54@huawei.com>
Date: Fri, 20 Oct 2023 10:27:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_192828_675875_EA2D7D24 
X-CRM114-Status: GOOD (  18.41  )
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

5ZyoIDIwMjMvMTAvMjAgNDoyNywgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIlpoYW9Mb25nIFdhbmciIDx3YW5nemhh
b2xvbmcxQGh1YXdlaS5jb20+Cj4+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIk1p
cXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFnaGF2
ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+PiBkcGVydnVzaGluQGVtYmVkZGVkYWxsZXkuY29t
LCAiQXJ0ZW0gQml0eXV0c2tpeSIgPEFydGVtLkJpdHl1dHNraXlAbm9raWEuY29tPgo+PiBDQzog
ImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWtlcm5l
bCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAiY2hlbmd6aGloYW8xIgo+PiA8Y2hl
bmd6aGloYW8xQGh1YXdlaS5jb20+LCAiWmhhb0xvbmcgV2FuZyIgPHdhbmd6aGFvbG9uZzFAaHVh
d2VpLmNvbT4sICJ5aSB6aGFuZyIgPHlpLnpoYW5nQGh1YXdlaS5jb20+LCAieWFuZ2Vya3VuIgo+
PiA8eWFuZ2Vya3VuQGh1YXdlaS5jb20+Cj4+IEdlc2VuZGV0OiBNaXR0d29jaCwgMTguIE9rdG9i
ZXIgMjAyMyAxNDoxNjoxOAo+PiBCZXRyZWZmOiBbUEFUQ0ggdjJdIHViaTogZ2x1ZWJpOiBGaXgg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGNhdXNlZCBieSBmdGwgbm90aWZpZXIKPiAKPj4gSWYg
Ym90aCBmbHQua28gYW5kIGdsdWViaS5rbyBhcmUgbG9hZGVkLCB0aGUgbm90aWllciBvZiBmdGwK
Pj4gdHJpZ2dlcnMgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gdHJ5aW5nIHRvIGFjY2Vz
cwo+PiDigJhnbHVlYmktPmRlc2PigJkgaW4gZ2x1ZWJpX3JlYWQoKS4KPj4KPj4gdWJpX2dsdWVi
aV9pbml0Cj4+ICAgdWJpX3JlZ2lzdGVyX3ZvbHVtZV9ub3RpZmllcgo+PiAgICAgdWJpX2VudW1l
cmF0ZV92b2x1bWVzCj4+ICAgICAgIHViaV9ub3RpZnlfYWxsCj4+ICAgICAgICAgZ2x1ZWJpX25v
dGlmeSAgICBuYi0+bm90aWZpZXJfY2FsbCgpCj4+ICAgICAgICAgICBnbHVlYmlfY3JlYXRlCj4+
ICAgICAgICAgICAgIG10ZF9kZXZpY2VfcmVnaXN0ZXIKPj4gICAgICAgICAgICAgICBtdGRfZGV2
aWNlX3BhcnNlX3JlZ2lzdGVyCj4+ICAgICAgICAgICAgICAgICBhZGRfbXRkX2RldmljZQo+PiAg
ICAgICAgICAgICAgICAgICBibGt0cmFuc19ub3RpZnlfYWRkICAgbm90LT5hZGQoKQo+PiAgICAg
ICAgICAgICAgICAgICAgIGZ0bF9hZGRfbXRkICAgICAgICAgdHItPmFkZF9tdGQoKQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgc2Nhbl9oZWFkZXIKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
bXRkX3JlYWQKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfcmVhZAo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWRfb29iCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdsdWViaV9yZWFkICAgbXRkLT5yZWFkKCkKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnbHVlYmktPmRlc2MgLSBOVUxMCj4+Cj4+IERldGFpbGVkIHJlcHJvZHVj
dGlvbiBpbmZvcm1hdGlvbiBhdmFpbGFibGUgYXQgdGhlIGxpbmtbMV0sCj4+Cj4+IEluIHRoZSBu
b3JtYWwgY2FzZSwgb2J0YWluIGdsdWViaS0+ZGVzYyBpbiB0aGUgZ2x1ZWJpX2dldF9kZXZpY2Uo
KSwKPj4gYW5kIGFjY2Vzc2VzIGdsdWViaS0+ZGVzYyBpbiB0aGUgZ2x1ZWJpX3JlYWQoKS4gSG93
ZXZlciwKPj4gZ2x1ZWJpX2dldF9kZXZpY2UoKSBpcyBub3QgZXhlY3V0ZWQgaW4gYWR2YW5jZSBp
biB0aGUKPj4gZnRsX2FkZF9tdGQoKSBwcm9jZXNzLCB3aGljaCBsZWFkcyB0byBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UuCj4+Cj4+IFRoZSB2YWx1ZSBvZiBnbHVlYmktPmRlc2MgbWF5IGFsc28g
YmUgYSBuZWdhdGl2ZSBlcnJvciBjb2RlLCB3aGljaAo+PiB0cmlnZ2VycyB0aGUgcGFnZSBmYXVs
dCBlcnJvci4KPj4KPj4gVGhpcyBwYXRjaCBoYXMgdGhlIGZvbGxvd2luZyBtb2RpZmljYXRpb25z
Ogo+Pgo+PiAxLiBEbyBub3QgYXNzaWduIGdsdWViaS0+ZGVzYyB0byB0aGUgZXJyb3IgY29kZS4g
VXNlIHRoZSBOVUxMIGluc3RlYWQuCj4+Cj4+IDIuIEFsd2F5cyBjaGVjayB0aGUgdmFsaWRpdHkg
b2YgZ2x1ZWJpLT5kZXNjIGluIGdsdWViaV9yZWFkKCkgSWYgdGhlCj4+ICAgIGdsdWViaS0+ZGVz
YyBpcyBOVUxMLCB0cnkgdG8gZ2V0IE1URCBkZXZpY2UuCj4+Cj4+IFN1Y2ggYSBtb2RpZmljYXRp
b24gY3VycmVudGx5IHdvcmtzIGJlY2F1c2UgdGhlIG11dGV4ICJtdGRfdGFibGVfbXV0ZXgiCj4+
IGlzIGhlbGQgb24gYWxsIG5lY2Vzc2FyeSBwYXRocywgaW5jbHVkaW5nIHRoZSBmdGxfYWRkX210
ZCgpIGNhbGwgcGF0aCwKPj4gb3BlbiBhbmQgY2xvc2UgcGF0aHMuIFRoZXJlZm9yZSwgbWFueSBy
YWNlIGNvbmRpdGlvbiBjYW4gYmUgYXZvaWRlZC4KPiAKPiBJIHNlZSB0aGUgcHJvYmxlbSwgYnV0
IEknbSBub3QgcmVhbGx5IHNhdGlzZmllZCBieSB0aGUgc29sdXRpb24uCj4gQWRkaW5nIHRoaXMg
aGFjayB0byBnbHVlYmlfcmVhZCgpIGlzIG5vdCBuaWNlIGF0IGFsbC4KClllcywgaXQncyBqc3V0
IGEgd29ya2Fyb3VuZC4gQXQgdGhlIGJlZ2luaW5nLCBJIHByZWZlciB0aGF0IGluY3JlYXNpbmcg
CnZvbHVtZSByZWZjbnQgKGJ5IHViaV9vcGVuX3ZvbHVtZSkgaW4gZ2x1ZWJpX2NyZWF0ZSBhbmQg
cmVsZWFzaW5nIHZvbHVtZSAKcmVmY250IGluIGdsdWViaV9yZW1vdmUuIEl0IGxvb2tzIG1vcmUg
cmVhc29uYWJsZSB0aGF0IGhvbGRpbmcgYSByZWZjbnQgCm9mIFVCSSB2b2x1bWUgd2hlbiBnbHVl
YmkgaXMgYWxpdmUuIEFmdGVyIGxvb2tpbmcgdGhyb3VnaCB0aGUgY29kZSwgdGhlIApjcmVhdGlv
bi9kZXN0cm95aW5nIG9mIGdsdWViaSBpcyB0cmlnZ2VyZWQgYnkgdm9sdW1lIAphY3Rpb25zKFVC
SV9WT0xVTUVfQURERUQvVUJJX1ZPTFVNRV9SRU1PVkVEKSwgd2hpY2ggbWVhbnMgdGhhdDoKMS4g
Z2x1ZWJpX3JlbW92ZSBpcyBkZXBlbmRlZCBvbiBVQklfVk9MVU1FX1JFTU9WRUQodHJpZ2dlcmVk
IGJ5IAp1YmlfcmVtb3ZlX3ZvbHVtZSkKMi4gdWJpX3JlbW92ZV92b2x1bWUgd29uJ3QgYmUgZXhl
Y3V0ZWQgdW50aWwgdGhlIHJlZmNudCBvZiB2b2x1bWUgCmJlY29tZXMgMChyZWxlYXNlZCBieSBn
bHVlYmlfcmVtb3ZlKQoKSWYgd2UgYWRkIG5ldyBpb2N0bHMgdG8gY29udHJvbCBjcmVhdGlvbi9k
ZXN0cm95aW5nIG9mIGdsdWViaSwgdGhlbiAKZ2x1ZWJpIG10ZCB3b24ndCBiZSBhdXRvbWF0aWNh
bGx5IGNyZWF0ZWQgd2hlbiBVQkkgdm9sdW1lIGlzIGFkZGVkLiBJJ20gCm5vdCBjZXJ0YWluIHdo
ZXRoZXIgdGhpcyBjaGFuZ2Ugd2lsbCBlZmZlY3QgZXhpc3Rpbmcgc3RhcnR1cCBwcm9jZXNzIAp0
aGF0IGRlcGVuZHMgb24gZ2x1ZWJpLgoKPiAKPiBJcyB0aGVyZSBhIHN0cm9uZyByZWFzb24gd2h5
IGhhdmUgdG8gZGVmZXIgdWJpX29wZW5fdm9sdW1lKCkgdG8KPiBnbHVlYmlfZ2V0X2RldmljZSgp
Pwo+IAo+IE1pcXVlbCwgd2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gVGhhbmtzLAo+IC8vcmljaGFy
ZAo+IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
