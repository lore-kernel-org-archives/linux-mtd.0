Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50885C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 02:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAy6SFrZhkIWIyUIOCDXNjJVilQDwIc6/h4TmE3dPnA=; b=Mq1UMcrXvbua2/Tq5Wj+EoIP34
	l+ySH2o5bU1TKCQnQG/3qu5k2Pc20FcyaKQex9R/JFOimLk0P7Vlt4ixSv37ofdtgdtLERDl2g1zB
	s39obFuz47BNcU2JLnlH+l/Fh2ABa3QFoB44Wbt+A9BzmsTuqNtXSlZ4q8GnaksJHC0H6s4+r5tHp
	92tZQBPB+zeAeRMVM0sRQ6qIkrNpgGVPeETkmKdd5uAnCXPHV5flW3furuoSO4c+Bu7ZEPoufEr60
	XfMept1UmvwqxoMVKGGHnRGNb2MBCtyEWLsCpfh2CqnrRtRkJ+bVJtg+x8EWQgV7kCtzPz/XDtqRg
	ED0MsSlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUfvo-00EjWT-Sr; Thu, 17 Mar 2022 02:32:04 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUfvl-00EjW5-IQ
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 02:32:03 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KJrcy5kKLz1GCND;
 Thu, 17 Mar 2022 10:26:58 +0800 (CST)
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 10:31:57 +0800
Subject: Re: [PATCH -next] ubifs: rename_whiteout: correct old_dir size
 computing
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, yukuai3 <yukuai3@huawei.com>, chengzhihao1
 <chengzhihao1@huawei.com>, Baokun Li <libaokun1@huawei.com>
References: <20220215040736.2839939-1-libaokun1@huawei.com>
 <dc55e8b3-7d22-6024-374d-4ed126e18c42@huawei.com>
 <157336576.152785.1647468012272.JavaMail.zimbra@nod.at>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <a4f8bfff-26ee-95f8-db3c-91ca860a32bd@huawei.com>
Date: Thu, 17 Mar 2022 10:31:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <157336576.152785.1647468012272.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_193201_949479_BA62E4DF 
X-CRM114-Status: GOOD (  11.73  )
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

