Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CD9C636D7
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Feb 2023 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMB0eunXLGyUDpDX1+e5liSrKXJlGqQTr/2ZmJ6H3+I=; b=DzyPFTJlbvj7iP
	SoG/ztVK999WK3N5mIMocjehOXvHKN4IjQoQAzhQDwpPHCQY6ykwWlcY2kVV7AKnOhd7EKOREMakG
	ZbAuK4TFw/8LJSqSFgl5p9pXTOG0ti+HyOVGR1OZkJNYXapzxmc6SRg1up8Wqty7u6GX9cgFX/1+z
	zle9Pg0xsAJPnL+ryjD9+rKSlBtprrfXKQonSbrbbIg7XLOUqT8RlYYOQ+E7mBep2ZJnRCLZdsMrV
	ZdOTv5ML/UHtXS9vl+GxeXmDsauFkgT3jHRD5opvVwLqg8L1wCcgE59ZhCD4o5Mha1CFkE+58UNRt
	Y9tG/TH8sxXgqpnJJG/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUb94-009zNV-W3; Tue, 21 Feb 2023 22:29:59 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUb91-009zMR-Hd; Tue, 21 Feb 2023 22:29:57 +0000
Received: by mail-lf1-x12d.google.com with SMTP id x24so7773036lfr.1;
        Tue, 21 Feb 2023 14:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRskwuzUoTseJ7UhE/XiQ/ajutHbx9Jd0AO9KzeF2SA=;
        b=aKFAgFAHiqsL++CU0NQXI3ge3qCJTJWe9hhri5lPXhyFoAESWMM21NLBBPU5G6cNJY
         35lsLXaqrC6Mb6smUaE+WcAfzrsm9gqxGTNY/iMY66IU87+YokTiPTcPT4MAg1ufPqqN
         fQ16flQ0OJ/1LjzFEPXttIEaZA+BGgA59wa2q62W00rcvD7z7rqT3ayvBS5tl0ppMcJn
         IkWVdlg7bPBPCodv4v7h8EVO01zPwNKlvuZ5IwuJgkB8t2e6se9vm3VG4j3pdft/mnmu
         U8Eefz5MvvrPId0lV3ihpW8DC9KN/oUDLeqrl8gAIQSSSvZLw+145WXRdzkKwlM3xuel
         UKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rRskwuzUoTseJ7UhE/XiQ/ajutHbx9Jd0AO9KzeF2SA=;
        b=1s/2n18NEhIZAqBBpQM103pgkxPcDPDkJFOn1mtcGWI3ep2DytEHYkW6HTf7O0f1Yx
         9HQo+TLhibV8w6EMeIMYDzb6C0eCjQt9Mwbta9omooX0uohPRRIVTzYKdFtwBbIRExKf
         byMB+zhjTVb64QbmkumYFFqwsq6TZsyuFktEhLmzNsCTOHTKqa2lu892XWkHQC962rs6
         7q7WCCQHlXhO2k77/PmDqbV8ckzPAby4LRFE1Bzl5BzeUliCMyS7Q25LbzEnZHFAdEBo
         2O1ltRSOQUJg3R0Gyj1x4Fsxj0sookIXXjUc3LoZ6ynQO954GOd45aLuStWQXo3EVaYx
         I68g==
X-Gm-Message-State: AO0yUKU8fCeY/zj+9kfNfSg73FCQudfS1Q9RMrujWmZzMaq1wN4CdVUa
	0+7NYCXTOXt4Nvm85bB02+g=
X-Google-Smtp-Source: AK7set+yBQHNb9hSkW8dFReCGvYH5kUaeuCwO556jqZU4gWvC3OnNb7bh1PGOn5AYoyDdgoJfAwP7w==
X-Received: by 2002:a05:6512:14b:b0:4db:5122:2099 with SMTP id m11-20020a056512014b00b004db51222099mr1807349lfo.32.1677018591920;
        Tue, 21 Feb 2023 14:29:51 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id x25-20020ac259d9000000b004caf992bba9sm1957069lfn.268.2023.02.21.14.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 14:29:51 -0800 (PST)
Message-ID: <101a5bdf-870a-a1bb-954d-1d675ecad5a7@gmail.com>
Date: Tue, 21 Feb 2023 23:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] nvmem: add explicit config option to read OF fixed cells
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
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
 linux-rtc@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230221145021.31993-1-zajec5@gmail.com>
 <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAFBinCDxB=xtz9mtZupBC7J5oxknN1ENHzJ-cFxX4FTDSgZeFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_142955_612666_66157D8E 
X-CRM114-Status: GOOD (  19.17  )
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

