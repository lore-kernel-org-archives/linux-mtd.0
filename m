Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EC7C2D0B1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 04:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28D8222C2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 04:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hpHmXSkd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D28D8222C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JzecuchsNXXSQhLsxT+HLDyf4NVJFOXLK3RAQb58ZFk=; b=hpHmXSkdCQQd5zWOe7FDoV+nA
	wdz8COLnSDezMkcnglfzJjcAGqIm+j6ZoIBgzbSYzdegU6nGYugHloSILzqMb+WcsSTVrDiGZdJNo
	48HZxppIzn6msNLKZ4v9TAR6q45G7X7dchrP75DxObRie0dYdNiWLU6A73Lum4/rFqKnnhw9BO/Oz
	QDUg9YI5AyNFcK5UZ4sIg6tyEnPg9DZ8lNkp0C39p57qxzLSHqrkWfGVNezi9QbA8PSKz9MUe+0sK
	t4TIXa7ZChj/wb0EapIjKY6iqewagjJHJ+OCNq5Qh08T0IgEtpjRGOqyfu6M2IoPuxKBBO7D0AgMe
	N4vX5MFxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izv16-0000Em-SR; Fri, 07 Feb 2020 04:13:20 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izv10-0000EH-CL
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 04:13:19 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436726|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.0988076-0.0042804-0.896912;
 DS=CONTINUE|ham_regular_dialog|0.00396166-8.845e-05-0.99595;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.GlS9rBK_1581048788; 
Received: from 192.168.31.126(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.GlS9rBK_1581048788)
 by smtp.aliyun-inc.com(10.147.41.143);
 Fri, 07 Feb 2020 12:13:09 +0800
Subject: Re: [PATCH v1 11/11] mtd: new support oops logger based on pstore/blk
To: Miquel Raynal <mraynal@kernel.org>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-12-git-send-email-liaoweixiong@allwinnertech.com>
 <20200120110306.32e53fd8@xps13>
 <27226590-379c-8784-f461-f5d701015611@allwinnertech.com>
 <20200121094802.61f8cb4d@xps13>
 <2c6000b1-ae25-564b-911a-2879e9c244b2@allwinnertech.com>
 <20200122184114.125b42c8@xps13>
 <e135f947-226f-8dd0-b328-fb87c5064914@allwinnertech.com>
 <20200206164559.59c5eb6a@xps13>
