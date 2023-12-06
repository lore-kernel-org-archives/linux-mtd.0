Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C76C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Dec 2023 06:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YifFmufDpzxnkmV5K36pAG/O4k8e+2l9T/pIjQuQMAo=; b=KZme+uxNA+E6zx9Jxt877nMB3T
	XkfWGgbVPTKrdC73w7Cjmql8YGktV8PVk0Ey/TBHFf9uPrXL1NPEIyzXgjLHTroXzzbqljHXmw0yq
	PWLSNFLMyTht79MduOzU6R4wYkTvdWg64Bh/9V39e4A8BzeWCukN6iCmZyZ8a4zo1B+zUMdQCHmDP
	aymK7qbRdoV3/PnlH3FjiK+wtVQQ4yLl3PQn/AuxHfHYHKv9fG5D6hdb+0Ov3MDw1Rn8twoX2hwFR
	NU5g6s/oOtaAl53wxWodM8zT3tj3JjKKh+XpTyUmUIol4UWx6UPOMRbiGc6B9P9sHm+7ds9MHgSWm
	NrrB1IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlkU-009F63-1a;
	Wed, 06 Dec 2023 06:51:10 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAlkQ-009F5J-23
	for linux-mtd@lists.infradead.org;
	Wed, 06 Dec 2023 06:51:09 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SlSjG6nMbz4f3kJs
	for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2023 14:50:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 064A21A0BA9
	for <linux-mtd@lists.infradead.org>; Wed,  6 Dec 2023 14:51:00 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgA3iA7QGXBlJV2DCw--.10265S3;
	Wed, 06 Dec 2023 14:50:59 +0800 (CST)
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
 chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
 agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
 willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
 p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
 <ZXARKD0OmjLrvHmU@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <aafabc6e-fd98-f927-44d7-3ef76e2acaf8@huaweicloud.com>
Date: Wed, 6 Dec 2023 14:50:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXARKD0OmjLrvHmU@infradead.org>
X-CM-TRANSID: cCh0CgA3iA7QGXBlJV2DCw--.10265S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4kZFWUAFyktr1fCw45KFg_yoW7Gr47pr
	yUKFy5trWDJryI9rs2qw4UAw1Iqw1ftF4xZr93A3sxA390krn2kF48Kay5Cayxtw4vkF4q
	vF4jvrW3Zr1j9rJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_
	WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUojjgUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_225107_064696_FA9ECDBE 
X-CRM114-Status: GOOD (  35.67  )
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