T24gMjEuMDIuMjAyMyAyMjozOCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBUdWUs
IEZlYiAyMSwgMjAyMyBhdCAzOjUwIFBNIFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4K
Pj4KPj4gTlZNRU0gc3Vic3lzdGVtIGxvb2tzIGZvciBmaXhlZCBOVk1FTSBjZWxscyAoc3BlY2lm
aWVkIGluIERUKSBieQo+PiBkZWZhdWx0LiBUaGlzIGJlaGF2aW91ciBtYWRlIHNlbnNlIGluIGVh
cmx5IGRheXMgYmVmb3JlIGFkZGluZyBzdXBwb3J0Cj4+IGZvciBkeW5hbWljIGNlbGxzLgo+Pgo+
PiBXaXRoIGV2ZXJ5IG5ldyBzdXBwb3J0ZWQgTlZNRU0gZGV2aWNlIHdpdGggZHluYW1pYyBjZWxs
cyBjdXJyZW50Cj4+IGJlaGF2aW91ciBiZWNvbWVzIG5vbi1vcHRpbWFsLiBJdCByZXN1bHRzIGlu
IHVubmVlZGVkIGl0ZXJhdGluZyBvdmVyIERUCj4+IG5vZGVzIGFuZCBtYXkgcmVzdWx0IGluIGZh
bHNlIGRpc2NvdmVyeSBvZiBjZWxscyAoZGVwZW5kaW5nIG9uIHVzZWQgRFQKPj4gcHJvcGVydGll
cykuCj4gSSBhbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgcmVjZW50IGNoYW5nZXMgYXJvdW5kIGR5
bmFtaWMgY2VsbHMuCj4gSXMgdGhlcmUgYW55IGRpc2N1c3Npb24vc3VtbWFyeSB0aGF0IEkgY2Fu
IHJlYWQgdG8gZ2V0IHVwIHRvIHNwZWVkPwoKU29tZSBOVk1FTSBkZXZpY2VzIGRvbid0IHN0b3Jl
IHNwZWNpZmljIGRhdGEgYXQgaGFyZGNvZGVkIG9mZnNldHMuIEZvcgpzdWNoIGRldmljZXMgd2Ug
aGF2ZSBkcml2ZXJzICh0byBiZWNvbWU6IGxheW91dHMpIHRoYXQgcGFyc2UgdGhlaXIgbWFnaWMK
Y29udGVudC4gVGhleSBkaXNjb3ZlciBjZWxscyBhbmQgcmVnaXN0ZXIgdGhlbSBhbmQgcHJvdmlk
ZSBtYXRjaGluZyB3aXRoCnByb3BlciBEVCBub2Rlcy4KCkZvciBiaW5kaW5ncyBzZWU6Cmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC9jb21taXQvP2lkPTA4NDk3M2U5NDRiZWMyMTgwNGY4YWZiMDUxNWIyNTQzNDQzODY5OWEK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L2NvbW1pdC8/aWQ9YTYwN2E4NTBiYTFmYTk2NmNiYjAzNTU0NGMxNTg4ZTI0YTYz
MDdkZgoKRm9yIGV4YW1wbGUgZHJpdmVyIHNlZToKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NmU5Nzdl
YWE4MjgwZTk1N2I4NzkwNGI1MzY2NjE1NTBmMmE2YjNlOApodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD0y
MDc3NzVmN2UxN2I4ZmQwNDI2YTJhYzRhNWI4MWU0ZTFkNzE4NDllCgpGb3IgdXNhZ2Ugc2VlOgpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvY29tbWl0Lz9pZD1jODQ0MmYwZmIwOWNhM2Q4NDJiOWIyM2QxZDA2NTBmNjQ5ZmQx
MGY4CgoKPiBNeSBtYWluIHRob3VnaHQgaXM6IGlmIHRoZXJlIGFyZSBtYW55ICJmaXhlZCBPRiBj
ZWxscyIgaW1wbGVtZW50YXRpb25zCj4gYW5kIG9ubHkgYSBmZXcgImR5bmFtaWMiIG9uZXMgLSBk
b2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZmxpcCB0aGUgbG9naWMKPiBhbmQgaW50cm9kdWNlIGEgbmV3
ICJ1c2VfZHluYW1pY19vZl9jZWxscyIgZmxhZyBpbnN0ZWFkPwoKVGhlIHByb2JsZW0gaXMgdGhh
dCB0aGVyZSBhcmUgbW9yZSBjYXNlcyB0aGFuIGp1c3QgdHdvLiBXZSBjYW4gaGF2ZToKMS4gTm8g
Y2VsbHMgYXQgYWxsCjIuIEZpeGVkIGNlbGxzIGluIERUCjMuIER5bmFtaWMgY2VsbHMgd2l0aCBy
ZWZlcmVuY2VzIGluIERUCjQuIERyaXZlciBzcGVjaWZpZWQgY2VsbHMgKHNwZWNpZmllZCB3aXRo
aW4gY29uZmlnKQo1LiBDZWxscyBkZWZpbmVkIGluIGEgZ2xvYmFsIHRhYmxlCgpTbyB3ZSBuZWVk
IHRvIHJlZmVyZW5jZSBEVCBjZWxscyBleHBsaWNpdGx5ICh3ZSBjYW4ndCBqdXN0IGNvbmZpcm0g
LwpkZW55ICpkeW5hbWljKiBjZWxscykuCgpBbm90aGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIGhh
dmUgIm5vX2ZpeGVkX29mX2NlbGxzIiBidXQ6CgoxLiBQZXJzb25hbGx5IEkgdGhpbmsgbmVnYXRp
b24gaXMgbGVzcyBjbGVhciAvIGVhc3kgdG8gZm9sbG93CgoyLiBUaGVyZSBtYXkgYmUgYWN0dWFs
bHkgbW9yZSBkcml2ZXJzIHdpdGggbm8gZml4ZWQgY2VsbHMuCkkgdGhpbmsgSSBtb2RpZmllZCAx
OCBkcml2ZXJzLiBJdCBzZWVtcyBkZXZtX252bWVtX3JlZ2lzdGVyKCkgaXMKcmVmZXJlbmNlZCBp
biA0NCBwbGFjZXMuIEZldyBvZiB0aGVtIG1heSBiZSBub3QgYWN0dWFsIHVzZXJzIGJ1dCBpdApz
dGlsbCBzZWVtcyB0byBiZSBhYm91dCBlcXVhbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
