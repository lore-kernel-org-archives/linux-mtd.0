Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E408C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:55:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06F6206BE
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 11:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bnDJiXU2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06F6206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4tmsYgI+un268QAvQVDBVII4B3xEYzC9fnBliXE8bSA=; b=bnDJiXU2xYSIFhj34fSP82gsx
	vvkEh853X3UvDveAJys/VrKU0eED7Zp2MTakQg7wf71IhyZjYvrdwoipwPCEW3CxEOvgQbGjvxiv/
	428bfns3vc4bdZhmK7SSqqf+US5Yb45hT5rYKOjaHNKaodZZK8eV1JF9LU4p3bwtbuFRWY64wy+n/
	dUDbVHUmHk9PoX+3TbSxJxKqmzktpCUslLjS2uVrPvMs/WWLOQtCetlalqE0AOHsjFFu3AZYfmUaV
	2CvSosGMCAh2WHRKfnVV1dlhBi9BcOPg8PG6Hojtr5YHfds/ubLnhpY9c7g4aueNunJESsdcPPCzc
	GjusHDgPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsmBv-0002sN-MT; Tue, 07 Jul 2020 11:55:15 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsmBr-0002oU-Gd
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 11:55:13 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2DBA98E528D7DC0EAFEE;
 Tue,  7 Jul 2020 19:55:05 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 7 Jul 2020 19:54:57 +0800
Subject: Re: [PATCH] ubifs: Fix a potential space leak problem while linking
 tmpfile
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200701112643.726986-1-chengzhihao1@huawei.com>
 <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <082f18e0-d6f0-6389-43af-3159edb244cb@huawei.com>
Date: Tue, 7 Jul 2020 19:54:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyO_aXGfgoO0mrNsoGP4Bfh3n6CUQxDx=ecH6o2ZDNYDg@mail.gmail.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_075511_869267_92F814D2 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

