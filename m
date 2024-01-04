Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C954C47074
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7eQQi9q4N1pV096e9Grn5MRhQcrHOliLIBjJGDWWm0=; b=NazJhYUoQBOTtI86YF9ZxyjJM8
	5RMrlDHPQTJqJgTT5s0AEN+6eIPbRf0d0RTytKfb/Rtnm+D1cY7LL4vg/Z/MN2DR2MbkFVHiSU3vw
	5CXrEbXOQvNCQdxIqd2n5HBMY+NuE7R6wRvNmFtW7tS9OmhtiaduN97iN99Uyw4HccEDUZQba3QXU
	9F+zyiChIp/JPQFzyzttGce6GJlDNraMDC3/4yrcRo9GMmItUuMm3skWOQf/gTno2h2Dmx6g0cLP/
	2vU1lxps8vGjXdrThNU7aAAY+wWGROixONFpY+mIa29sMrG1jc4e7L4+xQiOWQAJCWXaF9u6lPTxZ
	IZcCwhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMh4-00Dwqp-0g;
	Thu, 04 Jan 2024 12:19:26 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMh0-00Dwov-05
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 12:19:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4T5QcW0hCZz4f3jMD
	for <linux-mtd@lists.infradead.org>; Thu,  4 Jan 2024 20:19:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id D9DF31A0188
	for <linux-mtd@lists.infradead.org>; Thu,  4 Jan 2024 20:19:08 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgBHShA5opZl+60EFg--.63321S3;
	Thu, 04 Jan 2024 20:19:08 +0800 (CST)
Subject: Re: [PATCH RFC v3 for-6.8/block 02/17] xen/blkback: use bdev api in
 xen_update_blkif_status()
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
 <20231221085712.1766333-3-yukuai1@huaweicloud.com>
 <20240104110631.3vspsvxbbvcpdqdu@quack3>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <29bfcfc7-62b0-3876-78ce-f7ebe3506eb6@huaweicloud.com>
Date: Thu, 4 Jan 2024 20:19:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20240104110631.3vspsvxbbvcpdqdu@quack3>
X-CM-TRANSID: cCh0CgBHShA5opZl+60EFg--.63321S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1xtw4fZF13Gr48Wr1rZwb_yoW8WF4rpr
	y7GF48AryDKFWjkFs3Xa1I9Fn3Ka17GrW5urZxA34fXr90qr92gasYy34YgFWxXrn3Jrs2
	qw47XFs3Ary8W3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
	6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_041922_454310_603867E1 
X-CRM114-Status: GOOD (  14.26  )
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

SGksIEphbiEKCtTaIDIwMjQvMDEvMDQgMTk6MDYsIEphbiBLYXJhINC0tcA6Cj4gT24gVGh1IDIx
LTEyLTIzIDE2OjU2OjU3LCBZdSBLdWFpIHdyb3RlOgo+PiBGcm9tOiBZdSBLdWFpIDx5dWt1YWkz
QGh1YXdlaS5jb20+Cj4+Cj4+IEF2b2lkIHRvIGFjY2VzcyBiZF9pbm9kZSBkaXJlY3RseSwgcHJl
cGFyZSB0byByZW1vdmUgYmRfaW5vZGUgZnJvbQo+PiBibG9ja19kZXZjaWUuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyB8IDMgKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
eGVuYnVzLmMKPj4gaW5kZXggZTM0MjE5ZWEyYjA1Li5lNjQ1YWZhNGFmNTcgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKPj4gKysrIGIvZHJpdmVycy9i
bG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+PiBAQCAtMTA0LDggKzEwNCw3IEBAIHN0YXRpYyB2
b2lkIHhlbl91cGRhdGVfYmxraWZfc3RhdHVzKHN0cnVjdCB4ZW5fYmxraWYgKmJsa2lmKQo+PiAg
IAkJeGVuYnVzX2Rldl9lcnJvcihibGtpZi0+YmUtPmRldiwgZXJyLCAiYmxvY2sgZmx1c2giKTsK
Pj4gICAJCXJldHVybjsKPj4gICAJfQo+PiAtCWludmFsaWRhdGVfaW5vZGVfcGFnZXMyKAo+PiAt
CQkJYmxraWYtPnZiZC5iZGV2X2hhbmRsZS0+YmRldi0+YmRfaW5vZGUtPmlfbWFwcGluZyk7Cj4+
ICsJaW52YWxpZGF0ZV9iZGV2KGJsa2lmLT52YmQuYmRldl9oYW5kbGUtPmJkZXYpOwo+IAo+IFRo
aXMgZnVuY3Rpb24gdXNlcyBpbnZhbGlkYXRlX2lub2RlX3BhZ2VzMigpIHdoaWxlIGludmFsaWRh
dGVfYmRldigpIGVuZHMKPiB1cCB1c2luZyBtYXBwaW5nX3RyeV9pbnZhbGlkYXRlKCkgYW5kIHRo
ZXJlIGFyZSBzdWJ0bGUgYmVoYXZpb3JhbAo+IGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlc2UgdHdv
IChmb3IgZXhhbXBsZSBpbnZhbGlkYXRlX2lub2RlX3BhZ2VzMigpIHRyaWVzCj4gdG8gY2xlYW4g
ZGlydHkgcGFnZXMgdXNpbmcgdGhlIC0+bGF1bmRlcl9mb2xpbyBtZXRob2QpLiBTbyBJIHRoaW5r
IHlvdSdsbAo+IG5lZWQgaGVscGVyIGxpa2UgaW52YWxpZGF0ZV9iZGV2MigpIGZvciB0aGlzLgoK
VGhhbmtzIGZvciByZXZpZXdpbmcgdGhpcyBwYXRjaCwgSSBrbm93IHRoZSBkaWZmZXJlbmN0IGJl
dHdlZW4gdGhlbiwKd2hhdCBJIGRvbid0IHVuZGVyc3RhbmQgaXMgdGhhdCB3aHkgdXNpbmcgaW52
YWxpZGF0ZV9pbm9kZV9wYWdlczIoKQpoZXJlLiBzeW5jX2Jsb2NrZGV2KCkgaXMganVzdCBjYWxs
ZWQgYW5kIDAgaXMgcmV0dXJuZWQsIEkgdGhpbmsgaW4gdGhpcwpjYXNlIGl0J3Mgc2FmZSB0byBj
YWxsIGludmFsaWRhdGVfYmRldigpIGRpcmVjdGx5LCBvciBhbSBJIG1pc3NpbmcKb3RoZXIgdGhp
bmdzPwoKVGhhbmtzLApLdWFpCgo+IAo+IAkJCQkJCQkJSG9uemEKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
