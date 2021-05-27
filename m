Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3DEC47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 07:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73C57610A2
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 07:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73C57610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mQZRm3iOADPrDaCBoF4pZ6Z7xjlIc4PKIKP4ic5SO8o=; b=efbVCjdwfhuUEcH9sCRf3AsN0h
	deC/PGxo1su8nCmzQYMZIZHOOFULLbnjeFu49Es4qc6JEiDtue7F+rBMQnbUUsBxTL6K9k/lHtEt9
	L407/hTnVuhfK66aMrHBZHzl5zCbYHv1+i6noUigF86E80NRFhbR94B/mIyaA44qiV/jGqZqkCG/I
	2xe1/lIvOLhuDPlQx89zvdawmws1kLrWx8Q0n1S9PS0Tg0+BSpnrwQZK9XY92/A7H2WSGPkIv3LGp
	NP7LOBEFddr5EyzW0kfaabjkmuSkM1SByhm9wEvfCwdzPZRyqP1jvnwzsjFgUctA3ZaoQ52kLcV6m
	Z9I0mJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmA1z-003CzW-1j; Thu, 27 May 2021 07:02:11 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmA1s-003Cxj-Cr; Thu, 27 May 2021 07:02:06 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14R6qG8u004364; Thu, 27 May 2021 09:01:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=m5LUVeVAx0H7+efdYUrqUWDIzqQfwVOfhaTcVb+GW5A=;
 b=ChTJS68yGPIcxkI0k67wVFxq00xNvLuS8K7qe1etRjlMXWmo2bBvZJubcW+JZRwJQ1e8
 5pglsZMtkeQYit0AJVLDoW0fcdlKRkj4erYa7Ne64IKNY1/szESr/sspaVFk/k6U+WCS
 5wJ5J48jIGynjdXiZ2/LlFAyY8Qhi5sYeSTY5pw42EC7FOXg3S4YpF0n/AgiasWp+jKn
 6to0oYcMhiEc1cntBw1eJM7+x7fiYUGTs/LQukcNJaL+nE7wSCi4HRmBlhFhUtyzKj7C
 58r6sF8Wcmv0FCEpedo26nYe4R+sj4fVvGEkBk8RL1+2DRUEx7UQX5qM4FnAx/PEUrv3 Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0x91mr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 09:01:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C869610002A;
 Thu, 27 May 2021 09:01:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE683212FC0;
 Thu, 27 May 2021 09:01:57 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 09:01:57 +0200
Subject: Re: mtd: spinand: add spi nand mtd resume handler
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
 <20210526174224.2b8714fc@xps13>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <bbfc7b31-c49c-e52d-0ea6-20ec81317cac@foss.st.com>
Date: Thu, 27 May 2021 09:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210526174224.2b8714fc@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_02:2021-05-26,
 2021-05-27 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_000204_942597_D5D94B19 
