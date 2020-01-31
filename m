Return-Path: <SRS0=9794=3U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC33C33CB2
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 10:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7275620705
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 10:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CitHIGZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7275620705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3xUaZd3GTZY7wIhIAifqTEBb488V7AAyCcMIAEkgZOI=; b=CitHIGZZBqRUH663hqNYv0/sJ
	CNPK49psM9yBA8tcBlAcp2NVDrvCDXQKKI+oDoupOryqgOHGTrHogKQKOU8U605F75v4pRRi9GT4w
	oLgeQGwgDWUNfjdyIVpnJaMCENfLjO2225Vfq5IBlyRGfcdEemGp269yfkpUzCEYemtRXZqc+EcK6
	nsLa6WLs+0v/1jlH+Czpmd5S/HkwvnrBTS7j5fDXqotfTuQv8oZ/7OU8UTTKNGxQID63RAA/UeBC5
	BNkmQ/8yHVs/VCf4pYZWtTLX0K+JG2/1MqojkBKF+NSopTBpaapONvDkwpEMpAyXmGlDzd9OjiEPS
	XkStly6NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixTEQ-0002Vw-Na; Fri, 31 Jan 2020 10:08:58 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixTEK-0002Uk-Sj
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2020 10:08:54 +0000
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id B3DECD5AAAA281B00F0D;
 Fri, 31 Jan 2020 10:08:20 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml702-cah.china.huawei.com (10.201.108.43) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 31 Jan 2020 10:08:21 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 Jan
 2020 10:08:20 +0000
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown
 <broonie@kernel.org>
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
 <20200113143403.GQ32742@smile.fi.intel.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <0252a76d-7e2b-2c70-8b1b-0d041d972098@huawei.com>
Date: Fri, 31 Jan 2020 10:08:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200113143403.GQ32742@smile.fi.intel.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_020853_077266_742E1664 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Jiancheng Xue <xuejiancheng@hisilicon.com>, chenxiang66@hisilicon.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 tudor.ambarus@microchip.com, Linuxarm <linuxarm@huawei.com>,
 linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 liusimin4@huawei.com, Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTMvMDEvMjAyMCAxNDozNCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIE1vbiwgSmFu
