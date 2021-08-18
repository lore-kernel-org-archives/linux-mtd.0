Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCA9C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C41F61053
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C41F61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxzCcTtty/Gbz/3ubAAGCPCAPnppU/RJUJS7RMhhBws=; b=xxgHHHRWFbP1bp
	ba+qj94s8m4Ce929Y1EdwNYcYmQRYcUH+DNnD3RA/02N8AR+LcpBd0bBQR53ReajW2rb1k4g9Uwoc
	wXUqIphFXR0RpHsWyNBdb3MCcIIXY84M8rnjmj9GPTMuvEzbXJiWaKiDYj7wSsl+yeozym6G2ZttK
	u7/2vBXg3mJzpwYb+4CS9CXJ0skpb1RoA7VTKGRDKYmi0MAQ+w+iEkLPoUYDCjOZ1/wYqROXSNeEv
	atwq2DzDG1dCLt5UidDb8BsJKS/hresYU8FkJCcL16P5eGIt4SBvhPC9y4P39b8JND2aLilk3QKuV
	lxDYP7Fp6OXkNyzcgqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDEq-0047dQ-VY; Wed, 18 Aug 2021 04:31:41 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDEl-0047ap-Ix
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 04:31:39 +0000
Received: by mail-pg1-x535.google.com with SMTP id k24so935984pgh.8
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 21:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=1HMKBtZVmoU7Rc9QD3kyFw8BSxbQ1XXUucrR+Z4oVdk=;
 b=WNnzDrjKSuo57M5U/vvksnesnE3XSYhvmOFwkkjYoF4N6XG+ta8N8NZzIFWeIE0OGt
 m4GJMPaxMYVC2//z4Hj1hbmM69h0o2zIOCkq7g914IVwVDrfUCYp2Fyx5EFg3zpe7op6
 sBuMx6G4//Vj5k5oQ3p1EjIx0FNqKDs8PZoGLd5zLM/K21YuDJix7HN32JKNpXc9lV5b
 /CqWxJPWJu6lybUtbqgsRNAUEAdjQXqyLlNMosG1SgkdTrL/H77eBngh5FCPI3mbp5WM
 Y5XCL3BSH33gOEYrWigS1sIOtvjBIhuytq+nTcM3RY+gm1vUp6Ia4lgmwIFSUDCDGDVu
 UE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=1HMKBtZVmoU7Rc9QD3kyFw8BSxbQ1XXUucrR+Z4oVdk=;
 b=oUF+FjCJQDy0TcH56Y2tsTLfeFjeMa+8JspRe1PHAlngaD7UI8HBAwY/kkWLwkWpEx
 az7lDOxUIF5kiQS/64T4zLSVWU/xNcHg/LVdk7N5YbZWt2Fqi+HVVR9jFWeDE3ZCeRCB
 CtO57fV5KawzMxDNjmrvbeD7EOaPqWjXy509P/+W157R4oy9XmVA+/J83qFS+GvLQtcp
 dGkrzR3/K3VSmfKW5+id9yMW818NcyUVEWSlYQIyFu8CsjK8kH60AxiehdmQcA1Mb7qu
 FoRwe9Q1j2hwEe3iVEigW+yv2S1Lm4kFPT6i0op4MvrFHYSnrHaXNmd7RwLIwkpr7b7l
 NPUw==
X-Gm-Message-State: AOAM532WMrxvF+UJntkK9ufVkTcdn26K2FNLxJvTjBGnuVepmkkGVQYp
 d7VHazzQjUI0iOvddpCS/D5LBQ==
X-Google-Smtp-Source: ABdhPJxMvaeYlR6ulOVs6g7ClDkUxVRC1d9pxaerEppmknwXG/wEM2I8f172Oe2lWr6x04vVo8i8LA==
X-Received: by 2002:a62:a117:0:b029:394:dddf:6b00 with SMTP id
 b23-20020a62a1170000b0290394dddf6b00mr7062959pff.50.1629261093845; 
 Tue, 17 Aug 2021 21:31:33 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id a17sm4156560pff.30.2021.08.17.21.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 21:31:33 -0700 (PDT)
Date: Wed, 18 Aug 2021 10:01:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_213135_662705_3A3BF2A9 
X-CRM114-Status: GOOD (  19.22  )
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

