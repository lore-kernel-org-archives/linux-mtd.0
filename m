Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95019C352A3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 07:52:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CD6206CC
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 07:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nz9C23Hq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CD6206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E+y8/JLRB3dF2bp1bZ5++bQ+/X70719jG+zqXEBG/Yc=; b=Nz9C23HqK6lJn07LRE9UxNy1Y
	ySVFjpJ9Rge4WpGzUnrLqerZD72bGkPUCKk5qXbszZaGqMjiwwzlJH4XBT543sLDgJl+rVewyJvHs
	JpzviGcEQ4jKSp5LF2lZxHh5gbD3eRIN0vWedoRPqGkTtoxFUs9lGLUF+LZJq+NxY5MYwdtMGq/6r
	Dpj8fPkl03HIhtu1SeRl7B+waZ+7IESPKjpiYhxHB56ejuaTarrNvA32kICTDzBSTolyn6lpGMg8c
	XmABBgshtwR58at+jq1tGVCUrBCuRV6xIHfsWURPaCkBjd2Tqyc+9SVGqK/Xqkp4C/QA/ia9hybbw
	cHtEta6uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1QLV-0003Eg-3X; Tue, 11 Feb 2020 07:52:37 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1QLQ-0003Ch-FB
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 07:52:35 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C00737B2B9014E61DD34;
 Tue, 11 Feb 2020 15:52:16 +0800 (CST)
Received: from [127.0.0.1] (10.74.219.194) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Tue, 11 Feb 2020
 15:52:07 +0800
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
To: Jungseung Lee <js07.lee@gmail.com>, <Tudor.Ambarus@microchip.com>
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e@epcas1p3.samsung.com>
 <20200113055907.9029-2-js07.lee@samsung.com>
 <3703036.Ns4Yp6NO8s@localhost.localdomain>
 <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <7932da1d-77d8-04a4-4ee1-8ab88ec97f97@hisilicon.com>
Date: Tue, 11 Feb 2020 15:52:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
X-Originating-IP: [10.74.219.194]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_235232_677274_0B70B2D3 
X-CRM114-Status: GOOD (  21.82  )
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
Cc: Linuxarm <linuxarm@huawei.com>, John Garry <john.garry@huawei.com>,
 linux-mtd@lists.infradead.org, vigneshr@ti.com,
 Jungseung Lee <js07.lee@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSnVuZ3NldW5nIExlZSwKCuWcqCAyMDIwLzEvMTcgMjM6MDYsIEp1bmdzZXVuZyBMZWUg5YaZ
