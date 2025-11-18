Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03639CEDD8A
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihH7wJCvt2liqk/ndhOZbVZ2ygjI2rh4oOIX8+JlOaY=; b=zhUkHHalXzj5of
	N43nPYcrnMGGgTO0bA45FdWbDuhvnkJid42yyOpwlROlDvHEdF+QYH2TnePqisc9xPI5D72eZQxWx
	nb5zhaRX24LsC3JjhiB2h9YXN0+laMkQjdFvv90zPq0XOU/A24wCzVlTJmaLna8+wuEofL3L8+3EX
	UU+sjQ1MLdk3+FJyLtwUUv0LSF2YA0Y6hjiMpIE0sL01AKHDlQ1kTyeq9vl6Hk/Gz02Z7cDS43b4Y
	qr9MKrjjUoDPy3NMYqzW6DoiyBgcnIu6tpIFYz1lTCwymj4Do1LMBGiN6wBbeRbBYp+yXuZBW0XUW
	szMx2PTwK0m8xFt9HABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLyN-00000000TgE-46xI;
	Tue, 18 Nov 2025 13:42:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLyL-00000000Tfr-2uN5
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 13:42:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1607F40E90;
	Tue, 18 Nov 2025 13:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A79C2BCB5;
	Tue, 18 Nov 2025 13:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763473336;
	bh=2B3RBOSE7CmxmQYzvtH+hFm8q9HZRTVj8NG7RykYiWI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=naSJ79qdLKjk294duczCbiAbSE5o9fUwqTO8UYXwo2bOwQKNMoO7O7kNJiOqBEuTP
	 oXc6bw0WRc5esLsVaF0JZ+aAHaroxNByPNGlCpDw2gesNZlo9BBvi36cE2lr3vVzsR
	 IiwqI4P/kYSlXW8q8216N1O/Ad2L8mZDxP9EFxZlpfjaphsYoQHxsh9os8WOrTbYe+
	 Qgl/xkr8mH8p+YtPg2hbOERFsX0jxQjuJdrVKMVWjKypCXzz5L6zBb3BUVSzDGte+q
	 CU+/SViotc4kRI/oA1gODPmdSKfFu+aGFn59auP1BJuE1pVhavuIlUTMdFze1DjOKd
	 q/huUdixl/jHg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Santhosh Kumar K <s-k6@ti.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <broonie@kernel.org>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,  <p-mantena@ti.com>,
  <linux-spi@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <a-dutta@ti.com>,  <u-kumar1@ti.com>,
  <praneeth@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <87ecqcakjo.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 05
	Nov 2025 10:35:55 +0100")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
	<cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com> <87qzunt4n4.fsf@bootlin.com>
	<ea19bc64-a775-4309-8f3b-ce9dd8ac02ee@ti.com> <87ecqcakjo.fsf@bootlin.com>
Date: Tue, 18 Nov 2025 14:42:12 +0100
Message-ID: <mafs0ms4j4fuz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_054217_796624_E1D9701E 
X-CRM114-Status: GOOD (  26.09  )
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