T24gMTgtMDgtMjEsIDA3OjEyLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTguMDguMjAyMSAw
Njo1NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBPbiAxNy0wOC0yMSwgMTg6NDksIERt
aXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiAxNy4wOC4yMDIxIDEwOjU1LCBWaXJlc2ggS3VtYXIg
0L/QuNGI0LXRgjoKPiA+PiAuLi4KPiA+Pj4+ICtpbnQgZGV2X3BtX29wcF9zeW5jKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiA+Pj4+ICt7Cj4gPj4+PiArCXN0cnVjdCBvcHBfdGFibGUgKm9wcF90YWJs
ZTsKPiA+Pj4+ICsJc3RydWN0IGRldl9wbV9vcHAgKm9wcDsKPiA+Pj4+ICsJaW50IHJldCA9IDA7
Cj4gPj4+PiArCj4gPj4+PiArCS8qIERldmljZSBtYXkgbm90IGhhdmUgT1BQIHRhYmxlICovCj4g
Pj4+PiArCW9wcF90YWJsZSA9IF9maW5kX29wcF90YWJsZShkZXYpOwo+ID4+Pj4gKwlpZiAoSVNf
RVJSKG9wcF90YWJsZSkpCj4gPj4+PiArCQlyZXR1cm4gMDsKPiA+Pj4+ICsKPiA+Pj4+ICsJaWYg
KCFfZ2V0X29wcF9jb3VudChvcHBfdGFibGUpKQo+ID4+Pj4gKwkJZ290byBwdXRfdGFibGU7Cj4g
Pj4+PiArCj4gPj4+PiArCW9wcCA9IF9maW5kX2N1cnJlbnRfb3BwKGRldiwgb3BwX3RhYmxlKTsK
PiA+Pj4+ICsJcmV0ID0gX3NldF9vcHAoZGV2LCBvcHBfdGFibGUsIG9wcCwgb3BwLT5yYXRlKTsK
PiA+Pj4KPiA+Pj4gQW5kIEkgYW0gbm90IHN1cmUgaG93IHRoaXMgd2lsbCBlbmQgdXAgd29ya2lu
Zywgc2luY2UgbmV3IE9QUCB3aWxsIGJlCj4gPj4+IGVxdWFsIHRvIG9sZCBvbmUuIFNpbmNlIEkg
c2VlIHlvdSBjYWxsIHRoaXMgZnJvbSByZXN1bWUoKSBhdCBtYW55Cj4gPj4+IHBsYWNlcy4KPiA+
Pgo+ID4+IEluaXRpYWxseSBPUFAgdGFibGUgaXMgInVuaW5pdGlhbGl6ZWQiIGFuZCBvcHBfdGFi
bGUtPmVuYWJsZWQ9ZmFsc2UsCj4gPj4gaGVuY2UgdGhlIGZpcnN0IHN5bmMgYWx3YXlzIHdvcmtz
IGV2ZW4gaWYgT1BQIGlzIGVxdWFsIHRvIG9sZCBvbmUuIE9uY2UKPiA+PiBPUFAgaGFzIGJlZW4g
c3luY2VkLCBhbGwgZnVydGhlciBzeW5jcyBhcmUgTk8tT1BzLCBoZW5jZSBpdCBkb2Vzbid0Cj4g
Pj4gbWF0dGVyIGhvdyBtYW55IHRpbWVzIHN5bmNpbmcgaXMgY2FsbGVkLgo+ID4+Cj4gPj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTQtcmM2L3NvdXJjZS9kcml2ZXJzL29w
cC9jb3JlLmMjTDEwMTIKPiA+IAo+ID4gUmlnaHQsIGJ1dCBob3cgd2lsbCB0aGlzIHdvcmsgZnJv
bSBSZXN1bWUgPyBXb24ndCB0aGF0IGJlIGEgbm8tb3AgPwo+IAo+IFRoZSBmaXJzdCByZXN1bWUg
aW5pdGlhbGl6ZXMgdGhlIE9QUCBzdGF0ZSBvbiBzeW5jLCBhbGwgZnVydGhlciBzeW5jcyBvbgo+
IHJlc3VtZSBhcmUgbm8tb3BzLgoKQnV0IHRoZSBPUFBzIHNob3VsZCBhbHJlYWR5IGJlIGluaXRp
YWxpemVkIGFzIHNvbWVvbmUgbXVzdCBoYXZlIGNhbGxlZApvcHAtc2V0LXJhdGUgZWFybGllciA/
IFdoeSBkbyB0aGlzIGZyb20gcmVzdW1lIGFuZCBub3QgcHJvYmUgPwoKLS0gCnZpcmVzaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
