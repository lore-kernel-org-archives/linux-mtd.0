Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B83C6FA99
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 10:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Psq08IstNCB5zNAvGJhc8U48ojysuHS5GWKt6viwdc8=; b=0qiSrQbXLuuGY+
	BWLk5PdaPp5qyxzISFqZbAQZpXKKMumRj9f/hFXgUq3fy8jbY+aIKX9ZEY1bl4oo/wVRSFYTQcseb
	TFwZNvshTj5gGO3Gsbln9eA4saZ1RD1DM87sMwqWCvmkRHeLovZXfjy2gV4Q48s9roEJSbxce36sn
	d82ZhY7PM871VPIJfC1dHZ9ncNpLtg6kOLVjmlfv32v3xY5/+iH6nHiFmkE9pY4ArwlOPUC2tpYJz
	qaubpuGZ57ud0kM+IuuzhdJ3TghXRiR6Rv3Mb23WxBWvoXJ9m0EkQeVcdjo3/OJ3fyV5JG3l/jdP1
	S3lhkncnBkS7WAx5OJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaDw-00EE6G-QO; Fri, 10 Mar 2023 10:43:44 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaDt-00EE4y-RO; Fri, 10 Mar 2023 10:43:43 +0000
Received: by mail-lj1-x22f.google.com with SMTP id h3so4824477lja.12;
        Fri, 10 Mar 2023 02:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678445017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D8DgvSllDpIpjkRMtHsbcOPCoCHnTYInoVGhS4b+QA=;
        b=nCHfG0VG+xIVMI3Uz30+lCPQjHMFNzvzKvLr/uxFUsFQf3sK0QzWXC1lkMYIpnb+yo
         kTfC3hUaq8cgGe9xMk6AcbdnaIcg7HQQTQy9FYUYrxXA8lGpEBgL1Dmir6Vjlq8dfPLs
         C7qPdt6AmXMhTO+LAlZFKkmu7qpBvf+EAlj48MXE+EFWNTkHYnE9PYxJfTlLY0JQzVRe
         AVPRBJUNvn2rznC1jaKvMtoRuQcxNZy6ZCXkCfDrMOAox6Fj/UPpj2Qw3RPLR5Sm6Qw0
         QLFfzrkeRntLiy2SEYLW90oHWj4Bztsxrd9uCIC8aMvEDbCJnw1v2hI9WbY/GoLyvewF
         cJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678445017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6D8DgvSllDpIpjkRMtHsbcOPCoCHnTYInoVGhS4b+QA=;
        b=zC0447W97lSFUjWwyuCTp8nugPQfFwTT7vCdLKy2g/ZZdAncN7HpFh01TlT1dIdxz8
         6Xpcnl+NaOPxw0IWfJYnk2+C93IF1QRs3RZjFSpUMqNo5LV4DRrMvt4ZQvgfUo+I64xU
         jswA7mtFndixurCU3sTvJKaVQAMRyt5lDPv3sm6AZpJ94x39kY1jfn2ILYDh01z6hPlh
         bDLfuwilWvL9XY6FChWObAnXLALqQcXVLBR7sknJnXikiV/fawzEcU0uR718f8iy7JMB
         hoeSSF7V04Mcf8tEc+t5696TfyMR/ub86SJqeppERLyq2eYI75mt7oB7A8kkbtZALrhc
         SDDg==
X-Gm-Message-State: AO0yUKWiVV4r+SfundliKmPMQ0Vbxgik1LTtm9rdOO9oVejgDsm8GTXO
	hs0VtVsqkNqqDp1J+ZXolxQ=
X-Google-Smtp-Source: AK7set+p71/bzHEgwcLpPLO/Pz2JDQS28ccp+iIU3K53kTB52otuWjNtgd3ESU/TF0IRcMCTp5ShaA==
X-Received: by 2002:a2e:4619:0:b0:290:8289:8cba with SMTP id t25-20020a2e4619000000b0029082898cbamr310434lja.8.1678445017151;
        Fri, 10 Mar 2023 02:43:37 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id l20-20020a2e9094000000b00297dad1a2b0sm187498ljg.103.2023.03.10.02.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 02:43:36 -0800 (PST)
Message-ID: <453c9298-d64a-aa77-28ba-ac986dfdd722@gmail.com>
Date: Fri, 10 Mar 2023 11:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3] nvmem: add explicit config option to read OF fixed
 cells
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230309112028.19215-1-zajec5@gmail.com>
 <ac94f04b-4b25-81e4-386f-55b0a2c7c85f@linaro.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <ac94f04b-4b25-81e4-386f-55b0a2c7c85f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_024341_929618_090C8410 
