Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B7EC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 23:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4oJzOnf0Dv32L0L2SuUUnGJG9TwDIVtCqKSwZ4cods=; b=jZPsbgNGH8aaJs
	wnscFEAG7gH3dNOq3jsKpqIkswy6Gk7uoLypg97xJblqitplh4nh0aCpSUyaFZxtrDtmN0wr/zf/R
	G19pM601B0g8iXwKEf3b4f72VgnfpM0A2p+uptwjEq3dd9FHppZP+OGHr4Efa5MjF8kq+sHhrIwb4
	2CdIFhaRjV0z/1E+HYwZd5DDrp8i8a9UJwPYBf+mcbbH9PYWxOrSFXKBcG5ujxWCAqyrNRVgLm70L
	Fv0cnIdclzzbBCQmEj++hQjg1qzONIOWkZ0+Tz7BGv8xp4AL8NBWdbsdl70UjvMGOgTyk6fvrW8fP
	j9TPZrof0o4/VVEKip/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUmr-00BBY6-56; Fri, 15 Jul 2022 23:31:57 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCUhP-00B8ZM-6h
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 23:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657927579; x=1689463579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QG37sn/8hSWwtSds+7B0I2w1uI3+7ZU187Xi4ep562c=;
  b=V8RTnoLw28aOUDVPJvNeGa7MQqlWFH0MsF8aHVO073jn8bMbmjFXBojr
   jMRBS6fCWwYgDv4nS3okVDVzFNDZsiAJ0w6lz+tCVvlblClLFASwXM/CI
   8+u9T4DJBLltUjuZfSOQl08mp+nDmnATe8ytIAii1CnGIr4TR+3bSlfx+
   Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jul 2022 16:26:18 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 16:26:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 16:26:17 -0700
Received: from [10.110.97.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 16:26:17 -0700
Message-ID: <0273ed77-73d8-bbd4-4626-4e7f17db74d1@quicinc.com>
Date: Fri, 15 Jul 2022 16:26:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: <clg@kaod.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
	<quic_ggregory@quicinc.com>, <quic_jiles@quicinc.com>,
	<tudor.ambarus@microchip.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
 <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
 <b42cb229-f241-6e29-a138-29023ce316d9@quicinc.com>
 <c628e868-5c73-ca4b-1f99-60cc149806bf@quicinc.com>
 <b00410c825486ec406ed1ae773b11792@walle.cc>
 <2e0f02f3-0e0e-8690-a58e-bb74a21ab63e@quicinc.com>
 <00bdb7304cf479d21b87d4a35e908fb4@walle.cc>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <00bdb7304cf479d21b87d4a35e908fb4@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_162619_312248_3DF8424F 
X-CRM114-Status: GOOD (  12.00  )
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

SGksCgpPbiA3LzE1LzIwMjIgNDoyMCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAK
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4+PiBpbmRleCBjZTVkNjkzMTdkNDYuLmEyYzhkZTI1MGUwMSAxMDA2
NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+PiArKysgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYwo+Pj4gQEAgLTIxMTMsNiArMjExMywxMCBAQCBzcGlfbm9yX3Nl
bGVjdF91bmlmb3JtX2VyYXNlKHN0cnVjdCAKPj4+IHNwaV9ub3JfZXJhc2VfbWFwICptYXAsCj4+
Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdGVkX2VyYXNlID0gJm1h
cC0+ZXJhc2VfdHlwZVtpXTsKPj4+Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
KiBTa2lwIG1hc2tlZCBlcmFzZSB0eXBlcy4gKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmICghdGVzdGVkX2VyYXNlLT5zaXplKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pgo+PiBZZXMsIGl0IGFsc28gd29y
a3MuIERvIHlvdSB3YW50IG1lIHRvIHVwZGF0ZSB0aGlzIHBhdGNoIHdpdGggYWRkaW5nIHRoaXMK
Pj4gZml4PyBPciBpcyBpdCBnb29kIHRvIGdvIGFzIGlzIHNvIHRoYXQgdGhlIElORk8gdGFibGUg
Y2FuIGJlIHJlcGxhY2VkCj4+IHdpdGggU05PUl9JRDMgbGF0ZXIgYWZ0ZXIgdGhlIGZpeCBpcyBt
ZXJnZWQ/Cj4gCj4gUGxlYXNlIGFkZCB0aGlzIGFzIGEgc2VwYXJhdGUgcHJlY2VkaW5nIHBhdGNo
IHRvIHlvdXIgb3JpZ2luYWwgb25lCj4gd2hlcmUgeW91IGFkZCB0aGUgZmxhc2guIEtlZXAgdGhl
IElORk8oMHhlZjYwMjAsIDAsIDAsIDApLiBUaGVuIHdlCj4gd2lsbCByZXBsYWNlIGl0IGxhdGVy
IHdpdGggdGhlIFNOT1JfSUQzKCkuCgpTdXJlLCBJJ2xsIHN1Ym1pdCB2MyBzZXJpZXMgaW5jbHVk
aW5nIHRoZSBmaXggdGhlbi4KClRoYW5rcywKSmFlCgo+IFRoYW5rcyBmb3IgZGVidWdnaW5nIQo+
IC1taWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
