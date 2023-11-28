Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E21C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 01:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HK6iYsqKWTccxRjrd5m/52wPKXtCmFIMnbxaUEX/+o0=; b=A8lKgDdpQizTEh3FnqanyDX7Wh
	H1m0+ZiQrs8951z/mW0fxebfQm16TnNT6SGA9PzOr46/TYFhLp9ATE/GVwKkySt3l8Vwx3Ga3xh6B
	ZCLcjqH2H/egKGxh1tHBqEEjGqWGUj6HBaeIXS1lJzjr2gCUTxMzhlGoymlHtOphL7VOFhpVLp8fo
	sMx+Vnw/A5wQPacdvmi7yoUL6sYeBTwfK+Kd6VIYJXinFZIMoH5cL60PtspFnVbyDf3XrKtYWH9rt
	wYHLk5eDHq7dO3fNGm6XjkGZu2dBjmMs+WLhYyuic7RLIyRGIH+W0CiyxwwiVuA09m+tH/no8Vwvw
	K97wGpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7n1R-003pR2-2j;
	Tue, 28 Nov 2023 01:36:21 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7n1N-003pP4-2n
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 01:36:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SfQ5R4Skrz4f3lfJ
	for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 09:35:55 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 10DDB1A0F30
	for <linux-mtd@lists.infradead.org>; Tue, 28 Nov 2023 09:36:00 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgDn6hD8Q2VlfLiHCA--.59632S3;
	Tue, 28 Nov 2023 09:35:59 +0800 (CST)
Subject: Re: [PATCH block/for-next v2 01/16] block: add a new helper to get
 inode from block_device
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: ming.lei@redhat.com, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, dchinner@redhat.com, linux@weissschuh.net,
 min15.li@samsung.com, dlemoal@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-2-yukuai1@huaweicloud.com>
 <ZWRDeQ4K8BiYnV+X@infradead.org>
 <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
 <ZWTErvnMf7HiO1Wj@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <bc64da80-e9bd-84cb-f173-876623303131@huaweicloud.com>
Date: Tue, 28 Nov 2023 09:35:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZWTErvnMf7HiO1Wj@infradead.org>
X-CM-TRANSID: cCh0CgDn6hD8Q2VlfLiHCA--.59632S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1rGFWkXF1DXFy3WF45ZFb_yoW8Wry7pF
	Wjkan8GF1DAFnrur4kWa1xK3yFy3sFkrW7GFy8CryxA3y5WF9FgFyfKw4UJFyDGr4DJr4q
	qa10vFy3Xa48WaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_WFyU
	JVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUojjgUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_173618_299663_39C9F1B1 
X-CRM114-Status: GOOD (  20.24  )
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

