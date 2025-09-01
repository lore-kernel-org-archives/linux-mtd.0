Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D70CA0FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 10:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IIQ9qqBFLEfhLkWyVEFJmWZbyAx15KdzST7JoCzo8PM=; b=TEK0NVOZrHuz33RvWK+vIWfh7m
	lpfjRnJTQNJXuN4adL+AO1flZmaXzaiWHaG24EF6MXSdKH4BP9K/n7VPreFQPS1cLQdELWVrDGTnX
	/tP+IOg1a0VlaDN/HO+gk6GF+wcOpX4VtCJ8LJo0nCfYnXqCa3t0AjG7Q1h/yyX/5BWVGrTUQJ2WP
	RzEiPdS2vtuacz4Jfk0smbkG8HyarrsFuu0h/z2nMd6c9piZiTXZfgtKOsGXBW4/W8Ddnjrk/UdJR
	TOKsPV1/jMR2kGu04vNU4Xn05uhzvv/Ys5QP9Yel3umuwmhBt8K2djLGdsm+UwzJqkkYsEpf1+l02
	lUFAmZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1uY-0000000BvLL-0paW;
	Mon, 01 Sep 2025 10:37:18 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0oR-0000000Bkqc-3xkB
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 09:26:58 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4cFk5z3fZ0zKHMcN
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 17:26:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 4F35C1A0E71
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 17:26:47 +0800 (CST)
Received: from [10.174.178.209] (unknown [10.174.178.209])
	by APP4 (Coremail) with SMTP id gCh0CgAncY3VZrVoePwQBA--.62865S3;
	Mon, 01 Sep 2025 17:26:47 +0800 (CST)
Message-ID: <ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com>
Date: Mon, 1 Sep 2025 17:26:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
From: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Subject: [bug report] mtd: bad block counter inflated when repeatedly marking
 the same block
Cc: yi.zhang@huawei.com, yangerkun@huawei.com, chengzhihao1@huawei.com
X-CM-TRANSID: gCh0CgAncY3VZrVoePwQBA--.62865S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1xGF1xWFWfAFWkJw13Jwb_yoW8Kw4Dpw
	sxC3s3G3s8Ww1Ivas7ZF47trySg345WF15KF4rXryrCrZ5Wr17Xrs5KFZYqF12gF9rtwn0
	qr10qrWDXFW8ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUylb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwxhLUUUUU
X-CM-SenderInfo: pzdqw6xkdrz0tqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_022656_333480_0C7F8917 
X-CRM114-Status: UNSURE (   7.39  )
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

