Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65380CDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Oct 2023 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwradixHPNRNIQRtAR89JcaLab+Mx9joWbSbvoXXztY=; b=Tc9fFHn8lf5G5urihRFbETVAUY
	fWOOxO+7dDUcaWnOEqe4+P/rcbRyREJ1D1+Ob7gTZvac27kMLgBhnCr5oG0yispecyBpni8AZ67sf
	uOaiH2w6bv4/UFCiMnTwgnopKUNVfXXb9ad2wn9EFFi1Z98Tc4fUXzPrIi5jjikBujc+ZShU3V09W
	zsfMiybDFbVIo/rkJzRuASQxBcMuQg5EmE8jYKr4wCAwYhZ7edvU983Pf8GGM5iYVOCIt+ChkS2b6
	ASmCJI75oNqf0Lm284IkQRm2pv5iswxj/Dnvk1f+aptCVP2NS5DslyQXlDMKPY3v2bvVV5dhAlESy
	DlteqycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlXi-001e9K-1w;
	Fri, 20 Oct 2023 09:11:42 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtlXf-001e8Q-16
	for linux-mtd@lists.infradead.org;
	Fri, 20 Oct 2023 09:11:40 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4SBdzy5X5Mz15NkJ;
	Fri, 20 Oct 2023 17:08:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 20 Oct 2023 17:11:31 +0800
Subject: Re: [PATCH v3 5/5] mtd: Add several functions to the fail_function
 list
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231020064803.643399-1-wangzhaolong1@huawei.com>
 <20231020064803.643399-6-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0f9dba22-973c-6873-9116-40f2aa381e74@huawei.com>
Date: Fri, 20 Oct 2023 17:11:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231020064803.643399-6-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_021139_604411_67DC3BC0 
X-CRM114-Status: UNSURE (   7.01  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMy8xMC8yMCAxNDo0OCwgWmhhb0xvbmcgV2FuZyDQtLXAOgo+IGFkZCBtdGRfcmVhZCgp
LCBtdGRfd3JpdGUoKSwgbXRkX2VyYXNlKCksIG10ZF9ibG9ja19tYXJrYmFkKCkgdG8KPiBmYWls
X2Z1bmN0aW9uIGxpc3QgZm9yIHRlc3RpbmcgcHVycG9zZQo+IAo+IC0gU3BlY2lmeSB0aGUgZnVu
Y3Rpb24gdG8gaW5qZWN0IHRoZSBmYXVsdAo+IGVjaG8gbXRkX3JlYWQgPiAgL3N5cy9rZXJuZWwv
ZGVidWcvZmFpbF9mdW5jdGlvbi9pbmplY3QKPiAKPiAtIFNwZWNpZmllcyB0aGUgcmV0dXJuIHZh
bHVlIG9mIHRoZSBmdW5jdGlvbiB0byBpbmplY3QgdGhlIGZhdWx0Cj4gcHJpbnRmICUjeCAtMTIg
PiAvc3lzL2tlcm5lbC9kZWJ1Zy9mYWlsX2Z1bmN0aW9uL210ZF9yZWFkL3JldHZhbAo+IAo+IC0g
U3BlY2lmeSBvdGhlciBmYXVsdCBpbmplY3Rpb24gY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzLgo+
IGVjaG8gLTEgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9mYWlsX2Z1bmN0aW9uL3RpbWVzCj4gZWNobyAx
MDAgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9mYWlsX2Z1bmN0aW9uL3Byb2JhYmlsaXR5Cj4gZWNobyAx
NSA+IC9zeXMva2VybmVsL2RlYnVnL2ZhaWxfZnVuY3Rpb24vc3BhY2UKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBaaGFvTG9uZyBXYW5nIDx3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+CgpSZXZpZXdlZC1i
eTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
