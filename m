Return-Path: <SRS0=xIOg=BP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FF6C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2020 02:24:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C5B20792
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2020 02:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HarWEYLF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3C5B20792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TI6bqenm5DxjLPOkOZKeu4HCJHcnwoicvoLCUfwudxs=; b=HarWEYLFi7sA/C9T5zcPYknvu
	ImObk5iVaEU/GVVM7RZiskAoPzFq/WwrBeCVqKDbGxv+9/PXWpX9JL+lvofi/K5qb9NUvhPYS0MWl
	oqcpojv7ScqUoDuzx8LafcP7/3Yar/T2bHJsIhNwfMnKvsIcsnHr9+1HgiGN4b4/Od4+z+LO1K6BV
	tFTN5KPF4o1tGmAQvutu6cascVbsXTJ1OdRw2okJGZX4K4dDfJ/obwM0MR5uqqt8zChl5vA6YZC04
	l3axkKN86C3UzPs48p1cL+EXJ5OZLoVnXI1TWV+8GChM5lcFlIVfLjnJWgXibv4svSiG1RRtYEo9F
	jO/OkDsrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k395e-0001tH-0g; Wed, 05 Aug 2020 02:23:38 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k395a-0001sc-VW
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2020 02:23:36 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 20BF45C884C4A241AFA3;
 Wed,  5 Aug 2020 10:23:24 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 5 Aug 2020 10:23:18 +0800
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
 <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
 <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
 <CAFLxGvycs7DNu5o5QY1WwTPfS6cTTykTh-91n9TQZ7yP_ADr4A@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2086f822-e67a-43e4-76d8-5339eaccd3ac@huawei.com>
