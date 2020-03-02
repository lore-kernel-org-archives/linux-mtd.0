Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40E1C3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 18:27:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF4472465E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 18:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TUY+lzSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF4472465E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8RPfWb60rKCtVOPhxEapYvS7bs34CRDmffVa9hA6bsw=; b=TUY+lzSfR4MNMbQO6cexAVUd0
	Kih/UsA8JEEakyx0DMIZPQ2qPXTls1RBpDE7WFBSrT7l/Qg3C38XhBO3wNAZkX9nVAwVbzYMaei2N
	MPk97AtkiUExlTN01+Da9m7KKS+1cLjQ0v+WCTAv97IjHIooh15PJLaHGWmVPK6lRil783GxqedmH
	unuDmikJH1wHKRDjjkfmWL2pyh2FeMM518Gk4J9sRDGaRdKTVqa3JUauSJF7TOHRxQlJiILAPOzld
	kLnVN3hvYki60K2GPZoNyr2BuaxjCH3wpAjSCJrb1/6i/6IaNmV76kYHKkJnDNEbrmnycYiy6tF+4
	+MbasnHhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8pmG-0004hI-0b; Mon, 02 Mar 2020 18:26:52 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8plJ-0003v0-V8
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 18:25:56 +0000
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 6F72C7D1B08941636B6C;
 Mon,  2 Mar 2020 18:25:49 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml704-cah.china.huawei.com (10.201.108.45) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 2 Mar 2020 18:25:48 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Mar 2020
 18:25:48 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>, "chenxiang (M)"
 <chenxiang66@hisilicon.com>, <linux-mtd@lists.infradead.org>
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
 <18cdef63-75e3-97c3-2a22-4969d4997af9@hisilicon.com>
 <60b272c1-ab6a-7a7a-6f56-03d7c7daf8bc@nokia.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <43ae2554-06c8-59f9-153e-094a326166c2@huawei.com>
