Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBDAD2ED0F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywSq0ElRyCR71ZNHoOxXZygBadoXuOQRr2a2+jAhE2Y=; b=saJzE2uH7x7qVz
	GbOLCtvWX3/5JrTgTqeQgQfuwhtSk0xEs3Wq0MyqNUb0HiuYZdSfCNQmTHs0CZ/V86u8dHy2itMZV
	rXPl/xClRSA67uRcT5BhsWO/xH4VE46X6KToTGzJlpc3EyxBFOr1RBWSfirMbv4kkQpA+/GcWUl07
	CZCV/NIOJdFqqZ9LijEmFH87Kk5rWZ0qtzDRmjpsud9ZwYVBHN5MnYjJWRnB0bx7qD24ZGEHC7mrV
	LVg99TNtsJESu3dKGMo60WavC9CNr9D+1IsQ4qwqbOqy58FaiQz+KASrO/1BJstr9RmdHP2UyiwSY
	bpvtHeql6WIjrQbyHKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9AQ-00000003dby-0CzP;
	Tue, 20 Jan 2026 10:40:58 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9AK-00000003dbA-1l6K
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 10:40:56 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so6063425e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2026 02:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768905650; cv=none;
        d=google.com; s=arc-20240605;
        b=JJXAXjH3L4LCouNq8Wr4Gd3KSMf3pJFLapkI/5bCW80/L9se+gi7oEgJJaErjn7e8u
         9Majqjpoeyn5/CKmB54FgH4Q4sjWMamL91xA/kK/D8zOLFjvmnRP3u5zuVzVEkN3V66F
         mrL7Uij1E+SvmkXFnVbt9xTMMLpORGzJLuRfTYFzpiz/D1bg6X15OcumeXvBy+PIerqy
         1+ji4rg40jdpdG0XtpaIa7dx3D2gKcTWz5QCQGR1TSYERU3H4ELsFjhm8BUqMWKC3Mc9
         bu0SF1cmG2WuMejLorz92jNpQnsYRv+9Ce9Ti/RAgRpIDl6JMUGZfZpTaw8bANE/M3Ts
         DEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eX8v1QdR4WJF8OCIlBf2jemkm5zLheafYqJqaFWFWj8=;
        fh=nrXuRMlcCewQ3YteN/jQPdIfoB2tad8k31VfwKSKI+c=;
        b=id6O03J3tIr0fVHfT6h5f57qlFrzJ0hKK81OSDt2zYa/CC0hTzc+OGp6yzh8uAirG/
         6kcKemGghQWIIp9ggg2LWEI3I2rylE0hdvJs+YDpKrzwrbRCgxCOt+k3De6CJwgcYBbU
         b3/vhWJ5KTD0xxtOKiYaM6hXsMgRYw65wgdT7kuqC0MNq1DQaqA1+t9649n3kzcgxLFq
         /7hyo0aXdLkvG7drxh4lxQ12mPzcfdr1cu1h3zrZ/jHaUQf2PKbN163ClhFP+1znWk15
         rEKTgreXmfefLb4mfL9JGdWle7pLfoypaqRJc/SyUI4XfPLSP6rUT55MznRf+nH/YaMf
         r/lQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768905650; x=1769510450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX8v1QdR4WJF8OCIlBf2jemkm5zLheafYqJqaFWFWj8=;
        b=Mdy23wQzf6XyaVsO+OO/hZncjxsPA3P0yIo9MQTO8hVr7rSaNddn8SaERfhfpxrPNp
         w4TX7vn9hmwWwxuzlW98AlOWMZiz6wh+/5MZPtFOAwL2IT1P5rXwXUqesF25y9C6dqMA
         MR4bN18HCdZBtdbl0KhfFMKBrSXQe21OOjEyKzbF14S9qspo/sqkv4wgq65tJTHkIcn7
         +x42u8sgfIjIk6dLXl3CBRm4Hw0S2cofFFnsInV61U7qgx8CiI2WgfZnefaW20Yaq+bo
         kivSQixGxA4FsDRoATuqBhI5J6zGXnovCVZegUsUBu8C6/g/C4aqZ3Yp0gFJbNhIfQ/f
         GG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905650; x=1769510450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eX8v1QdR4WJF8OCIlBf2jemkm5zLheafYqJqaFWFWj8=;
        b=wu7GdqBuajYXiGsdSlbzOMCTTCtwkr9nd77WkcaWbtIUR5RNkc16slgRSR08faY184
         W0NLsrd0aPNQLXFiLSJkES9WC+7gInOwCGeHjWw/k1DGzWSfipm1sR8/J8y5rOsdS7nM
         +2tCTzKd5syKXaPCeWWeHgcmhoIdiaHH40r9vtKIIgR/dPkSvU9XREd+/Xgps6sduVUu
         q3l1dNlHitU26gL151kuZ9KdKsrAWxYNGIC8knPYz3r1N+adS9jJTy+zDrt6t6vg1IO2
         n6kjiWwSAZSBV3gU9C9+XGhjlXA4dOYzmdQ9gaPq7immWJlQwm24H3jNclnsQ1fIMsAI
         NOug==