Date: Wed, 5 Aug 2020 10:23:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvycs7DNu5o5QY1WwTPfS6cTTykTh-91n9TQZ7yP_ADr4A@mail.gmail.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_222335_280714_B5FF2531 
X-CRM114-Status: GOOD (  18.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvOC81IDU6NTYsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gT24gVHVlLCBB
dWcgNCwgMjAyMCBhdCA0OjU4IEFNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgo+PiBPaCwgeW91J3JlIHRoaW5raW5nIGFib3V0IGluZmx1ZW5jZSBieSBzY2hl
ZHVsZSgpLCBJIGdldCBpdC4gQnV0IEkgdGhpbmsKPj4gaXQgc3RpbGwgd29ya3MuIEJlY2F1c2Ug
dGhlIHViaV90aHJlYWQgaXMgc3RpbGwgb24gcnVucXVldWUsIGl0IHdpbGwgYmUKPj4gc2NoZWR1
bGVkIHRvIGV4ZWN1dGUgbGF0ZXIgYW55d2F5Lgo+IEl0IHdpbGwgbm90IGdldCB3b2tlbi4gVGhp
cyBpcyB0aGUgcHJvYmxlbS4KPgo+PiBvcCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdGF0ZSBvZgo+PiB1YmlfdGhyZWFkICAgICAgICAgICBvbiBy
dW5xdWV1ZQo+PiBzZXRfY3VycmVudF9zdGF0ZShUQVNLX0lOVEVSUlVQVElCTEUpIFRBU0tfSU5U
RVJSVVBUSUJMRSAgICAgICAgICAgICAgWWVzCj4+IGlmIChrdGhyZWFkX3Nob3VsZF9zdG9wKCkp
IC8vIG5vdCBzYXRpc2Z5Cj4+IFRBU0tfSU5URVJSVVBUSUJMRSAgICAgICAgICAgICAgWWVzCj4+
IGt0aHJlYWRfc3RvcDoKPj4gICAgIHdha2VfdXBfcHJvY2Vzcwo+PiAgICAgICB0dHd1X3F1ZXVl
Cj4+ICAgICAgICAgdHR3dV9kb19hY3RpdmF0ZQo+PiAgICAgICAgICAgdHR3dV9kb193YWtldXAg
VEFTS19SVU5OSU5HICAgICAgICAgICAgICAgICAgICAgICBZZXMKPj4gc2NoZWR1bGUKPj4gICAg
IF9fc2NoZWR1bGUoZmFsc2UpCj4+Cj4+ICAgIC8vIHByZXYtPnN0YXRlIGlzIFRBU0tfUlVOTklO
Rywgc28gd2UgY2Fubm90IG1vdmUgaXQgZnJvbSBydW5xdWV1ZSBieQo+PiBkZWFjdGl2YXRlX3Rh
c2soKS4gU28ganVzdCBwaWNrIG5leHQgdGFzayB0byBleGVjdXRlLCB1YmlfdGhyZWFkIGlzCj4+
IHN0aWxsIG9uIHJ1bnF1ZXVlIGFuZCB3aWxsIGJlIHNjaGVkdWxlZCB0byBleGVjdXRlIGxhdGVy
Lgo+IEl0IHdpbGwgYmUgaW4gc3RhdGUgVEFTS19SVU5OSU5HIG9ubHkgaWYgeW91ciBjaGVjayBp
cyByZWFjaGVkLgo+Cj4gSWYga3RocmVhZF9zdG9wKCkgaXMgY2FsbGVkICpiZWZvcmUqIHlvdXIg
Y29kZToKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoa3RocmVhZF9zaG91bGRfc3RvcCgp
KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfY3VycmVudF9zdGF0ZShU
QVNLX1JVTk5JTkcpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgfQo+Cj4gLi4uZXZlcnl0aGluZyBpcyBmaW5lLgo+IEJ1
dCB0aGVyZSBpcyBzdGlsbCBhIHJhY2Ugd2luZG93IGJldHdlZW4geW91ciBpZgo+IChrdGhyZWFk
X3Nob3VsZF9zdG9wKCkpIGFuZCBzY2hlZHVsZSgpIGluIHRoZSBuZXh0IGxpbmUuCj4gU28gaWYg
a3RocmVhZF9zdG9wKCkgaXMgY2FsbGVkIHJpZ2h0ICphZnRlciogdGhlIGlmIGFuZCAqYmVmb3Jl
Kgo+IHNjaGVkdWxlKCksIHRoZSB0YXNrIHN0YXRlIGlzIHN0aWxsIFRBU0tfSU5URVJSVVBUSUJM
RQo+IC0tPiBzY2hlZHVsZSgpIHdpbGwgbm90IHJldHVybiB1bmxlc3MgdGhlIHRhc2sgaXMgZXhw
bGljaXRseSB3b2tlbiwKPiB3aGljaCBkb2VzIG5vdCBoYXBwZW4uCkVyLCBJIGNhbid0IGdldCB0
aGUgcG9pbnQuIEkgY2FuIGxpc3QgdHdvIHBvc3NpYmxlIHNpdHVhdGlvbnMsIGRpZCBJIAptaXNz
IG90aGVyIHNpdHVhdGlvbnM/CgpQMTp1YmlfdGhyZWFkCiDCoCBzZXRfY3VycmVudF9zdGF0ZShU
QVNLX0lOVEVSUlVQVElCTEUpCiDCoCBpZiAoa3RocmVhZF9zaG91bGRfc3RvcCgpKSB7CiDCoMKg
wqAgc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19SVU5OSU5HKQogwqDCoMKgIGJyZWFrCiDCoCB9CiDC
oCBzY2hlZHVsZSgpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC0+IGRvbid0ICpyZW1vdmUqIHRhc2sgZnJvbSAKcnVucXVldWUgaWYgKlRBU0tf
UlVOTklORyosIHJlbW92aW5nIG9wZXJhdGlvbiBpcyBwcm90ZWN0ZWQgYnkgcnFfbG9jawoKUDI6
a3RocmVhZF9zdG9wCiDCoCBzZXRfYml0KEtUSFJFQURfU0hPVUxEX1NUT1AsICZrdGhyZWFkLT5m
bGFncykKIMKgIHdha2VfdXBfcHJvY2VzcyhrKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtPiBl
bnF1ZXVlIHRhc2sgJiBzZXQgKlRBU0tfUlVOTklORyosIAp0aGVzZSB0d28gb3BlcmF0aW9ucyBh
cmUgcHJvdGVjdGVkIGJ5IHJxX2xvY2sKIMKgIHdhaXRfZm9yX2NvbXBsZXRpb24oJmt0aHJlYWQt
PmV4aXRlZCkKCgpTaXR1YXRpb24gMToKUDFfc2V0X2N1cnJlbnRfc3RhdGXCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIG9uLXJxLCBUQVNLX1JVTk5JTkcgLT4gVEFTS19JTlRFUlJVUFRJQkxF
ClAxX2t0aHJlYWRfc2hvdWxkX3N0b3DCoMKgwqDCoMKgwqDCoCBvbi1ycSwgVEFTS19JTlRFUlJV
UFRJQkxFClAyX3NldF9iaXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgb24tcnEsIFRBU0tfSU5URVJSVVBUSUJMRSAsIApLVEhSRUFE
X1NIT1VMRF9TVE9QClAyX3dha2VfdXBfcHJvY2Vzc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBv
bi1ycSwgVEFTS19JTlRFUlJVUFRJQkxFIC0+IFRBU0tfUlVOTklORyAKLCBLVEhSRUFEX1NIT1VM
RF9TVE9QClAxX3NjaGVkdWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBvbi1ycSwgVEFTS19SVU5OSU5HICwgCktUSFJFQURfU0hPVUxEX1NUT1AK
UDJfd2FpdF9mb3JfY29tcGxldGlvbsKgwqDCoMKgwqDCoMKgIC8vIHdhaXQgZm9yIFAxIGV4aXQK
ClNpdHVhdGlvbiAyOgpQMV9zZXRfY3VycmVudF9zdGF0ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBvbi1ycSwgVEFTS19SVU5OSU5HIC0+IFRBU0tfSU5URVJSVVBUSUJMRQpQMV9rdGhyZWFkX3No
b3VsZF9zdG9wwqDCoMKgwqDCoMKgIG9uLXJxLCBUQVNLX0lOVEVSUlVQVElCTEUKUDJfc2V0X2Jp
dMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG9uLXJxLCBUQVNLX0lOVEVSUlVQVElCTEUgLCAKS1RIUkVBRF9TSE9VTERfU1RPUApQMV9zY2hl
ZHVsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9m
Zi1ycSwgVEFTS19JTlRFUlJVUFRJQkxFICwgCktUSFJFQURfU0hPVUxEX1NUT1AKUDJfd2FrZV91
cF9wcm9jZXNzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9uLXJxLCBUQVNLX0lOVEVSUlVQVElC
TEUgLT4gVEFTS19SVU5OSU5HIAosIEtUSFJFQURfU0hPVUxEX1NUT1AKUDJfd2FpdF9mb3JfY29t
cGxldGlvbiDCoCDCoCDCoCAvLyB3YWl0IGZvciBQMSBleGl0Cj4gQmVmb3JlIHlvdXIgcGF0Y2gs
IHRoZSByYWNlIHdpbmRvdyB3YXMgbXVjaCBsYXJnZXIsIEkgZnVsbHkgYWdyZWUsIGJ1dAo+IHlv
dXIgcGF0Y2ggZG9lcyBub3QgY3VyZSB0aGUgcHJvYmxlbQo+IGl0IGp1c3QgbWFrZXMgaXQgaGFy
ZGVyIHRvIGhpdC4KPgo+IEFuZCB1c2luZyBtZGVsYXkoKSB0byB2ZXJpZnkgc3VjaCBhIHRoaW5n
IGlzIGFsc28gdHJpY2t5IGJlY2F1c2UKPiBtZGVsYXkoKSB3aWxsIGluZmx1ZW5jZSB0aGUgdGFz
ayBzdGF0ZS4KPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
