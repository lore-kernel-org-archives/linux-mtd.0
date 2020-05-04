Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8FCC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 21:44:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805AC20707
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 21:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IIlF9Xg8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvklki9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805AC20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FnuZU+AP/gXayPyy0mqZEz9gkLS0a+E1LRR5pRRwdtU=; b=IIlF9Xg8yjoOAnTlAMSgLsFBB7
	8Y3SKhQCp/9fMxVxkJh29Z3IGJA0tbfNbER5EKyQDk2x5S5iIMazZpH0ehwidLe5Cbuf7OQeTHjIg
	6vhvmbKf6fpxAC7UTWO0skAosswMoOAgwJh4rwBzJtoAghGlQ9oM/a7xLkNlqOdTw+Xq40C6MBqEQ
	+7aj+5S7LFzmYOQ6LXWG2tngUVrxI+j2MqBDoJ+2v6Rfn+o+DrcACUs5YfIhINZKQ88DLV1uuVU5l
	3pMY35eVB7XrQw41obbO4IOQzlMU+lyxfuTdtiyhgSpCkyyAeDCqj19oT5Mk9/sqOCQ2sntG8UIMZ
	eKnMwCnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVisP-0005A0-S2; Mon, 04 May 2020 21:43:49 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVisN-00059P-CS
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 21:43:48 +0000
Received: by mail-pl1-x641.google.com with SMTP id b6so298782plz.13
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bnAoXlE6naZXplH2LBElomP8n2q8fSlbfgAhYHfgt5s=;
 b=Xvklki9IQXKduwRuB61lYr5L7UeuVOeXXXrkX5wDjDsAsfcntdW37APtcUDnKjKhJQ
 WmOMHiPHAqFkCBadXH9VpgorfXKBgRC0zQZmDQwWEf5jjAq+8sw35TJd4O56nuC0k703
 NTgDizKysiTachoo/YlCwUkehsDeXiXfNjF4M7lF3SMYeAXACAwwZDDZQDSolHZ/7d6O
 79oHEf56eWYXRDOiQhteVbDsYiVu/7aMBQ8d1xe0YvOF9JKSUHXk+CT5dtJBcWQwdHPB
 Q+P888yZAB+7VPuN5NfWeILJtWbjJy9OZJSYmM80DQXMbQz1NklywNzhP6xiAxtWL0l/
 5ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bnAoXlE6naZXplH2LBElomP8n2q8fSlbfgAhYHfgt5s=;
 b=pM3f6mO0X9MXB2Zk+k1KRSa7Okr6MCKLuTlCoMMTwaqVvD0gQ+Zejf1QTSB9Uo1vPC
 fVLFAPPyJrbXj9aN9R8cSkia9H22CsseAE9RQUOZKPWdEUAKzRQV7p/ssAvENG3Bkv55
 50/4oIfi7N4OO+9uKUEv6zPVImbT04KPC6ZfUFG7KMwQ6AfjhWGMQQc9bvijuycqhHdE
 q6UiANTJyNzNeQzGzrZF0wn6cSmCvLvg1MGURnszNF5Me9mOGcsi5JEgveMC9ofMO0gb
 gZ35+zD07la5GgQN8pPpuAKHFBnWnWFxxSXJwksCoTA2GvWCXmvppaGPvNf7G5+6/QaX
 S9wA==
X-Gm-Message-State: AGi0PubNTPWu7Wn6LoOeWtO/Tl4BgsO+LnpdQaZih1CSTrcCW0rkRN7F
 83cgYcxwykeoEuix/e3s2ds=
X-Google-Smtp-Source: APiQypKUaF4qPe5cgKCYcrALmmsDKqYrLA0zZqfhO29Z84bE+BLxFpXhzF6qsCG3ZfRxgDI0iuEyrw==
X-Received: by 2002:a17:90a:2b46:: with SMTP id
 y6mr207238pjc.154.1588628625309; 
 Mon, 04 May 2020 14:43:45 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a142sm52764pfa.6.2020.05.04.14.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 14:43:44 -0700 (PDT)