X-Forwarded-Encrypted: i=1; AJvYcCW963Zw2LaI7BtlS9VHgc5HFbIHKHM151lZ59UbHCAEorcniYmdSRFnk3KcGiAlPkzNEBYXIn4R1+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxELmpHr/9B4igpFjsSVeGnyWN/QImvsEmJjZTIAGZMxz5RWAnk
	Ma3R/+FRn5KhsrblFaVx3n/PamfdX6LDNgzaRfia8rgfxCYwYfz6cSRukNKLU9eoijXI5KI03iu
	YRvkW6SxtLZFt8mGHcYa0qwL3I8t+E6VSCovetCCOUQ==
X-Gm-Gg: AZuq6aIbgaK8oQAbePw5u7bnd8KydTbN49yQ8Mwy67S0bCOMoB0wK0XH0pmCYakM6DL
	2k+l6cnJCNM0nPie+/9eu397RPjX0QpPqCNUB4E56DjZQs4yLglblZ7f7cVEWBSj2vY8ThfxlfT
	COECsBQTwRzwnnW1KRjHN6M7GGJIDsRzsY4pXPL6h8gGdwUdpLe9KXywf87+HMQCypYpr5RKBxo
	0JLWBol3pWRZLUM92XB18fw1RosGUm7tbUW/0uNPEG7lhKOdGAMjEMOK02CGNn1k9DtN4Wym6OZ
	SMQsKQ==
X-Received: by 2002:a05:6512:128a:b0:59b:afeb:fcbc with SMTP id
 2adb3069b0e04-59bafebfcefmr4516134e87.2.1768905650007; Tue, 20 Jan 2026
 02:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org> <20260119-dt-mtd-partitions-v2-6-77ebb958a312@kernel.org>
