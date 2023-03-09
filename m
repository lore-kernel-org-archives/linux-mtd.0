Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B09C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 13:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTksYenKLoMqErEZLmz9bTdNekpciYQPfMY3pn9WKO4=; b=xPaoK93DLm5SQ7
	kDRpsLErsXhzincYDLwU5SeFbva+smf2R7xwvWBYBX7Ds0/+SVBIrw25Bci5YZX8uLEvP0ay2QCcU
	3U1UeORZg6Gb/tDKiyjbYPfq7uuOcN8vg0b/TuHED3x0rJ1Gix3seJ3uG4P3A1uKUVENSomYGtVb0
	QlxgUG5dbqJ6+BcNwiiG27FfgV7LYGCQDMoZKZzzhnnM9p6mZIf//ZrauwEzngsNz6pqG9Y7wh41i
	r852MkKreMKJT3m4tnOv3SrLe+w0J1o4rRb2xPrs9dTLLCsbAoZ5lwf0VGbmiASo1dh7mZEPxGgJR
	3LT9rqwsn3dwCNLkydvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGFP-00A4nO-3d; Thu, 09 Mar 2023 13:23:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGFC-00A4hE-GT
	for linux-mtd@lists.infradead.org; Thu, 09 Mar 2023 13:23:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e13so1832262wro.10
        for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2023 05:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678368218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=942wM/IK6k2Dwoory8Emo2hV8DfdYZAPSidgTQCm4wE=;
        b=eWWTMALy4suZwwDa3CiPTxX7jS/owgLuoKidvA9g84R007ZHPpLoeelFVkKnUXEzIY
         M6ivS8IEM6uWqlaJutzY/qUpGFe82x2hS1PdsPyZUY4Kl4nP3Eu+XJrGyE9Dd3x5rCpH
         tRZmy5QphrtFmIp3ptFVTP0L7YK3aV2JoOTltx+WNkyUvjuSuJoAnPo7dx3YklYklx/M
         vGsit44Dck8nGkC7Hodvy5sCsWto77EIfqWVRIYoouoC409jI9RaVJ+Xf+d//zz/0xQ8
         kaIzZG2TdU77sqyoYMfvy0bENAN/Khv+F51VeVFQ/5dDUh0XC7LhyIL4IBuEHfyIIlkS
         xFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678368218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=942wM/IK6k2Dwoory8Emo2hV8DfdYZAPSidgTQCm4wE=;
        b=gwvqlbE+04/fNH3ptyUauxDq93l3Q//aKorF0sCYXa1PEd8RB5if1DxfqtEjW5ASIL
         wVcUEIJPTgEy6awnSv9DWd5SafrFuFjvoM1WLqlPWgol1mddnU6opC6HlWXg0nzlx7e4
         feHhfb/utGi/TVymjlXUcIWzNICGs6yr1+wxZUPC4E5pU6hh3hUOAckYyo/oJBMpZ8QO
         iUx/5xEhb35ppYW+ZeiiuKiTcJZcz0W/Ta34yw3N0lIMc3Uwb8nUDAiE16VY/RWGwJW8
         Haam2sxmWmXvHzG8KaYgiGkXT/r2f7bMOVkbH9aI6LJO4yEUIdQqR4fkKxR8b32FZQjn
         JmQg==
X-Gm-Message-State: AO0yUKXzXajRC4I/Lzh1/HvTEHNEWzlGJ8T5qZcz1DAOrjZ5U+CtrG9q
	MLpVMeJPB9vVeei+fOGC3Jn2ng==
X-Google-Smtp-Source: AK7set8xbxd+8x3ZEeltB8xt0Oebfe4Cq+8VixRnocCt+sKbry4JqRFsPtCl27Prilh6ChdbwMDTYA==
X-Received: by 2002:adf:df8b:0:b0:2c7:bfe:4f60 with SMTP id z11-20020adfdf8b000000b002c70bfe4f60mr15866271wrl.15.1678368218505;
        Thu, 09 Mar 2023 05:23:38 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b002c55ec7f661sm18036958wrx.5.2023.03.09.05.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 05:23:38 -0800 (PST)
Message-ID: <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
Date: Thu, 9 Mar 2023 15:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 Claudiu.Beznea@microchip.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 joel@jms.id.au, andrew@aj.id.au, kdasu.kdev@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <03a9f117316ab81f1b5a18100f771e65@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_052342_604418_B7478301 
X-CRM114-Status: GOOD (  34.26  )
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