X-CRM114-Status: GOOD (  33.77  )
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

T24gMTAuMDMuMjAyMyAxMDoyMiwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPiAKPiBPbiAw
OS8wMy8yMDIzIDExOjIwLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206IFJhZmHFgiBN
acWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gTlZNRU0gc3Vic3lzdGVtIGxvb2tzIGZv
ciBmaXhlZCBOVk1FTSBjZWxscyAoc3BlY2lmaWVkIGluIERUKSBieQo+PiBkZWZhdWx0LiBUaGlz
IGJlaGF2aW91ciB3YXMgdG90YWxseSBzYWZlIGluIGVhcmx5IGRheXMgYmVmb3JlIGFkZGluZwo+
PiBzdXBwb3J0IGZvciBkeW5hbWljIGNlbGxzIGFuZCB3aXRoIHNpbXBsZSBEVCBzeW50YXguCj4+
Cj4+IFdpdGggZXZlcnkgbmV3IHN1cHBvcnRlZCBOVk1FTSBkZXZpY2Ugd2l0aCBkeW5hbWljIGNl
bGxzIHRoZSBjdXJyZW50Cj4+IGJlaGF2aW91ciBiZWNvbWVzIG5vbi1vcHRpbWFsOgo+PiAxLiBJ
dCByZXN1bHRzIGluIHVubmVlZGVkIGl0ZXJhdGluZyBvdmVyIERUIG5vZGVzCj4+IDIuIEl0IG1h
eSByZXN1bHQgaW4gZmFsc2UgZGlzY292ZXJ5IG9mIGNlbGxzIChpbiBjYXNlIERUIHN1Ym5vZGVz
Cj4+IMKgwqDCoCBjb250YWluICJyZWciIHByb3BlcnR5KQo+Pgo+IAo+IEFtIHJlYWxseSBub3Qg
c3VyZSB3aGF0IGlzIGdvaW5nIG9uIGhlcmUsCj4gSSBkaWQgcmFpc2Ugc29tZSBpc3N1ZXMgd2l0
aCB0aGlzIG92ZXJhbGwgYXBwcm9jaCB0byBzdGFydCB3aXRoIGF0IFsxXSBub25lIG9mIHdoaWNo
IGFyZSBkaXNjdXNzZWQgYW5kIG5vdyBJIHNlZSB2MyA6LSkKPiAKPiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIzMDMwOTA5NDAxMC4xMDUxNTczLTEtbWljaGFlbEB3YWxsZS5j
Yy9ULyNtNzcwNmI2NDA5NzlhYWJmMjUxNDM2ZTAxN2I4MTg5NDEzNjYxYTUzYQoKSSB1cGRhdGVk
IGNvbW1pdCBtZXNzYWdlIHRvIGFkZHJlc3MgeW91ciBjb25jZXJucy4gSSB0aG91Z2h0IEkgbWFk
ZSBpdApjbGVhci4gSSBkb24ndCBrbm93IGhvdyB0byBlbXBoYXNpemUgaXQgYmV0dGVyLgoKSSds
bCB0cnkgdG8gYW5zd2VyIG5ldmVydGhlbGVzcywgcGxlYXNlIHNlZSBiZWxvdy4KCgpPbiA5LjAz
LjIwMjMgMTA6MzcsIFNyaW5pdmFzIEthbmRhZ2F0bGEgd3JvdGU6CiA+IE9uIDI0LzAyLzIwMjMg
MDc6MjksIFJhZmHFgiBNacWCZWNraSB3cm90ZToKID4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KID4+CiA+PiBOVk1FTSBzdWJzeXN0ZW0gbG9va3MgZm9yIGZpeGVk
IE5WTUVNIGNlbGxzIChzcGVjaWZpZWQgaW4gRFQpIGJ5CiA+PiBkZWZhdWx0LiBUaGlzIGJlaGF2
aW91ciBtYWRlIHNlbnNlIGluIGVhcmx5IGRheXMgYmVmb3JlIGFkZGluZyBzdXBwb3J0CiA+PiBm
b3IgZHluYW1pYyBjZWxscy4KID4+CiA+PiBXaXRoIGV2ZXJ5IG5ldyBzdXBwb3J0ZWQgTlZNRU0g
ZGV2aWNlIHdpdGggZHluYW1pYyBjZWxscyBjdXJyZW50CiA+PiBiZWhhdmlvdXIgYmVjb21lcyBu
b24tb3B0aW1hbC4gSXQgcmVzdWx0cyBpbiB1bm5lZWRlZCBpdGVyYXRpbmcgb3ZlciBEVAogPj4g
bm9kZXMgYW5kIG1heSByZXN1bHQgaW4gZmFsc2UgZGlzY292ZXJ5IG9mIGNlbGxzIChkZXBlbmRp
bmcgb24gdXNlZCBEVAogPj4gcHJvcGVydGllcykuCiA+CiA+PgogPj4gVGhpcyBiZWhhdmlvdXIg
aGFzIGFjdHVhbGx5IGNhdXNlZCBhIHByb2JsZW0gYWxyZWFkeSB3aXRoIHRoZSBNVEQKID4+IHN1
YnN5c3RlbS4gTVREIHN1YnBhcnRpdGlvbnMgd2VyZSBpbmNvcnJlY3RseSB0cmVhdGVkIGFzIE5W
TUVNIGNlbGxzLgogPj4KID4+IEFsc28gd2l0aCB1cGNvbWluZyBzdXBwb3J0IGZvciBOVk1FTSBs
YXlvdXRzIG5vIG5ldyBiaW5kaW5nIG9yIGRyaXZlcgogPj4gc2hvdWxkIHN1cHBvcnQgZml4ZWQg
Y2VsbHMgZGVmaW5lZCBpbiBkZXZpY2Ugbm9kZS4KID4KID4gVGhpcyBpcyBub3QgdmVyeSBjbGVh
ciwgYXJlIHlvdSBzYXlpbmcgdGhhdCB3ZSBzaG91bGQgbm90IHN1cHBvcnQgZml4ZWQgY2VsbHM/
IElmIHRoYXQgaXMgdGhlIGNhc2UgdGhlbiB5b3UgYXJlIHByb2FiYWJseSB0YWtpbmcgdGhpcyBp
biB3cm9uZyBkaXJlY3Rpb24uIG52bWVtIHdhcyBidWlsdCBiYXNlZCBvbiB0aGUgZmFjdCB0aGF0
IGRyaXZlcnMgY2FuIHJlYWQgZnJvbSBhIGZpeGVkIG9mZnNldHMuIER5bmFtaWMgY2VsbHMgaXMg
c29tZXRoaW5nIHZlcnkgbmV3LCB0aGF0IGRvZXMgbm90IG1lYW4gdGhhdCB3ZSBzaG91bGQgZGl0
Y2ggZml4ZWQgY2VsbHMgc3VwcG9ydCBpbiBkdC4KCkkgRE9OJ1QgZGVwcmVjYXRlIG9yIGRyb3Ag
c3VwcG9ydCBmb3IgZml4ZWQgbGF5b3V0cyAoZml4ZWQgTlZNRU0gY2VsbHMpLgpQZXJpb2QuCkkg
V09OJ1QgZHJvcCBzdXBwb3J0IGZvciBvbGQgYmluZGluZy4gV2Ugc3RheSBiYWNrd2FyZCBjb21w
YXRpYmxlLgpQZXJpb2QuCgpJbiB0aGlzIHBhdGNoJ3MgYm9keSBJIHdyb3RlOgoid2l0aCB0aGUg
c3VwcG9ydCBmb3IgTlZNRU0gbGF5b3V0cyB3ZSBtYXkgJiBzaG91bGQgaGF2ZSAqbmV3KiBiaW5k
aW5ncyBhbGxvdyBmaXhlZCBOVk1FTSBjZWxscyBvbmx5IGluIHRoZSAibnZtZW0tbGF5b3V0IiBz
dWJub2RlIgp0aGF0IGNsZWFybHkgbWVhbnMgSSBzdGlsbCB3YW50IHRvIEFMTE9XIGZpeGVkIE5W
TUVNIGNlbGxzIC0ganVzdCBpbiB0aGUgKm52bWVtLWxheW91dCogbm9kZS4KCkkgd2FudCB0byBL
RUVQIHN1cHBvcnQgZm9yIGZpeGVkIE5WTUVNIGNlbGxzLgpJIGp1c3Qgd2FudCB0aGVtIHRvIGJl
IHByZWZlcmFibHkgZGVmaW5lZCBpbiB0aGUgIm52bWVtLWxheW91dCIgbm9kZS4KCgogPj4gU29s
dmUgdGhpcyBieSBtb2RpZnlpbmcgZHJpdmVycyBmb3IgYmluZGluZ3MgdGhhdCBzdXBwb3J0IHNw
ZWNpZnlpbmcKID4+IGZpeGVkIE5WTUVNIGNlbGxzIGluIERULiBNYWtlIHRoZW0gZXhwbGljaXRs
eSB0ZWxsIE5WTUVNIHN1YnN5c3RlbSB0bwogPj4gcmVhZCBjZWxscyBmcm9tIERULgogPgogPiBT
aG91bGRuJ3QgdGhpcyBiZSBvcHBvc2l0ZSwgbGV0IHRoZSBuZXcgcHJvdmlkZXJzIHRlbGwgdGhh
dCBjZWxscyBhcmUgY3JlYXRlZCBhdCBydW50aW1lPwogPgogPiBvciBldmVuIGJldHRlciBpZiB0
aGVyZSBpcyBhIHdheSB0byBkZXRlY3QgaWYgd2UgY2FuIHNldCB0aGlzIGZsYWcgZHluYW1pY2Fs
bHkgYmFzZWQgb24gbGF5b3V0L3Bvc3QtcHJvY2Vzc2luZyBjb25maWd1cmF0aW9uLgogPgogPiB0
aGF0IHNob3VsZCBiZSBtdWNoIGNsZWFuZXIgYXBwcm9jaC4KCkkgdHJpZWQgdG8gYWRkcmVzcyB0
aGlzIGNvbmNlcnQgaW4gdGhlIGZvbGxvd2luZyBwYXJ0IG9mIGNvbW1pdCBib2R5OgoKID4gVGhl
IGJlc3QgYXBwcm9hY2ggc2VlbXMgdG8gYmUgbWFraW5nIE5WTUVNIGNvcmUgbG9va2luZyBmb3Ig
Zml4ZWQgRFQKID4gY2VsbHMgaW4gKipkZXZpY2UqKiBub2RlIGFuIG9wdC1pbiBmZWF0dXJlLiBJ
dCdzIGEgZmVhdHVyZSB0aGF0IG92ZXIKID4gdGltZSBzaG91bGQgZ2V0IGRlcHJlY2F0ZWQgaW4g
YSBmYXZvciBvZiB1c2luZyAibnZtZW0tbGF5b3V0cyIgYWxzbyBmb3IKID4gZml4ZWQgTlZNRU0g
Y2VsbHMuCgpOZXcgTlZNRU0gcHJvdmlkZXIgYmluZGluZ3MgYW5kIGRyaXZlcnMgd2lsbCBnZXQg
ZGV2ZWxvcGVkLiBJIHdvdWxkCndhbnQgYWxsIG5ldyBiaW5kaW5ncyB0byB1c2UgIm52bWVtLWxh
eW91dCIgZm9yIGRlc2NyaWJpbmcgTlZNRU0gY2VsbHMKKG5vIG1hdHRlciBpZiBmaXhlZCBvciBk
eW5hbWljKS4KClRoYXQgbWVhbnMgYWxsIG5ldyBkcml2ZXJzIFdJTEwgTk9UIG5lZWQgdG8gc2V0
ICJ1c2VfZml4ZWRfb2ZfY2VsbHMiLgoKU28gb3ZlciB0aW1lICJ1c2VfZml4ZWRfb2ZfY2VsbHMi
IHdpbGwgYmVjb21lIGEgbWlub3JpdHkuIEl0J3cgd291bGQgYmUKcGl0dHkgdG8gaGF2ZSBldmVy
eSBuZXcgZHJpdmVyIHRvIHJlcXVlc3QgTlZNRU0gY29kZSB0byBza2lwIGxvb2tpbmcgZm9yCk5W
TUVNIGNlbGxzIGluICoqZGV2aWNlKiogbm9kZS4KClNvIG15IGFuc3dlciBpczogbm8uIEkgZG9u
J3QgYmVsaWV2ZSBpdCBzaG91bGQgYmUgb3Bwb3NpdGUuIExvb2tpbmcgZm9yCmZpeGVkIE5WTUVN
IGNlbGxzIGluICoqZGV2aWNlKiogRFQgbm9kZSBzaG91bGQgYmUgYW4gb3B0LWluLgoKSWYgYnkg
c29tZSBtaXJhY2xlIEkgbWFuYWdlIHRvIGdldCBteSBwYXRjaGVzIHRocm91Z2ggdGhlbiB5b3Un
bGwgZm9yZ2V0CmFib3V0ICJ1c2VfZml4ZWRfb2ZfY2VsbHMiIG5leHQgbW9udGguIE5vb25lIHdp
bGwgbmVlZCBpdCBmb3IgYW55IG5ldwpzdHVmZi4gSXQnbGwgc3RheSBmb3IgYmFja3dhcmQgY29t
cGF0aWJpbGl0eSBvbmx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
