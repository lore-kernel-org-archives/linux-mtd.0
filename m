Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E627C7618E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 18:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07wbKNEkb++OQbQjrm64TcOfOr3V0hf6x1HQ5xtigQo=; b=DqBJgFSBgRQ6im
	A8FoHgeomsh77/lVYkzbWX1sAVx73RAxRGFpnydAuTuXSntMuJ25tffQIUbcbd+xI1uwcncrXuU8F
	GUkvk0x9MvpWr+4I74JoyNMdiVAhyM+47dXZJntZB5f1cuPf8Ytij2cnQE7zT6aEhPEJI2axU/rDf
	y2QzBmPO8k0a/uEYMaZthGyKdJwOXsPFtsPgIxdKIjgvLvAQg5OQc8cgu6kS+97pfOEp3s1bKk44P
	XICrpfFwoLN94JfZyxQcpsDXprVG7bbljHaliLP6lJkHtuY8f58kzrbOsxMobRQ9WNKghNsFMR1/Z
	u+K9Oo6sjrQUdrmDh4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peKho-00ACXC-11;
	Mon, 20 Mar 2023 18:58:04 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peKhk-00ACW8-2p;
	Mon, 20 Mar 2023 18:58:02 +0000
Received: by mail-qt1-f178.google.com with SMTP id i24so14385733qtm.6;
        Mon, 20 Mar 2023 11:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679338677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zwUgLsZ5jG7jQhXhGz4wwFx1TG5MBwKeAtALm1R53g=;
        b=ckGV33qZi5EXtBwylwaYJHoDu2sKEqNMIeItDT60zsQF92o0r1W+V3nB85qgUaOOTk
         y/2xbp7jVsmCUYJSClyrNbVJIN1GhUjKYcgzcnzT740/NyufoSrBHjunidwItAbMgKGF
         cKapLCU5ZTyrLGm6cjtVDHmOaFIv0JFvjMxAv7S2kT6xYU+QGH0PYb+hE//0tUFfZiPi
         OfdeJMmsOy12Y+RZahVIewTkFePQMYtXmZi4G/VMsIT1xOThzwzmvM1yQNy7kJadMLgj
         TER8JefEwj96k51h12RnMCaGAlvQFZRSPkoSM9oNMk2rHv54xxeDN+y20bTGTEC7H1tb
         N77Q==
X-Gm-Message-State: AO0yUKVFkk0CihVuCOYW4wKEj8DNU1/Of7hmJ9tGa9DWfjuEA5fPDPLB
	P/kI5xDRh8ZPt2CNFeUW/AkbD0R6TCCmoA==
X-Google-Smtp-Source: AK7set/7Mzr5V523JD5R5qaUpM/nBuzidsME9lF/BdVix5L6IMijuwQRf/J0CQ/+MNhWwxjKJucfEA==
X-Received: by 2002:a05:622a:1053:b0:3de:4819:2449 with SMTP id f19-20020a05622a105300b003de48192449mr344695qte.38.1679338676985;
        Mon, 20 Mar 2023 11:57:56 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id g17-20020ac84811000000b003e1cf472b17sm2051883qtq.97.2023.03.20.11.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:57:56 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54184571389so241102187b3.4;
        Mon, 20 Mar 2023 11:57:55 -0700 (PDT)
X-Received: by 2002:a81:e508:0:b0:544:5fc7:f01f with SMTP id
 s8-20020a81e508000000b005445fc7f01fmr10128001ywl.4.1679338675613; Mon, 20 Mar
 2023 11:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
In-Reply-To: <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Mar 2023 19:57:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
Message-ID: <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_115800_917616_93302886 
X-CRM114-Status: GOOD (  25.79  )
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