5ZyoIDIwMjAvNy83IDE5OjI2LCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+IE9uIFdlZCwg
SnVsIDEsIDIwMjAgYXQgMToyOCBQTSBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWku
Y29tPiB3cm90ZToKPj4gVGhlcmUgaXMgYSBwb3RlbnRpYWwgc3BhY2UgbGVhayBwcm9ibGVtIHdo
aWxlIGxpbmtpbmcgdG1wZmlsZSwgaW4gd2hpY2gKPj4gY2FzZSwgaW5vZGUgbm9kZSAod2l0aCBu
bGluaz0wKSBpcyB2YWxpZCBpbiB0bmMgKG9uIGZsYXNoKSwgd2hpY2ggbGVhZHMKPj4gdG8gc3Bh
Y2UgbGVhay4gTWVhbndoaWxlLCB0aGUgY29ycmVzcG9uZGluZyBkYXRhIG5vZGVzIHdvbid0IGJl
IHJlbGVhc2VkCj4+IGZyb20gdG5jLiBGb3IgZXhhbXBsZSwgKEEgcmVwcm9kdWNlciBjYW4gYmUg
Zm91bmQgaW4gTGluayk6Cj4+Cj4+ICQgbW91bnQgVUJJRlMKPj4gICAgW3Byb2Nlc3MgQV0gICAg
ICAgICAgICBbcHJvY2VzcyBCXSAgICAgICAgIFtUTkNdICAgICAgICAgW29ycGhhbiBhcmVhXQo+
Pgo+PiAgIHViaWZzX3RtcGZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIGlub2RlX0EgKG5s
aW5rPTApICAgICBpbm9kZV9BCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvX2NvbW1p
dCAgICAgaW5vZGVfQSAobmxpbms9MCkgICAgIGlub2RlX0EKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICDihpEKPj4gICAgICAgIChjb21tZW50OiBJdCBtYWtlcyBzdXJlIG5vdCBy
ZXBsYXkgaW5vZGVfQSBpbiBuZXh0IG1vdW50KQo+PiAgIHViaWZzX2xpbmsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlub2RlX0EgKG5saW5rPTApICAgICBpbm9kZV9BCj4+ICAgICB1Ymlm
c19kZWxldGVfb3JwaGFuICAgICAgICAgICAgICAgICAgaW5vZGVfQSAobmxpbms9MCkKPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZG9fY29tbWl0ICAgICBpbm9kZV9BIChubGluaz0wKQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0tPiBQT1dFUkNVVCA8LS0tCj4+ICAgICAo
dWJpZnNfam5sX3VwZGF0ZSkKPj4KPj4gJCBtb3VudCBVQklGUwo+PiAgICBpbm9kZV9BIHdpbGwg
bmVpdGhlciBiZSByZXBsYXllZCBpbiB1Ymlmc19yZXBsYXlfam91cm5hbCgpIG5vcgo+PiAgICB1
Ymlmc19tb3VudF9vcnBoYW5zKCkuIGlub2RlX0EgKG5saW5rPTApIHdpdGggaXRzIGRhdGEgbm9k
ZXMgd2lsbAo+PiAgICBhbHdheXMgb24gdG5jLCBpdCBvY2N1cHkgc3BhY2UgYnV0IGlzIG5vbi12
aXNhYmxlIGZvciB1c2Vycy4KPj4KPj4gQ29tbWl0IGVlMTQzOGNlNWRjNGQgKCJ1YmlmczogQ2hl
Y2sgbGluayBjb3VudCBvZiBpbm9kZXMgd2hlbiBraWxsaW5nCj4+IG9ycGhhbnMuIikgaGFuZGxl
cyBwcm9ibGVtIGluIG1pc3Rha2VubHkgZGVsZXRpbmcgcmVsaW5rZWQgdG1wZmlsZQo+PiB3aGls
ZSByZXBsYXlpbmcgb3JwaGFuIGFyZWEuIFNpbmNlIHRoYXQsIHRtcGZpbGUgaW5vZGUgc2hvdWxk
IGFsd2F5cwo+PiBsaXZlIGluIG9ycGhhbiBhcmVhIGV2ZW4gaXQgaXMgbGlua2VkLiBGaXggaXQg
YnkgcmV2ZXJ0aW5nIGNvbW1pdAo+PiAzMmZlOTA1YzE3ZjAwMSAoInViaWZzOiBGaXggT19UTVBG
SUxFIGNvcm5lciBjYXNlIGluIHViaWZzX2xpbmsoKSIpLgo+IFdlbGwsIGJ5IHJldmVydGluZyB0
aGlzIGNvbW1pdCB5b3UgcmUtaW50cm9kdWNlIHRoZSBpc3N1ZSBpdCBmaXhlcy4gOy1cCj4KUGVy
aGFwcyBJIG1pc3VuZGVyc3Rvb2Qgd2hhdCBjb21taXQgMzJmZTkwNWMxN2YwMDEgKCJ1Ymlmczog
Rml4IApPX1RNUEZJTEUgY29ybmVyIGNhc2UgaW4gdWJpZnNfbGluaygpIikgd2FudGVkIHRvIGZp
eC4KSSB0aGluayBvcnBoYW4gYXJlYSBpcyB1c2VkIHRvIHJlbWluZCBmaWxlc3lzdGVtIGRvbid0
IGZvcmdldCB0byBkZWxldGUgCmlub2RlcyAod2hvc2UgbmxpbmsgaXMgMCkgaW4gbmV4dCB1bmNs
ZWFuIHJlYm9vdGluZy4gR2VuZXJhbGx5LCB0aGUgZmlsZSAKc3lzdGVtIGlzIG5vdCBjb3JydXB0
ZWQgY2F1c2VkIGJ5IHJlcGxheWluZyBvcnBoYW4gbm9kZXMuClJhbHBoIHJlcG9ydGVkIGEgZmls
ZXN5c3RlbSBjb3JydXB0aW9uIGluIGNvbWJpbmF0aW9uIHdpdGggb3ZlcmxheWZzLiAKQ2FuIHlv
dSB0ZWxsIG1lIHRoZSBkZXRhaWxzIGFib3V0IHRoYXQgcHJvYmxlbT8gVGhhbmtzLgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
