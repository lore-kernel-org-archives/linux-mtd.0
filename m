Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2178C77B7C
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyzYolztSfLROS1tC1iSc4IgpwL37r7fxkJ9cF/JO0k=; b=LqsMgRBuW5lp1C
	akpJ8TJOmHhRj8KUY4ytkJdMo/UiaUA1PecGO+3rx2umPiQgYsj0uKTtmfQWGDXUkI8oo91jXt70W
	IAOtzHt0KQliHZa7ioJO62/rzZkdF7rjPaCzawWA6DCPIqtVJ05rqd63ceSXJxM1fijGsC/vGTt39
	A6EDI/HrEJTD+o5xuEqyM0sswv6ZP9PiB8TI+OYxqyNRZVvBYwtlE2Q9Oj+q7ptSNDzkhgTpXDaIU
	X+zBr+FrU/GWNfan0siED4zna6pbamakob/vV/lYrJIX93tQEGf6xzbySqovN4yTVXtymBDCULydm
	BOj7YI74Mo/S2QWZthzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px3Qr-008Qmb-1i;
	Thu, 11 May 2023 10:21:57 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px3Ql-008QlA-2s;
	Thu, 11 May 2023 10:21:54 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 0CE475FD47;
	Thu, 11 May 2023 13:21:46 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683800506;
	bh=LS0YI3MLZc8l9O0sAXRJPSZc7gIAV1FYsm6dmQZeDS8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	b=JpwFlcTFeJPTlyc7C6YBNgtzydpnfh6NSBZJ+x+MBKJHpRo0o6xx0ZvkcW3qF2E3j
	 swkwFxk+EFcC7n+BuRwJwFQ7d1lW7lHatH/VYaFV6BEaiRlUaiRt79ciE655akX5OE
	 SbSSSw98BgxDquLgZ7WtcYwowvhMRVGH7XAmfNYIk2+9yNKobTRT0L4ISmVcon27XT
	 M0rg6jURNQ9EwzTHZdhHWIFeVgl5y9A7FqXmSsM2lTZqtN1GxGW/0tMJ8wz0B3bq4i
	 fCVab7SNUcD6ttHEMpd0RqcYXjsHnjcKlqTZVZzgNLoKa3IN/9rNtFy+/4+ZvDYMlq
	 UNn6uabzEikeA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 13:21:44 +0300 (MSK)
Message-ID: <4561f558-1d34-a7a9-2a05-f6453b0ed9a9@sberdevices.ru>
Date: Thu, 11 May 2023 13:16:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Content-Language: en-US
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
 <20230510110835.26115-7-AVKrasnov@sberdevices.ru>
 <CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
 <20230510225359.061c2df6@xps-13>
 <6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
 <20230511111204.0b0b3d70@xps-13>
 <dd25efa3-e46a-e857-d355-53330a8a4181@sberdevices.ru>
In-Reply-To: <dd25efa3-e46a-e857-d355-53330a8a4181@sberdevices.ru>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 05:14:00 #21258391
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_032152_631704_4515B077 
X-CRM114-Status: GOOD (  20.65  )
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

