Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48295C352BE
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 01:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E53C2076B
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 01:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhEX7HP2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E53C2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JUm3uuF0sH81ZzBKoAZnT30QkDkp7s/xBu/3GGyyNSY=; b=WhEX7HP2/a4qkVNj9UNUvtYUZ
	hyo1PM5HY686AWetM3U5silqKxUoYRRh3n5o6sFhijA16VAe/Of2j4T6anfIddmjXB4Eh0rbc/oh2
	msTluBzXlOmZX+HIWCe7g49MJPvvh1tITiJUiCz5jKLnv/LtflGNb+JM7XpEL0rh90vl02AseXrSN
	2x53rFPiQtkXzNkuXk3L6Y4JPhvImI8hoqpJn8I9kyFNmTVLy0YPKaejtt71YNWO3pPVOhTQOnP54
	vm5I6MOumKT13uXEwjL6oXjnrf88pO15KGXQn8eE1kZXqDbeVlEmJxcsKDwkXh5QgK9w02rIYfrB7
	tKJEQ38lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOXDM-0000ZV-Ui; Wed, 15 Apr 2020 01:51:44 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOXDJ-0000ZB-BO
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 01:51:43 +0000
IronPort-SDR: kKyN14cqE8feYyUg+1t9BkqWwb8jcvud/sO6e3qMhF4tjWCzsd4TFGtrI497krsHRRMmaYRPXf
 wg8Cd5fnHE5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 18:51:40 -0700
IronPort-SDR: oNyv8pcwMJmynapfKtQ0XsbFivhe1B0qmEbjepMC1qvn4eCXwy6Ki4qR6KZypWCVy2mi8zrETg
 d/N11J3ZPtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; d="scan'208";a="288403966"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2020 18:51:39 -0700
Received: from [10.213.147.143] (thiphuo2-mobl4.ccr.corp.intel.com
 [10.213.147.143])
 by linux.intel.com (Postfix) with ESMTP id 2640E5802C9;
 Tue, 14 Apr 2020 18:51:23 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: Add YAML for Nand Flash
 Controller support
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200414022433.36622-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200414022433.36622-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200414090459.3c37c961@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <9b638a65-04b7-5708-ea00-0e6dd47bab8c@linux.intel.com>
Date: Wed, 15 Apr 2020 09:51:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414090459.3c37c961@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_185141_404760_BDBF27E8 
X-CRM114-Status: GOOD (  13.70  )
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
 arnd@arndb.de, richard@nod.at, qi-ming.wu@intel.com, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgogwqDCoMKgIFRoYW5rIHlvdSBzbyBtdWNoIGZvciB0aGUgcmV2aWV3IGNvbW1l
bnRzIGFuZCB5b3VyIHRpbWUuLi4KCk9uIDEgNC80LzIwMjAgMzowNCBwbSwgQm9yaXMgQnJlemls
bG9uIHdyb3RlOgo+IE9uIFR1ZSwgMTQgQXByIDIwMjAgMTA6MjQ6MzIgKzA4MDAKPiAiUmFtdXRo
ZXZhcixWYWRpdmVsIE11cnVnYW5YIgo+IDx2YWRpdmVsLm11cnVnYW54LnJhbXV0aGV2YXJAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPgo+PiBGcm9tOiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdh
biA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPj4KPj4gQWRk
IFlBTUwgZmlsZSBmb3IgZHQtYmluZGluZ3MgdG8gc3VwcG9ydCBOQU5EIEZsYXNoIENvbnRyb2xs
ZXIKPj4gb24gSW50ZWwncyBMaWdodG5pbmcgTW91bnRhaW4gU29DLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhl
dmFyQGxpbnV4LmludGVsLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2ludGVsLGxnbS1uYW5kLnlhbWwgICAgfCA2MSArKysrKysrKysrKysrKysrKysrKysrCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbnRlbCxsZ20tbmFuZC55
YW1sCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL2ludGVsLGxnbS1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2ludGVsLGxnbS1uYW5kLnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi4zNjFlNTA1MWM2MDIKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2ludGVsLGxnbS1uYW5kLnlhbWwK
Pj4gQEAgLTAsMCArMSw2MSBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvbXRkL2ludGVsLGxnbS1uYW5kLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IEludGVsIExH
TSBTb0MgTkFORCBDb250cm9sbGVyIERldmljZSBUcmVlIEJpbmRpbmdzCj4+ICsKPj4gK2FsbE9m
Ogo+PiArICAtICRyZWY6ICJuYW5kLWNvbnRyb2xsZXIueWFtbCIKPj4gKwo+PiArbWFpbnRhaW5l
cnM6Cj4+ICsgIC0gUmFtdXRoZXZhciBWYWRpdmVsIE11cnVnYW4gPHZhZGl2ZWwubXVydWdhbngu
cmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+Cj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNv
bXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IGludGVsLGxnbS1uYW5kCj4gaW50ZWwsbGdtLW5hbmQt
Y29udHJvbGxlcgoKTm90ZWQsIHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0IHBhdGNoLgoKUmVnYXJk
cwpWYWRpdmVsCj4+ICsKPj4gKyAgcmVnOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAg
Y2xvY2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgZG1hczoKPj4gKyAgICBtYXhJ
dGVtczogMgo+PiArCj4+ICsgIGRtYS1uYW1lczoKPj4gKyAgICBlbnVtOgo+PiArICAgICAgLSBy
eAo+PiArICAgICAgLSB0eAo+PiArCj4+ICsgIHBpbmN0cmwtbmFtZXM6IHRydWUKPj4gKwo+PiAr
cGF0dGVyblByb3BlcnRpZXM6Cj4+ICsgICJecGluY3RybC1bMC05XSskIjogdHJ1ZQo+PiArCj4+
ICsgICJebmFuZEBbYS1mMC05XSskIjoKPj4gKyAgICB0eXBlOiBvYmplY3QKPj4gKyAgICBwcm9w
ZXJ0aWVzOgo+PiArICAgICAgcmVnOgo+PiArICAgICAgICBtaW5pbXVtOiAwCj4+ICsgICAgICAg
IG1heGltdW06IDcKPj4gKwo+PiArICAgICAgbmFuZC1lY2MtbW9kZTogdHJ1ZQo+PiArCj4+ICsg
ICAgICBuYW5kLWVjYy1hbGdvOgo+PiArICAgICAgICBjb25zdDogaHcKPj4gKwo+PiArICAgIGFk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21w
YXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsgIC0gY2xvY2tzCj4+ICsgIC0gY2xvY2stbmFtZXMKPj4g
KyAgLSBkbWFzCj4+ICsKPj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+PiArCj4+ICsu
Li4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
