Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34138C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 06:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiUjt6obKIetRj0hY9AEWdDLdnFZH/5m5nuCw7z3vK8=; b=4t/9iikg4Qs/mq
	gUzmnLMLyRpMeNSMxb5Ez/9uB3mZ7hqrVB6NG5LHiUeUBdroxKjDOIq2iioDSXTzJNXxKH9Db7odE
	+FoptESOJV6n8qtLq4dl6uCapdq3vaLg/PHKeFWcGsqAjTNOyMy94AqjWkjaUS2a/1NFxPT4teRDB
	FD+5KGXj84wHweU+Z88luHKqMgOXu3aucCtM9/U3uLIbigBUFcumeokSEzYzfIBkr4386zO/aOywT
	k5of08pgHwnv6dYFS68BPTRPfwSMluUbcNCdvISLDOGmoJdH77IegcHs+qw/iaemgIKWIGCbbBnf2
	Pd4BhvpWA5bDSveMJwpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paACG-008AZ0-Ci; Thu, 09 Mar 2023 06:56:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paACD-008AXy-05; Thu, 09 Mar 2023 06:56:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id f18so1042813lfa.3;
        Wed, 08 Mar 2023 22:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678344970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psX2Kl9N0nkGxZU5txR5SzAm+jatIaIM8bmLNX2QD0U=;
        b=bIZ+WlW5/obmlMjDv3V6TEooL709jm9SJcRnOUjBOC4K5c9PeWZSuin/LLZjq54D5T
         wt4F6LIpGPf59PxgoJMemlUnFdRFlzXlgl+wSpqDhh7A+Mjqe7YEBUsXhplsJyOMC3/5
         1AjsR1X5x7J8bGnfNzfMC9rdrquNr5HhkEU753gawWh+RwohCCRJd3fk72MKq3sbrn5n
         0kojqphG234D3KDsCD4EQkfBbefqNXhNDOUhCek8sflcv45abOyOyGOhQqAtoF0Ogd4k
         8VW3DJlzKGZqq44dblxAo02/Hp8Sl6sgKvThnvJXIL/4IN7XF++t9PXqycKyH98STasW
         RXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678344970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psX2Kl9N0nkGxZU5txR5SzAm+jatIaIM8bmLNX2QD0U=;
        b=qgbaHDjj1iH8pGmBpbrXcGfXMbidDA/4YexdSQ+tcnJX55bQJqM4dUZ2oNOBpf14O8
         sErznswhUye1pWYpZyjzLFCXvqs/iAASpKEl6Hty+n5g/pasQ6IiKBbG713gVnCJ5ryi
         wNdX0AdOeKMZMOe1kANLVnTD3219DXZlnf4fBS5/fmYbIILhCuXbU4ub4c1HbCh7Djk1
         +KJkQ8Py7/TaR/xunWKxlrQ7UzKFH+Ac6Jv95OCiAODSPRg4/RiU5+9x4MOt90qV8nNu
         quC6+dgkJVGZA55omGzSagSmInEedm9Iaf6e1SXf+ieP+cWRMxlRu9+3sibUSy7aMKyp
         8DRw==
X-Gm-Message-State: AO0yUKW9o8GoEg9hGnu+nMd0JsCDjiCde/sFu6gf/5x5YEF3XP+ra0E4
	oH5ewDP+p0fAqOBNHqdaFJM=
X-Google-Smtp-Source: AK7set/1DASv6OgvWXWuj4ETN403kCbuKcvZ6CSfypbSgTKmVi+9rh0TXtBlOZRSUCf7NSlLDgA6Uw==
X-Received: by 2002:ac2:5dd9:0:b0:4cd:7fe0:24 with SMTP id x25-20020ac25dd9000000b004cd7fe00024mr5000383lfq.27.1678344969717;
        Wed, 08 Mar 2023 22:56:09 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id j15-20020a19f50f000000b004e7fa99f2b5sm2065557lfb.186.2023.03.08.22.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 22:56:09 -0800 (PST)
Message-ID: <930f3549-440d-adac-ae9d-1aa6ef07c44b@gmail.com>
Date: Thu, 9 Mar 2023 07:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2] nvmem: add explicit config option to read OF fixed
 cells
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
 linux-rtc@vger.kernel.org
