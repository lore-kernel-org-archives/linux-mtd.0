Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C582C7619A
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Apr 2023 01:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jkZ7uqyVAE8jDvT62aoWekzulJ91vVGo6zAyO5I5NA=; b=eE1bk4qkZJPD5h
	nhQdMtm0GPx8SKtUKvqBN7nRpCIcPXjkrGT7UUbCL14rYn2UoGdH8zg/CxKhuDgGgl0RdeDxiVTbY
	UAjUEa/N+LVCTJ5vRb5wJgcxvMUW9Fs9lVdbWKFktbOKBTQ3J9O/FDUdjDlMOD/5NCQR7djqrWv1d
	Vp4IHLm1cS9579WU++zcNs6wiKQFhbBgBa68l5502ylS31v0SJr786/s/2CgCJoknGg6+MiZkARAT
	wOgPvDgKsercNWYYMMdlyEqTm1+u5zILqMjyAhd6DYGjGidrndJW0btTmQm1DG6DR+0R+ikSDVkuu
	0Ote+YlwxJeb0OPmfbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkEJC-0062I8-1N;
	Thu, 06 Apr 2023 01:21:02 +0000
Received: from frasgout12.his.huawei.com ([14.137.139.154])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkEJ8-0062HG-37
	for linux-mtd@lists.infradead.org;
	Thu, 06 Apr 2023 01:21:01 +0000
Received: from mail02.huawei.com (unknown [172.18.147.228])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4PsNjD0F6rz9v7JM
	for <linux-mtd@lists.infradead.org>; Thu,  6 Apr 2023 09:10:40 +0800 (CST)
Received: from [10.174.177.238] (unknown [10.174.177.238])
	by APP1 (Coremail) with SMTP id 76C_BwAXrF9hHi5k+sdPBQ--.3463S2;
	Thu, 06 Apr 2023 01:20:38 +0000 (GMT)
Message-ID: <ff46732f-b16e-f376-62f6-cf184cc6d366@huaweicloud.com>
Date: Thu, 6 Apr 2023 09:20:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Two bug fix commit fixes in the ubi_resize_volume() were fixed by
 a patch in the mailing list
Content-Language: en-US
To: Richard Weinberger <richard@nod.at>,
 chengzhihao1 <chengzhihao1@huawei.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <20230403020402.2261218-1-wangzhaolong1@huawei.com>
 <f55c0db7-ef93-86ae-c4f9-476515358787@huawei.com>
 <2092125501.19940.1680727689243.JavaMail.zimbra@nod.at>
From: Guo Xuenan <guoxuenan@huaweicloud.com>
In-Reply-To: <2092125501.19940.1680727689243.JavaMail.zimbra@nod.at>
X-CM-TRANSID: 76C_BwAXrF9hHi5k+sdPBQ--.3463S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW7ArWDJFWrury8uw4kZwb_yoW8ZF1xpa
	s3GF17trW7Jw1j9a17GF4jq3W09ry7ta15Xrs7K39Yv345ZFyIqF4rK34UuFyUCrn5WanF
	qF47X34ru340va7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=
X-CM-SenderInfo: xjxr53hhqd0q5kxd4v5lfo033gof0z/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_182059_302070_03A77319 
X-CRM114-Status: GOOD (  12.62  )
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

