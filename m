Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5379EC54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxyMblghkwm0VOJVnFzrzQ+RReWlHUilv+oHv5xKWtQ=; b=2XFqPDERlHaKiriV1s0yjPnUvA
	w7155ziZikefUZMv0zjn2Lnmo2CdKNv4paNru3DfuL3d963QBkolFFA7miEN4KUzj2wLTggpw2pPb
	ef0PYnBuguKlD+u+QXYbnIzurP1tCT4AJfyumVKUI11leiU+ozlsYGx7spNJCNofzkXg4640e0lnt
	OweLAjea5fAgbCBxJhxaZxnM1/nFiJhPgUGTqnwWc78JGigxILi6nlzbl0TGY08S58uKCLy5iO3tT
	dZ0epzAqP2Gjz1rqT020VKk8cNtV9dUQYpJZRMl2HhFt7nZ6xhhTiALE4ElsHTge0Hs6TeBm37OwJ
	CnK385gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUKj-0000000Bla9-0rvI;
	Tue, 19 Mar 2024 07:56:29 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmUKf-0000000BlZI-3Tyz
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 07:56:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TzPBR4mmNzNm9T;
	Tue, 19 Mar 2024 15:54:23 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id BA548140120;
	Tue, 19 Mar 2024 15:56:15 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 15:56:14 +0800
Subject: Re: [RFC PATCH] jffs2: fix recursive fs_reclaim deadlock
To: Qingfang Deng <dqfext@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
	<richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20240315075946.587679-1-dqfext@gmail.com>
 <ff19df82-3fd4-9098-667c-0502b2452334@huawei.com>
 <CALW65jbKBUDN8ybE1oqrNW5VK1QGpZ1RmnFCCzxjQCo4obaA4A@mail.gmail.com>
 <e5c2c285-0b10-0d23-2c02-7582c026dbfd@huawei.com>
 <CALW65jbQCvkpeoOv275jgQAHf+Tk3QBR0HdwdGhK3s7gF+HVeg@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3424d2c5-9e49-6218-7ffe-3cf62a07ac3d@huawei.com>
Date: Tue, 19 Mar 2024 15:56:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CALW65jbQCvkpeoOv275jgQAHf+Tk3QBR0HdwdGhK3s7gF+HVeg@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_005626_079669_8EBDF8A4 
X-CRM114-Status: GOOD (  14.63  )
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

