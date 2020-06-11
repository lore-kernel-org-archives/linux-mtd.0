Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654B4C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:43:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36FAE206DC
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 15:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEv3g9Yq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec9Owej5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36FAE206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vy/XpS2jhhU3zi9S2W2J0Ww8W2azKLMwuBZfJSAfo4k=; b=sEv3g9YqoMtyXb
	bkPM2YFrt6//VGk/x+RjKj2TON0AofXNHR0sDPnqDZ+dCwGqAifpbzctwViesYzisxNfZTheHHaES
	tNMx6O6EchLO4HRdKOlJt7dxiNsNJT3b+SdET4tgMVT7KmbNP9zoojPInLaMtHZM+1OskPflsxgQx
	TvhhST0zTbLjZqgjQeJnKIpplDH8G6Duhni+8hTRSM3AeTxPQ3nTayLs45Ig2sczlDW/yulGkfmUE
	X9okDHGXL7BFLZINE6armB92H4a9OLijS0BNGrwris4pSF9v8bQETulzRG2WeCxB1MF4/SS4WLYG8
	5ohOn/4h52wmkDbEVmNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjPLw-0004eQ-EW; Thu, 11 Jun 2020 15:42:52 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjPLt-0004dR-3E; Thu, 11 Jun 2020 15:42:50 +0000
Received: by mail-pg1-x542.google.com with SMTP id m1so2706303pgk.1;
 Thu, 11 Jun 2020 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fQ+wsrzemkIPe2q506QN7HeF76dszLO8Devz823zEFU=;
 b=Ec9Owej5gVTLx1LgNfE5z+WQetriTeu1ERovocrLzbYfjsFYQ4SqhApR7I5YxA28Fl
 sTvU3lpjWRcLGD9LEt8x3ZZzyQhrGx0NOrCw7Jp4gFweeYvwLnnkBEgexGXU0A+icWYq
 fRUNXqVgRJRBCKCykhCY3BGZ76l5RWpHM1XmW7rxJegXOvvjhlVIDos+zZXjUFs4c20M
 Y+ZC7RaONrSiu5opRrIKb2Vhp88Rh+h3ND0fEvkfXdZVS8+ui3sjFgeEv+yMhXfU2s8Y
 qoqOts0a3vFDGNEbR4Z682dZBNgWAt3iRDnRuIeP0OM+7H0nsODztVmo1ZAxRfGhTIMG
 ysig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQ+wsrzemkIPe2q506QN7HeF76dszLO8Devz823zEFU=;
 b=uNhrIkkM9kjgkcP7SS7/pM5NStdnUfpmBGqAf2baubzXYQK5aVX+KtOs8kwpQK0sLI
 12vvn92q13EylqJuZ8espHfwxfAaAkiG2KXM0wliuv4RkZmXoM+Asfr7wx27+eps8gsQ
 JfMU8OjQlKu4xfYNTggYUP2PMcnfUimRERExFxnLFy/l1OOeimorUuGZeaTPQLTkC7BH
 uZPV6S3jSZfW9ya9S9d8gzF8ZXIfq3C5nS7UvOQxC/kRumY5D0ozHRoLnZS2MmnkU0kQ
 a8FdLklk+jVsGkGPtuazoTYZ69x99u1bfRr6KdzzJw1CboRmy6pu5NcXLohM9n7/SCiT
 kieQ==
X-Gm-Message-State: AOAM531LB/NX2XxjShyPwwW5uYaRXuJCM5VW3vfhUxY4pLjdJF5lh4Ld
 KmdlhTjRwfPEjlkgILOPI//atSlT
X-Google-Smtp-Source: ABdhPJwIRQAPnj3r6aqieKP9UnNBsABbKwe5X6HFBUwRl50yl3r3oJQiOfH59nPr0GARKI5+XAFa/w==
X-Received: by 2002:a63:e34d:: with SMTP id o13mr7215684pgj.45.1591890166194; 
 Thu, 11 Jun 2020 08:42:46 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id k19sm3749457pfg.153.2020.06.11.08.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 08:42:45 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
 <20200608160649.3717152-1-noltari@gmail.com> <20200611095540.250184d2@xps13>
 <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <715b0947-f4dd-0c04-5c52-5da06c04d665@gmail.com>
Date: Thu, 11 Jun 2020 08:42:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <779D37C7-58CB-49AF-8739-C34295B86FC4@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_084249_161401_735DA63D 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, vigneshr@ti.com, richard@nod.at,
 linus.walleij@linaro.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
 bcm-kernel-feedback-list@broadcom.com, Jonas Gorski <jonas.gorski@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA2LzExLzIwMjAgODoxNiBBTSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+