SGkgUmljaGFyZO+8jAoKT24gMjAyMy80LzYgNDo0OCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3Rl
Ogo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9uOiAiY2hlbmd6aGloYW8x
IiA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4+PiAgICAgICBJJ2QgbGlrZSB0byBrbm93IHdo
eSBwYXRjaFsxXSBkaWRuJ3QgZ2V0IGludG8gdGhlIG1haW5saW5lLgo+Pj4KPj4+IFsxXSBodHRw
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAyMjAxMjQw
MjQwNTYuMTk5Njc2My0xLWd1b3h1ZW5hbkBodWF3ZWkuY29tLwo+IFNvcnJ5LCBpdCBmZWxsIHRo
cm91Z2ggdGhlIGNyYWNrcy4KPgo+PiBJIGZpbmQgdGhlcmUgd2VyZSB0aHJlZSBwcm9ibGVtcyBp
biB1YmlfcmVzaXplX3ZvbHVtZSgpOgo+Pgo+PiAxLiBNZW1sZWFrICAtIGZpeGVkIGJ5IDFlNTkx
ZWEwNzJkZiAoInViaTogRml4IHVucmVmZXJlbmNlZCBvYmplY3QKPj4gcmVwb3J0ZWQgYnkga21l
bWxlYWsgaW4gdWJpX3Jlc2l6ZV92b2x1bWUoKSIpCj4gQWdyZWVkLgo+Cj4+IDIuIFVBRiBpbiBl
cnJvciBoYW5kbGluZyBwYXRoICAtIGZpeGVkIGJ5IDlhZjMxZDZlYzFhNCAoInViaTogRml4Cj4+
IHVzZS1hZnRlci1mcmVlIHdoZW4gdm9sdW1lIHJlc2l6aW5nIGZhaWxlZCIpCj4gQWdyZWVkLgo+
Cj4+IDMuIFVBRiBpbiBjb25jdXJyZW50IHNocmluZyB2b2x1bWUgYW5kIHdyaXRpbmcKPj4gZmFz
dG1hcCh2b2wtPnJlc2VydmVkX3BlYnMgaXRlcmF0aW9uKSAgLSBmaXhlZCBieSBbMV0KPj4gNC4g
UG90ZW50aW9uYWwgZGF0YSBsb3N0IGluIGZhaWxlZCBzaHJpbmtpbmcoZmFpbGVkIGFmdGVyIHVu
bWFwcGluZwo+PiBsZWJzKSAgLSBtZW50aW9uZWQgaW4gWzFdLCB3aGljaCBpcyBub3QgYSBiaWcg
cHJvYmxlbSwgd2UgY2FuIGFkZCBzb21lCj4+IGNvbW1lbnRzIHRvIGV4cGxhaW4gaXQuCj4+IDUu
IFRvbyBtYW55IGxlYnMgdXNlZCBpZiBleHBhbmRpbmcgdm9sdW1lIGZhaWxlZCBhZnRlciBbMV0g
YXBwbGllZDoKPj4gSWYgd2UgdXBkYXRlIHZvbC0+cmVzZXJ2ZWRfcGVicyB0b2dldGhlciB3aXRo
IHZvbC0+ZWJhX3RibCwgdGhlbiBvdGhlcgo+PiB3cml0aW5nIHByb2Nlc3MgY291bGQgdGFrZSBs
bnVtIGJpZ2dlciB0aGFuIG9sZCB2b2wtPnJlc2VydmVkX3BlYnMuCj4+IFRoZXJlIHdpbGwgYmUg
em9tYmllIGxvZ2ljYWwgcGVicyhsbnVtIGdyZWF0ZXIgdGhhbiB2b2wtPnJlc2VydmVkX3BlYnMs
Cj4+IGNvdWxkIG5vdCBiZSBhY2Nlc3NlZCBvciByZWNsYWltZWQpIGlmIHJlc2l6aW5nIGZhaWxl
ZC4KPj4gTWF5YmUgd2Ugc2hvdWxkIGZpeCB0aGF0IGJ5IGhvbGRpbmcgJ2xlYl93cml0ZV9sb2Nr
JyB3aGlsZSBleHBhbmRpbmcgdm9sdW1lPwo+PiA2LiBJbiBlcnJvciBoYW5kbGluZyBwYXRoICdv
dXRfYWNjJywgVUJJIHNob3VsZCByZWNvdmVyICd1YmktPnJzdmRfcGVicycKPj4gYW5kICd1Ymkt
PmF2YWlsX3BlYnMnIGluICdwZWJzID4gMCcgY2FzZSwgb3RoZXJ3aXNlIFVCSSB3aWxsIGRpc3Bs
YXkKPj4gd3JvbmcgYXZhaWxhYmxlIHBlYiBjb3VudC4KPj4KPj4gUmljaGFyZCwgSG93IGRvIHlv
dSB0aGluaz8KPiBJIGFncmVlLCB3ZSBzaG91bGQgYXBwbHkgdGhpcyBwYXRjaC4gR3VvIFh1ZW5h
biwgY2FuIHlvdSBwbGVhc2UgcmViYXNlIHlvdXIgcGF0Y2gKPiBvbiB0aGUgbGF0ZXN0IGtlcm5l
bCBhbmQgcmVzZW5kPwo+IHZtdC5jIHNhdyBzb21lIGNoYW5nZXMgYW5kIHRoZSBwYXRjaCBkb2Vz
IG5vdCBsb25nZXIgYXBwbHkuCk9L77yMSSB3aWxsIGFzayBteSBjb2xsZWFndWVzIFpoYW9sb25n
IFdhbmcgdG8gaGVscCBtZSByZWJhc2UgYW5kIHJlc2VuZCAKaXQgYXMgc29vbiBhcwpwb3NzaWJs
Ze+8jGhlIGlzIGN1cnJlbnRseSBtb3JlIGZvY3VzZWQgb24gdWJpZnMgOikKClRoYW5rcwpYdWVu
YW4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
