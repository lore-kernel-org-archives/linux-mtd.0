Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391BCC2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AksQsBXgnuIwoTmCsm9O2boFLrZZmriPE7bkVKjpkxY=; b=xiWZeh6kqc4s2Y
	YVuM02VjbXb6tX0jFBhRUzXc4dlyQyRuG2DCE0ApSv1uplDgwSDwaMepLXwmNBTiG2ev+6cQacPBz
	YRlHVeKX/TqfqHADGdFEddMjy+PR+zwMmaO2VqMI9zw9Zy/dXL+CLefgHYqjuTYzsMozLY4q3pIvD
	NbsvakprNv4EfVOc4zxcv2yV9x4nOS9pczLh0ZChv1Je7mhL2Zd3kucVo6r7or2W3StqlwSEn5PCm
	ZorC02cMobUFrKddaaI5Y99kNavcT6tvh4e+v8vIujkpy38sOdsDektoLOekYtrkc1QUQqdCpCnnR
	maGzEallVdnWJrUK7l6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgIU-00BQnq-Uq; Wed, 26 Jan 2022 11:17:07 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgAW-00BOsA-J8
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 11:08:54 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20Q9nERc012928;
 Wed, 26 Jan 2022 12:08:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QFR2dN8dkibpF8B0/9wAubqoFJzjHR76hN1qSB1UNQc=;
 b=CJQz9enHEakzEJDRo8gWXXxkHkaYq1wEEHzQA2WpFfqlt5TKNpSdTQAsGdNvYswfkbP6
 o+X6HLUvphRs6/HC+gmlqmPtPHJosL6IG3z+EOuBzhB2pBfiXhQnMpACtRT2RM2oyuND
 jVuawcLFB6TgxcImxKZxSNhdOBY4IlxQgP+kXyko9UGyHJ7vRNxKlM8vMQYqw3jR+ss+
 Wo9pfAlGzYNVja5DSfZNyGfoibXeHlhYIYL2bhBODXaM341XCHHQmJPMBgiUGe3zbg+d
 tntyCPb9aE9taxvPJe7Sw+fRR5h3DaIS1WrTpUd0C74I3dfrbC6lUkggL7QwCDlbw5yx jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3du40ngeb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 12:08:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCA4410002A;
 Wed, 26 Jan 2022 12:08:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5D70216EE0;
 Wed, 26 Jan 2022 12:08:39 +0100 (CET)
Received: from [10.48.0.175] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 26 Jan
 2022 12:08:39 +0100
Message-ID: <9662651a-12d9-4893-95c2-aa1a3a10302d@foss.st.com>
Date: Wed, 26 Jan 2022 12:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] nvmem: core: Fix a conflict between MTD and NVMEM on
 wp-gpios property
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-4-christophe.kerello@foss.st.com>
 <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <3f9a9731-c096-bc9b-63df-bd1dff032737@linaro.org>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_02,2022-01-26_01,2021-12-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_030853_046689_1D41F665 
X-CRM114-Status: GOOD (  15.48  )
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

SGkgU3Jpbml2YXMsIE1pcXVlbCwKCk9uIDEvMjUvMjIgMTE6NDQsIFNyaW5pdmFzIEthbmRhZ2F0
bGEgd3JvdGU6Cj4gCj4gCj4gT24gMDUvMDEvMjAyMiAxMzo1NywgQ2hyaXN0b3BoZSBLZXJlbGxv
IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9jb3JlLmMgYi9kcml2ZXJzL252
bWVtL2NvcmUuYwo+PiBpbmRleCBlNzY1ZDNkMDU0MmUuLmUxMWM3NGRiNjRmOSAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9udm1lbS9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMK
Pj4gQEAgLTc2OSw3ICs3NjksNyBAQCBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbV9yZWdpc3Rl
cihjb25zdCBzdHJ1Y3QgCj4+IG52bWVtX2NvbmZpZyAqY29uZmlnKQo+PiDCoMKgwqDCoMKgIGlm
IChjb25maWctPndwX2dwaW8pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBudm1lbS0+d3BfZ3BpbyA9
IGNvbmZpZy0+d3BfZ3BpbzsKPj4gLcKgwqDCoCBlbHNlCj4+ICvCoMKgwqAgZWxzZSBpZiAoY29u
ZmlnLT5yZWdfd3JpdGUpCj4gVGhpcyBpcyBjbGVhcmx5IG5vdCBnb2luZyB0byB3b3JrIGZvciBl
dmVyeW9uZS4KPiAKPiBBIGZsYWcgaW4gbnZtZW1fY29uZmlnIHRvIGluZGljYXRlIHRoYXQgd3Ag
Z3BpbyBpcyBtYW5hZ2VkIGJ5IHByb3ZpZGVyIAo+IGRyaXZlciB3b3VsZCBiZSB0aGUgcmlnaHQg
dGhpbmcgdG8gZG8gaGVyZS4KCkJhc2VkIG9uIHlvdXIgaW5wdXRzLCBJIHdpbGwgYWRkIGEgbmV3
IGJvb2xlYW4gZmxhZyBpbiBudm1lbl9jb25maWcgCihwcm9wb3NhbCBuYW1lOiBza2lwX3dwX2dw
aW8pIGFuZCBJIHdpbGwgc2V0IGl0IHRvIHRydWUgaW4gbXRkY29yZS5jIAp3aGVuIG52bWVuX2Nv
bmZpZyBzdHJ1Y3R1cmUgaXMgaW5pdGlhbGl6ZWQuIEl0IHdpbGwgYmUgcGFydCBvZiB0aGUgVjIu
CgpSZWdhcmRzLApDaHJpc3RvcGhlIEtlcmVsbG8uCgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbnZt
ZW0tPndwX2dwaW8gPSBncGlvZF9nZXRfb3B0aW9uYWwoY29uZmlnLT5kZXYsICJ3cCIsCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
R1BJT0RfT1VUX0hJR0gpOwo+IAo+IC0tc3JpbmkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