5ZyoIDIwMjIvMy8xNyA2OjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IC0tLS0tIFVy
c3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAibGliYW9rdW4iIDxsaWJhb2t1bjFAaHVh
d2VpLmNvbT4KPj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LCAibGludXgtbXRkIiA8
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIgo+PiA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz4KPj4gQ0M6ICJ5dWt1YWkzIiA8eXVrdWFpM0BodWF3ZWku
Y29tPiwgImNoZW5nemhpaGFvMSIgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiwgImxpYmFva3Vu
IiA8bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAxMC4gTcOk
cnogMjAyMiAwOTozMjo1Nwo+PiBCZXRyZWZmOiBSZTogW1BBVENIIC1uZXh0XSB1YmlmczogcmVu
YW1lX3doaXRlb3V0OiBjb3JyZWN0IG9sZF9kaXIgc2l6ZSBjb21wdXRpbmcKPj4gQSBnZW50bGUg
cGluZywgc29ycnkgZm9yIHRoZSBub2lzZS4KPiBJIGhhdmUgdG8gc2F5IHNvcnJ5IGZvciB0aGUg
ZGF5Lgo+IFRoYW5rcyBmb3IgeW91ciBwYXRpZW5jZSB3aXRoIG1lLgo+ICAgClBsZWFzZSBkb24n
dCBmZWVsIGJhZCBhYm91dCBpdC4KR2xhZCB0byBoZWFyIGZyb20geW91ISBUaGFua3MgZm9yIHlv
dXIga2luZGx5IHJlcGx577yBCj4+IOWcqCAyMDIyLzIvMTUgMTI6MDcsIEJhb2t1biBMaSDlhpnp
gZM6Cj4+PiBXaGVuIHJlbmFtaW5nIHRoZSB3aGl0ZW91dCBmaWxlLCB0aGUgb2xkIHdoaXRlb3V0
IGZpbGUgaXMgbm90IGRlbGV0ZWQuCj4+PiBUaGVyZWZvcmUsIHdlIGFkZCB0aGUgb2xkIGRlbnRy
eSBzaXplIHRvIHRoZSBvbGQgZGlyIGxpa2UgWEZTLgo+Pj4gT3RoZXJ3aXNlLCBhbiBlcnJvciBt
YXkgYmUgcmVwb3J0ZWQgZHVlIHRvIGBmc2NraS0+Y2FsY19zeiAhPSBmc2NraS0+c2l6ZWAKPj4+
IGluIGNoZWNrX2luZGVzLgo+Pj4KPj4+IEZpeGVzOiA5ZTBhMWZmZjhkYjU2ZWEgKCJ1Ymlmczog
SW1wbGVtZW50IFJFTkFNRV9XSElURU9VVCIpCj4+PiBSZXBvcnRlZC1ieTogWmhpaGFvIENoZW5n
IDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IEJhb2t1biBMaSA8
bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+ICAgIGZzL3ViaWZzL2Rpci5jIHwgMyAr
KysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZnMvdWJpZnMvZGlyLmMgYi9mcy91Ymlmcy9kaXIuYwo+Pj4gaW5kZXggYWUwODJhMGJl
MmEzLi44NjE1MTg4OTU0OGUgMTAwNjQ0Cj4+PiAtLS0gYS9mcy91Ymlmcy9kaXIuYwo+Pj4gKysr
IGIvZnMvdWJpZnMvZGlyLmMKPj4+IEBAIC0xNDAyLDYgKzE0MDIsOSBAQCBzdGF0aWMgaW50IGRv
X3JlbmFtZShzdHJ1Y3QgaW5vZGUgKm9sZF9kaXIsIHN0cnVjdCBkZW50cnkKPj4+ICpvbGRfZGVu
dHJ5LAo+Pj4gICAgCQkJaXB1dCh3aGl0ZW91dCk7Cj4+PiAgICAJCQlnb3RvIG91dF9yZWxlYXNl
Owo+Pj4gICAgCQl9Cj4+PiArCj4+PiArCQkvKiBBZGQgdGhlIG9sZF9kZW50cnkgc2l6ZSB0byB0
aGUgb2xkX2RpciBzaXplLiAqLwo+Pj4gKwkJb2xkX3N6IC09IENBTENfREVOVF9TSVpFKGZuYW1l
X2xlbigmb2xkX25tKSk7Cj4gU28geW91IGJhc2ljYWxseSByZXNldCBvbGRfc3ogYmFjayB0byAw
PwpZZXMsIHJlc2V0IG9sZF9zeiB0byAwIGhlcmUuClNpbmNlIHRoZSBvbGQgZmlsZSByZW1haW5z
IGluIG9sZF9kaXIgYWZ0ZXIgd2hpdGVvdXRfcmVuYW1lLApub3RoaW5nIGhhcyBjaGFuZ2VkLCB3
ZSBqdXN0IGFkZCBuZXdfc3ogdG8gdGhlIG5ldyBmb2xkZXIuCgpIZXJlLCBvbGRfc3ogaXMgdGhl
IHZhbHVlIHRvIGJlIHN1YnRyYWN0ZWQgZnJvbSBvbGRfZGlyLT5pX3NpemUsCndoaWNoIGlzIGlu
aXRpYWxpemVkIHRvIGBDQUxDX0RFTlRfU0laRShmbmFtZV9sZW4oJm9sZF9ubSkpO2AgLgpJbiBS
RU5BTUVfV0hJVEVPVVQsIGJlY2F1c2UgdGhlIG9sZCBmaWxlIGlzIG5vdCBkZWxldGVkLAp3ZSBu
ZWVkIHRvIHN1YnRyYWN0IG9sZF9kZW50X3NpemUgZnJvbSBvbGRfc3ogYWZ0ZXIgUkVOQU1FX1dI
SVRFT1VUIGlzIApjb21wbGV0ZSwgdGhhdCBpcywgc2V0IG9sZF9zeiB0byAwLgoKd2UgY2FuIGVh
c2lseSByZXByb2R1Y2UgdGhpcyBwcm9ibGVtIHdpdGggdGhlIGZvbGxvd2luZyBzY3JpcHTvvJoK
IMKgYGBgQwovLyB0ZXN0X3ViaWZzX3doaXRlb3V0LmMKIMKgI2luY2x1ZGUgPHN0ZGxpYi5oPgog
wqAjaW5jbHVkZSA8dW5pc3RkLmg+CiDCoCNpbmNsdWRlIDxmY250bC5oPgogwqAjaW5jbHVkZSA8
c3lzL3N5c2NhbGwuaD4KIMKgI2luY2x1ZGUgPGxpbnV4L2ZzLmg+CgogwqBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqYXJndltdKQogwqB7CiDCoMKgwqDCoCBzeXN0ZW0oInRvdWNoIC9yb290L3Rl
bXAvZmlsZSIpOwogwqDCoMKgwqAgc3lzY2FsbChTWVNfcmVuYW1lYXQyLCBBVF9GRENXRCwgIi9y
b290L3RlbXAvZmlsZSIsIEFUX0ZEQ1dELCAKIi9yb290L3RlbXAvdGFyZ2V0IiwgUkVOQU1FX1dI
SVRFT1VUKTsKIMKgwqDCoMKgIHJldHVybiAwOwogwqB9CiDCoGBgYAoKYGBgc2hlbGwKIyEvYmlu
L2Jhc2gKc2V0IC1lCiMgdWJpZnNfd2hpdGVvdXRfcmVwcm9kdWNlci5zaAoKVE1QPS9yb290L3Rl
bXAKdW1vdW50ICRUTVAgMj4vZGV2L251bGwgfHwgdHJ1ZQpta2RpciAtcCAkVE1QCgptb2Rwcm9i
ZSAtciB1YmlmcyAyPi9kZXYvbnVsbCB8fCB0cnVlCmZvciBpIGluICQoc2VxIDAgMSkKZG8KIMKg
wqDCoCB1YmlkZXRhY2ggLXAgL2Rldi9tdGQkaSAyPi9kZXYvbnVsbCB8fCB0cnVlCmRvbmUKbW9k
cHJvYmUgLXIgdWJpIDI+L2Rldi9udWxsIHx8IHRydWUKbW9kcHJvYmUgLXIgbmFuZHNpbSAyPi9k
ZXYvbnVsbCB8fCB0cnVlCm1vZHByb2JlIG5hbmRzaW0gaWRfYnl0ZXM9IjB4ZWMsMHhhMSwweDAw
LDB4MTUiCm1vZHByb2JlIHViaSBtdGQ9IjAsNTEyIgp1Ymlta3ZvbCAtTiB2b2xfYSAtbSAtbiAw
IC9kZXYvdWJpMAptb2Rwcm9iZSB1Ymlmcwptb3VudCAtdCB1YmlmcyAvZGV2L3ViaTBfMCAkVE1Q
CgouL3Rlc3RfdWJpZnNfd2hpdGVvdXQKdW1vdW50IC9kZXYvdWJpMF8wCmVjaG8gMSA+IC9zeXMv
a2VybmVsL2RlYnVnL3ViaWZzL2Noa19mcwptb3VudCAtdCB1YmlmcyAvZGV2L3ViaTBfMCAkVE1Q
CmBgYAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkJh
b2t1biBMaQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
