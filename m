Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C036C64EC4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTf/bXBZt0/crmXM89U51uGVZZeXov+gw6AxUGhC/jk=; b=hrkHMAKmax04dM
	S98Q9GZyd3qAYz6GA/B4EBrwlP7bkhPMUdsvO58jK49WwbDICTbWwgo74+/zKGITEdvnnN4Wo+0mQ
	0tdm0+Z3fiJC1ip01yjFb8WTmAZWT4q30x5EWhG8aQrQuSG+WqLdLCrGoyPaoAkgEj0YXBo4Zg7WC
	l/v49IpKQb65ExfG/PIItLrRTRosf2j6R/uVMZXDrX8u3YVXXcY+WKB3YDV/kpBOskXHxJcYwa2NW
	2X7NwJ8g6zl16DZXEK7yZm3pTXS2RfrvuyKeV3iCmPytJUIIkkohVd5mZ2LWfuHGACOfEjawW+b5U
	nuLLxAxT+XzfvuAr59ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paF67-009oJy-RT; Thu, 09 Mar 2023 12:10:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paF5t-009oD4-Qr
	for linux-mtd@lists.infradead.org; Thu, 09 Mar 2023 12:10:04 +0000
Received: by mail-ed1-x52d.google.com with SMTP id k10so5946512edk.13
        for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2023 04:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678363796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPxJ2OLIeiVM9zIWTy8Z43PNxojoFyB4wHkVvrTMHsI=;
        b=PCsPuCrSaeWNjmDcMFw4bgKtBYhGYqAj+i0zbY3WNGu0vBzRYo2/guv0/GeJl7bNfu
         3YZW8IM9wnoCeWWtit/jGd9sxzLQUNwy0zQ+E6mmPyFu9Vd5HsFxYTFOxB5W3z8ReLVC
         6OlM8tbxyXovsn7ZLBEGJ1lssXttPBcKEZEEPpjm8A6LdXJ5iHJZwP32FBlWhryra/Sg
         yyS6tl8QVZZkdPFrkE9ixOAd6/MtOQwY8fwNFyqS9qyQwyRq+Td43GQ6G2JXJ6ZDoHR6
         xxon3Itaz79Ep3O1CiueLrpg6250OlViZAS1Opi7Bswchq0FKEn9pw7RxKk7U3McWukW
         UyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678363796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPxJ2OLIeiVM9zIWTy8Z43PNxojoFyB4wHkVvrTMHsI=;
        b=g9klQZe3psPF6LJU1E4EYc6HxRs/MryCjuz1qZ+iphDXyq/RFfnD8HC9ziYzdcDPMJ
         z7G2KXqjSWmKUa8maDF+Stel0hKNUete9Q1cOGMk/TkGx5pAT8GzpVIMx8dvYt9iaD/u
         IY2fml7xaQtR4zP1btW7ITzLJFoWCVNqP9hJ9CxPMCOC4QHxoX5LuArL2M8n+MRfnxIS
         1SegK6K89PkebtHO/CTe99uj7UU8yBgz9qfR6oYWygvUEwAhb9xFFIaMRMrOWDF2C3Rj
         9RInA2qaOerHlhpW2MxadE5zn3U1e+2ZEhGGmmuI/P0eL2K9QQU3UPXPSa1Th1tDEux+
         K6Qw==
X-Gm-Message-State: AO0yUKXKhUK5PcqdRjBfT/3YeOlwWwg0o+q/QywC+vD0g3ZLfmbPgmOr
	RxvlU1fXxxSWbw+PzH8v4CEDfQ==
X-Google-Smtp-Source: AK7set/2yYrC/HUaBoW5bZf02GEocIZbb7pOirl6sFK8E+2O9TV3wFT42mnMHbUGh4cjSro0hUSJIQ==
X-Received: by 2002:a17:907:97d3:b0:883:b1b4:e798 with SMTP id js19-20020a17090797d300b00883b1b4e798mr25054045ejc.10.1678363796112;
        Thu, 09 Mar 2023 04:09:56 -0800 (PST)
