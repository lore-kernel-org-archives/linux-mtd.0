Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50965C3F2C6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 03:02:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 242C020658
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 03:02:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZVQT1mE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 242C020658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DIKOvtqXri/obSmWMK5uUmUhfpoZ1fW/L24VB1WOK7Q=; b=TZVQT1mEr4k75g1cnUWXlqkud
	210GJBRAN0z61+GfBjexgMzCLNKwC3HnE9GkKB4WDOBCkTqUQltJmp99d0R6DGALjHn4hB1n3WTVE
	vqP1qE0+5DuNZcC5/dK/9IV0tBvliMb2RWtCfTwRgavNjB4WGGJ8FI0YJeGtgc3ikadpYv/w5yQJY
	BHw83pQkYf/2YBE3lOcLXB9ht6MTCPYyiJVBvbo1v+s/UAgF+f3HBf+S2T8JQ9B7yhx326kP5Tbg+
	5ZUk4TuR6qX41SDIdrF1aFm9I3e6jNCi5/hHSG1O5hj3j+8/lykJDyF4Raotn6GSPEiGVSL4q0L3g
	CeseBorZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Vuc-0000oD-J6; Fri, 28 Feb 2020 03:02:02 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7VuY-0000nc-VR
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 03:02:00 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 19:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="261722452"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 27 Feb 2020 19:01:57 -0800
Received: from [10.226.38.23] (unknown [10.226.38.23])
 by linux.intel.com (Postfix) with ESMTP id 6A8B958052E;
 Thu, 27 Feb 2020 19:01:50 -0800 (PST)
Subject: Re: [PATCH v11 1/2] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
To: Rob Herring <robh+dt@kernel.org>
References: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227062708.21544-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <CAL_JsqJno0gmUnGnsWFYdHY_3CHNijtksAmRhuEudimip0aK4w@mail.gmail.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <10e65e28-197f-b094-5901-917b07f09adf@linux.intel.com>
Date: Fri, 28 Feb 2020 11:01:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJno0gmUnGnsWFYdHY_3CHNijtksAmRhuEudimip0aK4w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_190159_022788_6BD1A820 
X-CRM114-Status: GOOD (  25.63  )
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
Cc: =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex@denx.de>, devicetree@vger.kernel.org,
 tien.fong.chee@intel.com, tudor.ambarus@gmail.com, Vignesh R <vigneshr@ti.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, david.oberhollenzer@sigma-star.at,
 simon.k.r.goldschmidt@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>, qi-ming.wu@intel.com,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
 cheol.yong.kim@intel.com, Mark Rutland <mark.rutland@arm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKIMKgwqDCoMKgIFRoYW5rIHlvdSBzbyBtdWNoIGZvciB0aGUgcmV2aWV3IGNvbW1l