References: <20230224072903.20945-1-zajec5@gmail.com>
 <20230308173256.3837b87b@xps-13>
 <91ff425b4c901648b1faf34c784f20ad@milecki.pl>
 <20230308190636.7fabab9c@xps-13>
 <5974d28426057975e701c4a8454b5a13@milecki.pl>
 <20230308193121.7f5b3d02@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230308193121.7f5b3d02@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_225613_093461_343C4FAF 
X-CRM114-Status: GOOD (  29.92  )
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

T24gOC4wMy4yMDIzIDE5OjMxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFJhZmHFgiwKPiAK
PiByYWZhbEBtaWxlY2tpLnBsIHdyb3RlIG9uIFdlZCwgMDggTWFyIDIwMjMgMTk6MTI6MzIgKzAx
MDA6Cj4gCj4+IE9uIDIwMjMtMDMtMDggMTk6MDYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBI
aSBSYWZhxYIsCj4+Pgo+Pj4gcmFmYWxAbWlsZWNraS5wbCB3cm90ZSBvbiBXZWQsIDA4IE1hciAy
MDIzIDE3OjU1OjQ2ICswMTAwOgo+Pj4gICAgCj4+Pj4gT24gMjAyMy0wMy0wOCAxNzozNCwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gSGkgUmFmYcWCLAo+Pj4+Pgo+Pj4+PiB6YWplYzVAZ21h
aWwuY29tIHdyb3RlIG9uIEZyaSwgMjQgRmViIDIwMjMgMDg6Mjk6MDMgKzAxMDA6Cj4+Pj4+ICAg
Cj4+Pj4+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Pj4+Pj4+
IE5WTUVNIHN1YnN5c3RlbSBsb29rcyBmb3IgZml4ZWQgTlZNRU0gY2VsbHMgKHNwZWNpZmllZCBp
biBEVCkgYnkKPj4+Pj4+IGRlZmF1bHQuIFRoaXMgYmVoYXZpb3VyIG1hZGUgc2Vuc2UgaW4gZWFy
bHkgZGF5cyBiZWZvcmUgYWRkaW5nIHN1cHBvcnQKPj4+Pj4+IGZvciBkeW5hbWljIGNlbGxzLgo+
Pj4+Pj4+PiBXaXRoIGV2ZXJ5IG5ldyBzdXBwb3J0ZWQgTlZNRU0gZGV2aWNlIHdpdGggZHluYW1p
YyBjZWxscyBjdXJyZW50Cj4+Pj4+PiBiZWhhdmlvdXIgYmVjb21lcyBub24tb3B0aW1hbC4gSXQg
cmVzdWx0cyBpbiB1bm5lZWRlZCBpdGVyYXRpbmcgb3ZlciA+PiBEVAo+Pj4+Pj4gbm9kZXMgYW5k
IG1heSByZXN1bHQgaW4gZmFsc2UgZGlzY292ZXJ5IG9mIGNlbGxzIChkZXBlbmRpbmcgb24gdXNl
ZCBEVAo+Pj4+Pj4gcHJvcGVydGllcykuCj4+Pj4+Pj4+IFRoaXMgYmVoYXZpb3VyIGhhcyBhY3R1
YWxseSBjYXVzZWQgYSBwcm9ibGVtIGFscmVhZHkgd2l0aCB0aGUgTVRECj4+Pj4+PiBzdWJzeXN0
ZW0uIE1URCBzdWJwYXJ0aXRpb25zIHdlcmUgaW5jb3JyZWN0bHkgdHJlYXRlZCBhcyBOVk1FTSBj
ZWxscy4KPj4+Pj4KPj4+Pj4gVGhhdCdzIHRydWUsIGJ1dCBJIGV4cGVjdCB0aGlzIHRvIGJlIHJl
YWxseSBNVEQgc3BlY2lmaWMuCj4+Pj4+Cj4+Pj4+IEEgY29uY3JldGUgcHJvcG9zYWwgYmVsb3cu
Cj4+Pj4+ICAgCj4+Pj4+PiBBbHNvIHdpdGggdXBjb21pbmcgc3VwcG9ydCBmb3IgTlZNRU0gbGF5
b3V0cyBubyBuZXcgYmluZGluZyBvciBkcml2ZXIKPj4+Pj4+IHNob3VsZCBzdXBwb3J0IGZpeGVk
IGNlbGxzIGRlZmluZWQgaW4gZGV2aWNlIG5vZGUuCj4+Pj4+Cj4+Pj4+IEknbSBub3Qgc3VyZSBJ
IGFncmVlIHdpdGggdGhpcyBzdGF0ZW1lbnQuIFdlIGFyZSBub3QgcHJldmVudGluZyBuZXcKPj4+
Pj4gYmluZGluZy9kcml2ZXIgdG8gdXNlIGZpeGVkIGNlbGxzLCBvci4uLj8gV2Ugb2ZmZXIgYSBu
ZXcgd2F5IHRvIGV4cG9zZQo+Pj4+PiBudm1lbSBjZWxscyB3aXRoIGFub3RoZXIgd2F5IHRoYW4g
ImZpeGVkLW9mZnNldCIgYW5kICJmaXhlZC1zaXplIiBPRgo+Pj4+PiBub2Rlcy4KPj4+Pj4+ICAg
RnJvbSB3aGF0IEkgdW5kZXJzdG9vZCBhbGwgbmV3IE5WTUVNIGJpbmRpbmdzIHNob3VsZCBoYXZl
IGNlbGxzID4+IGRlZmluZWQKPj4+PiBpbiB0aGUgbnZtZW0tbGF5b3V0IHsgfSBub2RlLiBUaGF0
J3Mgd2hhdCBJIG1lYW4gYnkgc2F5aW5nIHRoZXkgc2hvdWxkCj4+Pj4gbm90IGJlIGRlZmluZWQg
aW4gZGV2aWNlIG5vZGUgKGJ1dCBpdHMgIm52bWVtLWxheW91dCIgaW5zdGVhZCkuCj4+Pgo+Pj4g
TGF5b3V0cyBhcmUganVzdCBhbm90aGVyIHBvc3NpYmlsaXR5LCBlaXRoZXIgeW91IHVzZXIgdGhl
IG52bWVtLWNlbGxzCj4+PiBjb21wYXRpYmxlIGFuZCBwcm9kdWNlIG52bWVtIGNlbGxzIHdpdGgg
Zml4ZWQgT0Ygbm9kZXMsIG9yIHlvdSB1c2UgdGhlCj4+PiBudm1lbS1sYXlvdXQgY29udGFpbmVy
LiBJIGRvbid0IHRoaW5rIGFsbCBuZXcgYmluZGluZ3Mgc2hvdWxkIGhhdmUKPj4+IGNlbGxzIGlu
IGxheW91dHMuIEl0IGRlcGVuZHMgaWYgdGhlIGNvbnRlbnQgaXMgc3RhdGljIG9yIG5vdC4KPj4+
ICAgIAo+Pj4+Pj4gU29sdmUgdGhpcyBieSBtb2RpZnlpbmcgZHJpdmVycyBmb3IgYmluZGluZ3Mg
dGhhdCBzdXBwb3J0IHNwZWNpZnlpbmcKPj4+Pj4+IGZpeGVkIE5WTUVNIGNlbGxzIGluIERULiBN
YWtlIHRoZW0gZXhwbGljaXRseSB0ZWxsIE5WTUVNIHN1YnN5c3RlbSB0bwo+Pj4+Pj4gcmVhZCBj
ZWxscyBmcm9tIERULgo+Pj4+Pj4+PiBJdCB3YXNuJ3QgY2xlYXIgKHRvIG1lKSBpZiBydGMgYW5k
IHcxIGNvZGUgYWN0dWFsbHkgdXNlcyBmaXhlZCBjZWxscy4gPj4gSQo+Pj4+Pj4gZW5hYmxlZCB0
aGVtIHRvIGRvbid0IHJpc2sgYW55IGJyZWFrYWdlLgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Pj4+PiBbZm9yIGRyaXZlcnMvbnZt
ZW0vbWVzb24te2VmdXNlLG14LWVmdXNlfS5jXQo+Pj4+Pj4gQWNrZWQtYnk6IE1hcnRpbiBCbHVt
ZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4+Pj4+PiAtLS0K
Pj4+Pj4+IFYyOiBGaXggc3RtMzItcm9tZW0uYyB0eXBvIGJyZWFraW5nIGl0cyBjb21waWxhdGlv
bgo+Pj4+Pj4gICAgICBQaWNrIE1hcnRpbidzIEFja2VkLWJ5Cj4+Pj4+PiAgICAgIEFkZCBwYXJh
Z3JhcGggYWJvdXQgbGF5b3V0cyBkZXByZWNhdGluZyB1c2VfZml4ZWRfb2ZfY2VsbHMKPj4+Pj4+
IC0tLQo+Pj4+Pj4gICBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICAgICAgICAgfCAyICsrCj4+Pj4+
PiAgIGRyaXZlcnMvbnZtZW0vYXBwbGUtZWZ1c2VzLmMgICB8IDEgKwo+Pj4+Pj4gICBkcml2ZXJz
L252bWVtL2NvcmUuYyAgICAgICAgICAgfCA4ICsrKysrLS0tCj4+Pj4+PiAgIGRyaXZlcnMvbnZt
ZW0vaW14LW9jb3RwLXNjdS5jICB8IDEgKwo+Pj4+Pj4gICBkcml2ZXJzL252bWVtL2lteC1vY290
cC5jICAgICAgfCAxICsKPj4+Pj4+ICAgZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5jICAgIHwg
MSArCj4+Pj4+PiAgIGRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1c2UuYyB8IDEgKwo+Pj4+Pj4g
ICBkcml2ZXJzL252bWVtL21pY3JvY2hpcC1vdHBjLmMgfCAxICsKPj4+Pj4+ICAgZHJpdmVycy9u
dm1lbS9tdGstZWZ1c2UuYyAgICAgIHwgMSArCj4+Pj4+PiAgIGRyaXZlcnMvbnZtZW0vcWNvbS1z
cG1pLXNkYW0uYyB8IDEgKwo+Pj4+Pj4gICBkcml2ZXJzL252bWVtL3FmcHJvbS5jICAgICAgICAg
fCAxICsKPj4+Pj4+ICAgZHJpdmVycy9udm1lbS9yYXZlLXNwLWVlcHJvbS5jIHwgMSArCj4+Pj4+
PiAgIGRyaXZlcnMvbnZtZW0vcm9ja2NoaXAtZWZ1c2UuYyB8IDEgKwo+Pj4+Pj4gICBkcml2ZXJz
L252bWVtL3NjMjd4eC1lZnVzZS5jICAgfCAxICsKPj4+Pj4+ICAgZHJpdmVycy9udm1lbS9zcHJk
LWVmdXNlLmMgICAgIHwgMSArCj4+Pj4+PiAgIGRyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYyAg
ICB8IDEgKwo+Pj4+Pj4gICBkcml2ZXJzL252bWVtL3N1bnBsdXMtb2NvdHAuYyAgfCAxICsKPj4+
Pj4+ICAgZHJpdmVycy9udm1lbS9zdW54aV9zaWQuYyAgICAgIHwgMSArCj4+Pj4+PiAgIGRyaXZl
cnMvbnZtZW0vdW5pcGhpZXItZWZ1c2UuYyB8IDEgKwo+Pj4+Pj4gICBkcml2ZXJzL252bWVtL3p5
bnFtcF9udm1lbS5jICAgfCAxICsKPj4+Pj4+ICAgZHJpdmVycy9ydGMvbnZtZW0uYyAgICAgICAg
ICAgIHwgMSArCj4+Pj4+PiAgIGRyaXZlcnMvdzEvc2xhdmVzL3cxX2RzMjUweC5jICB8IDEgKwo+
Pj4+Pj4gICBpbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmggfCAyICsrCj4+Pj4+PiAgIDIz
IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMgYi9kcml2ZXJzL210ZC9tdGRjb3Jl
LmMKPj4+Pj4+IGluZGV4IDBmZWFjYjlmYmRhYy4uMWJiNDc5YzBmNzU4IDEwMDY0NAo+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9tdGRj
b3JlLmMKPj4+Pj4+IEBAIC01MjMsNiArNTIzLDcgQEAgc3RhdGljIGludCBtdGRfbnZtZW1fYWRk
KHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+Pj4+Pj4gICAJY29uZmlnLmRldiA9ICZtdGQtPmRldjsK
Pj4+Pj4+ICAgCWNvbmZpZy5uYW1lID0gZGV2X25hbWUoJm10ZC0+ZGV2KTsKPj4+Pj4+ICAgCWNv
bmZpZy5vd25lciA9IFRISVNfTU9EVUxFOwo+Pj4+Pj4gKwljb25maWcudXNlX2ZpeGVkX29mX2Nl
bGxzID0gb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobm9kZSwgPj4gIm52bWVtLWNlbGxzIik7Cj4+
Pj4+Cj4+Pj4+IEkgYW0gd29uZGVyaW5nIGhvdyBtdGQgc3BlY2lmaWMgdGhpcyBpcz8gRm9yIG1l
IGFsbCBPRiBub2RlcyBjb250YWluaW5nCj4+Pj4+IHRoZSBudm1lbS1jZWxscyBjb21wYXRpYmxl
IHNob3VsZCBiZSB0cmVhdGVkIGFzIGNlbGxzIHByb3ZpZGVycyBhbmQKPj4+Pj4gcG9wdWxhdGUg
bnZtZW0gY2VsbHMgYXMgZm9yIGVhY2ggY2hpbGRyZW4uCj4+Pj4+Cj4+Pj4+IFdoeSBkb24ndCB3
ZSBqdXN0IGNoZWNrIGZvciB0aGlzIGNvbXBhdGlibGUgdG8gYmUgcHJlc2VudD8gaW4KPj4+Pj4g
bnZtZW1fYWRkX2NlbGxzX2Zyb21fb2YoKSA/IEFuZCBpZiBub3Qgd2UganVzdCBza2lwIHRoZSBv
cGVyYXRpb24uCj4+Pj4+Cj4+Pj4+IFRoaXMgd2F5IHdlIHN0aWxsIGZvbGxvdyB0aGUgYmluZGlu
Z3MgKGV2ZW4gdGhvdWdoIHVzaW5nIG52bWVtLWNlbGxzIGluCj4+Pj4+IHRoZSBjb21wYXRpYmxl
IHByb3BlcnR5IHRvIHJlcXVpcmUgY2VsbHMgcG9wdWxhdGlvbiB3YXMgYSBtaXN0YWtlIGluCj4+
Pj4+IHRoZSBmaXJzdCBwbGFjZSwgYXMgZGlzY3Vzc2VkIGluIHRoZSBkZXZsaW5rIHRocmVhZCBy
ZWNlbnRseSkgYnV0IHRoZXJlCj4+Pj4+IGlzIG5vIG5lZWQgZm9yIGEgcGVyLWRyaXZlciBjb25m
aWcgb3B0aW9uPwo+Pj4+Pj4gVGhpcyBpc24ndCBtdGQgc3BlY2lmaWMuIFBsZWFzZSBjaGVjayB0
aGlzIHBhdGNoIGZvciBhbGwgb2NjdXJyZW5jZXMgPj4gb2YKPj4+PiB0aGU6Cj4+Pj4gdXNlX2Zp
eGVkX29mX2NlbGxzID0gdHJ1ZQo+Pj4+Pj4gVGhlIHZlcnkgZmlyc3Qgb25lOiBkcml2ZXJzL252
bWVtL2FwcGxlLWVmdXNlcy5jIGRyaXZlciBmb3IgdGhlCj4+Pj4gImFwcGxlLGVmdXNlcyIgYmlu
ZGluZy4gVGhhdCBiaW5kaW5nIHN1cHBvcnRzIGZpeGVkIE9GIGNlbGxzLCBzZWU6Cj4+Pj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2FwcGxlLGVmdXNlcy55YW1sCj4+
Pgo+Pj4gSSdtIHNheWluZzogYmFzZWQgb24gd2hhdCBoYXMgYmVlbiBlbmZvcmNlZCBzbyBmYXIs
IEkgd291bGQgZXhwZWN0IGFsbAo+Pj4gZml4ZWQgY2VsbCBwcm92aWRlcnMgdG8gY29tZSB3aXRo
IG52bWVtLWNlbGxzIGFzIGNvbXBhdGlibGUsIG5vPwo+Pj4KPj4+IElmIHRoYXQncyB0aGUgY2Fz
ZSB3ZSBjb3VsZCB1c2UgdGhhdCBhcyBhIGNvbW1vbiBkZW5vbWluYXRvcj8KPj4KPj4gU29ycnks
IEkgZG9uJ3QgZ2V0IGl0LiBIYXZlIHlvdSBjaGVja2VkCj4+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udm1lbS9hcHBsZSxlZnVzZXMueWFtbAo+PiA/Cj4+Cj4+IEl0J3MgYSBO
Vk1FTSBwcm92aWVkIGJpbmRpbmcgd2l0aCBmaXhlZCBjZWxscyB0aGF0IGRvZXNuJ3QgdXNlCj4+
IG52bWVtLWNlbGxzIGFzIGNvbXBhdGlibGUuIFRoZXJlIGFyZSBtYW55IG1vcmUuCj4gCj4gT2gg
eWVhaCB5b3UncmUgcmlnaHQsIEknbSBtaXhpbmcgdGhpbmdzLiBXZWxsIEkgZ3Vlc3MgeW91J3Jl
IHJpZ2h0Cj4gdGhlbiwgaXQncyBzdWNoIGEgbWVzcywgd2UgaGF2ZSB0byB0ZWxsIHRoZSBjb3Jl
IHRoZSBwYXJzaW5nIG1ldGhvZC4KPiAKPiBTbyBtYXliZSBhbm90aGVyIHF1ZXN0aW9uOiBkbyB3
ZSBoYXZlIG90aGVyIHNpdHVhdGlvbnMgdGhhbiBtdGQgd2hpY2gKPiBzb21ldGltZXMgZXhwZWN0
IHRoZSBudm1lbSBjb3JlIHRvIHBhcnNlIHRoZSBPRiBub2RlcyB0byBwb3B1bGF0ZSBjZWxscywK
PiBhbmQgc29tZXRpbWVzIG5vdD8KCkknbSBub3QgYXdhcmUgb2YgdGhhdC4gUGxlYXNlIGFsc28g
Y2hlY2sgbXkgcGF0Y2guIFRoZSBvbmx5IGNhc2UgSSBzZXQKInVzZV9maXhlZF9vZl9jZWxscyIg
Y29uZGl0aW9uYWxseSBpcyBtdGQgY29kZS4gSW4gb3RoZXIgY2FzZXMgaXQncwpoYXJkY29kZWQg
dG8gInRydWUiLgoKCj4gQWxzbywgd2hhdCBhYm91dCAib2ZfY2hpbGRyZW5fYXJlX2NlbGxzIiA/
IEJlY2F1c2UgYWN0dWFsbHkgaW4gbW9zdAo+IGNhc2VzIGl0J3MgYSAiZml4ZWQgb2YgY2VsbCIs
IHNvIEkgZG9uJ3QgZmluZCB0aGUgY3VycmVudCBuYW1pbmcKPiBkZXNjcmlwdGl2ZSBlbm91Z2gg
Zm9yIHNvbWV0aGluZyBzbyB0b3VjaHkuCgpUaGF0IHdvdWxkIGJlIGp1c3QgaW5jb3JyZWN0IGJl
Y2F1c2UgdGhpcyBuZXcgY29uZmlnIHByb3BlcnR5CigidXNlX2ZpeGVkX29mX2NlbGxzIikgaXMg
b25seSBhYm91dCBGSVhFRCBjZWxscy4KClRoZXJlIGFyZSBjYXNlcyBvZiBPRiBjaGlsZHJlbiBi
ZWluZyBjZWxscyBidXQgTk9UIGJlaW5nIGZpeGVkIGNlbGxzLgpUaGV5IHNob3VsZCBOT1QgYmUg
cGFyc2VkIGJ5IHRoZSBudm1lbV9hZGRfY2VsbHNfZnJvbV9vZigpLgoKRXhhbXBsZToKYTYwN2E4
NTBiYTFmICgiZHQtYmluZGluZ3M6IG52bWVtOiB1LWJvb3QsZW52OiBhZGQgYmFzaWMgTlZNRU0g
Y2VsbHMiKQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1hNjA3YTg1MGJhMWZhOTY2Y2JiMDM1NTQ0YzE1
ODhlMjRhNjMwN2RmCgpTbyB0aGF0IHdvdWxkIHJlc3VsdCBpbiBVLUJvb3QgZW52OgoxLiBIYXZp
bmcgT0YgY2hpbGRyZW4gbm9kZXMgYmVpbmcgY2VsbHMKMi4gU2V0dGluZyAib2ZfY2hpbGRyZW5f
YXJlX2NlbGxzIiB0byBmYWxzZSAoY291bnRlci1pbnR1aXRpdmUpIHRvIGF2b2lkIG52bWVtX2Fk
ZF9jZWxsc19mcm9tX29mKCkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
