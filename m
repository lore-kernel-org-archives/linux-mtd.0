Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104EBC2BD09
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Jul 2024 02:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DV/oWd8BuIIZ3ftQaCxyaM6C51ngU2yINxXcl5q7Z08=; b=FkUlXANpgAJXPw8t2/qkajlWSt
	TYgWC4D8K+bPEkxrBrbkNUFhA8CM1dH9SFx0QR1cdrlrkvzqwsSi6+jRQBGEY2K19ulan2q7yjkXZ
	XMpNYHYdmdBflYSE8oSD8SZ0DbYu02O+O7uwhbe2PFNtvFTUne3FmhCqeyHtNW5AoAM46gchqBOXY
	CE6ZoC/sMhmVaxDA0iuBnXvSnW1irRT5hcuwCq/s0q9uFnsqUyhJfEAaAOhqHWKjRcB4e38BaXbQt
	IG/JXueCXE/7JV4SljyqwFWqC9gEt8fwYvIkDjaZKA5S/6E1SFmBvV6dlDNI3SitOwja5MUWAdUrW
	nfgy79fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSSWa-00000001kXJ-1cQN;
	Sat, 13 Jul 2024 02:30:12 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSSWW-00000001kWO-2hVy
	for linux-mtd@lists.infradead.org;
	Sat, 13 Jul 2024 02:30:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WLXVM1Ft3z4f3jMP
	for <linux-mtd@lists.infradead.org>; Sat, 13 Jul 2024 10:29:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id ED5801A0568
	for <linux-mtd@lists.infradead.org>; Sat, 13 Jul 2024 10:29:58 +0800 (CST)
Received: from [10.174.178.46] (unknown [10.174.178.46])
	by APP2 (Coremail) with SMTP id Syh0CgBn0Yaj5pFmb6LPBw--.58645S3;
	Sat, 13 Jul 2024 10:29:57 +0800 (CST)
Subject: Re: [BUG REPORT] potential deadlock in inode evicting under the inode
 lru traversing context on ext4 and ubifs
To: Theodore Ts'o <tytso@mit.edu>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, "zhangyi (F)" <yi.zhang@huawei.com>,
 yangerkun <yangerkun@huawei.com>, "wangzhaolong (A)"
 <wangzhaolong1@huawei.com>
References: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
 <20240712143708.GA151742@mit.edu>
From: Zhihao Cheng <chengzhihao@huaweicloud.com>
Message-ID: <346993f2-87f6-e20f-8f5a-d19f84c1604c@huaweicloud.com>
Date: Sat, 13 Jul 2024 10:29:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240712143708.GA151742@mit.edu>
X-CM-TRANSID: Syh0CgBn0Yaj5pFmb6LPBw--.58645S3
X-Coremail-Antispam: 1UD129KBjvJXoW7urWxZF1ktr1UAw47KFyxuFg_yoW5JFy5pa
	9rXa4Syrn5JFyYk34ktr4v9w10ka1rCr4UJrykWr1xA3WkXrySvF1xtr45JFWUur4kuw1v
	qa1UCrn8urn0y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07UWE__UUUUU=
X-CM-SenderInfo: xfkh0wx2klxt3r6k3tpzhluzxrxghudrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_193009_047287_E0EBF4BF 
X-CRM114-Status: GOOD (  12.89  )
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