X-CRM114-Status: GOOD (  30.74  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsCgpPbiA1LzI2LzIxIDU6NDIgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVs
bG8sCj4gCj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGUgb24gV2VkLCAyNiBN
YXkgMjAyMSAxNzozMDoxNiArMDIwMDoKPiAKPj4gRnJvbTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxj
aHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gCj4gV291bGQgeW91IG1pbmQgdG8gdXNl
ICJhZGQgU1BJLU5BTkQgTVREIHJlc3VtZSBoYW5kbGVyIiBhcyB0aXRsZT8gKHdpdGgKPiB1cHBl
ciBjYXNlIGxldHRlcnMpCgpPawoKPiAKPj4gQWZ0ZXIgcG93ZXIgdXAsIGFsbCBTUEkgTkFORCdz
IGJsb2NrcyBhcmUgbG9ja2VkLiBPbmx5IHJlYWQgb3BlcmF0aW9ucwo+PiBhcmUgYWxsb3dlZCwg
d3JpdGUgYW5kIGVyYXNlIG9wZXJhdGlvbnMgYXJlIGZvcmJpZGRlbi4KPj4gVGhlIFNQSSBOQU5E
IGZyYW1ld29yayB1bmxvY2tzIGFsbCB0aGUgYmxvY2tzIGR1cmluZyBpdHMgaW5pdGlhbGl6YXRp
b24uCj4+Cj4+IER1cmluZyBhIHN0YW5kYnkgbG93IHBvd2VyLCB0aGUgbWVtb3J5IGlzIHBvd2Vy
ZWQgZG93biwgbG9zaW5nIGl0cwo+PiBjb25maWd1cmF0aW9uLgo+PiBEdXJpbmcgdGhlIHJlc3Vt
ZSwgdGhlIFFTUEkgZHJpdmVyIHN0YXRlIGlzIHJlc3RvcmVkIGJ1dCB0aGUgU1BJIE5BTkQKPj4g
ZnJhbWV3b3JrIGRvZXMgbm90IHJlY29uZmlndXJlZCB0aGUgbWVtb3J5Lgo+Pgo+PiBUaGlzIHBh
dGNoIGFkZHMgc3BpIG5hbmQgbXRkIFBNIGhhbmRsZXJzIGZvciByZXN1bWUgb3BzLgo+IAo+IGRp
dHRvICAgICAgICAgICAgIF5eXl5eXl5eXl5eXgoKT2sKCj4gCj4+IFNQSSBOQU5EIHJlc3VtZSBv
cCByZS1pbml0aWFsaXplcyBTUEkgTkFORCBmbGFzaCB0byBpdHMgcHJvYmVkIHN0YXRlLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bm
b3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
IHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNo
YW5nZWQsIDU2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBpbmRleCAxN2Y2
M2Y5NWY0YTIuLjZhYmFmODc0ZWIzZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBAQCAtMTA3
NCw2ICsxMDc0LDYxIEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRf
ZGV2aWNlICpzcGluYW5kKQo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgdm9p
ZCBzcGluYW5kX210ZF9yZXN1bWUoc3RydWN0IG10ZF9pbmZvICptdGQpCj4+ICt7Cj4+ICsJc3Ry
dWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0gbXRkX3RvX3NwaW5hbmQobXRkKTsKPj4gKwlz
dHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBtdGRfdG9fbmFuZGRldihtdGQpOwo+PiArCXN0cnVj
dCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+PiArCWludCByZXQs
IGk7Cj4+ICsKPj4gKwlyZXQgPSBzcGluYW5kX3Jlc2V0X29wKHNwaW5hbmQpOwo+PiArCWlmIChy
ZXQpCj4+ICsJCXJldHVybjsKPj4gKwo+PiArCXJldCA9IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJs
ZShzcGluYW5kKTsKPj4gKwlpZiAocmV0KSB7Cj4+ICsJCWRldl9lcnIoZGV2LAo+PiArCQkJIkZh
aWxlZCB0byBpbml0aWFsaXplIHRoZSBxdWFkIHBhcnQgKGVyciA9ICVkKVxuIiwKPiAKPiBxdWFk
IHBhcnQ/IHdoYXQgYWJvdXQgIkZhaWxlZCB0byByZXN1bWUgdGhlIHF1YWQgc3RhdGUiIG9yIHNv
bWV0aGluZwo+IGFsaWtlPwoKQWdyZWUsIGkgd2lsbCB1cGRhdGUgdGhpcwoKPiAKPj4gKwkJCXJl
dCk7Cj4+ICsJCXJldHVybjsKPj4gKwl9Cj4+ICsKPj4gKwlyZXQgPSBzcGluYW5kX3VwZF9jZmco
c3BpbmFuZCwgQ0ZHX09UUF9FTkFCTEUsIDApOwo+PiArCWlmIChyZXQpIHsKPj4gKwkJZGV2X2Vy
cihkZXYsCj4+ICsJCQkiRmFpbGVkIHRvIHVwZHRhZSB0aGUgT1RQIChlcnIgPSAlZClcbiIsCj4g
Cj4gdXBkYXRlCgpvawoKPiAKPj4gKwkJCXJldCk7Cj4+ICsJCXJldHVybjsKPj4gKwl9Cj4+ICsK
Pj4gKwlyZXQgPSBzcGluYW5kX21hbnVmYWN0dXJlcl9pbml0KHNwaW5hbmQpOwo+PiArCWlmIChy
ZXQpIHsKPj4gKwkJZGV2X2VycihkZXYsCj4+ICsJCQkiRmFpbGVkIHRvIGluaXRpYWxpemUgdGhl
IFNQSSBOQU5EIGNoaXAgKGVyciA9ICVkKVxuIiwKPj4gKwkJCXJldCk7Cj4+ICsJCXJldHVybjsK
Pj4gKwl9Cj4+ICsKPj4gKwkvKiBBZnRlciBwb3dlciB1cCwgYWxsIGJsb2NrcyBhcmUgbG9ja2Vk
LCBzbyB1bmxvY2sgdGhlbSBoZXJlLiAqLwo+PiArCWZvciAoaSA9IDA7IGkgPCBuYW5kLT5tZW1v
cmcubnRhcmdldHM7IGkrKykgewo+PiArCQlyZXQgPSBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3Bp
bmFuZCwgaSk7Cj4+ICsJCWlmIChyZXQpIHsKPj4gKwkJCWRldl9lcnIoZGV2LAo+PiArCQkJCSJG
YWlsZWQgdG8gc2VsZWN0IHRoZSB0YXJnZXQgKGVyciA9ICVkKVxuIiwKPj4gKwkJCQlyZXQpOwo+
PiArCQkJcmV0dXJuOwo+PiArCQl9Cj4+ICsKPj4gKwkJcmV0ID0gc3BpbmFuZF9sb2NrX2Jsb2Nr
KHNwaW5hbmQsIEJMX0FMTF9VTkxPQ0tFRCk7Cj4+ICsJCWlmIChyZXQpIHsKPj4gKwkJCWRldl9l
cnIoZGV2LAo+PiArCQkJCSJGYWlsZWQgdG8gdW5sb2NrIGJsb2NrIChlcnIgPSAlZClcbiIsCj4+
ICsJCQkJcmV0KTsKPj4gKwkJCXJldHVybjsKPj4gKwkJfQo+PiArCX0KPiAKPiBJIGJldCB0aGlz
IHdvdWxkIGRlc2VydmUgYSBoZWxwZXIgYXMgdGhpcyBpcyB0aGUgZXhhY3Qgc2FtZSBwZWFjZSBv
Zgo+IGNvZGUgdGhhdCBpcyBiZWluZyBydW4gaW4gc3Bpbm5hbmRfaW5pdCgpPwoKSSB3aWxsIGFk
ZCBhIG5ldyBmdW5jdGlvbiBzcGluYW5kX2Jsb2NrX3VubG9jayhzdHJ1Y3Qgc3BpbmFuZF9kZXZp
Y2UgKnNwaW5hbmQpCgo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0IEkgdGhpbmsgdGhhdCBzcGluYW5k
X2VjY19lbmFibGUoc3BpbmFuZCwgZmFsc2UpOwo+IHNob3VsZCBiZSBjYWxsZWQuCkkgd2lsbCBh
ZGQgaXQuIAoKPiAKPiBJZGVhbGx5LCBhIHJlc3VtZSBvcGVyYXRpb24gc2hvdWxkIGJlIHByb3Zp
ZGVkIGJ5IEVDQyBlbmdpbmVzLCBidXQgdGhhdAo+IGNhbiBiZSBhZGRlZCBsYXRlci4KPiAKPj4g
K30KPj4gKwo+PiAgc3RhdGljIGludCBzcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kKQo+PiAgewo+PiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGlt
ZW0tPnNwaS0+ZGV2Owo+PiBAQCAtMTE2Nyw2ICsxMjIyLDcgQEAgc3RhdGljIGludCBzcGluYW5k
X2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+PiAgCW10ZC0+X2Jsb2NrX2lz
cmVzZXJ2ZWQgPSBzcGluYW5kX210ZF9ibG9ja19pc3Jlc2VydmVkOwo+PiAgCW10ZC0+X2VyYXNl
ID0gc3BpbmFuZF9tdGRfZXJhc2U7Cj4+ICAJbXRkLT5fbWF4X2JhZF9ibG9ja3MgPSBuYW5kZGV2
X210ZF9tYXhfYmFkX2Jsb2NrczsKPj4gKwltdGQtPl9yZXN1bWUgPSBzcGluYW5kX210ZF9yZXN1
bWU7Cj4+ICAKPj4gIAlpZiAobmFuZC0+ZWNjLmVuZ2luZSkgewo+PiAgCQlyZXQgPSBtdGRfb29i
bGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOwo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gClRo
YW5rcwpQYXRyaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
