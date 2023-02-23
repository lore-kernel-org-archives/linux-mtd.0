Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC7EC636D7
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 10:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1GU4R3PEH2Cu35hbXNGCdKuqglQs2d1LGkHVOSgmvE=; b=3oahkVCvdjasxF
	8SgyHlN9enpolIe4uVXAtIWk4MfaUGrib03G85aaQrUldjQOif69OQBv5tfRaImlI6j+zTiJKwLcH
	6/0/R66hgTgsU6b0FQdrfUVHcP/Eg6kTLygKCU1ZqKw2/MW/RGZvDfoghWXStXUOzEcYzuUS0CXHO
	s4KJIZMmHQxXiuvE69lAVfWh44rD3FsquT+2kMbBwChqNZaPXL8ZzboUeyfViLdYzDFHvQGB5Usb6
	1fpGuiyuaul7lueOZHpz9ETwQwcHShZdytF2IIAME6yuN9rhZN9zFX64pnC11npruEFcpw1suihf+
	lY3kqsBpqOeIqrMf+DRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8ln-00FvRE-HV; Thu, 23 Feb 2023 10:24:11 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8lc-00FvK9-4U
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 10:24:02 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N9ITY5021049;
	Thu, 23 Feb 2023 11:23:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F2zs6V3ssURrwFXmKC+Dwp9G2BLkY3l3hPNBnaOmsZ4=;
 b=IO6EuwI0Ml/WDzN24+lv9g7A9e9rnbwQYjPIz+ZK4xF6idN/yHYK0u+cbhfOuMcjIzuz
 jtEicreqkvA1JpJYZodOwgU9saaAc6eTfyTdwsKYEomgvhI2fFy97InS9h2DmvoK8K31
 64qWvKbB0a6qHr4rpTcazkEDfkGQ1axw9B/YRgVd47FJ853YYi+hZ/kRRXIJHeBMfuIl
 4/dsT7qaBeGN1o5BydSP5M0dupwJ0WEQ+6+kFvU+7HD/qSN5d1u7ND5uEKPFV8cYk6aq
 yfvjeSVL24Y1mhwJMEiPjWZLlLOxn9hRpLseT50n1H+p91KEzRKFiLEaWreEKh0IXgSa tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nwy882k02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 11:23:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A105210002A;
	Thu, 23 Feb 2023 11:23:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88D542138F8;
	Thu, 23 Feb 2023 11:23:45 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 23 Feb
 2023 11:23:42 +0100
Message-ID: <5a01a9d1-9068-576a-7028-53415cc03ed8@foss.st.com>
Date: Thu, 23 Feb 2023 11:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 0/3] fdt: Fix mtparts fixup
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>
CC: Francesco Dolcini <francesco@dolcini.it>, Simon Glass <sjg@chromium.org>,
        <u-boot@lists.denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Marek Vasut
	<marex@denx.de>, <linux-mtd@lists.infradead.org>
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113193411.GW3787616@bill-the-cat> <20230123110606.56110e40@xps-13>
 <20230123200131.GD631605@bill-the-cat>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20230123200131.GD631605@bill-the-cat>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_022400_516508_0FBFC5EF 
