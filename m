Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275B7C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:28:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A752078A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 00:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGFItAEh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3A752078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PeHbU0H+fm4EclV0HcND7clMNFq409yTtDk2AE/5TPs=; b=jGFItAEh0bcHbOHGq2VAYiN1O
	jzkv+jiaSOUhGvZ+cn7edd9CjGEz3A2stPt3bj01ssFaa5XJqhbsVtiJrkf46dPxI29GlLPtKt6lj
	Ht5Y9z5JDLgbxUoory9avH74Oc3cEJRS0pf3mQjkA3mSE13B7oSqnNF1w3HEhIFb0vRhFCuU9i8lO
	kFfXJ2CABrCX5cm+JwW9Z40oU17b7LNVjDgKOchf5pumJsrMJFxOFyK2CEWq58HWb1KinUzqc4qJt
	LRB4FJOEBFpOqn+UZpyx8OW/2HmRAC2LqaRPPtSXrzd0wYOtpJbDA4+vhgb6siYRw/458iNWR1d+g
	6XdvuSaXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSUdz-0004kJ-Ic; Wed, 14 Oct 2020 00:27:51 +0000
Received: from regular1.263xmail.com ([211.150.70.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSUdW-0004Vy-N8; Wed, 14 Oct 2020 00:27:24 +0000
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id 2A776137E;
 Wed, 14 Oct 2020 08:27:19 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.120] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P19667T139950918633216S1602635237277608_; 
 Wed, 14 Oct 2020 08:27:18 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <78ee4579de79111539b25c0541edb441>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH v10 5/8] arm64: dts: rockchip: Add NFC node for PX30 SoC
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
References: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
 <20200930020902.7522-1-yifeng.zhao@rock-chips.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <d334b3f3-fb68-e7e7-4d46-b76b7408f17e@rock-chips.com>
Date: Wed, 14 Oct 2020 08:27:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930020902.7522-1-yifeng.zhao@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_202723_051435_E81ACAAD 
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

Ck9uIDIwMjAvOS8zMCDkuIrljYgxMDowOCwgWWlmZW5nIFpoYW8gd3JvdGU6Cj4gQWRkIE5BTkQg
RkxBU0ggQ29udHJvbGxlcihORkMpIG5vZGUgZm9yIFBYMzAgU29DLgo+Cj4gU2lnbmVkLW9mZi1i
eTogWWlmZW5nIFpoYW8gPHlpZmVuZy56aGFvQHJvY2stY2hpcHMuY29tPgo+IC0tLQo+Cj4gQ2hh
bmdlcyBpbiB2MTA6IE5vbmUKPiBDaGFuZ2VzIGluIHY5OiBOb25lCj4gQ2hhbmdlcyBpbiB2ODog
Tm9uZQo+IENoYW5nZXMgaW4gdjc6IE5vbmUKPiBDaGFuZ2VzIGluIHY2OiBOb25lCj4gQ2hhbmdl
cyBpbiB2NTogTm9uZQo+IENoYW5nZXMgaW4gdjQ6IE5vbmUKPiBDaGFuZ2VzIGluIHYzOiBOb25l
Cj4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+Cj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlw
L3B4MzAuZHRzaSB8IDE1ICsrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKykKCkxvb2tzIGdvb2QgdG8gbWUsCgpSZXZpZXdlZC1ieTogS2V2ZXIgWWFuZzxr
ZXZlci55YW5nQHJvY2stY2hpcHMuY29tPgoKVGhhbmtzLAotIEtldmVyCgo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcHgzMC5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9yb2NrY2hpcC9weDMwLmR0c2kKPiBpbmRleCAyNjk1ZWE4Y2RhMTQuLjZjZDY3ZTgw
ZDYyMyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3B4MzAuZHRz
aQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcHgzMC5kdHNpCj4gQEAgLTk3
Myw2ICs5NzMsMjEgQEAKPiAgIAkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAl9Owo+ICAgCj4g
KwluZmM6IG5hbmQtY29udHJvbGxlckBmZjNiMDAwMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJyb2Nr
Y2hpcCxweDMwLW5mYyI7Cj4gKwkJcmVnID0gPDB4MCAweGZmM2IwMDAwIDB4MCAweDQwMDA+Owo+
ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSA1NyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQlj
bG9ja3MgPSA8JmNydSBIQ0xLX05BTkRDPiwgPCZjcnUgU0NMS19OQU5EQz47Cj4gKwkJY2xvY2st
bmFtZXMgPSAiYWhiIiwgIm5mYyI7Cj4gKwkJYXNzaWduZWQtY2xvY2tzID0gPCZjcnUgU0NMS19O
QU5EQz47Cj4gKwkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MTUwMDAwMDAwPjsKPiArCQlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsJCXBpbmN0cmwtMCA9IDwmZmxhc2hfYWxlICZmbGFz
aF9idXM4ICZmbGFzaF9jbGUgJmZsYXNoX2NzMAo+ICsJCQkgICAgICZmbGFzaF9yZG4gJmZsYXNo
X3JkeSAmZmxhc2hfd3JuICZmbGFzaF9kcXM+Owo+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBvd2Vy
IFBYMzBfUERfTU1DX05BTkQ+Owo+ICsJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwl9Owo+ICsK
PiAgIAlncHU6IGdwdUBmZjQwMDAwMCB7Cj4gICAJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscHgz
MC1tYWxpIiwgImFybSxtYWxpLWJpZnJvc3QiOwo+ICAgCQlyZWcgPSA8MHgwIDB4ZmY0MDAwMDAg
MHgwIDB4NDAwMD47CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
