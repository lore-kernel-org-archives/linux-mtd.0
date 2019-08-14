Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD44C32750
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 01:21:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D08120665
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 01:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bi+1oCDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D08120665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4oVtCcF7xG0YBYLgfIosthNJaB679m3N/AIG9Td6Q0=; b=bi+1oCDjE8fzik
	+7fefRs7hrlEy6VZtRi3eKz2gBQOBQjKUH6hJGUdptpxXOZTXte1Nl3PGhfMZBumP66JGmb3FLtD+
	p2ReNWD4GU0K9mtqPbtCBIPcFYSRp9R9xZpzdpsne7nkOkwui/uiTkxd2pstSSFLhvW+7j3QwQ50S
	CBTgjDYzNXxgXVhKlIHkuGOAnyg+OXNKSILCEXzhP0dU4pZQXqY6th879kyMfSnnyadVsV228jUQa
	GUDDDnm7mHZ4ZWlK/NEtiXF86oTGEwWrr574wFA94tXg2H1eG6MuE5oB0GHdx7vbuco5akMg8j2k9
	WjAzTm4K6nAKmQA228vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxhy5-0008Gz-OW; Wed, 14 Aug 2019 01:20:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxhy2-0008GB-Mj
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 01:20:48 +0000
Received: from dggemi404-hub.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id D99AD20CFFE8B555D744;
 Wed, 14 Aug 2019 09:20:32 +0800 (CST)
Received: from DGGEMI524-MBX.china.huawei.com ([169.254.7.6]) by
 dggemi404-hub.china.huawei.com ([10.3.17.142]) with mapi id 14.03.0439.000;
 Wed, 14 Aug 2019 09:20:24 +0800
From: chengzhihao <chengzhihao1@huawei.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHViaWZzOiB1Ymlmc190bmNfc3RhcnRfY29tbWl0?=
 =?utf-8?B?OiBGaXggT09CIGluIGxheW91dF9pbl9nYXBz?=
Thread-Topic: [PATCH] ubifs: ubifs_tnc_start_commit: Fix OOB in layout_in_gaps
Thread-Index: AQHVPsBTBWetoNcJ1UaytZ+21M4VxabhWCiAgAETrKCAFtDaAIAAv90Q
Date: Wed, 14 Aug 2019 01:20:23 +0000
Message-ID: <0B80F9D4116B2F4484E7279D5A66984F7BD738@dggemi524-mbx.china.huawei.com>
References: <1563602720-113903-1-git-send-email-chengzhihao1@huawei.com>
 <CAFLxGvxEAGtQDFm4G3orY+M9yuthDA4j0+u=HbE9DKuo7H8WCg@mail.gmail.com>
 <0B80F9D4116B2F4484E7279D5A66984F7A7472@dggemi524-mbx.china.huawei.com>
 <CAFLxGvz__aw+BnfmGS3XXGqT6n6q-9miLPoVcL9KuvaZ2QbVUQ@mail.gmail.com>
In-Reply-To: <CAFLxGvz__aw+BnfmGS3XXGqT6n6q-9miLPoVcL9KuvaZ2QbVUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.224.82]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_182046_910898_126B389A 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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
Cc: "zhangyi \(F\)" <yi.zhang@huawei.com>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U3VyZSwgSSdsbCBkbyBtb3JlIHRlc3RzIG9uIGRpZmZlcmVudCBtYWNoaW5lcyB0byBjaGVjayB0
aGUgYXNzZXJ0aW9uLiBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgd2hlbiB0aGlzIGFzc2VydGlv
biB3aWxsIGJlIHRyaWdnZXJlZC4gQWx0aG91Z2ggSSBoYXZlbid0IGZvdW5kIHRoaXMgYXNzZXJ0
aW9uIGJlIHRyaWdnZXJlZCBzbyBmYXIgaW4gc2V2ZXJhbCB0ZXN0cyBvbiB4ODZfNjQocWVtdSku
DQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogUmljaGFyZCBXZWluYmVyZ2Vy
IFttYWlsdG86cmljaGFyZC53ZWluYmVyZ2VyQGdtYWlsLmNvbV0gDQrlj5HpgIHml7bpl7Q6IDIw
MTnlubQ45pyIMTTml6UgNTo0NA0K5pS25Lu25Lq6OiBjaGVuZ3poaWhhbyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+DQrmioTpgIE6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+
OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+OyBBcnRlbSBCaXR5dXRza2l5
IDxkZWRla2luZDFAZ21haWwuY29tPjsgemhhbmd5aSAoRikgPHlpLnpoYW5nQGh1YXdlaS5jb20+
OyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgTEtNTCA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz4NCuS4u+mimDogUmU6IFtQQVRDSF0gdWJpZnM6IHViaWZzX3RuY19zdGFydF9j
b21taXQ6IEZpeCBPT0IgaW4gbGF5b3V0X2luX2dhcHMNCg0KT24gVHVlLCBKdWwgMzAsIDIwMTkg
YXQgMzoyMSBBTSBjaGVuZ3poaWhhbyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOg0K
Pg0KPiBPSywgdGhhdCdzIGZpbmUsIGFuZCBJIHdpbGwgY29udGludWUgdG8gdW5kZXJzdGFuZCBt
b3JlIGltcGxlbWVudGF0aW9uIGNvZGUgcmVsYXRlZCB0byB0aGlzIHBhcnQuDQoNCkkgdGhpbmsg
d2UgY2FuIGdvIHdpdGggdGhlIHJlYWxsb2MoKSBhcHByb2FjaCBmb3Igbm93Lg0KQ2FuIHlvdSBw
bGVhc2UgY2hlY2sgd2hldGhlciB0aGUgYXNzZXJ0KCkgdHJpZ2dlcnM/DQoNCi0tIA0KVGhhbmtz
LA0KLy9yaWNoYXJkDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