Date: Mon, 2 Mar 2020 18:25:48 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <60b272c1-ab6a-7a7a-6f56-03d7c7daf8bc@nokia.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_102554_179120_BEC0D2DF 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjgvMDIvMjAyMCAwNjo0NSwgQWxleGFuZGVyIFN2ZXJkbGluIHdyb3RlOgo+IEhpIQo+IAo+
IE9uIDI4LzAyLzIwMjAgMDQ6MDEsIGNoZW54aWFuZyAoTSkgd3JvdGU6Cj4+PiBKRVNEMjE2wqBh
bGxvd3PCoCJ2YXJpYWJsZcKgYWRkcmVzc8KgbGVuZ3RoIsKgYW5kwqAidmFyaWFibGXCoGxhdGVu
Y3kiwqBpbgo+Pj4gQ29uZmlndXJhdGlvbsKgRGV0ZWN0aW9uwqBDb21tYW5kwqBEZXNjcmlwdG9y
cyzCoGluwqBvdGhlcsKgd29yZHPCoCJhcy1pcyIuCj4+PiBBbmTCoHRoZXnCoGFyZcKgc3RpbGzC
oHVuc2V0wqBkdXJpbmfCoFNlY3RvcsKgTWFwwqBQYXJhbWV0ZXLCoFRhYmxlwqBwYXJzaW5nLAo+
Pj4gd2hpY2jCoGxlZMKgdG/CoCJtYXBfaWQiwqBkZXRlcm1pbmVkwqBlcnJvbmVvdXNsecKgYXPC
oDDCoGZvcizCoGUuZy7CoFMyNUZTMTI4Uy4KPiAKPiBbLi4uXQo+IAo+Pj4gQEDCoC0yNTcwLDfC
oCsyNjg3LDjCoEBAwqBzdGF0aWPCoGNvbnN0wqBzdHJ1Y3TCoGZsYXNoX2luZm/CoHNwaV9ub3Jf
aWRzW13CoD3CoHsKPj4+ICDCoMKgwqDCoMKgwqB7wqAiczI1c2wxMjgwMCIswqBJTkZPKDB4MDEy
MDE4LMKgMHgwMzAwLMKgMjU2wqAqwqAxMDI0LMKgwqA2NCzCoDApwqB9LAo+Pj4gIMKgwqDCoMKg
wqDCoHvCoCJzMjVzbDEyODAxIizCoElORk8oMHgwMTIwMTgswqAweDAzMDEswqDCoDY0wqAqwqAx
MDI0LMKgMjU2LMKgMCnCoH0sCj4+PiAgwqDCoMKgwqDCoMKge8KgInMyNWZsMTI5cDAiLMKgSU5G
TygweDAxMjAxOCzCoDB4NGQwMCzCoDI1NsKgKsKgMTAyNCzCoMKgNjQswqBTUElfTk9SX0RVQUxf
UkVBRMKgfMKgU1BJX05PUl9RVUFEX1JFQUTCoHzCoFVTRV9DTFNSKcKgfSwKPj4+IC3CoMKgwqDC
oHvCoCJzMjVmbDEyOXAxIizCoElORk8oMHgwMTIwMTgswqAweDRkMDEswqDCoDY0wqAqwqAxMDI0
LMKgMjU2LMKgU1BJX05PUl9EVUFMX1JFQUTCoHzCoFNQSV9OT1JfUVVBRF9SRUFEwqB8wqBVU0Vf
Q0xTUinCoH0sCj4+PiArwqDCoMKgwqB7wqAiczI1ZmwxMjlwMSIswqBJTkZPKDB4MDEyMDE4LMKg
MHg0ZDAxLMKgwqA2NMKgKsKgMTAyNCzCoDI1NizCoFNQSV9OT1JfRFVBTF9SRUFEwqB8wqBTUElf
Tk9SX1FVQURfUkVBRMKgfMKgVVNFX0NMU1IpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LmZpeHVwc8KgPcKgJnMyNWZzX3NfZml4dXBzLMKgfSwKPj4KPj4gSXQgc2VlbXMgU0ZEUCBpcyBu
b3Qgc3VwcG9ydGVkIG9uIHMyNWZsMTI5cCAoeW91IGNhbiBjaGVjayBpdCBvbiBodHRwczovL3d3
dy5jeXByZXNzLmNvbS9maWxlLzQwMDU4Ni9kb3dubG9hZCksIHNvIGlzIGl0IG5lY2Vzc2FyeSB0
byBhZGQgdGhpc8KgZm9ywqB0aGlzwqB0eXBlwqBmbGFzaD8KPiAKPiBZZXMsIGFsbCBvZiB0aGUg
YWJvdmUgaXMgbmVjZXNzYXJ5IHRvIHJlcGFpciBTMjVGUzEyOFMsIHdoaWNoIHN1cHBvcnRzIFNG
RFAgYW5kIGxhbmRzCj4gaW4gdGhlIGFib3ZlIHRhYmxlIGVudHJ5LgoKU28gZG8geW91IGtub3cg
aG93IHdlIGNhbiB0ZWxsIGlmIHRoZSBwYXJ0IGlzIHMyNWZsMTI5cDEgb3IgUzI1RlMxMjhTPyAK
SXMgaXQgYmFzZWQgb24gZmFtaWx5IGlkPyBGb3IgdGhlIHBhcnQgb2YgbXkgYm9hcmQsIGl0IGhh
cyB0aGUgc2FtZSBpZCAKYWNjb3JkaW5nIHRvICJzMjVmbDEyOXAxIiBlbnRyeSBpbiB0aGUgc3Bp
LW5vciBkcml2ZXIsIHlldCB0aGUgU0ZEUCAKc2lnbmF0dXJlIGlzIG5vdCBwcmVzZW50IChzaWdu
YXR1cmUgcmVhZHMgYXMgMHg0ZDE4MjAwMSB2cyBleHBlY3RlZCAKMHg1MDQ0NDY1MykuIEkgcHJp
bnRlZCB0aGUgZmFtaWx5IGlkLCBhbmQgaXQgaXMgODFoLCB3aGljaCBzZWVtcyB0byAKYWxpZ24g
d2l0aCBTMjVGUyAod2hpY2ggc2hvdWxkIHN1cHBvcnQgU0ZEUCkuIENvbmZ1c2VkLgoKV2hhdCdz
IG1vcmUsIHRoZSBzcGktbm9yIHByb2JlIGlzIGZhaWxpbmcgZm9yIHRoaXMgcGFydCBzaW5jZSBJ
IGVuYWJsZWQgCnF1YWQgc3BpLiBTbyBJIGFtIGludGVyZXN0ZWQgdG8ga25vdyBpZiB0aGVyZSBp
cyBzb21lIGRpZmZlcmVuY2VzIApiZXR3ZWVuIHRoZXNlIHBhcnQgZmFtaWxpZXMgZm9yIHRoYXQu
CgpUaGFua3MsCkpvaG4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