CgpPbiAwOS4wMy4yMDIzIDE0OjM1LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMDMt
MDkgMTM6MDksIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gMy85LzIzIDEwOjU2LCBNaWNo
YWVsIFdhbGxlIHdyb3RlOgo+Pj4gQW0gMjAyMy0wMy0wOSAxMTo0Miwgc2NocmllYiBUdWRvciBB
bWJhcnVzOgo+Pj4+IE9uIDA5LjAzLjIwMjMgMTA6MzgsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+
Pj4+PiBJbiBhbiBpZGVhbCB3b3JsZCwgd2hlcmUgYm90aCB0aGUgY29udHJvbGxlciBhbmQgdGhl
IGRldmljZSB0YWxrIAo+Pj4+Pj4gYWJvdXQKPj4+Pj4+IGR1bW15IG51bWJlciBvZiBjeWNsZXMs
IEkgd291bGQgYWdyZWUgd2l0aCB5b3UsIGJ1c3dpZHRoIGFuZCBkdHIgCj4+Pj4+PiBzaG91bGQK
Pj4+Pj4+IG5vdCBiZSByZWxldmFudCBmb3IgdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMuIEJ1
dCBpdCBzZWVtcyB0aGF0IAo+Pj4+Pj4gdGhlcmUKPj4+Pj4+IGFyZSBvbGQgY29udHJvbGxlcnMg
KGUuZy4gc3BpLWhpc2ktc2ZjLXYzeHguYywgc3BpLW10NjV4eC5jLAo+Pj4+Pj4gc3BpLW14aWMu
YykKPj4+Pj4+IHRoYXQgc3VwcG9ydCBidXN3aWR0aHMgPiAxIGFuZCB3b3JrIG9ubHkgd2l0aCBk
dW1teSBuYnl0ZXMsIHRoZXkgYXJlCj4+Pj4+PiBub3QKPj4+Pj4+IGNhcGFibGUgb2Ygc3BlY2lm
eWluZyBhIHNtYWxsZXIgZ3JhbnVsYXJpdHkgKG5jeWNsZXMpLiBUaHVzIHRoZSBvbGRlcgo+Pj4+
Pj4gY29udHJvbGxlcnMgd291bGQgaGF2ZSB0byBjb252ZXJ0IHRoZSBkdW1teSBuY3ljbGVzIHRv
IGR1bW15IG5ieXRlcy4KPj4+Pj4+IFNpbmNlIG1peGVkIHRyYW5zZmVyIG1vZGVzIGFyZSBhIHRo
aW5nIChzZWUgamVzZDI1MSwgaXQgdGFsa3MgYWJvdXQKPj4+Pj4+IDRTLTRELTREKSwgd2hlcmUg
c2luZ2xlIHRyYW5zZmVyIG1vZGUgKFMpIGNhbiBiZSBtaXhlZCB3aXRoIGRvdWJsZQo+Pj4+Pj4g
dHJhbnNmZXIgbW9kZSAoRCkgZm9yIGEgY29tbWFuZCwgdGhlIGNvbnRyb2xsZXIgd291bGQgaGF2
ZSB0byAKPj4+Pj4+IGd1ZXNzIHRoZQo+Pj4+Pj4gYnVzd2lkdGggYW5kIGR0ciBvZiB0aGUgZHVt
bXkuIFNoYWxsIHRoZXkgcmVwbGljYXRlIHRoZSBidXN3aWR0aCBhbmQKPj4+Pj4+IGR0cgo+Pj4+
Pj4gb2YgdGhlIGFkZHJlc3Mgb3Igb2YgdGhlIGRhdGE/IFRoZXJlJ3Mgbm8gcnVsZSBmb3IgdGhh
dC4KPj4+Pj4KPj4+Pj4gQnV0IGluIHRoZSBlbmQgdGhhdCBkb2Vzbid0IG1hdHRlciBiZWNhdXNl
IHRoZXkgYXJlIGp1c3QgZHVtbXkgY2xvY2sKPj4+Pj4gY3ljbGVzIGFuZCB0aGUgbW9kZSB3aWxs
IG9ubHkgYWZmZWN0IHRoZSBkYXRhL2FkZHJlc3MvY29tbWFuZC4KPj4+Pj4gVGhlcmVmb3JlLAo+
Pj4+PiB0aGUgY29udHJvbGxlciBpcyBmcmVlIHRvIGNob29zZSB0aGUgbW9kZSB0aGF0IHN1aXRz
IGl0IGJlc3QuCj4+Pj4+IMKgPiBCdXQgdGhhdCBiZWdzIHRoZSBxdWVzdGlvbiwgaXMgbmN5Y2xl
cyBpbiByZWdhcmQgdG8gRFRSIG9yIFNEUj8KPj4+Pj4gVGhhdCBpcywKPj4+Pj4gYXJlIHlvdSBj
b3VudGluZyBqdXN0IG9uZSB0eXBlIG9mIGVkZ2VzIG9yIGJvdGggdGhlIGZhbGxpbmcgYW5kIHJp
c2luZwo+Pj4+PiBlZGdlcy4gVGhlIHNtYWxsZXN0IGdyYW51bGFyaXR5IHdvdWxkIGJlIG5jeWNs
ZXMgaW4gcmVnYXJkIG9mIERUUi4gVG8KPj4+Pj4gbWUsCj4+Pj4+IGl0J3Mgbm90IG9idmlvdXMg
d2hhdCB0aGUgU0VNUEVSIE5hbm8gRmxhc2ggWzFdIHVzZXMuIEknZCBzYXkgd2UgCj4+Pj4+IGNo
b29zZQo+Pj4+PiB0aGUgc21hbGxlc3QgZ3JhbnVsYXJ0eSBpbiBzcGktbWVtIHRvIGJlIGZ1dHVy
ZSBwcm9vZiBhbmQgbWF5YmUgCj4+Pj4+IHByb3ZpZGUKPj4+Pj4gc29tZSBzcGktbWVtIGhlbHBl
ciB0byBoZWxwIHNldHRpbmcgdGhlIGN5Y2xlcyBmb3IgU0RSL0RUUi4gQXMgYW4KPj4+Pj4gZXhh
bXBsZSwKPj4+Pj4gaWYgeW91IHdhbnQgdG8gd2FpdCA0IGN5Y2xlcyBpbiBTRFIgeW91J2QgaGF2
ZSBuY3ljbGVzPTggaW4gc3BpLW1lbS4KPj4+Pj4KPj4+Pgo+Pj4+IE5vLCB3ZSBjYW4ndCBpbnZl
bnQgb3VyIG93biBtZWFzdXJpbmcgdW5pdHMuIFdlIGhhdmUgY3ljbGVzIGFuZCBoYWxmCj4+Pj4g
Y3ljbGVzIChyZWdhcmRsZXNzIG9mIHRoZSB0cmFuc2ZlciBtb2RlIHVzZWQgKFNUUiwgRFRSKSku
Cj4+Pgo+Pj4gVGhhdCBpcyBiYXNpY2FsbHkgd2hhdCBJIHdhcyBzYXlpbmcsIGp1c3QgdXNpbmcg
dGhlIGNvcnJlY3QgdGVybS4KPj4+IE9rLiBTbyB3ZSBkb24ndCBuZWVkIHRoZSBkdHIgcHJvcGVy
dHksIHJpZ2h0PyBJJ20gc3RpbGwgbm90IHN1cmUsCj4+Cj4+IFdlIGRvLgo+Pgo+PiBBcyBvZiBu
b3cgeW91IGNhbid0IHNwZWNpZnkgMjAgZHVtbXkgY3ljbGVzIGZvciBSRUFESUQgaW4gOEQtOEQt
OEQgbW9kZQo+PiBiZWNhdXNlIGFsbCB0aGUgbGF5ZXJzIHRyZWF0cyBkdW1teSBhcyBieXRlcywg
d2hlcmVhcyB0aGV5IHNob3VsZCB0cmVhdAo+PiBpdCBhcyBjeWNsZXMuIE9uZSBkdW1teSBieXRl
IGluIDhELThELThEIG1lYW5zIDE2IGR1bW15IGN5Y2xlcy4gMjAgZHVtbXkKPj4gY3ljbGVzIGlu
IDhELThELThEIG1lYW5zIG9uZSBieXRlIGFuZCBhIHF1YXJ0ZXI/IFRoaXMgaXMgYSBub24tc2Vu
c2UuCj4gCj4gQWdyZWVkLgo+IAo+PiBBcyB0aGUgY29kZSBpcyBub3csIFNQSSBOQU5EIHVzZXMg
ZHVtbXkgY3ljbGVzIHRoYXQgYXJlIG11bHRpcGxlIG9mIDguCj4+IFNQSSBOT1IgcmVxdWlyZXMg
YSB2YXJpYWJsZSBudW1iZXIgb2YgZHVtbXkgY3ljbGVzLCB0aGVyZSdzIG5vCj4+IHJlc3RyaWN0
aW9ucy4gSW4gU1BJIE5PUiB3ZSBnZXQgZnJvbSBTRkRQIG9yIGRhdGFzaGVldHMgdGhlIG51bWJl
ciBvZgo+PiBkdW1teSBjeWNsZXMsIGFuZCBpbiB0aGUgY29kZSB3ZSBjb252ZXJ0IHRoZW0gdG8g
ZHVtbXkgbmJ5dGVzLiBUaGVuIHdoZW4KPj4gd2UgZ2V0IGF0IHRoZSBjb250cm9sbGVyIHNpZGUs
IHRoZSBtYWpvcml0eSBvZiB0aGUgY29udHJvbGxlcnMgdW5kbyB0aGUKPj4gb3BlcmF0aW9uLCB0
aGV5IHRha2UgdGhlIGR1bW15IG5ieXRlcyBhbmQgY29udmVydCB0aGVtIHRvIGR1bW15IG5jeWNs
ZXMuCj4+IElzbid0IGJldHRlciB0byB1c2UgZHVtbXkgbmN5Y2xlcyBmcm9tIHRoZSBiZWdpbm5p
bmc/Cj4gCj4gWWVzLCBidXQgbm93IHdlIHNob3VsZCBkZWZpbmUgd2hhdCAqb25lKiBjeWNsZSBp
cy4gQW5kIHRoYXQgaXQgaXMgZGVmaW5lZAo+IHJlZ2FyZGxlc3Mgb2YgdGhlIG1vZGUsIGJlY2F1
c2UgdGhlIG1vZGUgb25seSBhZmZlY3RzIHRoZSBJTyBsaW5lcy4gQnV0Cj4gYSBjbG9jayBjeWNs
ZSByZWZlcnMgdG8gdGhlIGNsb2NrIGxpbmUuIFtjb21pbmcgYmFjayB0byBoZXJlXSBBbmQgYXMg
eW91Cj4gc2FpZCBvbmUgY3ljbGUgaXMgb25lIGZ1bGwgY2xvY2sgY3ljbGUsIGl0IGlzIGFsc28g
aW5kZXBlbmRlbnQgb2YgdGhlIGR0cgo+IHNldHRpbmcuCj4gCj4+IFRoZSBjb250cm9sbGVycyB0
aGF0IGNhbiB0YWxrIGluIGR1bW15IG5jeWNsZXMgZG9uJ3QgbmVlZCB0aGUKPj4gZHVtbXkue2J1
c3dpZHRoLCBkdHJ9IGZpZWxkcy4KPj4KPj4gVGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuJ3QgdGFs
ayBpbiBkdW1teSBjeWNsZXMsIGJ1dCBvbmx5IG9uIGEgImJ5dGUiCj4+IGJvdW5kYXJ5IG5lZWQg
Ym90aCBidXN3aWR0aCBhbmQgZHRyIGZpZWxkcy4gQXNzdW1lIGEgZmxhc2ggbmVlZHMgMzIKPj4g
ZHVtbXkgY3ljbGVzIGZvciBhbiBvcCBvbiA4RC04RC04RCBtb2RlLiBJZiB0aGUgY29udHJvbGxl
ciBkb2VzIG5vdCBoYXZlCj4+IHRoZSBidXN3aWR0aCBhbmQgZHRyIGluZm8sIGl0IGNhbid0IGNv
bnZlcnQgdGhlIGR1bW15IG5jeWNsZXMgdG8gbmJ5dGVzLgo+PiBJZiBoZSBrbm93cyBvbmx5IHRo
YXQgYnVzd2lkdGggaXMgOCwgaXQgd2lsbCBjb252ZXJ0IG5jeWNsZXMgdG8gNCBieXRlcy4KPj4g
SWYgZHRyIGlzIGFsc28gc3BlY2lmaWVkIGl0IGNvbnZlcnRzIG5jeWNsZXMgdG8gMiBieXRlcy4K
PiAKPiBObyB0aGV5IGRvbid0IG5lZWQgaXQuIExldHMgdGFrZSB5b3VyIHNlbXBlciBmbGFzaCBh
bmQgYXNzdW1lIGl0IG5lZWRzCj4gMTIgbGF0ZW5jeSBjeWNsZXMuIFNQSS1OT1Igd2lsbCBzZXQg
bmN5Y2xlcyB0byAxMiAqcmVnYXJkbGVzcyBvZiB0aGUgbW9kZQo+IG9yIGR0ciBzZXR0aW5nKi4g
VGhlIGNvbnRyb2xsZXIgdGhlbiBrbm93cyB3ZSBuZWVkIDEyIGNsb2NrIGN5Y2xlcy4gSXQgaGFz
Cj4gdGhlbiB0byBmaWd1cmUgb3V0IGhvdyB0aGF0IGNhbiBiZSBhY2hpZXZlZC4gRS5nLiBpZiBp
dCBjYW4gb25seSBkbyB0aGUKPiAib2xkIiBieXRlIHByb2dyYW1taW5nIGFuZCBpcyBpbiBxdWFk
IG1vZGUsIGdvb2QgZm9yIGl0LiBJdCB3aWxsIHNlbmQgNgo+IGR1bW15IGJ5dGVzLCB3aGljaCB3
aWxsIHJlc3VsdCBpbiAxMiBkdW1teSBjbG9jayBjeWNsZXMsIGJlY2F1c2UgMSBieXRlCj4gdGFr
ZXMgdHdvIGNsb2NrIGN5Y2xlcyBpbiBxdWFkIFNEUiBtb2RlLiBJZiBpdHMgaW4gb2N0YWwgbW9k
ZSwgc2VuZCAxMgo+IGJ5dGVzLiBJZiBpdHMgaW4gZHVhbCBtb2RlLCBzZW5kIDMgYnl0ZXMuIE9i
aW91c2x5LCBpdCBjYW5ub3QgYmUgaW4KPiBzaW5nbGUgYml0IG1vZGUsIGJlY2F1c2UgaXQgY2Fu
bm90IHNlbmQgMS41IGJ5dGVzLi4KPiAKCllvdSBtaXNzIHRoZSBmYWN0IHRoYXQgeW91IGNhbiBo
YXZlIDEtMS00LiBXaGF0IGJ1c3dpZHRoIGRvIHlvdSB1c2UgZm9yIApkdW1teSwgdGhlIGFkZHJl
c3MgYnVzd2lkdGggb3IgdGhlIGRhdGEgYnVzd2lkdGg/CgpXaGF0IGhhcHBlbnMgaWYgY3Jhenkg
cHJvdG9jb2xzIGxpa2UgMVMtMVMtOEQgYXBwZWFyPyBXaGF0IGJ1c3dpZHRoIGFuZCAKdHJhbnNm
ZXIgbW9kZSBhcmUgeW91IGdvaW5nIHRvIHVzZSBmb3IgZHVtbXk/CgpBbmQgcGxlYXNlIGRvbid0
IHRlbGwgbWUgdGhhdCAid2UncmUgZ29pbmcgdG8gYXNzdW1lIHRoYXQgZHVtbXkuYnVzd2lkdGgg
Cj0gYWRkcmVzcy5idXN3aWR0aCBiZWNhdXNlIHRoYXQncyB3aGF0IHdlIGN1cnJlbnRseSBkbyBp
biBTUEkgTk9SIiwgCmJlY2F1c2UgSSdtIG5vdCBjb252aW5jZWQgdGhhdCB0aGUgYXNzdW1wdGlv
biBpcyBjb3JyZWN0LgoKPiBJZiBpdCdzIGZyZWVseSBwcm9ncmFtbWFibGUsIGl0IHdpbGwganVz
dCB0ZWxsIHRoZSBoYXJkd2FyZSB0byBpbnNlcnQKPiAxMiBkdW1teSBjbG9jayBjeWNsZXMuCj4g
Cj4+PiB3aGF0IHRoZSBzZW1wZXIgbmFubyBmbGFzaCB1c2VzLiBIYWxmIGN5Y2xlcz8gQnV0IGFj
Y29yZGluZyB0byB5b3VyCj4+Cj4+IHRoZXJlJ3Mgbm8gc3BpbWVtIGZsYXNoIGNvZGUgdGhhdCB1
c2UgaGFsZiBjeWNsZXMgZm9yIG5vdy4KPiAKPiBBaGgsIEkganVzdCBzYXcgdGhlIHNlbXBlciBm
bGFzaCBkb2Vzbid0IHN1cHBvcnQgRFRSIGF0IGFsbC4gT2sgdGhlbiwKPiBtYWtlcyB0aGluZ3Mg
ZXZlbiBzaW1wbGVyLgo+IAo+Pj4gbmFtaW5nIHlvdSdkIHNwZWNpZnkgZnVsbCBjeWxjZXM/Cj4+
Cj4+IEEgY2xvY2sgcGVyaW9kLCB5ZXMuCj4gCj4gT2suCj4gCj4gLW1pY2hhZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
