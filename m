Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4FDCA1005
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqhQBM/0aXjNzpfrZLDILI9UidEDNM1XqRksCQirW3Q=; b=e5p7lDTUtUj6bf
	YALgEpetL/+OnBXGo02zXA7/a7R0L5RafOsEtJpLCceGLKpcpyo961DtgkeQzjnAYVbQCEInpjyP1
	cyRKKGXjZLvty8mBgiddfLSkv2fJg0TqQVdFDAFXTgo3k6sz1+SJX7PDuJbUGHFaecaytQ0L+OPS8
	4K/S0EG4L8BdDpsZQFkbUtV3yRAgX7yTYNBMhqAYqRWHJTRvGzbpp0G/RDyIgzgSpSeXXjzCFI1mP
	PYoiU6gJYs5w12ABENuKKSOuaIY63HThVuSOOC3P5RHyWT+ztC77wUqC5OiqDPNzOLBftas8tx9b0
	rxJ8kTHn4+0Qg48UTWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNx-00000001ZmC-2AT6;
	Tue, 02 Sep 2025 19:09:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQsb-0000000HZmF-2vrT
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 13:16:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5660C1A0D65;
	Tue,  2 Sep 2025 13:16:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D74960695;
	Tue,  2 Sep 2025 13:16:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 248A61C22D253;
	Tue,  2 Sep 2025 15:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756819013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OD6qhRDyS8q2kCor5yPA7YDO6FHMm1Wu843InmsDchg=;
	b=pKQeqfPK532IYnPuEdIw0daG1ELhvGs9hWjeL6miEsqUWjkImbjVc1681eRK2vsVOVJlTc
	bRnJUgbmkTdkK87w8WxyJmycw1WLrgzZMdhKjEQ9Qa19UG7vKrN773KUDp6od6+L9HeyeD
	P4qFOrx72oryIb1J576IhQs59ebIkECGfWV8BrIMQRwj1sd4JmSR9HrH2HvcHyQsvxbeJy
	qftxJ7amt4jASpYDIj5zqZZOyObSGYaBb4wH3+XfalNkGf90rxh4Pc+MDT2HDxNXibsPrV
	Xm5yT4FLCvbUKAiTwJK189aFcvHZys9osAzHHY2q+ksI8cb+BA1HnTfer3nRDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Wang Zhaolong <wangzhaolong@huaweicloud.com>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <yi.zhang@huawei.com>,
  <yangerkun@huawei.com>
Subject: Re: [PATCH V2] mtd: core: skip badblocks increment for blocks
 already known bad
In-Reply-To: <95bf5e07-7f03-efb0-da9b-cb50999c2524@huawei.com> (Zhihao Cheng's
	message of "Tue, 2 Sep 2025 19:41:06 +0800")
References: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
	<95bf5e07-7f03-efb0-da9b-cb50999c2524@huawei.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 02 Sep 2025 15:16:45 +0200
Message-ID: <87ldmxm1tu.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061657_872054_E3D6CACA 
X-CRM114-Status: UNSURE (   8.25  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cj4+IEBAIC0yMzQ5LDExICsyMzUwLDE5IEBAIGludCBtdGRfYmxvY2tfbWFya2JhZChzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcykKPj4gICAJCXJldHVybiAtRVJPRlM7Cj4+ICAgICAJ
aWYgKG10ZC0+ZmxhZ3MgJiBNVERfU0xDX09OX01MQ19FTVVMQVRJT04pCj4+ICAgCQlvZnMgPSAo
bG9mZl90KW10ZF9kaXZfYnlfZWIob2ZzLCBtdGQpICogbWFzdGVyLT5lcmFzZXNpemU7Cj4+ICAg
LQlyZXQgPSBtYXN0ZXItPl9ibG9ja19tYXJrYmFkKG1hc3RlciwgbXRkX2dldF9tYXN0ZXJfb2Zz
KG10ZCwKPj4gb2ZzKSk7Cj4+ICsJbW9mZnMgPSBtdGRfZ2V0X21hc3Rlcl9vZnMobXRkLCBvZnMp
Owo+PiArCj4+ICsJaWYgKG1hc3Rlci0+X2Jsb2NrX2lzYmFkKSB7Cj4+ICsJCXJldCA9IG1hc3Rl
ci0+X2Jsb2NrX2lzYmFkKG1hc3RlciwgbW9mZnMpOwo+PiArCQlpZiAocmV0ID4gMCkKPj4gKwkJ
CXJldHVybiAwOwo+Cj4gSGksIE1pcXXDqGwuCj4gSGVyZSwgc2hvdWxkIHdlIGtlZXAgdGhlIHNh
bWUgbG9naWMgd2l0aCB0aGUgbG93ZXIKPiBsZXZlbChlZy4gbmFuZF9ibG9ja19tYXJrYmFkLCBv
bmVuYW5kX2Jsb2NrX21hcmtiYWQpIHdoZW4gJ3JldCA8IDAnIGlzCj4gcmV0dXJuZWQgYnkgbWFz
dGVyLT5fYmxvY2tfaXNiYWQuIE1hbnkgc3BlY2lmaWMgbmFuZCBkcml2ZXJzKG1hcmtiYWQpCj4g
cmV0dXJuIHRoZSBuZWdhdGl2ZSBjb2RlIHdoZW4gJ2lzYmFkJyBmYWlscy4KCkdvb2QgcXVlc3Rp
b24sIEkgZ3Vlc3MgaW4gY2FzZSBvZiBlcnJvciBpbiBpc2JhZCgpIHdlIHNoYWxsIHByb2JhYmx5
CnN0aWxsIHRyeSB0byBtYXJrIHRoZSBibG9jayBiYWQgYmVjYXVzZSBhY3R1YWxseSBtYXJraW5n
IGEgYmxvY2sgYmFkIGlzCnByb2JhYmx5IG1vcmUgaW1wb3J0YW50IHRoYW4gcmV0dXJuaW5nIGNv
cnJlY3Qgc3RhdGlzdGljcy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