bnRzLi4uCgpPbiAyOC8yLzIwMjAgMTowNyBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1
LCBGZWIgMjcsIDIwMjAgYXQgMTI6MjcgQU0gUmFtdXRoZXZhcixWYWRpdmVsIE11cnVnYW5YCj4g
PHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+PiBG
cm9tOiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhl
dmFyQGxpbnV4LmludGVsLmNvbT4KPj4KPj4gQWRkIGR0LWJpbmRpbmdzIGRvY3VtZW50YXRpb24g
Zm9yIENhZGVuY2UtUVNQSSBjb250cm9sbGVyIHRvIHN1cHBvcnQKPj4gc3BpIGJhc2VkIGZsYXNo
IG1lbW9yaWVzLgo+IFlvdSBuZWVkIHRvIHJ1biAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBiZWNh
dXNlIHRoaXMgZG9lc24ndCBwYXNzLgpTdXJlLMKgIHJ1biBhbmQgZml4IGl0Lgo+PiBTaWduZWQt
b2ZmLWJ5OiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11
dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2NhZGVuY2UtcXVhZHNwaS50eHQgICAgfCAgNjcgLS0tLS0tLS0tLQo+PiAgIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9jZG5zLHFzcGktbm9yLnlhbWwgICAgIHwgMTQyICsrKysr
KysrKysrKysrKysrKysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQyIGluc2VydGlvbnMoKyks
IDY3IGRlbGV0aW9ucygtKQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2NhZGVuY2UtcXVhZHNwaS50eHQKPj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9jZG5zLHFzcGkt
bm9yLnlhbWwKPgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NwaS9jZG5zLHFzcGktbm9yLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc3BpL2NkbnMscXNwaS1ub3IueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLjNhZDI4NTBjNDEyZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvY2Rucyxxc3BpLW5vci55YW1s
Cj4+IEBAIC0wLDAgKzEsMTQyIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCBPUiBCU0QtMi1DbGF1c2UpCj4+ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiAiaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL2NkbnMscXNwaS1ub3IueWFtbCMiCj4+ICsk
c2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgo+
PiArCj4+ICt0aXRsZTogQ2FkZW5jZSBRU1BJIEZsYXNoIENvbnRyb2xsZXIgc3VwcG9ydAo+PiAr
Cj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFk
aXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPj4gKwo+PiArYWxsT2Y6
Cj4+ICsgIC0gJHJlZjogInNwaS1jb250cm9sbGVyLnlhbWwjIgo+PiArCj4+ICtkZXNjcmlwdGlv
bjogfAo+PiArICBCaW5kaW5nIERvY3VtZW50YXRpb24gZm9yIENhZGVuY2UgUVNQSSBjb250cm9s
bGVyLFRoaXMgY29udHJvbGxlciBpcwo+PiArICBwcmVzZW50IGluIHRoZSBJbnRlbCBMR00sIEFs
dGVyYSBTb0NGUEdBIGFuZCBUSSBTb0NzIGFuZCB0aGlzIGRyaXZlcgo+PiArICBoYXMgYmVlbiB0
ZXN0ZWQgT24gSW50ZWwncyBMR00gU29DLgo+PiArCj4+ICsgIC0gY29tcGF0aWJsZSA6IHNob3Vs
ZCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZzoKPj4gKyAgICAgICAgR2VuZXJpYyBkZWZhdWx0IC0g
ImNkbnMscXNwaS1ub3IiLgo+PiArICAgICAgICBGb3IgVEkgNjZBSzJHIFNvQyAtICJ0aSxrMmct
cXNwaSIsICJjZG5zLHFzcGktbm9yIi4KPj4gKyAgICAgICAgRm9yIFRJIEFNNjU0IFNvQyAgLSAi
dGksYW02NTQtb3NwaSIsICJjZG5zLHFzcGktbm9yIi4KPj4gKyAgICAgICAgRm9yIEludGVsIExH
TSBTb0MgLSAiaW50ZWwsbGdtLXFzcGkiLCAiY2Rucyxxc3BpLW5vciIuCj4gVGhlIHNjaGVtYSBi
ZWxvdyBzYXlzIGFsbCB0aGlzLCBzbyBkcm9wIHRoaXMgcGFydC4KPgo+PiArCj4+ICtwcm9wZXJ0
aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIG9uZU9mOgo+PiArICAgICAgLSBpdGVtczoK
Pj4gKyAgICAgICAgLSBlbnVtOgo+PiArICAgICAgICAgICAtIHRpLGsyZy1xc3BpCj4+ICsgICAg
ICAgIC0gY29uc3Q6IGNkbnMscXNwaS1ub3IKPj4gKwo+PiArICAgICAgLSBpdGVtczoKPj4gKyAg
ICAgICAgLSBlbnVtOgo+PiArICAgICAgICAgICAtIHRpLGFtNjU0LW9zcGkKPj4gKyAgICAgICAg
LSBjb25zdDogY2Rucyxxc3BpLW5vcgo+PiArCj4+ICsgICAgICAtIGl0ZW1zOgo+PiArICAgICAg
ICAtIGVudW06Cj4+ICsgICAgICAgICAgIC0gaW50ZWwsbGdtLXFzcGkKPj4gKyAgICAgICAgLSBj
b25zdDogY2Rucyxxc3BpLW5vcgo+IFRoZXNlIDMgaXRlbXMgY2FuIGJlIDEgZW50cnkgKGNvbWJp
bmUgdGhlIGVudW1zKS4KTm90ZWQsIHdpbGwgZml4IGl0Lgo+Cj4+ICsKPj4gKyAgICAgIC0gaXRl
bXM6Cj4+ICsgICAgICAgIC0gY29uc3Q6IGNkbnMscXNwaS1ub3IKPj4gKwo+PiArICByZWc6Cj4+
ICsgICAgbWF4SXRlbXM6IDIKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1z
OiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2Ru
cyxmaWZvLWRlcHRoOgo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQzMgo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgMTI4IG9yIDI1NiBieXRl
cyBzaXplIG9mIHRoZSBkYXRhIEZJRk8gaW4gd29yZHMuCj4gU291bmRzIGxpa2UgY29uc3RyYWlu
dHMuIE1ha2UgdGhlbSBhIHNjaGVtYS4KU3VyZSwgd2lsbCBtYWtlIGFzIHNjaGVtYS4KPj4gKwo+
PiArICBjZG5zLGZpZm8td2lkdGg6Cj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvdWludDMyCj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICA0IGJ5dGUg
YnVzIHdpZHRoIG9mIHRoZSBkYXRhIEZJRk8gaW4gYnl0ZXMuCj4gVGhhdCdzIG5vdCB2ZXJ5IGNs
ZWFyLiBJdCBzaG91bGQgYmUgc2NoZW1hIGNvbnN0cmFpbnRzIGFueXdheXM6Cj4KPiBlbnVtOiBb
IDQsIDgsIDEyLCAxNiwgLi4uPz8/IF0KPgo+IG9yOgo+Cj4gbXVsdGlwbGVPZjogNAo+IG1pbmlt
dW06IDQKPiBtYXhpbXVtOiA/Ck5vdGVkLMKgIHdpbGwgZml4IGl0Lgo+PiArCj4+ICsgIGNkbnMs
dHJpZ2dlci1hZGRyZXNzOgo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMgo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgMzItYml0IGluZGly
ZWN0IEFIQiB0cmlnZ2VyIGFkZHJlc3MuCj4+ICsKPj4gKyAgY2RucyxyY2xrLWVuOgo+PiArICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+IFdyb25nIHR5
cGUgaWYgdGhpcyBpcyBhICdmbGFnJyBha2EgYm9vbGVhbi4KWWVzICwgeW91IGFyZSBjb3JyZWN0
Lgo+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4+ICsgICAgICBGbGFnIHRvIGluZGljYXRlIHRoYXQg
UVNQSSByZXR1cm4gY2xvY2sgaXMgdXNlZCB0byBsYXRjaCB0aGUgcmVhZCBkYXRhCj4+ICsgICAg
ICByYXRoZXIgdGhhbiB0aGUgUVNQSSBjbG9jay4gTWFrZSBzdXJlIHRoYXQgUVNQSSByZXR1cm4g
Y2xvY2sgaXMgcG9wdWxhdGVkCj4+ICsgICAgICBvbiB0aGUgYm9hcmQgYmVmb3JlIHVzaW5nIHRo
aXMgcHJvcGVydHkuCj4+ICsKPj4gKyMgc3Vibm9kZSdzIHByb3BlcnRpZXMKPj4gK3BhdHRlcm5Q
cm9wZXJ0aWVzOgo+PiArICAiXi4qQFswLTlhLWZBLUZdKyQiOgo+PiArICAgIHR5cGU6IG9iamVj
dAo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgZmxhc2ggZGV2aWNlIHVzZXMgdGhlIHN1
Ym5vZGVzIGJlbG93IGRlZmluZWQgcHJvcGVydGllcy4KPj4gKwo+PiArICBjZG5zLHJlYWQtZGVs
YXk6Cj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBEZWxheSBpbiA0IG1pY3Jvc2Vjb25k
cywgcmVhZCBjYXB0dXJlIGxvZ2ljLCBpbiBjbG9jayBjeWNsZXMuCj4gSHVoPyBJcyBpdCBpbiB0
aW1lIG9yIGNsb2Nrcz8KPgo+IE5vIHVuaXQgc3VmZml4IGhlcmUsIHNvIHRoaXMgbmVlZHMgYSB0
eXBlIHJlZi4gVGhhdCdzIHdoYXQgJ21ha2UKPiBkdF9iaW5kaW5nX2NoZWNrJyBmYWlscyBvbi4K
aXQncyBjbG9jayBjeWNsZXMgdG8gYWRqdXN0YWJsZSBkZWxheSzCoCByZWFkIGRhdGEgZGVsYXkg
YmV0d2VlbiB0aGUgCkZsYXNoIERldmljZSBkYXRhIG91dHB1dHMgYW5kIHRoZSBjb250cm9sbGVy
IGRhdGEgaW5wdXRzCj4+ICsKPj4gKyAgY2Rucyx0c2hzbC1uczoKPj4gKyAgICBkZXNjcmlwdGlv
bjogfAo+PiArICAgICAgRGVsYXkgaW4gNTAgbmFub3NlY29uZHMsIGZvciB0aGUgbGVuZ3RoIHRo
YXQgdGhlIG1hc3RlciBtb2RlIGNoaXAgc2VsZWN0Cj4+ICsgICAgICBvdXRwdXRzIGFyZSBkZS1h
c3NlcnRlZCBiZXR3ZWVuIHRyYW5zYWN0aW9ucy4KPiBtdWx0aXBsZU9mOiA1MAo+Cj4gQW5kIHNv
IG9uIGZvciB0aGUgcmVzdC4KCk9rYXkgLCBOb3RlZC4KClJlZ2FyZHMKVmFkaXZlbAo+PiArCj4+
ICsgIGNkbnMsdHNkMmQtbnM6Cj4+ICsgICAgZGVzY3JpcHRpb246IHwKPj4gKyAgICAgIERlbGF5
IGluIDUwIG5hbm9zZWNvbmRzLCBiZXR3ZWVuIG9uZSBjaGlwIHNlbGVjdCBiZWluZyBkZS1hY3Rp
dmF0ZWQKPj4gKyAgICAgIGFuZCB0aGUgYWN0aXZhdGlvbiBvZiBhbm90aGVyLgo+PiArCj4+ICsg
IGNkbnMsdGNoc2gtbnM6Cj4+ICsgICAgZGVzY3JpcHRpb246IHwKPj4gKyAgICAgIERlbGF5IGlu
IDQgbmFub3NlY29uZHMsIGJldHdlZW4gbGFzdCBiaXQgb2YgY3VycmVudCB0cmFuc2FjdGlvbiBh
bmQKPj4gKyAgICAgIGRlYXNzZXJ0aW5nIHRoZSBkZXZpY2UgY2hpcCBzZWxlY3QgKHFzcGlfbl9z
c19vdXQpLgo+PiArCj4+ICsgIGNkbnMsdHNsY2gtbnM6Cj4+ICsgICAgZGVzY3JpcHRpb246IHwK
Pj4gKyAgICAgIERlbGF5IGluIDQgbmFub3NlY29uZHMsIGJldHdlZW4gc2V0dGluZyBxc3BpX25f
c3Nfb3V0IGxvdyBhbmQKPj4gKyAgICAgIGZpcnN0IGJpdCB0cmFuc2Zlci4KPj4gKwo+PiArcmVx
dWlyZWQ6Cj4+ICsgIC0gY29tcGF0aWJsZQo+PiArICAtIHJlZwo+PiArICAtIGludGVycnVwdHMK
Pj4gKyAgLSBjbG9ja3MKPj4gKyAgLSBjZG5zLGZpZm8tZGVwdGgKPj4gKyAgLSBjZG5zLGZpZm8t
d2lkdGgKPj4gKyAgLSBjZG5zLHRyaWdnZXItYWRkcmVzcwo+PiArCj4+ICtleGFtcGxlczoKPj4g
KyAgLSB8Cj4+ICsgICAgcXNwaTogc3BpQGZmNzA1MDAwIHsKPj4gKyAgICAgICAgICBjb21wYXRp
YmxlID0gImNkbnMscXNwaS1ub3IiOwo+PiArICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+PiArICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+PiArICAgICAgICAgIHJlZyA9IDww
eGZmNzA1MDAwIDB4MTAwMD4sCj4+ICsgICAgICAgICAgICAgICAgPDB4ZmZhMDAwMDAgMHgxMDAw
PjsKPj4gKyAgICAgICAgICBpbnRlcnJ1cHRzID0gPDAgMTUxIDQ+Owo+PiArICAgICAgICAgIGNs
b2NrcyA9IDwmcXNwaV9jbGs+Owo+PiArICAgICAgICAgIGNkbnMsZmlmby1kZXB0aCA9IDwxMjg+
Owo+PiArICAgICAgICAgIGNkbnMsZmlmby13aWR0aCA9IDw0PjsKPj4gKyAgICAgICAgICBjZG5z
LHRyaWdnZXItYWRkcmVzcyA9IDwweDAwMDAwMDAwPjsKPj4gKwo+PiArICAgICAgICAgIGZsYXNo
MDogbjI1cTAwQDAgewo+PiArICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1u
b3IiOwo+PiArICAgICAgICAgICAgICByZWcgPSA8MHgwPjsKPj4gKyAgICAgICAgICAgICAgY2Ru
cyxyZWFkLWRlbGF5ID0gPDQ+Owo+PiArICAgICAgICAgICAgICBjZG5zLHRzaHNsLW5zID0gPDUw
PjsKPj4gKyAgICAgICAgICAgICAgY2Rucyx0c2QyZC1ucyA9IDw1MD47Cj4+ICsgICAgICAgICAg
ICAgIGNkbnMsdGNoc2gtbnMgPSA8ND47Cj4+ICsgICAgICAgICAgICAgIGNkbnMsdHNsY2gtbnMg
PSA8ND47Cj4+ICsgICAgICAgICAgfTsKPj4gKyAgICB9Owo+PiArCj4+IC0tCj4+IDIuMTEuMAo+
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
