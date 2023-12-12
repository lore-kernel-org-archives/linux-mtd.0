Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D10C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9hsEgEEo0STESEC6x0OBOPM2xK6+JgEj3le0hpFjSY=; b=OS2XVkmEIhnq96OyKcHddx1sXn
	BYghWEgz2NrLGPUo5muxD7L9K/fv7GQLuGtWPOprxssfHO6MmU664Zys5cv/rXpu1GT29Unb824C+
	4p0140bnw6cyHIn8tjEB4GvWgGuUlk8BylsghjKG1a5JXg9Ifc57Lex14iifWivdksMD0OtDeuvui
	2fyGUZxWAJ4IfPBySxa0NIfxMscxmxhncKxEY/HTpDX1aMsi6TKKxif2xOXMgI/d+tUODdXNd9KJi
	YTc1+RDwyU1u+F3P+XAvbciiKN6G2ghDoSkwbGm+UycKpWDqDkyOAco6fY8BePmDZkWIZSVBucqJv
	GOh49QHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwaa-00AseE-30;
	Tue, 12 Dec 2023 06:49:56 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCwaX-00AsdM-1x
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 06:49:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Sq8P04Cd8z4f3jXv
	for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2023 14:49:40 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 0DFC31A0CA7
	for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2023 14:49:43 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgCnqxGDAnhl4n6yDQ--.9546S3;
	Tue, 12 Dec 2023 14:49:42 +0800 (CST)
Subject: Re: [PATCH RFC v2 for-6.8/block 11/18] erofs: use bdev api
To: Gao Xiang <hsiangkao@linux.alibaba.com>, Yu Kuai
 <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 p.raghav@samsung.com, hare@suse.de
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140722.974745-1-yukuai1@huaweicloud.com>
 <1812c1bf-08b5-46a5-a633-12470e2c8f18@linux.alibaba.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <7465ebce-1290-e258-13cf-146fa4fd6302@huaweicloud.com>
Date: Tue, 12 Dec 2023 14:49:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1812c1bf-08b5-46a5-a633-12470e2c8f18@linux.alibaba.com>
X-CM-TRANSID: cCh0CgCnqxGDAnhl4n6yDQ--.9546S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJw45Jr1kGFWxtFWfXFyUtrb_yoW5Kw4fpF
	ykAFy8GrWrJrn5ur1xXr1UZFy5t397Ja18Cw4xX3WFvw4UJr10gFy0qr1qgF1UKr4kGr40
	qr1Ivr97ur1UJrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_WFyU
	JVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJr
	UvcSsGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_224953_997041_3D003C44 
X-CRM114-Status: GOOD (  15.72  )
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

