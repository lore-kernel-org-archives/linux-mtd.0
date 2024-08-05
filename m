Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C95C52D70
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2024 01:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcrvdGDgUNxrkb6/l9jgvCpe2ERa/vfgVgCeer2ZBqg=; b=j+B3N6+xrvAE5scNA9swWN5muV
	k0jBUZySvnfjM6oy05RSDgE0SM9WQ1lnHkVqtaeGGYjH8Ejg1RY3u4qGInMJRjDcQ4wJUmjTJQ4RU
	aYNQ0fE5zARsU5rruKJcCg/4U3AaKK9M973q5liSvVzY1+sbC+2s1DKG4r4bGagPc67MZTR3Rxu6c
	Y5lC4yzl9WM/2zmNDE7g7I/GhIxE0vqGJ+3d1V2aTdkHz+4FkdeiGpZB9S/0gNz3meIozXGn1J512
	oEK6TYvIN2SUPwJH/UeJUVdwbAHKO9YpCcDmDbC3gEpcJ62KaxbPS/Cvq1eBRvhnnfTbmbzM93n1K
	/qSzRRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1samXL-0000000EIGF-3grZ;
	Mon, 05 Aug 2024 01:29:23 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1samXH-0000000EIFo-45rr
	for linux-mtd@lists.infradead.org;
	Mon, 05 Aug 2024 01:29:21 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wcf3m0QkZz4f3jMM
	for <linux-mtd@lists.infradead.org>; Mon,  5 Aug 2024 09:29:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id EC7961A0359
	for <linux-mtd@lists.infradead.org>; Mon,  5 Aug 2024 09:29:16 +0800 (CST)
Received: from [10.174.178.46] (unknown [10.174.178.46])
	by APP4 (Coremail) with SMTP id gCh0CgAXPoTqKrBmwDwxAw--.57715S3;
	Mon, 05 Aug 2024 09:29:16 +0800 (CST)
Subject: Re: [BUG REPORT] potential deadlock in inode evicting under the inode
 lru traversing context on ext4 and ubifs
From: Zhihao Cheng <chengzhihao@huaweicloud.com>
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Ted Tso <tytso@mit.edu>, Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, "zhangyi (F)" <yi.zhang@huawei.com>,
 yangerkun <yangerkun@huawei.com>, "wangzhaolong (A)"
 <wangzhaolong1@huawei.com>, mjguzik@gmail.com,
 "rydercoding@hotmail.com >> Ryder Wang" <rydercoding@hotmail.com>
References: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
Message-ID: <e67d289d-fd5e-cb38-4e2f-a2bbb8419a97@huaweicloud.com>
Date: Mon, 5 Aug 2024 09:29:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
X-CM-TRANSID: gCh0CgAXPoTqKrBmwDwxAw--.57715S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GFW3Ar18KF15KF4rWw45ZFb_yoWDXrcE93
	WruFZrJw4Yqr4Iqa1DCF4rJrs7Cr1UCry5Xrs5X3sIyw1fAFs7Xa97Jry5Zw1Iyw1Iqwn0
	yr95Jwn3twnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
	07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07UAwIDUUUUU=
X-CM-SenderInfo: xfkh0wx2klxt3r6k3tpzhluzxrxghudrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_182920_225855_94DF95CB 
X-CRM114-Status: UNSURE (   9.73  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIGJhc2VkIG9uIHRoZSBpZGVhcyBmcm9tIEphbiBhbmQgTWF0ZXVzeiwgSSBzZW50IGEgZml4
IHBhdGNoLCBzZWUgCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWZzZGV2ZWwvMjAyNDA4
MDUwMTM0NDYuODE0MzU3LTEtY2hlbmd6aGloYW9AaHVhd2VpY2xvdWQuY29tL1QvI3UKCtTaIDIw
MjQvNy8xMiAxNDoyNywgWmhpaGFvIENoZW5nINC0tcA6Cj4gSGkuIFJlY2VudGx5LCB3ZSBmb3Vu
ZCBhIGRlYWRsb2NrIGluIGlub2RlIHJlY2xpYWltaW5nIHByb2Nlc3MgY2F1c2VkIGJ5IAo+IGNp
cmN1bGFyIGRlcGVuZGVuY2UgYmV0d2VlbiBmaWxlIGlub2RlIGFuZCBmaWxlJ3MgeGF0dHIgaW5v
ZGUuCj4gCj4gUHJvYmxlbSBkZXNjcmlwdGlvbgo+ID09PT09PT09PT09PT09PT09PT0KPiAKPiBU
aGUgaW5vZGUgcmVjbGFpbWluZyBwcm9jZXNzKFNlZSBmdW5jdGlvbiBwcnVuZV9pY2FjaGVfc2Ip
IGNvbGxlY3RzIGFsbCAKPiByZWNsYWltYWJsZSBpbm9kZXMgYW5kIG1hcmsgdGhlbSB3aXRoIElf
RlJFRUlORyBmbGFnIGF0IGZpcnN0LCBhdCB0aGF0IAo+IHRpbWUsIG90aGVyIHByb2Nlc3NlcyB3
aWxsIGJlIHN0dWNrIGlmIHRoZXkgdHJ5IGdldHRpbmcgdGhlc2UgaW5vZGVzKFNlZSAKPiBmdW5j
dGlvbiBmaW5kX2lub2RlX2Zhc3QpLCB0aGVuIHRoZSByZWNsYWltaW5nIHByb2Nlc3MgZGVzdHJv
eSB0aGUgCj4gaW5vZGVzIGJ5IGZ1bmN0aW9uIGRpc3Bvc2VfbGlzdCgpLgo+IFNvbWUgZmlsZXN5
c3RlbXMoZWcuIGV4dDQgd2l0aCBlYV9pbm9kZSBmZWF0dXJlLCB1YmlmcyB3aXRoIHhhdHRyKSBt
YXkgCj4gZG8gaW5vZGUgbG9va3VwIGluIHRoZSBpbm9kZSBldmljdGluZyBjYWxsYmFjayBmdW5j
dGlvbiwgaWYgdGhlIGlub2RlIAo+IGxvb2t1cCBpcyBvcGVyYXRlZCB1bmRlciB0aGUgaW5vZGUg
bHJ1IHRyYXZlcnNpbmcgY29udGV4dCwgZGVhZGxvY2sgCj4gcHJvYmxlbXMgbWF5IGhhcHBlbi4K
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
