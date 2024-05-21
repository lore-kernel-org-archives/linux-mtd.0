Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB08C25B74
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2024 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9YZFRDQf5qdcwp3XA8cE0EDdBYHdjStqGPsjrIlSyo=; b=wSybSwBUmt2tLX3VAGHAtrpeMP
	tUZyKLgd70o9xz2JSSJyYINGQ9620z+3YTd3DTL9TIeuZeKWLobiZsBrjVjBxy05SQLfpyKikfg1Q
	v+Llpew5HPGiBMwAQefS37LQ1h0BKGX722hxukF6NRz99IHSsYXoLOKXVEZHoDvUI1Iu0pdHJ+8/1
	QhWuNPf24DxEXIWrySgN1TZJRqhS/NCSwoAn+1/IumLmICRwNCsnNY4cuhssBkoY23RdMAqN56i4C
	qbcRMbk05trQD5oCRriAfw94W4/9s2IM1jt7EJjwxXjv4NrM10Fbap59m2j4kXCWfPXqPI0IrdbON
	ax+sDj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NMO-0000000HEw4-386A;
	Tue, 21 May 2024 11:08:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NMK-0000000HEu2-00qt
	for linux-mtd@lists.infradead.org;
	Tue, 21 May 2024 11:08:47 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VkBR951CszwPFC;
	Tue, 21 May 2024 19:04:53 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 995AB1800B6;
	Tue, 21 May 2024 19:08:30 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 19:08:29 +0800
Subject: Re: How to detect if ubi volume is empty
To: Pintu Agarwal <pintu.ping@gmail.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, <linux-fsdevel@kvack.org>, linux-fsdevel
	<linux-fsdevel@vger.kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
	=?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
References: <CAOuPNLhN2pxa5KPpxiCBZMEGTgqaNddB6DZeB17tanp2gQgX1w@mail.gmail.com>
 <CAOuPNLjccNaLVAMWZ4p9U5zFe7FMwJa=3StPMTFDRngo2yRb-w@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <03967933-4ced-89b9-ec63-6af89f3d88bf@huawei.com>
Date: Tue, 21 May 2024 19:08:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAOuPNLjccNaLVAMWZ4p9U5zFe7FMwJa=3StPMTFDRngo2yRb-w@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_040844_323699_EF109EAE 
X-CRM114-Status: GOOD (  12.82  )
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

5ZyoIDIwMjQvNS8yMCAxODoyMiwgUGludHUgQWdhcndhbCDlhpnpgZM6Cj4gSGksCj4KPiBJbiBM
aW51eCBLZXJuZWwgNS4xNSBpcyB0aGVyZSBhIHdheSB0byBkZXRlY3QgaW4gcnVudGltZSwgaWYg
VUJJCj4gdm9sdW1lIChzcXVhc2hmcyBiYXNlZCwgdWJpYmxvY2ssIGR5bmFtaWMpIGlzIGVtcHR5
IG9yIG5vdCA/CgpUaGVyZSBpcyBhIHdheSB0byBnZXQgdGhlIGVtcHR5IHN0YXRlIG9mIFVCSSB2
b2x1bWUgYnkgaW9jdGwgClVCSV9JT0NFQlVOTUFQLCBmb3IgZXhhbXBsZToKCmZkID0gb3BlbihV
QklfVk9MVU1FLCBPX0VYQ0wpCgpjaGVja192b2x1bWVfZW1wdHnCoCBbMV0KCmNsb3NlKGZkKQoK
WzFdIApodHRwczovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy8/cD1tdGQtdXRpbHMuZ2l0
O2E9YmxvYjtmPXViaWZzLXV0aWxzL21rZnMudWJpZnMvbWtmcy51Ymlmcy5jO2g9NDJhNDdmODM5
ZTExNTU2N2RlNThlOGNkZmNjNTBjNDIwMmZjN2FmMTtoYj1yZWZzL2hlYWRzL21hc3RlciNsMjgw
NAoKPiBCYXNlZCBvbiB0aGlzIHdlIG5lZWQgdG8gbWFrZSBzb21lIGRlY2lzaW9ucyBhdCBydW50
aW1lLgo+Cj4gQ3VycmVudGx5LCB3ZSBhcmUgdXNpbmcgYSBjcnVkZSB3YXkgdG8gZGV0ZWN0IHZv
bHVtZSBlbXB0eSBieSByZWFkaW5nCj4gdGhlIGZpcnN0IDFLIGJsb2NrIHVzaW5nIHRoZSAiZGQi
IGNvbW1hbmQgYW5kIGNoZWNraW5nIGlmIHRoZSBjb250ZW50cwo+IGFyZSBhbGwgRkYuCj4KPiBJ
cyB0aGlzIGdvb2QgZW5vdWdoLCBvciBpcyB0aGVyZSBzb21lIG90aGVyIGJldHRlciB3YXkgPwo+
Cj4gVGhhbmtzLgo+IFBpbnR1Cj4KPiAuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