6YGTOgo+IEhpLCBUdWRvciwKPgo+IE9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDc6NDkgUE0gPFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4+IEhpLCBKdW5nc2V1bmcsCj4+Cj4+
IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLgo+Pgo+PiBPbiBNb25kYXksIEphbnVhcnkgMTMs
IDIwMjAgNzo1OTowNiBBTSBFRVQgSnVuZ3NldW5nIExlZSB3cm90ZToKPj4+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlCj4+PiBjb250ZW50IGlzIHNhZmUKPj4+Cj4+PiBDdXJyZW50bHksIHdlIGFyZSBzdXBw
b3J0aW5nIGJsb2NrIHByb3RlY3Rpb24gb25seSBmb3IKPj4+IGZsYXNoIGNoaXBzIHdpdGggMyBi
bG9jayBwcm90ZWN0aW9uIGJpdHMgaW4gdGhlIFNSIHJlZ2lzdGVyLgo+Pj4gVGhpcyBwYXRjaCBl
bmFibGVzIGJsb2NrIHByb3RlY3Rpb24gc3VwcG9ydCBmb3Igc29tZSBmbGFzaCB3aXRoCj4+PiA0
IGJsb2NrIHByb3RlY3Rpb24gYml0cyhicDAtMykuCj4+IFNvbWU/IElzbid0IHRoaXMgZ2VuZXJp
YyBmb3IgYWxsIHRoZSBmbGFzaGVzIHRoYXQgc3VwcG9ydCBCUDAtMz8KPj4KPiBUaGlzIG9uZSB3
b3VsZCBiZSBhIGdlbmVyaWMgc29sdXRpb24gdG8gc3VwcG9ydCBCUDAtMyBvbiBTdGF0dXMgUmVn
aXN0ZXIuCj4gPkZyb20gbXkgc3R1ZHksIHRoaXMgY292ZXJzIGFsbCB0aGUgZmxhc2hlcyBsaXN0
ZWQgb24gc3BpLW5vci5jIHRoYXQKPiBoYXZlIEJQMC0zIGJpdCBvbiBTUi4KPiBJdCBsb29rcyBs
aWtlIEkgaGF2ZSB0byBjaGFuZ2UgdGhpcyBkZXNjcmlwdGlvbi4KPgo+IE5vdGUgdGhhdCBpdCBp
cyBOT1QgZm9yIHNvbWUgZmxhc2hlcyB0aGF0IGhhdmUgQlAwLTMgaW4gYW5vdGhlciByZWdpc3Rl
ci4KPiBBcyB5b3Uga25vdywganVzdCBsaWtlIFNQSV9OT1JfSEFTX1RCIGRpZC4KPgo+Pj4gU2ln
bmVkLW9mZi1ieTogSnVuZ3NldW5nIExlZSA8anMwNy5sZWVAc2Ftc3VuZy5jb20+Cj4+PiAtLS0K
Pj4+IHYzIDoKPj4+ICAgIEZpeCB3cm9uZyBvZnMgY2FsY3VsYXRpb24gb24gdjIgcGF0Y2gKPj4+
IHYyIDoKPj4+ICAgIEFkZCBzYW1wbGUgdGFibGUgcG9ydGlvbiBhYm91dCA0Yml0IGJsb2NrIHBy
b3RlY3Rpb24gb24gdGhlIGNvbW1lbnQKPj4+ICAgIFRyaXZpYWwgY29kaW5nIHN0eWxlIGNoYW5n
ZQo+Pj4KPj4+ICAgZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAxMjcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLQo+Pj4gICBpbmNsdWRlL2xpbnV4L210ZC9zcGktbm9y
LmggICB8ICAgOCArKysKPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwg
MTYgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
c3BpLW5vci5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPj4+IGluZGV4IGUzZGE2
YTg2NTRhOC4uN2U4YWY2YzRmZGZhIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGktbm9yLmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCj4+PiBA
QCAtMjM4LDYgKzIzOCwxNCBAQCBzdHJ1Y3QgZmxhc2hfaW5mbyB7Cj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIHN0YXR1cyByZWdpc3Rlci4gTXVzdCBiZSB1
c2VkCj4+PiB3aXRoICogU1BJX05PUl9IQVNfVEIuCj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAqLwo+Pj4gKyNkZWZpbmUgU1BJX05PUl9IQVNfQlAzICAgICAg
ICAgICAgICAgIEJJVCgxNykgLyoKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKiBGbGFzaCBTUiBoYXMgNCBiaXQgZmllbGRzIChCUDAtMykKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBmb3IgYmxvY2sgcHJvdGVjdGlvbi4K
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPj4+ICsjZGVm
aW5lIFNQSV9OT1JfQlAzX1NSX0JJVDYgICAgQklUKDE4KSAvKgo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAqIEJQMyBpcyBiaXQgNiBvZiBzdGF0dXMgcmVnaXN0
ZXIuCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogTXVzdCBi
ZSB1c2VkIHdpdGgKPj4gQXJlIHdlIHNhZmUgdG8gcmVwbGFjZSBTUElfTk9SX1RCX1NSX0JJVDYg
YW5kIFNQSV9OT1JfQlAzX1NSX0JJVDYgd2l0aCBhCj4+IFNQSV9OT1JfU1JfVEJfQklUNl9CUDNf
QklUNT8gT3IgbWF5YmUgd2l0aCBhIFNQSV9OT1JfU1JfQlAzX0JJVDZfVEJfQklUNSwgaG93Cj4+
IGlzIG1vcmUgY29udmVuaWVudD8KPj4KPiBMZXQncyB0aGluayBhYm91dCBzb21lIGZsYXNoIGlu
IHdoaWNoIEJQMC0zIGV4aXN0cyBpbiB0aGUgc3RhdHVzCj4gcmVnaXN0ZXIgYnV0IFRCIGV4aXN0
cyBpbiBhbm90aGVyIHJlZ2lzdGVyLgo+IGZvciBleGFtcGxlLCBteDI1dTEyODM1Zi4KPiBJIGhh
dmVuJ3QgdGVzdGVkIHlldCwgYnV0IGFjY29yZGluZyB0byB0aGUgZGF0YXNoZWV0LCBJIHRoaW5r
IHRoaXMKPiBwYXRjaCBjYW4gc3VwcG9ydCA0Yml0IGJsb2NrIHByb3RlY3Rpb24gZm9yIHRoZSBm
bGFzaC4KPgo+IEluIG9yZGVyIHRvIGVtYnJhY2UgdGhlIGNhc2UsIGhvdyBhYm91dCBsZXR0aW5n
IHRoZW0gYXMgSXQgaXMuCj4gSXMgdGhlcmUgYW55IHN1Z2dlc3Rpb24/CgpJbiBteSBib2FyZCho
aXNpbGljb24gRDA2KSB0aGVyZSBpcyAgYSBteDI1dTEyODM1ZiBGbGFzaCwgYW5kIGkgZW5hYmxl
IApTUElfTk9SX0hBU19MT0NLIGFuZCBTUElfTk9SX0hBU19CUDMgd2hpY2ggaXMgbm90IGVuYWJs
ZWQgaW4gc3BpLW5vci5jLCAKZmluZCBpdCBzZWVtcyBub3Qgd29yazoKCkV1bGVyOn4gIyBscyAv
ZGV2L210ZDAKL2Rldi9tdGQwCkV1bGVyOn4gIyAuL2ZsYXNoX2xvY2sgLWkgL2Rldi9tdGQwCkRl
dmljZTogL2Rldi9tdGQwClN0YXJ0OiAwCkxlbjogMHgxMDAwMDAwCkxvY2sgc3RhdHVzOiB1bmxv
Y2tlZApSZXR1cm4gY29kZTogMApFdWxlcjp+ICMKRXVsZXI6fiAjIC4vZmxhc2hfbG9jayAvZGV2
L210ZDAKZmxhc2hfbG9jazogZXJyb3IhOiBjb3VsZCBub3QgbG9jayBkZXZpY2U6IC9kZXYvbXRk
MAoKICAgICAgICAgICAgIGVycm9yIDUgKElucHV0L291dHB1dCBlcnJvcikKRXVsZXI6fiAjIC4v
Zmxhc2hfbG9jayAtaSAvZGV2L210ZDAKRGV2aWNlOiAvZGV2L210ZDAKU3RhcnQ6IDAKTGVuOiAw
eDEwMDAwMDAKTG9jayBzdGF0dXM6IGxvY2tlZApSZXR1cm4gY29kZTogMQpFdWxlcjp+ICMKCkkg
ZmluZCB0aGF0IGluIGZ1bmN0aW9uIHNwaV9ub3Jfd3JpdGVfc3JfYW5kX2NoZWNrKCksIGlmIHNw
aV9ub3IgaGFzIAoxNmJpdCBTUiwgc3BpX25vcl93cml0ZV8xNmJpdF9zcl9hbmRfY2hlY2soKSB3
aWxsIGJlIGNhbGxlZCwgaWYgbm90IApzcGlfbm9yX3dyaXRlX3NyMV9hbmRfY2hlY2soKSB3aWxs
IGJlIGNhbGxlZC4KRm9yIG14MjV1MTI4MzVmLCBpdCBqdXN0IGhhcyA4Yml0IFNSLCBidXQgU05P
Ul9GX0hBU18xNkJJVF9TUiBpcyBzZXQgYXMgCmRlZmF1bHQsIHNvIGl0IGNhdXNlcyBhYm92ZSBp
c3N1ZTsKRXZlbiBoYWNrIHRoZSBjb2RlIHRvIG5vdCBzZXQgZmxhZyBTTk9SX0ZfSEFTXzE2QklU
X1NSLCBpdCBzZWVtcyB0aGF0IApsb2NrIGlzIHN0aWxsIG5vdCB2YWxpZGVkIGFzIFByb2dyYW0v
RXJhc2Ugc3RpbGwgc3VjY2VzcyBldmVuIGlmIGl0IGlzIApsb2NrZWQ6CgpFdWxlcjp+ICMgLi9m
bGFzaF9sb2NrIC1pIC9kZXYvbXRkMApEZXZpY2U6IC9kZXYvbXRkMApTdGFydDogMApMZW46IDB4
MTAwMDAwMApMb2NrIHN0YXR1czogdW5sb2NrZWQKUmV0dXJuIGNvZGU6IDAKRXVsZXI6fiAjCkV1
bGVyOn4gIyAuL210ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAgMHhlNDAwMDAgNDA5NgpFcmFzZWQg
NDA5NiBieXRlcyBmcm9tIGFkZHJlc3MgMHgwMGU0MDAwMCBpbiBmbGFzaApFdWxlcjp+ICMKRXVs
ZXI6fiAjIC4vZmxhc2hfbG9jayAvZGV2L210ZDAKRXVsZXI6fiAjCkV1bGVyOn4gIyAuL2ZsYXNo
X2xvY2sgLWkgL2Rldi9tdGQwCkRldmljZTogL2Rldi9tdGQwClN0YXJ0OiAwCkxlbjogMHgxMDAw
MDAwCkxvY2sgc3RhdHVzOiBsb2NrZWQKUmV0dXJuIGNvZGU6IDEKRXVsZXI6fiAjCkV1bGVyOn4g
IyAuL210ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDAgMHhlNDAwMDAgNDA5NgpFcmFzZWQgNDA5NiBi
eXRlcyBmcm9tIGFkZHJlc3MgMHgwMGU0MDAwMCBpbiBmbGFzaApFdWxlcjp+ICMgLi9mbGFzaF9s
b2NrIC1pIC9kZXYvbXRkMApEZXZpY2U6IC9kZXYvbXRkMApTdGFydDogMApMZW46IDB4MTAwMDAw
MApMb2NrIHN0YXR1czogbG9ja2VkClJldHVybiBjb2RlOiAxCkV1bGVyOn4gIwpFdWxlcjp+ICMK
CgpUaGFua3MsCmNoZW54aWFuZwoKCj4KPj4gQ2hlZXJzLAo+PiB0YQo+Pgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo+Cj4gLgo+CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
