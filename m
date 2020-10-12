Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B134C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 06:48:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1945C20757
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 06:48:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hgzd9jEb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lwj0xHta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1945C20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dfBWo/kukAx/+J3x204BSFmrfgjN7PRocvB6wferv+M=; b=Hgzd9jEbhj1kYSY4gZgzdmzSc
	zE6vMiZVZVV6rORxX5ErXEeU/bAWhQzffeQfvD9f19AJ2GbLAJT59Gl/dXNh/QlpkmzTZdF6c7EPs
	oPXqh9bYumMFR1J/BtLnu2Y2E2dB6jEZfo/ItHwsj8OOIAbCAZ7Qpswis5Cnmsvt6JrE/VpNdLBk2
	dGHP3vcq7xd7LBRbYuVjf38nEypHhq+PN6XwYUUBg1zfXb3UXu3Y+AHlsLzkN3OOw2yVb3apC4tL+
	G0KqxkuvsqHjC+18ldsmJnRxEJdl4NFhO2dFOv7zNTNxUmEt9N1r7TgXuJk1URa8Nxb6YSyHMSH+J
	09+3ZtGGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRrbr-000811-7q; Mon, 12 Oct 2020 06:47:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRrbo-00080a-CU
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 06:47:01 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09C6kvZN112840;
 Mon, 12 Oct 2020 01:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602485217;
 bh=uOfTHQb6L4n55s3PRO4WwjQ5cwzjf4nJaO6rlbuCDTM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=lwj0xHtaUR2PrZaO7ujc1nXP4tmqXv+Xrb730z0WpNDy3QZTEKsqPgdRBsoGiyU4k
 nf12UKUOsQ6Ij7WH04R2Njm5yOHN/yuNtCTy2GvRsx39yNNtomhZ/5Bv0j0Tl80U3m
 Ctx651aJJVrzwp4WDnhjaZchiZTJ3mbmrypEMi5M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09C6kvwR114914
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 12 Oct 2020 01:46:57 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 12
 Oct 2020 01:46:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 12 Oct 2020 01:46:57 -0500
Received: from [10.250.233.64] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09C6ktCx065438;
 Mon, 12 Oct 2020 01:46:56 -0500
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.10
To: Richard Weinberger <richard@nod.at>
References: <f91ae16f-7995-aa27-c2ff-4e519929417e@ti.com>
 <1014092673.185630.1602448948127.JavaMail.zimbra@nod.at>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <a93e60a6-28aa-830a-56df-a2323acc1bbb@ti.com>
