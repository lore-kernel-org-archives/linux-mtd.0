Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F67EC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13BB02074A
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQfvm9n0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="Na+Wj74z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13BB02074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f8mpX8fEVkgVwZVUDHXPOx989HC+y6epybf46QNrpE0=; b=GQfvm9n0vbhthltxsodytYiP4
	Qn1rfCZ6T8ofFDbPQg3KWsQErOBD/DM8F/+JqEe91iGHAmSdRMbF8olbS+KYUUE4Zyt/N40oGNvHx
	VES2mjMCMaRwZTW0T+PzW2IqnO9UbFhhkjovnzsE2zih0X2CWRF1EUXHxBackEnv9MXIoZz9kinfF
	j+jJqqDJ9F/gEgtxXmFVFpG8JXilgV7pB/sUznNB/ygKlCc9TfHCS4zb2VBNre0KDH60wUxmfxs03
	zTrpk9nQdt5BFussB706HB9B9NNh4+cgQivgKKPe6hg4J9/Lv2FUxWHx0+2ZTLff15gWBnp8rRzYz
	LSymE47UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTj3u-0003IP-Ku; Wed, 29 Apr 2020 09:31:26 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTj3r-0003HY-5b
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 09:31:24 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T9QQA7009878; Wed, 29 Apr 2020 11:31:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=DRjQYztleGVSiDwTizC2lxz1DCDBXrRlNa50jKUHHJc=;
 b=Na+Wj74zfR2NIBXfPk/efWyfHb+B7utgS3kgr6bnLeGH3k+bB3soaIG7zA3YhDiXZP1S
 s3gPfT4pA3WHL+dhLEEh/dVakow4UAXkG2RtytHlC3cxF12fK7ISJb1C8NkvBzcQaOoq
 NTsNQE62FcpzG7mABhYo5lekMkFJS+sJtfZMNbdt6hdR/yM2OJe2SdPs9CldkARVdU6f
 5CZNnznzgnlHQjK7yuCLOw2aN1cf1LiaYX5mXAs/NdvQRsQzqG4ERNeR/4KqIFXNfbiX
 20+pC7ySrt7TMAdTYDkAQchy7dAnR49j0rCsxvsKwy4yuE7ltYSBeXFv8OZuGmF2eele HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq65djh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:31:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BD1710002A;
 Wed, 29 Apr 2020 11:31:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6209207570;
 Wed, 29 Apr 2020 11:31:09 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.44) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 11:31:08 +0200
Subject: Re: [PATCH v2 07/12] mtd: rawnand: stm32_fmc2: cleanup
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-8-git-send-email-christophe.kerello@st.com>
 <20200427203314.798b3c4e@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <bb4a6377-2cbd-f990-0c55-cb393292aee9@st.com>
Date: Wed, 29 Apr 2020 11:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200427203314.798b3c4e@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-28,
 2020-04-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_023123_499487_2DC62C2D 
X-CRM114-Status: GOOD (  16.64  )
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

