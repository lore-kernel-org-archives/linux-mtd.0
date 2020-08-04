Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8705C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 02:59:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB44F20738
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 02:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="teQ8D/8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB44F20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yjdeQBQEajEvaiGNIvCcpzYMgRvDdFgddWskFzbHFpg=; b=teQ8D/8PVxS7BOes4YVRtHhKB
	BArNYSdxwYWTsEp5iT/36JxWEWw8bEt3AiTfKBczFAk5oyAjAY6EdMX9nFUPPSzoN0XbZ4UHD6bT9
	GWsZ6VhQ6CvM41WUuWINXwXdOt1pmlNHD4lp74ZfbugSFe8A+q6b8BAbMulC3aMRGafjP9vJjl36Y
	orFJptObiam6IlOHRL3BtN3FkM7t5YDwi/+1nlZ0rZvhJqV33383i6mnoBCHRQNCneApjKc8cLpV0
	pqZ8tZv0tA1AnulNQUdFt6HsyRNXdbcT3emuIXWRWZ1MLxwV/qIrH8A946DwiXkSGMzhc+myql/Ln
	7f+ft2WwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2n9q-00020Q-LK; Tue, 04 Aug 2020 02:58:30 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2n9o-0001xa-8q
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 02:58:29 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 56039FC0FAA3C1FC15C3;
 Tue,  4 Aug 2020 10:58:11 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 4 Aug 2020 10:58:01 +0800
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
 <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
Date: Tue, 4 Aug 2020 10:58:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_225828_573704_3B21EF65 
X-CRM114-Status: GOOD (  18.49  )
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

