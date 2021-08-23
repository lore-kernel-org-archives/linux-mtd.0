Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DF8C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 18:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE444613D0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 18:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE444613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6UV7b1Gqa5z5B6rciJH+bdXDpa1PMVhujXw3sBal1Fg=; b=2q4qJc4kSG5HEfIIVcGmEQZhyU
	kl4/YFu6na83myUCz7FEruHz1OsLnYRSW2X4PGYWL5zdM8Tj6B+gpq7T9cJxLSxWlXS6yHlhyUZP6
	c6WdNqKw+HvFtdU+7dhmepqrTgkQk/LPZ9L9Yuu4r0DChixhpJbMlUmyqzTtoTSwsAMHy0f/b2SCd
	LEfmKucQiNe+4AgOXjcRrgcS08pxQpi8X0/VBa7Pab7kMP1WsR/9ul+TfewN4gLygrh/+RdhCTJZw
	YOURvT56P36p0JbYKFYJvwGz6jDvTX5So9X4/+romAbi2m/DxrSVHXHzzp2Klg84cYhBGdDx7uJuW
	mPUWGHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIF5w-000Nju-Az; Mon, 23 Aug 2021 18:54:52 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIF5q-000Nig-Hj
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 18:54:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id f10so25142938lfv.6
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 11:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LLLBnniN0Lx+Mumrz5skT0TPVp1ZGUNcrTmYMEWefMQ=;
 b=bRXypa0kMDufIBAltELnod4/f5LKxu08gHYATptf+EI6+VVuqGZtQc9IaQGjvFFCgq
 vbFbH2SdazqvcCAMYk3J4GuHj0e5I7zku8Oa9NfAxUikDOx7zn3pX1WDsTh6UdD8qIGa
 3eprpmmrxRJAoaM7Gu3ZdgZoGar9lSRCs5JDzMxdRNpVQ+gLcrYDdO8oxckRN909UcKX
 YtPVujPIzOZGW53g9o6QT7ES0CxEZ1zsz/t/TQNQmOc6LtFG124QbMp5K98LUEYst25J
 DiyXxjAzvYYQpznD15TTlrtQK87XzYXH/DXwNlvN8BApenm8QR23KvoRjr4Lypahasp2
 +t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LLLBnniN0Lx+Mumrz5skT0TPVp1ZGUNcrTmYMEWefMQ=;
 b=rVSiAgVBy5cYwyGgYJSPdqhrxzx8hl3akeMKles0Gy4TZwh9sQvAiZ9pN6L6jDCzHu
 gsJmkcADpRTonr8i2xWs/xbRdBKrcN1+b1SUtQ5IWTvilVqbiOGQl0voV0SjZ52Iyh57
 pYMWlkmXEaiBX3DY42aWPFictX7Tg0fE5KSXmLSZJgTpdlXGx7i7zLKIX/ZdYfgcGIKw
 VzSYHmG3R+K6dFlRR0xB5Z+2AnnoySrZNRDHhWJd3E/8WWYXHtBl5XBpDXQPLVj1BZ8G
 D2W7tRAxlCcBCihEyZ0FOqLIvNOa0LVXNq/GsCIqx1e7UBvm55i0gEhlm7uLE0HlQYFK
 5ahQ==
X-Gm-Message-State: AOAM533htDe2dEUg1YvRxYlSMDtk7q4ChmqvfYhLcCm66p4J6XXnR9KB
 qwETwvVbARy8magBZ9WvVQU=
X-Google-Smtp-Source: ABdhPJzROMmO2gjb4vwtC02vW+yxH5GZycPshNAf3U2uJx1Cn7HyzCyTxuzs4nwkiF2FdwTHg0lTpw==
X-Received: by 2002:a05:6512:3d22:: with SMTP id
 d34mr26136115lfv.326.1629744883418; 
 Mon, 23 Aug 2021 11:54:43 -0700 (PDT)
Received: from [192.168.2.145] (46-138-120-72.dynamic.spd-mgts.ru.
 [46.138.120.72])
 by smtp.googlemail.com with ESMTPSA id u18sm1664954lfo.280.2021.08.23.11.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 11:54:42 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
 <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box>
 <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
 <YR+VDZzTihmpENp6@orome.fritz.box>
 <CAPDyKFpJ+TK0w1GZEA7G=rtAjq5ipmVR4P0wy7uHiEGVWRk5yA@mail.gmail.com>
 <89ea1694-be9e-7654-abeb-22de0ca5255a@gmail.com>
 <YSOxnqiia+FqfOX6@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <acd25387-3d2b-460d-3280-eedd064b174b@gmail.com>
