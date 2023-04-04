Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EBEC6FD1D
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Apr 2023 16:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLtvHs7B+C5WF1UtXkcVIztxR40ol6fzPYhkM/VUhFs=; b=UlZzLf2oxhdiZq
	l6K+kemP3EYZDbhJpJ3pPoLuQWZeiSOUmpwNM5KwudQHCx7vbUuByPTXVauxUMTpcYz3l55G72UgE
	fvG6dIG/TWd10AM12TR1JSQskKiFOU239uFOaSmjXn2NTK/b62h13tvaHeyqdTbDX0VlciPrg788w
	NIPB4ODi0xXnIROvQuL6yCmbos4s3n0ciX90NMXGlIvZDYov68Q4DIRt/xX3/no9DjXUYwhOJY3UD
	+ntE/sFjC/sKtmQ6sUp2WACPg56W4Kzs4dhBrcByKRyRVjlM9a4xJXl3FYIaWKBGuA4NUVHRnD9DZ
	0jttLu0UrR2ttS9rw3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjyG-002ITO-08;
	Tue, 04 Apr 2023 16:57:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjyC-002IRs-2O;
	Tue, 04 Apr 2023 16:57:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id w9so133315961edc.3;
        Tue, 04 Apr 2023 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680627437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7MhNZCWbmm+EQT2ZpLl2E/34gvDoi8JcsBYxfVZFwk=;
        b=VpLHIMinqDrwBgJCKe6aTCq+o2ToI2AcQwk7ETuH985y5l712JB/Jr1vrwVpie63AZ
         nP362aTfXVOwRwLlXpHGRk4PBTdeD94ijJ3+RUp1P9nqBBAXEX3pLLPbG+6Inwk7Uyaj
         uFjOnX4OGtjx8sYfx5vR29bO11rfY1Hsi6htfgOa7JqSh39Nv9chkha/eSesvzGdBXYu
         bpqi5ctpHBfKsmoMkLOHfPG+HXDlIrDf4yTtLRYMdJ/ZFlrEERZIjqkBnEZBJXKN5zvv
         6tBj4cl/oiz+AS47+YvLvIi9B3cokqy7sBMFOpBtuySkQHlO05Xw1iJ2uLy3r//bUthI
         cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7MhNZCWbmm+EQT2ZpLl2E/34gvDoi8JcsBYxfVZFwk=;
        b=VcmZ7zKhFO7LkNmloHcJlnZ2kaAY9JVRKscI315hVefAZvhnNufkT3tFTDGID46Fcd
         ODVWE3+IeBkf8NfDYwCzFNQdc4r2uM4s3YMyxTI+1Qlxhi1kMO3xENB+ML4aqKRH/ngs
         MzX2MtI7uemkabTrPgK9UkYtKZYm2cxzgrECui3n6hRJbTsFMWB1icBpXZqyMpJvTIgT
         zMDPu1uG1jB125d0F4RDtIPKtdI3Cd5PXFM0xHW4aBEt5/VzxFHaiQP8Mva9kyNvc/I2
         QybOpnrlUAArddLdc/VHXlm0SDX2tHPqTRUfBBrNoOszLaYsGZWOCogPyWshdfcQRCFS
         jLbg==
X-Gm-Message-State: AAQBX9dEl6jWzEl0M5OoSwhL8nFObELPsYmOM1ummLMYwQMmTxg7TOYh
	YgAqzZZUaXf5UGnHCo/JWXM=
X-Google-Smtp-Source: AKy350aLVwwKqFdLN/chhOt48r5LY4guvRxpRxIkNFsLEqvsNQmQtpD22vmnvW+Hx6srEDa7zCZz5g==
X-Received: by 2002:aa7:d514:0:b0:4fb:6523:2b38 with SMTP id y20-20020aa7d514000000b004fb65232b38mr156531edq.27.1680627437154;
        Tue, 04 Apr 2023 09:57:17 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id e27-20020a50d4db000000b004fadc041e13sm6144420edj.42.2023.04.04.09.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:57:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org,
 Michael Walle <michael@walle.cc>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject:  Re: [PATCH V4] nvmem: add explicit config option to read old syntax fixed OF
 cells
