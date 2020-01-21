Return-Path: <SRS0=c5zc=3K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94561C2D0CE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 15:34:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6921B20882
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 15:34:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="biEEgCxS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6921B20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zls+GzBEM0qdD/mYR3bhNvuRw5eYPOgUuXdRU/8yVDA=; b=biEEgCxSDbSDtA
	H54JdYBEr9mWThGjAv2YYY07OpBgfoj3w5KPw+zJi8yeh/nb4TLd25fp3GtDLgpFr3mRWnR5xSGxu
	1wYJc37Hc3R21RyX3Bm7ZkkdjtTr6fcVMiSiy/O+WE+MxFwx8W1TtH6xq7wdMhqzFCNryCMwXLYiF
	xizHVbXXTHacvkwiSuLKQUS98OaQpSsJR/V9iPNPba3yo5n9MOBjiY1kviJLB1PXZwIDjkDXCbB/x
	2Tp7SPrwlvlivUBnYuaRxZVJXkCfezOQmgoV8Kzi6FGpJBaAqYSwH4Z2vZeJwXIjqmjQaOY0g/4iH
	wBXxv/GvLWx7is0mEVxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itvYC-00078U-V1; Tue, 21 Jan 2020 15:34:44 +0000
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itvY8-00077j-7k; Tue, 21 Jan 2020 15:34:40 +0000
Subject: Re: [PATCH v1 06/11] Documentation: pstore/blk: blkoops: create
 document for pstore_blk
To: liaoweixiong <liaoweixiong@allwinnertech.com>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-7-git-send-email-liaoweixiong@allwinnertech.com>
 <b9cd734b-8bb1-5e26-a7ed-fbc79ab2d958@infradead.org>
 <c87bdf3a-f129-a2a7-40b2-2220f79b505a@allwinnertech.com>
 <40d7f57a-119e-e51f-99a5-63e85ab5ab91@infradead.org>
 <3337f687-a668-c058-178b-a1438641c519@allwinnertech.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <597e2b49-667a-490e-91b6-641ca25401d8@infradead.org>
