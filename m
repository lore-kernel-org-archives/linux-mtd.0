Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66121C47073
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woMhfd6TshH8uLiAiNRULzIZ64RR4sg1vXV0hELLZjI=; b=F7Ju7aFfIAgJIiDrJW3Ji0eb7h
	aorsJsOBc9sw3OHlW9c8nRPPH30mYYqI3rJQj3BGiVM79sfTvmWulS6I5h0s7O31Z0GLAavmmP79y
	Fp1zYjz9e0V+FlvDsFQ2oyH3mkMIZ96X2+zYW+tiAbjzlveEGbHb0riDGm+LauVO2AEhOxNbWeB9K
	MW1qMpLIJBlP5A1jgstLvjE+8zYK6gmfaRLmede2umWYMvusn6oitE3H4wFkOJJfPb8VYdAHr/QJ8
	vy7Zw6qxwfjE4ASQzhep+vORIsEYjeKXugvmPJPmtf2i62ZLPpvaGdiToXAuGlR06q3jcv+0ePIn4
	k3bqh4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMkK-00DxQG-1W;
	Thu, 04 Jan 2024 12:22:48 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMkH-00DxOw-0z
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 12:22:46 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4T5QhR1yXZz4f3jJL
	for <linux-mtd@lists.infradead.org>; Thu,  4 Jan 2024 20:22:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id EB8E31A06CD
	for <linux-mtd@lists.infradead.org>; Thu,  4 Jan 2024 20:22:36 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgAXZgwKo5ZlregEFg--.33832S3;
	Thu, 04 Jan 2024 20:22:36 +0800 (CST)
Subject: Re: [PATCH RFC v3 for-6.8/block 04/17] mtd: block2mtd: use bdev apis
To: Jan Kara <jack@suse.cz>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
 yi.zhang@huawei.com, yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-5-yukuai1@huaweicloud.com>
 <20240104112855.uci45hhqaiitmsir@quack3>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <b97810e9-c1bc-9198-c0d2-e132dde3e1f6@huaweicloud.com>
Date: Thu, 4 Jan 2024 20:22:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20240104112855.uci45hhqaiitmsir@quack3>
X-CM-TRANSID: cCh0CgAXZgwKo5ZlregEFg--.33832S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWUCFyfWw48WrW7Wr1ftFb_yoW8JFWUpF
	WIk3Z5Ars0ywnrCrs2q3ZrZF1xKasxXayxJ3W3Gw1rAF15WryfKr1fC34kCw4IkF18ArWv
	9F4jyF1ku3Z8KrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Zr0_
	Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUCXdbUUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_042245_706275_192CEBC1 
X-CRM114-Status: GOOD (  13.23  )
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

SGksCgrU2iAyMDI0LzAxLzA0IDE5OjI4LCBKYW4gS2FyYSDQtLXAOgo+IE9uIFRodSAyMS0xMi0y
MyAxNjo1Njo1OSwgWXUgS3VhaSB3cm90ZToKPj4gRnJvbTogWXUgS3VhaSA8eXVrdWFpM0BodWF3
ZWkuY29tPgo+Pgo+PiBPbiB0aGUgb25lIGhhbmQgY292ZXJ0IHRvIHVzZSBmb2xpbyB3aGlsZSBy
ZWFkaW5nIGJkZXYgaW5vZGUsIG9uIHRoZQo+PiBvdGhlciBoYW5kIHByZXZlbnQgdG8gYWNjZXNz
IGJkX2lub2RlIGRpcmVjdGx5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdSBLdWFpIDx5dWt1YWkz
QGh1YXdlaS5jb20+Cj4gLi4uCj4+ICsJCWZvciAocCA9IGZvbGlvX2FkZHJlc3MoZm9saW8pOyBw
IDwgbWF4OyBwKyspCj4+ICAgCQkJaWYgKCpwICE9IC0xVUwpIHsKPj4gLQkJCQlsb2NrX3BhZ2Uo
cGFnZSk7Cj4+IC0JCQkJbWVtc2V0KHBhZ2VfYWRkcmVzcyhwYWdlKSwgMHhmZiwgUEFHRV9TSVpF
KTsKPj4gLQkJCQlzZXRfcGFnZV9kaXJ0eShwYWdlKTsKPj4gLQkJCQl1bmxvY2tfcGFnZShwYWdl
KTsKPj4gLQkJCQliYWxhbmNlX2RpcnR5X3BhZ2VzX3JhdGVsaW1pdGVkKG1hcHBpbmcpOwo+PiAr
CQkJCWZvbGlvX2xvY2soZm9saW8pOwo+PiArCQkJCW1lbXNldChmb2xpb19hZGRyZXNzKGZvbGlv
KSwgMHhmZiwKPj4gKwkJCQkgICAgICAgZm9saW9fc2l6ZShmb2xpbykpOwo+PiArCQkJCWZvbGlv
X21hcmtfZGlydHkoZm9saW8pOwo+PiArCQkJCWZvbGlvX3VubG9jayhmb2xpbyk7Cj4+ICsJCQkJ
YmRldl9iYWxhbmNlX2RpcnR5X3BhZ2VzX3JhdGVsaW1pdGVkKGJkZXYpOwo+IAo+IFJhdGhlciB0
aGVuIGNyZWF0aW5nIHRoaXMgYmRldl9iYWxhbmNlX2RpcnR5X3BhZ2VzX3JhdGVsaW1pdGVkKCkg
anVzdCBmb3IKPiBNVEQgcGVyaGFwcyB3ZSBjYW4gaGF2ZSBoZXJlIChhbmQgaW4gb3RoZXIgZnVu
Y3Rpb25zKToKPiAKPiAJCQkJLi4uCj4gCQkJCW1hcHBpbmcgPSBmb2xpb19tYXBwaW5nKGZvbGlv
KTsKPiAJCQkJZm9saW9fdW5sb2NrKGZvbGlvKTsKPiAJCQkJaWYgKG1hcHBpbmcpCj4gCQkJCQli
YWxhbmNlX2RpcnR5X3BhZ2VzX3JhdGVsaW1pdGVkKG1hcHBpbmcpOwo+IAo+IFdoYXQgZG8geW91
IHRoaW5rPyBCZWNhdXNlIHdoZW4gd2UgYXJlIHdvcmtpbmcgd2l0aCB0aGUgZm9saW9zIGl0IGlz
IHJhdGhlcgo+IG5hdHVyYWwgdG8gdXNlIHRoZWlyIG1hcHBpbmcgZm9yIGRpcnR5IGJhbGFuY2lu
Zz8KCkkgdGhpbmsgdGhpcyBpcyBhIGdyZWF0IGlkZWEhIEFuZCBiZGV2X2JhbGFuY2VfZGlydHlf
cGFnZXNfcmF0ZWxpbWl0ZWQoKQpjYW4gYmUgcmVtb3ZlZCBhcyB3ZWxsLgoKVGhhbmtzLApLdWFp
Cgo+IAo+IAkJCQkJCQkJSG9uemEKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
