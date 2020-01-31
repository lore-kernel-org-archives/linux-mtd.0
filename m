Return-Path: <SRS0=9794=3U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959CCC33CB2
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 12:03:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6821E20707
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 12:03:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RRuBh1EA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6821E20707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vr6ZEZS1+5S0I0pIC1tO64dibFRpz6hNPir9l/9i7bk=; b=RRuBh1EAMiN00OWOTxg4MJeVT
	K1TSOQPcTUnNGfJVmtYPzUzZiAl5OtXB8ShWaILxfCF/0QZEag9pQi3KV14c1cDseV+tBQSigk6s+
	iZt/UHm8O24cOd74xOx7uJEy5y1vIos/qBUqFs3wFS/m+CFfPigtXHkmHP7wom3xiHM9lXWEdLXiK
	k5WaL5Rrh4QVzvL+4r71gO+MFJoIt0Kk3YjvScQL0i2Ei6exp+fRe6omDHlN1G2vtzAeZbzJXrkyE
	ke3Cp+Kcv4E0eRvvWMpvbVIaaITfWl1paHXlRdZVtLWQcQs6ABZeSFLOYoFTm9wsFE+4uJx8SEOYb
	CO2OfK5Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixV1D-0007Qm-Bq; Fri, 31 Jan 2020 12:03:27 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixV1A-0007Q7-OJ
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2020 12:03:26 +0000
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 2C79BC846AEEC4B266A4;
 Fri, 31 Jan 2020 12:03:21 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 31 Jan 2020 12:03:20 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 Jan
 2020 12:03:20 +0000
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
 <0252a76d-7e2b-2c70-8b1b-0d041d972098@huawei.com>
 <CAHp75Ve=ZwJe2XV8Y1UN6sMe1ZHOBwUtRUD=aGqhR4Gc7BNUcg@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <136bd652-dcb9-3efa-a92f-2263cbf840ad@huawei.com>
Date: Fri, 31 Jan 2020 12:03:19 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve=ZwJe2XV8Y1UN6sMe1ZHOBwUtRUD=aGqhR4Gc7BNUcg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_040324_938264_567F3AE3 
X-CRM114-Status: GOOD (  18.81  )
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
 Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, tudor.ambarus@microchip.com,
 Linuxarm <linuxarm@huawei.com>, linux-spi <linux-spi@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 liusimin4@huawei.com, Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMzEvMDEvMjAyMCAxMTozOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIEZyaSwgSmFu
