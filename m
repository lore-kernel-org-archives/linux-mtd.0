Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B04C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 14:17:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2400D2075A
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 14:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XbnSBH2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2400D2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eqt0nidvpFTSK35e5nw/uBmTXPl4CW3jtKj5bNL7FKA=; b=XbnSBH2jn84nliNuJstV5ejoY
	uvyNa9I0myhStf1N7FcrRPXMVmwpQc7LlxybcGZUXXeMRH/Lq5GJKrJp7opaoQH5hxNfy0YiOTdBU
	Ea9f3ysieQdxutTrC5em/GtVVvAo9B/tXm9m+rGjDVD+39mbd6JXS4cRJVsicimJR/2BInatu6Qdm
	FWvZNLYwQMqQ2Zdqq/B05GoumsZS0FSMSTNT/ha24Lp3oCqusCZRJTrhH6b4OFIqV0+XuNokh87e2
	sV7CaGoFcMWiZ3hkSPFjIZqZ88zvTTspi38+Vt7UG4Gl7WuJfnrUFn2ahOncKC7BPnCmrtxs44vkj
	7HAgsa3vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMtx9-0000wu-AJ; Mon, 28 Sep 2020 14:16:31 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMtx3-0000v3-V9; Mon, 28 Sep 2020 14:16:27 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3DCE7240012;
 Mon, 28 Sep 2020 14:16:18 +0000 (UTC)
Date: Mon, 28 Sep 2020 16:16:17 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200928161617.2a1b2244@xps13>
In-Reply-To: <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
 <20200814085617.GA129183@roeck-us.net>
 <CA+G9fYvGkowdQmi1eBfoq2dhzBfgkFh9+7tgdNw75LydxkAEPw@mail.gmail.com>
 <bff67b4c-4fa0-2441-ddbe-15366c8601d1@roeck-us.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_101626_134870_A9CAD45B 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, linux-mips@vger.kernel.org,
 lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?w4FsdmFybyBGZXJu?= =?UTF-8?B?w6FuZGV6?= Rojas <noltari@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, jonas.gorski@gmail.com,
 linux-mtd@lists.infradead.org, tsbogend@alpha.franken.de,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlIG9uIE1vbiwg
MjEgU2VwIDIwMjAgMjA6MjY6MTkKLTA3MDA6Cgo+IE9uIDkvMjEvMjAgODoxOCBQTSwgTmFyZXNo
IEthbWJvanUgd3JvdGU6Cj4gPiBPbiBGcmksIDE0IEF1ZyAyMDIwIGF0IDE0OjI2LCBHdWVudGVy
IFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOiAgCj4gPj4KPiA+PiBPbiBNb24sIEp1
biAxNSwgMjAyMCBhdCAxMToxNzo0MEFNICswMjAwLCDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMg
d3JvdGU6ICAKPiA+Pj4gSW5zdGVhZCBvZiB0cnlpbmcgdG8gcGFyc2UgQ0ZFIHZlcnNpb24gc3Ry
aW5nLCB3aGljaCBpcyBjdXN0b21pemVkIGJ5IHNvbWUKPiA+Pj4gdmVuZG9ycywgbGV0J3MganVz
dCBjaGVjayB0aGF0ICJDRkUxIiB3YXMgcGFzc2VkIG9uIGFyZ3VtZW50IDMuCj4gPj4+Cj4gPj4+
IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5j
b20+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEdvcnNraSA8am9uYXMuZ29yc2tpQGdtYWls
LmNvbT4KPiA+Pj4gUmV2aWV3ZWQtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21h
aWwuY29tPiAgCj4gPj4gIAo+ID4gCj4gPiBXZSBzdGlsbCBzZWUgbWlwczogYWxsbW9kY29uZmln
IGJ1aWxkIGZhaWx1cmUgb24gTGludXMgdHJlZQo+ID4gICAKPiAKPiBZZXMsIHNhbWUgaGVyZS4K
ClBlcmhhcHMgdGhpcyBjaGVjayBzaG91bGQgYmUgZG9uZSBieSBhbiBleHBvcnRlZCBoZWxwZXIg
c28gdGhhdCB3ZSBkbwpub3QgYmxpbmRseSBleHBvcnQgdGhlIHZhcmlhYmxlPwoKQWx2YXJvLCBK
b25hcywgY2FuIG9uZSBvZiB5b3UgdHJ5IHRvIGFkZHJlc3MgdGhpcyBpc3N1ZSBwbGVhc2U/CgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
