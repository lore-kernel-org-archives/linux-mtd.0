Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054A6ECAAD3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pi4cSRR078xDkOzS94HK9VbD+NSpyroqiZpuGjQfAcw=; b=KLe3Py2/jeP/kM
	REbwtTVdPMp/hYm/e7B5GORAGx/pJNlMik6AyRcup/vEc+t4rR7Fuynziim+mzdsYbv77XxtHBJAA
	/TQLV2xyWieXm2FtjPozRLcNhHl+RtGd/KSAahjt9LGNhwFK927LDxCl2J2F0U272TLE+E+GmlOXA
	asDgojMRU+gff6UjVog9bFhmGSXdscwEjvwgwjd1e3BAyl3/kJPg56aLPEJVfp6mGMVpdsX5+bo5b
	xcfmKgq4jFuzIy8PVsIWmyPDdXVb0wkDh4CPEz2Acfx6Q+3Su322fMNyokGaOniANVo2da4J7grtm
	8droRsDb0QkWmBGutTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaIx2-00Cbmg-Qu; Mon, 19 Sep 2022 15:44:53 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaImk-00CVrr-Hc
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 15:34:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EF5A46000C;
	Mon, 19 Sep 2022 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663601650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=otCWrPNWQ5MomFUk/X90/eu5c24/hNv1Pq/ZremXurw=;
	b=gZVIhA5r0CA2UzxC+RfomSYhPEnzOIktGl7i+FeBA63klk5KjrktWPhjnZmnxtsAozovHs
	Fh23dxVr/syQIdjfZ2sAN5EjiD65blsZwLxtmvP+x9Ti/9ETQlxafJ5H/bfZMEDUPis3Ol
	BzIwdSH996b6JPSqE33YDuM9N9vLjpVbrVRql+EMr6SG3yIj3OHGS0OdrM7OuE09uBta/L
	piCxbAEJBVyoUVsLFYlOep9MRkFUqQmiMkEMZOT5vsYyf/Ov37VLkLEvWOFF57OmwVypDu
	f68i0FrKLLjxqMAHgAA73LRjoBXKpmyjXiWwGl6pdsMsLlezHTxsM4ZfYjuULA==
Date: Mon, 19 Sep 2022 17:34:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <wangweiyang2@huawei.com>
Subject: Re: [PATCH] mtd: rawnand: denali: Fix a possible resource leak in
 denali_pci_probe
Message-ID: <20220919173407.7068709a@xps-13>
In-Reply-To: <20220801080315.1713934-1-gongruiqi1@huawei.com>
References: <20220801080315.1713934-1-gongruiqi1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_083415_054139_E8931506 
X-CRM114-Status: GOOD (  16.41  )
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

SGkgUnVpcWksCgpnb25ncnVpcWkxQGh1YXdlaS5jb20gd3JvdGUgb24gTW9uLCAxIEF1ZyAyMDIy
IDE2OjAzOjE1ICswODAwOgoKPiBDYWxsIHBjaV9yZWxlYXNlX3JlZ2lvbnMoKSB0byByZXRyaWV2
ZSB0aGUgYWxsb2NhdGVkIHJlc291cmNlIHdoZW4KPiBkZXZtX2lvcmVtYXAoKSBvciBkZW5hbGlf
aW5pdCgpIGZhaWxlZC4KCgkJCQkgIGZhaWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBHT05HLCBSdWlx
aSA8Z29uZ3J1aXFpMUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9k
ZW5hbGlfcGNpLmMgfCA5ICsrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9kZW5hbGlfcGNpLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlfcGNpLmMKPiBpbmRl
eCBkZTdlNzIyZDM4MjYuLjQwOTQzY2RhMDkxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9kZW5hbGlfcGNpLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlf
cGNpLmMKPiBAQCAtNzQsMjEgKzc0LDIyIEBAIHN0YXRpYyBpbnQgZGVuYWxpX3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCj4gIAkJ
cmV0dXJuIHJldDsKPiAgCX0KPiAgCj4gKwlyZXQgPSAtRU5PTUVNOwoKSSBkb24ndCBsaWtlIHNv
IG11Y2ggdGhpcyBjb25zdHJ1Y3Rpb24gYXMgbGF0ZXIgY2hhbmdlcyBpbiB0aGUgcHJvYmUKbWln
aHQganVzdCBmYWlsIHRoaXMgbG9naWMuCgpQbGVhc2UganVzdCBzZXQgcmV0ID0gLUVOT01FTTsg
aW4gdGhlIGVycm9yIHBhdGggZWFjaCB0aW1lIGl0J3MgbmVlZGVkLgpJIGRvbid0IGNhcmUgYWJv
dXQgbG9vc2luZyAzIGxpbmVzIG9mIGNvZGUgaWYgaXQgY2xhcmlmaWVzIHdoYXQgdGhlCmVycm9y
IHBhdGggcmV0dXJucy4KCj4gIAlkZW5hbGktPnJlZyA9IGRldm1faW9yZW1hcChkZW5hbGktPmRl
diwgY3NyX2Jhc2UsIGNzcl9sZW4pOwo+ICAJaWYgKCFkZW5hbGktPnJlZykgewo+ICAJCWRldl9l
cnIoJmRldi0+ZGV2LCAiU3BlY3RyYTogVW5hYmxlIHRvIHJlbWFwIG1lbW9yeSByZWdpb25cbiIp
Owo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJCWdvdG8gb3V0X3JlbGVhc2VfcGNpOwo+ICAJfQo+
ICAKPiAgCWRlbmFsaS0+aG9zdCA9IGRldm1faW9yZW1hcChkZW5hbGktPmRldiwgbWVtX2Jhc2Us
IG1lbV9sZW4pOwo+ICAJaWYgKCFkZW5hbGktPmhvc3QpIHsKPiAgCQlkZXZfZXJyKCZkZXYtPmRl
diwgIlNwZWN0cmE6IGlvcmVtYXAgZmFpbGVkISIpOwo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJ
CWdvdG8gb3V0X3JlbGVhc2VfcGNpOwo+ICAJfQo+ICAKPiAgCXJldCA9IGRlbmFsaV9pbml0KGRl
bmFsaSk7Cj4gIAlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gKwkJZ290byBvdXRfcmVsZWFz
ZV9wY2k7Cj4gIAo+ICAJbnNlbHMgPSBkZW5hbGktPm5iYW5rczsKPiAgCj4gQEAgLTExNiw2ICsx
MTcsOCBAQCBzdGF0aWMgaW50IGRlbmFsaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKmRldiwg
Y29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQo+ICAKPiAgb3V0X3JlbW92ZV9kZW5hbGk6
Cj4gIAlkZW5hbGlfcmVtb3ZlKGRlbmFsaSk7Cj4gK291dF9yZWxlYXNlX3BjaToKPiArCXBjaV9y
ZWxlYXNlX3JlZ2lvbnMoZGV2KTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