CgpPbiAxMS4wNS4yMDIzIDEyOjE3LCBBcnNlbml5IEtyYXNub3Ygd3JvdGU6Cj4gCj4gCj4gT24g
MTEuMDUuMjAyMyAxMjoxMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gSGkgQXJzZW5peSwKPj4K
Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFRodSwgMTEgTWF5IDIwMjMgMTE6
NTk6MDcgKzAzMDA6Cj4+Cj4+PiBPbiAxMC4wNS4yMDIzIDIzOjUzLCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+Pj4KPj4+IEhlbGxvIE1hcnRpbiwgTWlxdWVsCj4+Pgo+Pj4+IEhpIE1hcnRpbiAmIEFy
c2VuaXksCj4+Pj4KPj4+PiBtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tIHdyb3Rl
IG9uIFdlZCwgMTAgTWF5IDIwMjMgMjI6NDA6MzcKPj4+PiArMDIwMDoKPj4+PiAgIAo+Pj4+PiBI
ZWxsbyBBcnNlbml5LAo+Pj4+Pgo+Pj4+PiBPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCAxOjEz4oCv
UE0gQXJzZW5peSBLcmFzbm92Cj4+Pj4+IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3Rl
OiAgCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyByZW5hbWVzIG5vZGUgd2l0aCB2YWx1ZXMgZm9yIGNoaXAg
c2VsZWN0IGZyb20gInJlZyIgdG8gImNzIi4gSXQgaXMKPj4+Pj4+IG5lZWRlZCBiZWNhdXNlIHdo
ZW4gT1RQIGFjY2VzcyBpcyBlbmFibGVkIG9uIHRoZSBhdHRhY2hlZCBzdG9yYWdlLCBNVEQKPj4+
Pj4+IHN1YnN5c3RlbSByZWdpc3RlcnMgdGhpcyBzdG9yYWdlIGluIHRoZSBOVk1FTSBzdWJzeXN0
ZW0uIE5WTUVNIGluIHR1cm4KPj4+Pj4+IHRyaWVzIHRvIHVzZSAicmVnIiBub2RlIGluIGl0cyBv
d24gbWFubmVyLCBzdXBwb3NlcyB0aGF0IGl0IGhhcyBhbm90aGVyCj4+Pj4+PiBsYXlvdXQuIEFs
bCBvZiB0aGlzIGxlYWRzIHRvIGRldmljZSBpbml0aWFsaXphdGlvbiBmYWlsdXJlLiAgICAKPj4+
Pj4gSW4gZ2VuZXJhbDogaWYgd2UgY2hhbmdlIHRoZSBkZXZpY2UtdHJlZSBpbnRlcmZhY2UgKGlu
IHRoaXMgY2FzZToKPj4+Pj4gcmVwbGFjaW5nIGEgInJlZyIgd2l0aCBhICJjcyIgcHJvcGVydHkp
IHRoZSBkdC1iaW5kaW5ncyBoYXZlIHRvIGJlCj4+Pj4+IHVwZGF0ZWQgYXMgd2VsbC4gIAo+Pj4+
Cj4+Pj4gVHJ1ZSwgYW5kIEkgd291bGQgYWRkLCBiaW5kaW5ncyBzaG91bGQgbm90IGJlIGJyb2tl
bi4gIAo+Pj4KPj4+IEkgc2VlLCB0aGF0J3MgdHJ1ZS4gVGhhdCBpcyBiYWQgd2F5IHRvIGNoYW5n
ZSBiaW5kaW5ncy4KPj4+Cj4+Pj4gICAKPj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCBhbmQKPj4+Pj4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCBzaG93Cj4+Pj4+
IHRoYXQgdGhlIGNoaXAgc2VsZWN0IG9mIGEgTkFORCBjaGlwIGlzIHNwZWNpZmllZCB3aXRoIGEg
InJlZyIKPj4+Pj4gcHJvcGVydHkuICAKPj4+Pgo+Pj4+IEFsbCBOQU5EIGNvbnRyb2xsZXIgYmlu
ZGluZyBleHBlY3QgdGhlIGNoaXAtc2VsZWN0IHRvIGJlIGluIHRoZQo+Pj4+ICdyZWcnIHByb3Bl
cnR5LCB2ZXJ5IG11Y2ggbGlrZSBhIHNwaSBkZXZpY2Ugd291bGQgdXNlIHJlZyB0byBzdG9yZSB0
aGUKPj4+PiBjcyBhcyB3ZWxsOiB0aGUgcmVnIHByb3BlcnR5IHRlbGxzIHlvdSBob3cgeW91IGFk
ZHJlc3MgdGhlIGRldmljZS4KPj4+Pgo+Pj4+IEkgYWxzbyBmdWxseSBhZ3JlZSB3aXRoIE1hcnRp
bidzIGNvbW1lbnRzIGJlbG93LiBDaGFuZ2luZyByZWcgaXMgbGlrZWx5Cj4+Pj4gYSB3cm9uZyBh
cHByb2FjaCA6KQo+Pj4+ICAgCj4+Pj4+IEFsc28gdGhlIGNvZGUgaGFzIHRvIGJlIGJhY2t3YXJk
cyBjb21wYXRpYmxlIHdpdGggb2xkIC5kdGJzLgo+Pj4+PiAgCj4+Pj4+PiBFeGFtcGxlOgo+Pj4+
Pj4KPj4+Pj4+IFsuLi5dIG52bWVtIG10ZDAtdXNlci1vdHA6IG52bWVtOiBpbnZhbGlkIHJlZyBv
biAvc29jL2J1c0BmZmUwMDAwMC8uLi4KPj4+Pj4+IFsuLi5dIG10ZCBtdGQwOiBGYWlsZWQgdG8g
cmVnaXN0ZXIgT1RQIE5WTUVNIGRldmljZQo+Pj4+Pj4gWy4uLl0gbWVzb24tbmFuZCBmZmUwNzgw
MC5uZmM6IGZhaWxlZCB0byByZWdpc3RlciBNVEQgZGV2aWNlOiAtMjIKPj4+Pj4+IFsuLi5dIG1l
c29uLW5hbmQgZmZlMDc4MDAubmZjOiBmYWlsZWQgdG8gaW5pdCBOQU5EIGNoaXBzCj4+Pj4+PiBb
Li4uXSBtZXNvbi1uYW5kOiBwcm9iZSBvZiBmZmUwNzgwMC5uZmMgZmFpbGVkIHdpdGggZXJyb3Ig
LTIyICAgIAo+Pj4+PiBUaGlzIGlzIG9kZCAtIGNhbiB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgZGVm
aW5pdGlvbiBvZiB0aGUgJm5mYyBub2RlPyAgCj4+Pgo+Pj4gU3VyZSwgaGVyZSBpdCBpczoKPj4+
Cj4+PiBtdGRfbmFuZDogbmZjQDc4MDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPj4+
IAljb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYXhnLW5mYyI7Cj4+PiAJLi4uCj4+PiAJbmFu
ZEAwIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+Pj4gICAgICAgICAJcmVnID0g
PDA+Owo+Pj4gICAgICAgICB9Owo+Pj4gfQo+Pj4KPj4+IEkgY2hlY2tlZCwgdGhhdCAnbmFuZF9z
ZXRfZmxhc2hfbm9kZSgpJyBpcyBjYWxsZWQgd2l0aCAnbmFuZEAwJyBhbmQgaSBzdXBwb3NlCj4+
PiB0aGF0IGl0IGlzIGNvcnJlY3QgKGFzIFlvdSBtZW50aW9uZWQgYmVsb3cpLiBCdXQsICdudm1l
bV9hZGRfY2VsbHNfZnJvbV9vZigpJyBpcyBjYWxsZWQKPj4+IHdpdGggcGFyZW50OiAnbmZjQDc4
MDAnLCB0aGVuIGl0IGl0ZXJhdGVzIG92ZXIgaXRzIGNoaWxkcywgZS5nLiAnbmFuZEAwJyBhbmQg
dGh1cyBpIGdldCBzdWNoCj4+PiBzaXR1YXRpb24uIEkgZ3Vlc3MsIHRoYXQgJ252bWVtX2FkZF9j
ZWxsc19mcm9tX29mKCknIG11c3QgYmUgY2FsbGVkIHdpdGggJ25hbmRAMCcgPwo+Pgo+PiBXZSBy
ZWNlbnRseSBoYWQgaXNzdWVzIHdpdGggbnZtZW0gcGFyc2luZywgYnV0IEkgYmVsaWV2ZSBhIG1h
aW5saW5lCj4+IGtlcm5lbCBzaG91bGQgbm93IGJlIHBlcmZlY3RseSB3b3JraW5nIG9uIHRoaXMg
cmVnYXJkLiBXaGF0IHZlcnNpb24gb2YKPj4gdGhlIExpbnV4IGtlcm5lbCBhcmUgeW91IHVzaW5n
Pwo+IAo+IE15IGN1cnJlbnQgdmVyc2lvbiBpczoKPiAKPiBWRVJTSU9OID0gNiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBQQVRD
SExFVkVMID0gMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKPiBTVUJMRVZFTCA9IDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBFWFRSQVZFUlNJT04gPSAtcmM4IAo+IAo+
IEZpeCB3YXMgaW4gZHJpdmVycy9udm1lbS8qID8KPiAKPiBUaGFua3MsIEFyc2VuaXkKClVwZDog
SSByZXNvbHZlZCBwcm9ibGVtIGluIHRoZSBmb2xsb3dpbmcgd2F5OgoKbmFuZEAwIHsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAoJcmVnID0gPDA+Oy8vY2hpcCBzZWxlY3QKCglvdHBA
MCB7ICAgICAgICAgICAgICAgICAgICAgICAgIAoJCSNhZGRyZXNzLWNlbGxzID0gPDI+OyAgIAoJ
CSNzaXplLWNlbGxzID0gPDA+OyAgICAgIAoJCWNvbXBhdGlibGUgPSAidXNlci1vdHAiOwoJCXJl
ZyA9IDxBIEI+OyAgICAgICAgICAgIAoJfTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
CW90cEAxIHsgICAgICAgICAgICAgICAgICAgICAgICAgCgkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47
ICAgCgkJI3NpemUtY2VsbHMgPSA8MD47ICAgICAgCgkJY29tcGF0aWJsZSA9ICJmYWN0b3J5LW90
cCI7CgkJcmVnID0gPEMgRD47ICAgICAgICAgICAgCgl9OyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAp9OwoKTm93IG52bWVtIHN1YnN5c3RlbSBwYXJzZXMgJ290cEAwJyBhbmQgJ290cEAx
JyBhbmQgZXJyb3IgaXMgZ29uZS4gJ2NvbXBhdGlibGUnIHZhbHVlcyBhcmUKdGhlIHNhbWUgYXMg
aW4gZHJpdmVycy9tdGQvbXRkY29yZS5jOm10ZF9vdHBfbnZtZW1fYWRkKCkuICdyZWcnIGluICdu
YW5kQDAnIGlzIHVzZWQgYXMKY2hpcCBzZWxlY3QgYXMgc3VwcG9zZWQuCgpJIHRoaW5rLCB0aGlz
IHBhdGNoIHNob3VsZCBiZSBhYmFuZG9uZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4KClRoYW5rcywg
QXJzZW5peQoKPiAKPj4KPj4gVGhhbmtzLAo+PiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
