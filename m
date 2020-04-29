Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FA6C83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 10:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 199052073E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 10:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mj3osMc6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Alq3gBQh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 199052073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aivtaOrdE5xAIQiigih+0kE7qZ/KZizeBRWknfZZCxI=; b=mj3osMc6Wme7eWRhF0yAVZJE7
	TMxVzzdPF3IgkvYzyJ6nTQv3LKE9LAWnbE1wvz4YsWzjgzK5uKGwxpNribvgM4OJNpLAKi8MW0Aid
	1Nz4ntwf5muVJd1XLHXKigj3eownbyVzKpopEYHGeWHuIEv1QiC78a3DYK3t+QclCAfVeF2pSzjg7
	cHTDk/Eud+iOQlYAPu9iJFkVh7nu3N359e9jM+HpVWbjn3xmr5QLBR79h5FOmCgbJWgDOP2p64jVx
	tjIulPgCfqti9qrK6M0KerhwHRFmCHue1fNtbvSQxC1QuV5eCSLYR64JANJ8jqNQ56Q7kDLR7uX/6
	UdPsWf/pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTjjV-0001GE-MQ; Wed, 29 Apr 2020 10:14:25 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTjjR-0001Fd-RC
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 10:14:23 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TACTrZ017973; Wed, 29 Apr 2020 12:13:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=W5A8lTFTfg+9iuepDFbRf4C+euOmp/nYF0WkFVb9u5o=;
 b=Alq3gBQhIyAHVodxDf8TqfFkbAZIFn7wy2gckqe0kyMIxkOtIcLiSe+WKo9E8ar4QJ/S
 l948MtEbrcbq72YHY/sKwUzy7lYreyBd2NXg8nr0aKb2EtKMz6lcPheqVQAOSI1bGzsU
 m7fpSWzT3wNRhI7g+D9235QUsyFr71rrMtdvv2rJ5VPQBZSR33u4E5tM1ER8SHKC7II8
 zknaO0+2FemsepXW9KKJEV7+jCYEDxYWNWBEVwW6EIyP917c12ZEj08oAjuvuwtd1o5i
 EvTYJUZpNLXsjQ+j/3a0YbpRiviWiuOvB8IsEYh5Mvrgx63xavdkJTahXKSsb7ApTovx 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhcc5nex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 12:13:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80D2A10002A;
 Wed, 29 Apr 2020 12:13:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48F2220B86D;
 Wed, 29 Apr 2020 12:13:42 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.44) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 12:13:33 +0200