X-CRM114-Status: GOOD (  34.11  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAxLzIzLzIzIDIxOjAxLCBUb20gUmluaSB3cm90ZToKPiBPbiBNb24sIEphbiAyMywg
MjAyMyBhdCAxMTowNjowNkFNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBUb20s
Cj4+Cj4+IHRyaW5pQGtvbnN1bGtvLmNvbSB3cm90ZSBvbiBGcmksIDEzIEphbiAyMDIzIDE0OjM0
OjExIC0wNTAwOgo+Pgo+Pj4gT24gRnJpLCBKYW4gMTMsIDIwMjMgYXQgMDc6NDU6NDRQTSArMDEw
MCwgRnJhbmNlc2NvIERvbGNpbmkgd3JvdGU6Cj4+Pgo+Pj4+IEZyb206IEZyYW5jZXNjbyBEb2xj
aW5pIDxmcmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNvbT4KPj4+Pgo+Pj4+IFJlY2VudGx5IHdl
IGhhZCBhIGJvb3QgcmVncmVzc2lvbiBvbiBjb2xpYnJpLWlteDcgYmVjYXVzZSBvZiBhIGNsZWFu
dXAgY2hhbmdlCj4+Pj4gb24gTGludXggaW14Ny5kdHNpIHNldHRpbmcgbmFuZCBjb250cm9sbGVy
IG5vZGUgI3NpemUtY2VsbHMgZnJvbSAxIHRvIDAuCj4+Pj4KPj4+PiBCZWNhdXNlIG9mIHRoYXQg
TGludXggcGFydGl0aW9uIHBhcnNlciB3YXMgbm8gbG9uZ2VyIGFibGUgdG8gcHJvcGVybHkKPj4+
PiBwYXJzZSB0aGUgT0YgcGFydGl0aW9ucyBsZWFkaW5nIHRvIGEgYm9vdCBmYWlsdXJlLCB0aGUg
YWJvdmUgY2hhbmdlIHdhcwo+Pj4+IHJldmVydGVkIGluIHRoZSBtZWFudGltZSBhcyBhbiBpbW1l
ZGlhdGUgd29ya2Fyb3VuZCwgYnV0IHNvbWUgaW1wcm92ZW1lbnQKPj4+PiBpcyByZXF1aXJlZCBv
biBib3RoIExpbnV4IGFuZCBVLUJvb3QuCj4+Pj4KPj4+PiBUaGlzIGNoYW5nZSBpbXByb3ZlIHRo
ZSBVLUJvb3QgcGFydCBvZiBpdCwgI3NpemUtY2VsbCBpcyBzZXQgdG8gMSB3aGVuCj4+Pj4gaXQg
aGFzIGFuIGludmFsaWQgdmFsdWUuIFRoaXMgaGFzIHRoZSBsaW1pdGF0aW9uIHRvIHdvcmsgb25s
eSB3aXRoIGRldmljZXMKPj4+PiBzbWFsbGVyIHRoYW4gNEdpQi4gSW4gZ2VuZXJhbCB0aGUgc3Vn
Z2VzdGlvbiBmcm9tIHRoZSBMaW51eCBNVEQgbWFpbnRhaW5lciB3b3VsZAo+Pj4+IGJlIHRvIGp1
c3QgZGVwcmVjYXRlIHVzaW5nIHRoaXMgVS1Cb290IGZ1bmN0aW9uIGFuZCBwYXNzIHRoZSBNVEQg
cGFydGl0aW9ucwo+Pj4+IGZyb20gdGhlIGNvbW1hbmQgbGluZSwgdW5sZXNzIHRoZXkgYXJlIHN0
YXRpY2FsbHkgZGVmaW5lZCBpbiB0aGUgRFRTIGZpbGUKPj4+PiBpbiB0aGUgZmlyc3QgcGxhY2Uu
Cj4+Pj4KPj4+PiBUaGlzIHNlcmllcyB0aGVyZWZvcmUgY29udmVydCBjb2xpYnJpLWlteDZ1bGwg
YW5kIGNvbGlicmktaW14NyB0byBwYXNzIHRoZQo+Pj4+IHBhcnRpdGlvbiBsaXN0IGZyb20gdGhl
IGNvbW1hbmQgbGluZSBpbnN0ZWFkIG9mIGZpeGluZyB1cCB0aGUgRFQuCj4+Pj4KPj4+PiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEyMDIwNzE5MDAuMTE0Mzk1MC0xLWZy
YW5jZXNjb0Bkb2xjaW5pLml0Lwo+Pj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9ZNGRnQlRHTldwTTZTUVhJQGZyYW5jZXNjby1uYi5pbnQudG9yYWRleC5jb20vCj4+PiBNeSBo
aWdoZXIgbGV2ZWwgcXVlc3Rpb24gLyBjb25jZXJuIGhlcmUgaXMsIGlzIHVzaW5nIG9uZSBvZiB0
aGUgZHRzCj4+PiBwYXJ0aXRpb24gc2NoZW1lcyBzdGlsbCB2YWxpZCAvIHByZWZlcnJlZCwgb3Ig
c2hvdWxkIGV2ZXJ5b25lIG5vdyBoYXZlCj4+PiByZXZlcnRlZCB0byBwYXNzaW5nIHZpYSB0aGUg
a2VybmVsIGNvbW1hbmQgbGluZT8gIElmIGRldmljZSB0cmVlIHN0aWxsLAo+Pj4gaXMgbXRkL3Bh
cnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sIHRoZSBvbmUgdG8gZm9sbG93IG9yIHNvbWV0
aGluZwo+Pj4gZWxzZT8KPj4gSSBkb24ndCB0aGluayB3ZSBjYW4gInByZWZlciIgb25lIG1vZGUg
b3ZlciB0aGUgb3RoZXIgYmV0d2VlbiBjbWRsaW5lCj4+IGFuZCBEVFMuIEJvdGggc2hvdWxkIHdv
cmsgcHJldHR5IHdlbGwuIE9mIGNvdXJzZSBvbiB0aGUgY21kbGluZSB5b3UgY2FuCj4+IG9ubHkg
ZGVmaW5lIGZpeGVkIHBhcnRpdGlvbnMgYW5kIG1hbnkgZGV2aWNlcyByZXF1aXJlIG1vcmUgYWR2
YW5jZWQKPj4gcGFyc2Vycywgd2hpY2ggYXJlIG9ubHkgYXZhaWxhYmxlIHRocm91Z2ggRFRTLCBi
dXQgZm9yIHNpbXBsZQo+PiBwYXJ0aXRpb25zLCBpdCB3b3JrcyB0b3RhbGx5IG9rYXkuCj4gV2hl
biBib3RoIGFyZSBwcmVzZW50LCB3aGljaCBvbmUgaXMgdXNlZD8KPgo+PiBUaGUgb25seSB0aGlu
ZyB0aGF0IEkgd291bGQgbGlrZSB0byBhdm9pZCBpcyB0aGUgbmVlZCB0byB3cml0ZSBjb2RlIGlu
Cj4+IHRoZSBib290bG9hZGVycyB0byB0d2VhayB0aGUgRkRUIGluIG9yZGVyIHRvIGFkZCBwYXJ0
aXRpb25zLiBUaGF0IGlzCj4+IGNsZWFybHkgbm90IG5lZWRlZCwgZXJyb3IgcHJvbmUsIGFuZCBk
byBub3QgZm9sbG93IGV2b2x1dGlvbiBvZiB0aGUKPj4gInN0YW5kYXJkIiwgYXMgd2UganVzdCBk
aXNjb3ZlcmVkLgo+IEknbSBub3Qgc3VyZSBhYm91dCB0aGlzLiBMb29raW5nIGFyb3VuZCBpbiBV
LUJvb3QgdG9kYXksIEkgc2VlIHR3byB0eXBlcwo+IG9mIGNhc2VzLiBPbmUgb2Ygd2hpY2gsIHRo
ZSBjb2xpYnJpIGNhc2UsIGNhbiBjbGVhcmx5IGJlIG5vdCBkb25lIGFuZAo+IGVpdGhlciBwYXNz
ZWQgb24gdGhlIGNvbW1hbmQgbGluZSwgb3IgcHV0IGluIHRvIHRoZSBkZXZpY2UgdHJlZSBhcwo+
IHRoZXJlJ3Mgbm90aGluZyBydW4tdGltZSByZWxhdGVkIGJlaW5nIHR3ZWFrZWQgaGVyZS4gVGhh
dCdzIGEgZmluZSBwYXRoCj4gdG8gdGFrZSBvbiB0aG9zZSBwbGF0Zm9ybXMgYW5kIEZyYW5jZXNj
bydzIHBhdGNoZXMgc2hvdWxkIGJlIHVwZGF0ZWQgdG8KPiByZW1vdmUgdGhlIHVudXNlZCBDIGNv
ZGUgdG9vIGZyb20gdGhlIGJvYXJkIGNvZGUuCj4KPiBCdXQgdGhlIG90aGVyIGNhc2VzIGFyZSBk
b2luZyBzb21ldGhpbmcgZHluYW1pYyBhbmQgcnVuLXRpbWUgcmVsYXRlZC4KPiBUaGVyZSdzIHRo
ZSBvbWFwMyBpZ2VwMDB4MCBmYW1pbHkgKHdoaWNoIHllcywgbGVnYWN5KSB0aGF0IGlzIGRvaW5n
IE5BTkQKPiBvciBvbmVOQU5EIGFuZCBhZGp1c3RpbmcgdGhpbmdzIGF0IHJ1biB0aW1lLiAgSSBk
b24ndCBrbm93IGhvdyBtdWNoCj4gYW55b25lIGhhcyBpbnRlcmVzdCBpbiB0aG9zZSBwbGF0Zm9y
bXMgYXQgdGhpcyBwb2ludCwgbm9yIGV4YWN0bHkgd2hvIHRvCj4gY29udGFjdCAoZm9yIExpbnV4
IG9yIFUtQm9vdCkuIFRoZXJlJ3MgYWxzbyB0aGUgc3RtMzJtcDEgZmFtaWx5IGRvaW5nCj4gc29t
ZXRoaW5nIHRoYXQncyB2ZXJ5IG5vdCBvYnZpb3VzIGF0IGZpcnN0IGdsYW5jZSwgc28gSSd2ZSBj
YydkIHRoZQo+IG1haW50YWluZXJzIHRoZXJlLgo+CgpGb3IgaW5mb3JtYXRpb24sIHRvZGF5IGZv
ciBzdG0zMm1wMSBmYW1pbHkgd2UgYXJlIHVzaW5nIHRoZSBidWlsZAoKIMKgb2YgTVREUEFSVFMg
YW5kIGZkdCBmaXh1cCwgb25seSBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBpc3N1ZQoKKHRo
ZSBNVEQgcGFydGl0aW9ucyBjaGFuZ2UgZm9yIGJvb3Qgd2l0aCBvciB3aXRob3V0IE9QLVRFRSwK
CndpdGggb3Igd2lodG91dCBGSVAsIHdpdGggU1BMKS4KCgpUb2RheSB3ZSBhcmUgYWxyZWFkeSBw
bGFuIHRvIHJlbW92ZSB0aGlzIGR5bmFtaWMgbWFuYWdlbWVudAoKYW5kIHRvIHN3aXRjaCB0byBz
dGF0aWMgTVREIHBhcnRpdGlvbiBkZWZpbmVkIGluIGRldmljZSB0cmVlLAoKYXMgYWxyZWFkeSBw
cm9wb3NlZCBieSBUb20gaW4gdGhlIHNlcmllCgogwqAibXRkOiBzcGk6IG5vcjogZm9yY2UgbXRk
IG5hbWUgdG8gIm5vciVkIiIKCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vi
b290L3BhdGNoLzIwMjEwOTE2MTU1MDQwLnYzLjIuSWE0NjFlNjcwYzc0Mzg0NzhhYThmODkzOTIw
OWQ0NWM4MThjY2QyODRAY2hhbmdlaWQvCgoKVGhpcyBwYXRjaHNldCBpcyBhbHJlYWR5IHJlYWR5
LCB3ZSBhcmUgY3VycmVudGx5IHRlc3RpbmcgaXQgaW50ZXJuYWxseQoKYW5kIGl0IHNob3VsZCBi
ZSBwdXNoZWQgd2hlbiBpdCB3aWxsIGJlIHZhbGlkYXRlZCBpbiBvdXIgZG9ud3N0cmVhbS4KCgpS
ZWdhcmRzCgoKUGF0cmljawoKCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