SGkgTWlxdcOobCwKCk9uIDQvMjcvMjAgODozMyBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKPiAyMDIwIDE3OjU3OjMxICswMjAwOgo+IAo+
PiBUaGlzIHBhdGNoIHJlbmFtZXMgZnVuY3Rpb25zIGFuZCBsb2NhbCB2YXJpYWJsZXMgdG8gYmUg
cmVhZHkgdG8gdXNlCj4+IHN0bTMyX2ZtYzIgc3RydWN0dXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4+IC0tLQo+
IAo+PiAtc3RhdGljIGludCBzdG0zMl9mbWMyX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+PiAtCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX2Rh
dGFfaW50ZXJmYWNlICpjb25mKQo+PiArc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19zZXR1cF9p
bnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPj4gKwkJCQkJICBj
b25zdCBzdHJ1Y3QgbmFuZF9kYXRhX2ludGVyZmFjZSAqY2YpCj4gCj4gSSBzdXBwb3NlIHlvdSBz
L2NvbmYvY2YvIGJlY2F1c2Ugb2YgdGhlIDgwIGNoYXJzIGJvdW5kYXJ5LiBJbiB0aGlzIGNhc2UK
PiBJIGRvbid0IG1pbmQgY3Jvc3NpbmcgaXQsIEkgZG9uJ3QgdGhpbmsgaXQgaXMgYmV0dGVyIHRv
IHJlbmFtZSB0aGUKPiBjb25mIHBhcmFtZXRlciBmb3IgdGhpcyByZWFzb24uCj4gCgpZZXMsIHlv
dSBhcmUgcmlnaHQuIEkgaGF2ZSBtb2RpZmllZCBpdCBiZWNhdXNlIG9mIDgwIGNoYXJzIGJvdW5k
YXJ5LgpJIHdpbGwga2VlcCBjb25mIGluIHYzLgoKPj4gICB7Cj4+ICAgCWNvbnN0IHN0cnVjdCBu
YW5kX3Nkcl90aW1pbmdzICpzZHJ0Owo+PiAgIAo+PiAtCXNkcnQgPSBuYW5kX2dldF9zZHJfdGlt
aW5ncyhjb25mKTsKPj4gKwlzZHJ0ID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY2YpOwo+PiAgIAlp
ZiAoSVNfRVJSKHNkcnQpKQo+PiAgIAkJcmV0dXJuIFBUUl9FUlIoc2RydCk7Cj4+ICAgCj4+ICAg
CWlmIChjaGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkpCj4+ICAgCQlyZXR1cm4g
MDsKPj4gICAKPj4gLQlzdG0zMl9mbWMyX2NhbGNfdGltaW5ncyhjaGlwLCBzZHJ0KTsKPj4gLQlz
dG0zMl9mbWMyX3RpbWluZ3NfaW5pdChjaGlwKTsKPj4gKwlzdG0zMl9mbWMyX25mY19jYWxjX3Rp
bWluZ3MoY2hpcCwgc2RydCk7Cj4+ICsJc3RtMzJfZm1jMl9uZmNfdGltaW5nc19pbml0KGNoaXAp
Owo+PiAgIAo+PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+ICAgCj4gCj4gWy4uLl0KPiAKPj4gICAK
Pj4gLXN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX2ZtYzJfZHJpdmVyID0gewo+
PiAtCS5wcm9iZQk9IHN0bTMyX2ZtYzJfcHJvYmUsCj4+IC0JLnJlbW92ZQk9IHN0bTMyX2ZtYzJf
cmVtb3ZlLAo+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfZm1jMl9uZmNf
ZHJpdmVyID0gewo+PiArCS5wcm9iZQk9IHN0bTMyX2ZtYzJfbmZjX3Byb2JlLAo+PiArCS5yZW1v
dmUJPSBzdG0zMl9mbWMyX25mY19yZW1vdmUsCj4+ICAgCS5kcml2ZXIJPSB7Cj4+IC0JCS5uYW1l
ID0gInN0bTMyX2ZtYzJfbmFuZCIsCj4+IC0JCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2ZtYzJf
bWF0Y2gsCj4+IC0JCS5wbSA9ICZzdG0zMl9mbWMyX3BtX29wcywKPj4gKwkJLm5hbWUgPSAic3Rt
MzJfZm1jMl9uZmMiLAo+PiArCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9mbWMyX25mY19tYXRj
aCwKPj4gKwkJLnBtID0gJnN0bTMyX2ZtYzJfbmZjX3BtX29wcywKPj4gICAJfSwKPj4gICB9Owo+
PiAtbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihzdG0zMl9mbWMyX2RyaXZlcik7Cj4+ICttb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHN0bTMyX2ZtYzJfbmZjX2RyaXZlcik7Cj4+ICAgCj4+IC1NT0RVTEVf
QUxJQVMoInBsYXRmb3JtOnN0bTMyX2ZtYzJfbmFuZCIpOwo+PiArTU9EVUxFX0FMSUFTKCJwbGF0
Zm9ybTpzdG0zMl9mbWMyX25mYyIpOwo+PiAgIE1PRFVMRV9BVVRIT1IoIkNocmlzdG9waGUgS2Vy
ZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4iKTsKPj4gLU1PRFVMRV9ERVNDUklQVElP
TigiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIEZNQzIgbmFuZCBkcml2ZXIiKTsKPj4gK01PRFVM
RV9ERVNDUklQVElPTigiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIEZNQzIgbmZjIGRyaXZlciIp
Owo+IAo+IEkgd291bGQgcHJlZmVyOiBzL25mYy9ORkMvIGhlcmUgcGxlYXNlLgo+IAoKSXQgd2ls
bCBiZSBtb2RpZmllZCBpbiB2My4KClJlZ2FyZHMsCkNocmlzdG9waGUgS2VyZWxsby4KCj4+ICAg
TU9EVUxFX0xJQ0VOU0UoIkdQTCB2MiIpOwo+IAo+IFdpdGggdGhlc2UgdHdvIG5pdHMsCj4gCj4g
UmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4g
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
