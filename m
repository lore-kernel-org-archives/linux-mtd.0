Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6957BC76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 07:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPJ9f1rwVPJfp9x7gOtGJStOADJc6o7jgaB85TOqrkY=; b=vExsoBx+BPwuGx
	+VkLmUAAvO1bs+02Oh7etbx8+0609lKt32qrkA5AdpV6MxkTKCW//l6WgihTM4kkCu9Bl7VYNn2XU
	LP+md21zxvrs6KqsJK6SOX88SDb6xFScx/4p4+plp7HJffGQvD1QeAALjJNUqqdjqLVXih+217uUv
	f2JCgVD10F6+Pwq4K5KlYvq1zMw7X4ko7QZ37bgBOsgNDPhiNFPbJWJzWIQVeLis0GStE28H23KDT
	hV6LIcYXNXDHNcCQm7FsQB2WU2bn6TSlNvcLu9tLjkCE+6uVtYjuf8Xio/up+XtNyEhKiSzRS9+Dl
	Cj/kbXZxjj1qg0gMFG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3kb-00DRQr-06;
	Tue, 28 Mar 2023 07:28:13 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3kV-00DROo-30
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 07:28:11 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S7RoK2009859;
	Tue, 28 Mar 2023 09:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tER8DK2g80BbazA5IW8lJic8DvTLqWiMH7DZgWU67KA=;
 b=LaSSkrgxKYR62xt2dSZVnmnYQylQRsr8RPrN9YToWUXC0eOeQ7J/ueRQfzuwAwfiRDjv
 Co3ADlYbfQSwtqySYkvpJk5g3bWVky5oAUxsgXNjBgtj4hWzEQUnpJ7LOdCL0F842ggo
 5EBufGbbpDcf7CP8iqopi/VFyDQnqEKkFqD5T1OelMVCr4tCyvuxB59kfK93tkFE/b5O
 /SB2fFOekZv2CSzKoSoBAZd9xeXUEdA57EitWrcitldESs/46iUJkXKx5eR0Z41OiwLl
 hLorusrlWkzoXigEIrAudgkIMITNOMpS4hTyetLYtJe90dEOKwh7/hQlav37zutwM82r 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3phsr5fydc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 09:27:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4B8A10002A;
	Tue, 28 Mar 2023 09:27:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9483020A76D;
	Tue, 28 Mar 2023 09:27:57 +0200 (CEST)
Received: from [10.48.0.175] (10.48.0.175) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 09:27:56 +0200
Message-ID: <6759a843-409b-d9fe-8a00-ed6d69144aaf@foss.st.com>
Date: Tue, 28 Mar 2023 09:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use timings.mode instead
 of checking tRC_min
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
 <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
 <20230327124313.1ccd3d66@xps-13>
 <70d0a8b6-62c2-fa3e-df5c-f86ba75484d0@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <70d0a8b6-62c2-fa3e-df5c-f86ba75484d0@linaro.org>
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_002808_489925_E5903240 
X-CRM114-Status: GOOD (  22.90  )
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