Subject: Re: [PATCH] nand: brcmnand: correctly verify erased pages
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20200504092943.2739784-1-noltari@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2fea8057-8b84-790e-60ba-b6848a186e18@gmail.com>
Date: Mon, 4 May 2020 14:43:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504092943.2739784-1-noltari@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_144347_422563_139E0888 
X-CRM114-Status: GOOD (  17.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzQvMjAyMCAyOjI5IEFNLCDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgd3JvdGU6Cj4g
VGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2Vk
Lgo+IFRoaXMgaXMgYSBwcm9ibGVtIHdoZW4gSkZGUzIgY2xlYW5tYXJrZXJzIGFyZSBhZGRlZCB0
byB0aGUgT09CLCBzaW5jZSBpdCB3aWxsCj4gZmFpbCBkdWUgdG8gdGhlIHVzYWJsZSBPT0IgYnl0
ZXMgbm90IGJlaW5nIDB4ZmYuCj4gQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCB0
aGUgRUNDIGFyZW4ndCAweGZmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRl
eiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+CgpDYW4geW91IHByb3ZpZGUgYSBGaXhlczogdGFn
IGZvciB0aGlzIGNoYW5nZT8KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMgfCAyMiArKysrKysrKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IGU0ZTNjZWVhYzM4Zi4uNTQ2ZjA4MDdiODg3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gQEAgLTIw
MTgsNiArMjAxOCw3IEBAIHN0YXRpYyBpbnQgYnJjbW5hbmRfcmVhZF9ieV9waW8oc3RydWN0IG10
ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIHN0YXRpYyBpbnQgYnJjbXN0
Yl9uYW5kX3ZlcmlmeV9lcmFzZWRfcGFnZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiAgCQkgIHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHZvaWQgKmJ1ZiwgdTY0IGFkZHIpCj4gIHsKPiArCXN0cnVj
dCBtdGRfb29iX3JlZ2lvbiBvb2JlY2M7Cj4gIAlpbnQgaSwgc2FzOwo+ICAJdm9pZCAqb29iID0g
Y2hpcC0+b29iX3BvaTsKPiAgCWludCBiaXRmbGlwcyA9IDA7Cj4gQEAgLTIwMzUsMTEgKzIwMzYs
MjQgQEAgc3RhdGljIGludCBicmNtc3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLAo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCWZvciAo
aSA9IDA7IGkgPCBjaGlwLT5lY2Muc3RlcHM7IGkrKywgb29iICs9IHNhcykgewo+ICsJZm9yIChp
ID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrKSB7Cj4gIAkJZWNjX2NodW5rID0gYnVmICsg
Y2hpcC0+ZWNjLnNpemUgKiBpOwo+IC0JCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVu
ayhlY2NfY2h1bmssCj4gLQkJCQkJCSAgY2hpcC0+ZWNjLnNpemUsCj4gLQkJCQkJCSAgb29iLCBz
YXMsIE5VTEwsIDAsCj4gKwo+ICsJCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhl
Y2NfY2h1bmssIGNoaXAtPmVjYy5zaXplLAo+ICsJCQkJCQkgIE5VTEwsIDAsIE5VTEwsIDAsCj4g
KwkJCQkJCSAgY2hpcC0+ZWNjLnN0cmVuZ3RoKTsKPiArCQlpZiAocmV0IDwgMCkKPiArCQkJcmV0
dXJuIHJldDsKPiArCj4gKwkJYml0ZmxpcHMgPSBtYXgoYml0ZmxpcHMsIHJldCk7Cj4gKwl9Cj4g
Kwo+ICsJZm9yIChpID0gMDsgbXRkLT5vb2JsYXlvdXQtPmVjYyhtdGQsIGksICZvb2JlY2MpICE9
IC1FUkFOR0U7IGkrKykKPiArCXsKPiArCQlyZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1
bmsoTlVMTCwgMCwKPiArCQkJCQkJICBvb2IgKyBvb2JlY2Mub2Zmc2V0LAo+ICsJCQkJCQkgIG9v
YmVjYy5sZW5ndGgsCj4gKwkJCQkJCSAgTlVMTCwgMCwKPiAgCQkJCQkJICBjaGlwLT5lY2Muc3Ry
ZW5ndGgpOwo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQlyZXR1cm4gcmV0Owo+IAoKLS0gCkZsb3Jp
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