SGksCgrU2iAyMDIzLzEyLzA2IDE0OjE0LCBDaHJpc3RvcGggSGVsbHdpZyDQtLXAOgo+PiArdm9p
ZCBpbnZhbGlkYXRlX2JkZXZfcmFuZ2Uoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgcGdvZmZf
dCBzdGFydCwKPj4gKwkJCSAgIHBnb2ZmX3QgZW5kKQo+PiArewo+PiArCWludmFsaWRhdGVfbWFw
cGluZ19wYWdlcyhiZGV2LT5iZF9pbm9kZS0+aV9tYXBwaW5nLCBzdGFydCwgZW5kKTsKPj4gK30K
Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGludmFsaWRhdGVfYmRldl9yYW5nZSk7Cj4gCj4gQWxsIHRo
ZXNlIGNvdWxkIHByb2JhYmx5IHVzZSBrZXJuZWxkb2MgY29tbWVudHMuCgpPaywgYW5kIHRoYW5r
cyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaHNldCEKPiAKPiBGb3IgdGhpcyBvbmUgSSByZWFsbHkg
ZG9uJ3QgbGlrZSBpdCBleGlzdGluZyBhdCBhbGwsIGJ1dCB3ZSdsbCBoYXZlIHRvCj4gZGlzY3Vz
cyB0aGF0IGluIHRoZSBidHJmcyBwYXRjaC4KPiAKPj4gK2xvZmZfdCBiZGV2X3NpemUoc3RydWN0
IGJsb2NrX2RldmljZSAqYmRldikKPj4gK3sKPj4gKwlsb2ZmX3Qgc2l6ZTsKPj4gKwo+PiArCXNw
aW5fbG9jaygmYmRldi0+YmRfc2l6ZV9sb2NrKTsKPj4gKwlzaXplID0gaV9zaXplX3JlYWQoYmRl
di0+YmRfaW5vZGUpOwo+PiArCXNwaW5fdW5sb2NrKCZiZGV2LT5iZF9zaXplX2xvY2spOwo+PiAr
Cj4+ICsJcmV0dXJuIHNpemU7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChiZGV2X3NpemUp
Owo+IAo+IE5vIG5lZWQgZm9yIHRoaXMgb25lLiAgVGhlIGNhbGxlcnMgY2FuIHNpbXBseSB1c2Ug
YmRldl9ucl9ieXRlcy4KCk9rLCBJJ2xsIHJlcGxhY2UgaXQgd2l0aCBiZGV2X25yX2J5dGVzLgo+
IAo+PiArc3RydWN0IGZvbGlvICpiZGV2X3JlYWRfZm9saW8oc3RydWN0IGJsb2NrX2RldmljZSAq
YmRldiwgcGdvZmZfdCBpbmRleCkKPj4gK3sKPj4gKwlyZXR1cm4gcmVhZF9tYXBwaW5nX2ZvbGlv
KGJkZXYtPmJkX2lub2RlLT5pX21hcHBpbmcsIGluZGV4LCBOVUxMKTsKPj4gK30KPj4gK0VYUE9S
VF9TWU1CT0xfR1BMKGJkZXZfcmVhZF9mb2xpbyk7Cj4+ICsKPj4gK3N0cnVjdCBmb2xpbyAqYmRl
dl9yZWFkX2ZvbGlvX2dmcChzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBwZ29mZl90IGluZGV4
LAo+PiArCQkJCSAgZ2ZwX3QgZ2ZwKQo+PiArewo+PiArCXJldHVybiBtYXBwaW5nX3JlYWRfZm9s
aW9fZ2ZwKGJkZXYtPmJkX2lub2RlLT5pX21hcHBpbmcsIGluZGV4LCBnZnApOwo+PiArfQo+PiAr
RVhQT1JUX1NZTUJPTF9HUEwoYmRldl9yZWFkX2ZvbGlvX2dmcCk7Cj4gCj4gSSB0aGluayB3ZSBj
YW4ganVzdCBkcm9wIGJkZXZfcmVhZF9mb2xpb19nZnAuIEhhbGYgb2YgdGhlIGNhbGxlcnMgc2lt
cGx5Cj4gcGFzcyBHUEtfS0VSTkVMLCBhbmQgdGhlIG90aGVyIGhhbGYgcGFzc2VzIEdGUF9OT0ZT
IGFuZCBjb3VsZCBqdXN0IHVzZQo+IG1lbWFsbG9jX25vZnNfc2F2ZSgpLgoKSSdtIGEgbGl0dGVy
IGNvbmZ1c2VkLCBzbyB0aGVyZSBhcmUgMyB1c2UgY2FzZXM6CjEpIHVzZSBHRlBfVVNFUiwgZGVm
YXVsdCBnZnAgZnJvbSBiZGV2X2FsbG9jLgoyKSB1c2UgR0ZQX0tFUk5FTAozKSB1c2UgR0ZQX05P
RlMKCkkgdW5kZXJzdGFuZCB0aGF0IHlvdSdyZSBzdWdnZXN0aW5nIG1lbWFsbG9jX25vZnNfc2F2
ZSgpIHRvIGRpc3Rpbmd1aXNoCjIgYW5kIDMsIGJ1dCBob3cgY2FuIEkgZGlzdGluZ3Vpc2ggMT8K
PiAKPj4gK3ZvaWQgYmRldl9iYWxhbmNlX2RpcnR5X3BhZ2VzX3JhdGVsaW1pdGVkKHN0cnVjdCBi
bG9ja19kZXZpY2UgKmJkZXYpCj4+ICt7Cj4+ICsJcmV0dXJuIGJhbGFuY2VfZGlydHlfcGFnZXNf
cmF0ZWxpbWl0ZWQoYmRldi0+YmRfaW5vZGUtPmlfbWFwcGluZyk7Cj4+ICt9Cj4+ICtFWFBPUlRf
U1lNQk9MX0dQTChiZGV2X2JhbGFuY2VfZGlydHlfcGFnZXNfcmF0ZWxpbWl0ZWQpOwo+IAo+IEht
bSwgdGhpcyBpcyBqdXN0IHVzZWQgZm9yIGJsb2NrMm10ZCwgYW5kIGZlZWxzIGEgbGl0dGxlIHRv
byBsb3ctbGV2ZWwKPiB0byBtZSwgYXMgYmxvY2sybXRkIHJlYWxseSBzaG91bGQgYmUgdXNpbmcg
dGhlIG5vcm1hbCBmaWxlcmVhZC93cml0ZQo+IEFQSXMuICBJIGd1ZXNzIHdlJ2xsIGhhdmUgdG8g
bGl2ZSB3aXRoIGl0IGZvciBub3cgaWYgd2Ugd2FudCB0byBleHBlZGl0ZQo+IGtpbGxpbmcgb2Zm
IGJkX2lub2RlLgo+IAo+PiArdm9pZCBiZGV2X2NvcnJlbGF0ZV9tYXBwaW5nKHN0cnVjdCBibG9j
a19kZXZpY2UgKmJkZXYsCj4+ICsJCQkgICAgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcp
Cj4+ICt7Cj4+ICsJbWFwcGluZy0+aG9zdCA9IGJkZXYtPmJkX2lub2RlOwo+PiArfQo+PiArRVhQ
T1JUX1NZTUJPTF9HUEwoYmRldl9jb3JyZWxhdGVfbWFwcGluZyk7Cj4gCj4gTWF5YmUgYXNzb2Np
YXRlZCBpbnN0ZWQgb2YgY29ycmVsYXRlPyAgRWl0aGVyIHdheSB0aGlzIGJhc2ljYWxseQo+IGZ1
bGx5IGV4cG9zZXMgdGhlIGJkZXYgaW5vZGUgYWdhaW4gOigKPiAKPj4gK2dmcF90IGJkZXZfZ2Zw
X2NvbnN0cmFpbnQoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZ2ZwX3QgZ2ZwKQo+PiArewo+
PiArCXJldHVybiBtYXBwaW5nX2dmcF9jb25zdHJhaW50KGJkZXYtPmJkX2lub2RlLT5pX21hcHBp
bmcsIGdmcCk7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lNQk9MX0dQTChiZGV2X2dmcF9jb25zdHJhaW50
KTsKPiAKPiBUaGUgcmlnaHQgZml4IGhlcmUgaXMgdG86Cj4gCj4gICAtIHVzZSBtZW1hbGxvY19u
b2ZzX3NhdmUgaW4gZXh0ZXQgaW5zdGVhZCBvZiB1c2luZwo+ICAgICBtYXBwaW5nX2dmcF9jb25z
dHJhaW50IHRvIGNsZWFyIGl0IGZyb20gdGhlIG1hcHBpbmcgZmxhZ3MKPiAgIC0gcmVtb3ZlIF9f
ZXh0NF9zYl9icmVhZF9nZnAgYW5kIGp1c3QgaGF2ZSBidWZmZXIuYyBoZWxwZXIgdGhhdCBkb2Vz
Cj4gICAgIHRoZSByaWdodCB0aGluZyAoZWl0aGVyIGJ5IGNoYW5naW5nIHRoZSBjYWxsaW5nIGNv
bnZlbnRpb25zIG9mIGFuCj4gICAgIGV4aXN0aW5nIG9uZSwgb3IgYWRkaW5nIGEgbmV3IG9uZSku
CgpUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9ucywgYnV0IEknbSBub3Qgc3VyZSBob3cgdG8gZG8g
dGhpcyB5ZXQsIEkgbXVzdApyZWFkIG1vcmUgZXh0NCBjb2RlLgo+IAo+PiArLyoKPj4gKyAqIFRo
ZSBkZWxfZ2VuZGlzaygpIGZ1bmN0aW9uIHVuaW5pdGlhbGl6ZXMgdGhlIGRpc2stc3BlY2lmaWMg
ZGF0YQo+PiArICogc3RydWN0dXJlcywgaW5jbHVkaW5nIHRoZSBiZGkgc3RydWN0dXJlLCB3aXRo
b3V0IHRlbGxpbmcgYW55b25lCj4+ICsgKiBlbHNlLiAgT25jZSB0aGlzIGhhcHBlbnMsIGFueSBh
dHRlbXB0IHRvIGNhbGwgbWFya19idWZmZXJfZGlydHkoKQo+PiArICogKGZvciBleGFtcGxlLCBi
eSBleHQ0X2NvbW1pdF9zdXBlciksIHdpbGwgY2F1c2UgYSBrZXJuZWwgT09QUy4KPj4gKyAqIFRo
aXMgaXMgYSBrbHVkZ2UgdG8gcHJldmVudCB0aGVzZSBvb3BzIHVudGlsIHdlIGNhbiBwdXQgaW4g
YSBwcm9wZXIKPj4gKyAqIGhvb2sgaW4gZGVsX2dlbmRpc2soKSB0byBpbmZvcm0gdGhlIFZGUyBh
bmQgZmlsZSBzeXN0ZW0gbGF5ZXJzLgo+PiArICovCj4+ICtpbnQgYmRldl9lamVjdGVkKHN0cnVj
dCBibG9ja19kZXZpY2UgKmJkZXYpCj4+ICt7Cj4+ICsJc3RydWN0IGJhY2tpbmdfZGV2X2luZm8g
KmJkaSA9IGlub2RlX3RvX2JkaShiZGV2LT5iZF9pbm9kZSk7Cj4+ICsKPj4gKwlyZXR1cm4gYmRp
LT5kZXYgPT0gTlVMTDsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKGJkZXZfZWplY3RlZCk7
Cj4gCj4gQW5kIHRoaXMgY29kZSBpbiBleHQ0IHNob3VsZCBqdXN0IGdvIGF3YXkgZW50aXJlbHku
ICBUaGUgYmRpIHNob3VsZAo+IGFsd2F5cyBiZSB2YWxpZCBmb3IgYSBsaXZlIGJkZXYgZm9yIHll
YXJzLgpTb3VuZHMgZ29vZCwgSSB3YXMgY29uZnVzZWQgYWJvdXQgdGhpcyBjb2RlIGFzIHdlbGwu
Cgo+IAo+PiAtLS0gYS9ibG9jay9iaW8uYwo+PiArKysgYi9ibG9jay9iaW8uYwo+PiBAQCAtMTEx
OSw2ICsxMTE5LDcgQEAgdm9pZCBiaW9fYWRkX2ZvbGlvX25vZmFpbChzdHJ1Y3QgYmlvICpiaW8s
IHN0cnVjdCBmb2xpbyAqZm9saW8sIHNpemVfdCBsZW4sCj4+ICAgCVdBUk5fT05fT05DRShvZmYg
PiBVSU5UX01BWCk7Cj4+ICAgCV9fYmlvX2FkZF9wYWdlKGJpbywgJmZvbGlvLT5wYWdlLCBsZW4s
IG9mZik7Cj4+ICAgfQo+PiArRVhQT1JUX1NZTUJPTF9HUEwoYmlvX2FkZF9mb2xpb19ub2ZhaWwp
Owo+IAo+IEhvdyBpcyB0aGlzIHJlYWx0ZWQ/ICBUaGUgZXhwb3J0IGlzIGZpbmUsIGJ1dCByZWFs
bHkgc2hvdWxkIGJlIGEKPiBzZXBhcmF0ZSwgd2VsbC1kb2N1bWVudGVkIGNvbW1pdC4KClRoaXMg
aXMgdXNlZCB0byByZXBsYWNlIF9fYmlvX2FkZF9wYWdlKCkgaW4gYnRyZnMgd2hpbGUgY29udmVy
dGluZyBwYWdlCnRvIGZvbGlvLCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBzaG91bGQga2VlcCB0
aGlzLCBpZiBzbywgSSdsbCBzcGxpdAp0aGlzIGludG8gYSBuZXcgY29tbWl0Lgo+IAo+PiAgIAo+
PiArc3RhdGljIGlubGluZSB1OCBibG9ja19iaXRzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYp
Cj4+ICt7Cj4+ICsJcmV0dXJuIGJkZXYtPmJkX2lub2RlLT5pX2Jsa2JpdHM7Cj4+ICt9Cj4gCj4g
Tm90IHN1cmUgd2Ugc2hvdWxkIG5lZWQgdGhpcy4gIGlfYmxrYml0cyBjb21lcyBmcm9tIHRoZSBi
bG9ja3NpemUKPiB0aGUgZnMgc2V0LCBzbyBpdCBzaG91bGQgaGF2ZSBvdGhlciB3YXlzIHRvIGdl
dCBhdCBpdC4KClllcywgdGhpcyBpcyBub3cgb25seSB1c2VkIGZvciBlcm9mcywgYW5kIGVyb2Zz
IGRvIGNhbGwKc2Jfc2V0X2Jsb2Nrc2l6ZSgpIHdoaWxlIGluaXRpYWxpemluZywgaGVuY2UgaXQn
cyByaWdodCB0aGVyZSBpcyBvdGhlcgp3YXkgdG8gZ2V0IGJsa2JpdHMgYW5kIHRoaXMgaGVscGVy
IGlzIG5vdCBuZWVkZWQuCgpUaGFua3MsCkt1YWkKCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