IEhpIE1pcXVlbCwKPiAKPj4gRWwgMTEganVuIDIwMjAsIGEgbGFzIDk6NTUsIE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IGVzY3JpYmnDszoKPj4KPj4gSGkgw4FsdmFy
bywKPj4KPj4gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4gd3Jv
dGUgb24gTW9uLCAgOCBKdW4gMjAyMAo+PiAxODowNjo0OSArMDIwMDoKPj4KPj4+IEluc3RlYWQg
b2YgdHJ5aW5nIHRvIHBhcnNlIENGRSB2ZXJzaW9uIHN0cmluZywgd2hpY2ggaXMgY3VzdG9taXpl
ZCBieSBzb21lCj4+PiB2ZW5kb3JzLCBsZXQncyBqdXN0IGNoZWNrIHRoYXQgIkNGRTEiIHdhcyBw
YXNzZWQgb24gYXJndW1lbnQgMy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiDDgWx2YXJvIEZlcm7D
oW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXMg
R29yc2tpIDxqb25hcy5nb3Jza2lAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiB2MjogdXNlIENGRV9F
UFRTRUFMIGRlZmluaXRpb24gYW5kIGF2b2lkIHVzaW5nIGFuIGFkZGl0aW9uYWwgZnVudGlvbi4K
Pj4+Cj4+PiBkcml2ZXJzL210ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMgfCAyOSArKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MjUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMv
YmNtNjN4eHBhcnQuYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNjN4eHBhcnQuYwo+Pj4gaW5k
ZXggNzhmOTBjNmMxOGZkLi40OTNhNzViMmYyNjYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210
ZC9wYXJzZXJzL2JjbTYzeHhwYXJ0LmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNt
NjN4eHBhcnQuYwo+Pj4gQEAgLTIyLDYgKzIyLDkgQEAKPj4+ICNpbmNsdWRlIDxsaW51eC9tdGQv
cGFydGl0aW9ucy5oPgo+Pj4gI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4+Pgo+Pj4gKyNpbmNsdWRl
IDxhc20vYm9vdGluZm8uaD4KPj4+ICsjaW5jbHVkZSA8YXNtL2Z3L2NmZS9jZmVfYXBpLmg+Cj4+
Cj4+IEFyZSB5b3Ugc3VyZSBib3RoIGluY2x1ZGVzIGFyZSBuZWVkZWQ/Cj4gCj4gYXNtL2Jvb3Rp
bmZvLmggaXMgbmVlZGVkIGZvciBmd19hcmczIGFuZCBhc20vZncvY2ZlL2NmZV9hcGkuaCBpcyBu
ZWVkZWQgZm9yIENGRV9FUFRTRUFMLgo+IAo+Pgo+PiBJIGRvbid0IHRoaW5rIGl0IGlzIGEgZ29v
ZCBoYWJpdCB0byBpbmNsdWRlIGFzbS8gaGVhZGVycywgYXJlIHlvdSBzdXJlCj4+IHRoZXJlIGlz
IG5vdCBhbm90aGVyIGhlYWRlciBkb2luZyBpdCBqdXN0IGZpbmU/Cj4gCj4gQm90aCBhcmUgbmVl
ZGVkIHVubGVzcyB5b3Ugd2FudCB0byBhZGQgYW5vdGhlciBkZWZpbml0aW9uIG9mIENGRV9FUFRT
RUFMIHZhbHVlLgo+IFRoZXJlIGFyZSBjdXJyZW50bHkgdHdvIENGRSBtYWdpYyBkZWZpbml0aW9u
cywgdGhlIG9uZSBpbiBhc20vZncvY2ZlL2NmZV9hcGkuaCBhbmQgYW5vdGhlciBvbmUgaW4gYmNt
NDd4eHBhcnQuYzoKPiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0
ZXIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL2Z3L2NmZS9jZmVfYXBpLmgjTDI4Cj4gaHR0cHM6Ly9n
aXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvbXRkL3BhcnNlcnMv
YmNtNDd4eHBhcnQuYyNMMzMKClRoZSBjYXZlYXQgd2l0aCB0aGF0IGFwcHJvYWNoIGlzIHRoYXQg
dGhpcyByZWR1Y2VzIHRoZSBjb21waWxhdGlvbgpzdXJmYWNlIHRvIE1JUFMgYW5kIEJNSVBTX0dF
TkVSSUMgYW5kIEJDTTYzWFggb25seSwgd2hpY2ggaXMgYSBiaXQKc21hbGwuIElmIHdlIGNvdWxk
IG1vdmUgdGhlIENGRSBkZWZpbml0aW9ucyB0byBhIHNoYXJlZCBoZWFkZXIsIGFuZApjb25zb2xp
ZGF0ZSB0aGUgdmFsdWUgdXNlZCBieSBiY200N3h4cGFydC5jIGFzIHdlbGwsIHRoYXQgd291bGQg
YWxsb3cgdXMKdG8gYnVpbGQgdGhlIGJjbTYzeHhwYXJ0LmMgZmlsZSB3aXRoIENPTVBJTEVfVEVT
VCBvbiBvdGhlcgphcmNoaXRlY3R1cmVzLiBUaGlzIGRvZXMgbm90IHJlYWxseSBoYXZlIGZ1bmN0
aW9uYWwgdmFsdWUsIGJ1dCBmb3IKbWFpbnRhaW5lcnMgbGlrZSBNaXF1ZWwsIGl0IGFsbG93cyB0
aGVtIHRvIHF1aWNrbHkgdGVzdCB0aGVpciBlbnRpcmUKZHJpdmVycy9tdGQvIGRpcmVjdG9yeS4K
LS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