Date: Tue, 21 Jan 2020 07:34:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <3337f687-a668-c058-178b-a1438641c519@allwinnertech.com>
Content-Language: en-US
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8yMS8yMCAxMjoxOSBBTSwgbGlhb3dlaXhpb25nIHdyb3RlOgo+IGhpIFJhbmR5IER1bmxh
cCwKPiAKPiBPbiAyMDIwLzEvMjEgMjozNiBQTSwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBPbiAx
LzIwLzIwIDk6MjMgUE0sIGxpYW93ZWl4aW9uZyB3cm90ZToKPj4+IGhpIFJhbmR5IER1bmxhcCwK
Pj4+Cj4+PiBPbiAyMDIwLzEvMjEgUE0xMjoxMywgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pj4+IEhp
LAo+Pj4+Cj4+Pj4gSSBoYXZlIHNvbWUgZG9jdW1lbnRhdGlvbiBjb21tZW50cyBmb3IgeW91Ogo+
Pj4+Cj4+Pj4KPj4+PiBPbiAxLzE5LzIwIDU6MDMgUE0sIFdlaVhpb25nIExpYW8gd3JvdGU6Cj4+
Pj4+IFRoZSBkb2N1bWVudCwgYXQgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9wc3RvcmUtYmxv
Y2sucnN0LCB0ZWxscyB1cwo+Pj4+PiBob3cgdG8gdXNlIHBzdG9yZS9ibGsgYW5kIGJsa29vcHMu
Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlaVhpb25nIExpYW8gPGxpYW93ZWl4aW9uZ0Bh
bGx3aW5uZXJ0ZWNoLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgIERvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUvcHN0b3JlLWJsb2NrLnJzdCB8IDI3OCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+Pj4+PiDCoCBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+Pj4+PiDCoCBmcy9wc3RvcmUv
S2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgIDIgKwo+Pj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDI4MSBpbnNlcnRpb25zKCspCj4+
Pj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3BzdG9y
ZS1ibG9jay5yc3QKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4t
Z3VpZGUvcHN0b3JlLWJsb2NrLnJzdCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3Jl
LWJsb2NrLnJzdAo+Pj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjU4NDE4ZDQyOWM1NQo+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvcHN0b3JlLWJsb2NrLnJzdAo+Pj4+PiArCj4+Pj4+ICsKPj4+
Pj4gK2RtZXNnX3NpemUKPj4+Pj4gK35+fn5+fn5+fn4KPj4+Pj4gKwo+Pj4+PiArVGhlIGNodW5r
IHNpemUgaW4gYnl0ZXMgZm9yIGRtZXNnKG9vcHMvcGFuaWMpLiBJdCAqKk1VU1QqKiBiZSBhIG11
bHRpcGxlIG9mCj4+Pj4+ICs0MDk2LiBJZiB5b3UgZG9uJ3QgbmVlZCBpdCwgc2FmZWx5IHNldCBp
dCAwIG9yIGlnbm9yZSBpdC4KPj4+Pgo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0IGl0IHRv
IDAgb3IgaWdub3JlIGl0Lgo+Pj4+Cj4+Pgo+Pj4gSSB3aWxsIGZpeCBpdCwgdGhhbmsgeW91Lgo+
Pj4KPj4+PiBUaGUgZXhhbXBsZSBhYm92ZSBpczrCoCBibGtvb3BzLmRtZXNnX3NpemU9NjQKPj4+
PiB3aGVyZSA2NCBpcyBub3QgYSBtdWx0aXBsZSBvZiA0MDk2LiAoPykKPj4+Pgo+Pj4KPj4+IFRo
ZSBtb2R1bGUgcGFyYW1ldGVyIGRtZXNnX3NpemUgaXMgaW4gdW5pdCBLQi4KPj4KPj4gSSBkaWRu
J3Qgc2VlIHRoYXQgZG9jdW1lbnRlZCBhbnl3aGVyZS4KPj4KPiAKPiBPaCwgc29ycnksIHRoYXQg
aXMgbXkgb3ZlcnNpZ2h0LiBJdCBzZWVtcyB0aGF0IG5vdCBvbmx5IHRoZSBvdGhlciBzaXplIGlu
dHJvZHVjdGlvbnMgYnV0IGFsc28gaW50cm9kdWN0aW9ucyBvbiBLY29uZmlnIHNob3VsZCBiZSBj
b3JyZWN0ZWQuIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggYW5kIGlzIHRoZSBmb2xsb3dpbmcgbW9kaWZp
Y2F0aW9uIE9LPwo+IAo+IFRoZSBjaHVuayBzaXplIGluIEtCIGZvciBkbWVzZyhvb3BzL3Bhbmlj
KS4gSXQgKipNVVNUKiogYmUgYSBtdWx0aXBsZSBvZiA0LgoKT0suCgoKPj4+Pj4gK0NvbXByZXNz
aW9uIGFuZCBoZWFkZXIKPj4+Pj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4gKwo+Pj4+
PiArQmxvY2sgZGV2aWNlIGlzIGxhcmdlIGVub3VnaCBmb3IgdW5jb21wcmVzc2VkIGRtZXNnIGRh
dGEuIEFjdHVhbGx5IHdlIGRvIG5vdAo+Pj4+PiArcmVjb21tZW5kIGRhdGEgY29tcHJlc3Npb24g
YmVjYXVzZSBwc3RvcmUvYmxrIHdpbGwgaW5zZXJ0IHNvbWUgaW5mb3JtYXRpb24gaW50bwo+Pj4+
PiArdGhlIGZpcnN0IGxpbmUgb2YgZG1lc2cgZGF0YS4gRm9yIGV4YW1wbGU6Ogo+Pj4+PiArCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBQYW5pYzogVG90YWwgMTYgdGltZXMKPj4+Pj4gKwo+Pj4+PiAr
SXQgbWVhbnMgdGhhdCBpdCdzIHRoZSAxNnRoIHRpbWVzIHBhbmljIGxvZyBzaW5jZSB0aGUgZmly
c3QgYm9vdGluZy4gU29tZXRpbWVzCj4+Pj4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lIG9mIGEgcGFuaWMgbG9n
IHNpbmNlIC4uLgo+Pj4+Cj4+Pgo+Pj4gU2hvdWxkIGl0IGJlIGxpa2UgdGhpcz8KPj4+IEl0IG1l
YW5zIHRoZSB0aW1lIG9mIGEgcGFuaWMgbG9nIHNpbmNlIHRoZSBmaXJzdCBib290aW5nLgo+Pgo+
PiBUaGF0IHNvdW5kcyBsaWtlIGNsb2NrIHRpbWUsIG5vdCB0aGUgbnVtYmVyIG9mIGluc3RhbmNl
cyBvciBvY2N1cnJlbmNlcy4KPj4KPiAKPiBJdCBpcyBhbiBvb3BzL3BhbmljIGNvdW50ZXIgdG9v
LiBIb3cgYWJvdXQgdGhpcz8KPiAKPiBJdCBtZWFucyB0aGF0IGl0J3MgT09QUy9QQU5JQyBmb3Ig
dGhlIDE2dGggdGltZSBzaW5jZSB0aGUgZmlyc3QgYm9vdGluZy4KCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2luY2UgdGhlIGxhc3QgYm9vdGluZyB7
b3IgYm9vdH0uCgp0aGFua3MuCi0tIAp+UmFuZHkKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
