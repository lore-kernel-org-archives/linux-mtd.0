Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61488C27C6E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jun 2024 12:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V6qYg/YlZ2pJ9YN8nCGTUxZ094B0kiPuyc8j4RmAYQ=; b=wuvPvSaL6cTeat9kEQXr+8MvQo
	uVt/80fJDSyUzBgu1si21wIhglGxSUM5S8E2A0eajTTEQqzp/ACam/zSdODlmT9nop9Ur7H1bPvrd
	gtm9cDBBM0kqoGe+V/cQH6Z6CKNUsUsesI5Y3FsBJ4bkuioBd/ptxSbk9iHMZP2nn55FoVPhkwMqB
	SfSRugbQ9nqdzENFgTC6eMNW/927vhHzaCxJb+Ezt5bZHHiu9I+zg4yfrgEBMoxYEBDmoR94E2G5W
	ZeGB/OA/uU4GshVT1eI+iInneEXZ2n1XBPxIg/FnlrVCoeGcr2BDDp0dnPgkAxufUksN/xTQYhhre
	lPclzCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI62x-00000002k8D-3Yfb;
	Fri, 14 Jun 2024 12:28:47 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI62s-00000002k63-1pN3
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jun 2024 12:28:44 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4W0z6r2r1bzdZVX;
	Fri, 14 Jun 2024 20:27:00 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id B26EF14059F;
	Fri, 14 Jun 2024 20:28:28 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 20:28:28 +0800
Subject: Re: Lots of fastmap writes
To: Rickard X Andersson <rickaran@axis.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <rickard314.andersson@gmail.com>
References: <f59e5ae3-8193-43f3-604c-9a846d6e8ead@axis.com>
 <95a9872f-77b2-e9a0-f5dc-a376964bc93e@huawei.com>
 <f92bb95d-05a1-315b-000c-5189004175d5@huawei.com>
 <aad1b520-ee9e-476f-911b-45be9eb09195@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a8bf10e3-009f-3d4b-fa4b-43bbc6e1bebc@huawei.com>
Date: Fri, 14 Jun 2024 20:28:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aad1b520-ee9e-476f-911b-45be9eb09195@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_052842_674769_E6D13D18 
X-CRM114-Status: GOOD (  12.68  )
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

5ZyoIDIwMjQvNi8xNCAxOTo0MiwgUmlja2FyZCBYIEFuZGVyc3NvbiDlhpnpgZM6Cj4gT24gNi80
LzI0IDAzOjUyLCBaaGloYW8gQ2hlbmcgd3JvdGU6CgpbLi4uXQo+Pgo+PiBCVFcsIGFmdGVyIGFw
cGx5aW5nIHRoZSBwYXRjaGVzLCB0aGUga2VybmVsIHNob3VsZCBydW4gb24gYSBuZXcgZmxhc2gs
IAo+PiB0aGUgaW1wcm92ZWQgd2Vhci1sZXZlbGluZyBhbGdvcml0aG0gY2Fubm90IHJlc2N1ZSB0
aGUgd29ybiBvdXQgaW1hZ2UuCj4+Cj4gCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2hlcyEKPiAKPiBJ
IGhhdmUgYmFja3BvcnRlZCB0aGUgcGF0Y2hlcyB0byBMaW51eCBrZXJuZWwgNi4xLiBEbyB5b3Ug
dGhpbmsgdGhlIAo+IHBhdGNoZXMgYXJlIHNhZmUgdG8gYXBwbHkgdG8gTGludXgga2VybmVsIDYu
MT8KClllcywgaXQncyBva2F5LiBJIGhhdmUgYmFja3BvcnRlZCB0aGUgcGF0Y2hlcyB0byBvdXIg
cHJvZHVjdChrZXJuZWwgCnY1LjEwKSBhbmQgaXQgd29ya3MgZmluZS4KPiAKPiBBbm90aGVyIHRo
aW5nLCB3b3VsZCBpdCBub3QgYmUgcG9zc2libGUgdG8gcmVzY3VlIHRoYXQgcGFydGljdWxhciB3
b3JuIAo+IG91dCBkZXZpY2UgYnkgc2ltcGx5IHR1cm5pbmcgZmFzdG1hcCBvZmYgb24gdGhhdCBk
ZXZpY2U/Cj4gCgpDYW4gSSByZWdhcmQgdGhlIHJlc2N1aW5nIGFzIG1ha2luZyBlcmFzZSBjb3Vu
dGVycyBiZWNvbWUgbm9ybWFsIAphZ2FpbihtYXggLSBtaW4gPD0gVUJJX1dMX1RIUkVTSE9MRCk/
IElmIHNvLCBJJ20gYWZyYWlkIHRoYXQgbm90IGFsbCAKUEVCcyBjYW4gYmUgcmVzY3VlZCwgYWNj
b3JkaW5nIHRvIGdldF9wZWJfZm9yX3dsKCkuCkZvciBleGFtcGxlOiBQQiwgUEMgY2Fubm90IGJl
IHJlc2N1ZWQsIHVubGVzcyBQQSBpcyB0YWtlbiBmb3Igd3JpdGluZyAKYW5kIHRoZW4gd2wgaXMg
anVzdCByaWdodCBzY2hlZHVsZWQuCgp1YmktPmZyZWUgdHJlZToKICAgICAgMjk2MDAoUEIpCjEo
UEEpICAgICAgICAyOTYwMChQQykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
