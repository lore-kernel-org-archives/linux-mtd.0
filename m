Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336D3C83004
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 084D82073E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CHx1pkNo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Q/iE+AzM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 084D82073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ApX05UVlzTLMq70ohrYJgKno97Cnq0xRBOqx41WIVcw=; b=CHx1pkNoFSJImbISKN4FWTKWI
	ra157jLmi5L5RpFUH00kqpscB+KVPl3eTVCJFZE3CFKevUtEjfmqGU3dcCsbqyBa8uOJwLEXDZbJK
	zDRMv2WI1hxxf2zKv9hFbrs32O04BZBcvYDGvdiedhB5umAsyrdeIaw1Kp8Ag31ZjjB2023Ijw90D
	j95fgeHdd9JE7fIsxhJGKQRUsVchbO670G4OwdNg+I7YzHw+Yz25bqnY/TLOl/jfZAGVWE8lGVFdh
	uAm5InbXgk9RmHg8dTk60qwZui1PFMsBSNHe1WueJJxQmwBWq3ZDwUqqziKUy2LOTim4IJ8S4cmBN
	ZdfHj6uyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTjE7-0003N8-8P; Wed, 29 Apr 2020 09:41:59 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTjE4-0003LX-MH
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 09:41:58 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T9cVTx011957; Wed, 29 Apr 2020 11:41:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Y6cvWswz1Mzq73LWAYc3OJKVnI3lC/DlwlbZJw8qHzA=;
 b=Q/iE+AzML7Uf13ArJzgtnO7um7NTj07VGlQLwmZt2apTXJFOzOonUxcQHeLWc/armZpR
 NOsLWuDH2sRfcHH6MKYhSAErZn5Z0uK8GZTo5nML52v/UowfkHi23A4ymp76APRS3u+i
 JXOwzucflb0kgQT8z/z2e99xWSnqt8yFMLNj68vAO6mTpWspmLOV0ZT9XcXFnRpZ3XGZ
 rfUFx8KiUJit3JlZPQ+8SxK9COW8erjCXdcQOKOXAegkv/f+1ZkLFqcwKwEsZkg74kTK
 YXcpXvR4eYtBErI22ocWNQbmjv1neMXRB87rEObcq8ww1h5tQBQfInxDWo8pC9A2qJfr Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhcc5fhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:41:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D80C510002A;
 Wed, 29 Apr 2020 11:41:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B97F820B1C5;
 Wed, 29 Apr 2020 11:41:46 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 11:41:45 +0200
