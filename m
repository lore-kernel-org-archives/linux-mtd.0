Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED2DC3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 08:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D922145D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 08:52:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QdbashET"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5D922145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hflw8+26sH8lByhqG25dwNyTZM9TyYyrZud3Cj6Fzq0=; b=QdbashETyst/eyqeAvxpiPsYG
	ju/anA7UFdklskmmxA7Z1CNXmYKGf59G83vEfmLoiikG1FJaerXCf4IpVcrf6tXDEj2mngdkJ0qxc
	JMaLv+MdvdHW123hZg1N9IzVKCpgTNLZLS5wN4rW6K3XDH+GitHbp8dk9mxja9JYJyqF/VCiVys8F
	POpSCwLaGgv4m4k9oOlXgFYLO5JT4BKgM3z65VSIDr1Wj120PKCv01AoAkJSQ+iHIjjzyS7hMHJT+
	6AeRpweNEZCQd7WBSnoL+13/9iU5Xb4iWbWEWapj6vJeS8IRVl2r8+7UQMCUkYVuI0s3Qg6A0nTfY
	242WYf+Rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQS9y-0001Bc-NP; Mon, 20 Apr 2020 08:52:10 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQS9v-0001AI-0Z
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 08:52:08 +0000
IronPort-SDR: RwUXljRVL8kDRmx2T46FyBptZh6WicbFUwKHZNWVwI7w/jvTF+Cwexsh0nEQNd32kGzI7k5tmr
 JcFkXrO9mm6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 01:52:05 -0700
IronPort-SDR: a4Eg2d6xmIyLQNhuk3IUdkIwFTZ6KS18J6L0i5/tGdasi0tIKLFxqKcrFcXxezFSbjfA2ZkxZR
 FrL2tcDJJcFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="254875643"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 20 Apr 2020 01:52:05 -0700
Received: from [10.249.68.96] (vramuthx-mobl1.gar.corp.intel.com
 [10.249.68.96])
 by linux.intel.com (Postfix) with ESMTP id 2D39B5802C9;
 Mon, 20 Apr 2020 01:51:59 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <79e186a8-68fb-0e75-910b-9f1b40679ca2@linux.intel.com>
 <20200420094018.6fdbda68@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <65120cb5-9d8d-27a1-a7c1-1e88e18e00b6@linux.intel.com>
Date: Mon, 20 Apr 2020 16:51:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420094018.6fdbda68@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_015207_068262_684473EA 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at, qi-ming.wu@intel.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

IMKgIE9uIDIwLzQvMjAyMCAzOjQwIHBtLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cgo+IE9uIE1v
biwgMjAgQXByIDIwMjAgMTI6MTg6MzQgKzA4MDAKPiAiUmFtdXRoZXZhciwgVmFkaXZlbCBNdXJ1
Z2FuWCIKPiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6Cj4KPgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+Pj4+IGluZGV4IGE4MGE0NmJiNWI4Yi4uOWVm
YzRiYmFmNGEzIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tjb25maWcK
Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4+Pj4gQEAgLTQ1Nyw2ICs0
NTcsMTMgQEAgY29uZmlnIE1URF9OQU5EX0NBREVOQ0UKPj4+PiAgICAJICBFbmFibGUgdGhlIGRy
aXZlciBmb3IgTkFORCBmbGFzaCBvbiBwbGF0Zm9ybXMgdXNpbmcgYSBDYWRlbmNlIE5BTkQKPj4+
PiAgICAJICBjb250cm9sbGVyLgo+Pj4+ICAgIAo+Pj4+ICtjb25maWcgTVREX05BTkRfSU5URUxf
TEdNCj4+Pj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgTkFORCBjb250cm9sbGVyIG9uIEludGVs
IExHTSBTb0MiCj4+Pj4gKwlkZXBlbmRzIG9uIFg4Ngo+Pj4gRG8gd2UgaGF2ZSBhIGhhcmQgZGVw
ZW5kZW5jeSBvbiB4ODYgaGVyZT8gTWF5YmUgJ2RlcGVuZHMgb24gSEFTX01NSU8nCj4+PiB3b3Vs
ZCBiZSBlbm91Z2guCj4+IHllcyBCb3Jpcywgd2UgaGF2ZSBoYXJkIGRlcGVuZGVuY3kgb24geDg2
Lgo+IEdpdmVuIHRoYXQgdGhlIGRyaXZlciB3aWxsIGFsc28gYmUgdXNlZCBvbiBhIE1JUFMgcGxh
dGZvcm0gSSB3b3VsZCBzYXkKPiBubyA6UC4gSnVzdCB0byBiZSBjbGVhciwgSSB3YXMgc3VnZ2Vz
dGluZyB0byByZXBsYWNlIHRoZSBzb29uIHRvIGVtZXJnZQo+Cj4gCWRlcGVuZHMgb24gWDg2IHx8
IE1JUFMgfHwgQ09NUElMRV9URVNUCj4gCWRlcGVuZHMgSEFTX0lPTUVNCj4KPiBydWxlIGJ5Cj4K
PiAJZGVwZW5kcyBvbiBPRiB8fCBDT01QSUxFX1RFU1QKPiAJZGVwZW5kcyBIQVNfSU9NRU0KClRo
YW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24gIQoKWWVzLCB5b3UgYXJlIHJpZ2h0IHNpbmNlIE1J
UFMgYmFzZWQgU29DcyBhbHNvIHVzaW5nIHRoZSBzYW1lIGRyaXZlciwgc28gCndlIGNhbiBhZGQg
dGhlIGFib3ZlIHJ1bGUuCgpSZWdhcmRzClZhZGl2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
