Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D71CA1009
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS3sEtjqzgeDwPYnqbp+Q7+5z98mEMErjCleiH7H/04=; b=BnsK9qRchSqITL
	w5WuM0UIzsywlH1WyFSWN4L66UGkRdJe4lTrXxUBLsI109/9av3r0RBhI/7ZB+dWjV+U8foqdT3Y9
	F9ZrpU3kKa4qK/H+ceOFTf3YZ/Lime/KInWJHRrAnlRqRyhl6BCvu3mZik2tFhbzVAFz7hvnsUydH
	zozOZb9xSqXBk+9GsNlH4MLPDAj2srBuemKjoCTRQLh/47f+eoT6mpqB/Ne9VrlNnXANDALKfzrVY
	wPmJfR/MIAL8y53nCM9SnKLGbB3QW18m1EUgNijX1t2h0NpFilCL4Szk+aijLpcwezF2iUKcYagyk
	FGTQEIIw4g8g5K+z205Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNP0-0000000GP7S-2Jhb;
	Tue, 02 Sep 2025 09:34:10 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMvp-0000000GFLe-0JQF
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 09:04:03 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4cGKY95DX1zYQvcP
	for <linux-mtd@lists.infradead.org>; Tue,  2 Sep 2025 17:03:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 3DCFF1A0844
	for <linux-mtd@lists.infradead.org>; Tue,  2 Sep 2025 17:03:56 +0800 (CST)
Received: from [10.174.178.209] (unknown [10.174.178.209])
	by APP4 (Coremail) with SMTP id gCh0CgAncIz6srZoOM2BBA--.6100S3;
	Tue, 02 Sep 2025 17:03:56 +0800 (CST)
Message-ID: <732d629c-d1b9-4483-95c3-9a80bd7b2511@huaweicloud.com>
Date: Tue, 2 Sep 2025 17:03:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: core: only increment ecc_stats.badblocks on
 confirmed good->bad transition
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, chengzhihao1@huawei.com, yi.zhang@huawei.com,
 yangerkun@huawei.com
References: <20250902080117.3658372-1-wangzhaolong@huaweicloud.com>
 <87ms7dntlb.fsf@bootlin.com>
From: Wang Zhaolong <wangzhaolong@huaweicloud.com>
In-Reply-To: <87ms7dntlb.fsf@bootlin.com>
X-CM-TRANSID: gCh0CgAncIz6srZoOM2BBA--.6100S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4rJw1fGFy3Jw13Cw1kAFb_yoW5Gw4fpa
	n8t3WrCa1DWw1Fq3W7Zr1xXasag3s3KrsxGF48Jr1UCF98uw1ftrn8KFyF9rnFgrsFyr4q
	vr45K39xua4UJa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1veHDUUUUU==
X-CM-SenderInfo: pzdqw6xkdrz0tqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_020401_436931_89BD9D29 
X-CRM114-Status: GOOD (  19.92  )
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