Date: Mon, 12 Oct 2020 12:16:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1014092673.185630.1602448948127.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_024700_508514_689F6B1F 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZCwKCk9uIDEwLzEyLzIwIDI6MTIgQU0sIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90
ZToKPiBWaWduZXNoLAo+IAo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPj4gVm9u
OiAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4KPj4gQW46ICJNaXF1ZWwg
UmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBu
b2QuYXQ+LCAiVHVkb3IgQW1iYXJ1cyIKPj4gPFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4K
Pj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPj4gR2Vz
ZW5kZXQ6IEZyZWl0YWcsIDkuIE9rdG9iZXIgMjAyMCAxNDoyMjo1Mwo+PiBCZXRyZWZmOiBbR0lU
IFBVTExdIG10ZDogc3BpLW5vcjogQ2hhbmdlcyBmb3IgNS4xMAo+IAo+PiBIaSBNaXF1ZWwsIFJp
Y2hhcmQKPj4KPj4gUGxlYXNlIHB1bGwgU1BJIE5PUiBjaGFuZ2VzIGZvciA1LjEwLXJjMS4KPj4K
Pj4gUmVnYXJkcwo+PiBWaWduZXNoCj4+Cj4+Cj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgYmE0ZjE4NGUxMjZiNzUxZDFiZmZhZDU4OTdmMjYzMTA4YmVmYzc4MDoKPj4KPj4g
IExpbnV4IDUuOS1yYzYgKDIwMjAtMDktMjAgMTY6MzM6NTUgLTA3MDApCj4gCj4gU2FtZSBxdWVz
dGlvbi4gU2VlIG90aGVyIG1haWwuCgpZZXMsIHRoaXMgd2FzIGludGVudGlvbmFsIGFzIHRoZXJl
IHdlcmUgZml4ZXMgcXVldWVkIGFmdGVyIC1yYzUgd2hpY2ggSQp3b3VsZCBoYXZlIHBvdGVudGlh
bCBjb25mbGljdHMuCgpSZWdhcmRzClZpZ25lc2gKCj4gIAo+PiBhcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4KPj4gIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0Cj4+ICB0YWdzL3NwaS1ub3IvZm9yLTUuMTAK
Pj4KPj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDlhMzQyMmExMTBjODY4ZTUxMTM4
N2E4MWRmMjVhMzE1ZWFhM2E3Yjg6Cj4+Cj4+ICBSZXZlcnQgIm10ZDogc3BpLW5vcjogUHJlZmVy
IGFzeW5jaHJvbm91cyBwcm9iZSIgKDIwMjAtMTAtMDYgMTA6NDY6MDcgKzA1MzApCj4+Cj4+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPj4gU1BJIE5PUiBjb3JlIGNoYW5nZXM6Cj4+IC0gU3VwcG9ydCBmb3IgV2luYm9uZCB3
MjVxNjRqd20gZmxhc2gKPj4gLSBFbmFibGUgNEsgc2VjdG9yIHN1cHBvcnQgZm9yIG14MjVsMTI4
MDVkCj4+Cj4+IFNQSSBOT1IgY29udHJvbGxlciBkcml2ZXJzIGNoYW5nZXM6Cj4+IC0gaW50ZWwt
c3BpOgo+PiAgIC0gQWRkIEFsZGVyIExha2UtUyBQQ0kgSUQKPj4KPj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBEb3Vn
bGFzIEFuZGVyc29uICgxKToKPj4gICAgICBtdGQ6IHNwaS1ub3I6IFByZWZlciBhc3luY2hyb25v
dXMgcHJvYmUKPj4KPj4gSWtqb29uIEphbmcgKDEpOgo+PiAgICAgIG10ZDogc3BpLW5vcjogd2lu
Ym9uZDogQWRkIHN1cHBvcnQgZm9yIHcyNXE2NGp3bQo+Pgo+PiBNaWthIFdlc3RlcmJlcmcgKDEp
Ogo+PiAgICAgIG10ZDogc3BpLW5vcjogaW50ZWwtc3BpOiBBZGQgc3VwcG9ydCBmb3IgSW50ZWwg
QWxkZXIgTGFrZS1TIFNQSSBzZXJpYWwgZmxhc2gKPj4KPj4gUm9iZXJ0IE1hcmtvICgxKToKPj4g
ICAgICBtdGQ6IHNwaS1ub3I6IG1hY3Jvbml4OiBBZGQgU0VDVF80SyB0byBteDI1bDEyODA1ZAo+
Pgo+PiBWaWduZXNoIFJhZ2hhdmVuZHJhICgxKToKPj4gICAgICBSZXZlcnQgIm10ZDogc3BpLW5v
cjogUHJlZmVyIGFzeW5jaHJvbm91cyBwcm9iZSIKPj4KPj4gZHJpdmVycy9tdGQvc3BpLW5vci9j
b250cm9sbGVycy9pbnRlbC1zcGktcGNpLmMgfCAxICsKPj4gZHJpdmVycy9tdGQvc3BpLW5vci9t
YWNyb25peC5jICAgICAgICAgICAgICAgICAgfCAyICstCj4+IGRyaXZlcnMvbXRkL3NwaS1ub3Iv
d2luYm9uZC5jICAgICAgICAgICAgICAgICAgIHwgOSArKysrKysrKysKPj4gIDMgZmlsZXMgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IFB1bGxlZCwgdGhhbmtz
IGEgbG90IQo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
