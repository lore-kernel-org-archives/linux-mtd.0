Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C29C001DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 03:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QxWAoViD6tT7jbUXsf/zX0TFoo6HuFootlo+m1cqBE=; b=RzG5YjAwMJ+kcK
	+fDMPn28oMaP+RToFu2j7gNFTzJrbH67ehoNcaTTwxjol7nFOWv/6xkYJ8dirLdtZz2jvRRGchpu8
	zWy1DQky0Cnkyj//G6neLgAsxdwp7xeU0SaoaVrW5KiWpQf4+IgJXOiUfdEzaVhlfNEHZ0VTL5IlN
	mwT58HKERr9CHk1JLkDVUQc6XH27R1lgZaytu/HYunpUoJiuK41/5hDSa587MgkVGu1HkzGPbohNQ
	3WU6+wbcOKae5pdbL48hU2iJuID9rJNBsg5nvg+KuMUWfxWTbhSpg+ffZcTE204KgIJfd8r1b10u/
	yt5yXLTr5TKqE2Lekgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7mu-00DcbN-0X;
	Sat, 05 Aug 2023 03:17:08 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7mq-00DcaD-2u
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 03:17:06 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RHnjx6x1Rz1Z1Vb;
	Sat,  5 Aug 2023 11:14:13 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 5 Aug 2023 11:16:58 +0800
Message-ID: <78acc513-472f-6502-b27a-d7446215bae8@huawei.com>
Date: Sat, 5 Aug 2023 11:16:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] mtd: rawnand: brcmnand: Remove unnecessary ternary
 operators
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, Brian Norris
	<computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20230804075717.3336709-1-ruanjinjie@huawei.com>
 <20230804154425.4ee7f918@xps-13>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230804154425.4ee7f918@xps-13>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_201705_114613_517365E0 
X-CRM114-Status: GOOD (  12.81  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIzLzgvNCAyMTo0NCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBSdWFuLAo+IAo+
IHJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBvbiBGcmksIDQgQXVnIDIwMjMgMTU6NTc6MTcg
KzA4MDA6Cj4gCj4+IFRoZXIgYXJlIGEgbGl0dGxlIHRlcm5hcnkgb3BlcmF0b3JzLCB0aGUgdHJ1
ZSBvciBmYWxzZSBqdWRnZW1lbnQKPj4gb2Ygd2hpY2ggaXMgdW5uZWNlc3NhcnkgaW4gQyBsYW5n
dWFnZSBzZW1hbnRpY3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJ1YW4gSmluamllIDxydWFuamlu
amllQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYyB8IDQgKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jCj4+IGluZGV4IDAzNzY0YjU4OWVjNS4uZGM2NjU5MGViNGNmIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPj4gQEAgLTE2NjYsMTMgKzE2NjYsMTMg
QEAgc3RhdGljIGJvb2wgYnJjbXN0Yl9uYW5kX3dhaXRfZm9yX2NvbXBsZXRpb24oc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCkKPj4gIAkJZGlzYWJsZV9jdHJsX2lycXMoY3RybCk7Cj4+ICAJCXN0cyA9
IGJjbW5hbmRfY3RybF9wb2xsX3N0YXR1cyhjdHJsLCBOQU5EX0NUUkxfUkRZLAo+PiAgCQkJCQkg
ICAgICAgTkFORF9DVFJMX1JEWSwgMCk7Cj4+IC0JCWVyciA9IChzdHMgPCAwKSA/IHRydWUgOiBm
YWxzZTsKPj4gKwkJZXJyID0gc3RzIDwgMDsKPiAKPiBUaGlzIGZ1bmN0aW9uIHJldHVybnMgYSBu
ZWdhdGl2ZSBlcnJubywgcGxlYXNlIHByb3BhZ2F0ZSB0aGUgZXJyb3IKPiBpbnN0ZWFkIHVwb24g
ZXJyb3IuCgpZZXMsIHRoZSBuZWdhdGl2ZSBlcnJubyBzaG91bGQgYmUgcHJvcGFnYXRlZCwgaW5z
dGVhZCBvZiB0cnVlIG9yIGZhbHNlLgoKPiAKPj4gIAl9IGVsc2Ugewo+PiAgCQl1bnNpZ25lZCBs
b25nIHRpbWVvID0gbXNlY3NfdG9famlmZmllcygKPj4gIAkJCQkJCU5BTkRfUE9MTF9TVEFUVVNf
VElNRU9VVF9NUyk7Cj4+ICAJCS8qIHdhaXQgZm9yIGNvbXBsZXRpb24gaW50ZXJydXB0ICovCj4+
ICAJCXN0cyA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmY3RybC0+ZG9uZSwgdGltZW8p
Owo+PiAtCQllcnIgPSAoc3RzIDw9IDApID8gdHJ1ZSA6IGZhbHNlOwo+PiArCQllcnIgPSBzdHMg
PD0gMDsKPiAKPiBUaGUgPCAwIGNhc2UgZG9lcyBub3QgZXhpc3Qgc28gaW5zdGVhZCB5b3UgY2Fu
IHJldHVybiAtRVRJTUVET1VUIGlmCj4gKCFzdHMpIGFuZCB6ZXJvIG90aGVyd2lzZS4KClJpZ2h0
ISBpdCBjYW4gbm90IDwgMC4gSScnIGZpeCBpdCBpbiB2Mi4KPiAKPj4gIAl9Cj4+ICAKPj4gIAly
ZXR1cm4gZXJyOwo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