T24gV2VkLCBOb3YgMDUgMjAyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4gSGVsbG8gU2FudGhv
c2gsCj4KPj4+PiAgICAgLSBPbiB0dW5pbmcgZmFpbHVyZSwgcmV0cnkgYnkgcmUtcnVubmluZyBz
cGlfbWVtX25lZWRzX3R1bmluZygpIHdpdGgKPj4+PiB0aGUgc2Vjb25kIGJlc3Qgc2V0IG9mIG9w
cyAobWF4IHRocm91Z2hwdXQgLSAxKQo+Pj4gSSB3b3VsZCBsaWtlIHRvIGNoYWxsZW5nZSB0aGlz
IG5lZWQuIENhbiB0aGUgc2FtZSBjYWxpYnJhdGlvbiBmYWlsIGlmCj4+PiBhdHRlbXB0ZWQgbXVs
dGlwbGUgdGltZXMgKGVnLiBiZWNhdXNlIG9mIHRoZSBoZWF0PykgSWYgeWVzLCB0aGVuIHdlIG5l
ZWQKPj4+IGEgZmFsbGJhY2sgaW5kZWVkLiBPdGhlcndpc2UsIEknZCBiZSBpbiBmYXZvciBvZiBq
dXN0IGZhaWxpbmcgdGhlCj4+PiBwcm9iZS4gQ2FsaWJyYXRpb24gaXMgYW4gb3B0LWluIC0+IHVz
ZXJzIG11c3QgYWxsb3cgYSBoaWdoZXIgZnJlcXVlbmN5Cj4+PiB0aGFuIHRoZXkgdXNlIHRvIGlu
IG9yZGVyIHRvIGVuYWJsZSB0aGUgZmVhdHVyZT8KPj4KPj4gSXQncyBwb3NzaWJsZSB0aGUgc2Ft
ZSBjYWxpYnJhdGlvbiB3aWxsIGZhaWwgaW50ZXJtaXR0ZW50bHkgZm9yCj4+IGRpZmZlcmVudCBy
ZWFzb25zICh0ZW1wZXJhdHVyZSBjaGFuZ2VzLCBhcyB5b3UgbWVudGlvbmVkKS4gSWYgdHVuaW5n
Cj4+IGZhaWxzLCB0aGUgZHJpdmVyIHNob3VsZCBmYWxsYmFjayB0byB0aGUgbm9uLVBIWSBmcmVx
dWVuY3kgc28gdGhlIGZsYXNoCj4+IGNvbnRpbnVlcyBvcGVyYXRpbmcgd2l0aCBzbG93ZXIgcmVh
ZHMvd3JpdGVzIHJhdGhlciB0aGFuIGZhaWxpbmcgdGhlCj4+IHByb2JlIChhdmFpbGFiaWxpdHkg
c2hvdWxkIGJlIHByaW9yaXRpemVkLCByaWdodD8pLgo+Cj4gQWdyZWVkLCBpZiB0aGUgdHVuaW5n
IG1heSBmYWlsIHdlIG11c3QgZmFsbGJhY2sgaW4gdGhpcyBjYXNlLiBIb3dldmVyCj4gdGhlcmUg
aXMgYW5vdGhlciBzaXR1YXRpb24gdGhhdCBtdXN0IGJlIGhhbmRsZWQgaW4gdGhpcyBjYXNlOiBv
bmNlCj4gdHVuaW5nIGlzIGRvbmUgYW5kIHdlIHdhbnQgdG8gdXNlIFBIWS1vcHRpbWl6ZWQgcGF0
aHMsIHdlIG11c3QgZmFsbGJhY2sKPiB0byBtb3JlIGJhc2ljL3Nsb3dlciByZWFkcyBpZiBmb3Ig
c29tZSBleHRlcm5hbCByZWFzb24sIHRoZXkgc3RhcnQKPiBmYWlsaW5nLCByaWdodD8KCkhvdyB3
b3VsZCB5b3UgZXZlbiBkZXRlY3QgdGhhdCB5b3VyIHR1bmluZyBpcyBvdXQtb2YtZGF0ZSBiZWNh
dXNlIG9mCnRlbXBlcmF0dXJlIGNoYW5nZXM/IFlvdSB3b3VsZCBuZWVkIHNvbWUgc29ydCBvZiBv
bi1mbGFzaCBFQ0MgdG8gZGV0ZWN0CnRoYXQuIEkgdGhpbmsgbWFueSBvZiB0aGUgZmxhc2hlcyB0
aGF0IHN1cHBvcnQgRERSIHJlYWRzIGF0IGhpZ2gKZnJlcXVlbmNpZXMgYWxzbyBoYXZlIEVDQywg
YnV0IEFGQUlLIHRoZSBTUEkgTk9SIGNvcmUgZG9lcyBub3Qgc3VwcG9ydAppdC4KCkFueXdheSwg
SSB0aGluayB3ZSBzaG91bGQgbGltaXQgdGhlIHNjb3BlIG9mIHRoZSBwcm9ibGVtLiBMZXQncyBm
aXJzdApzdGFydCB3aXRoIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSB0dW5pbmcgc3VwcG9ydHMg
dGhlIHdob2xlIG9wZXJhdGlvbgpyYW5nZSBvZiB0aGUgZGV2aWNlLiBUaGlzIHdhcyB0cnVlIGF0
IGxlYXN0IGZvciB0aGUgc3BpLWNhZGVuY2UtcXVhZHNwaQp0dW5pbmcgdGhhdCBJIHdvcmtlZCBv
biB3aGVuIEkgd2FzIGF0IFRJLiBUaGUgdHVuaW5nIHBhcmFtZXRlcnMgaGFkCmVub3VnaCBtYXJn
aW4gdG8gZW5zdXJlIGl0IHdvcmtlZCBmb3IgdGhlIGRldmljZSdzIHdob2xlIHRlbXBlcmF0dXJl
CnJhbmdlLgoKSWYgdGhlcmUgaXMgYSB0dW5pbmcgYWxnb3JpdGhtIHRoYXQgY2FuJ3QgZG8gdGhh
dCwgdGhlbiB3ZSBjYW4gZXh0ZW5kCnRoZSBjb3JlIHRvIGVpdGhlciBkbyBFQ0Mgb3IgcGVyaGFw
cyBsZXQgdGVtcGVyYXR1cmUgc2Vuc29ycyBzaWduYWwgdGhlCm5lZWQgZm9yIHJlLWNhbGlicmF0
aW9uLgoKQnV0IGZvciBub3cgSSB0aGluayBpdCBpcyBlYXNpZXN0IHRvIGp1c3QgaWdub3JlIHRo
ZSBwcm9ibGVtIGFuZCBmb2N1cwpvbiB0aGUgb3RoZXIgb25lcyBsaWtlIGhvdyB0byBnZXQgdGhl
IGNhbGlicmF0aW9uIHBhdHRlcm4gYW5kIGhvdyB0byBkbwp0aGUgdHVuaW5nLgoKPgo+IFRoZSBv
YnZpb3VzIGNob2ljZSBpbiB0aGlzIGNhc2Ugd291bGQgYmUgdG8gbGV0IHRoaXMgZXJyb3IgaGFu
ZGxpbmcgdG8KPiB0aGUgY29udHJvbGxlciBkcml2ZXIuIFJlLXVzaW5nIHRoZSBzYW1lIG9wZXJh
dGlvbiBhdCBhIGxvd2VyIHNwZWVkCj4gd291bGQgYmUgc3Vib3B0aW1hbCwgYmVjYXVzZSB0aGUg
ZmFzdGVzdCBvcGVyYXRpb24gYXQgYSBoaWdoIHNwZWVkIG1pZ2h0Cj4gbm90IGJlIHRoZSBtb3N0
IGVmZmljaWVudCBhdCBzbG93ZXIgc3BlZWRzIGR1ZSB0byB0aGUgbnVtYmVyIG9mIGR1bW15Cj4g
Y3ljbGVzIG5lZWRlZCwuIEJ1dCBJIGJlbGlldmUgdGhpcyBpcyBuZWdsaWdpYmxlIGJhc2VkIG9u
IHRoZSBmYWN0IHRoYXQKPiB3ZSBhbHJlYWR5IGFyZSBpbiBkZWdyYWRlZCBtb2RlIGF0IHRoYXQg
c3RhZ2UuCj4KPiBIb3dldmVyLCB0aGlzIG1heSBjb25mbGljdCB3aXRoOgo+IC0gcmVhZCByZXRy
aWVzCj4gLSBjb250aW51b3VzIHJlYWRzICg/KQo+Cj4gU28gaW4gcHJhY3RpY2UgdGhlIGZhbGxi
YWNrIG1pZ2h0IGJlIG5lZWRlZCBvbiB0aGUgU1BJIE5BTkQvTk9SIHNpZGUKPiAodGhpcyBjYW4g
YmUgZnVydGhlciBkaXNjdXNzZWQpLgo+Cj4gQnV0IG9uY2Ugd2Ugc29sdmUgdGhpcywgY29tZXMg
YSBzaW1pbGFyIHByb2JsZW0gb24gdGhlIHdyaXRlIHNpZGUuIEhvdwo+IGRvIHdlIGtub3cgaWYg
YSB3cml0ZSB3aWxsIG9yIGRpZCBmYWlsIGJlY2F1c2Ugb2YgYSB0ZW1wZXJhdHVyZSBjaGFuZ2U/
Cj4gV2hhdCBtYXkgYmUgdGhlIGhldXJpc3RpY3MgdG8gZmFsbGJhY2sgaW4gdGhpcyBjYXNlPwoK
U2FudGhvc2gsIGRvIHlvdSBoYXZlIGFueSBudW1iZXJzIG9uIHdyaXRlIHBlcmZvcm1hbmNlIGlt
cHJvdmVtZW50cz8gSQphbSBjdXJpb3VzIGlmIGl0IGlzIGV2ZW4gd29ydGggdGhlIGVmZm9ydC4K
Cj4KPiBUaGFua3MsCj4gTWlxdcOobAoKLS0gClJlZ2FyZHMsClByYXR5dXNoIFlhZGF2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
