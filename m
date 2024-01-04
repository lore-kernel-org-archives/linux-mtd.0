Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD66C47074
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/k9KEdwphngSTj/xrkX+CYN8AlGk4/rTQe9cYbrKIFo=; b=Suhfc5OJSd1UWGB9Q654DWdaf0
	kW5pi+0t3tqReocHJIfzRiQ0tDz6g+h7cm3oadaN1SG7o74BdCTGZrgD5QF/72nb2S9EXiZl5KPbC
	JpDQt/Na8knQ+qDK8Bh74ePtlqKNiO8xZ4BWZdjRxyMsMaq8c5+Cs9vsplwDrAVsp9YkEvWaYhWuH
	QIYStMRkiPdwbTvh3F7geBhMG5koM1ctXfxUJz/h6c7U8hf8jvoFayGsmSqGbh4fS1pbSn3DXJiAW
	awSqbdYP7ed54jD3cq373MoWtLv9FQkdq/5b1yOCT/g2bap3UMJSD0lGyLI83EmAoaa0zE9bnM9Pj
	L0JSGrtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMuB-00DyYi-0O;
	Thu, 04 Jan 2024 12:32:59 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMu6-00DyY2-0W
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 12:32:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4T5QwC2fJZz4f3jXl
	for <linux-mtd@lists.infradead.org>; Thu,  4 Jan 2024 20:32:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id A982D1A0A63
	for <linux-mtd@lists.infradead.org>; Thu,  4 Jan 2024 20:32:46 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgCnqxFrpZZlWpgFFg--.9161S3;
	Thu, 04 Jan 2024 20:32:46 +0800 (CST)
Subject: Re: [PATCH RFC v3 for-6.8/block 11/17] erofs: use bdev api
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
 <20231221085826.1768395-1-yukuai1@huaweicloud.com>
 <20240104120207.ig7tfc3mgckwkp2n@quack3>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <7f868579-f993-aaa1-b7d7-eccbe0b0173c@huaweicloud.com>
Date: Thu, 4 Jan 2024 20:32:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20240104120207.ig7tfc3mgckwkp2n@quack3>
X-CM-TRANSID: cCh0CgCnqxFrpZZlWpgFFg--.9161S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy8ury3GFW8AF18AFy3twb_yoW5CFW7pF
	y5CF1rGrWrXr9I9w1Igr1jvF4rta97tr48C3yxJw1FvayjqrySgFy0ywnxGF4jkr4vkr4I
	qF12vryxuw4UKrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9q14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6rWU
	JVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJbIYCTnIWIevJa73UjIFyTuYvjfUoL0eDUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_043254_576255_85E8DD95 
X-CRM114-Status: GOOD (  16.74  )
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

