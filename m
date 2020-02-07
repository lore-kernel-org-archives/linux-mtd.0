Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90893C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 10:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C552082E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 10:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bx+VUxRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62C552082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MzpI2vJ4QFFVxjjjCrB3JzHrtwPgrVQ/6BafW5oJ3Rw=; b=Bx+VUxRNz+08Reald+sPTwmMH
	q13oFIqf64om/lJbINx+egW4ErptgHAcHCQhmBreri0XFPpV9fgBvqDGiT85GOyCGUkqHZFNv6aVq
	qU3kju6GFG8kBYSYfXOl2/A9zxLmBhSlZ1jnP0lyIq6P4RsXQRUEP3FsNPgHZQmEyIFHw5CbnHCnq
	pgha7Yncc2ldNIt3xHV4a/gm2PH6f+j2H0UjG6EdWKFlLBg47DyntNOphQaCfDbNaTpvhFKJYhyD/
	Vqb8GdlZVsrUzUkUgVV/pkXjYMdcxgb6MDGkwWhLNlUiz2FnucjWmCNBihekVMzxbhKJXFqz6W1mY
	LeTtHVYXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j00uQ-0000Ax-76; Fri, 07 Feb 2020 10:30:50 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j00uN-0000AJ-6c
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 10:30:49 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436287|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.126263-0.0024786-0.871258;
 DS=CONTINUE|ham_regular_dialog|0.0595875-0.00190005-0.938512;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03279; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.GlYZUym_1581071437; 
Received: from 192.168.31.126(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.GlYZUym_1581071437)
 by smtp.aliyun-inc.com(10.147.44.118);
 Fri, 07 Feb 2020 18:30:38 +0800
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
 <6a1b50f4-320f-43d1-50e3-b0a2c3c7fb96@allwinnertech.com>
 <20200207094121.0ad702d0@xps13>
From: liaoweixiong <liaoweixiong@allwinnertech.com>
Message-ID: <05c21cb6-988b-63a7-60ff-c4e975f25817@allwinnertech.com>
Date: Fri, 7 Feb 2020 18:30:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207094121.0ad702d0@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_023047_497032_431FA37E 
X-CRM114-Status: GOOD (  20.84  )
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