CgrU2iAyMDI0LzcvMTIgMjI6MzcsIFRoZW9kb3JlIFRzJ28g0LS1wDoKPj4gUHJvYmxlbSBkZXNj
cmlwdGlvbgo+PiA9PT09PT09PT09PT09PT09PT09Cj4+Cj4+IFRoZSBpbm9kZSByZWNsYWltaW5n
IHByb2Nlc3MoU2VlIGZ1bmN0aW9uIHBydW5lX2ljYWNoZV9zYikgY29sbGVjdHMgYWxsCj4+IHJl
Y2xhaW1hYmxlIGlub2RlcyBhbmQgbWFyayB0aGVtIHdpdGggSV9GUkVFSU5HIGZsYWcgYXQgZmly
c3QsIGF0IHRoYXQKPj4gdGltZSwgb3RoZXIgcHJvY2Vzc2VzIHdpbGwgYmUgc3R1Y2sgaWYgdGhl
eSB0cnkgZ2V0dGluZyB0aGVzZSBpbm9kZXMoU2VlCj4+IGZ1bmN0aW9uIGZpbmRfaW5vZGVfZmFz
dCksIHRoZW4gdGhlIHJlY2xhaW1pbmcgcHJvY2VzcyBkZXN0cm95IHRoZQo+PiBpbm9kZXMgYnkg
ZnVuY3Rpb24gZGlzcG9zZV9saXN0KCkuCj4+IFNvbWUgZmlsZXN5c3RlbXMoZWcuIGV4dDQgd2l0
aCBlYV9pbm9kZSBmZWF0dXJlLCB1YmlmcyB3aXRoIHhhdHRyKSBtYXkKPj4gZG8gaW5vZGUgbG9v
a3VwIGluIHRoZSBpbm9kZSBldmljdGluZyBjYWxsYmFjayBmdW5jdGlvbiwgaWYgdGhlIGlub2Rl
Cj4+IGxvb2t1cCBpcyBvcGVyYXRlZCB1bmRlciB0aGUgaW5vZGUgbHJ1IHRyYXZlcnNpbmcgY29u
dGV4dCwgZGVhZGxvY2sKPj4gcHJvYmxlbXMgbWF5IGhhcHBlbi4KPj4KPj4gQ2FzZSAxOiBJbiBm
dW5jdGlvbiBleHQ0X2V2aWN0X2lub2RlKCksIHRoZSBlYSBpbm9kZSBsb29rdXAgY291bGQgaGFw
cGVuCj4+IGlmIGVhX2lub2RlIGZlYXR1cmUgaXMgZW5hYmxlZCwgdGhlIGxvb2t1cCBwcm9jZXNz
IHdpbGwgYmUgc3R1Y2sgdW5kZXIKPj4gdGhlIGV2aWN0aW5nIGNvbnRleHQgbGlrZSB0aGlzOgo+
Pgo+PiAgIDEuIEZpbGUgQSBoYXMgaW5vZGUgaV9yZWcgYW5kIGFuIGVhIGlub2RlIGlfZWEKPj4g
ICAyLiBnZXRmYXR0cihBLCB4YXR0cl9idWYpIC8vIGlfZWEgaXMgYWRkZWQgaW50byBscnUgLy8g
bHJ1LT5pX2VhCj4+ICAgMy4gVGhlbiwgZm9sbG93aW5nIHRocmVlIHByb2Nlc3NlcyBydW5uaW5n
IGxpa2UgdGhpczoKPj4KPj4gICAgICBQQSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBC
Cj4+ICAgZWNobyAyID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4+ICAgIHNocmlua19zbGFi
Cj4+ICAgICBwcnVuZV9kY2FjaGVfc2IKPj4gICAgIC8vIGlfcmVnIGlzIGFkZGVkIGludG8gbHJ1
LCBscnUtPmlfZWEtPmlfcmVnCj4+ICAgICBwcnVuZV9pY2FjaGVfc2IKPj4gICAgICBsaXN0X2xy
dV93YWxrX29uZQo+PiAgICAgICBpbm9kZV9scnVfaXNvbGF0ZQo+PiAgICAgICAgaV9lYS0+aV9z
dGF0ZSB8PSBJX0ZSRUVJTkcgLy8gc2V0IGlub2RlIHN0YXRlCj4+ICAgICAgICBpX2VhLT5pX3N0
YXRlIHw9IElfRlJFRUlORyAvLyBzZXQgaW5vZGUgc3RhdGUKPiBVbSwgSSBkb24ndCBzZWUgaG93
IHRoaXMgY2FuIGhhcHBlbi4gIElmIHRoZSBlYV9pbm9kZSBpcyBpbiB1c2UsCj4gaV9jb3VudCB3
aWxsIGJlIGdyZWF0ZXIgdGhhbiB6ZXJvLCBhbmQgaGVuY2UgdGhlIGlub2RlIHdpbGwgbmV2ZXIg
YmUKPiBnbyBkb3duIHRoZSByZXN0IG9mIHRoZSBwYXRoIGluIGlub2RlX2xydV9pbm9kZSgpOgoK
VGhlIGNvdW50ZXIgb2YgZWFfaW5vZGUgY291bGQgYmVjb21lIHplcm8gYmVmb3JlIHRoZSBmaWxl
IGlub2RlLCAKYWNjb3JkaW5nIHRvIHRoZSBmb2xsb3dpbmcgcHJvY2VzczoKcGF0aF9nZXR4YXR0
cgogIHVzZXJfcGF0aF9hdCgmcGF0aCkgLy8gZ2V0IGZpbGUgZGVudHJ5IGFuZCBmaWxlIGlub2Rl
CiAgZ2V0eGF0dHIKICAgZXh0NF94YXR0cl9nZXQKICAgIGV4dDRfeGF0dHJfaWJvZHlfZ2V0CiAg
ICAgZXh0NF94YXR0cl9pbm9kZV9nZXQKICAgICAgZXh0NF94YXR0cl9pbm9kZV9pZ2V0KCZlYV9p
bm9kZSkgIC8vIGVhX2lub2RlLT5pX2NvdW50ID0gMQogICAgICBpcHV0KGVhX2lub2RlKSAvLyBl
YV9pbm9kZS0+aV9jb3VudCA9IDAsIHB1dCBpdCBpbnRvIGxydQogIHBhdGhfcHV0KCZwYXRoKTsg
Ly8gcHV0IGZpbGUgZGVudHJ5IGFuZCBmaWxlIGlub2RlCgo+IAo+IAlpZiAoYXRvbWljX3JlYWQo
Jmlub2RlLT5pX2NvdW50KSB8fAo+IAkgICAgLi4uKSB7Cj4gCQlsaXN0X2xydV9pc29sYXRlKGxy
dSwgJmlub2RlLT5pX2xydSk7Cj4gCQlzcGluX3VubG9jaygmaW5vZGUtPmlfbG9jayk7Cj4gCQl0
aGlzX2NwdV9kZWMobnJfdW51c2VkKTsKPiAJCXJldHVybiBMUlVfUkVNT1ZFRDsKPiAJfQo+IAo+
IERvIHlvdSBoYXZlIGFuIGFjdHVhbCByZXByb2R1ZXIgd2hpY2ggdHJpZ2dlcnMgdGhpcz8gIE9y
IHdvdWxkIHRoaXMKPiBoYXBwZW4gYmUgYW55IGNoYW5jZSBzb21ldGhpbmcgdGhhdCB3YXMgZHJl
YW1lZCB1cCB3aXRoIERFUFQ/CgpUaGUgcmVwcm9kdWNlciBpcyBpbiB0aGUgc2Vjb25kIGhhbGYg
b2YgdGhlIGFyaXRpY2xlLCBhbG9uZyB3aXRoIHNvbWUgb2YgCnRoZSBzb2x1dGlvbnMgd2UgdHJp
ZWQuCgpSZXByb2R1Y2VyOgo9PT09PT09PT09PQoKaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMTkwMjIKCkFib3V0IHNvbHV0aW9ucwo9PT09PT09PT09PT09PT0K
ClsuLi5dCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