CkhpIE1pcXXDqGwsCgoKPiBIZWxsbyBXYW5nLAo+IAo+PiBAQCAtMjM0OSwxNyArMjM1MSwzNSBA
QCBpbnQgbXRkX2Jsb2NrX21hcmtiYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZnMp
Cj4+ICAgCQlyZXR1cm4gLUVST0ZTOwo+PiAgIAo+PiAgIAlpZiAobXRkLT5mbGFncyAmIE1URF9T
TENfT05fTUxDX0VNVUxBVElPTikKPj4gICAJCW9mcyA9IChsb2ZmX3QpbXRkX2Rpdl9ieV9lYihv
ZnMsIG10ZCkgKiBtYXN0ZXItPmVyYXNlc2l6ZTsKPj4gICAKPj4gLQlyZXQgPSBtYXN0ZXItPl9i
bG9ja19tYXJrYmFkKG1hc3RlciwgbXRkX2dldF9tYXN0ZXJfb2ZzKG10ZCwgb2ZzKSk7Cj4+ICsJ
bW9mZnMgPSBtdGRfZ2V0X21hc3Rlcl9vZnMobXRkLCBvZnMpOwo+PiArCj4+ICsJLyogUHJlLWNo
ZWNrOiByZW1lbWJlciBjdXJyZW50IHN0YXRlIGlmIGF2YWlsYWJsZS4gKi8KPj4gKwlpZiAobWFz
dGVyLT5fYmxvY2tfaXNiYWQpCj4+ICsJCW9sZGJhZCA9IG1hc3Rlci0+X2Jsb2NrX2lzYmFkKG1h
c3RlciwgbW9mZnMpOwo+PiArCj4+ICsJcmV0ID0gbWFzdGVyLT5fYmxvY2tfbWFya2JhZChtYXN0
ZXIsIG1vZmZzKTsKPj4gICAJaWYgKHJldCkKPj4gICAJCXJldHVybiByZXQ7Cj4+ICAgCj4+IC0J
d2hpbGUgKG10ZC0+cGFyZW50KSB7Cj4+IC0JCW10ZC0+ZWNjX3N0YXRzLmJhZGJsb2NrcysrOwo+
PiAtCQltdGQgPSBtdGQtPnBhcmVudDsKPj4gKwkvKgo+PiArCSAqIFBvc3QtY2hlY2sgYW5kIGJ1
bXAgc3RhdHMgb25seSBvbiBhIGNvbmZpcm1lZCBnb29kLT5iYWQgdHJhbnNpdGlvbi4KPj4gKwkg
KiBJZiBfYmxvY2tfaXNiYWQgaXMgbm90IGltcGxlbWVudGVkLCBiZSBjb25zZXJ2YXRpdmUgYW5k
IGRvIG5vdCBidW1wLgo+PiArCSAqLwo+PiArCWlmIChtYXN0ZXItPl9ibG9ja19pc2JhZCkgewo+
PiArCQkvKiBJZiBpdCB3YXMgYWxyZWFkeSBiYWQsIG5vdGhpbmcgdG8gZG8uICovCj4+ICsJCWlm
IChvbGRiYWQgPiAwKQo+PiArCQkJcmV0dXJuIDA7Cj4+ICsKPj4gKwkJaWYgKG1hc3Rlci0+X2Js
b2NrX2lzYmFkKG1hc3RlciwgbW9mZnMpID4gMCkgewo+PiArCQkJd2hpbGUgKG10ZC0+cGFyZW50
KSB7Cj4+ICsJCQkJbXRkLT5lY2Nfc3RhdHMuYmFkYmxvY2tzKys7Cj4+ICsJCQkJbXRkID0gbXRk
LT5wYXJlbnQ7Cj4+ICsJCQl9Cj4+ICsJCX0KPiAKPiBJIGRvbid0IHRoaW5rIHlvdSBjYW4gYXNz
dW1lIHRoZSBibG9jayB3YXMgYWxyZWFkeSBiYWQgYW5kIG11c3Qgbm90IGJlCj4gYWNjb3VudGVk
IGFzIGEgbmV3IGJhZCBibG9jayBpZiB5b3UgY2Fubm90IHZlcmlmeSB0aGF0LiBJbiB0aGlzIGNh
c2Ugd2UKPiBtdXN0IHJlbWFpbiBjb25zZXJ2YXRpdmUgYW5kIHRlbGwgdXNlcnNwYWNlIGEgbmV3
IGJsb2NrIHdhcyBtYXJrZWQgYmFkLAo+IEkgYmVsaWV2ZS4KClRoYW5rcyBmb3IgdGhlIHJldmll
dyBhbmQgdGhlIGNsZWFyIGd1aWRhbmNlLgoKTXkgaW50ZW50IHdhcyB0byBhdm9pZCBpbmZsYXRp
bmcgYmFkYmxvY2tzIGJ5IG9ubHkgYnVtcGluZyB0aGUgY291bnRlciBvbiBhCmNvbmZpcm1lZCBn
b29kLT5iYWQgdHJhbnNpdGlvbi4gSSB0cmllZCB0byBncm91bmQgdGhlIGRlY2lzaW9uIG9uIG9i
c2VydmFibGUKc3RhdGUgKHByZS9wb3N0IGlzYmFkKSByYXRoZXIgdGhhbiByZXR1cm4gY29kZXMs
IGFuZCB0byBhdm9pZCBhc3N1bWluZyBzdWNjZXNzCmltcGxpZXMgaW1tZWRpYXRlIHZpc2liaWxp
dHkgYWNyb3NzIGRyaXZlcnMuIFRoYXTigJlzIHdoeSB0aGUgaW5jcmVtZW50IHdhcwp0aWVkIHRv
IHZlcmlmaWNhdGlvbiBhbmQgc2tpcHBlZCB3aGVuIF9ibG9ja19pc2JhZCB3YXMgdW5hdmFpbGFi
bGUuCgpZb3VyIHBvaW50IGFib3V0IGJlaW5nIGNvbnNlcnZhdGl2ZSB0b3dhcmRzIHVzZXJzcGFj
ZSBpcyB3ZWxsIHRha2VuOiBpZiB3ZQpjYW5ub3QgdmVyaWZ5LCB3ZSBzaG91bGQgc3RpbGwgYWNj
b3VudCB0aGUgYmFkIGJsb2NrLiBTa2lwcGluZyB0aGUgaW5jcmVtZW50Cm9ubHkgd2hlbiB3ZSBj
YW4gcHJvdmUgdGhlIGJsb2NrIHdhcyBhbHJlYWR5IGJhZCBtYWtlcyB0aGUgY29udHJhY3QgY2xl
YXJlcgphbmQgYXZvaWRzIHVuZGVyLXJlcG9ydGluZy4gS2VlcGluZyB0aGUgaW5jcmVtZW50IG91
dHNpZGUgdGhlIGlmIChfYmxvY2tfaXNiYWQpCmJsb2NrIGFsc28gcmVzdWx0cyBpbiBzaW1wbGVy
LCBtb3JlIHJlYWRhYmxlIGNvZGUuCgoKPiBTYWlkIG90aGVyd2lzZSwgdGhlIHsgd2hpbGUgKCkg
YmFkYmxvY2tzKysgfSBibG9jayBzaGFsbCByZW1haW4gb3V0c2lkZQo+IG9mIHRoZSBpZiAoX2Js
b2NrX2lzYmFkKSBjb25kaXRpb24gYW5kIHJlbWFpbiB1bnRvdWNoZWQuIEp1c3QgYmFpbCBvdXQK
PiBlYXJseSBpZiB5b3UgYXJlIHN1cmUgdGhpcyBpcyBub3QgbmVlZGVkLgo+IAoKSeKAmWxsIHNl
bmQgYSBWMiBzaG9ydGx5IHRoYXQ6CgotIENoZWNrcyBvbGQgc3RhdGUgd2hlbiBfYmxvY2tfaXNi
YWQgZXhpc3RzIGFuZCBiYWlscyBvdXQgZWFybHkgaWYgYWxyZWFkeSBiYWQKLSBPdGhlcndpc2Ug
Y2FsbHMgLT5fYmxvY2tfbWFya2JhZCgpIGFuZCBpbmNyZW1lbnRzIHRoZSBjb3VudGVyIG9uIHN1
Y2Nlc3MsIHdpdGgKICAgdGhlIGluY3JlbWVudCBsZWZ0IG91dHNpZGUgb2YgdGhlIGNvbmRpdGlv
bmFsIGFzIHlvdSBzdWdnZXN0ZWQKClRoYW5rcyBhZ2FpbiBmb3IgdGhlIGRpcmVjdGlvbi4KCkJl
c3QgcmVnYXJkcywKV2FuZyBaaGFvbG9uZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