Date: Tue, 04 Apr 2023 18:57:14 +0200
Message-ID: <4817385.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230403225540.1931-1-zajec5@gmail.com>
References: <20230403225540.1931-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_095720_802073_5D04EABE 
X-CRM114-Status: GOOD (  18.66  )
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

RG5lIHRvcmVrLCAwNC4gYXByaWwgMjAyMyBvYiAwMDo1NTo0MCBDRVNUIGplIFJhZmHFgiBNacWC
ZWNraSBuYXBpc2FsKGEpOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KPiAKPiBCaW5kaW5nIGZvciBmaXhlZCBOVk1FTSBjZWxscyBkZWZpbmVkIGRpcmVjdGx5IGFz
IE5WTUVNIGRldmljZSBzdWJub2Rlcwo+IGhhcyBiZWVuIGRlcHJlY2F0ZWQuIEl0IGhhcyBiZWVu
IHJlcGxhY2VkIGJ5IHRoZSAiZml4ZWQtbGF5b3V0IiBOVk1FTQo+IGxheW91dCBiaW5kaW5nLgo+
IAo+IE5ldyBzeW50YXggaXMgbWVhbnQgdG8gYmUgY2xlYXJlciBhbmQgc2hvdWxkIGhlbHAgYXZv
aWRpbmcgaW1wcmVjaXNlCj4gYmluZGluZ3MuCj4gCj4gTlZNRU0gc3Vic3lzdGVtIGFscmVhZHkg
c3VwcG9ydHMgdGhlIG5ldyBiaW5kaW5nLiBJdCBzaG91bGQgYmUgYSBnb29kCj4gaWRlYSB0byBs
aW1pdCBzdXBwb3J0IGZvciBvbGQgc3ludGF4IHRvIGV4aXN0aW5nIGRyaXZlcnMgdGhhdCBhY3R1
YWxseQo+IHN1cHBvcnQgJiB1c2UgaXQgKHdlIGNhbid0IGJyZWFrIGJhY2t3YXJkIGNvbXBhdGli
aWxpdHkhKS4gVGhhdCB3YXkgd2UKPiBhZGRpdGlvbmFsbHkgZW5jb3VyYWdlIG5ldyBiaW5kaW5n
cyAmIGRyaXZlcnMgdG8gaWdub3JlIGRlcHJlY2F0ZWQKPiBiaW5kaW5nLgo+IAo+IEl0IHdhc24n
dCBjbGVhciAodG8gbWUpIGlmIHJ0YyBhbmQgdzEgY29kZSBhY3R1YWxseSB1c2VzIG9sZCBzeW50
YXgKPiBmaXhlZCBjZWxscy4gSSBlbmFibGVkIHRoZW0gdG8gZG9uJ3QgcmlzayBhbnkgYnJlYWth
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
Pgo+IFtmb3IgbWVzb24te2VmdXNlLG14LWVmdXNlfS5jXQo+IEFja2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IFtmb3IgbXRr
LWVmdXNlLmMsIG52bWVtL2NvcmUuYywgbnZtZW0tcHJvdmlkZXIuaF0KPiBSZXZpZXdlZC1ieTog
QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8KPiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tPiBbTVQ4MTkyLCBNVDgxOTUgQ2hyb21lYm9va3NdCj4gVGVzdGVkLWJ5OiBB
bmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubwo+IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+IFtmb3IgbWljcm9jaGlwLW90cGMuY10KPiBSZXZpZXdlZC1ieTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+Cj4gW1NBTUE3RzUtRUtdCj4g
VGVzdGVkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT4K
PiAtLS0KPiBUaGlzIGlzIGJhc2VkIG9uIHRvcCBvZiB0aGVtCj4gW1BBVENIIFY2IDMvM10gbnZt
ZW06IGNvcmU6IGFkZCBzdXBwb3J0IGZvciBmaXhlZCBjZWxscyAqbGF5b3V0Kgo+IAo+IFYyOiBG
aXggc3RtMzItcm9tZW0uYyB0eXBvIGJyZWFraW5nIGl0cyBjb21waWxhdGlvbgo+ICAgICBQaWNr
IE1hcnRpbidzIEFja2VkLWJ5Cj4gICAgIEFkZCBwYXJhZ3JhcGggYWJvdXQgbGF5b3V0cyBkZXBy
ZWNhdGluZyBhZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzCj4gVjM6IFVwZGF0ZSBjb21taXQgZGVz
Y3JpcHRpb246Cj4gICAgIDEuIE1ha2UgaXQgY2xlYXIgd2UncmUgTk9UIGRyb3BwaW5nIGZpeGVk
IGNlbGxzIHN1cHBvcnQKPiAgICAgMi4gVXNlIG5pY2VyIHdvcmRzIChzL21hZGUgc2Vuc2Uvd2Fz
IHRvdGFsbHkgc2FmZS8pCj4gICAgIDMuIEV4cGxhaW4gZml4ZWQgY2VsbHMgbGF5b3V0IHRoaW5n
Cj4gICAgIDQuIEFkZCBwYXJhZ3JhcGggd2l0aCBwdXJwb3NlIG9mIHRoaXMgY29tbWl0Cj4gVjQ6
IENvbXBsZXRlbHkgcmV3cml0ZSBjb21taXQgbWVzc2FnZS4KPiAgICAgUmVuYW1lIGNvbmZpZyBv
cHRpb24gdG8gImFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMiLgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9tdGRjb3JlLmMgICAgICAgICAgfCAyICsrCj4gIGRyaXZlcnMvbnZtZW0vYXBwbGUtZWZ1c2Vz
LmMgICB8IDEgKwo+ICBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgfCA4ICsrKysrLS0t
Cj4gIGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLXNjdS5jICB8IDEgKwo+ICBkcml2ZXJzL252bWVt
L2lteC1vY290cC5jICAgICAgfCAxICsKPiAgZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jICAg
IHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1c2UuYyB8IDEgKwo+ICBkcml2ZXJz
L252bWVtL21pY3JvY2hpcC1vdHBjLmMgfCAxICsKPiAgZHJpdmVycy9udm1lbS9tdGstZWZ1c2Uu
YyAgICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vcWNvbS1zcG1pLXNkYW0uYyB8IDEgKwo+ICBk
cml2ZXJzL252bWVtL3FmcHJvbS5jICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9udm1lbS9yYXZl
LXNwLWVlcHJvbS5jIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vcm9ja2NoaXAtZWZ1c2UuYyB8IDEg
Kwo+ICBkcml2ZXJzL252bWVtL3NjMjd4eC1lZnVzZS5jICAgfCAxICsKPiAgZHJpdmVycy9udm1l
bS9zcHJkLWVmdXNlLmMgICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYyAg
ICB8IDEgKwo+ICBkcml2ZXJzL252bWVtL3N1bnBsdXMtb2NvdHAuYyAgfCAxICsKPiAgZHJpdmVy
cy9udm1lbS9zdW54aV9zaWQuYyAgICAgIHwgMSArCgpGb3Igc3VueGlfc2lkOgpBY2tlZC1ieTog
SmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywK
SmVybmVqCgo+ICBkcml2ZXJzL252bWVtL3VuaXBoaWVyLWVmdXNlLmMgfCAxICsKPiAgZHJpdmVy
cy9udm1lbS96eW5xbXBfbnZtZW0uYyAgIHwgMSArCj4gIGRyaXZlcnMvcnRjL252bWVtLmMgICAg
ICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL3cxL3NsYXZlcy93MV9kczI1MHguYyAgfCAxICsKPiAg
aW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIHwgMiArKwo+ICAyMyBmaWxlcyBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
