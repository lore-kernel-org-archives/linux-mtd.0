Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F325C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+P+B8jdqennVrFxWysbjwPVPJNLiZRhVC4rZBW9bLJc=; b=ul71hT/Ld0djzX
	yni7yWZXpuNtxqUV5ieeBYgptc5158pY8eCJ9hEvyauHUmBmm7hS8XQU8LyM9LApN02d/fD4o41C+
	PSw0B+eGM0hLsZi3Iqqo5/JAmlks0FFn+BAwTLh4afpUBBZ1vEYgYNE4xkLyIfY8PTmkHte37G4go
	or50LVqrEgTAPncbrlQ0jBhQ7u+fubeGoDpAFsdCml1N1pGc/oq4YVbq8wlJjY5Dh6MNUjJy+ezJ9
	RfaQJ6uILYrBPKfOg/HyVKfsOE4bO7M5Jr0RzJzCJLtYcJLKNduSG7UKnwk+gqbV2kxqMk65N3obT
	7YKVr+YIvcJ4t1gT41/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWWL-00000006odr-1mE5;
	Mon, 26 Aug 2024 10:00:21 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVLs-00000006Xyb-3eHO
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 08:45:31 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wskky6wHlz4f3lfZ
	for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2024 16:44:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 53DFB1A0359
	for <linux-mtd@lists.infradead.org>; Mon, 26 Aug 2024 16:45:14 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP1 (Coremail) with SMTP id cCh0CgC3CUyZQMxmdfy0Cg--.2846S2;
	Mon, 26 Aug 2024 16:45:14 +0800 (CST)
Message-ID: <9849096d-1bf2-423d-ac7e-492a77d09282@huaweicloud.com>
Date: Mon, 26 Aug 2024 16:45:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next] mtd: rawnand: denali: Fix missing
 pci_release_regions in probe and remove
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20240826024339.476921-1-chenridong@huawei.com>
 <20240826101136.7849f040@xps-13>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20240826101136.7849f040@xps-13>
X-CM-TRANSID: cCh0CgC3CUyZQMxmdfy0Cg--.2846S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5Q7kC6x804xWl14x267AKxVWUJVW8JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_014529_201167_58046650 
X-CRM114-Status: GOOD (  10.89  )
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

CgpPbiAyMDI0LzgvMjYgMTY6MTEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgQ2hlbiwKPiAK
PiBjaGVucmlkb25nQGh1YXdlaS5jb20gd3JvdGUgb24gTW9uLCAyNiBBdWcgMjAyNCAwMjo0Mzoz
OSArMDAwMDoKPiAKPj4gVGhlIHBjaV9yZWxlYXNlX3JlZ2lvbnMgd2FzIG1pc3MgYXQgZXJyb3Ig
Y2FzZSwganVzdCBhZGQgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoZW4gUmlkb25nIDxjaGVu
cmlkb25nQGh1YXdlaS5jb20+Cj4+IC0tLQo+IAo+IE5leHQgdGltZSBwbGVhc2UgYWRkIGEgY2hh
bmdlbG9nIGhlcmUsIGJlbG93IHRoZSAtLS0uCj4gCj4gTm8gbmVlZCB0byByZXNlbmQgZm9yIHRo
aXMgdGltZS4KPiAKPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGlfcGNpLmMgfCAxMSAr
KysrKysrKy0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCkFwb2xvZ2llcyBmb3IgdGhlIG1pc3Npbmcg
Y2hhbmdlIGxvZy4KClRoYW5rIHlvdSBmb3IgeW91ciByZW1pbmRlci4KCkJlc3QgcmVnYXJkcywK
Umlkb25nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
