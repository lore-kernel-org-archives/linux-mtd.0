Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6304FC4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 01:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hxJ9uhhCbcyCISdAvyewY8YMKWYlPAdpq1CrxBSVGI=; b=QnyuVKoCQzWm2u
	yNtnDbC2QlD7AqcRvlvUMgELN0NSmaeSW94pUYVeA4mmn8rL2HzX40Lu9jrFoshndZHyuNcwRcv3g
	uI8kKCN2MC6P4LIV0t/qDJ+HR0nZ1+zFWNLcEW3K4+qrx71kn3Cwi2QtemswIBzc6I/nGowY1ZiJu
	tX0lcMlC4v99UhF7Jb4SEhTXKv+DAL+rdT86A1vyUQaTJwvq4zLmEhMken0dWquqvFFs08r8M/ocH
	WSClnNaerBcQoXDJTL1UNtY2ukqa5NsZZhZ0xJqJ3COHOqyfjniWE8uoGrzzcxazF5bEJoYe5LAag
	RTUtclwHTrpe473iqOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwBCs-00000006ftD-28h2;
	Mon, 15 Apr 2024 01:32:26 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwBCn-00000006fpt-0JrB
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 01:32:23 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4VHqQd0Mv6z4f3lY6
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2024 09:31:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 973801A016E
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2024 09:31:57 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP2 (Coremail) with SMTP id Syh0CgAnmAuKgxxmNlDvKA--.9408S3;
	Mon, 15 Apr 2024 09:31:56 +0800 (CST)
Message-ID: <b8dbcc3d-f0ec-ba59-4ebc-01476029aa80@huaweicloud.com>
Date: Mon, 15 Apr 2024 09:31:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] ubi: block: fix memleak in ubiblock_create()
To: Markus Elfring <Markus.Elfring@web.de>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hou Tao <houtao1@huawei.com>,
 Yang Erkun <yangerkun@huawei.com>, Yu Kuai <yukuai3@huawei.com>,
 Zhang Yi <yi.zhang@huawei.com>
References: <20231208074629.1656356-1-linan666@huaweicloud.com>
 <22f324ce-552a-4f6a-b4e5-2d84a00010aa@web.de>
From: Li Nan <linan666@huaweicloud.com>
In-Reply-To: <22f324ce-552a-4f6a-b4e5-2d84a00010aa@web.de>
X-CM-TRANSID: Syh0CgAnmAuKgxxmNlDvKA--.9408S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw15WFW8Cw4Uuw18CFy5twb_yoWxKFgEk3
	48JF97J34xtF10yanaga1fArnxWay3J3Wjva48JwnIg34fWFnxGFZxGr98Z3Z3Xas5ZFWD
	Cr43t34Fvw1SqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l
	5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67
	AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3
	Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU1VOJ7UUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_183221_302367_CB0A60D1 
X-CRM114-Status: UNSURE (   9.69  )
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

CgrlnKggMjAyNC80LzE0IDE3OjE2LCBNYXJrdXMgRWxmcmluZyDlhpnpgZM6Cj4gQ2FuIGl0IGJl
IG5pY2VyIHRvIHVzZSB0aGUgdGVybSDigJxtZW1vcnkgbGVha+KAnSBpbnN0ZWFkIG9mIOKAnG1l
bWxlYWvigJ0KPiBpbiB0aGUgcGF0Y2ggc3ViamVjdD8KPiAKPiAKPiDigKYKPj4gJ2dkJyB3aWxs
IG5vdCBiZSBwdXQgYW55bW9yZS4gRml4IGl0IGJ5IHB1dHRpbmcgJ2dkJyBkaXJlY3RseS4KPiAK
PiBXb3VsZCB0aGUgZm9sbG93aW5nIHdvcmRpbmcgdmFyaWFudCBiZSBtb3JlIGRlc2lyYWJsZT8K
PiAKPiAgICAg4oCmIGFueW1vcmUuCj4gICAgIFRodXMgcGFzcyB0aGUgdmFyaWFibGUg4oCcZ2Ti
gJ0gdG8gYSBwdXRfZGlzaygpIGNhbGwgZGlyZWN0bHkuCj4gCj4gCj4gV291bGQgeW91IGxpa2Ug
dG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gYWNjb3JkaW5nbHk/Cj4gCgpUaGUgcGF0Y2ggaGFz
IGFscmVhZHkgYmVlbiBhcHBsaWVkOgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1hZGJmNGM0OTU0ZTMz
ZTYyMzg5NzA1OGE2MTdjNTgzZDY1YTE3N2Y2CgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3Vy
IHN1Z2dlc3Rpb24uIEkgd2lsbCBwYXkgYXR0ZW50aW9uIHRvIHRoZW0gaW4KZnV0dXJlIHBhdGNo
ZXMuCgo+IFJlZ2FyZHMsCj4gTWFya3VzCj4gLgoKLS0gClRoYW5rcywKTmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
