Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C32C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 08:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940B220657
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 08:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXklP3NN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940B220657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgYqt1ARQRZqFXfM9U9QR8RaCMnfmTSiRursavk64h8=; b=qXklP3NNqz5MwQ
	7gC0KGkCb81ggV/5/X/Y8JjnbMANXrSHQvanih5yETYl+etmWJqXfUgt2W6p6I0asxzGMU1q25ThI
	lvoAMzBWsU/Zl6K3FsvQyYbQG5PoO7yRXqRMZCILBS1lWOkDK5jYusSQoo0QOtSGh9/FRG62tmh+l
	xuDYOmjMrSZoaRAWnhtUF7y7kNhxYATY8Fn8MqSffMRaIjyYo6RMQCGWL6KHjiZzHgaG2C/lpZNyW
	SPeI41/ACyopNXt/syR948p19Ykps1Nr5LQZA4cQ/rCuZV8hylxZQqjSrgFQzrroGASCz7dyQsV0f
	zE0soGaE+FfDiGkVChSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZVN2-0006tY-MB; Fri, 15 May 2020 08:07:04 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZVMx-0006sM-Jf
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 08:07:03 +0000
IronPort-SDR: QerRrXnR3onoFG7pvRpC8Vobk19tMUjW2uRwrhwKG0jonNEQ/p1LOYGxHsn8g1KxNgrt2dnSU6
 K7wdERwycy3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 01:06:57 -0700
IronPort-SDR: y1UJqPzbkrsTCq4XzGUKwEyG7DqyQY5ttccd+stBOvqgSOZtIqrtZgGAdio0BI/x+gY5HlMblj
 MYOuE+kpJedw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,394,1583222400"; d="scan'208";a="464826884"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 15 May 2020 01:06:56 -0700
Received: from [10.213.147.163] (vramuthx-mobl1.gar.corp.intel.com
 [10.213.147.163])
 by linux.intel.com (Postfix) with ESMTP id 361965804E0;
 Fri, 15 May 2020 01:06:43 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
To: Rob Herring <robh@kernel.org>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200514125709.GA8436@bogus>
 <dc51e6af-bda8-d8b9-1782-f5c4d5d3fed7@linux.intel.com>
Message-ID: <0ca30041-b2eb-5cff-9a90-f3021bc82622@linux.intel.com>
Date: Fri, 15 May 2020 16:06:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dc51e6af-bda8-d8b9-1782-f5c4d5d3fed7@linux.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_010659_664246_D53804C4 
X-CRM114-Status: GOOD (  10.96  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 devicetree@vger.kernel.org, richard@nod.at, brendanhiggins@google.com,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 andriy.shevchenko@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKT24gMTUvNS8yMDIwIDEwOjA4IGFtLCBSYW11dGhldmFyLCBWYWRpdmVsIE11cnVn
YW5YIHdyb3RlOgo+IEhpIFJvYiwKPiAKPiBPbiAxNC81LzIwMjAgODo1NyBwbSwgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4+IE9uIFdlZCwgMTMgTWF5IDIwMjAgMTg6NDY6MTQgKzA4MDAsIFJhbXV0aGV2
YXIsVmFkaXZlbCBNdXJ1Z2FuWCB3cm90ZToKPj4+IEZyb206IFJhbXV0aGV2YXIgVmFkaXZlbCBN
dXJ1Z2FuIAo+Pj4gPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+
Cj4+Pgo+Pj4gQWRkIFlBTUwgZmlsZSBmb3IgZHQtYmluZGluZ3MgdG8gc3VwcG9ydCBOQU5EIEZs
YXNoIENvbnRyb2xsZXIKPj4+IG9uIEludGVsJ3MgTGlnaHRuaW5nIE1vdW50YWluIFNvQy4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiAKPj4+IDx2YWRp
dmVsLm11cnVnYW54LnJhbXV0aGV2YXJAbGludXguaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiDCoCAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW50ZWwsbGdtLW5hbmQueWFtbMKgwqDCoCB8IDgz
IAo+Pj4gKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDgzIGlu
c2VydGlvbnMoKykKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPj4+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW50ZWwsbGdtLW5hbmQueWFtbAo+Pj4KPj4KPj4KPj4g
TXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlv
dXIgcGF0Y2g6Cj4+Cj4+IC9idWlsZHMvcm9iaGVycmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbnRlbCxsZ20tbmFuZC5leGFtcGxlLmR0
LnlhbWw6IAo+PiBuYW5kLWNvbnRyb2xsZXJAZTBmMDAwMDA6ICdkbWFzJyBpcyBhIGRlcGVuZGVu
Y3kgb2YgJ2RtYS1uYW1lcycKPj4KPj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cGF0Y2gvMTI4OTE2MAo+Pgo+PiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19j
aGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCj4+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3Vy
ZSBkdC1zY2hlbWEgaXMgdXAgdG8gZGF0ZToKPj4KPj4gcGlwMyBpbnN0YWxsIAo+PiBnaXQraHR0
cHM6Ly9naXRodWIuY29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS5naXRAbWFzdGVyIC0tdXBn
cmFkZQo+Pgo+PiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC5TdXJlLCB3aWxsIGNoZWNrIGFu
ZCByZS1zdWJtaXQsIFRoYW5rcyEKClJlZ2FyZHMKVmFkaXZlbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
