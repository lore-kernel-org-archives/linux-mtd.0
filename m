Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAA6C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/O/xrbbW6YQqb7Fun8zMxuVAzpD/25F3BaSRUJgP3DA=; b=izRwLvk2Tny1zb
	iSrEW7koaR0nbDp6DPz9cwpNMg/DcoXrOUyQD+rVwdpPrDoq2ilxNI+SsRR+WHi6yrhZmKGgvR/ub
	BiCwOaKjjGNywaSbFD72ooswLSuXnmpt6hfhw4EyeuZHvZRLCxCN0+wfVthXWKYeDZuewrPPIJGw4
	tViKcWvnJZCgPFOxfHXVnA6Eo7vMRZbBl4QPdZKTikGUufeIaiGKAW9UnWqe14zt3iMhJi0xNzKhL
	VmHMkNNTfOMx4ifBbt+2y7GtL1CgUmrS9uFyqD62+YcIIY5ibsEG3qRXvi4RyBo+aPsknT/T/KPg4
	RVGYxWfLI1ep3nXHnSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3AA-00Bonw-SO; Mon, 21 Nov 2022 09:32:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3A0-00BokL-1T
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 09:32:25 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NG2G72bZhzmW4n;
	Mon, 21 Nov 2022 17:31:43 +0800 (CST)
Received: from [10.67.109.51] (10.67.109.51) by canpemm500009.china.huawei.com
 (7.192.105.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 21 Nov
 2022 17:32:12 +0800
Message-ID: <902bb40e-3eb8-cee6-cd6e-849d2fd87f15@huawei.com>
Date: Mon, 21 Nov 2022 17:32:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] ubifs: Fix build errors as symbol undefined
To: Richard Weinberger <richard@nod.at>
CC: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Wei Yongjun <weiyongjun1@huawei.com>, yusongping <yusongping@huawei.com>
References: <20221115083335.21211-1-hucool.lihua@huawei.com>
 <23feff35-6f2d-5cd7-57f9-ff2591a3c74e@huawei.com>
 <433070166.256175.1668893150374.JavaMail.zimbra@nod.at>
 <ed4618a5-67b4-7ee5-f172-a2709ee738fa@huawei.com>
 <540631712.260900.1669017601995.JavaMail.zimbra@nod.at>
From: "Lihua (lihua, ran)" <hucool.lihua@huawei.com>
In-Reply-To: <540631712.260900.1669017601995.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.67.109.51]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_013216_267751_ECE2A1DC 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Rm9sbG93IHlvdXIgc3VnZ2VzdGlvbiwgSSB3aWxsIHB1c2ggYSBuZXcgcGF0Y2jvvIxUaGFua3Mu
CgrlnKggMjAyMi8xMS8yMSAxNjowMCwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0t
LSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIkxpaHVhIiA8aHVjb29sLmxpaHVh
QGh1YXdlaS5jb20+Cj4+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+PiBDQzogIlNh
c2NoYSBIYXVlciIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+LCAibGludXgtbXRkIiA8bGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIgo+PiA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz4sICJXZWkgWW9uZ2p1biIgPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+
LCAieXVzb25ncGluZyIgPHl1c29uZ3BpbmdAaHVhd2VpLmNvbT4KPj4gR2VzZW5kZXQ6IE1vbnRh
ZywgMjEuIE5vdmVtYmVyIDIwMjIgMDI6NTQ6NTMKPj4gQmV0cmVmZjogUmU6IFtQQVRDSF0gdWJp
ZnM6IEZpeCBidWlsZCBlcnJvcnMgYXMgc3ltYm9sIHVuZGVmaW5lZAo+IAo+PiBZb3UgY2FuIHZl
cmlmeSBpdCB3aXRoIHRoZSBjb25maWcgaW4gdGhlIGF0dGFjaG1lbnQuIFRLUyA6RAo+IAo+IFRo
YW5rcyBmb3IgeW91ciAuY29uZmlnLCBJIHdhcyBhYmxlIHRvIGlkZW50aWZ5IHRoZSBwcm9ibGVt
Lgo+IFdoZW4gQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFIGlzIHNldCB0aGUgY29tcGlsZXIg
ZG9lcyBub3Qgb3B0aW1pemUgdGhpcyBjb25zdHJ1Y3Q6Cj4gCj4gICAgICAgICAgZXJyID0gdWJp
ZnNfbm9kZV9jaGVja19oYXNoKGMsIGJ1ZiwgemJyLT5oYXNoKTsKPiAgICAgICAgICBpZiAoZXJy
KSB7Cj4gICAgICAgICAgICAgICAgICB1Ymlmc19iYWRfaGFzaChjLCBidWYsIHpici0+aGFzaCwg
bG51bSwgb2Zmcyk7Cj4gICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgICB9Cj4g
Cj4gV2l0aCBDT05GSUdfVUJJRlNfRlNfQVVUSEVOVElDQVRJT04gbm90IHNldCwgdGhlIGNvbXBp
bGVyIGNhbiBhc3N1bWUgdGhhdAo+IHViaWZzX25vZGVfY2hlY2tfaGFzaCgpIGlzIG5ldmVyIHRy
dWUgYW5kIGRyb3BzIHRoZSBjYWxsIHRvIHViaWZzX2JhZF9oYXNoKCkuCj4gSXMgQ09ORklHX0ND
X09QVElNSVpFX0ZPUl9TSVpFIGVuYWJsZWQgdGhpcyBvcHRpbWl6YXRpb24gZG9lcyBub3QgaGFw
cGVuIGFueW1vcmUuCj4gCj4gU28gd2UgbmVlZCBhIG5vLW9wIHViaWZzX2JhZF9oYXNoKCkgZm9y
IHRoZSBDT05GSUdfVUJJRlNfRlNfQVVUSEVOVElDQVRJT049biBjYXNlLgo+IAo+IFRoYW5rcywK
PiAvL3JpY2hhcmQKPiAKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
