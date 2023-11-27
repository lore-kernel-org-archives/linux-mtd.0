Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97731C07CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 01:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04Sm3Y5GwSMTK/hANzBgl2hIJprT95BMS6Eyd5aDUf0=; b=Ac2ZIlVXYMH4fFdJImV7s2jDgr
	KL19ruL/QzaVd/TtmMCJxlIXrYnqgOz9v0OYgQeApHG0m6eFg2VTOvLvvBhMyWQFtmsczuGYyDQqm
	CxX04hsKuF2DWWbJ16ReVIihlZ+W6yuTcEcfw2DWzTSXrH6A9NoKsGqSj+jfAnzuv7ZDoinc4WSS8
	EtNBXgBcidd3d02YdqN20LlMkBy1gv8swn6ZloPND4ZM2zNAsMyM6H38peOv0KbkHcfR/6rS9K4UC
	qz5rOHMU5bwhgaP/FDTdZhafUssR+juYselHlHSEE9sjAAKLmKXR7BlnYEz8vkuJ05GGigEhMmCdi
	c4tvwyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QCM-0005ij-1d;
	Mon, 27 Nov 2023 01:14:06 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QCG-0005aL-1e
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 01:14:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SdnfM0ny4z4f3kF6
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 09:13:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id E9F9E1A0C64
	for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 09:13:48 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgDX2hBD7WNlrI8oCA--.40143S3;
	Mon, 27 Nov 2023 09:13:42 +0800 (CST)
Subject: Re: [PATCH -next] block: remove field 'bd_inode' from block_device
To: Greg KH <gregkh@linuxfoundation.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@infradead.org, ming.lei@redhat.com, axboe@kernel.dk,
 roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
 joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, dchinner@redhat.com, linux@weissschuh.net,
 min15.li@samsung.com, dlemoal@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, p.raghav@samsung.com, hare@suse.de,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231125093912.141486-1-yukuai1@huaweicloud.com>
 <2023112544-subpanel-national-58e5@gregkh>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <6ef798a6-8c0c-16b0-9991-b461258eb7d4@huaweicloud.com>
Date: Mon, 27 Nov 2023 09:13:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2023112544-subpanel-national-58e5@gregkh>
X-CM-TRANSID: cCh0CgDX2hBD7WNlrI8oCA--.40143S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCw48Jw4DZF43tw18tFWrKrg_yoW5ZFW8pr
	W3GFZ5AFyq9ry7uF4IqF1xXryrJ3Wku3y3JrySyw10vrWYvF12gryvyr93uFy8ZrZ7tr4j
	qF1aq34vkr18CrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
	6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_171401_068769_7F946260 
X-CRM114-Status: GOOD (  27.38  )
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