5ZyoIDIwMjAvOC80IDY6MTEsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gT24gTW9uLCBB
dWcgMywgMjAyMCBhdCA0OjAxIEFNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgo+Pj4gSG1tLCBJIHNlZSB0aGUgcHJvYmxlbSBidXQgSSBmZWFyIHRoaXMgcGF0
Y2ggZG9lcyBub3QgY3VyZSB0aGUgcmFjZSBjb21wbGV0ZWx5Lgo+Pj4gSXQganVzdCBsb3dlcnMg
dGhlIGNoYW5jZSB0byBoaXQgaXQuCj4+PiBXaGF0IGlmIEtUSFJFQURfU0hPVUxEX1NUT1AgaXMg
c2V0IHJpZ2h0IGFmdGVyIHlvdSBjaGVja2VkIGZvciBpdD8KPj4gVGhlIHBhdGNoIGNhbiBoYW5k
bGUgdGhpcyBjYXNlLiB1YmlfdGhyZWFkIHdpbGwgZXhpdCBhdAo+PiBrdGhyZWFkX3Nob3VsZF9z
dG9wKCkgaW4gbmV4dCBpdGVyYXRpb24uCj4gSG93IGNhbiBpdCByZWFjaCB0aGUgbmV4dCBpdGVy
YXRpb24/Cj4gTWF5YmUgSSBkaWRuJ3QgZnVsbHkgZ2V0IHlvdXIgZXhwbGFuYXRpb24uCj4KPiBB
cyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBwcm9ibGVtIGNvcnJlY3RseSwgdGhlIGZvbGxvd2lu
ZyBoYXBwZW5zOgo+IDEuIHViaV90aHJlYWQgaXMgcnVubmluZyBhbmQgdGhlIHByb2dyYW0gY291
bnRlciBpcyBzb21ld2hlcmUgYmV0d2Vlbgo+ICJpZiAoa3RocmVhZF9zaG91bGRfc3RvcCgpKSIK
PiBhbmQgc2NoZWR1bGUoKQo+IDIuIFdoaWxlIGRldGFjaGluZyBrdGhyZWFkX3N0b3AoKSBpcyBj
YWxsZWQKPiAzLiBTaW5jZSB0aGUgcHJvZ3JhbSBjb3VudGVyIGluIHRoZSB0aHJlYWQgaXMgcmln
aHQgYmVmb3JlIHNjaGVkdWxlKCksCj4gaXQgZG9lcyBub3QgY2hlY2sgS1RIUkVBRF9TSE9VTERf
U1RPUAo+IGFuZCBibGluZGx5IGNhbGxzIGludG8gc2NoZWR1bGUoKQo+IDQuIFRoZSB0aHJlYWQg
Z29lcyB0byBzbGVlcCBhbmQgbm90aGluZyB3YWtlcyBpdCBhbnltb3JlIC0+IGVuZGxlc3Mgd2Fp
dC4KPgo+IElzIHRoaXMgY29ycmVjdCBzbyBmYXI/Ck9oLCB5b3UncmUgdGhpbmtpbmcgYWJvdXQg
aW5mbHVlbmNlIGJ5IHNjaGVkdWxlKCksIEkgZ2V0IGl0LiBCdXQgSSB0aGluayAKaXQgc3RpbGwg
d29ya3MuIEJlY2F1c2UgdGhlIHViaV90aHJlYWQgaXMgc3RpbGwgb24gcnVucXVldWUsIGl0IHdp
bGwgYmUgCnNjaGVkdWxlZCB0byBleGVjdXRlIGxhdGVyIGFueXdheS4KCm9wwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlIG9mIAp1YmlfdGhyZWFkwqDC
oMKgwqDCoMKgwqDCoMKgwqAgb24gcnVucXVldWUKc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19JTlRF
UlJVUFRJQkxFKSBUQVNLX0lOVEVSUlVQVElCTEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBZ
ZXMKaWYgKGt0aHJlYWRfc2hvdWxkX3N0b3AoKSkgLy8gbm90IHNhdGlzZnkgClRBU0tfSU5URVJS
VVBUSUJMRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFllcwprdGhyZWFkX3N0b3A6CiDCoCB3
YWtlX3VwX3Byb2Nlc3MKIMKgwqDCoCB0dHd1X3F1ZXVlCiDCoMKgwqDCoMKgIHR0d3VfZG9fYWN0
aXZhdGUKIMKgwqDCoMKgwqDCoMKgIHR0d3VfZG9fd2FrZXVwIFRBU0tfUlVOTklOR8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFllcwpzY2hlZHVsZQogwqAgX19z
Y2hlZHVsZShmYWxzZSkKCiDCoC8vIHByZXYtPnN0YXRlIGlzIFRBU0tfUlVOTklORywgc28gd2Ug
Y2Fubm90IG1vdmUgaXQgZnJvbSBydW5xdWV1ZSBieSAKZGVhY3RpdmF0ZV90YXNrKCkuIFNvIGp1
c3QgcGljayBuZXh0IHRhc2sgdG8gZXhlY3V0ZSwgdWJpX3RocmVhZCBpcyAKc3RpbGwgb24gcnVu
cXVldWUgYW5kIHdpbGwgYmUgc2NoZWR1bGVkIHRvIGV4ZWN1dGUgbGF0ZXIuCgoKVGhlIHRlc3Qg
cGF0Y2ggYWRkZWQgbWRlbGF5KDUwMDApIGJlZm9yZSBzY2hlZHVsZSgpLCB3aGljaCBjYW4gbWFr
ZSBzdXJlIAprdGhyZWFkX3N0b3AoKS0+d2FrZV91cF9wcm9jZXNzKCkgZXhlY3V0ZWQgYmVmb3Jl
IHNjaGVkdWxlKCkuIFByZXZpb3VzIAphbmFseXNpcyBjYW4gYmUgcHJvdmVkIHRocm91Z2ggdGVz
dC4KCkBAIC0xNjM4LDYgKzE2NDEsMTUgQEAgaW50IHViaV90aHJlYWQodm9pZCAqdSkKIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICF1YmktPnRocmVhZF9lbmFibGVkIHx8
IAp1YmlfZGJnX2lzX2JndF9kaXNhYmxlZCh1YmkpKSB7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9jdXJyZW50X3N0YXRlKFRBU0tfSU5URVJSVVBU
SUJMRSk7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNw
aW5fdW5sb2NrKCZ1YmktPndsX2xvY2spOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGt0aHJlYWRfc2hvdWxkX3N0b3AoKSkgeworwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9jdXJy
ZW50X3N0YXRlKFRBU0tfUlVOTklORyk7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7CivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9CisKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHByX2VycigiQ2hlY2sgc2hvdWxkIHN0b3AgQlxuIik7CivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZGVsYXkoNTAwMCk7CivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9lcnIoImRlbGF5
IDUwMDBtcyBcbiIpOworCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNjaGVkdWxlKCk7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnRpbnVlOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KCj4K
PiBZb3VyIHNvbHV0aW9uIGlzIHB1dHRpbmcgYW5vdGhlciBjaGVjayBmb3IgS1RIUkVBRF9TSE9V
TERfU1RPUCBiZWZvcmUKPiBzY2hlZHVsZSgpLgo+IEkgYXJndWUgdGhhdCB0aGlzIHdpbGwganVz
dCByZWR1Y2UgdGhlIGNoYW5jZSB0byBoaXQgdGhlIHJhY2Ugd2luZG93Cj4gYmVjYXVzZSBpdCBj
YW4gc3RpbGwgaGFwcGVuCj4gdGhhdCBrdGhyZWFkX3N0b3AoKSBpcyBiZWluZyBjYWxsZWQgcmln
aHQgYWZ0ZXIgdGhlIHNlY29uZCBjaGVjayBhbmQKPiBhZ2FpbiBiZWZvcmUgc2NoZWR1bGUoKS4K
PiBUaGVuIHdlIGVuZCB1cCB3aXRoIHRoZSBzYW1lIHNpdHVhdGlvbi4KPgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
