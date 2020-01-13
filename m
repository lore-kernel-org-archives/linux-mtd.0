Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E416C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 14:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7200A2073D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 14:34:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxetZnHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7200A2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6An8F3F4gc/d2qdQ8tj56bGSqp7WwO5dmTEJg5kl6nA=; b=dxetZnHV8d8ama
	Y3UKx2CWFpza9lD+O4R7dVHfTr1vdPCieyw5pN/W38Xf5kK0+YQFMZpfY2AWpf7DEo2jb/aam9457
	2eiHvqUaq5FXh3NSJtnZZojEuBW0P/zKNk0yz+jfkMOVg7NvgCsoCXoS638qlJ+VIyxi+dpuNpPAX
	3JSSgyIv0M+ASWcIlRNW+yeQow3ozLyc4mKvk75XUGc7six2QiwTc9e8isk92tcYDo2p+L/2VBvEh
	cppY+Az860QO8b6QaVufnp7LNUqRSRJfqB49t2CIoBybyzpEh+BwoD3Url7jJ6ZNCuBVSvh2lcyLx
	8hHkH8OkACci5SBRPenQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir0nB-0001kz-H1; Mon, 13 Jan 2020 14:34:09 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir0n8-0001jW-N5
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 14:34:08 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 06:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; d="scan'208";a="218679884"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2020 06:34:02 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1ir0n5-0000dT-J4; Mon, 13 Jan 2020 16:34:03 +0200
Date: Mon, 13 Jan 2020 16:34:03 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
Message-ID: <20200113143403.GQ32742@smile.fi.intel.com>
References: <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
 <20200110193119.GI32742@smile.fi.intel.com>
 <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
 <20200113114256.GH3897@sirena.org.uk>
 <6dd45da9-9ccf-45f7-ed12-8f1406a0a56b@huawei.com>
 <20200113140627.GJ3897@sirena.org.uk>
 <CAHp75VfepiiVFLLmCwdBS0Z6tmR+XKBaOLg1qPPuz1McLjS=4Q@mail.gmail.com>
 <20200113142754.GL3897@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113142754.GL3897@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_063406_771004_2C12E94D 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: chenxiang66@hisilicon.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Garry <john.garry@huawei.com>, liusimin4@huawei.com,
 Linuxarm <linuxarm@huawei.com>, linux-spi <linux-spi@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 tudor.ambarus@microchip.com, Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMDI6Mjc6NTRQTSArMDAwMCwgTWFyayBCcm93biB3cm90
ZToKPiBPbiBNb24sIEphbiAxMywgMjAyMCBhdCAwNDoxNzozMlBNICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAxMywgMjAyMCBhdCA0OjA3IFBNIE1hcmsgQnJv
d24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgSmFuIDEzLCAyMDIw
IGF0IDAxOjAxOjA2UE0gKzAwMDAsIEpvaG4gR2Fycnkgd3JvdGU6Cj4gPiA+ID4gT24gMTMvMDEv
MjAyMCAxMTo0MiwgTWFyayBCcm93biB3cm90ZToKPiAKPiA+ID4gPiA+IFRoZSBpZGlvbWF0aWMg
YXBwcm9hY2ggYXBwZWFycyB0byBiZSBmb3IgaW5kaXZpZHVhbCBib2FyZCB2ZW5kb3JzCj4gPiA+
ID4gPiB0byBhbGxvY2F0ZSBJRHMsIHlvdSBkbyBlbmQgdXAgd2l0aCBtdWx0aXBsZSBJRHMgZnJv
bSBtdWx0aXBsZQo+ID4gPiA+ID4gdmVuZG9ycyBmb3IgdGhlIHNhbWUgdGhpbmcuCj4gCj4gPiA+
ID4gQnV0IEkgYW0gbm90IHN1cmUgaG93IGFwcHJvcHJpYXRlIHRoYXQgc2FtZSBhcHByb2FjaCB3
b3VsZCBiZSBmb3Igc29tZSAzcmQKPiA+ID4gPiBwYXJ0eSBtZW1vcnkgcGFydCB3aGljaCB3ZSdy
ZSBzaW1wbHkgd2lyaW5nIHVwIG9uIG91ciBib2FyZC4gTWF5YmUgaXQgaXMuCj4gCj4gPiA+IEl0
IHNlZW1zIHRvIGJlIHF1aXRlIGNvbW1vbiBmb3IgSW50ZWwgcmVmZXJlbmNlIGRlc2lnbnMgdG8g
YXNzaWduCj4gPiA+IEludGVsIElEcyB0byBub24tSW50ZWwgcGFydHMgb24gdGhlIGJvYXJkICh3
aGljaCBpcyB3aGVyZSBJCj4gPiA+IGJlY2FtZSBhd2FyZSBvZiB0aGlzIHByYWN0aWNlKS4KPiAK
PiA+IEJhc2ljYWxseSB2ZW5kb3Igb2YgY29tcG9uZW50IGluIHF1ZXN0aW9uIGlzIHJlc3BvbnNp
YmxlIGZvciBJRCwgYnV0Cj4gPiBpdCBzZWVtcyB0aGV5IHNpbXBsZSBkb24ndCBjYXJlLgo+IAo+
IEFGQUlDVCBhIGxvdCBvZiB0aGUgdGltZSBpdCBzZWVtcyB0byBiZSB0aGF0IHdob2V2ZXIgaXMg
d3JpdGluZwo+IHRoZSBzb2Z0d2FyZSBlbmRzIHVwIGFzc2lnbmluZyBhbiBJRCwgdGhhdCBtYXkg
bm90IGJlIHRoZSBzaWxpY29uCj4gdmVuZG9yLgoKLi4ud2hpY2ggaXMgZWZmZWN0aXZlbHkgYWJ1
c2luZyB0aGUgQUNQSSBJRCBhbGxvY2F0aW9uIHByb2NlZHVyZS4KCihBbmQgeWVzLCBJbnRlbCBp
dHNlbGYgZGlkIGl0IGluIHRoZSBwYXN0IOKAlCBzZWUgYmFkbHkgY3JlYXRlZCBBQ1BJIElEcwog
aW4gdGhlIGRyaXZlcnMpCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