SGksCgrU2iAyMDIzLzExLzI1IDIyOjMyLCBHcmVnIEtIINC0tcA6Cj4gT24gU2F0LCBOb3YgMjUs
IDIwMjMgYXQgMDU6Mzk6MTJQTSArMDgwMCwgWXUgS3VhaSB3cm90ZToKPj4gRnJvbTogWXUgS3Vh
aSA8eXVrdWFpM0BodWF3ZWkuY29tPgo+Pgo+PiBibG9ja19kZXZjaWUgaXMgYWxsb2NhdGVkIGZy
b20gYmRldl9hbGxvYygpIGJ5IGJkZXZfYWxsb2NfaW5vZGUoKSwgYW5kCj4+IGN1cnJlbnRseSBi
bG9ja19kZXZpY2UgY29udGFpbnMgYSBwb2ludGVyIHRoYXQgcG9pbnQgdG8gdGhlIGFkZHJlc3Mg
b2YKPj4gaW5vZGUsIHdoaWxlIHN1Y2ggaW5vZGUgaXMgYWxsb2NhdGVkIHRvZ2V0aGVyOgo+Pgo+
PiBiZGV2X2FsbG9jCj4+ICAgaW5vZGUgPSBuZXdfaW5vZGUoKQo+PiAgICAvLyBpbm9kZSBpcyAm
YmRldl9pbm9kZS0+dmZzX2lub2RlCj4+ICAgYmRldiA9IElfQkRFVihpbm9kZSkKPj4gICAgLy8g
YmRldiBpcyAmYmRldl9pbm9kZS0+YmRldgo+PiAgIGJkZXYtPmlub2RlID0gaW5vZGUKPj4KPj4g
QWRkIGEgbmV3IGhlbHBlciB0byBnZXQgYWRkcmVzcyBvZiBpbm9kZSBmcm9tIGJkZXYgYnkgYWRk
IG9wZXJhdGlvbgo+PiBpbnN0ZWFkIG9mIG1lbW9yeSBhY2Nlc3MsIHdoaWNoIGlzIG1vcmUgZWZm
aWNpZW5jeS4gQWxzbyBwcmVwYXJlIHRvCj4+IGFkZCBhIG5ldyBmaWVsZCAnYmRfZmxhZ3MnIGlu
IHRoZSBmaXJzdCBjYWNoZWxpbmUoNjQgYnl0ZXMpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdSBL
dWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGJsb2NrL2JkZXYuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPj4gICBi
bG9jay9ibGstem9uZWQuYyAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCj4+ICAgYmxvY2svZm9w
cy5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQo+PiAgIGJsb2NrL2dlbmhkLmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgOCArKystLS0KPj4gICBibG9jay9pb2N0bC5jICAgICAgICAg
ICAgICAgICAgICAgIHwgIDggKysrLS0tCj4+ICAgYmxvY2svcGFydGl0aW9ucy9jb3JlLmMgICAg
ICAgICAgICB8ICA5ICsrKystLS0KPj4gICBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1
cy5jIHwgIDIgKy0KPj4gICBkcml2ZXJzL21kL2JjYWNoZS9zdXBlci5jICAgICAgICAgIHwgIDIg
Ky0KPj4gICBkcml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jICAgIHwgMTIgKysrKy0tLS0t
Cj4+ICAgZHJpdmVycy9zMzkwL2Jsb2NrL2Rhc2RfaW9jdGwuYyAgICB8ICAyICstCj4+ICAgZHJp
dmVycy9zY3NpL3Njc2ljYW0uYyAgICAgICAgICAgICB8ICAyICstCj4+ICAgZnMvYmNhY2hlZnMv
dXRpbC5oICAgICAgICAgICAgICAgICB8ICAyICstCj4+ICAgZnMvYnRyZnMvZGlzay1pby5jICAg
ICAgICAgICAgICAgICB8ICA2ICsrLS0tCj4+ICAgZnMvYnRyZnMvdm9sdW1lcy5jICAgICAgICAg
ICAgICAgICB8ICA0ICstLQo+PiAgIGZzL2J0cmZzL3pvbmVkLmMgICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+PiAgIGZzL2J1ZmZlci5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKyst
LS0KPj4gICBmcy9jcmFtZnMvaW5vZGUuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gICBm
cy9lcm9mcy9kYXRhLmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gICBmcy9leHQ0L2Rp
ci5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gICBmcy9leHQ0L2V4dDRfamJkMi5j
ICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4gICBmcy9leHQ0L3N1cGVyLmMgICAgICAgICAgICAg
ICAgICAgIHwgIDggKysrLS0tCj4+ICAgZnMvZ2ZzMi9nbG9jay5jICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4+ICAgZnMvZ2ZzMi9vcHNfZnN0eXBlLmMgICAgICAgICAgICAgICB8ICAyICst
Cj4+ICAgZnMvamJkMi9qb3VybmFsLmMgICAgICAgICAgICAgICAgICB8ICAzICsrLQo+PiAgIGZz
L2piZDIvcmVjb3ZlcnkuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAgIGZzL25pbGZzMi9z
ZWdtZW50LmMgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAgIGluY2x1ZGUvbGludXgvYmxrX3R5
cGVzLmggICAgICAgICAgfCAxMCArKysrKystLQo+PiAgIGluY2x1ZGUvbGludXgvYmxrZGV2Lmgg
ICAgICAgICAgICAgfCAgNCArLS0KPj4gICBpbmNsdWRlL2xpbnV4L2J1ZmZlcl9oZWFkLmggICAg
ICAgIHwgIDQgKy0tCj4+ICAgMjkgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwgNzMg
ZGVsZXRpb25zKC0pCj4gCj4gWW91IHNob3VsZCBkbyB0aGlzIGFzIGEgcGF0Y2ggc2VyaWVzLCBh
ZGQgdGhlIGhlbHBlciBmdW5jdGlvbiB0aGF0IGRvZXMKPiBub3RoaW5nLCBjb252ZXJ0IGFsbCB0
aGUgZGlmZmVyZW50IHBvcnRpb25zIG9mIHRoZSBrZXJuZWwgYXMgZGlmZmVyZW50Cj4gcGF0Y2hl
cywgYW5kIF90aGVuXyBjaGFuZ2UgdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBibG9jayBsYXll
ciB0bwo+IGhhbmRsZSB0aGUgY2hhbmdlIGluIHRoZSBzdHJ1Y3R1cmUuCj4gCj4gT3RoZXJ3aXNl
IHRoaXMgaXMgZ29pbmcgdG8gYmUgaGFyZCB0byBnZXQgYWNjZXB0ZWQuCgpPa2F5LCB0aGFua3Mg
Zm9yIHRoZSBhZGl2Y2UsIEknbGwgZG8gdGhhdCBpbiB2Mi4KCkJ5IHRoZSB3YXksIEkgd2FzIHRo
aW5raW5nIHRoYXQgdGhpcyBwYXRjaCBpcyBxdWl0ZSBzaW1wbGUsIGFuZCBkb2Vzbid0CndvcnRo
IHNwbGl0aW5nIGludG8gMTArIHBhdGNoZXMsCj4gCj4gQWxzbywgb25lIG5vdGU6Cj4gCj4+IEBA
IC04NSw2ICs4NCwxMyBAQCBzdHJ1Y3QgYmxvY2tfZGV2aWNlIHsKPj4gICAjZGVmaW5lIGJkZXZf
a29iaihfYmRldikgXAo+PiAgIAkoJigoX2JkZXYpLT5iZF9kZXZpY2Uua29iaikpCj4+ICAgCj4+
ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBpbm9kZSAqYmRldl9pbm9kZShzdHJ1Y3QgYmxvY2tfZGV2
aWNlICpiZGV2KQo+PiArewo+PiArCXZvaWQgKmlub2RlID0gYmRldiArIDE7Cj4gCj4gVGhhdCdz
IGNyYXp5LCBpZiBzb21ldGhpbmcgY2hhbmdlcywgdGhpcyB3aWxsIGtlZXAgd29ya2luZyB5ZXQg
dGhlCj4ga2VybmVsIHdpbGwgYnJlYWsgYW5kIG5vIG9uZSB3aWxsIGtub3cgd2h5Lgo+IAo+IFBs
ZWFzZSB1c2UgY29udGFpbmVyX29mKCksIHRoYXQncyB3aGF0IGl0IGlzIHRoZXJlIGZvciwgdGhp
cyBleGFjdCB0eXBlCj4gb2YgdGhpbmcuICBPciBpZiBub3QsIGFyZSB5b3UganVzdCBhc3N1bWlu
ZyB0aGF0IHRoZSBtZW1vcnkgbG9jYXRpb24KPiByaWdodCBhZnRlciBiZGV2IGlzIHRoZSBpbm9k
ZT8gIFRoYXQncyBhIHRvdWdoIGFzc3VtcHRpb24sIGhvdyBhcmUgeW91Cj4gZ29pbmcgdG8gYXNz
dXJlIGl0IHJlYWxseSBzdGF5cyB0aGVyZT8KClN0cnVjdCBiZGV2X2lub2RlIG5ldmVyIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDhmYmQ1NDRjYmNhNSAoIltQQVRDSF0KYmRldjogYWRkIElfQkRFVigp
IikgZnJvbSAyMDA0LCBhbmQgSSB0aGluayBpdCB3b24ndCBjaGFuZ2UgdW5sZXNzCnRoZXJlIGlz
IGEgZGlmZmVyZW50IHdheSB0byBtYW5hZ2UgbGlmZXRpbWUgb2YgYmxvY2tfZGV2aWNlLgoKQW5k
IHRoZSAnYmRldiArIDEnIGlzIGNvcGllZCBmcm9tIGJsa19tcV9ycV90b19wZHUoKSwgaG93ZXZl
ciwgSSBhZ2dyZQp0aGF0IHVzZSBjb250YWluZXJfb2YoKSBpcyBiZXR0ZXIgYW5kIEkgd2lsbCB1
c2UgaXQgaW4gdjIuCgpUaGFua3MsCkt1YWkKCj4gCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCj4g
Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