Subject: Re: [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS
 for timeouts
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13> <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
 <20200429113529.5ddc3ad9@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <b6b31f36-8e8f-4042-2587-0dcad82aafc5@st.com>
Date: Wed, 29 Apr 2020 11:41:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200429113529.5ddc3ad9@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-28,
 2020-04-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_024157_203549_9A52AF40 
X-CRM114-Status: GOOD (  23.50  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA0LzI5LzIwIDExOjM1IEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIENocmlzdG9w
aGUsCj4gCj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3
cm90ZSBvbiBXZWQsIDI5IEFwcgo+IDIwMjAgMTE6Mjc6NDMgKzAyMDA6Cj4gCj4+IEhpIE1pcXXD
qGwsCj4+Cj4+IE9uIDQvMjcvMjAgODoyMiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IEhp
IENocmlzdG9waGUsCj4+Pgo+Pj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVs
bG9Ac3QuY29tPiB3cm90ZSBvbiBXZWQsIDE1IEFwcgo+Pj4gMjAyMCAxNzo1NzozMCArMDIwMDoK
Pj4+ICAgIAo+Pj4+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgY29uc3RhbnQgRk1DMl9USU1FT1VU
X1VTLgo+Pj4+IEZNQzJfVElNRU9VVF9NUyBpcyBzZXQgdG8gNSBzZWNvbmRzIGFuZCB0aGlzIGNv
bnN0YW50IGlzIHVzZWQKPj4+PiBlYWNoIHRpbWUgdGhhdCB3ZSBuZWVkIHRvIHdhaXQgKGV4Y2Vw
dCB3aGVuIHRoZSB0aW1lb3V0IHZhbHVlCj4+Pj4gaXMgc2V0IGJ5IHRoZSBmcmFtZXdvcmspCj4+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2Vy
ZWxsb0BzdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJf
Zm1jMl9uYW5kLmMgfCAxMSArKysrKy0tLS0tLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dG0zMl9mbWMyX25hbmQuYwo+Pj4+IGluZGV4IGFiNTMzMTQuLmYxNTljMzkgMTAwNjQ0Cj4+Pj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPj4+PiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4+IEBAIC0zNyw4ICszNyw3
IEBACj4+Pj4gICAgLyogTWF4IEVDQyBidWZmZXIgbGVuZ3RoICovCj4+Pj4gICAgI2RlZmluZSBG
TUMyX01BWF9FQ0NfQlVGX0xFTgkJKEZNQzJfQkNIRFNSU19MRU4gKiBGTUMyX01BWF9TRykKPj4+
PiAgICA+PiAtI2RlZmluZSBGTUMyX1RJTUVPVVRfVVMJCQkxMDAwCj4+Pj4gLSNkZWZpbmUgRk1D
Ml9USU1FT1VUX01TCQkJMTAwMAo+Pj4+ICsjZGVmaW5lIEZNQzJfVElNRU9VVF9NUwkJCTUwMDAK
Pj4+PiAgICA+PiAgIC8qIFRpbWluZ3MgKi8KPj4+PiAgICAjZGVmaW5lIEZNQzJfVEhJWgkJCTEK
Pj4+PiBAQCAtNTI1LDkgKzUyNCw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9oYW1fY2FsY3Vs
YXRlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpkYXRhLAo+Pj4+ICAgIAl1MzIg
c3IsIGhlY2NyOwo+Pj4+ICAgIAlpbnQgcmV0Owo+Pj4+ICAgID4+IC0JcmV0ID0gcmVhZGxfcmVs
YXhlZF9wb2xsX3RpbWVvdXQoZm1jMi0+aW9fYmFzZSArIEZNQzJfU1IsCj4+Pj4gLQkJCQkJIHNy
LCBzciAmIEZNQzJfU1JfTldSRiwgMTAsCj4+Pj4gLQkJCQkJIEZNQzJfVElNRU9VVF9NUyk7Cj4+
Pj4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9hdG9taWMoZm1jMi0+aW9fYmFz
ZSArIEZNQzJfU1IsCj4+Pj4gKwkJCQkJCXNyLCBzciAmIEZNQzJfU1JfTldSRiwgMSwKPj4+PiAr
CQkJCQkJMTAwMCAqIEZNQzJfVElNRU9VVF9NUyk7Cj4+Pgo+Pj4gSXMgdGhlIF9hdG9taWMgc3Vm
Zml4IG5lZWRlZCBoZXJlPyBJZiB5ZXMgaXQgd291bGQgZGVzZXJ2ZSBhIHNlcGFyYXRlCj4+PiBw
YXRjaCB3aXRoIEZpeGVzL1N0YWJsZSB0YWdzLgo+Pj4gICAgCj4+Cj4+IEkgaGF2ZSBjdXJyZW50
bHkgbm90IHNlZW4gYW55IGlzc3Vlcy4gU28sIEkgd2lsbCByZW1vdmUgdGhpcyBtb2RpZmljYXRp
b24gYXMgd2Ugd2lsbCBtb3ZlIHRvIHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dCBpbiBwYXRjaCAx
MC4KPj4KPj4+PiAgICAJaWYgKHJldCkgewo+Pj4+ICAgIAkJZGV2X2VycihmbWMyLT5kZXYsICJo
YW0gdGltZW91dFxuIik7Cj4+Pj4gICAgCQlyZXR1cm4gcmV0Owo+Pj4+IEBAIC0xMzE1LDcgKzEz
MTQsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfd2FpdHJkeShzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwLCB1bnNpZ25lZCBsb25nIHRpbWVvdXRfbXMpCj4+Pj4gICAgCS8qIENoZWNrIGlmIHRoZXJl
IGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMgdG8gdGhlIE5BTkQgZmxhc2ggKi8KPj4+PiAgICAJaWYg
KHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyhmbWMyLT5pb19iYXNlICsgRk1DMl9T
Uiwgc3IsCj4+Pj4gICAgCQkJCQkgICAgICBzciAmIEZNQzJfU1JfTldSRiwgMSwKPj4+PiAtCQkJ
CQkgICAgICBGTUMyX1RJTUVPVVRfVVMpKQo+Pj4+ICsJCQkJCSAgICAgIDEwMDAgKiBGTUMyX1RJ
TUVPVVRfTVMpKQo+Pj4+ICAgIAkJZGV2X3dhcm4oZm1jMi0+ZGV2LCAiV2FpdHJkeSB0aW1lb3V0
XG4iKTsKPj4+PiAgICA+PiAgIAkvKiBXYWl0IHRXQiBiZWZvcmUgUi9CIyBzaWduYWwgaXMgbG93
ICovCj4+Pgo+Pj4gWW91IGNoYW5nZSB0aGUgdGltZW91dHMgZnJvbSAxbXMgdG8gNXMuCj4+Pgo+
Pj4gTWF5YmUgNXMgaXMgYSBsaXR0bGUgYml0IHRvbyBtdWNoIElNSE8gYnV0IHdlIGRvbid0IHJl
YWxseSBjYXJlIGFzIHRoaXMKPj4+IGlzIGEgdGltZW91dC4gSG93ZXZlciAxbXMgaXMgdGlnaHQu
IElmIHlvdSBhcmUgY2hhbmdpbmcgdGhpcyB2YWx1ZQo+Pj4gYmVjYXVzZSBpdCB0cmlnZ2VycyBl
cnJvciAoZWcuIHdoZW4gdGhlIG1hY2hpbmUgaXMgbG9hZGVkKSwgdGhlbiBpdCBpcwo+Pj4gYSBm
aXggYW5kIHNob3VsZCBhcHBlYXIgbGlrZSBpdC4KPj4+Cj4+PiBUaGFua3MsCj4+PiBNaXF1w6hs
Cj4+PiAgICAKPj4KPj4gTm8gZXJyb3JzIGN1cnJlbnRseSBoYXBwZW5zLgo+PiBEdXJpbmcgb3Vy
IHN0cmVzcyB0ZXN0cywgaW4gYSBvdmVybG9hZGVkIHN5c3RlbSwgd2UgaGF2ZSBzZWVuIHRoYXQg
d2UgY291bGQgYmUgY2xvc2UgdG8gMSBzZWNvbmQsIGV2ZW4gaWYgd2UgbmV2ZXIgbWV0IHRoaXMg
dmFsdWUuCj4+IFNvLCB0byBiZSBzYWZlLCBJIGhhdmUgc2V0IHRoaXMgdGltZW91dCB0byA1IHNl
Y29uZHMuCj4+IEFzIGl0IGlzIGp1c3QgYSB0aW1lb3V0IHZhbHVlLCBJIGhhdmUgbm90IHNlZW4g
YW55IHNpZGUgZWZmZWN0Lgo+PiBJIGFtIHVzaW5nIHRoZSBzYW1lIHRpbWVvdXQgY29uc3RhbnQg
dG8gYXZvaWQgdG8gaGF2ZSBvbmUgdGltZW91dCBwZXIgY2FzZXMuCj4gCj4gU29tZXRoaW5nIGlz
IHdyb25nIGluIG15IG1pbmQ6Cj4gWW91IHNheSB5b3Ugb2JzZXJ2ZSBkZWxheXMgb2YgYWxtb3N0
IHVwIHRvIDEgc2Vjb25kLCBidXQgdGhlIHBvbGxpbmcKPiBjdXJyZW50bHkgaGFwcGVucyBvbiAx
MDAwIHVzID0gMW1zLCBlaXRoZXIgeW91IGhhZCB0aW1lb3V0cyBvciBJCj4gbWlzcmVhZCBzb21l
dGhpbmc/Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKCkhpIE1pcXXDqGwsCgpNeSBmYXVsdC4g
Rm9yIHRoaXMgcG9sbGluZywgd2UgbmV2ZXIgbWV0IDEgbXMuClRoZSAxIHNlY29uZCBvYnNlcnZl
ZCB3YXMgb24gdGhlIHNlcXVlbmNlciB3aGVuIHdlIHJlYWQvd3JpdGUgYSBwYWdlIChhcyAKaXQg
dGhlIHNhbWUgdGltZW91dCB2YWx1ZSB0aGF0IGlzIHVzZWQpCgpSZWdhcmRzLApDaHJpc3RvcGhl
IEtlcmVsbG8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
