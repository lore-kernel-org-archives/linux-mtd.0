Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B52C4708C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 08:23:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57EA1613E3
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 08:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57EA1613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=14NdN7/oAwoxBvSSHlAaQxMVmmAW8G60tt+LqkH1sxY=; b=Xcv2Gn1ymguAp5x7XDKE9znvdT
	m4e60lh83+2Fs/CHNRpul4qlAxl9E+2TOG/5CXL6rgYWtRgrRd/NOgwwzOSit0/SO7aYv/hU9P+We
	i2KLVByuV31OPrm8ko8c8ky7U3/dKhMMkiQBjyDtaMtRiYTWX4OKjZ2OC9ctl7YwAPhD/eSxEY7J8
	5tsruR96CDgJSEs/NQ9MpaRxe8k4kh+/aXcV/DRiwLUCBxPFe/QLWLObVVZMIVrZ4zxJwyVSYM0oG
	aCQYYDtrmo6Il3ghFCM3FNWxYTU8KAakSaWBADGGZ/7MoS/jNbAE0JUpA34swAQsw+b+FZqob08qg
	L9yPW3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXln-00DP6d-Lw; Fri, 28 May 2021 08:23:04 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXlj-00DP3f-6Q; Fri, 28 May 2021 08:23:01 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14S8MGrN010780; Fri, 28 May 2021 10:22:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SC8NOG3k/WMH3/oxYElq4I18/iOVJMr+y1hZSlPxh+M=;
 b=uyWVP4X7Gi+YyCvJ2gJlz6DLBAjgmUWTiPX735isWGACciSdQi3nywuNMYtn9eA+H7GF
 KLmap4uD03uYJNbpF7X59L7G07eRBbNLzt46jQPujg6Yhj7ocHFP12ReO3/mInsrsTo6
 IpMShFWtHUBSltkqmxanq05CQAArQ3x9A3MWzvh3Vw0et3ZjRiob4jhMv/59mwhMw116
 ugl/cxnpr1Bb+OQb4KZnTc2hUfDektzDT8cJ3VIRhsUE8ao8CQyx7OQ2chBCXKP75Jgv
 yqDGnRlcoG9bo0nzwIhy4RTrLvJoS0rWJXF8GU/uskwsJhZa2K4S4X9qjWDTKpUtbIn8 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t7k3eps8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 10:22:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3E8810002A;
 Fri, 28 May 2021 10:22:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B68E621CA64;
 Fri, 28 May 2021 10:22:52 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 10:22:51 +0200
Subject: Re: [PATCH v3 3/3] mtd: spinand: add SPI-NAND MTD resume handler
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-spi@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>, Pratyush Yadav <p.yadav@ti.com>
References: <20210527161252.16620-1-patrice.chotard@foss.st.com>
 <20210527161252.16620-4-patrice.chotard@foss.st.com>
 <20210527182317.38d5edc6@xps13>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1ed72554-311d-5f6f-a108-e29138166dc0@foss.st.com>
Date: Fri, 28 May 2021 10:22:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210527182317.38d5edc6@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_012259_569546_F5C9A1DE 
X-CRM114-Status: GOOD (  25.79  )
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