IDEzLCAyMDIwIGF0IDAyOjI3OjU0UE0gKzAwMDAsIE1hcmsgQnJvd24gd3JvdGU6Cj4+IE9uIE1v
biwgSmFuIDEzLCAyMDIwIGF0IDA0OjE3OjMyUE0gKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToKPj4+IE9uIE1vbiwgSmFuIDEzLCAyMDIwIGF0IDQ6MDcgUE0gTWFyayBCcm93biA8YnJvb25p
ZUBrZXJuZWwub3JnPiB3cm90ZToKPj4+PiBPbiBNb24sIEphbiAxMywgMjAyMCBhdCAwMTowMTow
NlBNICswMDAwLCBKb2huIEdhcnJ5IHdyb3RlOgo+Pj4+PiBPbiAxMy8wMS8yMDIwIDExOjQyLCBN
YXJrIEJyb3duIHdyb3RlOgo+Pgo+Pj4+Pj4gVGhlIGlkaW9tYXRpYyBhcHByb2FjaCBhcHBlYXJz
IHRvIGJlIGZvciBpbmRpdmlkdWFsIGJvYXJkIHZlbmRvcnMKPj4+Pj4+IHRvIGFsbG9jYXRlIElE
cywgeW91IGRvIGVuZCB1cCB3aXRoIG11bHRpcGxlIElEcyBmcm9tIG11bHRpcGxlCj4+Pj4+PiB2
ZW5kb3JzIGZvciB0aGUgc2FtZSB0aGluZy4KPj4KPj4+Pj4gQnV0IEkgYW0gbm90IHN1cmUgaG93
IGFwcHJvcHJpYXRlIHRoYXQgc2FtZSBhcHByb2FjaCB3b3VsZCBiZSBmb3Igc29tZSAzcmQKPj4+
Pj4gcGFydHkgbWVtb3J5IHBhcnQgd2hpY2ggd2UncmUgc2ltcGx5IHdpcmluZyB1cCBvbiBvdXIg
Ym9hcmQuIE1heWJlIGl0IGlzLgo+Pgo+Pj4+IEl0IHNlZW1zIHRvIGJlIHF1aXRlIGNvbW1vbiBm
b3IgSW50ZWwgcmVmZXJlbmNlIGRlc2lnbnMgdG8gYXNzaWduCj4+Pj4gSW50ZWwgSURzIHRvIG5v
bi1JbnRlbCBwYXJ0cyBvbiB0aGUgYm9hcmQgKHdoaWNoIGlzIHdoZXJlIEkKPj4+PiBiZWNhbWUg
YXdhcmUgb2YgdGhpcyBwcmFjdGljZSkuCj4+Cj4+PiBCYXNpY2FsbHkgdmVuZG9yIG9mIGNvbXBv
bmVudCBpbiBxdWVzdGlvbiBpcyByZXNwb25zaWJsZSBmb3IgSUQsIGJ1dAo+Pj4gaXQgc2VlbXMg
dGhleSBzaW1wbGUgZG9uJ3QgY2FyZS4KPj4KPj4gQUZBSUNUIGEgbG90IG9mIHRoZSB0aW1lIGl0
IHNlZW1zIHRvIGJlIHRoYXQgd2hvZXZlciBpcyB3cml0aW5nCj4+IHRoZSBzb2Z0d2FyZSBlbmRz
IHVwIGFzc2lnbmluZyBhbiBJRCwgdGhhdCBtYXkgbm90IGJlIHRoZSBzaWxpY29uCj4+IHZlbmRv
ci4KPiAKPiAuLi53aGljaCBpcyBlZmZlY3RpdmVseSBhYnVzaW5nIHRoZSBBQ1BJIElEIGFsbG9j
YXRpb24gcHJvY2VkdXJlLgo+IAo+IChBbmQgeWVzLCBJbnRlbCBpdHNlbGYgZGlkIGl0IGluIHRo
ZSBwYXN0IOKAlCBzZWUgYmFkbHkgY3JlYXRlZCBBQ1BJIElEcwo+ICAgaW4gdGhlIGRyaXZlcnMp
Cj4gCgpIaSBNYXJrLAoKQWJvdXQgdGhpcyB0b3BpYyBvZiBBQ1BJIGhhdmluZyBubyBtZXRob2Qg
dG8gZGVzY3JpYmUgZGV2aWNlIGJ1c3dpZHRoIGluIAp0aGUgcmVzb3VyY2UgZGVzY3JpcHRvciwg
aXQgbWF5IGJlIGFuIGlkZWEgZm9yIG1lIHRvIHJhaXNlIGEgVGlhbm9jb3JlIApmZWF0dXJlIHJl
cXVlc3QgQCBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvCgpUaGVyZSBzZWVtcyB0byBi
ZSBhbiBhdmVudWUgdGhlcmUgZm9yIHJhaXNpbmcgbmV3IGZlYXR1cmVzIGZvciB0aGUgc3BlYy4g
CkkgKG9yIG15IG9yZykgY2FuJ3QgcGFydGljaXBhdGUgaW4gQVdTRy4KCkkgd291bGQgaGF2ZSBu
byBjb25jcmV0ZSBwcm9wb3NhbCBmb3Igc3BlYyB1cGRhdGUgZm9yIG5vdywgdGhvdWdoLiAKSG9w
ZWZ1bGx5IG90aGVycyB3aXRoIG1vcmUgZXhwZXJ0aXNlIGNvdWxkIGNvbnRyaWJ1dGUuCgpJbiB0
aGUgbWVhbnRpbWUsIEkgaGF2ZSBhbiBSRkMgZm9yIHVzaW5nIERNSSB0byBxdWlyayBzdXBwb3J0
IGZvciB0aGlzIApvbiB0aGUgZHJpdmVyIC0gSSBjYW4gc2hhcmUgd2hlbiByZWFkeS4KClRoYW5r
cywKSm9obgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