5ZyoIDIwMjQvMy8xOSAxNDo0MSwgUWluZ2ZhbmcgRGVuZyDlhpnpgZM6Cj4gT24gRnJpLCBNYXIg
MTUsIDIwMjQgYXQgOTowMOKAr1BNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgo+Pgo+PiDlnKggMjAyNC8zLzE1IDIwOjE5LCBRaW5nZmFuZyBEZW5nIOWGmemB
kzoKPj4+IEhpIFpoaWhhbywKPj4+Cj4+PiBPbiBGcmksIE1hciAxNSwgMjAyNCBhdCA3OjE54oCv
UE0gWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pj4gSSB0
aGluayBpdCdzIGEgZmFsc2UgcG9zaXRpdmUgd2FybmluZy4gSmZmczIgaXMgdHJ5aW5nIHRvIGdl
dCByb290IGlub2RlCj4+Pj4gaW4gcHJvY2VzcyAnIzEnLCB3aGljaCBtZWFucyB0aGF0IHRoZSBm
aWxlc3lzdGVtIGlzIG5vdCBtb3VudGVkCj4+Pj4geWV0KEJlY2F1c2UgZF9tYWtlX3Jvb3QgaXMg
YWZ0ZXIgamZmczJfaWdldChzYiwxKSwgdGhlcmUgaXMgbm8gd2F5IHRvCj4+Pj4gYWNjZXNzIG90
aGVyIGlub2Rlcy4pLCBzbyBpdCBpcyBpbXBvc3NpYmxlIHRoYXQgamZmczIgaW5vZGUgaXMgYmVp
bmcKPj4+PiBldmljdGVkIGluICcjMCcuCj4+Pj4KPj4+Cj4+PiBZb3UncmUgcmlnaHQgdGhhdCBw
cm9jZXNzICcjMScgaXMgZ2V0dGluZyB0aGUgcm9vdCBpbm9kZS4gSG93ZXZlciwKPj4+IGxvY2tk
ZXAgb25seSByZWNvcmRzIHRoZSBzdGFjayBvZiB0aGUgZmlyc3QgdW5pcXVlIGxvY2sgb3JkZXJp
bmcgKHNlZQo+Pj4gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvbG9ja2luZy9sb2NrZGVwLWRlc2ln
bi5odG1sI3BlcmZvcm1hbmNlICksIGFuZAo+Pj4gdGhlcmUgYXJlIG1hbnkgb2NjYXNpb25zIHdo
ZXJlIEdGUF9LRVJORUwgaXMgdXNlZCBpbnNpZGUgYQo+Pj4gamZmczJfaW5vZGVfaW5mbzo6c2Vt
ICdzIGNyaXRpY2FsIHNlY3Rpb24uCj4+PiAuCj4+Pgo+PiBBbGxvY2F0aW5nIG1lbW9yeSB3aXRo
b3V0IEdGUF9OT0ZTIGZsYWdzIHVuZGVyIHNsZWVwaW5nIGxvY2sgaXMgYSBub3JtYWwKPj4gdGhp
bmcuIFRoZSB2ZnNfd3JpdGUgaXMgYW4gZXhhbXBsZShlZy4gZXh0NCksIHBhZ2UgaXMgYWxsb2Nh
dGVkIHdpdGgKPj4gRkdQX1dSSVRFQkVHSU4gZmxhZyhubyBGR1BfTk9GUykgd2hlbiBob2xkaW5n
IGlub2RlIGxvY2suCj4gCj4gSWYgdGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlLCBpcyB0aGVyZSBh
IHdheSB0byBzdXBwcmVzcyB0aGUgd2FybmluZz8KPiAuCj4gCgpJIGNhbid0IGZpbmQgYSBpZGVh
IGVpdGhlci4gQWNjb3JkaW5nIHRvIG15IHBvb3Iga25vd2xlZGdlIG9uIGxvY2tkZXAsIAppdCBs
b29rcyBsaWtlIHRoYXQgbG9ja2RlcCB0cmFjZXMgYSBjbGFzcyBvZiBsb2NrcyhlZy4gZi0+c2Vt
IGluIGpmZnMyKSAKcmF0aGVyIHRoYW4gb25lIGNlcnRhaW4gbG9jaywgYmVjYXVzZSB0aGUga2V5
IG9mIGxvY2stPmRlcF9tYXAgaXMgCmluaXRpYWxpemVkIHdpdGggYSBzdGF0aWMgdmFyaWFibGUg
KFNlZSBtdXRleF9pbml0KS4gSW4gc29tZSBlYXN5IGNhc2VzLCAKd2UgY2FuIGFkZCBzdWJjbGFz
cyB0byBzb2x2ZSB0aGUgZmFsc2UgcG9zaXRpdmUgd2FybmluZ3MoZWcuIApsb2NrXzRfaW5vZGVz
KS4gQnV0IG5vdywgamZmczIgY2FzZSBpcyBkaWZmZXJlbnQsIGFueSAKamZmczJfZG9fY2xlYXJf
aW5vZGUgY2FsbGluZyBjb3VsZCB0cmlnZ2VyIGl0LCBhbmQgd2UgY2Fubm90IGFkZCBsaW1pdGVk
IApzdWJjbGFzc2VzIHRvIHNvbHZlIGl0LgpUYWtlIGEgc3RlcCBiYWNrLCBJIHRoaW5rIHdlIGNh
biBqdXN0IGlnbm9yZSB0aGUgd2FybmluZywgCmZzX3JlY2xhaW1fYWNxdWlyZSBpcyBhIHB1Ymxp
YyBwYXRoLCBvdGhlciBmaWxlc3lzdGVtcy9tb2R1bGVzIGNvdWxkIApmYWNlIHRoZSBzYW1lIGNh
c2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