SGksCgrlnKggMjAyMy8xMi8xMiAxNDozNSwgR2FvIFhpYW5nIOWGmemBkzoKPiAKPiAKPiBPbiAy
MDIzLzEyLzExIDIyOjA3LCBZdSBLdWFpIHdyb3RlOgo+PiBGcm9tOiBZdSBLdWFpIDx5dWt1YWkz
QGh1YXdlaS5jb20+Cj4+Cj4+IEF2b2lkIHRvIGFjY2VzcyBiZF9pbm9kZSBkaXJlY3RseSwgcHJl
cGFyZSB0byByZW1vdmUgYmRfaW5vZGUgZnJvbQo+PiBibG9ja19kZXZjaWUuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFl1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2Vy
b2ZzL2RhdGEuY8KgwqDCoMKgIHwgMTggKysrKysrKysrKysrLS0tLS0tCj4+IMKgIGZzL2Vyb2Zz
L2ludGVybmFsLmggfMKgIDIgKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZXJvZnMvZGF0YS5jIGIv
ZnMvZXJvZnMvZGF0YS5jCj4+IGluZGV4IGM5OGFlZGE4YWJiMi4uOGNmMzYxODE5MGFiIDEwMDY0
NAo+PiAtLS0gYS9mcy9lcm9mcy9kYXRhLmMKPj4gKysrIGIvZnMvZXJvZnMvZGF0YS5jCj4+IEBA
IC0zMiw4ICszMiw3IEBAIHZvaWQgZXJvZnNfcHV0X21ldGFidWYoc3RydWN0IGVyb2ZzX2J1ZiAq
YnVmKQo+PiDCoCB2b2lkICplcm9mc19icmVhZChzdHJ1Y3QgZXJvZnNfYnVmICpidWYsIGVyb2Zz
X2Jsa190IGJsa2FkZHIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBlcm9mc19rbWFw
X3R5cGUgdHlwZSkKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBidWYt
Pmlub2RlOwo+PiAtwqDCoMKgIGVyb2ZzX29mZl90IG9mZnNldCA9IChlcm9mc19vZmZfdClibGth
ZGRyIDw8IGlub2RlLT5pX2Jsa2JpdHM7Cj4+ICvCoMKgwqAgZXJvZnNfb2ZmX3Qgb2Zmc2V0ID0g
KGVyb2ZzX29mZl90KWJsa2FkZHIgPDwgYnVmLT5ibGtzemJpdHM7Cj4gSSdkIHN1Z2dlc3QgdGhh
dCB1c2UgYGJ1Zi0+Ymxrc3piaXRzYCBvbmx5IGZvciBiZGV2X3JlYWRfZm9saW8oKSBzaW5jZQo+
IGVyb2ZzX2luaXRfbWV0YWJ1ZigpIGlzIG5vdCBhbHdheXMgY2FsbGVkIGJlZm9yZSBlcm9mc19i
cmVhZCgpIGlzIHVzZWQuCj4gCj4gRm9yIGV4YW1wbGUsIGJ1Zi0+aW5vZGUgY2FuIGJlIG9uZSBv
ZiBkaXJlY3RvcnkgaW5vZGVzIG90aGVyIHRoYW4KPiBpbml0aWFsaXplZCBieSBlcm9mc19pbml0
X21ldGFidWYoKS4KClRoYW5rcyBmb3IgdGhlIG5vdGljZSwgYW5kIHlvdSdyZSByaWdodCwgSSds
bCB1cGRhdGUgY29kZSBpbiB2MzoKCnU4IGJsa3N6Yml0cyA9IGJ1Zi0+aW5vZGUgPyBpbm9kZS0+
aV9ibGtiaXRzIDogYnVmLT5ibGtzemJpdHM7CmVyb2ZzX29mZl90IG9mZnNldCA9IChlcm9mc19v
ZmZfdClibGthZGRyIDw8IGJsa3N6Yml0czsKCkt1YWkKPiAKPiBUaGFua3MsCj4gR2FvIFhpYW5n
Cj4gCj4gCj4+IMKgwqDCoMKgwqAgcGdvZmZfdCBpbmRleCA9IG9mZnNldCA+PiBQQUdFX1NISUZU
Owo+PiDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICpwYWdlID0gYnVmLT5wYWdlOwo+PiDCoMKgwqDC
oMKgIHN0cnVjdCBmb2xpbyAqZm9saW87Cj4+IEBAIC00Myw3ICs0Miw5IEBAIHZvaWQgKmVyb2Zz
X2JyZWFkKHN0cnVjdCBlcm9mc19idWYgKmJ1ZiwgZXJvZnNfYmxrX3QgCj4+IGJsa2FkZHIsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBlcm9mc19wdXRfbWV0YWJ1ZihidWYpOwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgbm9mc19mbGFnID0gbWVtYWxsb2Nfbm9mc19zYXZlKCk7Cj4+IC3CoMKgwqDCoMKg
wqDCoCBmb2xpbyA9IHJlYWRfY2FjaGVfZm9saW8oaW5vZGUtPmlfbWFwcGluZywgaW5kZXgsIE5V
TEwsIE5VTEwpOwo+PiArwqDCoMKgwqDCoMKgwqAgZm9saW8gPSBidWYtPmlub2RlID8KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVhZF9tYXBwaW5nX2ZvbGlvKGJ1Zi0+aW5vZGUtPmlfbWFw
cGluZywgaW5kZXgsIE5VTEwpIDoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmRldl9yZWFk
X2ZvbGlvKGJ1Zi0+YmRldiwgb2Zmc2V0KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWFsbG9j
X25vZnNfcmVzdG9yZShub2ZzX2ZsYWcpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VS
Uihmb2xpbykpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmb2xpbzsKPj4g
QEAgLTY3LDEwICs2OCwxNSBAQCB2b2lkICplcm9mc19icmVhZChzdHJ1Y3QgZXJvZnNfYnVmICpi
dWYsIAo+PiBlcm9mc19ibGtfdCBibGthZGRyLAo+PiDCoCB2b2lkIGVyb2ZzX2luaXRfbWV0YWJ1
ZihzdHJ1Y3QgZXJvZnNfYnVmICpidWYsIHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4+IMKgIHsK
Pj4gLcKgwqDCoCBpZiAoZXJvZnNfaXNfZnNjYWNoZV9tb2RlKHNiKSkKPj4gK8KgwqDCoCBpZiAo
ZXJvZnNfaXNfZnNjYWNoZV9tb2RlKHNiKSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnVmLT5p
bm9kZSA9IEVST0ZTX1NCKHNiKS0+c19mc2NhY2hlLT5pbm9kZTsKPj4gLcKgwqDCoCBlbHNlCj4+
IC3CoMKgwqDCoMKgwqDCoCBidWYtPmlub2RlID0gc2ItPnNfYmRldi0+YmRfaW5vZGU7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBidWYtPmJkZXYgPSBOVUxMOwo+PiArwqDCoMKgwqDCoMKgwqAgYnVmLT5i
bGtzemJpdHMgPSBidWYtPmlub2RlLT5pX2Jsa2JpdHM7Cj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIGJ1Zi0+aW5vZGUgPSBOVUxMOwo+PiArwqDCoMKgwqDCoMKgwqAgYnVm
LT5iZGV2ID0gc2ItPnNfYmRldjsKPj4gK8KgwqDCoMKgwqDCoMKgIGJ1Zi0+Ymxrc3piaXRzID0g
RVJPRlNfU0Ioc2IpLT5ibGtzemJpdHM7Cj4+ICvCoMKgwqAgfQo+PiDCoCB9Cj4+IMKgIHZvaWQg
KmVyb2ZzX3JlYWRfbWV0YWJ1ZihzdHJ1Y3QgZXJvZnNfYnVmICpidWYsIHN0cnVjdCBzdXBlcl9i
bG9jayAqc2IsCj4+IGRpZmYgLS1naXQgYS9mcy9lcm9mcy9pbnRlcm5hbC5oIGIvZnMvZXJvZnMv
aW50ZXJuYWwuaAo+PiBpbmRleCBiMDQwOWJhZGIwMTcuLmM5MjA2MzUxYjQ4NSAxMDA2NDQKPj4g
LS0tIGEvZnMvZXJvZnMvaW50ZXJuYWwuaAo+PiArKysgYi9mcy9lcm9mcy9pbnRlcm5hbC5oCj4+
IEBAIC0yMjQsOCArMjI0LDEwIEBAIGVudW0gZXJvZnNfa21hcF90eXBlIHsKPj4gwqAgc3RydWN0
IGVyb2ZzX2J1ZiB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGlub2RlICppbm9kZTsKPj4gK8KgwqDC
oCBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2Owo+PiDCoMKgwqDCoMKgIHN0cnVjdCBwYWdlICpw
YWdlOwo+PiDCoMKgwqDCoMKgIHZvaWQgKmJhc2U7Cj4+ICvCoMKgwqAgdTggYmxrc3piaXRzOwo+
PiDCoMKgwqDCoMKgIGVudW0gZXJvZnNfa21hcF90eXBlIGttYXBfdHlwZTsKPj4gwqAgfTsKPj4g
wqAgI2RlZmluZSBfX0VST0ZTX0JVRl9JTklUSUFMSVpFUsKgwqDCoCAoKHN0cnVjdCBlcm9mc19i
dWYpeyAucGFnZSA9IE5VTEwgfSkKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