SGkgYWxsLAoKSeKAmWQgbGlrZSB0byByZXBvcnQgYSBtaXNtYXRjaCBiZXR3ZWVuIGJhZC1ibG9j
ayBzdGF0aXN0aWNzIGFuZCBhY3R1YWwKb24tZmxhc2ggc3RhdGUgd2hlbiByZXBlYXRlZGx5IGNh
bGxpbmcgTUVNU0VUQkFEQkxPQ0sgb24gdGhlIHNhbWUKZXJhc2VibG9jay4KClN1bW1hcnkKLSBS
ZXBlYXRlZGx5IG1hcmtpbmcgdGhlIHNhbWUgYmxvY2sgYmFkIChlLmcuLCA1IHRpbWVzKSBtYWtl
cwogICAvc3lzL2NsYXNzL210ZC9tdGRYL2JhZF9ibG9ja3MgaW5jcmVhc2UgYnkgNS4KLSBBZnRl
ciByZWJvb3QsICB0aGUgc3RhdGlzdGljYWwgdmFsdWUgdHVyZSB0byB0aGUgY29ycmVjdCB2YWx1
ZSBvZiAxLgotIFNvIHRoZSBydW50aW1lIGNvdW50ZXIgKGVjY19zdGF0cy5iYWRibG9ja3MpIGlz
IGluZmxhdGVkLgoKUmVwcm8gKHdpdGggbmFuZHNpbS5rbykKCmBgYGJhc2gKIyBJRD0iMHhlYyww
eGExLDB4MDAsMHgxNSIgIyAxMjhNIDEyOEtCIDJLQgojIG1vZHByb2JlIG5hbmRzaW0gaWRfYnl0
ZXM9JElECiMgfi9tdGQtdXRpbHMvbXRkX21hcmtiYWQgL2Rldi9tdGQxIDEwIDEgIyBSZXBlYXQg
NSB0aW1lcwouLi4uLi4KIyB+L210ZC11dGlscy9tdGRfbWFya2JhZCAvZGV2L210ZDEgMTAgMQoK
IyAtLSBJdCBjYW4gYmUgb2JzZXJ2ZWQgdGhhdCA1IGJhZCBibG9ja3Mgd2lsbCBhcHBlYXIgaW4g
dGhlIHN0YXRpc3RpY2FsIGluZm9ybWF0aW9uLgojIGNhdCAvc3lzL2NsYXNzL210ZC9tdGQxL2Jh
ZF9ibG9ja3MKNQoKIyAtLSBJbiBmYWN0LCB3ZSBjYW4gb25seSBzY2FuIDEgYmFkIGJsb2NrLgoj
IHViaWZvcm1hdCAtdiAvZGV2L210ZDEgIHwgZ3JlcCAiYmFkIGVyYXNlYmxvY2siCnViaWZvcm1h
dDogMSBiYWQgZXJhc2VibG9ja3MgZm91bmQsIG51bWJlcnM6IDEwCmBgYAoKUm9vdCBjYXVzZSBh
bmFseXNpcyAoa2VybmVsLXNpZGUpCgpgYGAKbXRkX2Jsb2NrX21hcmtiYWQKICAgbXRkLT5fYmxv
Y2tfbWFya2JhZCgpCiAgICAgbmFuZF9ibG9ja19tYXJrYmFkCiAgICAgICByZXQgPSBuYW5kX2Js
b2NrX2lzYmFkCiAgICAgICByZXR1cm4gMDsgLy8gcmV0ID4gMAogICBtdGQtPmVjY19zdGF0cy5i
YWRibG9ja3MrKzsgIC8vIE5vIGJhZCBibG9ja3Mgd2FzIG1hcmtlZCBidXQgd2FzIGNvdW50ZWQu
CiAgIApSZWxldmFudCBjb2RlCi0gZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmM6bmFu
ZF9ibG9ja19tYXJrYmFkKCkKLSBkcml2ZXJzL210ZC9tdGRjb3JlLmM6bXRkX2Jsb2NrX21hcmti
YWQoKQpgYGAKCm5hbmRfYmxvY2tfbWFya2JhZCgpIHJldHVybnMgMCBib3RoIGZvciDigJxuZXds
eSBtYXJrZWTigJ0gYW5kIOKAnGFscmVhZHkgYmFk4oCdLgptdGRjb3JlIGNhbm5vdCB0ZWxsIHdo
ZXRoZXIgdGhpcyBjYWxsIGFjdHVhbGx5IGFkZGVkIGEgbmV3IGJhZCBibG9jaywKYnV0IHN0aWxs
IGluY3JlbWVudHMgZWNjX3N0YXRzLmJhZGJsb2Nrcy4KClBvc3NpYmxlIGZpeGVzIChoaWdoIGxl
dmVsKQotIENvcmUtc2lkZSBjb25zZXJ2YXRpdmUgZml4IChtaW5pbWFsIEFCSSBjaGFuZ2UpOgog
ICAqIEluIG10ZF9ibG9ja19tYXJrYmFkKCksIHByb2JlIF9ibG9ja19pc2JhZChtYXN0ZXIsIG9m
cykgYmVmb3JlCiAgICAgY2FsbGluZyBfYmxvY2tfbWFya2JhZCgpLCBhbmQgKGlmIGF2YWlsYWJs
ZSkgcHJvYmUgYWdhaW4gYWZ0ZXIgc3VjY2Vzcy4KICAgKiBPbmx5IGluY3JlbWVudCBlY2Nfc3Rh
dHMuYmFkYmxvY2tzIGlmIHRoZSBzdGF0ZSB0cmFuc2l0aW9uZWQgZnJvbQogICAgIOKAnGdvb2Ti
gJ0gdG8g4oCcYmFk4oCdLgoKLSBUZWFjaCAqX2Jsb2NrX21hcmtiYWQoKSB0byByZXR1cm4gYSBk
aXN0aW5jdCBwb3NpdGl2ZSBjb2RlIGZvcgogICDigJxhbHJlYWR5IGJhZOKAnSB2cyDigJxuZXds
eSBtYXJrZWTigJ0sIHNvIHRoZSBjb3JlIGNhbiBpbmNyZW1lbnQgb25seSBvbgogICDigJxuZXds
eSBtYXJrZWTigJ0uCgpXaGF0IEkgd2FudCB0byBrbm93IGlzOgotIFdvdWxkIHRoZSBjb3JlLXNp
ZGUgcHJlL3Bvc3QgX2Jsb2NrX2lzYmFkIGNoZWNrIGJlIGFjY2VwdGFibGUgYXMgYSBzaG9ydC10
ZXJtIGZpeD8KLSBBbnkgb2JqZWN0aW9ucyByZWdhcmRpbmcgdGhlIGV4dHJhIGlzYmFkIElPIGlu
IHRoZSBtYXJrYmFkIHBhdGg/Ci0gTG9uZ2VyLXRlcm0sIGlzIHRoZXJlIGludGVyZXN0IGluIGFu
IGV4cGxpY2l0IEFQSS9yZXR1cm4tY29kZSBzZW1hbnRpY3MKICAgdG8gZGlmZmVyZW50aWF0ZSDi
gJxhbHJlYWR5IGJhZOKAnSB2cyDigJxuZXdseSBtYXJrZWTigJ0/CgpJ4oCZbSB2ZXJ5IGludGVy
ZXN0ZWQgaW4gaGVscGluZyByZXNvbHZlIHRoaXMgaXNzdWUgYW5kIHdvdWxkIGJlIGdyYXRlZnVs
CmZvciBhbnkgZ3VpZGFuY2Ugb3Igc3VnZ2VzdGlvbnMuCgpCZXN0IHJlZ2FyZHMsCldhbmcgWmhh
b2xvbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
