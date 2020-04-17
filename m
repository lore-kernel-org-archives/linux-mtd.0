Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16145C2BA2B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 01:07:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E2A20776
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 01:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iC6/zUUl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E2A20776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ODKvJ8Jgy+WW6EVgYwsk4Hv4mVw/kfD/LgGOS8Pccg4=; b=iC6/zUUlGfXjE1ARS29SIX644
	L4bZigmoqd8dBFF+gmSQps9I/FVE/FEFx4hh2hBID5nkAHSeJG7DkEYV/oRYkTzN+OX553tUJKzzn
	iu6VXvMhOnBBlAsGXa2aJdIEMu4E/j8d8CRat/qAZ4+nLIGOwfWolAI/0bP8XEI+rox/ax2XsFyhE
	7fVGCTks3dmJpnAzCxpYktg18AviB5T+venewC0pZ45OFEQ1k6ql6aqYOdOTOZx9c7WvpqZrb4B3f
	7gcE9JHeWILAaf49jsmBvArPybPU2SfZZILXSFwcXYEpe51POr4SO7wZEoB/OOyfx0uAfCb4pCa8v
	qF1W0zCDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPFTB-0007u2-TO; Fri, 17 Apr 2020 01:07:01 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPFT6-0007sS-QB
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 01:07:00 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7DE9587B47138D640906;
 Fri, 17 Apr 2020 09:06:46 +0800 (CST)
Received: from [127.0.0.1] (10.74.219.194) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 09:06:39 +0800
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q128a11
To: Jungseung Lee <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
References: <1585105663-199127-1-git-send-email-chenxiang66@hisilicon.com>
 <CGME20200414011621epcas1p2255b9ff1e7616caf5f226f663058d8aa@epcas1p2.samsung.com>
 <6d329b9b-153f-74fa-f94d-1f223b3ee767@hisilicon.com>
 <6183ebde31712ed29d0422ad8c34de99cb030f42.camel@samsung.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <8b0ea792-1c83-ef98-ea11-7bff51be6737@hisilicon.com>
Date: Fri, 17 Apr 2020 09:06:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <6183ebde31712ed29d0422ad8c34de99cb030f42.camel@samsung.com>
X-Originating-IP: [10.74.219.194]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_180657_017239_DF278CFC 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: john.garry@huawei.com, linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 Tudor.Ambarus@microchip.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSnVuZ3NldW5nLAoK5ZyoIDIwMjAvNC8xNiAxODo0MywgSnVuZ3NldW5nIExlZSDlhpnpgZM6
Cj4gSGksIGNoZW54aWFuZwo+Cj4gT24gVHVlLCAyMDIwLTA0LTE0IGF0IDA5OjE2ICswODAwLCBj
aGVueGlhbmcgKE0pIHdyb3RlOgo+PiBQaW5nLi4uCj4+Cj4+IOWcqCAyMDIwLzMvMjUgMTE6MDcs
IGNoZW54aWFuZyDlhpnpgZM6Cj4+PiBGcm9tOiBYaWFuZyBDaGVuIDxjaGVueGlhbmc2NkBoaXNp
bGljb24uY29tPgo+Pj4KPj4+IEFzIDRiaXQgYmxvY2sgcHJvdGVjdGlvbiBwYXRoc2V0IGZvciBz
b21lIG1pY3JvbiBtb2RlbHMgYXJlIG1lcmdlZCwKPiB5b3UgbWVhbiBwYXRjaHNldD8KClJpZ2h0
LCBpIHdpbGwgZml4IGl0IG9uIG5leHQgdmVyc2lvbi4KCj4KPj4+IG4yNXExMjhhMTEgYWxzbyB1
c2VzIDQgYml0IEJsb2NrIFByb3RlY3Rpb24gc2NoZW1lLCBzbyBlbmFibGUKPj4+IGxvY2tpbmcK
Pj4+IGZvciBpdC4gVGVzdGVkIGl0IG9uIG4yNXExMjhhMTEsIHRoZSBsb2NraW5nIGZ1bmN0aW9u
cyB3b3JrIHdlbGwuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgQ2hlbiA8Y2hlbnhpYW5n
NjZAaGlzaWxpY29uLmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy9tdGQvc3BpLW5vci9taWNy
b24tc3QuYyB8IDQgKysrLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21p
Y3Jvbi1zdC5jIGIvZHJpdmVycy9tdGQvc3BpLQo+Pj4gbm9yL21pY3Jvbi1zdC5jCj4+PiBpbmRl
eCA2YzAzNGI5Li4wMmMwYjUzIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9t
aWNyb24tc3QuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYwo+Pj4g
QEAgLTI5LDcgKzI5LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHN0X3BhcnRz
W10gPSB7Cj4+PiAgICAJeyAibjI1cTA2NGEiLCAgICBJTkZPKDB4MjBiYjE3LCAwLCA2NCAqIDEw
MjQsICAxMjgsCj4+PiAgICAJCQkgICAgICBTRUNUXzRLIHwgU1BJX05PUl9RVUFEX1JFQUQpIH0s
Cj4+PiAgICAJeyAibjI1cTEyOGExMSIsICBJTkZPKDB4MjBiYjE4LCAwLCA2NCAqIDEwMjQsICAy
NTYsCj4+PiAtCQkJICAgICAgU0VDVF80SyB8IFVTRV9GU1IgfCBTUElfTk9SX1FVQURfUkVBRCkg
fSwKPj4+ICsJCQkgICAgICBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1JfUVVBRF9SRUFEIHwK
Pj4+ICsJCQkgICAgICBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNfVEIgfAo+Pj4gKwkJ
CSAgICAgIFNQSV9OT1JfNEJJVF9CUCB8IFNQSV9OT1JfQlAzX1NSX0JJVDYpIH0sCj4+PiAgICAJ
eyAibjI1cTEyOGExMyIsICBJTkZPKDB4MjBiYTE4LCAwLCA2NCAqIDEwMjQsICAyNTYsCj4+PiAg
ICAJCQkgICAgICBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+Pj4g
ICAgCXsgIm10MjVxbDI1NmEiLCAgSU5GTzYoMHgyMGJhMTksIDB4MTA0NDAwLCA2NCAqIDEwMjQs
ICA1MTIsCj4gSSd2ZSBjaGVja2VkIHRoZSBmbGFncyBhY2NvcmRpbmcgdG8gaXQncyBkYXRhc2hl
ZXQuIEl0IHNlZW1zIGdvb2QuCj4gWW91IGNhbiBhZGQgbXkgcmV2aWV3IHRhZyBhZnRlciB1cGRh
dGUgdGhlIHR5cG8uCj4KPiBSZXZpZXdlZC1ieTogSnVuZ3NldW5nIExlZSA8anMwNy5sZWVAc2Ft
c3VuZy5jb20+Cj4KPiBUaGFua3MsCgpPaywgdGhhbmtzLgoKPj4KPgo+IC4KPgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