IDMxLCAyMDIwIGF0IDEyOjA4IFBNIEpvaG4gR2FycnkgPGpvaG4uZ2FycnlAaHVhd2VpLmNvbT4g
d3JvdGU6Cj4+Cj4+IE9uIDEzLzAxLzIwMjAgMTQ6MzQsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToK
Pj4+IE9uIE1vbiwgSmFuIDEzLCAyMDIwIGF0IDAyOjI3OjU0UE0gKzAwMDAsIE1hcmsgQnJvd24g
d3JvdGU6Cj4+Pj4gT24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMDQ6MTc6MzJQTSArMDIwMCwgQW5k
eSBTaGV2Y2hlbmtvIHdyb3RlOgo+Pj4+PiBPbiBNb24sIEphbiAxMywgMjAyMCBhdCA0OjA3IFBN
IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIEph
biAxMywgMjAyMCBhdCAwMTowMTowNlBNICswMDAwLCBKb2huIEdhcnJ5IHdyb3RlOgo+Pj4+Pj4+
IE9uIDEzLzAxLzIwMjAgMTE6NDIsIE1hcmsgQnJvd24gd3JvdGU6Cj4+Pj4KPj4+Pj4+Pj4gVGhl
IGlkaW9tYXRpYyBhcHByb2FjaCBhcHBlYXJzIHRvIGJlIGZvciBpbmRpdmlkdWFsIGJvYXJkIHZl
bmRvcnMKPj4+Pj4+Pj4gdG8gYWxsb2NhdGUgSURzLCB5b3UgZG8gZW5kIHVwIHdpdGggbXVsdGlw
bGUgSURzIGZyb20gbXVsdGlwbGUKPj4+Pj4+Pj4gdmVuZG9ycyBmb3IgdGhlIHNhbWUgdGhpbmcu
Cj4+Pj4KPj4+Pj4+PiBCdXQgSSBhbSBub3Qgc3VyZSBob3cgYXBwcm9wcmlhdGUgdGhhdCBzYW1l
IGFwcHJvYWNoIHdvdWxkIGJlIGZvciBzb21lIDNyZAo+Pj4+Pj4+IHBhcnR5IG1lbW9yeSBwYXJ0
IHdoaWNoIHdlJ3JlIHNpbXBseSB3aXJpbmcgdXAgb24gb3VyIGJvYXJkLiBNYXliZSBpdCBpcy4K
Pj4+Pgo+Pj4+Pj4gSXQgc2VlbXMgdG8gYmUgcXVpdGUgY29tbW9uIGZvciBJbnRlbCByZWZlcmVu
Y2UgZGVzaWducyB0byBhc3NpZ24KPj4+Pj4+IEludGVsIElEcyB0byBub24tSW50ZWwgcGFydHMg
b24gdGhlIGJvYXJkICh3aGljaCBpcyB3aGVyZSBJCj4+Pj4+PiBiZWNhbWUgYXdhcmUgb2YgdGhp
cyBwcmFjdGljZSkuCj4+Pj4KPj4+Pj4gQmFzaWNhbGx5IHZlbmRvciBvZiBjb21wb25lbnQgaW4g
cXVlc3Rpb24gaXMgcmVzcG9uc2libGUgZm9yIElELCBidXQKPj4+Pj4gaXQgc2VlbXMgdGhleSBz
aW1wbGUgZG9uJ3QgY2FyZS4KPj4+Pgo+Pj4+IEFGQUlDVCBhIGxvdCBvZiB0aGUgdGltZSBpdCBz
ZWVtcyB0byBiZSB0aGF0IHdob2V2ZXIgaXMgd3JpdGluZwo+Pj4+IHRoZSBzb2Z0d2FyZSBlbmRz
IHVwIGFzc2lnbmluZyBhbiBJRCwgdGhhdCBtYXkgbm90IGJlIHRoZSBzaWxpY29uCj4+Pj4gdmVu
ZG9yLgo+Pj4KPj4+IC4uLndoaWNoIGlzIGVmZmVjdGl2ZWx5IGFidXNpbmcgdGhlIEFDUEkgSUQg
YWxsb2NhdGlvbiBwcm9jZWR1cmUuCj4+Pgo+Pj4gKEFuZCB5ZXMsIEludGVsIGl0c2VsZiBkaWQg
aXQgaW4gdGhlIHBhc3Qg4oCUIHNlZSBiYWRseSBjcmVhdGVkIEFDUEkgSURzCj4+PiAgICBpbiB0
aGUgZHJpdmVycykKPj4+Cj4+Cj4+IEhpIE1hcmssCj4+CgpIaSBBbmR5LAoKPj4gQWJvdXQgdGhp
cyB0b3BpYyBvZiBBQ1BJIGhhdmluZyBubyBtZXRob2QgdG8gZGVzY3JpYmUgZGV2aWNlIGJ1c3dp
ZHRoIGluCj4+IHRoZSByZXNvdXJjZSBkZXNjcmlwdG9yLCBpdCBtYXkgYmUgYW4gaWRlYSBmb3Ig
bWUgdG8gcmFpc2UgYSBUaWFub2NvcmUKPj4gZmVhdHVyZSByZXF1ZXN0IEAgaHR0cHM6Ly9idWd6
aWxsYS50aWFub2NvcmUub3JnLwo+Pgo+IAo+IFRoZSAxOS42LjEyNiBkZXNjcmliZXMgdGhlIFNQ
SSByZXNvdXJjZSwgaW4gcGFydGljdWxhcjoKPiAKPiAtLS04PC0tLTg8LS0tCj4gRGF0YUJpdExl
bmd0aCBpcyB0aGUgc2l6ZSwgaW4gYml0cywgb2YgdGhlIHNtYWxsZXN0IHRyYW5zZmVyIHVuaXQg
Zm9yCj4gdGhpcyBjb25uZWN0aW9uLiBfTEVOIGlzIGF1dG9tYXRpY2FsbHkKPiBjcmVhdGVkIHRv
IHJlZmVyIHRvIHRoaXMgcG9ydGlvbiBvZiB0aGUgcmVzb3VyY2UgZGVzY3JpcHRvci4KPiAtLS04
PC0tLTg8LS0tCj4gCj4gSXMgaXQgd2hhdCB5b3UgYXJlIGxvb2tpbmcgZm9yPyAoQXMgZmFyIGFz
IEkga25vdyBtb3N0IG9mIHRoZQo+IGZpcm13YXJlcyBzaW1wbGUgYWJ1c2UgdGhpcyBmaWVsZCBh
bW9uZyBvdGhlcnMpCgpJIGRpZG4ndCB0aGluayBzbyAtIEkgdGhvdWdodCB0aGF0IHRoZXJlIHdh
cyBhIGRpc3RpbmN0aW9uIGJldHdlZW4gd2lkdGggCmFuZCBsZW5ndGggaW4gU1BJIHRlcm1zLgoK
U28gaG93IGRvIHlvdSBmaW5kIHRoYXQgbW9zdCBmaXJtd2FyZXMgYWJ1c2UgdGhpcyBmaWVsZD8g
QUZBSUNTLCBsaW51eCAKa2VybmVsIGRvZXNuJ3QgaW50ZXJwcmV0IHRoaXMgZmllbGQgYXQgYWxs
LgoKPiAKPj4gVGhlcmUgc2VlbXMgdG8gYmUgYW4gYXZlbnVlIHRoZXJlIGZvciByYWlzaW5nIG5l
dyBmZWF0dXJlcyBmb3IgdGhlIHNwZWMuCj4+IEkgKG9yIG15IG9yZykgY2FuJ3QgcGFydGljaXBh
dGUgaW4gQVdTRy4KPiAKPiBCdXQgaGF2ZSB5b3UgcmVhZCAxOS42LjEyNj8KPiAKCk1heWJlIHNv
bWUgY2xhcmlmaWNhdGlvbiBhdCBsZWFzdCBjb3VsZCBiZSBhY2hpZXZlZCA6KQoKQ2hlZXJzLApK
b2huCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