In-Reply-To: <20260119-dt-mtd-partitions-v2-6-77ebb958a312@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Jan 2026 11:40:13 +0100
X-Gm-Features: AZwV_QhqsUxCI7MbeIHxKDkh3ditdiXP0OuLPOhjt9QynYvMhxR1XuB9Re1SWTU
Message-ID: <CAPDyKFo_4jiX7HjqzRc6r_uLG5Chto8aP_e5R9qv=jUjczr2Hg@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: mtd: partitions: Drop partitions.yaml
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_024054_657182_FF19C214 
X-CRM114-Status: GOOD (  18.73  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMCBKYW4gMjAyNiBhdCAwMjo0OSwgUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgcGFydGl0aW9ucy55YW1sIHNjaGVtYSBpcyBhbiB1bnVz
dWFsIHN0cnVjdHVyZSBpbiB0aGF0IGl0IGluY2x1ZGVzCj4gYWxsIHBvc3NpYmxlIHBhcnRpdGlv
biB0eXBlcywgYW5kIGl0IGRpc2FibGVzIHRoZSBub3JtYWwgbWF0Y2hpbmcgYnkKPiBjb21wYXRp
YmxlIHN0cmluZ3MuIEFzIHBhcnRpdGlvbnMueWFtbCBoYXMgbm90aGluZyB0byBtYXRjaCBvbiwg
aXQgaXMKPiBvbmx5IGFwcGxpZWQgd2hlbiBleHBsaWNpdGx5IHJlZmVyZW5jZWQuIFRoZSB1c2Ug
b2YgIm9uZU9mIiBhbHNvIHJlc3VsdHMKPiBpbiBtaXNsZWFkaW5nIHdhcm5pbmdzIHdoaWNoIGFy
ZSBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZC4gRHJvcAo+IHBhcnRpdGlvbnMueWFtbCBhbmQgcmVs
eSBvbiB0aGUgc3RhbmRhcmQgY29tcGF0aWJsZSBtYXRjaGluZyBpbnN0ZWFkLgo+Cj4gVGhlICJt
bWMtY2FyZCIgY2FzZSBwcmV2aW91c2x5IGFsbG93ZWQgYW55IHBhcnRpdGlvbiB0eXBlLCBidXQg
bm93IG9ubHkKPiBhbGxvd3MgImZpeGVkLXBhcnRpdGlvbnMiLiBUaGVyZSBhcmVuJ3QgYW55IHVz
ZXJzIGFuZCB0aGUgb3JpZ2luYWwKPiBpbnRlbnQgYXBwZWFyZWQgdG8gYmUgb25seSBmb3IgImZp
eGVkLXBhcnRpdGlvbnMiLgo+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJv
YmhAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJv
Lm9yZz4gIyBGb3IgTU1DCgpLaW5kIHJlZ2FyZHMKVWZmZQoKPiAtLS0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbW1jL21tYy1jYXJkLnlhbWwgICAgICAgICAgfCAyMCArKysrLS0tLS0tLS0K
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQueWFtbCAgICAgfCAg
MiArLQo+ICAuLi4vbXRkL3BhcnRpdGlvbnMvYXJtLGFybS1maXJtd2FyZS1zdWl0ZS55YW1sICAg
ICB8ICAyIC0tCj4gIC4uLi9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55
YW1sICAgIHwgIDIgLS0KPiAgLi4uL3BhcnRpdGlvbnMvYnJjbSxiY205NDd4eC1jZmUtcGFydGl0
aW9ucy55YW1sICAgfCAgMiAtLQo+ICAuLi4vbXRkL3BhcnRpdGlvbnMvbGlua3N5cyxucy1wYXJ0
aXRpb25zLnlhbWwgICAgICB8ICAyIC0tCj4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9w
YXJ0aXRpb25zLnlhbWwgICAgICAgIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZGF2aW5jaS1uYW5kLnlhbWwgICB8ICA0ICsrLQo+
ICA4IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLWNh
cmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLWNhcmQu
eWFtbAo+IGluZGV4IDFkOTFkNDI3MmRlMC4uYTYxZDZjOTZkZjc1IDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLWNhcmQueWFtbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvbW1jLWNhcmQueWFtbAo+IEBA
IC0zMiwyMSArMzIsMTMgQEAgcHJvcGVydGllczoKPgo+ICBwYXR0ZXJuUHJvcGVydGllczoKPiAg
ICAiXnBhcnRpdGlvbnMoLWJvb3RbMTJdfC1ncFsxNF0pPyQiOgo+IC0gICAgJHJlZjogL3NjaGVt
YXMvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1sCj4gKyAgICB0eXBlOiBvYmplY3QKPiAr
ICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4KPiAtICAgIHBhdHRlcm5Qcm9wZXJ0aWVz
Ogo+IC0gICAgICAiXnBhcnRpdGlvbkBbMC05YS1mXSskIjoKPiAtICAgICAgICAkcmVmOiAvc2No
ZW1hcy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+IC0KPiAtICAgICAgICBwcm9wZXJ0
aWVzOgo+IC0gICAgICAgICAgcmVnOgo+IC0gICAgICAgICAgICBkZXNjcmlwdGlvbjogTXVzdCBi
ZSBtdWx0aXBsZSBvZiA1MTIgYXMgaXQncyBjb252ZXJ0ZWQKPiAtICAgICAgICAgICAgICBpbnRl
cm5hbGx5IGZyb20gYnl0ZXMgdG8gU0VDVE9SX1NJWkUgKDUxMiBieXRlcykKPiAtCj4gLSAgICAg
ICAgcmVxdWlyZWQ6Cj4gLSAgICAgICAgICAtIHJlZwo+IC0KPiAtICAgICAgICB1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlCj4gKyAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICBjb21wYXRpYmxl
Ogo+ICsgICAgICAgIGNvbnRhaW5zOgo+ICsgICAgICAgICAgY29uc3Q6IGZpeGVkLXBhcnRpdGlv
bnMKPgo+ICByZXF1aXJlZDoKPiAgICAtIGNvbXBhdGlibGUKPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9tdGQueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXRkLnlhbWwKPiBpbmRleCBiYmI1NjIxNmE0ZTIuLmU1
NmRiYTgzZjAwYSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL210ZC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9tdGQueWFtbAo+IEBAIC0zMCw3ICszMCw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICBkZXBy
ZWNhdGVkOiB0cnVlCj4KPiAgICBwYXJ0aXRpb25zOgo+IC0gICAgJHJlZjogL3NjaGVtYXMvbXRk
L3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1sCj4gKyAgICB0eXBlOiBvYmplY3QKPgo+ICAgICAg
cmVxdWlyZWQ6Cj4gICAgICAgIC0gY29tcGF0aWJsZQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYXJtLGFybS1maXJtd2FyZS1z
dWl0ZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2FybSxhcm0tZmlybXdhcmUtc3VpdGUueWFtbAo+IGluZGV4IDk3NjE4ODQ3ZWUzNS4uNzZj
ODgwMjdiNmQyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9hcm0sYXJtLWZpcm13YXJlLXN1aXRlLnlhbWwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYXJtLGFybS1maXJt
d2FyZS1zdWl0ZS55YW1sCj4gQEAgLTksOCArOSw2IEBAIHRpdGxlOiBBUk0gRmlybXdhcmUgU3Vp
dGUgKEFGUykgUGFydGl0aW9ucwo+ICBtYWludGFpbmVyczoKPiAgICAtIExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPgo+IC1zZWxlY3Q6IGZhbHNlCj4gLQo+ICBkZXNj
cmlwdGlvbjogfAo+ICAgIFRoZSBBUk0gRmlybXdhcmUgU3VpdGUgaXMgYSBmbGFzaCBwYXJ0aXRp
b25pbmcgc3lzdGVtIGZvdW5kIG9uIHRoZQo+ICAgIEFSTSByZWZlcmVuY2UgZGVzaWduczogSW50
ZWdyYXRvciBBUCwgSW50ZWdyYXRvciBDUCwgVmVyc2F0aWxlIEFCLAo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200
OTA4LXBhcnRpdGlvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCj4gaW5kZXggOTRmMDc0
MmIzNzVjLi4xNTliMzJkMTI4MDMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkwOC1wYXJ0aXRpb25zLnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMv
YnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbAo+IEBAIC0xNyw4ICsxNyw2IEBAIGRlc2NyaXB0
aW9uOiB8Cj4gIG1haW50YWluZXJzOgo+ICAgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+Cj4gLXNlbGVjdDogZmFsc2UKPiAtCj4gIHByb3BlcnRpZXM6Cj4gICAgY29tcGF0
aWJsZToKPiAgICAgIGNvbnN0OiBicmNtLGJjbTQ5MDgtcGFydGl0aW9ucwo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxi
Y205NDd4eC1jZmUtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sYmNtOTQ3eHgtY2ZlLXBhcnRpdGlvbnMueWFtbAo+
IGluZGV4IDkzOWU3YjUwZGIyMi4uMzQ4NGUwNmQ2YmNiIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9icmNtLGJjbTk0N3h4LWNm
ZS1wYXJ0aXRpb25zLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY205NDd4eC1jZmUtcGFydGl0aW9ucy55YW1sCj4gQEAg
LTM1LDggKzM1LDYgQEAgZGVzY3JpcHRpb246IHwKPiAgbWFpbnRhaW5lcnM6Cj4gICAgLSBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4KPiAtc2VsZWN0OiBmYWxzZQo+IC0KPiAg
cHJvcGVydGllczoKPiAgICBjb21wYXRpYmxlOgo+ICAgICAgY29uc3Q6IGJyY20sYmNtOTQ3eHgt
Y2ZlLXBhcnRpdGlvbnMKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL2xpbmtzeXMsbnMtcGFydGl0aW9ucy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2xpbmtzeXMsbnMtcGFy
dGl0aW9ucy55YW1sCj4gaW5kZXggYzVmYTc4ZmY3MTI1Li4wMmVjYjUxZmNlY2UgMTAwNjQ0Cj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2xp
bmtzeXMsbnMtcGFydGl0aW9ucy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2xpbmtzeXMsbnMtcGFydGl0aW9ucy55YW1sCj4gQEAg
LTE4LDggKzE4LDYgQEAgZGVzY3JpcHRpb246IHwKPiAgbWFpbnRhaW5lcnM6Cj4gICAgLSBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4KPiAtc2VsZWN0OiBmYWxzZQo+IC0KPiAg
cHJvcGVydGllczoKPiAgICBjb21wYXRpYmxlOgo+ICAgICAgY29uc3Q6IGxpbmtzeXMsbnMtcGFy
dGl0aW9ucwo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvcGFydGl0aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMueWFtbAo+IGRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDc2MTk5NTA2ZDY5MC4uMDAwMDAwMDAwMDAwCj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMu
eWFtbAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSwzNiArMCwwIEBACj4gLSMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPiAtJVlBTUwgMS4yCj4g
LS0tLQo+IC0kaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9wYXJ0aXRpb25z
L3BhcnRpdGlvbnMueWFtbCMKPiAtJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4gLQo+IC10aXRsZTogUGFydGl0aW9ucwo+IC0KPiAtZGVzY3Jp
cHRpb246IHwKPiAtICBUaGlzIGJpbmRpbmcgaXMgZ2VuZXJpYyBhbmQgZGVzY3JpYmVzIHRoZSBj
b250ZW50IG9mIHRoZSBwYXJ0aXRpb25zIGNvbnRhaW5lcgo+IC0gIG5vZGUuIEFsbCBwYXJ0aXRp
b24gcGFyc2VycyBtdXN0IGJlIHJlZmVyZW5jZWQgaGVyZS4KPiAtCj4gLW1haW50YWluZXJzOgo+
IC0gIC0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAtCj4gLW9u
ZU9mOgo+IC0gIC0gJHJlZjogYXJtLGFybS1maXJtd2FyZS1zdWl0ZS55YW1sCj4gLSAgLSAkcmVm
OiBicmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCj4gLSAgLSAkcmVmOiBicmNtLGJjbTk0N3h4
LWNmZS1wYXJ0aXRpb25zLnlhbWwKPiAtICAtICRyZWY6IGZpeGVkLXBhcnRpdGlvbnMueWFtbAo+
IC0gIC0gJHJlZjogbGlua3N5cyxucy1wYXJ0aXRpb25zLnlhbWwKPiAtICAtICRyZWY6IHFjb20s
c21lbS1wYXJ0LnlhbWwKPiAtICAtICRyZWY6IHJlZGJvb3QtZmlzLnlhbWwKPiAtICAtICRyZWY6
IHRwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMueWFtbAo+IC0KPiAtcHJvcGVydGllczoKPiAt
ICBjb21wYXRpYmxlOiB0cnVlCj4gLQo+IC1wYXR0ZXJuUHJvcGVydGllczoKPiAtICAiXnBhcnRp
dGlvbigtLit8QFswLTlhLWZdKykkIjoKPiAtICAgICRyZWY6IHBhcnRpdGlvbi55YW1sCj4gLQo+
IC1yZXF1aXJlZDoKPiAtICAtIGNvbXBhdGlibGUKPiAtCj4gLXVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC90aSxkYXZpbmNpLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvdGksZGF2aW5jaS1uYW5kLnlhbWwKPiBpbmRleCBlZDI0YjBlYTg2ZTUuLjc2MTli
MTllN2EwNCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3RpLGRhdmluY2ktbmFuZC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC90aSxkYXZpbmNpLW5hbmQueWFtbAo+IEBAIC0yNCw3ICsyNCw5IEBAIHBy
b3BlcnRpZXM6Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IEFFTUlGIGNvbnRyb2wgcmVnaXN0ZXJz
Lgo+Cj4gICAgcGFydGl0aW9uczoKPiAtICAgICRyZWY6IC9zY2hlbWFzL210ZC9wYXJ0aXRpb25z
L3BhcnRpdGlvbnMueWFtbAo+ICsgICAgdHlwZTogb2JqZWN0Cj4gKyAgICByZXF1aXJlZDoKPiAr
ICAgICAgLSBjb21wYXRpYmxlCj4KPiAgICB0aSxkYXZpbmNpLWNoaXBzZWxlY3Q6Cj4gICAgICBk
ZXNjcmlwdGlvbjoKPgo+IC0tCj4gMi41MS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
