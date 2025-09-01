Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B060DCA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 17:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhwQe0bXC+WuQto4HHDmyMlv46I+0lTbygZbdXR6ekI=; b=khaQi+iCm8retR
	XWM3+mlYykZEI+AX25kVo++usMVb1P6wESOgrlAiIyGm6PIyTKOzT1IUo5Z74oTZhMayLmXcIedaq
	hJKhrhVGp4oAKrj68I69LqnV4idEF5KXnNsSwX/jYwPit9HiOo9AeqoaZ6BOJ8HlzlL7Qk4g3dxrq
	AuYda+tKHAQiwrcAfjHHfGsUcERZEbTe20Ch9gh4jjJFROtXoK0oQ3vx7ZnUKW35UQsrJVXt1Rt5k
	LoNb3muOgnGUTgJFxNRwdG4T+Vth9XOB8WU72StWWOLc1gApp4d+hg5sty0lk3scY0UoLHTjeyLyU
	VMGSrz4eEIe5997gJzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8NO-0000000DT0c-0GDQ;
	Mon, 01 Sep 2025 17:31:30 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5KY-0000000CofQ-3vU8
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 14:16:25 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4cFrX42KFKzYQvDx
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 22:16:20 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id CF5201A0847
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 22:16:18 +0800 (CST)
Received: from [10.174.178.209] (unknown [10.174.178.209])
	by APP4 (Coremail) with SMTP id gCh0CgDXIY6yqrVow+onBA--.2245S3;
	Mon, 01 Sep 2025 22:16:18 +0800 (CST)
Message-ID: <723b6339-148e-421b-b778-803ac69f976d@huaweicloud.com>
Date: Mon, 1 Sep 2025 22:16:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] mtd: bad block counter inflated when repeatedly
 marking the same block
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 yi.zhang@huawei.com, yangerkun@huawei.com, chengzhihao1@huawei.com
References: <ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com>
 <87y0qynxw5.fsf@bootlin.com>
From: Wang Zhaolong <wangzhaolong@huaweicloud.com>
In-Reply-To: <87y0qynxw5.fsf@bootlin.com>
X-CM-TRANSID: gCh0CgDXIY6yqrVow+onBA--.2245S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4DAFW7JF1xtF4xur1rJFb_yoW8ZF4xpa
	n0kFW3Krn8Gr1Iva4xAF4Iv34S93s3Ga1UtF1rWryrA3WUZF4fXr1kKayvqFyjgrZxtw1a
	vr1jyrW8Way5Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbiF4tUUUUU==
X-CM-SenderInfo: pzdqw6xkdrz0tqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_071623_372375_BEED250B 
X-CRM114-Status: GOOD (  16.48  )
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

