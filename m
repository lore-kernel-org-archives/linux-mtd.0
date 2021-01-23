Return-Path: <SRS0=H2jB=G2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF40DC433E6
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 02:37:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C0E23B53
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jan 2021 02:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C0E23B53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7GEJkRjRcnkC/qu5rmZZTDylee93R0LlSJb1/w0/8oY=; b=k/55svuRslarM3JBvueqt52db
	BHlSbqoQrX7puti9kn4EpqKHXZ0xPGM5YDADF2EJFXia7YtmW7rMlvpdzfUs6ZRPrQ2KgG7FZdZ1n
	vQpWYRwm1DoAIuW/J+rNWw8/wHN4vzJG4XuJ8iJPaMJM4gBcic2pW6Qrkm5xoG4Vyy9usrLL2t6OW
	e3WuFI+JYw0WrsF+Acr/b4K4pToIoJKlgWpIvwy3i/R3yPO4db/uk9fZ1k8Z+8bI3ae09p2bfdW2Y
	4LjrqNGRue7ZZpoO4kXbZDyiBPinbnNTanrU6aOXujOABPiD8P8IQWKTAYO9hWiT7+KunftVHgIg4
	CTqajeObg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l38mf-00075S-0k; Sat, 23 Jan 2021 02:36:17 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l38mb-00074T-Kp
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2021 02:36:14 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DN0b06Kblzj9Gr;
 Sat, 23 Jan 2021 10:34:52 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Sat, 23 Jan 2021 10:35:57 +0800
Subject: Re: [PATCH 1/4] ubifs: Correctly set inode size in ubifs_link()
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <20210122212229.17072-1-richard@nod.at>
 <20210122212229.17072-2-richard@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <91b23161-db4a-4d64-db30-e42e2eaade1e@huawei.com>
Date: Sat, 23 Jan 2021 10:35:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210122212229.17072-2-richard@nod.at>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_213613_958258_EFBEA8D0 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: david@sigma-star.at, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMS8xLzIzIDU6MjIsIFJpY2hhcmQgV2VpbmJlcmdlciDQtLXAOgpSZXZpZXdlZC1ieTog
WmhpaGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZnMv
dWJpZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+IGluZGV4IDlhNmI4NjYwNDI1YS4uMDQ5MTJk
ZWRjYTQ4IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2Rpci5jCj4gKysrIGIvZnMvdWJpZnMvZGly
LmMKPiBAQCAtNjkzLDcgKzY5Myw3IEBAIHN0YXRpYyBpbnQgdWJpZnNfbGluayhzdHJ1Y3QgZGVu
dHJ5ICpvbGRfZGVudHJ5LCBzdHJ1Y3QgaW5vZGUgKmRpciwKPiAgIAlzdHJ1Y3QgaW5vZGUgKmlu
b2RlID0gZF9pbm9kZShvbGRfZGVudHJ5KTsKPiAgIAlzdHJ1Y3QgdWJpZnNfaW5vZGUgKnVpID0g
dWJpZnNfaW5vZGUoaW5vZGUpOwo+ICAgCXN0cnVjdCB1Ymlmc19pbm9kZSAqZGlyX3VpID0gdWJp
ZnNfaW5vZGUoZGlyKTsKPiAtCWludCBlcnIsIHN6X2NoYW5nZSA9IENBTENfREVOVF9TSVpFKGRl
bnRyeS0+ZF9uYW1lLmxlbik7Cj4gKwlpbnQgZXJyLCBzel9jaGFuZ2U7Cj4gICAJc3RydWN0IHVi
aWZzX2J1ZGdldF9yZXEgcmVxID0geyAubmV3X2RlbnQgPSAxLCAuZGlydGllZF9pbm8gPSAyLAo+
ICAgCQkJCS5kaXJ0aWVkX2lub19kID0gQUxJR04odWktPmRhdGFfbGVuLCA4KSB9Owo+ICAgCXN0
cnVjdCBmc2NyeXB0X25hbWUgbm07Cj4gQEAgLTczMSw2ICs3MzEsOCBAQCBzdGF0aWMgaW50IHVi
aWZzX2xpbmsoc3RydWN0IGRlbnRyeSAqb2xkX2RlbnRyeSwgc3RydWN0IGlub2RlICpkaXIsCj4g
ICAJaWYgKGlub2RlLT5pX25saW5rID09IDApCj4gICAJCXViaWZzX2RlbGV0ZV9vcnBoYW4oYywg
aW5vZGUtPmlfaW5vKTsKPiAgIAo+ICsJc3pfY2hhbmdlID0gQ0FMQ19ERU5UX1NJWkUoZm5hbWVf
bGVuKCZubSkpOwo+ICsKPiAgIAlpbmNfbmxpbmsoaW5vZGUpOwo+ICAgCWlob2xkKGlub2RlKTsK
PiAgIAlpbm9kZS0+aV9jdGltZSA9IGN1cnJlbnRfdGltZShpbm9kZSk7Cj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