SGVsbG8gTWlxdWVsLAoKT24gMy8yNy8yMyAxMzowNiwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiAK
PiAKPiBPbiAzLzI3LzIzIDExOjQzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIaSBUdWRvciwK
Pj4KPj4gdHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnIHdyb3RlIG9uIE1vbiwgMjcgTWFyIDIwMjMg
MTE6MzA6NTEgKzAxMDA6Cj4+Cj4+PiBPbiAzLzI3LzIzIDEwOjQ3LCBDaHJpc3RvcGhlIEtlcmVs
bG8gd3JvdGU6Cj4+Pj4gVGhpcyBwYXRjaCBpcyB1c2luZyB0aW1pbmdzLm1vZGUgdmFsdWUgaW5z
dGVhZCBvZiBjaGVja2luZyB0UkNfbWluIHRpbWluZwo+Pj4+IGZvciBFRE8gbW9kZSBzdXBwb3J0
Lgo+Pj4+ICAgIAo+Pj4KPj4+IEZpeGVzIGFuZCBDYyB0byBzdGFibGUgaGVyZSB0b28sIGFzIHlv
dSdkIGxpa2UgdG8gaGF2ZSB0aGlzIGJhY2twb3J0ZWQKPj4+IGFzIHdlbGwsIGRvbid0IHlvdT8K
Pj4KPj4gQWN0dWFsbHkgdGhlIHJlYXNvbiB3aHkgQ2hyaXN0b3BoZSBzcGxpdCB0aGlzIGludG8g
dHdvIHBhdGNoZXMgaXMKPj4gYmVjYXVzZSB0aW1pbmdzLm1vZGUgd2FzIGludHJvZHVjZWQgcmF0
aGVyIGxhdGVseSwgaGUgd2FudGVkIHRoZSBzYW1lCj4+IHBhdGNoIHRvIGFwcGx5IG9uIGFsbCBz
dGFibGUga2VybmVscywgaGUgYWN0dWFsbHkgYXNrZWQgZm9yIHRoYXQgc3BsaXQKPj4gYW5kIEkg
YWdyZWVkIChhbm90aGVyIHNvbHV0aW9uIHdvdWxkIGhhdmUgYmVlbiB0byBzZW5kIHRoaXMgY3Vy
cmVudAo+PiBwYXRjaCB0byBMaW51cyBhbmQgaGF2ZSB0aGUgb3RoZXIgdmVyc2lvbiBzZW50IHRv
IHN0YWJsZSwgYnV0IGl0Cj4+IHJlcXVpcmVzIGEgYml0IG9mIHNjaGVkdWxpbmcgb24gYm90aCBl
bmRzKS4KPj4KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMw
MzI3MTAxMTU2LjBlYzI4MTZhQHhwcy0xMy9ULyN0Cj4gCj4gUmlnaHQsIEkgdW5kZXJzdG9vZCB0
aGF0IGZyb20gdGhlIGJlZ2lubmluZy4gSWYgaXQgd2VyZSB0byBtZSwgSSB3b3VsZAo+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnICN2NS40KyBmb3IgdGhlIGZpcnN0IHBhdGNoIGFuZAo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnICN2NS4xMCsgZm9yIHRoZSBzZWNvbmQuCj4gCj4gU28g
Zmlyc3Qgd291bGQgYmUgYWxvbmUganVzdCBpbiB2NS40LCBhbmQgc3RhcnRpbmcgd2l0aCB2NS4x
MCB3ZSdsbCBoYXZlCj4gYm90aCBhbmQgd2UnbGwgbWltaWMgd2hhdCB3ZSBjdXJyZW50bHkgaGF2
ZSBpbiB1cHN0cmVhbSBtYWlubGluZS4KPiAKCkkgY2FuIHNlbmQgYSBWMyB3aXRoIGNjIHRhZyBh
ZGRlZCBhcyBwZXIgVHVkb3IncyBzdWdnZXN0aW9uLgpPciBjYyB0YWcgd2lsbCBiZSBhZGRlZCB3
aGVuIHRoZSBwYXRjaGVzIHdpbGwgYmUgYXBwbGllZD8KClJlZ2FyZHMsCkNocmlzdG9waGUgS2Vy
ZWxsby4KCj4+Cj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hy
aXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBUdWRvciBB
bWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4+Pgo+Pj4+IC0tLQo+Pj4+ICAgZHJp
dmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAyICstCj4+Pj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4+Pj4gaW5kZXggM2FiYjYzZDAwYTBiLi45ZTc0
YmNkOTBhYWEgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1j
Ml9uYW5kLmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQu
Ywo+Pj4+IEBAIC0xNTMxLDcgKzE1MzEsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3Nl
dHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+Pj4+ICAg
CWlmIChJU19FUlIoc2RydCkpCj4+Pj4gICAJCXJldHVybiBQVFJfRVJSKHNkcnQpOwo+Pj4+ICAg
Cj4+Pj4gLQlpZiAoc2RydC0+dFJDX21pbiA8IDMwMDAwKQo+Pj4+ICsJaWYgKGNvbmYtPnRpbWlu
Z3MubW9kZSA+IDMpCj4+Pj4gICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPj4+PiAgIAo+Pj4+ICAg
CWlmIChjaGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkpCj4+Cj4+Cj4+IFRoYW5r
cywKPj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
