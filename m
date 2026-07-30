Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8D1C53200
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2026 01:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abdwh1kThMExoRdMLPgAK8iQknXr57gmefDR+TgqhP8=; b=s6FYmbFOqJoM8GSuKfk2AJ0+Wf
	7OhoDjGc0IF/DGlVWJHPUAvCE4RYvo6G3pdhWRHXSGI/a4DgOF6POcAaYSxb0PiuVoYsUNVSR2Vk7
	ibungjDZnhMLFUX12+XKV1xDvrLbCchfdU/K1dWbxwtS1LyFHo0ho98vFLvhoWi67UXQdux2Hro8M
	l2+FXsLezQ89CkVZYU6x1mEYUr9FG5Bu8MBLPROVAtiobBGHYZt5qCHpfWCD0CERr+ksCz6+hyksF
	W4hhST93M+wfdTWPcsVDMBTh4aygQ3XtJkQUSXG9HvELY/2A45aGlTijZOAjdu0MaNRFPv76tfUtK
	8jB46hgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFSA-00000009FAL-3No0;
	Thu, 30 Jul 2026 01:20:54 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFS6-00000009F9j-2Yc4
	for linux-mtd@lists.infradead.org;
	Thu, 30 Jul 2026 01:20:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K9b8mjUo0A9yY6p+QrCOlHP/B6hNBBlegvLZV37Fa58=;
	b=lns5VRZO60sOV9/KF5wS5fBkdQ8790om7JGeWZZNFRFARMC801/G8CMgJvNa+UybN4iV2tJTg
	TpeQLVdjHVl9LJHpVAdAVbhs5juMZ0kE7Vi8XWDBbkvhalwmWYts4Ykvz81G0IL76Ue0g8Ja3o2
	dfzauajYvATata59g7iC/8I=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4h9WNt26q9znTVd;
	Thu, 30 Jul 2026 09:11:10 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 31DC340580;
	Thu, 30 Jul 2026 09:20:37 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 30 Jul 2026 09:20:36 +0800
Subject: Re: [PATCH 2/3] ubifs: key.h: use correct function parameter name
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20260729172044.1793865-1-rdunlap@infradead.org>
 <20260729172044.1793865-3-rdunlap@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6d03a559-5d87-2cc3-2742-f584fbaec179@huawei.com>
Date: Thu, 30 Jul 2026 09:20:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260729172044.1793865-3-rdunlap@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_182051_111421_82675A1F 
X-CRM114-Status: GOOD (  13.02  )
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

1NogMjAyNi83LzMwIDE6MjAsIFJhbmR5IER1bmxhcCDQtLXAOgo+IFVzZSBAaGFzaCBhcyB0aGUg
ZnVuY3Rpb24gcGFyYW1ldGVyIG5hbWUgdG8gcHJldmVudCBrZXJuZWwtZG9jIHdhcm5pbmdzOgo+
IAo+IFdhcm5pbmc6IGZzL3ViaWZzL2tleS5oOjQyIGZ1bmN0aW9uIHBhcmFtZXRlciAnaGFzaCcg
bm90IGRlc2NyaWJlZCBpbiAna2V5X21hc2tfaGFzaCcKPiBXYXJuaW5nOiBmcy91Ymlmcy9rZXku
aDo0MiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICd2YWwnIGRlc2NyaXB0aW9uIGluICdrZXlf
bWFza19oYXNoJwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPgo+IC0tLQo+IENjOiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0
Pgo+IENjOiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IENjOiBsaW51
eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IAo+ICAgZnMvdWJpZnMva2V5LmggfCAgICAyICst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKClJldmll
d2VkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IC0tLSBs
aW51eC1uZXh0LTIwMjYwNzI5Lm9yaWcvZnMvdWJpZnMva2V5LmgKPiArKysgbGludXgtbmV4dC0y
MDI2MDcyOS9mcy91Ymlmcy9rZXkuaAo+IEBAIC0zMyw3ICszMyw3IEBACj4gICAKPiAgIC8qKgo+
ICAgICoga2V5X21hc2tfaGFzaCAtIG1hc2sgYSB2YWxpZCBoYXNoIHZhbHVlLgo+IC0gKiBAdmFs
OiB2YWx1ZSB0byBiZSBtYXNrZWQKPiArICogQGhhc2g6IHZhbHVlIHRvIGJlIG1hc2tlZAo+ICAg
ICoKPiAgICAqIFdlIHVzZSBoYXNoIHZhbHVlcyBhcyBvZmZzZXQgaW4gZGlyZWN0b3JpZXMsIHNv
IHZhbHVlcyAlMCBhbmQgJTEgYXJlCj4gICAgKiByZXNlcnZlZCBmb3IgIi4iIGFuZCAiLi4iLiAl
MiBpcyByZXNlcnZlZCBmb3IgImVuZCBvZiByZWFkZGlyIiBtYXJrZXIuIFRoaXMKPiAuCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
