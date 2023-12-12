Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9D0C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 01:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/c4jgmNaCTIG9qKuKQ12LrW+mfTN0eq65xm/GMqNWU=; b=087PtLMB7UuOa/4OMEgx84Zn+k
	4j/ZBcnCG/1NWbI8YqBhO19FgdyduKnUR77AYJMfm8K+ZKXw6MWXRd/RPllR70Z/QeDJ3gXamBrNw
	yGfFYoTRRej/p++SA8CXdwvbjgfUMBgdk+yS7yAJj46Pku9nS9fjYyXWPshMUQ5QTNNfM6xmUHQbW
	0ZChr3HPbSXshsGURXVbRsH9tx7HajK+s3QcYqnOVTRfNiy0MHZqrFDxi4u2YafWaxCpwGp6xiGrJ
	3hZCIClYUkuN8oiQSM4lHAdqgT2QUisYjq8QwyGQhlHVglGLDFyHQrbe72OikQRot2l9JK5H2fY3D
	kveUqAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrdI-00ASJT-3A;
	Tue, 12 Dec 2023 01:32:25 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCrdF-00ASIk-1O
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 01:32:23 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sq1Lj0ncJz4f3lDT
	for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2023 09:32:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 09C551A0764
	for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2023 09:32:18 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgCn9gwauHdlugyeDQ--.45656S3;
	Tue, 12 Dec 2023 09:32:13 +0800 (CST)
Subject: Re: [PATCH RFC v2 for-6.8/block 15/18] buffer: add a new helper to
 read sb block
To: Jan Kara <jack@suse.cz>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 p.raghav@samsung.com, hare@suse.de, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 "yangerkun@huawei.com" <yangerkun@huawei.com>,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140753.975297-1-yukuai1@huaweicloud.com>
 <20231211172708.qpuk4rkwq4u2zbmj@quack3>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <be459c50-5179-2748-2636-7965b9e1cb7a@huaweicloud.com>
Date: Tue, 12 Dec 2023 09:32:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20231211172708.qpuk4rkwq4u2zbmj@quack3>
X-CM-TRANSID: cCh0CgCn9gwauHdlugyeDQ--.45656S3
X-Coremail-Antispam: 1UD129KBjvJXoW7trWDZF4Dur4DWFWktF1xGrg_yoW8WF48pr
	ySkayakrZrAr1a9F12qw1rXFyrKa13G3WrCFyfJa4UAryagr13XrWxGF4UGFW3ZrnrAws8
	Xa1FkayrZw15KFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9q14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6rWU
	JVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJbIYCTnIWIevJa73UjIFyTuYvjfUFfHUDUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_173221_824175_21F95EFC 
X-CRM114-Status: GOOD (  12.86  )
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