Received: from [172.20.10.10] ([213.233.108.171])
        by smtp.gmail.com with ESMTPSA id jy24-20020a170907763800b008d7a8083dffsm8751132ejc.222.2023.03.09.04.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 04:09:55 -0800 (PST)
Message-ID: <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
Date: Thu, 9 Mar 2023 12:09:48 +0000
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
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_041001_925130_A50FB99D 
X-CRM114-Status: GOOD (  20.85  )
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

CgpPbiAzLzkvMjMgMTA6NTYsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMy0wMy0wOSAx
MTo0Miwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+PiBPbiAwOS4wMy4yMDIzIDEwOjM4LCBNaWNo
YWVsIFdhbGxlIHdyb3RlOgo+Pj4+IEluIGFuIGlkZWFsIHdvcmxkLCB3aGVyZSBib3RoIHRoZSBj
b250cm9sbGVyIGFuZCB0aGUgZGV2aWNlIHRhbGsgYWJvdXQKPj4+PiBkdW1teSBudW1iZXIgb2Yg
Y3ljbGVzLCBJIHdvdWxkIGFncmVlIHdpdGggeW91LCBidXN3aWR0aCBhbmQgZHRyIHNob3VsZAo+
Pj4+IG5vdCBiZSByZWxldmFudCBmb3IgdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMuIEJ1dCBp
dCBzZWVtcyB0aGF0IHRoZXJlCj4+Pj4gYXJlIG9sZCBjb250cm9sbGVycyAoZS5nLiBzcGktaGlz
aS1zZmMtdjN4eC5jLCBzcGktbXQ2NXh4LmMsCj4+Pj4gc3BpLW14aWMuYykKPj4+PiB0aGF0IHN1
cHBvcnQgYnVzd2lkdGhzID4gMSBhbmQgd29yayBvbmx5IHdpdGggZHVtbXkgbmJ5dGVzLCB0aGV5
IGFyZQo+Pj4+IG5vdAo+Pj4+IGNhcGFibGUgb2Ygc3BlY2lmeWluZyBhIHNtYWxsZXIgZ3JhbnVs
YXJpdHkgKG5jeWNsZXMpLiBUaHVzIHRoZSBvbGRlcgo+Pj4+IGNvbnRyb2xsZXJzIHdvdWxkIGhh
dmUgdG8gY29udmVydCB0aGUgZHVtbXkgbmN5Y2xlcyB0byBkdW1teSBuYnl0ZXMuCj4+Pj4gU2lu
Y2UgbWl4ZWQgdHJhbnNmZXIgbW9kZXMgYXJlIGEgdGhpbmcgKHNlZSBqZXNkMjUxLCBpdCB0YWxr
cyBhYm91dAo+Pj4+IDRTLTRELTREKSwgd2hlcmUgc2luZ2xlIHRyYW5zZmVyIG1vZGUgKFMpIGNh
biBiZSBtaXhlZCB3aXRoIGRvdWJsZQo+Pj4+IHRyYW5zZmVyIG1vZGUgKEQpIGZvciBhIGNvbW1h
bmQsIHRoZSBjb250cm9sbGVyIHdvdWxkIGhhdmUgdG8gZ3Vlc3MgdGhlCj4+Pj4gYnVzd2lkdGgg
YW5kIGR0ciBvZiB0aGUgZHVtbXkuIFNoYWxsIHRoZXkgcmVwbGljYXRlIHRoZSBidXN3aWR0aCBh
bmQKPj4+PiBkdHIKPj4+PiBvZiB0aGUgYWRkcmVzcyBvciBvZiB0aGUgZGF0YT8gVGhlcmUncyBu
byBydWxlIGZvciB0aGF0Lgo+Pj4KPj4+IEJ1dCBpbiB0aGUgZW5kIHRoYXQgZG9lc24ndCBtYXR0
ZXIgYmVjYXVzZSB0aGV5IGFyZSBqdXN0IGR1bW15IGNsb2NrCj4+PiBjeWNsZXMgYW5kIHRoZSBt
b2RlIHdpbGwgb25seSBhZmZlY3QgdGhlIGRhdGEvYWRkcmVzcy9jb21tYW5kLgo+Pj4gVGhlcmVm
b3JlLAo+Pj4gdGhlIGNvbnRyb2xsZXIgaXMgZnJlZSB0byBjaG9vc2UgdGhlIG1vZGUgdGhhdCBz
dWl0cyBpdCBiZXN0Lgo+Pj4gwqA+IEJ1dCB0aGF0IGJlZ3MgdGhlIHF1ZXN0aW9uLCBpcyBuY3lj
bGVzIGluIHJlZ2FyZCB0byBEVFIgb3IgU0RSPwo+Pj4gVGhhdCBpcywKPj4+IGFyZSB5b3UgY291
bnRpbmcganVzdCBvbmUgdHlwZSBvZiBlZGdlcyBvciBib3RoIHRoZSBmYWxsaW5nIGFuZCByaXNp
bmcKPj4+IGVkZ2VzLiBUaGUgc21hbGxlc3QgZ3JhbnVsYXJpdHkgd291bGQgYmUgbmN5Y2xlcyBp
biByZWdhcmQgb2YgRFRSLiBUbwo+Pj4gbWUsCj4+PiBpdCdzIG5vdCBvYnZpb3VzIHdoYXQgdGhl
IFNFTVBFUiBOYW5vIEZsYXNoIFsxXSB1c2VzLiBJJ2Qgc2F5IHdlIGNob29zZQo+Pj4gdGhlIHNt
YWxsZXN0IGdyYW51bGFydHkgaW4gc3BpLW1lbSB0byBiZSBmdXR1cmUgcHJvb2YgYW5kIG1heWJl
IHByb3ZpZGUKPj4+IHNvbWUgc3BpLW1lbSBoZWxwZXIgdG8gaGVscCBzZXR0aW5nIHRoZSBjeWNs
ZXMgZm9yIFNEUi9EVFIuIEFzIGFuCj4+PiBleGFtcGxlLAo+Pj4gaWYgeW91IHdhbnQgdG8gd2Fp
dCA0IGN5Y2xlcyBpbiBTRFIgeW91J2QgaGF2ZSBuY3ljbGVzPTggaW4gc3BpLW1lbS4KPj4+Cj4+
Cj4+IE5vLCB3ZSBjYW4ndCBpbnZlbnQgb3VyIG93biBtZWFzdXJpbmcgdW5pdHMuIFdlIGhhdmUg
Y3ljbGVzIGFuZCBoYWxmCj4+IGN5Y2xlcyAocmVnYXJkbGVzcyBvZiB0aGUgdHJhbnNmZXIgbW9k
ZSB1c2VkIChTVFIsIERUUikpLgo+IAo+IFRoYXQgaXMgYmFzaWNhbGx5IHdoYXQgSSB3YXMgc2F5
aW5nLCBqdXN0IHVzaW5nIHRoZSBjb3JyZWN0IHRlcm0uCj4gT2suIFNvIHdlIGRvbid0IG5lZWQg
dGhlIGR0ciBwcm9wZXJ0eSwgcmlnaHQ/IEknbSBzdGlsbCBub3Qgc3VyZSwKCldlIGRvLgoKQXMg
b2Ygbm93IHlvdSBjYW4ndCBzcGVjaWZ5IDIwIGR1bW15IGN5Y2xlcyBmb3IgUkVBRElEIGluIDhE
LThELThEIG1vZGUKYmVjYXVzZSBhbGwgdGhlIGxheWVycyB0cmVhdHMgZHVtbXkgYXMgYnl0ZXMs
IHdoZXJlYXMgdGhleSBzaG91bGQgdHJlYXQKaXQgYXMgY3ljbGVzLiBPbmUgZHVtbXkgYnl0ZSBp
biA4RC04RC04RCBtZWFucyAxNiBkdW1teSBjeWNsZXMuIDIwIGR1bW15CmN5Y2xlcyBpbiA4RC04
RC04RCBtZWFucyBvbmUgYnl0ZSBhbmQgYSBxdWFydGVyPyBUaGlzIGlzIGEgbm9uLXNlbnNlLgoK
QXMgdGhlIGNvZGUgaXMgbm93LCBTUEkgTkFORCB1c2VzIGR1bW15IGN5Y2xlcyB0aGF0IGFyZSBt
dWx0aXBsZSBvZiA4LgpTUEkgTk9SIHJlcXVpcmVzIGEgdmFyaWFibGUgbnVtYmVyIG9mIGR1bW15
IGN5Y2xlcywgdGhlcmUncyBubwpyZXN0cmljdGlvbnMuIEluIFNQSSBOT1Igd2UgZ2V0IGZyb20g
U0ZEUCBvciBkYXRhc2hlZXRzIHRoZSBudW1iZXIgb2YKZHVtbXkgY3ljbGVzLCBhbmQgaW4gdGhl
IGNvZGUgd2UgY29udmVydCB0aGVtIHRvIGR1bW15IG5ieXRlcy4gVGhlbiB3aGVuCndlIGdldCBh
dCB0aGUgY29udHJvbGxlciBzaWRlLCB0aGUgbWFqb3JpdHkgb2YgdGhlIGNvbnRyb2xsZXJzIHVu
ZG8gdGhlCm9wZXJhdGlvbiwgdGhleSB0YWtlIHRoZSBkdW1teSBuYnl0ZXMgYW5kIGNvbnZlcnQg
dGhlbSB0byBkdW1teSBuY3ljbGVzLgpJc24ndCBiZXR0ZXIgdG8gdXNlIGR1bW15IG5jeWNsZXMg
ZnJvbSB0aGUgYmVnaW5uaW5nPwoKVGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuIHRhbGsgaW4gZHVt
bXkgbmN5Y2xlcyBkb24ndCBuZWVkIHRoZQpkdW1teS57YnVzd2lkdGgsIGR0cn0gZmllbGRzLgoK
VGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuJ3QgdGFsayBpbiBkdW1teSBjeWNsZXMsIGJ1dCBvbmx5
IG9uIGEgImJ5dGUiCmJvdW5kYXJ5IG5lZWQgYm90aCBidXN3aWR0aCBhbmQgZHRyIGZpZWxkcy4g
QXNzdW1lIGEgZmxhc2ggbmVlZHMgMzIKZHVtbXkgY3ljbGVzIGZvciBhbiBvcCBvbiA4RC04RC04
RCBtb2RlLiBJZiB0aGUgY29udHJvbGxlciBkb2VzIG5vdCBoYXZlCnRoZSBidXN3aWR0aCBhbmQg
ZHRyIGluZm8sIGl0IGNhbid0IGNvbnZlcnQgdGhlIGR1bW15IG5jeWNsZXMgdG8gbmJ5dGVzLgpJ
ZiBoZSBrbm93cyBvbmx5IHRoYXQgYnVzd2lkdGggaXMgOCwgaXQgd2lsbCBjb252ZXJ0IG5jeWNs
ZXMgdG8gNCBieXRlcy4KSWYgZHRyIGlzIGFsc28gc3BlY2lmaWVkIGl0IGNvbnZlcnRzIG5jeWNs
ZXMgdG8gMiBieXRlcy4KCj4gd2hhdCB0aGUgc2VtcGVyIG5hbm8gZmxhc2ggdXNlcy4gSGFsZiBj
eWNsZXM/IEJ1dCBhY2NvcmRpbmcgdG8geW91cgoKdGhlcmUncyBubyBzcGltZW0gZmxhc2ggY29k
ZSB0aGF0IHVzZSBoYWxmIGN5Y2xlcyBmb3Igbm93LgoKPiBuYW1pbmcgeW91J2Qgc3BlY2lmeSBm
dWxsIGN5bGNlcz8KCkEgY2xvY2sgcGVyaW9kLCB5ZXMuCgpIb3BlIGl0IGhlbHBzLgp0YQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