SGkgTWlxdWVsCgpPbiA1LzI3LzIxIDY6MjMgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkg
UGF0cmljZSwKPiAKPiArIFByYXR5dXNoCj4gCj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNv
bT4gd3JvdGUgb24gVGh1LCAyNyBNYXkgMjAyMSAxODoxMjo1MiArMDIwMDoKPiAKPj4gRnJvbTog
UGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Cj4+IEFmdGVy
IHBvd2VyIHVwLCBhbGwgU1BJIE5BTkQncyBibG9ja3MgYXJlIGxvY2tlZC4gT25seSByZWFkIG9w
ZXJhdGlvbnMKPj4gYXJlIGFsbG93ZWQsIHdyaXRlIGFuZCBlcmFzZSBvcGVyYXRpb25zIGFyZSBm
b3JiaWRkZW4uCj4+IFRoZSBTUEkgTkFORCBmcmFtZXdvcmsgdW5sb2NrcyBhbGwgdGhlIGJsb2Nr
cyBkdXJpbmcgaXRzIGluaXRpYWxpemF0aW9uLgo+Pgo+PiBEdXJpbmcgYSBzdGFuZGJ5IGxvdyBw
b3dlciwgdGhlIG1lbW9yeSBpcyBwb3dlcmVkIGRvd24sIGxvc2luZyBpdHMKPj4gY29uZmlndXJh
dGlvbi4KPj4gRHVyaW5nIHRoZSByZXN1bWUsIHRoZSBRU1BJIGRyaXZlciBzdGF0ZSBpcyByZXN0
b3JlZCBidXQgdGhlIFNQSSBOQU5ECj4+IGZyYW1ld29yayBkb2VzIG5vdCByZWNvbmZpZ3VyZWQg
dGhlIG1lbW9yeS4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIFNQSS1OQU5EIE1URCBQTSBoYW5kbGVy
cyBmb3IgcmVzdW1lIG9wcy4KPj4gU1BJIE5BTkQgcmVzdW1lIG9wIHJlLWluaXRpYWxpemVzIFNQ
SSBOQU5EIGZsYXNoIHRvIGl0cyBwcm9iZWQgc3RhdGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29tPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4K
Pj4gLS0tCj4+IENoYW5nZXMgaW4gdjM6Cj4+ICAgLSBBZGQgc3BpbmFuZF9yZWFkX2NmZygpIGNh
bGwgdG8gcmVwb3B1bGF0ZSBjYWNoZQo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiAgIC0gQWRkIGhl
bHBlciBzcGluYW5kX2Jsb2NrX3VubG9jaygpLgo+PiAgIC0gQWRkIHNwaW5hbmRfZWNjX2VuYWJs
ZSgpIGNhbGwuCj4+ICAgLSBSZW1vdmUgc29tZSBkZXZfZXJyKCkuCj4+ICAgLSBGaXggY29tbWl0
J3MgdGl0bGUgYW5kIG1lc3NhZ2UuCj4+Cj4+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMg
fCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPj4gaW5kZXggMWY2OTlhZDg0
ZjFiLi5lM2ZjYmNmMzgxYzMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPj4gQEAgLTEwOTksNiAr
MTA5OSwzOCBAQCBzdGF0aWMgaW50IHNwaW5hbmRfYmxvY2tfdW5sb2NrKHN0cnVjdCBzcGluYW5k
X2RldmljZSAqc3BpbmFuZCkKPj4gIAlyZXR1cm4gcmV0Owo+PiAgfQo+PiAgCj4+ICtzdGF0aWMg
dm9pZCBzcGluYW5kX210ZF9yZXN1bWUoc3RydWN0IG10ZF9pbmZvICptdGQpCj4+ICt7Cj4+ICsJ
c3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0gbXRkX3RvX3NwaW5hbmQobXRkKTsKPj4g
KwlpbnQgcmV0Owo+PiArCj4+ICsJcmV0ID0gc3BpbmFuZF9yZXNldF9vcChzcGluYW5kKTsKPj4g
KwlpZiAocmV0KQo+PiArCQlyZXR1cm47Cj4+ICsKPj4gKwlyZXQgPSBzcGluYW5kX3JlYWRfY2Zn
KHNwaW5hbmQpOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybjsKPj4gKwo+PiArCXJldCA9IHNw
aW5hbmRfaW5pdF9xdWFkX2VuYWJsZShzcGluYW5kKTsKPj4gKwlpZiAocmV0KQo+PiArCQlyZXR1
cm47Cj4+ICsKPj4gKwlyZXQgPSBzcGluYW5kX3VwZF9jZmcoc3BpbmFuZCwgQ0ZHX09UUF9FTkFC
TEUsIDApOwo+PiArCWlmIChyZXQpCj4+ICsJCXJldHVybjsKPj4gKwo+PiArCXJldCA9IHNwaW5h
bmRfbWFudWZhY3R1cmVyX2luaXQoc3BpbmFuZCk7Cj4+ICsJaWYgKHJldCkKPj4gKwkJcmV0dXJu
Owo+PiArCj4+ICsJcmV0ID0gc3BpbmFuZF9ibG9ja191bmxvY2soc3BpbmFuZCk7Cj4+ICsJaWYg
KHJldCkKPj4gKwkJcmV0dXJuOwo+PiArCj4+ICsJc3BpbmFuZF9lY2NfZW5hYmxlKHNwaW5hbmQs
IGZhbHNlKTsKPj4gK30KPiAKPiBTb3JyeSBmb3Igbm90IGJlaW5nIGNsZWFyLCBidXQgSSB0aGlu
ayB3aGF0IFByYXR5dXNoIG1lYW50IHdhcyB0aGF0Cj4geW91IGNvdWxkIGNyZWF0ZSBhIGhlbHBl
ciBkb2luZyBhbGwgdGhlIGNvbW1vbiBpbml0aWFsaXphdGlvbnMgYmV0d2Vlbgo+IHNwaW5hbmRf
aW5pdCgpIGFuZCBzcGluYW5kX3Jlc3VtZSgpIGFuZCBjYWxsIGl0IGZyb20gdGhlc2UgcGxhY2Vz
IHRvCj4gYXZvaWQgY29kZSBkdXBsaWNhdGlvbi4gSGlzIGNvbW1lbnQgc29tZWhvdyBvdXRjbGFz
c2VkIG1pbmUgYXMgSSBvbmx5Cj4gZm9jdXNlZCBvbiB0aGUgdW5sb2NrIHBhcnQgKHdoaWNoIEkg
dGhpbmsgaXMgY2xlYXJlciBhbnl3YXksIHBsZWFzZSBrZWVwCj4gaXQgbGlrZSB0aGF0KS4KPiAK
Ck15IGJhZCB0b28sIGkgcmVhZCB0b28gcXVpY2tseSBQcmF0eXVzaCdzIGFzbndlci4KSSBhbSBw
cmVwYXJpbmcgYSB2NC4KClRoYW5rcwpQYXRyaWNlCgoKPj4gKwo+PiAgc3RhdGljIGludCBzcGlu
YW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+PiAgewo+PiAgCXN0cnVj
dCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+PiBAQCAtMTE4Niw2
ICsxMjE4LDcgQEAgc3RhdGljIGludCBzcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kKQo+PiAgCW10ZC0+X2Jsb2NrX2lzcmVzZXJ2ZWQgPSBzcGluYW5kX210ZF9ibG9j
a19pc3Jlc2VydmVkOwo+PiAgCW10ZC0+X2VyYXNlID0gc3BpbmFuZF9tdGRfZXJhc2U7Cj4+ICAJ
bXRkLT5fbWF4X2JhZF9ibG9ja3MgPSBuYW5kZGV2X210ZF9tYXhfYmFkX2Jsb2NrczsKPj4gKwlt
dGQtPl9yZXN1bWUgPSBzcGluYW5kX210ZF9yZXN1bWU7Cj4+ICAKPj4gIAlpZiAobmFuZC0+ZWNj
LmVuZ2luZSkgewo+PiAgCQlyZXQgPSBtdGRfb29ibGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQp
Owo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