Subject: Re: [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS
 for timeouts
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13> <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
 <20200429113529.5ddc3ad9@xps13> <b6b31f36-8e8f-4042-2587-0dcad82aafc5@st.com>
 <20200429120632.7bce63e6@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <cf4f4d00-7cfd-d0df-3004-9fd534e62bd0@st.com>
Date: Wed, 29 Apr 2020 12:13:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200429120632.7bce63e6@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-29,
 2020-04-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_031422_338705_749A5ED9 
X-CRM114-Status: GOOD (  24.81  )
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

CgpPbiA0LzI5LzIwIDEyOjA2IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIENocmlzdG9w
aGUsCj4gCj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3
cm90ZSBvbiBXZWQsIDI5IEFwcgo+IDIwMjAgMTE6NDE6NDQgKzAyMDA6Cj4gCj4+IE9uIDQvMjkv
MjAgMTE6MzUgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBIaSBDaHJpc3RvcGhlLAo+Pj4K
Pj4+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGUg
b24gV2VkLCAyOSBBcHIKPj4+IDIwMjAgMTE6Mjc6NDMgKzAyMDA6Cj4+PiAgICAKPj4+PiBIaSBN
aXF1w6hsLAo+Pj4+Cj4+Pj4gT24gNC8yNy8yMCA4OjIyIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+Pj4+PiBIaSBDaHJpc3RvcGhlLAo+Pj4+Pgo+Pj4+PiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNo
cmlzdG9waGUua2VyZWxsb0BzdC5jb20+IHdyb3RlIG9uIFdlZCwgMTUgQXByCj4+Pj4+IDIwMjAg
MTc6NTc6MzAgKzAyMDA6Cj4+Pj4+ICAgICA+Pj4+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgY29u
c3RhbnQgRk1DMl9USU1FT1VUX1VTLgo+Pj4+Pj4gRk1DMl9USU1FT1VUX01TIGlzIHNldCB0byA1
IHNlY29uZHMgYW5kIHRoaXMgY29uc3RhbnQgaXMgdXNlZAo+Pj4+Pj4gZWFjaCB0aW1lIHRoYXQg
d2UgbmVlZCB0byB3YWl0IChleGNlcHQgd2hlbiB0aGUgdGltZW91dCB2YWx1ZQo+Pj4+Pj4gaXMg
c2V0IGJ5IHRoZSBmcmFtZXdvcmspCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+
PiAgICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAxMSArKysrKy0t
LS0tLQo+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0
bTMyX2ZtYzJfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMK
Pj4+Pj4+IGluZGV4IGFiNTMzMTQuLmYxNTljMzkgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPj4+Pj4+IEBAIC0zNyw4ICszNyw3IEBACj4+Pj4+
PiAgICAgLyogTWF4IEVDQyBidWZmZXIgbGVuZ3RoICovCj4+Pj4+PiAgICAgI2RlZmluZSBGTUMy
X01BWF9FQ0NfQlVGX0xFTgkJKEZNQzJfQkNIRFNSU19MRU4gKiBGTUMyX01BWF9TRykKPj4+Pj4+
ICAgICA+PiAtI2RlZmluZSBGTUMyX1RJTUVPVVRfVVMJCQkxMDAwCj4+Pj4+PiAtI2RlZmluZSBG
TUMyX1RJTUVPVVRfTVMJCQkxMDAwCj4+Pj4+PiArI2RlZmluZSBGTUMyX1RJTUVPVVRfTVMJCQk1
MDAwCj4+Pj4+PiAgICAgPj4gICAvKiBUaW1pbmdzICovCj4+Pj4+PiAgICAgI2RlZmluZSBGTUMy
X1RISVoJCQkxCj4+Pj4+PiBAQCAtNTI1LDkgKzUyNCw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1j
Ml9oYW1fY2FsY3VsYXRlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpkYXRhLAo+
Pj4+Pj4gICAgIAl1MzIgc3IsIGhlY2NyOwo+Pj4+Pj4gICAgIAlpbnQgcmV0Owo+Pj4+Pj4gICAg
ID4+IC0JcmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQoZm1jMi0+aW9fYmFzZSArIEZN
QzJfU1IsCj4+Pj4+PiAtCQkJCQkgc3IsIHNyICYgRk1DMl9TUl9OV1JGLCAxMCwKPj4+Pj4+IC0J
CQkJCSBGTUMyX1RJTUVPVVRfTVMpOwo+Pj4+Pj4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxf
dGltZW91dF9hdG9taWMoZm1jMi0+aW9fYmFzZSArIEZNQzJfU1IsCj4+Pj4+PiArCQkJCQkJc3Is
IHNyICYgRk1DMl9TUl9OV1JGLCAxLAo+Pj4+Pj4gKwkJCQkJCTEwMDAgKiBGTUMyX1RJTUVPVVRf
TVMpOwo+Pj4+Pgo+Pj4+PiBJcyB0aGUgX2F0b21pYyBzdWZmaXggbmVlZGVkIGhlcmU/IElmIHll
cyBpdCB3b3VsZCBkZXNlcnZlIGEgc2VwYXJhdGUKPj4+Pj4gcGF0Y2ggd2l0aCBGaXhlcy9TdGFi
bGUgdGFncy4KPj4+Pj4gICAgID4+Cj4+Pj4gSSBoYXZlIGN1cnJlbnRseSBub3Qgc2VlbiBhbnkg
aXNzdWVzLiBTbywgSSB3aWxsIHJlbW92ZSB0aGlzIG1vZGlmaWNhdGlvbiBhcyB3ZSB3aWxsIG1v
dmUgdG8gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0IGluIHBhdGNoIDEwLgo+Pj4+ICAgCj4+Pj4+
PiAgICAgCWlmIChyZXQpIHsKPj4+Pj4+ICAgICAJCWRldl9lcnIoZm1jMi0+ZGV2LCAiaGFtIHRp
bWVvdXRcbiIpOwo+Pj4+Pj4gICAgIAkJcmV0dXJuIHJldDsKPj4+Pj4+IEBAIC0xMzE1LDcgKzEz
MTQsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfd2FpdHJkeShzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwLCB1bnNpZ25lZCBsb25nIHRpbWVvdXRfbXMpCj4+Pj4+PiAgICAgCS8qIENoZWNrIGlmIHRo
ZXJlIGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMgdG8gdGhlIE5BTkQgZmxhc2ggKi8KPj4+Pj4+ICAg
ICAJaWYgKHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyhmbWMyLT5pb19iYXNlICsg
Rk1DMl9TUiwgc3IsCj4+Pj4+PiAgICAgCQkJCQkgICAgICBzciAmIEZNQzJfU1JfTldSRiwgMSwK
Pj4+Pj4+IC0JCQkJCSAgICAgIEZNQzJfVElNRU9VVF9VUykpCj4+Pj4+PiArCQkJCQkgICAgICAx
MDAwICogRk1DMl9USU1FT1VUX01TKSkKPj4+Pj4+ICAgICAJCWRldl93YXJuKGZtYzItPmRldiwg
IldhaXRyZHkgdGltZW91dFxuIik7Cj4+Pj4+PiAgICAgPj4gICAJLyogV2FpdCB0V0IgYmVmb3Jl
IFIvQiMgc2lnbmFsIGlzIGxvdyAqLwo+Pj4+Pgo+Pj4+PiBZb3UgY2hhbmdlIHRoZSB0aW1lb3V0
cyBmcm9tIDFtcyB0byA1cy4KPj4+Pj4KPj4+Pj4gTWF5YmUgNXMgaXMgYSBsaXR0bGUgYml0IHRv
byBtdWNoIElNSE8gYnV0IHdlIGRvbid0IHJlYWxseSBjYXJlIGFzIHRoaXMKPj4+Pj4gaXMgYSB0
aW1lb3V0LiBIb3dldmVyIDFtcyBpcyB0aWdodC4gSWYgeW91IGFyZSBjaGFuZ2luZyB0aGlzIHZh
bHVlCj4+Pj4+IGJlY2F1c2UgaXQgdHJpZ2dlcnMgZXJyb3IgKGVnLiB3aGVuIHRoZSBtYWNoaW5l
IGlzIGxvYWRlZCksIHRoZW4gaXQgaXMKPj4+Pj4gYSBmaXggYW5kIHNob3VsZCBhcHBlYXIgbGlr
ZSBpdC4KPj4+Pj4KPj4+Pj4gVGhhbmtzLAo+Pj4+PiBNaXF1w6hsCj4+Pj4+ICAgICA+Pgo+Pj4+
IE5vIGVycm9ycyBjdXJyZW50bHkgaGFwcGVucy4KPj4+PiBEdXJpbmcgb3VyIHN0cmVzcyB0ZXN0
cywgaW4gYSBvdmVybG9hZGVkIHN5c3RlbSwgd2UgaGF2ZSBzZWVuIHRoYXQgd2UgY291bGQgYmUg
Y2xvc2UgdG8gMSBzZWNvbmQsIGV2ZW4gaWYgd2UgbmV2ZXIgbWV0IHRoaXMgdmFsdWUuCj4+Pj4g
U28sIHRvIGJlIHNhZmUsIEkgaGF2ZSBzZXQgdGhpcyB0aW1lb3V0IHRvIDUgc2Vjb25kcy4KPj4+
PiBBcyBpdCBpcyBqdXN0IGEgdGltZW91dCB2YWx1ZSwgSSBoYXZlIG5vdCBzZWVuIGFueSBzaWRl
IGVmZmVjdC4KPj4+PiBJIGFtIHVzaW5nIHRoZSBzYW1lIHRpbWVvdXQgY29uc3RhbnQgdG8gYXZv
aWQgdG8gaGF2ZSBvbmUgdGltZW91dCBwZXIgY2FzZXMuCj4+Pgo+Pj4gU29tZXRoaW5nIGlzIHdy
b25nIGluIG15IG1pbmQ6Cj4+PiBZb3Ugc2F5IHlvdSBvYnNlcnZlIGRlbGF5cyBvZiBhbG1vc3Qg
dXAgdG8gMSBzZWNvbmQsIGJ1dCB0aGUgcG9sbGluZwo+Pj4gY3VycmVudGx5IGhhcHBlbnMgb24g
MTAwMCB1cyA9IDFtcywgZWl0aGVyIHlvdSBoYWQgdGltZW91dHMgb3IgSQo+Pj4gbWlzcmVhZCBz
b21ldGhpbmc/Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobAo+Pj4gICAgCj4+Cj4+IEhpIE1p
cXXDqGwsCj4+Cj4+IE15IGZhdWx0LiBGb3IgdGhpcyBwb2xsaW5nLCB3ZSBuZXZlciBtZXQgMSBt
cy4KPj4gVGhlIDEgc2Vjb25kIG9ic2VydmVkIHdhcyBvbiB0aGUgc2VxdWVuY2VyIHdoZW4gd2Ug
cmVhZC93cml0ZSBhIHBhZ2UgKGFzIGl0IHRoZSBzYW1lIHRpbWVvdXQgdmFsdWUgdGhhdCBpcyB1
c2VkKQo+IAo+IE9LIEkgZ2V0IGl0LiBTbyBwZXJoYXBzIHlvdSBjYW4gZ2l2ZSB0aGVzZSBkZXRh
aWxzIGluIHRoZSBjb21taXQgbG9nIHRvCj4gZXhwbGFpbiB3aHkgeW91IHVzZSA1IHNlY29uZHMg
aW5zdGVhZCBvZiBvbmUuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKCkhpIE1pcXXDqGwsCgpB
IHByb3Bvc2FsIGNvdWxkIGFsc28gYmUgdG8gc3BsaXQgdGhpcyBwYXRjaDoKICAtIGEgZmlyc3Qg
cGF0Y2ggdGhhdCBpcyB1c2luZyBvbmx5IG9uZSB0aW1lb3V0IHZhbHVlLgogIC0gYSBzZWNvbmQg
cGF0Y2ggdGhhdCBpcyBpbmNyZWFzaW5nIHRoZSB2YWx1ZSB0byA1IHNlY29uZHMuCgpSZWdhcmRz
LApDaHJpc3RvcGhlIEtlcmVsbG8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