Date: Mon, 23 Aug 2021 21:54:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSOxnqiia+FqfOX6@orome.fritz.box>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_115446_620458_36026AD8 
X-CRM114-Status: GOOD (  31.30  )
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

MjMuMDguMjAyMSAxNzozMywgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBTYXQsIEF1
ZyAyMSwgMjAyMSBhdCAwODo0NTo1NFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDIwLjA4LjIwMjEgMTY6MDgsIFVsZiBIYW5zc29uINC/0LjRiNC10YI6Cj4+IC4uLgo+Pj4+IEkg
c3VwcG9zZSBpZiB0aGVyZSdzIHJlYWxseSBubyBnb29kIHdheSBvZiBkb2luZyB0aGlzIG90aGVy
IHRoYW4KPj4+PiBwcm92aWRpbmcgYSBzdHJ1Y3QgZGV2aWNlLCB0aGVuIHNvIGJlIGl0LiBJIHRo
aW5rIHRoZSBjbGVhbmVkIHVwIHN5c2ZzCj4+Pj4gc2hvd24gaW4gdGhlIHN1bW1hcnkgYWJvdmUg
bG9va3MgbXVjaCBiZXR0ZXIgdGhhbiB3aGF0IHRoZSBvcmlnaW5hbAo+Pj4+IHdvdWxkJ3ZlIGxv
b2tlZCBsaWtlLgo+Pj4+Cj4+Pj4gUGVyaGFwcyBhbiBhZGRpdGlvbmFsIHR3ZWFrIHRvIHRoYXQg
d291bGQgYmUgdG8gbm90IGNyZWF0ZSBwbGF0Zm9ybQo+Pj4+IGRldmljZXMuIEluc3RlYWQsIGp1
c3QgY3JlYXRlIHN0cnVjdCBkZXZpY2UuIFRob3NlIHJlYWxseSBoYXZlCj4+Pj4gZXZlcnl0aGlu
ZyB5b3UgbmVlZCAoLm9mX25vZGUsIGFuZCBjYW4gYmUgdXNlZCB3aXRoIFJQTSBhbmQgR0VOUEQp
LiBBcyBJCj4+Pj4gbWVudGlvbmVkIGVhcmxpZXIsIHBsYXRmb3JtIGRldmljZSBpbXBsaWVzIGEg
Q1BVLW1lbW9yeS1tYXBwZWQgYnVzLAo+Pj4+IHdoaWNoIHRoaXMgY2xlYXJseSBpc24ndC4gSXQn
cyBraW5kIG9mIGEgc2VwYXJhdGUgImJ1cyIgaWYgeW91IHdhbnQsIHNvCj4+Pj4ganVzdCB1c2lu
ZyBzdHJ1Y3QgZGV2aWNlIGRpcmVjdGx5IHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUuCj4+Pgo+Pj4g
SnVzdCBhIGhlYWRzIHVwLiBJZiB5b3UgZG9uJ3QgdXNlIGEgcGxhdGZvcm0gZGV2aWNlIG9yIGhh
dmUgYSBkcml2ZXIKPj4+IGFzc29jaWF0ZWQgd2l0aCBpdCBmb3IgcHJvYmluZywgeW91IG5lZWQg
dG8gbWFuYWdlIHRoZSBhdHRhY2htZW50IHRvCj4+PiBnZW5wZCB5b3Vyc2VsZi4gVGhhdCBtZWFu
cyBjYWxsaW5nIG9uZSBvZiB0aGUgZGV2X3BtX2RvbWFpbl9hdHRhY2gqKCkKPj4+IEFQSXMsIGJ1
dCB0aGF0J3MgcGVyZmVjdGx5IGZpbmUsIG9mY291cnNlLgo+Pj4KPj4+Pgo+Pj4+IFdlIGRpZCBz
b21ldGhpbmcgc2ltaWxhciBmb3IgWFVTQiBwYWRzLCBzZWUgZHJpdmVycy9waHkvdGVncmEveHVz
Yi5bY2hdCj4+Pj4gZm9yIGFuIGV4YW1wbGUgb2YgaG93IHRoYXQgd2FzIGRvbmUuIEkgdGhpbmsg
eW91IGNhbiBkbyBzb21ldGhpbmcKPj4+PiBzaW1pbGFyIGhlcmUuCj4+Cj4+IFdlIG5lZWQgYSBw
bGF0Zm9ybSBkZXZpY2UgYmVjYXVzZSB3ZSBoYXZlIGEgcGxhdGZvcm0gZGV2aWNlIGRyaXZlciB0
aGF0Cj4+IG11c3QgYmUgYm91bmQgdG8gdGhlIGRldmljZSwgb3RoZXJ3aXNlIFBNQyBkcml2ZXIg
c3RhdGUgd29uJ3QgYmUgc3luY2VkCj4+IHNpbmNlIGl0IGl0J3Mgc3luY2VkIGFmdGVyIGFsbCBk
cml2ZXJzIG9mIGRldmljZXMgdGhhdCByZWZlcmVuY2UgUE1DCj4+IG5vZGUgaW4gRFQgYXJlIHBy
b2JlZC4KPiAKPiBJIHRoaW5rIHRoZSBjYXVzYWxpdHkgaXMgdGhlIHdyb25nIHdheSBhcm91bmQu
IEl0J3MgbW9yZSBsaWtlbHkgdGhhdCB5b3UKPiBhZGRlZCB0aGUgcGxhdGZvcm0gZHJpdmVyIGJl
Y2F1c2UgeW91IGhhdmUgYSBwbGF0Zm9ybSBkZXZpY2UgdGhhdCB5b3UKPiB3YW50IHRvIGJpbmQg
YWdhaW5zdC4KPiAKPiBZb3UgY2FuIGhhdmUgZHJpdmVycyBiaW5kIHRvIG90aGVyIHR5cGVzIG9m
IGRldmljZXMsIGFsdGhvdWdoIGl0J3MgYSBiaXQKPiBtb3JlIHdvcmsgdGhhbiBhYnVzaW5nIHBs
YXRmb3JtIGRldmljZXMgZm9yIGl0Lgo+IAo+IFRoZXJlJ3MgdGhlICJhdXhpbGlhcnkiIGJ1cyB0
aGF0IHNlZW1zIGxpa2UgaXQgd291bGQgYmUgYSBzb21ld2hhdAo+IGJldHRlciBmaXQgKHNlZSBE
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvYXV4aWxpYXJ5X2J1cy5yc3QpLCB0aG91Z2ggaXQKPiBk
b2Vzbid0IGxvb2sgbGlrZSB0aGlzIGZpdHMgdGhlIHB1cnBvc2UgZXhhY3RseS4gSSB0aGluayBh
IGN1c3RvbSBidXMKPiAob3IgcGVyaGFwcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSBkZXBsb3ll
ZCBtb3JlIGJyb2FkbHkgYWNyb3NzIENDRikKPiB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlLgo+
IAo+IExvb2tpbmcgYXJvdW5kLCBpdCBzZWVtcyBsaWtlIGNsay9pbXggYW5kIGNsay9zYW1zdW5n
IGFidXNlIHRoZSBwbGF0Zm9ybQo+IGJ1cyBpbiBhIHNpbWlsYXIgd2F5LCBzbyB0aGV5IHdvdWxk
IGJlbmVmaXQgZnJvbSBhICJjbGsiIGJ1cyBhcyB3ZWxsLgoKSXQgbWF5IGJlIG5pY2UgdG8gaGF2
ZSBhIGRlZGljYXRlZCBjbGsgYnVzLCBidXQgdGhpcyBpcyB0b28gbXVjaCBlZmZvcnQKZm9yIG5l
YXJseSBub3RoaW5nIGluIG91ciBjYXNlLiBJdCBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtIHRvIGNv
bnZlcnQKZHJpdmVycyB0byB1c2UgY2xrIGJ1cyBvbmNlIGl0IHdpbGwgYmUgaW1wbGVtZW50ZWQu
IEl0IHNob3VsZG4ndCBiZSBhCnBhcnQgb2YgdGhpcyBzZXJpZXMsIElNTy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