Cj4+IFBvc3NpYmxlIGZpeGVzIChoaWdoIGxldmVsKQo+PiAtIENvcmUtc2lkZSBjb25zZXJ2YXRp
dmUgZml4IChtaW5pbWFsIEFCSSBjaGFuZ2UpOgo+PiAgICAqIEluIG10ZF9ibG9ja19tYXJrYmFk
KCksIHByb2JlIF9ibG9ja19pc2JhZChtYXN0ZXIsIG9mcykgYmVmb3JlCj4+ICAgICAgY2FsbGlu
ZyBfYmxvY2tfbWFya2JhZCgpLCBhbmQgKGlmIGF2YWlsYWJsZSkgcHJvYmUgYWdhaW4gYWZ0ZXIK
Pj4gc3VjY2Vzcy4KPiAKPiBTb3VuZHMgcmVhc29uYWJsZSB0byBtZS4KPiAKPj4gICAgKiBPbmx5
IGluY3JlbWVudCBlY2Nfc3RhdHMuYmFkYmxvY2tzIGlmIHRoZSBzdGF0ZSB0cmFuc2l0aW9uZWQg
ZnJvbQo+PiAgICAgIOKAnGdvb2TigJ0gdG8g4oCcYmFk4oCdLgo+Pgo+PiAtIFRlYWNoICpfYmxv
Y2tfbWFya2JhZCgpIHRvIHJldHVybiBhIGRpc3RpbmN0IHBvc2l0aXZlIGNvZGUgZm9yCj4+ICAg
IOKAnGFscmVhZHkgYmFk4oCdIHZzIOKAnG5ld2x5IG1hcmtlZOKAnSwgc28gdGhlIGNvcmUgY2Fu
IGluY3JlbWVudCBvbmx5IG9uCj4+ICAgIOKAnG5ld2x5IG1hcmtlZOKAnS4KPiAKPiBUaGUgc3Vi
c3lzdGVtcyBoYXZlIG5vIG90aGVyIHdheSB0byB0ZWxsIHJhdGhlciB0aGFuIHByb2JpbmcgdGhl
IHN0YXRlCj4gb2YgdGhlIG1hcmtlci4gSSBiZWxpZXZlIGl0IGlzIGJlc3QgdG8gZG8gaXQgaW4g
bXRkX2Jsb2NrX21hcmtiYWQoKSBpbgo+IHRoZSBjb21tb24gbXRkY29yZS5jIHJhdGhlciB0aGFu
IGluIGVhY2ggaW1wbGVtZW50YXRpb24uCj4gCgpUaGFuayB5b3UgZm9yIHlvdXIgZ3VpZGFuY2Uh
Cgo+PiBXaGF0IEkgd2FudCB0byBrbm93IGlzOgo+PiAtIFdvdWxkIHRoZSBjb3JlLXNpZGUgcHJl
L3Bvc3QgX2Jsb2NrX2lzYmFkIGNoZWNrIGJlIGFjY2VwdGFibGUgYXMgYSBzaG9ydC10ZXJtIGZp
eD8KPj4gLSBBbnkgb2JqZWN0aW9ucyByZWdhcmRpbmcgdGhlIGV4dHJhIGlzYmFkIElPIGluIHRo
ZSBtYXJrYmFkIHBhdGg/Cj4gCj4gRmluZSBieSBtZSwgaXQncyBub3QgYSBob3QgcGF0aC4gSWYg
d2UgZW5kIHVwIGhlcmUsIHdlIGFyZSBhbHJlYWR5IGRvaW5nCj4gZGFtYWdlIGNvbnRyb2wuOwoK
SeKAmWxsIHByZXBhcmUgYW4gUkZDIHBhdGNoIGltcGxlbWVudGluZyB0aGUgcHJlL3Bvc3QgX2Js
b2NrX2lzYmFkKCkgY2hlY2tzCmluIG10ZF9ibG9ja19tYXJrYmFkKCkgYW5kIG9ubHkgaW5jcmVt
ZW50IGVjY19zdGF0cy5iYWRibG9ja3Mgb24gYSBjb25maXJtZWQKZ29vZOKGkmJhZCB0cmFuc2l0
aW9uLiBBcyBkaXNjdXNzZWQsIHRoaXMga2VlcHMgdGhlIGxvZ2ljIGluIG10ZGNvcmUgYW5kCmF2
b2lkcyBwZXItZHJpdmVyIGNoYW5nZXMuCgpGb3IgZGV2aWNlcyBsYWNraW5nIF9ibG9ja19pc2Jh
ZCgpLCBJ4oCZbGwgdGFrZSB0aGUgY29uc2VydmF0aXZlIGFwcHJvYWNoCihubyBpbmNyZW1lbnQg
dW5sZXNzIHdlIGNhbiBjb25maXJtIHRoZSB0cmFuc2l0aW9uKSBhbmQgY2FsbCB0aGF0IG91dCBp
biB0aGUKY29tbWl0IG1lc3NhZ2UgdG8gZ2F0aGVyIGZlZWRiYWNrLgoKPiBJZiB5b3UgbWVhbiB1
c2Vyc3BhY2UgQVBJLCBJJ2Qgc2F5IG5vdCBuZWNlc3NhcmlseS4gUXVlcnlpbmcgdGhlIHN0YXRz
Cj4gaXMgcHJvYmFibHkgdGhlIHdheSB0byBnby4gSG93ZXZlciBpbiB0aGUga2VybmVsLCB3aGls
ZSBJIHdvdWxkIGluCj4gdGhlb3J5IG5vdCBiZSBvcHBvc2VkIHRvIGl0LCBJIGRvbid0IHNlZSBo
b3cgb25lIGNvdWxkIGltcGxlbWVudCB0aGF0IGluCj4gYSBtb3JlIGVmZmljaWVudCB3YXkgdGhh
biBwcm9iaW5nIHRoZSBtYXJrZXIgYXMgZGlzY3Vzc2VkIGFib3ZlIGluIGEKPiBjb21wbGV4LWZy
ZWUgbWFubmVyLgo+IAoKSXQgc291bmRzIHZlcnkgcmVhc29uYWJsZS4KCkkgd2lsbCBpbmNsdWRl
IHJlcHJvZHVjdGlvbiBtZXRob2RzIGFuZCB0ZXN0IGNhc2VzIGJhc2VkIG9uIGJvdGggbmFuZHNp
bSBhbmQKcGh5c2ljYWwgZGV2aWNlcy4gVGhhbmsgeW91IGFnYWluIGZvciB5b3VyIGd1aWRhbmNl
IQoKQmVzdCByZWdhcmRzLApXYW5nIFpoYW9sb25nCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