SGksIEphbiEKCtTaIDIwMjQvMDEvMDQgMjA6MDIsIEphbiBLYXJhINC0tcA6Cj4gT24gVGh1IDIx
LTEyLTIzIDE2OjU4OjI2LCBZdSBLdWFpIHdyb3RlOgo+PiBGcm9tOiBZdSBLdWFpIDx5dWt1YWkz
QGh1YXdlaS5jb20+Cj4+Cj4+IEF2b2lkIHRvIGFjY2VzcyBiZF9pbm9kZSBkaXJlY3RseSwgcHJl
cGFyZSB0byByZW1vdmUgYmRfaW5vZGUgZnJvbQo+PiBibG9ja19kZXZpY2UuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KPiAKPiBJJ20gbm90IGVyb2Zz
IG1haW50YWluZXIgYnV0IElNTyB0aGlzIGlzIHF1aXRlIHVnbHkgYW5kIGdyb3dzIGVyb2ZzX2J1
Zgo+IHVubmVjZXNzYXJpbHkuIEknZCByYXRoZXIgc3RvcmUgJ3NiJyBwb2ludGVyIGluIGVyb2Zz
X2J1ZiBhbmQgdGhlbiBkbyB0aGUKPiByaWdodCB0aGluZyBpbiBlcm9mc19icmVhZCgpIHdoaWNo
IGlzIHRoZSBvbmx5IHBsYWNlIHRoYXQgc2VlbXMgdG8gY2FyZQo+IGFib3V0IHRoZSBlcm9mc19p
c19mc2NhY2hlX21vZGUoKSBkaXN0aW5jdGlvbi4uLiBBbHNvIGJsa3N6Yml0cyBpcyB0aGVuCj4g
dHJpdmlhbGx5IHNiLT5zX2Jsb2Nrc2l6ZV9iaXRzIHNvIGl0IHdvdWxkIGFsbCBzZWVtIG11Y2gg
bW9yZQo+IHN0cmFpZ2h0Zm9yd2FyZC4KClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLCBJJ2xs
IGZvbGxvdyB0aGlzIHVubGVzcyBHYW8gWGlhbmcgaGFzIG90aGVyCnN1Z2dlc3Rpb25zLgoKS3Vh
aQo+IAo+IAkJCQkJCQkJSG9uemEKPiAKPj4gLS0tCj4+ICAgZnMvZXJvZnMvZGF0YS5jICAgICB8
IDE4ICsrKysrKysrKysrKy0tLS0tLQo+PiAgIGZzL2Vyb2ZzL2ludGVybmFsLmggfCAgMiArKwo+
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2ZzL2Vyb2ZzL2RhdGEuYyBiL2ZzL2Vyb2ZzL2RhdGEuYwo+PiBpbmRl
eCBjOThhZWRhOGFiYjIuLmJiZTJmZTE5OWJmMyAxMDA2NDQKPj4gLS0tIGEvZnMvZXJvZnMvZGF0
YS5jCj4+ICsrKyBiL2ZzL2Vyb2ZzL2RhdGEuYwo+PiBAQCAtMzIsOCArMzIsOCBAQCB2b2lkIGVy
b2ZzX3B1dF9tZXRhYnVmKHN0cnVjdCBlcm9mc19idWYgKmJ1ZikKPj4gICB2b2lkICplcm9mc19i
cmVhZChzdHJ1Y3QgZXJvZnNfYnVmICpidWYsIGVyb2ZzX2Jsa190IGJsa2FkZHIsCj4+ICAgCQkg
IGVudW0gZXJvZnNfa21hcF90eXBlIHR5cGUpCj4+ICAgewo+PiAtCXN0cnVjdCBpbm9kZSAqaW5v
ZGUgPSBidWYtPmlub2RlOwo+PiAtCWVyb2ZzX29mZl90IG9mZnNldCA9IChlcm9mc19vZmZfdCli
bGthZGRyIDw8IGlub2RlLT5pX2Jsa2JpdHM7Cj4+ICsJdTggYmxrc3piaXRzID0gYnVmLT5pbm9k
ZSA/IGJ1Zi0+aW5vZGUtPmlfYmxrYml0cyA6IGJ1Zi0+Ymxrc3piaXRzOwo+PiArCWVyb2ZzX29m
Zl90IG9mZnNldCA9IChlcm9mc19vZmZfdClibGthZGRyIDw8IGJsa3N6Yml0czsKPj4gICAJcGdv
ZmZfdCBpbmRleCA9IG9mZnNldCA+PiBQQUdFX1NISUZUOwo+PiAgIAlzdHJ1Y3QgcGFnZSAqcGFn
ZSA9IGJ1Zi0+cGFnZTsKPj4gICAJc3RydWN0IGZvbGlvICpmb2xpbzsKPj4gQEAgLTQzLDcgKzQz
LDkgQEAgdm9pZCAqZXJvZnNfYnJlYWQoc3RydWN0IGVyb2ZzX2J1ZiAqYnVmLCBlcm9mc19ibGtf
dCBibGthZGRyLAo+PiAgIAkJZXJvZnNfcHV0X21ldGFidWYoYnVmKTsKPj4gICAKPj4gICAJCW5v
ZnNfZmxhZyA9IG1lbWFsbG9jX25vZnNfc2F2ZSgpOwo+PiAtCQlmb2xpbyA9IHJlYWRfY2FjaGVf
Zm9saW8oaW5vZGUtPmlfbWFwcGluZywgaW5kZXgsIE5VTEwsIE5VTEwpOwo+PiArCQlmb2xpbyA9
IGJ1Zi0+aW5vZGUgPwo+PiArCQkJcmVhZF9tYXBwaW5nX2ZvbGlvKGJ1Zi0+aW5vZGUtPmlfbWFw
cGluZywgaW5kZXgsIE5VTEwpIDoKPj4gKwkJCWJkZXZfcmVhZF9mb2xpbyhidWYtPmJkZXYsIG9m
ZnNldCk7Cj4+ICAgCQltZW1hbGxvY19ub2ZzX3Jlc3RvcmUobm9mc19mbGFnKTsKPj4gICAJCWlm
IChJU19FUlIoZm9saW8pKQo+PiAgIAkJCXJldHVybiBmb2xpbzsKPj4gQEAgLTY3LDEwICs2OSwx
NCBAQCB2b2lkICplcm9mc19icmVhZChzdHJ1Y3QgZXJvZnNfYnVmICpidWYsIGVyb2ZzX2Jsa190
IGJsa2FkZHIsCj4+ICAgCj4+ICAgdm9pZCBlcm9mc19pbml0X21ldGFidWYoc3RydWN0IGVyb2Zz
X2J1ZiAqYnVmLCBzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiKQo+PiAgIHsKPj4gLQlpZiAoZXJvZnNf
aXNfZnNjYWNoZV9tb2RlKHNiKSkKPj4gKwlpZiAoZXJvZnNfaXNfZnNjYWNoZV9tb2RlKHNiKSkg
ewo+PiAgIAkJYnVmLT5pbm9kZSA9IEVST0ZTX1NCKHNiKS0+c19mc2NhY2hlLT5pbm9kZTsKPj4g
LQllbHNlCj4+IC0JCWJ1Zi0+aW5vZGUgPSBzYi0+c19iZGV2LT5iZF9pbm9kZTsKPj4gKwkJYnVm
LT5iZGV2ID0gTlVMTDsKPj4gKwl9IGVsc2Ugewo+PiArCQlidWYtPmlub2RlID0gTlVMTDsKPj4g
KwkJYnVmLT5iZGV2ID0gc2ItPnNfYmRldjsKPj4gKwkJYnVmLT5ibGtzemJpdHMgPSBFUk9GU19T
QihzYiktPmJsa3N6Yml0czsKPj4gKwl9Cj4+ICAgfQo+PiAgIAo+PiAgIHZvaWQgKmVyb2ZzX3Jl
YWRfbWV0YWJ1ZihzdHJ1Y3QgZXJvZnNfYnVmICpidWYsIHN0cnVjdCBzdXBlcl9ibG9jayAqc2Is
Cj4+IGRpZmYgLS1naXQgYS9mcy9lcm9mcy9pbnRlcm5hbC5oIGIvZnMvZXJvZnMvaW50ZXJuYWwu
aAo+PiBpbmRleCBiMDQwOWJhZGIwMTcuLmM5MjA2MzUxYjQ4NSAxMDA2NDQKPj4gLS0tIGEvZnMv
ZXJvZnMvaW50ZXJuYWwuaAo+PiArKysgYi9mcy9lcm9mcy9pbnRlcm5hbC5oCj4+IEBAIC0yMjQs
OCArMjI0LDEwIEBAIGVudW0gZXJvZnNfa21hcF90eXBlIHsKPj4gICAKPj4gICBzdHJ1Y3QgZXJv
ZnNfYnVmIHsKPj4gICAJc3RydWN0IGlub2RlICppbm9kZTsKPj4gKwlzdHJ1Y3QgYmxvY2tfZGV2
aWNlICpiZGV2Owo+PiAgIAlzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4gICAJdm9pZCAqYmFzZTsKPj4g
Kwl1OCBibGtzemJpdHM7Cj4+ICAgCWVudW0gZXJvZnNfa21hcF90eXBlIGttYXBfdHlwZTsKPj4g
ICB9Owo+PiAgICNkZWZpbmUgX19FUk9GU19CVUZfSU5JVElBTElaRVIJKChzdHJ1Y3QgZXJvZnNf
YnVmKXsgLnBhZ2UgPSBOVUxMIH0pCj4+IC0tIAo+PiAyLjM5LjIKPj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
