Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE41C35274
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mX9Wu5V95cFmPokgPwVeLv3gIQaxXPDU7A7r+PjUwAY=; b=zwJhmSE6Eus+HS
	vLyNlZXDTfSfcl9XE/crzpSCBTMCstMC6vtjQcx6F8yYfBC0xTTUIhUpyifflx8E7C/LZltDByHP/
	B7MBibpa0BYv0ckogJtiUhUVXCCSQOjR6CmbvbkdSgIeDjJ4ATdknprwqR3mvAc6WCl2GbfiT8BdY
	q8K4xK6Vt47zS6/xB1lV+BEPgXHld7g33BgFfMkgJLzxONHVzA18Zh820viNF2eG8wk6t7Q0NELzh
	K/E39Qf3G9vUgsnFIHAcicF9zmyxeEkHkbYvBn/DxCpgQ5okQUUggPlsqjH6VCM7qnQjvQjx1CSBp
	nMZ/mBvBCxx0YMQ9/11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7gP-003IAO-1E;
	Fri, 15 Dec 2023 12:52:49 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE7gM-003I7K-0K
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 12:52:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Ss8J54Mmpz1wnmx;
	Fri, 15 Dec 2023 20:52:21 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id EBC64140419;
	Fri, 15 Dec 2023 20:52:30 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemd200001.china.huawei.com (7.185.36.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Fri, 15 Dec 2023 20:52:30 +0800
Message-ID: <7a5e47ed-dfd0-3619-6591-b44e26b9237d@huawei.com>
Date: Fri, 15 Dec 2023 20:52:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/2] Fix some bugs in ubi_resize_volume() function
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
References: <20230406071331.1247429-1-wangzhaolong1@huawei.com>
 <9adbe147-95a6-a858-f65a-83028df4209d@huawei.com>
In-Reply-To: <9adbe147-95a6-a858-f65a-83028df4209d@huawei.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_045246_326852_3162F5A1 
X-CRM114-Status: UNSURE (   6.90  )
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

RnJpZW5kbHkgcGluZy4KCgoKPiBQbGVhc2UgZG9uJ3QgZm9yZ2V0IHRvIGRpc2N1c3MgdGhpcyBp
c3N1ZS4KPiAKPiBWMgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51
eC1tdGQvbGlzdC8/c2VyaWVzPTM1MzM5NAo+IAo+IEZyaWVuZGx5IHBpbmcuCj4gCj4gVGhhbmtz
Cj4gWmhhb2xvbmcKPiAKPj4gVGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBkb2VzIHR3byB0aGluZ3M6
Cj4+IMKgwqAgMS4gUmViYXNlIHRoZSBwYXRjaCBjb21taXRlZCBieSBHdW8gWHVlbmFuIG9uIHRo
ZSBsYXRlc3QgbWFpbmxpbmUuCj4+IMKgwqAgMi4gRml4ZWQgYW4gaXNzdWUgd2hlcmUgdGhlIG51
bWJlciBvZiBQRUJzIGlzIGluY29ycmVjdGx5IGRpc3BsYXllZC4KPj4KPj4gR3VvIFh1ZW5hbiAo
MSk6Cj4+IMKgwqAgdWJpOiBmaXggc2xhYi1vdXQtb2YtYm91bmRzIGluIHViaV9lYmFfZ2V0X2xk
ZXNjKzB4ZmIvMHgxMzAKPj4KPj4gWmhhb0xvbmcgV2FuZyAoMSk6Cj4+IMKgwqAgdWJpOiBDb3Jy
ZWN0IHRoZSBudW1iZXIgb2YgUEVCcyBhZnRlciBhIHZvbHVtZSByZXNpemUgZmFpbHVyZQo+Pgo+
PiDCoCBkcml2ZXJzL210ZC91Ymkvdm10LmMgfCAzMSArKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKPj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
