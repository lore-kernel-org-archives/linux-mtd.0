Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A12C47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2x0JGrSCm+VFj6xHTEZPV43dv3ni1ZbRWgInliOa+w8=; b=LI/hCBiotNiKVoh/jP5NPH7VEH
	r4mB3WVzOqDzkSy/ykI1DmijDK+0PFggRfVtDyswhsYJT9oVJGQ2325ZIABCPJCpHYuhNpK2URx8W
	Tyv0/sLSTwHXiGE3JOvKLUBN4JxOQZzhQuM2mnJlNO+iwrsgbf3DHQ0+4+aq9p5TxPuF6OU87Ry/q
	ZvykR6eyfB8X2pKFaN4f05INd5Zjmzdzp0JLN42SsRVq997zTNfJMRSdDWjC9lgR3uugu84THMfFc
	iXTc35IjUbHyuMb4eaZwVKWDj3ESOBQLlAn/xiw8pto+IN0tXifIW8E6DqeJzuJF55uCu/SlD/fJZ
	wo6EYKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8ou-00F5mF-0B;
	Tue, 23 Jan 2024 04:55:32 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8or-00F5lo-1i
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 04:55:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TJvrj71Z6z1xmWc;
	Tue, 23 Jan 2024 12:54:29 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 15BB71A0172;
	Tue, 23 Jan 2024 12:55:21 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 12:55:20 +0800
Subject: Re: [Linux Kernel Bug] memory leak in ubi_attach
To: Chenyuan Yang <chenyuan0y@gmail.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <syzkaller@googlegroups.com>, Zijie Zhao
	<zzjas98@gmail.com>
References: <CALGdzuo8_EXr4aUAw6X9S+yzMPi25Y82netPLWsd+3n-Ov9Pnw@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <10779b09-3413-6374-b4a1-1efd8821c5f2@huawei.com>
Date: Tue, 23 Jan 2024 12:55:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALGdzuo8_EXr4aUAw6X9S+yzMPi25Y82netPLWsd+3n-Ov9Pnw@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_205529_757979_2EC50DC2 
X-CRM114-Status: GOOD (  11.85  )
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

5ZyoIDIwMjQvMS8yMyAxMTo1MywgQ2hlbnl1YW4gWWFuZyDlhpnpgZM6Cj4gRGVhciBMaW51eCBL
ZXJuZWwgRGV2ZWxvcGVycyBmb3IgVUJJLAo+IAo+IFdlIGVuY291bnRlcmVkICJtZW1vcnkgbGVh
ayBpbiB1YmlfYXR0YWNoIiB3aGVuIHRlc3RpbmcgVUJJIHdpdGgKPiBTeXprYWxsZXIgYW5kIG91
ciBnZW5lcmF0ZWQgc3BlY2lmaWNhdGlvbnMuCj4gCj4gc3l6IHJlcHJvOiBodHRwczovL2RyaXZl
Lmdvb2dsZS5jb20vZmlsZS9kLzE3Rm9HdzZha2Z1ZnowNVUtb1JCUDJ3WG1PaUZGMVZVcS92aWV3
P3VzcD1kcml2ZV9saW5rCj4gQyByZXByb2R1Y2VyOiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20v
ZmlsZS9kLzFheWQzbG1IUHZxTm9JMDFwUUVkVTgzMkVrdHBUVW5aXy92aWV3P3VzcD1kcml2ZV9s
aW5rCj4gcmVwb3J0OiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFoQzJhclkzRmJR
dC02TDVyYkRmWS1EUTJvSDgySUlHcS92aWV3P3VzcD1kcml2ZV9saW5rCj4gc3RhdHM6IGh0dHBz
Oi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMVJFaWc5ZlYwSDFmWVBXYWlpY2MtSlZMbENwbzdU
VHc0L3ZpZXc/dXNwPWRyaXZlX2xpbmsKCkkgY2FuJ3Qgb3BlbiBhYm92ZSBsaW5rcyBpbiBjb21w
YW55LCBtYXkgeW91IHBvc3QgdGhlc2UgZmlsZXMgaW4gYXR0YWNobWVudD8KCj4gCj4gVGhpcyBt
ZW1vcnkgbGVhayBpcyB0cmlnZ2VyZWQgYnkgYGlvY3RsJFVCSV9JT0NBVFRgLCB3aGVyZQo+IGB1
YmlfYXR0YWNoX2luZm9gIGludm9rZXMgYGttZW1fY2FjaGVfY3JlYXRlYAo+IChodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92Ni43L3NvdXJjZS9kcml2ZXJzL210ZC91YmkvYXR0YWNo
LmMjTDE0NjQpLgo+IEl0IHNlZW1zIHRoYXQgdGhlIG1lbW9yeSBsZWFrIG9jY3VycyB3aGVuIHRo
ZSBzbGFiIGNhY2hlIGlzCj4gc3VjY2Vzc2Z1bGx5IGNyZWF0ZWQuIEkgYXBvbG9naXplIGZvciBu
b3QgYmVpbmcgYWJsZSB0byBjb25kdWN0IGEKPiBkZWVwZXIgYW5hbHlzaXMgb2YgdGhlIHJvb3Qg
Y2F1c2UsIGFzIG15IGV4cGVydGlzZSBpbiBVQkkgZHJpdmVycyBpcwo+IGxpbWl0ZWQuCj4gCj4g
SWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBvciByZXF1aXJlIG1vcmUgaW5mb3JtYXRpb24sIHBs
ZWFzZSBmZWVsCj4gZnJlZSB0byBjb250YWN0IHVzLgo+IAo+IFJlcG9ydGVkLWJ5OiBDaGVueXVh
biBZYW5nIDxjaGVueXVhbjB5QGdtYWlsLmNvbT4KPiAKPiBCZXN0LAo+IENoZW55dWFuCj4gCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
