Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463B0C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E76332311B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E76332311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Be1dHU/p4kw5Y7ZNvsb1TpEEnoXpHJe/HZVDFEmExyg=; b=bGzAKqcCsaUNU9Nvdz62OZNY0
	mCx5bpSxz3BlafmXOno39pBfnf/Abb6qU6knDA69HAToWY9eWCtvjd2oO83+VoDhxxSs2+wtQUSNk
	hRDg4QJGkq4xSBI6tC4NvRJruM/fFBRRxFMfP/6RIqySnEVdmpKEk0OQK9mEJhDYDA4qiLoB0SELl
	hSRZ1vLPgp+fMsDdhLdXYIQVjoKReT2wZqrzUveTDOpcJho7E9x6CNMXQsqRyIlwunBOfDQNsNkd0
	zyfxbBO63do8JMd7zLjMMsJZXz/YNJ0eo1F3gU8NqGSdNxqmU3pmev4FWU+0Q4eYjfJDIIBe72HUn
	TUAWXB9ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxAA2-0001og-5W; Wed, 06 Jan 2021 14:51:42 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxA9z-0001nE-AR
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 14:51:40 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5739E1C0002;
 Wed,  6 Jan 2021 14:51:35 +0000 (UTC)
Date: Wed, 6 Jan 2021 15:51:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] mtd: st_spi_fsm: use resource_size
Message-ID: <20210106155133.7f901871@xps13>
In-Reply-To: <20210106131847.443-1-zhengyongjun3@huawei.com>
References: <20210106131847.443-1-zhengyongjun3@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_095139_455169_FF6178C9 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpaaGVuZyBZb25nanVuIDx6aGVuZ3lvbmdqdW4zQGh1YXdlaS5jb20+IHdyb3RlIG9u
IFdlZCwgNiBKYW4gMjAyMQoyMToxODo0NyArMDgwMDoKCj4gVXNlIHJlc291cmNlX3NpemUgcmF0
aGVyIHRoYW4gYSB2ZXJib3NlIGNvbXB1dGF0aW9uIG9uCj4gdGhlIGVuZCBhbmQgc3RhcnQgZmll
bGRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFlvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVh
d2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYyBiL2RyaXZlcnMvbXRk
L2RldmljZXMvc3Rfc3BpX2ZzbS5jCj4gaW5kZXggMTg4ODUyM2Q5NzQ1Li45ODM5OTljMDIwZDYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKPiArKysgYi9k
cml2ZXJzL210ZC9kZXZpY2VzL3N0X3NwaV9mc20uYwo+IEBAIC05MjQsNyArOTI0LDcgQEAgc3Rh
dGljIGludCBzdGZzbV9yZWFkX3N0YXR1cyhzdHJ1Y3Qgc3Rmc20gKmZzbSwgdWludDhfdCBjbWQs
Cj4gIAlCVUdfT04oYnl0ZXMgIT0gMSAmJiBieXRlcyAhPSAyKTsKPiAgCj4gIAlzZXEtPnNlcV9v
cGNbMF0gPSAoU0VRX09QQ19QQURTXzEgfCBTRVFfT1BDX0NZQ0xFUyg4KSB8Cj4gLQkJCSAgIFNF
UV9PUENfT1BDT0RFKGNtZCkpLAo+ICsJCQkgICBTRVFfT1BDX09QQ09ERShjbWQpKTsKPiAgCj4g
IAlzdGZzbV9sb2FkX3NlcShmc20sIHNlcSk7Cj4gIAoKU2FtZSByZW1hcmsgYWdhaW4sIGRlc2Ny
aXB0aW9uIGFuZCBhY3R1YWwgY2hhbmdlIGRvIG5vdCBtYXRjaC4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