From: liaoweixiong <liaoweixiong@allwinnertech.com>
Message-ID: <6a1b50f4-320f-43d1-50e3-b0a2c3c7fb96@allwinnertech.com>
Date: Fri, 7 Feb 2020 12:13:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206164559.59c5eb6a@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_201314_618954_1AEC8FBA 
X-CRM114-Status: GOOD (  20.52  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Colin Cross <ccross@android.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

aGkgTWlxdWVsIFJheW5hbCwKCk9uIDIwMjAvMi82IFBNIDExOjQ1LCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+IEhpIGxpYW8sCj4gCj4gbGlhb3dlaXhpb25nIDxsaWFvd2VpeGlvbmdAYWxsd2lubmVy
dGVjaC5jb20+IHdyb3RlIG9uIFRodSwgNiBGZWIgMjAyMAo+IDIxOjEwOjQ3ICswODAwOgo+IAo+
PiBoaSBNaXF1ZWwgUmF5bmFsLAo+Pgo+PiBPbiAyMDIwLzEvMjMgQU0gMTo0MSwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPj4+IEhlbGxvLAo+Pj4KPj4+ICAgIAo+Pj4+Pj4+PiArLyoKPj4+Pj4+Pj4g
KyAqIEFsbCB6b25lcyB3aWxsIGJlIHJlYWQgYXMgcHN0b3JlL2JsayB3aWxsIHJlYWQgem9uZSBv
bmUgYnkgb25lIHdoZW4gZG8KPj4+Pj4+Pj4gKyAqIHJlY292ZXIuCj4+Pj4+Pj4+ICsgKi8KPj4+
Pj4+Pj4gK3N0YXRpYyBzc2l6ZV90IG10ZHBzdG9yZV9yZWFkKGNoYXIgKmJ1Ziwgc2l6ZV90IHNp
emUsIGxvZmZfdCBvZmYpCj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+ICsJc3RydWN0IG10ZHBzdG9yZV9j
b250ZXh0ICpjeHQgPSAmb29wc19jeHQ7Cj4+Pj4+Pj4+ICsJc2l6ZV90IHJldGxlbjsKPj4+Pj4+
Pj4gKwlpbnQgcmV0Owo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsJaWYgKG10ZHBzdG9yZV9ibG9ja19p
c2JhZChjeHQsIG9mZikpCj4+Pj4+Pj4+ICsJCXJldHVybiAtRU5FWFQ7Cj4+Pj4+Pj4+ICsKPj4+
Pj4+Pj4gKwlwcl9kZWJ1ZygidHJ5IHRvIHJlYWQgb2ZmIDB4JWxseCBzaXplICV6dVxuIiwgb2Zm
LCBzaXplKTsKPj4+Pj4+Pj4gKwlyZXQgPSBtdGRfcmVhZChjeHQtPm10ZCwgb2ZmLCBzaXplLCAm
cmV0bGVuLCAodV9jaGFyICopYnVmKTsKPj4+Pj4+Pj4gKwlpZiAoKHJldCA8IDAgJiYgIW10ZF9p
c19iaXRmbGlwKHJldCkpIHx8IHNpemUgIT0gcmV0bGVuKSAgewo+Pj4+Pj4+Cj4+Pj4+Pj4gSUlS
QyBzaXplICE9IHJldGxlbiBkb2VzIG5vdCBtZWFuIGl0IGZhaWxlZCwgYnV0IHRoYXQgeW91IHNo
b3VsZAo+Pj4+Pj4+IGNvbnRpbnVlIHJlYWRpbmcgYWZ0ZXIgcmV0bGVuIGJ5dGVzLCBubz8KPj4+
Pj4+PiAgICAgID4+Cj4+Pj4+PiBZZXMsIHlvdSBhcmUgcmlnaHQuIEkgd2lsbCBmaXggaXQuIFRo
YW5rcy4KPj4+Pj4+ICAgID4+Pj4+IEFsc28sIG10ZF9pc19iaXRmbGlwKCkgZG9lcyBub3QgbWVh
biB0aGF0IHlvdSBhcmUgcmVhZGluZyBhIGZhbHNlCj4+Pj4+Pj4gYnVmZmVyLCBidXQgdGhhdCB0
aGUgZGF0YSBoYXMgYmVlbiBjb3JyZWN0ZWQgYXMgaXQgY29udGFpbmVkIGJpdGZsaXBzLgo+Pj4+
Pj4+IG10ZF9pc19lY2NlcnIoKSBob3dldmVyLCB3b3VsZCBiZSBtZWFuaW5nZnVsLgo+Pj4+Pj4+
ICAgICAgPj4KPj4+Pj4+IFN1cmUgSSBrbm93IG10ZF9pc19iaXRmbGlwKCkgZG9lcyBub3QgbWVh
biBmYWlsdXJlLCBidXQgSSBkbyBub3QgdGhpbmsKPj4+Pj4+IG10ZF9pc19lY2NlcnIoKSBzaG91
bGQgYmUgaGVyZSBzaW5jZSB0aGUgY29kZXMgYXJlIHJldCA8IDAgYW5kIE5PVAo+Pj4+Pj4gbXRk
X2lzX2JpdGZsaXAoKS4KPj4+Pj4KPj4+Pj4gWWVzLCBqdXN0IGRyb3AgdGhpcyBjaGVjaywgb25s
eSBrZWVwIHJldCA8IDAuCj4+Pj4+ICAgICA+Pgo+Pj4+IElmIEkgZG9uJ3QgZ2V0IGl0IHdyb25n
LCBpdCBzaG91bGQgbm90CSBiZSBkcm9wcGVkIGhlcmUuIExpa2UgeW91ciB3b3JkcywKPj4+PiAi
bXRkX2lzX2JpdGZsaXAoKSBkb2VzIG5vdCBtZWFuIHRoYXQgeW91IGFyZSByZWFkaW5nIGEgZmFs
c2UgYnVmZmVyLAo+Pj4+IGJ1dCB0aGF0IHRoZSBkYXRhIGhhcyBiZWVuIGNvcnJlY3RlZCBhcyBp
dCBjb250YWluZWQgYml0ZmxpcHMuIiwgdGhlCj4+Pj4gZGF0YSBJIGdldCBhcmUgdmFsaWQgZXZl
biBpZiBtdGRfaXNfYml0ZmxpcCgpIHJldHVybiB0cnVlLiBJdCdzIGNvcnJlY3QKPj4+PiBkYXRh
IGFuZCBpdCdzIG5vIG5lZWQgdG8gZ28gdG8gaGFuZGxlIGVycm9yLiBUbyBtZSwgdGhlIGNvZGVz
Cj4+Pj4gc2hvdWxkIGJlOgo+Pj4+IAlpZiAocmV0IDwgMCAmJiAhbWl0X2lzX2JpdGZsaXAoKSkK
Pj4+PiAJCVtlcnJvciBoYW5kbGluZ10KPj4+Cj4+PiBQbGVhc2UgY2hlY2sgdGhlIGltcGxlbWVu
dGF0aW9uIG9mIG10ZF9pc19iaXRmbGlwKCkuIFlvdSdsbCBwcm9iYWJseQo+Pj4gZmlndXJlIG91
dCB3aGF0IEkgYW0gc2F5aW5nLgo+Pj4KPj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgjTDU4NQo+Pj4gICAgCj4+
Cj4+IEhvdyBhYm91dCB0aGUgY29kZXMgYXMgZm9sbG93czoKPj4KPj4gZm9yIChkb25lID0gMCwg
cmV0bGVuID0gMDsgZG9uZSA8IHNpemU7IGRvbmUgKz0gcmV0bGVuKSB7Cj4+IAlyZXQgPSBtdGRf
cmVhZCguLi4sICZyZXRsZW4sIC4uLik7Cj4+IAlpZiAoIXJldCkKPj4gCQljb250aW51ZTsKPj4g
CS8qCj4+IAkgKiBkbyBub3RoaW5nIGlmIGJpdGZsaXAgYW5kIGVjYyBlcnJvciBvY2N1cnMgYmVj
YXVzZSB3aGV0aGVyCj4+IAkgKiBpdCdzIGJpdGZsaXAgb3IgRUNDIGVycm9yLCBqdXN0IGEgc21h
bGwgbnVtYmVyIG9mIGJpdHMgZmxpcAo+PiAJICogYW5kIHRoZSBpbXBhY3Qgb24gbG9nIGRhdGEg
aXMgc28gc21hbGwuIFRoZSBtdGRwc3RvcmUganVzdAo+PiAJICogaGFuZHMgb3ZlciB3aGF0IGl0
IGdldHMgYW5kIHVzZXIgY2FuIGp1ZGdlIHdoZXRoZXIgdGhlIGRhdGEKPj4gCSAqIGlzIHZhbGlk
IG9yIG5vdC4KPj4gCSAqLwo+PiAJaWYgKG10ZF9pc19iaXRmbGlwKHJldCkpIHsKPj4gCQlkZXZf
d2FybigiYml0ZmxpcCBhdC4uLi4iKTsKPj4gCQljb250aW51ZTsKCj4gSSBkb24ndCB1bmRlcnN0
YW5kIHdoeSBkbyB5b3UgY2hlY2sgZm9yIGJpdGZsaXBzLiBCaXRmbGlwcyBoYXZlIGJlZW4KPiBj
b3JyZWN0ZWQgYXQgdGhpcyBzdGFnZSwgeW91IGp1c3QgZ2V0IHRoZSBpbmZvcm1hdGlvbiB0aGF0
IHRoZXJlCj4gaGFzIGJlZW4gYml0ZmxpcHMsIGJ1dCB0aGUgZGF0YSBpbnRlZ3JpdHkgaXMgZmlu
ZS4KPiAKCkJvdGggb2YgYml0ZmxpcCBhbmQgZWNjZXJyb3IgYXJlIG5vdCByZWFsIHdyb25nIGlu
IHRoaXMKY2FzZS4gU28gd2UgbXVzdCBjaGVjayB0aGVtLgoKPiBJIGFtIG5vdCBhZ2FpbnN0IGln
bm9yaW5nIEVDQyBlcnJvcnMgaW4gdGhpcyBjYXNlIHRob3VnaC4gSSB3b3VsZAo+IHByb3Bvc2U6
Cj4gCj4gCWZvciAoLi4uKSB7Cj4gCQlpZiAocmV0IDwgMCkgewo+IAkJCWNvbXBsYWluOwo+IAkJ
CXJldHVybjsKPiAJCX0KPiAKCi0xMTcgKC1FVUNMRUFOKSBtZWFucyBiaXRmbGlwIGJ1dCBiZSBj
b3JyZWN0ZWQuCi03NCAoLUVCQURNU0cpIG1lYW5zIGVjYyBlcnJvciB0aGF0IHVuY29ycmVjdGFi
bGUKQWxsIG9mIHRoZW0gYXJlIG5lZ2F0aXZlIG51bWJlciB0aGF0IHNtYWxsZXIgdGhhbiAwLiBJ
ZiBpdCBqdXN0IGtlZXBzCiJyZXQgPCAwIiwgaXQgY2FuIG5ldmVyIG1ha2UgYSBkaWZmZXJlbmNl
IGJldHdlZW4gYml0ZmxpcC9lY2NlcnJvcgphbmQgb3RoZXJzLgoKPiAJCWlmIChtdGRfaXNfZWNj
ZXJyKCkpCj4gCQkJY29tcGxhaW47Cj4gCX0KPiAJCQo+PiAJfSBlbHNlIGlmIChtdGRfaXNfZWNj
ZXJyKHJldCkpIHsKPj4gCQlkZXZfd2FybigiZWNjZXJyIGF0Li4uLiIpOwo+PiAJCXJldGxlbiA9
IHJldGxlbiA9PSAwID8gc2l6ZSA6IHJldGxlbjsKPj4gCQljb250aW51ZTsKPj4gCX0gZWxzZSB7
Cj4+IAkJZGV2X2VycigicmVhZCBmYWlsdXJlIGF0Li4uIik7Cj4+IAkJLyogdGhpcyB6b25lIGlz
IGJyb2tlbiwgdHJ5IG5leHQgb25lICovCj4+IAkJcmV0dXJuIC1FTkVYVDsKPj4gCX0KPj4gfQo+
Pgo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