aGkgTWlxdWVsIFJheW5hbCwKCk9uIDIwMjAvMi83IOS4i+WNiDQ6NDEsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4gSGkgTGlhbywKPiAKPiBsaWFvd2VpeGlvbmcgPGxpYW93ZWl4aW9uZ0BhbGx3aW5u
ZXJ0ZWNoLmNvbT4gd3JvdGUgb24gRnJpLCA3IEZlYiAyMDIwCj4gMTI6MTM6MDggKzA4MDA6Cj4g
Cj4+IGhpIE1pcXVlbCBSYXluYWwsCj4+Cj4+IE9uIDIwMjAvMi82IFBNIDExOjQ1LCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+Pj4gSGkgbGlhbywKPj4+Cj4+PiBsaWFvd2VpeGlvbmcgPGxpYW93ZWl4
aW9uZ0BhbGx3aW5uZXJ0ZWNoLmNvbT4gd3JvdGUgb24gVGh1LCA2IEZlYiAyMDIwCj4+PiAyMTox
MDo0NyArMDgwMDoKPj4+ICAgIAo+Pj4+IGhpIE1pcXVlbCBSYXluYWwsCj4+Pj4KPj4+PiBPbiAy
MDIwLzEvMjMgQU0gMTo0MSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gSGVsbG8sCj4+Pj4+
ICAgCj4+Pj4+ICAgICA+Pj4+Pj4+PiArLyoKPj4+Pj4+Pj4+PiArICogQWxsIHpvbmVzIHdpbGwg
YmUgcmVhZCBhcyBwc3RvcmUvYmxrIHdpbGwgcmVhZCB6b25lIG9uZSBieSBvbmUgd2hlbiBkbwo+
Pj4+Pj4+Pj4+ICsgKiByZWNvdmVyLgo+Pj4+Pj4+Pj4+ICsgKi8KPj4+Pj4+Pj4+PiArc3RhdGlj
IHNzaXplX3QgbXRkcHN0b3JlX3JlYWQoY2hhciAqYnVmLCBzaXplX3Qgc2l6ZSwgbG9mZl90IG9m
ZikKPj4+Pj4+Pj4+PiArewo+Pj4+Pj4+Pj4+ICsJc3RydWN0IG10ZHBzdG9yZV9jb250ZXh0ICpj
eHQgPSAmb29wc19jeHQ7Cj4+Pj4+Pj4+Pj4gKwlzaXplX3QgcmV0bGVuOwo+Pj4+Pj4+Pj4+ICsJ
aW50IHJldDsKPj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4gKwlpZiAobXRkcHN0b3JlX2Jsb2NrX2lz
YmFkKGN4dCwgb2ZmKSkKPj4+Pj4+Pj4+PiArCQlyZXR1cm4gLUVORVhUOwo+Pj4+Pj4+Pj4+ICsK
Pj4+Pj4+Pj4+PiArCXByX2RlYnVnKCJ0cnkgdG8gcmVhZCBvZmYgMHglbGx4IHNpemUgJXp1XG4i
LCBvZmYsIHNpemUpOwo+Pj4+Pj4+Pj4+ICsJcmV0ID0gbXRkX3JlYWQoY3h0LT5tdGQsIG9mZiwg
c2l6ZSwgJnJldGxlbiwgKHVfY2hhciAqKWJ1Zik7Cj4+Pj4+Pj4+Pj4gKwlpZiAoKHJldCA8IDAg
JiYgIW10ZF9pc19iaXRmbGlwKHJldCkpIHx8IHNpemUgIT0gcmV0bGVuKSAgewo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IElJUkMgc2l6ZSAhPSByZXRsZW4gZG9lcyBub3QgbWVhbiBpdCBmYWlsZWQsIGJ1
dCB0aGF0IHlvdSBzaG91bGQKPj4+Pj4+Pj4+IGNvbnRpbnVlIHJlYWRpbmcgYWZ0ZXIgcmV0bGVu
IGJ5dGVzLCBubz8KPj4+Pj4+Pj4+ICAgICAgID4+Cj4+Pj4+Pj4+IFllcywgeW91IGFyZSByaWdo
dC4gSSB3aWxsIGZpeCBpdC4gVGhhbmtzLgo+Pj4+Pj4+PiAgICAgPj4+Pj4gQWxzbywgbXRkX2lz
X2JpdGZsaXAoKSBkb2VzIG5vdCBtZWFuIHRoYXQgeW91IGFyZSByZWFkaW5nIGEgZmFsc2UKPj4+
Pj4+Pj4+IGJ1ZmZlciwgYnV0IHRoYXQgdGhlIGRhdGEgaGFzIGJlZW4gY29ycmVjdGVkIGFzIGl0
IGNvbnRhaW5lZCBiaXRmbGlwcy4KPj4+Pj4+Pj4+IG10ZF9pc19lY2NlcnIoKSBob3dldmVyLCB3
b3VsZCBiZSBtZWFuaW5nZnVsLgo+Pj4+Pj4+Pj4gICAgICAgPj4KPj4+Pj4+Pj4gU3VyZSBJIGtu
b3cgbXRkX2lzX2JpdGZsaXAoKSBkb2VzIG5vdCBtZWFuIGZhaWx1cmUsIGJ1dCBJIGRvIG5vdCB0
aGluawo+Pj4+Pj4+PiBtdGRfaXNfZWNjZXJyKCkgc2hvdWxkIGJlIGhlcmUgc2luY2UgdGhlIGNv
ZGVzIGFyZSByZXQgPCAwIGFuZCBOT1QKPj4+Pj4+Pj4gbXRkX2lzX2JpdGZsaXAoKS4KPj4+Pj4+
Pgo+Pj4+Pj4+IFllcywganVzdCBkcm9wIHRoaXMgY2hlY2ssIG9ubHkga2VlcCByZXQgPCAwLgo+
Pj4+Pj4+ICAgICAgPj4KPj4+Pj4+IElmIEkgZG9uJ3QgZ2V0IGl0IHdyb25nLCBpdCBzaG91bGQg
bm90CSBiZSBkcm9wcGVkIGhlcmUuIExpa2UgeW91ciB3b3JkcywKPj4+Pj4+ICJtdGRfaXNfYml0
ZmxpcCgpIGRvZXMgbm90IG1lYW4gdGhhdCB5b3UgYXJlIHJlYWRpbmcgYSBmYWxzZSBidWZmZXIs
Cj4+Pj4+PiBidXQgdGhhdCB0aGUgZGF0YSBoYXMgYmVlbiBjb3JyZWN0ZWQgYXMgaXQgY29udGFp
bmVkIGJpdGZsaXBzLiIsIHRoZQo+Pj4+Pj4gZGF0YSBJIGdldCBhcmUgdmFsaWQgZXZlbiBpZiBt
dGRfaXNfYml0ZmxpcCgpIHJldHVybiB0cnVlLiBJdCdzIGNvcnJlY3QKPj4+Pj4+IGRhdGEgYW5k
IGl0J3Mgbm8gbmVlZCB0byBnbyB0byBoYW5kbGUgZXJyb3IuIFRvIG1lLCB0aGUgY29kZXMKPj4+
Pj4+IHNob3VsZCBiZToKPj4+Pj4+IAlpZiAocmV0IDwgMCAmJiAhbWl0X2lzX2JpdGZsaXAoKSkK
Pj4+Pj4+IAkJW2Vycm9yIGhhbmRsaW5nXQo+Pj4+Pgo+Pj4+PiBQbGVhc2UgY2hlY2sgdGhlIGlt
cGxlbWVudGF0aW9uIG9mIG10ZF9pc19iaXRmbGlwKCkuIFlvdSdsbCBwcm9iYWJseQo+Pj4+PiBm
aWd1cmUgb3V0IHdoYXQgSSBhbSBzYXlpbmcuCj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgjTDU4
NQo+Pj4+PiAgICAgPj4KPj4+PiBIb3cgYWJvdXQgdGhlIGNvZGVzIGFzIGZvbGxvd3M6Cj4+Pj4K
Pj4+PiBmb3IgKGRvbmUgPSAwLCByZXRsZW4gPSAwOyBkb25lIDwgc2l6ZTsgZG9uZSArPSByZXRs
ZW4pIHsKPj4+PiAJcmV0ID0gbXRkX3JlYWQoLi4uLCAmcmV0bGVuLCAuLi4pOwo+Pj4+IAlpZiAo
IXJldCkKPj4+PiAJCWNvbnRpbnVlOwo+Pj4+IAkvKgo+Pj4+IAkgKiBkbyBub3RoaW5nIGlmIGJp
dGZsaXAgYW5kIGVjYyBlcnJvciBvY2N1cnMgYmVjYXVzZSB3aGV0aGVyCj4+Pj4gCSAqIGl0J3Mg
Yml0ZmxpcCBvciBFQ0MgZXJyb3IsIGp1c3QgYSBzbWFsbCBudW1iZXIgb2YgYml0cyBmbGlwCj4+
Pj4gCSAqIGFuZCB0aGUgaW1wYWN0IG9uIGxvZyBkYXRhIGlzIHNvIHNtYWxsLiBUaGUgbXRkcHN0
b3JlIGp1c3QKPj4+PiAJICogaGFuZHMgb3ZlciB3aGF0IGl0IGdldHMgYW5kIHVzZXIgY2FuIGp1
ZGdlIHdoZXRoZXIgdGhlIGRhdGEKPj4+PiAJICogaXMgdmFsaWQgb3Igbm90Lgo+Pj4+IAkgKi8K
Pj4+PiAJaWYgKG10ZF9pc19iaXRmbGlwKHJldCkpIHsKPj4+PiAJCWRldl93YXJuKCJiaXRmbGlw
IGF0Li4uLiIpOwo+Pj4+IAkJY29udGludWU7Cj4+Cj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5
IGRvIHlvdSBjaGVjayBmb3IgYml0ZmxpcHMuIEJpdGZsaXBzIGhhdmUgYmVlbgo+Pj4gY29ycmVj
dGVkIGF0IHRoaXMgc3RhZ2UsIHlvdSBqdXN0IGdldCB0aGUgaW5mb3JtYXRpb24gdGhhdCB0aGVy
ZQo+Pj4gaGFzIGJlZW4gYml0ZmxpcHMsIGJ1dCB0aGUgZGF0YSBpbnRlZ3JpdHkgaXMgZmluZS4K
Pj4+ICAgIAo+Pgo+PiBCb3RoIG9mIGJpdGZsaXAgYW5kIGVjY2Vycm9yIGFyZSBub3QgcmVhbCB3
cm9uZyBpbiB0aGlzCj4+IGNhc2UuIFNvIHdlIG11c3QgY2hlY2sgdGhlbS4KPj4KPj4+IEkgYW0g
bm90IGFnYWluc3QgaWdub3JpbmcgRUNDIGVycm9ycyBpbiB0aGlzIGNhc2UgdGhvdWdoLiBJIHdv
dWxkCj4+PiBwcm9wb3NlOgo+Pj4KPj4+IAlmb3IgKC4uLikgewo+Pj4gCQlpZiAocmV0IDwgMCkg
ewo+Pj4gCQkJY29tcGxhaW47Cj4+PiAJCQlyZXR1cm47Cj4+PiAJCX0KPj4+ICAgIAo+Pgo+PiAt
MTE3ICgtRVVDTEVBTikgbWVhbnMgYml0ZmxpcCBidXQgYmUgY29ycmVjdGVkLgo+PiAtNzQgKC1F
QkFETVNHKSBtZWFucyBlY2MgZXJyb3IgdGhhdCB1bmNvcnJlY3RhYmxlCj4+IEFsbCBvZiB0aGVt
IGFyZSBuZWdhdGl2ZSBudW1iZXIgdGhhdCBzbWFsbGVyIHRoYW4gMC4gSWYgaXQganVzdCBrZWVw
cwo+PiAicmV0IDwgMCIsIGl0IGNhbiBuZXZlciBtYWtlIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIGJp
dGZsaXAvZWNjZXJyb3IKPj4gYW5kIG90aGVycy4KPiAKPiBJIGZvcmdvdCBhYm91dCB0aGVzZSwg
eW91cidyZSByaWdodCwgc28gd2hhdCBhYm91dDoKPiAKPiAJc3RhdGljIGJvb2wgbXRkcHN0b3Jl
X2lzX2lvX2Vycm9yKGludCByZXQpCj4gCXsKPiAJCXJldHVybiByZXQgPCAwICYmICFtdGRfaXNf
ZWNjZXJyKHJldCk+ICYmICFtdGRfaXNfYml0ZmxpcChyZXQpOwo+IAl9Cj4gCj4gCWZvciAoLi4u
KSB7Cj4gCQlpZiAobXRkcHN0b3JlX2lzX2lvX2Vycm9yKHJldCkpCj4gCQkJcmV0dXJuIHJldDsK
PiAKPiAJCS8qCj4gCQkgKiBDb21tZW50IGV4cGxhaW5pbmcgd2h5IHdlIHN0aWxsIHJldHVybiB2
YWxpZCBkYXRhCj4gCQkgKiBkZXNwaXRlIEVDQyBlcnJvcnMuCj4gCQkgKi8KPiAJCWlmIChtdGRf
aXNfZWNjZXJyKHJldCkpCj4gCQkJanVzdC1jb21wbGFpbigpOwo+IAl9Cj4gCj4gVGhpcyBzbmlw
cGV0IG1ha2VzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIGFueSAiY29udHJvbGxlci9idXMKPiB0aW1l
b3V0L2Vycm9yIDogZGF0YSBjb3VsZCBub3QgYmUgcmV0cmlldmVkIiBhbmQgIkVDQyBlcnJvciwg
bWF5YmUgd2UKPiBjYW4gc3RpbGwgcmVhZCBpdCBhbmQgdHJ5IHRvIHVuZGVyc3RhbmQgKHJpc2t5
LCBtdXN0IGJlIHdhcm5lZCkiLgo+IAoKVGhhdCBzZWVtcyBnb29kIHRvIG1lLiBJIHdpbGwgZml4
IGl0IGxhdGVyLgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKPj4KPj4+IAkJaWYgKG10ZF9pc19l
Y2NlcnIoKSkKPj4+IAkJCWNvbXBsYWluOwo+Pj4gCX0KPj4+IAkJCj4+Pj4gCX0gZWxzZSBpZiAo
bXRkX2lzX2VjY2VycihyZXQpKSB7Cj4+Pj4gCQlkZXZfd2FybigiZWNjZXJyIGF0Li4uLiIpOwo+
Pj4+IAkJcmV0bGVuID0gcmV0bGVuID09IDAgPyBzaXplIDogcmV0bGVuOwo+Pj4+IAkJY29udGlu
dWU7Cj4+Pj4gCX0gZWxzZSB7Cj4+Pj4gCQlkZXZfZXJyKCJyZWFkIGZhaWx1cmUgYXQuLi4iKTsK
Pj4+PiAJCS8qIHRoaXMgem9uZSBpcyBicm9rZW4sIHRyeSBuZXh0IG9uZSAqLwo+Pj4+IAkJcmV0
dXJuIC1FTkVYVDsKPj4+PiAJfQo+Pj4+IH0KPj4+PiAgIAo+Pj4KPj4+Cj4+PiBUaGFua3MsCj4+
PiBNaXF1w6hsCj4+PiAgICAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