SGksCgrU2iAyMDIzLzEyLzEyIDE6MjcsIEphbiBLYXJhINC0tcA6Cj4gT24gTW9uIDExLTEyLTIz
IDIyOjA3OjUzLCBZdSBLdWFpIHdyb3RlOgo+PiBGcm9tOiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdl
aS5jb20+Cj4+Cj4+IFVubGlrZSBfX2JyZWFkX2dmcCgpLCBleHQ0IGhhcyBzcGVjaWFsIGhhbmRp
bmcgd2hpbGUgcmVhZGluZyBzYiBibG9jazoKPj4KPj4gMSkgX19HRlBfTk9GQUlMIGlzIG5vdCBz
ZXQsIGFuZCBtZW1vcnkgYWxsb2NhdGlvbiBjYW4gZmFpbDsKPj4gMikgSWYgYnVmZmVyIHdyaXRl
IGZhaWxlZCBiZWZvcmUsIHNldCBidWZmZXIgdXB0b2RhdGUgYW5kIGRvbid0IHJlYWQKPj4gICAg
IGJsb2NrIGZyb20gZGlzazsKPj4gMykgUkVRX01FVEEgaXMgc2V0IGZvciBhbGwgSU8sIGFuZCBS
RVFfUFJJTyBpcyBzZXQgZm9yIHJlYWRpbmcgeGF0dHI7Cj4+IDQpIElmIGZhaWxlZCwgcmV0dXJu
IGVycm9yIHB0ciBpbnN0ZWFkIG9mIE5VTEw7Cj4+Cj4+IFRoaXMgcGF0Y2ggYWRkIGEgbmV3IGhl
bHBlciBfX2JyZWFkX2dmcDIoKSB0aGF0IHdpbGwgbWF0Y2ggYWJvdmUgMiBhbmQgMygKPj4gMSB3
aWxsIGJlIHVzZWQsIGFuZCA0IHdpbGwgc3RpbGwgYmUgZW5jYXBzdWxhdGVkIGJ5IGV4dDQpLCBh
bmQgcHJlcGFyZSB0bwo+PiBwcmV2ZW50IGNhbGxpbmcgbWFwcGluZ19nZnBfY29uc3RyYWludCgp
IGRpcmVjdGx5IG9uIGJkX2lub2RlLT5pX21hcHBpbmcKPj4gaW4gZXh0NC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgo+IC4uLgo+PiArLyoKPj4gKyAq
IFRoaXMgd29ya3MgbGlrZSBfX2JyZWFkX2dmcCgpIGV4Y2VwdDoKPj4gKyAqIDEpIElmIGJ1ZmZl
ciB3cml0ZSBmYWlsZWQgYmVmb3JlLCBzZXQgYnVmZmVyIHVwdG9kYXRlIGFuZCBkb24ndCByZWFk
Cj4+ICsgKiBibG9jayBmcm9tIGRpc2s7Cj4+ICsgKiAyKSBDYWxsZXIgY2FuIHBhc3MgaW4gYWRk
aXRpb25hbCBvcF9mbGFncyBsaWtlIFJFUV9NRVRBOwo+PiArICovCj4+ICtzdHJ1Y3QgYnVmZmVy
X2hlYWQgKgo+PiArX19icmVhZF9nZnAyKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIHNlY3Rv
cl90IGJsb2NrLCB1bnNpZ25lZCBpbnQgc2l6ZSwKPj4gKwkgICAgIGJsa19vcGZfdCBvcF9mbGFn
cywgZ2ZwX3QgZ2ZwKQo+PiArewo+PiArCXJldHVybiBicmVhZF9nZnAoYmRldiwgYmxvY2ssIHNp
emUsIG9wX2ZsYWdzLCBnZnAsIHRydWUpOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTChfX2JyZWFk
X2dmcDIpOwo+IAo+IF9fYnJlYWRfZ2ZwMigpIGlzIG5vdCBhIGdyZWF0IG5hbWUsIHdoeSBub3Qg
anVzdCB1c2luZyBicmVhZF9nZnAoKQo+IGRpcmVjdGx5PyBJJ20gbm90IGEgaHVnZSBmYW4gb2Yg
Ym9vbGVhbiBhcmd1bWVudHMgYnV0IHRocmVlIGRpZmZlcmVudCBmbGFncwo+IGFyZ3VtZW50cyB3
b3VsZCBiZSB0b28gbXVjaCBmb3IgbXkgdGFzdGUgOykgc28gSSBndWVzcyBJIGNhbiBsaXZlIHdp
dGgKPiB0aGF0LgoKSSBhZ3JlZSB0aGF0IF9fYnJlYWRfZ2ZwMiBpcyBub3QgYSBncmVhdGUgbmFt
ZSwgaWYgcG9zc2libGUsIEknbGwgdHJ5IHRvCmZpZ3VyZSBvdXQgYSBiZXR0ZXIgbmFtZSBmb3Ig
djMuCgpUaGFua3MgZm9yIHJldmlld2luZyB0aGlzIHBhdGNoc2V0IQpLdWFpCj4gCj4gCQkJCQkJ
CQlIb256YQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