SGksCgrU2iAyMDIzLzExLzI4IDA6MzIsIENocmlzdG9waCBIZWxsd2lnINC0tcA6Cj4gT24gTW9u
LCBOb3YgMjcsIDIwMjMgYXQgMDk6MDc6MjJQTSArMDgwMCwgWXUgS3VhaSB3cm90ZToKPj4gMSkg
SXMndCBva2F5IHRvIGFkZCBhIG5ldyBoZWxwZXIgdG8gcGFzcyBpbiBiZGV2IGZvciBmb2xsb3dp
bmcgYXBpcz8KPiAKPiAKPiBGb3Igc29tZSB3ZSBhbHJlYWR5IGhhdmUgdGhlbSAoZS5nLiBiZGV2
X25yX2J5dGVzIHRvIHJlYWQgdGhlIGJkZXYpCj4gc2l6ZSwgZm9yIHNvbWUgd2UgbmVlZCB0byBh
ZGQgdGhlbS4gIFRoZSBiaWcgdGhpbmcgdGhhdCBzZWVtcyB0bwo+IHN0aWNrIG91dCBpcyBwYWdl
IGNhY2hlIEFQSSwgYW5kIEkgdGhpbmsgdGhhdCBpcyB3aGVyZSB3ZSBuZWVkIHRvCj4gZGVmaW5l
IG1haW50YWluYWJsZSBBUElzIGZvciBmaWxlIHN5c3RlbXMgYW5kIG90aGVycyB0byB1c2UgdGhl
Cj4gYmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUuICBQcm9iYWJseSBvbmx5IGluIGZvbGlvIHZlcnNp
b25zIGFuZCBub3QKPiBwYWdlcyBvbmNlIGlmIHdlJ3JlIHRvdWNoaW5nIHRoZSBjb2RlIGFueWF5
CgpUaGFua3MgZm9yIHRoZSBhZHZpY2UhIEluIGNhc2UgSSdtIHVuZGVyc3RhbmRpbmcgY29ycmVj
dGx5LCBkbyB5b3UgbWVhbgp0aGF0IGFsbCBvdGhlciBmcy9kcml2ZXJzIHRoYXQgaXMgdXNpbmcg
cGFnZXMgdmVyc2lvbnMgY2FuIHNhZmVseSBzd2l0Y2gKdG8gZm9saW8gdmVyc2lvbnMgbm93PwoK
QnkgdGhlIHdheSwgbXkgb3JnaW5hbCBpZGVhIHdhcyB0cnlpbmcgdG8gYWRkIGEgbmV3IGZpZWxk
ICdiZF9mbGFncycKaW4gYmxvY2tfZGV2Y2llLCBhbmQgdGhlbiBhZGQgYSBuZXcgYml0IHNvIHRo
YXQgYmlvX2NoZWNrX3JvKCkgd2lsbApvbmx5IHdhcm4gb25jZSBmb3IgZWFjaCBwYXJ0aXRpb24u
IE5vdyB0aGF0IHRoaXMgcGF0Y2hzZXQgd2lsbCBiZSBxdWl0ZQpjb21wbGV4LCBJJ2xsIGFkZCBh
IG5ldyBib29sIGZpZWxkICdiZF9yb193YXJuZWQnIHRvIGZpeCB0aGUgYWJvdmUKcHJvYmxlbSBm
aXJzdCwgYW5kIHRoZW4gYWRkICdiZF9mbGFncycgb25jZSB0aGlzIHBhdGNoc2V0IGlzIGRvbmUu
CgpUaGFua3MsCkt1YWkKCj4gCj4+IDIpIEZvciB0aGUgZmlsZSBmcy9idWZmZXIuYywgdGhlcmUg
YXJlIHNvbWUgc3BlY2lhbCB1c2FnZSBsaWtlCj4+IGZvbGxvd2luZyB0aGF0IEkgZG9uJ3QgdGhp
bmsgaXQncyBnb29kIHRvIGFkZCBhIGhlbHBlcjoKPj4KPj4gc3Bpbl9sb2NrKCZiZF9pbm9kZS0+
aV9tYXBwaW5nLT5wcml2YXRlX2xvY2spOwo+Pgo+PiBJcyd0IG9rYXkgdG8gbW92ZSBmb2xsb3dp
bmcgYXBpcyBmcm9tIGZzL2J1ZmZlci5jIGRpcmVjdGx5IHRvCj4+IGJsb2NrL2JkZXYuYz8KPj4K
Pj4gX19maW5kX2dldF9ibG9jawo+PiBiZGV2X2dldGJsawo+IAo+IEknbSBub3Qgc3VyZSBtb3Zp
bmcgaXMgYSBnb29kIGlkZWEsIGJ1dCB3ZSBtaWdodCBlbmQgdXAgdGhlCj4gc29tZSBraW5kIG9m
IGxvdy1sZXZlbCBhY2Nlc3MgZnJvbSBidWZmZXIuYywgYmUgdGhhdCBzcGVjaWFsCj4gaGVscGVy
cywgYSBzZXBhcmF0ZSBoZWFkZXIgb3Igc29tZXRoaW5nIGVsc2UuICBMZXQncyBzb3J0IG91dAo+
IHRoZSByZXN0IG9mIHRoZSBrZXJuZWwgZmlyc3QuCj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
