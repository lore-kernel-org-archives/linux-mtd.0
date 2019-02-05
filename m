Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69042C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 11:25:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C920207E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 11:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BkqT82Oq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C920207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JM0Z6PySGXuvtsfw+JA43oSEZKCd2in0W+y/Vkh2eWU=; b=BkqT82Oqny53uK
	zDc+W0OGwnAs1DjIjm6Kvgsolz2c5UZIABEJrSKcJUEBETd33pHCaUFpEop5gG8FAFDM9bxB7WlGF
	BmMZQF+3VoKTKg38ceaNTq6fxdObZixIUOuAg8bIWbR+6l/dv4pPB0pAx64wRX5qnK3Qt+t8BfuHD
	/+gWelOnTbh//VRRTzKCEw4NB+kQuDXSBEx/O56soz85faz8FQsWbMKYQ+Lma1JCK2KuWVde/P20Q
	Fd8TNTlK7E2QNuU7KMFxsDX7s5x2saiSAmzAs7dFlpX0m8AIYpjjm1C1nx92MZC++RjXilYIooQUA
	cpBIz0kCjMm3GGlCsgZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqyr7-000822-9C; Tue, 05 Feb 2019 11:25:33 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqyqu-0007do-P9
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 11:25:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FB7C80D;
 Tue,  5 Feb 2019 03:25:18 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD043F675;
 Tue,  5 Feb 2019 03:25:18 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id B691A6800F2; Tue,  5 Feb 2019 11:25:16 +0000 (GMT)
Date: Tue, 5 Feb 2019 11:25:16 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH 1/6] mtd: afs: simplify partition parsing
Message-ID: <20190205112516.GP25147@e110455-lin.cambridge.arm.com>
References: <20190128135449.15555-1-linus.walleij@linaro.org>
 <20190128135449.15555-2-linus.walleij@linaro.org>
 <20190131171327.GM25147@e110455-lin.cambridge.arm.com>
 <20190131184449.6d2ff0af@bbrezillon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190131184449.6d2ff0af@bbrezillon>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_032521_161636_0B6EC9B9 
X-CRM114-Status: GOOD (  23.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut@gmail.com>, Ryan Harkin <ryan.harkin@linaro.org>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDY6NDU6MDNQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IEhpIExpdml1LAo+IAo+IE9uIFRodSwgMzEgSmFuIDIwMTkgMTc6MTM6MjcgKzAw
MDAKPiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSBM
aW51cywKPiA+IAo+ID4gT24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMDI6NTQ6NDRQTSArMDEwMCwg
TGludXMgV2FsbGVpaiB3cm90ZToKPiA+ID4gVGhpcyBzaW1wbGlmaWVzIHRoZSBBRlMgcGFydGl0
aW9uIHBhcnNpbmcgdG8gbWFrZSB0aGUgY29kZQo+ID4gPiBtb3JlIHN0cmFpZ2h0LWZvcndhcmQg
YW5kIHJlYWRhYmxlLgo+ID4gPiAKPiA+ID4gQmVmb3JlIHRoaXMgcGF0Y2ggdGhlIGNvZGUgdHJp
ZWQgdG8gY2FsY3VsYXRlIHRoZSBtZW1vcnkgcmVxdWlyZWQKPiA+ID4gdG8gaG9sZCB0aGUgcGFy
dGl0aW9uIGluZm8gYnkgYWRkaW5nIHVwIHRoZSBzaXplcyBvZiB0aGUgc3RyaW5ncwo+ID4gPiBv
ZiB0aGUgbmFtZXMgYW5kIGFkZGluZyB0aGF0IHRvIGEgc2luZ2xlIG1lbW9yeSBhbGxvY2F0aW9u
LAo+ID4gPiBpbmRleGluZyB0aGUgbmFtZSBwb2ludGVycyBpbiBmcm9udCBvZiB0aGUgc3RydWN0
IG10ZF9wYXJ0aXRpb24KPiA+ID4gYWxsb2NhdGlvbnMgc28gYWxsIGFsbG9jYXRlZCBkYXRhIHdh
cyBpbiBvbmUgY2h1bmsuCj4gPiA+IAo+ID4gPiBUaGlzIGlzIG92ZXJ6ZWFsb3VzLiBJbnN0ZWFk
IHVzZSBrc3RyZHVwIGFuZCBiYWlsIG91dCwKPiA+ID4ga2ZyZWUoKTppbmcgdGhlIG1lbW9yeSB1
c2VkIGZvciBNVEQgcGFydGl0aW9ucyBhbmQgbmFtZXMgYWxpa2UKPiA+ID4gb24gdGhlIGVycm9y
cGF0aC4KPiA+ID4gCj4gPiA+IEluIHRoZSBwcm9jZXNzIHJlbmFtZSB0aGUgaW5kZXggdmFyaWFi
bGUgZnJvbSBpZHggdG8gaS4KPiA+ID4gCj4gPiA+IENjOiBSeWFuIEhhcmtpbiA8cnlhbi5oYXJr
aW5AbGluYXJvLm9yZz4KPiA+ID4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29t
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFy
by5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvcGFyc2Vycy9hZnMuYyB8IDY3ICsr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLSAgCj4gPiAKPiA+IFdoYXQga2Vy
bmVsIGlzIHRoaXMgc2VyaWVzIGJhc2VkIG9uPyBDdXJyZW50IFRvcnZhbGRzJyB0cmVlIGhhcyB0
aGUKPiA+IGFmcy5jIGZpbGUgaW4gZHJpdmVycy9tdGQgYW5kIG5vdCBpbiBkcml2ZXJzL210ZC9w
YXJzZXJzLy4gSXMgdGhlcmUgYQo+ID4gcGF0Y2ggdGhhdCBJJ20gbWlzc2luZyBtb3ZpbmcgdGhp
bmdzIGFyb3VuZD8KPiAKPiBJdCBkZXBlbmRzIG9uIHRoaXMgc2VyaWVzIFsxXSAobWVudGlvbmVk
IGluIHRoZSBjb3ZlciBsZXR0ZXIpLgoKRnVubnkgdGhhdCwgYnV0IHRoZSBjb3ZlciBsZXR0ZXIg
d2FzIG1pc3NpbmcgZnJvbSB0aGUgc2VyaWVzIEkndmUKcmVjZWl2ZWQgOikKClRoYW5rcyBmb3Ig
dGhlIGluZm8hCgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IAo+IFJlZ2FyZHMsCj4gCj4gQm9yaXMK
PiAKPiBbMV1odHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlz
dC8/c2VyaWVzPTg3NzYwCgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2Ug
dG8gfAp8IGZpeCB0aGUgd29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUg
dGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OE
KV8vwq8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
