Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B9EC27C4F
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2024 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GocfvXXKWOoQBBTz39Li3Sk6TgAAzlt0PkVIh9TiLEU=; b=xh/ZLRutmLyjXh4M+c0XVxby72
	9lMgDWsy1+gwfi5CQPf/gy7LHcaM+10GkkfDyeKsvkrwFmfVeZMs1eTwnTV6fyWRi3HVsHhMP5GIt
	NKhIctK04xbAB4ozujpfLRQvEfv7AgsuQATaNocIYQ9dgv34n93IcD7hxq7zrmysW+yssZ5+LOnK3
	vUO4+J3WhbzBmxxr5Qbt/gqIJvVlvBqtnF4Q54PVIMySLDC/8eB+lR2NuqwI+07zwOvh6f5wovRJT
	QMXhoqk2a4+RwvN6RlyLTIIEz3SjKdbDv+feeJZ5CnYyhOasxgsB3TcwdjkTagYnflUP5J/MHr0J2
	Ha1og1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNWAL-0000000GJtv-1x4x;
	Sat, 29 Jun 2024 11:22:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNWAI-0000000GJtA-0GJ1
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jun 2024 11:22:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WB8tY0CHZzjZ0f;
	Sat, 29 Jun 2024 19:18:13 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 26DB6180089;
	Sat, 29 Jun 2024 19:22:36 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 29 Jun 2024 19:22:35 +0800
Subject: Re: ubifs: why ubifs doesn't support 2 copied of super blocks for
 better fs reliability
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
References: <MEYP282MB3164B8C92CD51ACC0897F0F2BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <497aa593-5999-821d-a2b7-69c0953e1e3e@huawei.com>
 <MEYP282MB3164701A51B29DB61B106566BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <MEYP282MB3164987D45E3CFC61B3E7CECBFD02@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f9c0f1f3-5fbf-c86d-4056-b75ee368df76@huawei.com>
Date: Sat, 29 Jun 2024 19:22:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB3164987D45E3CFC61B3E7CECBFD02@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_042246_301316_0C4C1AC1 
X-CRM114-Status: GOOD (  12.51  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC82LzI4IDEwOjI4LCBSeWRlciBXYW5nINC0tcA6Cj4gSGVsbG8sCj4gCj4gSXQgbG9v
a3MgdWJpZnMgaGFzIG9ubHkgMSBzdXBlciBibG9jay4gU3VwZXIgYmxvY2sgbWF5IGJlIGNvcnJ1
cHRlZCBieSBwb3dlci1jdXQgd2hpbGUgTkFORCBlcmFzaW5nIG9yIHdyaXRpbmcsIEVDQyBlcnJv
ciBhbmQgZXRjLiBXaGVuIHN1cGVyIGJsb2NrIGlzIGNvcnJ1cHRlZCwgdWJpZnMgbW91bnQgd2ls
bCBhbHdheXMgZmFpbC4KPiAKCkhhdmUgeW91IG1ldCB0aGUgcHJvYmxlbSBjYXVzZWQgYnkgY29y
cnVwdGVkIHN1cGVyYmxvY2s/IEkgb25seSBzYXcgb25jZSAKaW4gb3VyIHByb2R1Y3QsIGluIHdo
aWNoIHRoZXJlIHdhcmUgbWFueSBwcm9ibGVtIGVyYXNlYmxvY2tzIGluIHRoZSBmbGFzaC4KCj4g
SSBhbSBhc2tpbmcgd2h5IHViaWZzIGRvZXNuJ3Qgc3VwcG9ydCAyIGNvcGllZCBvZiBzdXBlciBi
bG9ja3MgZm9yIGJldHRlciBmcyByZWxpYWJpbGl0eT8gQXMgd2Uga25vdywgYm90aCB1aWJmcyBt
YXN0ZXIgYmxvY2sgYW5kIHViaSB2b2x1bWUgdGFibGUgaGF2ZSAyIGNvcGllcywgc28gdGhleSBh
cmUgdmVyeSBzdHJvbmdlci4gSXMgdGhlcmUgYW55IGRldiBwbGFuIHRvIHN1cHBvcnQgaXQgb24g
c3VwZXIgYmxvY2s/CgpJIGhhdmUgbm8gaWRlYXMgYWJvdXQgdGhpcyBxdWVzdGlvbiBlaXRoZXIg
YWZ0ZXIgbG9va2luZyB0aHJvdWdoIHRoZSAKaGlzdG9yeSBhbmQgd2hpdGVwYXBlclsxXS4gVGhl
IHN1cGVyYmxvY2sgaXMgdXBkYXRlZCBpbiBhIHZlcnkgbG93IApmcmVxdWVuY3koZWcuIGF1dG8t
cmVzaXplKSwgYW5kIGl0IGlzIHVwZGF0ZWQgYnkgYXRvbWljIGNoYW5naW5nLiBTbyBJIApndWVz
cyB0aGF0IGNvcnJ1cHRlZCBzdXBlcmJsb2NrIGlzIGhhcmRseSBnZW5lcmF0ZWQgZnJvbSB0aGUg
dmlldyBvZiAKVUJJRlMgbGF5ZXIuIEhvd2V2ZXIsIHRoZSBVQkkgd2lsbCBkbyB3ZWFyLWxldmVp
bmcsIHdoaWNoIGNvdWxkIAphdG9taWNhbGx5IGV4Y2hhbmdlIHR3byBMRUJzKG1heSBjb250YWlu
IHN1cGVyYmxvY2spLCB0aGVuIHRoZSB1cGRhdGluZyAKZnJlcXVlbmN5IG9mIHN1cGVyYmxvY2sg
Y291bGQgYmUgaW5jcmVhc2VkLiBUaGUgZmluYWwgcHJvYmFiaWxpdHkgb2YgCmNvcnJ1cHRlZCBz
dXBlcmJsb2NrIGlzIGhhcmQgdG8gc2F5LiBTbywgSSdtIG5vdCBzdXJlIGl0J3MgYSB2ZXJ5IAp2
YWx1YWJsZSB0aGluZyB0byBtYWludGFpbiB0d28gc3VwZXJibG9ja3MgaW4gVUJJRlMsIGFmdGVy
YWxsLCBpdCB3aWxsIApjaGFuZ2UgZGlzayBzdHJ1Y3R1cmUuCgpbMV0gaHR0cDovL3d3dy5saW51
eC1tdGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpZnNfd2hpdGVwYXBlci5wZGYKCj4gCj4gQmVzdCBy
ZWdhcmRzLAo+IFJ5ZGVyCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