SGkgVHVkb3IsCgpPbiBNb24sIE1hciAyMCwgMjAyMyBhdCA2OjA04oCvUE0gVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPiBWaWduZXNoIHVzZWQgdG8gcmV2
aWV3IENGSSBjb2RlLCBtYXliZSBoZSBjYW4gaW50ZXJ2ZW5lLiBJJ3ZlIG5ldmVyCj4gd29ya2Vk
IHdpdGggQ0ZJLCBidXQgSSBjYW4gdHJ5IHRvIGhlbHAuIEknbGwgbmVlZCBtb3JlIGRlYnVnIGRh
dGEgdGhvdWdoLgo+Cj4gT24gMy8yMC8yMyAxNjo0MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Ogo+ID4gQWRkIGEgZGV2aWNlIG5vZGUgZm9yIHRoZSBTcGFuc2lvbiBTMjlHTDUxMk4gTk9SIEZM
QVNIIG9uIHRoZSBNYXJ6ZW4KPiA+IGRldmVsb3BtZW50IGJvYXJkLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPiAt
LS0KPiA+IEFsdGhvdWdoIHRoZSBTMjlHTDUxMk4gaXMgYSBDRkkgRkxBU0gsIHVzaW5nICJjZmkt
Zmxhc2giIGluc3RlYWQgb2YKPiA+ICJtdGQtcm9tIiBkb2VzIG5vdCB3b3JrOgo+ID4gICAxLiBQ
cm9iaW5nIGZhaWxzIHdpdGggInBoeXNtYXAtZmxhc2ggMC5mbGFzaDogbWFwX3Byb2JlIGZhaWxl
ZCIsCj4KPiBJIHdvdWxkIGZpcnN0IHRyeSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgcHJvYmUgZmFp
bHMuCgpXaXRoIGRlYnVnIGNvZGUgYWRkZWQsIEkgc2F3IHRoYXQgY2ZpX3Byb2JlX2NoaXAoKSBm
YWlscyBiZWNhdXNlCmNmaV9xcnlfbW9kZV9vbigpIHJldHVybnMgemVyby4gIFByaW50aW5nIGFj
dHVhbCB2cy4gZXhwZWN0ZWQgdmFsdWVzCmluIG1hcF93b3JkX2VxdWFsKCkgc2hvd2VkIHRoYXQg
bm90aGluZyB3YXMgcmVhZCAoYWxsIDB4ZmYsIElJUkMpLgoKRm9yY2luZyBiaWctZW5kaWFuIChD
T05GSUdfTVREX0NGSV9CRV9CWVRFX1NXQVA9eSkgZGlkbid0CmhlbHAsIGFuZCBjYXVzZWQgYW4g
dW5hbGlnbmVkIGFjY2VzcyBjcmFzaC4KCj4gPiAgIDIuIFRoZSBrZXJuZWwgY3Jhc2hlcyBsYXRl
ciBpbiBhIHNwZWN0YWN1bGFyIHdheSwgY2ZyLiB0aGUgbG9ncyBiZWxvdy4KPiA+Cj4gPiBVLUJv
b3QgZmxpbmZvIHNheXM6Cj4gPgo+ID4gICAgIEJhbmsgIyAxOiBDRkkgY29uZm9ybWFudCBmbGFz
aCAoMTYgeCAxNikgIFNpemU6IDY0IE1CIGluIDUxMiBTZWN0b3JzCj4gPiAgICAgICBBTUQgU3Rh
bmRhcmQgY29tbWFuZCBzZXQsIE1hbnVmYWN0dXJlciBJRDogMHgwMSwgRGV2aWNlIElEOiAweDIy
N0UKPiA+ICAgICAgIEVyYXNlIHRpbWVvdXQ6IDQwOTYgbXMsIHdyaXRlIHRpbWVvdXQ6IDEgbXMK
PiA+ICAgICAgIEJ1ZmZlciB3cml0ZSB0aW1lb3V0OiAzIG1zLCBidWZmZXIgc2l6ZTogNjQgYnl0
ZXMKPiA+ICAgICAgIFNlY3RvciBTdGFydCBBZGRyZXNzZXM6Cj4gPiAgICAgICAwMDAwMDAwMCAg
IFJPICAgMDAwMjAwMDAgICAgICAgIDAwMDQwMDAwICAgUk8gICAwMDA2MDAwMCAgIFJPICAgMDAw
ODAwMDAKPiA+ICAgICAgIDAwMEEwMDAwICAgICAgICAwMDBDMDAwMCAgICAgICAgMDAwRTAwMDAg
ICAgICAgIDAwMTAwMDAwICAgICAgICAwMDEyMDAwMAo+ID4gICAgICAgMDAxNDAwMDAgICAgICAg
IDAwMTYwMDAwICAgICAgICAwMDE4MDAwMCAgICAgICAgMDAxQTAwMDAgICAgICAgIDAwMUMwMDAw
Cj4gPiAgICAgICAuLi4KPiA+ICAgICAgIDAzRkMwMDAwICAgICAgICAwM0ZFMDAwMAo+ID4KPiA+
ICAgICBCYW5rICMgMjogbWlzc2luZyBvciB1bmtub3duIEZMQVNIIHR5cGUKPgo+IERvIHlvdSB1
c2UgImNmaS1mbGFzaCIgY29tcGF0aWJsZSBpbiB1LWJvb3QgYW5kIGl0IHdvcmtzIGp1c3QgZmlu
ZT8gSWYKPiB5ZXMsIEkgd291bGQgdHJ5IHRvIHVuZGVyc3RhbmQgd2hhdCBhcmUgdGhlIGRpZmZl
cmVuY2VzIGJldHdlZW4gdGhlCj4gcHJvYmUgcGF0aHMgZnJvbSB1LWJvb3QgYW5kIGxpbnV4LiBJ
IGtub3cgaXQgZG9lc24ndCBoZWxwIG11Y2gsIGJ1dCB3ZQo+IHNob3VsZCBzdGFydCBmcm9tIHNv
bWV3aGVyZSBpZiB3ZSBkb24ndCBoYXZlIGFueSBvdGhlciBmZWVkYmFjay4KCkl0J3MgYSBiaXQg
bW9yZSBjb21wbGljYXRlZC4uLiBUaGlzIGlzIGEgcmF0aGVyIG9sZCBib2FyZCwgYW5kIEkgb25s
eQpoYXZlIHRoZSBvcmlnaW5hbGx5IGluc3RhbGxlZCBVLUJvb3QgMjAxMS4wMywgYW5kIG5vIFUt
Qm9vdCBzb3VyY2VzLgoKVS1Cb290IGNhbiB3cml0ZSB0byB0aGUgRkxBU0gsIGFzICJzYXZlZW52
IiB3b3JrcyAoZW52IGF0ICAweDQwMDAwKS4KClRoYW5rcyBmb3IgeW91ciBoZWxwIQoKR3J7b2V0
amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
