Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A27C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:29:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4B5208B3
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uA3meNh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4B5208B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qJysPwtJ8akYt3eN2ybYAVAtxTI0yRrPT/YqP2pJpGw=; b=uA3meNh5cHN8AGdnWE4ANzoBB
	tHI9bREKgTHzbL2yLdyYwa94NEoFagEejq2ywsjseYKz+6q6zfCkckyKzcX94jJofRECXNE4fEhzd
	OioEqgU4qdADHzwZmEkm0Xxt0iiofKWym1TL1ATn0lczyZT3frjtZ+Oe2LRRSddQlNsaVZQ+jJ88c
	2XTHp7yOKHHcOuoBBmhDZhAjZOzKBgLzcJQHkSalTOzhPVt6G4JWm+bOoT+L3uDTWl/owVCVNWWxu
	32KB+VmvfTWjqe3EwRiM5Zy+iyWGyCDgimm2L7Z0+E7BOtB9I1g8tYMqMTbhufE1dx4D52BMkgFiu
	dFzoOhoTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSUem-0005DT-Ao; Wed, 14 Oct 2020 00:28:41 +0000
Received: from regular1.263xmail.com ([211.150.70.202])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSUe2-0004lR-TA; Wed, 14 Oct 2020 00:27:56 +0000
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 07683408;
 Wed, 14 Oct 2020 08:27:51 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P30218T139797091841792S1602635270147880_; 
 Wed, 14 Oct 2020 08:27:50 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <95e12a54f687ec159b92921abe5d4d40>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v10 7/8] arm: dts: rockchip: Add NFC node for RK2928 and
 other SoCs
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
 <20200930020902.7522-1-yifeng.zhao@rock-chips.com>
 <20200930020902.7522-3-yifeng.zhao@rock-chips.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <ec8d8e7e-ec31-997c-87a6-a8702fda9c63@rock-chips.com>
Date: Wed, 14 Oct 2020 08:27:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930020902.7522-3-yifeng.zhao@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_202755_224407_AA7956DA 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvOS8zMCDkuIrljYgxMDowOSwgWWlmZW5nIFpoYW8gd3JvdGU6Cj4gQWRkIE5BTkQg
RkxBU0ggQ29udHJvbGxlcihORkMpIG5vZGUgZm9yIFJLMjkyOCwgUkszMDY2LCBSSzMxNjgKPiBh
bmQgUkszMTg4IFNvQ3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZaWZlbmcgWmhhbyA8eWlmZW5nLnpo
YW9Acm9jay1jaGlwcy5jb20+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYxMDogTm9uZQo+IENoYW5n
ZXMgaW4gdjk6IE5vbmUKPiBDaGFuZ2VzIGluIHY4OiBOb25lCj4gQ2hhbmdlcyBpbiB2NzogTm9u
ZQo+IENoYW5nZXMgaW4gdjY6IE5vbmUKPiBDaGFuZ2VzIGluIHY1OiBOb25lCj4gQ2hhbmdlcyBp
biB2NDogTm9uZQo+IENoYW5nZXMgaW4gdjM6IE5vbmUKPiBDaGFuZ2VzIGluIHYyOiBOb25lCj4K
PiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3JrM3h4eC5kdHNpIHwgOSArKysrKysrKysKPiAgIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCkxvb2tzIGdvb2QgdG8gbWUsCgpSZXZpZXdlZC1i
eTogS2V2ZXIgWWFuZzxrZXZlci55YW5nQHJvY2stY2hpcHMuY29tPgoKVGhhbmtzLAotIEtldmVy
Cgo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JrM3h4eC5kdHNpIGIvYXJjaC9h
cm0vYm9vdC9kdHMvcmszeHh4LmR0c2kKPiBpbmRleCA4NTlhNzQ3NzkwOWYuLjk3NDE1MTgwZDVi
YiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9yazN4eHguZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3JrM3h4eC5kdHNpCj4gQEAgLTI3Niw2ICsyNzYsMTUgQEAKPiAgIAkJ
c3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAl9Owo+ICAgCj4gKwluZmM6IG5hbmQtY29udHJvbGxl
ckAxMDUwMDAwMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazI5MjgtbmZjIjsKPiAr
CQlyZWcgPSA8MHgxMDUwMDAwMCAweDQwMDA+Owo+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAy
NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQljbG9ja3MgPSA8JmNydSBIQ0xLX05BTkRDMD47
Cj4gKwkJY2xvY2stbmFtZXMgPSAiYWhiIjsKPiArCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJ
fTsKPiArCj4gICAJcG11OiBwbXVAMjAwMDQwMDAgewo+ICAgCQljb21wYXRpYmxlID0gInJvY2tj
aGlwLHJrMzA2Ni1wbXUiLCAic3lzY29uIiwgInNpbXBsZS1tZmQiOwo+ICAgCQlyZWcgPSA8MHgy
MDAwNDAwMCAweDEwMD47CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
