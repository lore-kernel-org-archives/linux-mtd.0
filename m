Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93E6C61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isQiMVWBBuoiIaUqflkU58LcxYIC04IFGKlg71PjGs0=; b=jDav9Z4rQ5etwi
	pHFxKj0oZfL8Vjpih1CzpRrb/IZNonRSpj5H/eULrgpO0jOaZ6S8e6oe0tteONIxhZtgsZyNnKeeb
	VQXejrYcjJDR4fuwUfux+lm32BKLpVhbnGOSm4Qpg0KRlqyvdpEg7VoZDrcXCOv/sxCkip0c44r4v
	7VP9VnHsKp85oPDNNvSoraHcHq/N6AtjxLGfMjXp1FfQL1sLlGU3rxT8OwaZ6c06GyJ8yGtyew0aQ
	Yo4fQk5PeWVw4cXW08DocsGukk7ApKPHA244h3GR+H/h0YOEf9jkmCdNKRERUadxJTkDgjPdRexGC
	BH3V0mGi8vcjouSKzmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paF0M-009lwu-2t; Thu, 09 Mar 2023 12:04:18 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paExc-009kJZ-3K; Thu, 09 Mar 2023 12:01:29 +0000
Received: by mail-lj1-x235.google.com with SMTP id by8so1549422ljb.7;
        Thu, 09 Mar 2023 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678363283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4GSqIKfh+fPPQrFXuCrH3ba1s5AAafXmlJ7Rizwh8Y=;
        b=PKXkA4WiA8duFtEJwBSGgeMQh5pTE1KoLqyioyMj57ImMT8E5tzaJa8Cezr5Ac+udB
         dohArEBcvlwsvfpPY/VkRXG5pxCBioA5v30rcjLDCviR5gJkkP+XEeaxVWr0R1GXSFvu
         mY8AgbmcW96ld6ZTFuaKaIVYvXqY/NhH4+SN/hXF64q2DtSBpOxlBJylrbxJP0DtVtbJ
         TcNfMSR8WLEoUXOdxw7vbbTtl0ApDDk2b+AAUsrOlX0v292IdbqAfhmHmtHrqnLZPbyl
         GnohTfVo+Y+Anb2hVBX+PfQYYZpSMgOXg1CmZBureC9Z8PeQccZB2IijuNg/SeGIYztr
         dS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678363283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J4GSqIKfh+fPPQrFXuCrH3ba1s5AAafXmlJ7Rizwh8Y=;
        b=5LvfquWEbTQKKsBrP5sSp0xzmLvr8JHlMagWWPT6520el9epeA7Xulj3l373se0S5B
         5/p4eYLVicRERO+cq/VxCyV/+935T7T558DsibkqdNs9miKVhRWIJX7kx66h4L2fsABE
         lRldzofBro7vOdtlVFaWWxVzItdbGZ7e5pgGy66PkAO98o0L01TWtjHiYhpx7tK9lWwq
         EdYXhURDxrfWVxXCoADP+p88QfDCR6v09unKBibunaak95f2m1OcZXbwSumy22MYiERj
         vJ2aGpkdHySyNmSCvf795k5y41aZbmfmWSZ+fBa/DFSj1SUbdDQyEJQUXMDYVSRw++3d
         4ulA==
X-Gm-Message-State: AO0yUKWVp8I4sNy1VGfKX7sqifBhLWQ4kqvDsvPcVZ3+oBlZThfywPle
	Aha87LfakmL98PmXqJFZg1o=
X-Google-Smtp-Source: AK7set+NMF/8gy2PgvVPpR4O7pSBLhYbUzPDmj5xP0+SqTAcGzlCByQXPVnKs759lKsD9WYcfwK9nw==
X-Received: by 2002:a05:651c:b1f:b0:290:4d4b:481f with SMTP id b31-20020a05651c0b1f00b002904d4b481fmr7275446ljr.16.1678363283077;
        Thu, 09 Mar 2023 04:01:23 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id s2-20020a2e98c2000000b002934fce87bfsm2846420ljj.108.2023.03.09.04.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 04:01:22 -0800 (PST)
Message-ID: <e845b38c-d0eb-716c-dc51-b89582750f07@gmail.com>
Date: Thu, 9 Mar 2023 13:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3] nvmem: add explicit config option to read OF fixed
 cells
To: Miquel Raynal <miquel.raynal@bootlin.com>
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
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230309112028.19215-1-zajec5@gmail.com>
 <20230309123513.43b7134f@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20230309123513.43b7134f@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_040128_237514_B56B45FD 
X-CRM114-Status: GOOD (  23.93  )
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

T24gOS4wMy4yMDIzIDEyOjM1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9udm1lbS1wcm92aWRlci5oIGIvaW5jbHVkZS9saW51eC9udm1lbS1wcm92
aWRlci5oCj4+IGluZGV4IDAyNjJiODYxOTRlYi4uYjNjMTRjZTg3YTY1IDEwMDY0NAo+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9u
dm1lbS1wcm92aWRlci5oCj4+IEBAIC03Myw2ICs3Myw3IEBAIHN0cnVjdCBudm1lbV9jZWxsX2lu
Zm8gewo+PiAgICAqIEBvd25lcjoJUG9pbnRlciB0byBleHBvcnRlciBtb2R1bGUuIFVzZWQgZm9y
IHJlZmNvdW50aW5nLgo+PiAgICAqIEBjZWxsczoJT3B0aW9uYWwgYXJyYXkgb2YgcHJlLWRlZmlu
ZWQgTlZNRU0gY2VsbHMuCj4+ICAgICogQG5jZWxsczoJTnVtYmVyIG9mIGVsZW1lbnRzIGluIGNl
bGxzLgo+PiArICogQHVzZV9maXhlZF9vZl9jZWxsczoJUmVhZCBmaXhlZCBOVk1FTSBjZWxscyBm
cm9tIE9GLgo+IAo+IEknbSBzdGlsbCB1bmhhcHB5IHdpdGggdGhlIG5hbWluZywgZXNwZWNpYWxs
eSBzaW5jZSB5b3UgZXhwbGFpbmVkIGluCj4gbW9yZSBkZXRhaWxzIHRoZSB3aG9sZSBwbGFuIHdo
aWNoIGludm9sdmVzIHVzaW5nIGEgY29udGFpbmVyIHRvIHB1dAo+IHRoZXNlIGZpeGVkIGNlbGxz
IGZyb20gbm93IG9uLiBJbiBib3RoIGNhc2VzIHlvdSBleHRyYWN0IGNlbGxzIGZyb20KPiBmaXhl
ZCBPRiBub2RlcyBidXQgdGhpcyBib29sZWFuIG5lZWRzIHRvIGJlIHNldCB0byB0cnVlIGluIG9u
ZQo+IGNhc2UsIGFuZCBmYWxzZSBpbiB0aGUgb3RoZXIsIHdoaWNoIHdvdWxkIG5vdCBtYWtlIHNl
bnNlLgo+IAo+IEFsc28sIHJlZ2FyZGluZyB0aGUgYmluZGluZ3MgY2hhbmdlcywgSSdtIGZhaXJs
eSBoYXBweSB3aXRoIHRoZSBpZGVhLAo+IGJ1dCBpZiB3ZSBnbyB0aGlzIHdheSBJIHdvdWxkIHBy
ZWZlciBhIGZ1bGwgc2VyaWVzIGluc3RlYWQgb2YKPiBpbmRpdmlkdWFsIGNoYW5nZXMgd2l0aDoK
PiAKPiAtIHRoZSBib29sZWFuIHlvdSBpbnRyb2R1Y2UgaGVyZSAocmVuYW1lZCwgYXQgdGhlIHZl
cnkgbGVhc3QpCj4gLSB0aGUgbmV3IGJpbmRpbmdzCgpJIGFzc3VtZSB5b3UgbWVhbiBmaXhlZC1s
YXlvdXQueWFtbD8KCgo+IC0gdGhlIHVwZGF0ZSBvZiB0aGUgY3VycmVudCBwcm92aWRlciBiaW5k
aW5ncyB0byB0YWtlIHRoZSBuZXcgYmluZGluZ3MKPiAgICBpbnRvIGFjY291bnQgYW5kIGRlcHJl
Y2F0ZSB0aGUgb2xkIG9uZXMgb2ZmaWNpYWxseQoKV2hhdCBoYXMgdG8gYmUgdXBkYXRlZCBpbiBj
dXJyZW50IHByb2NlZHM/IEl0IHNlZW1zIHRvIG1lIHRoYXQ6CjEuIEN1cnJlbnQgTlZNRU0gcHJv
dmlkZXJzIHJlZmVyZW5jZSBudm1lbS55YW1sCjIuIG52bWVtLnlhbWwgcmVmZXJlbmNlcyBudm1l
bS1sYXlvdXQueWFtbAozLiBudm1lbS1sYXlvdXQueWFtbCByZWZlcmVuY2VzIGZpeGVkLWxheW91
dC55YW1sCgp3aGF0IGVsc2UgaXMgbWlzc2luZz8KCgo+IC0gc3VwcG9ydCBmb3IgdGhlIG5ldyBi
aW5kaW5ncyBpbiB0aGUgY29yZQoKUGxlYXNlLCBkb24ndCBnZXQgbWUgd3JvbmcsIGJ1dCBJJ20g
bm90IGdvaW5nIHRvIHNwZW5kIG1vcmUgaG91cnMgb24KYWN0dWFsIGNvZGluZyB3aXRob3V0IGFw
cHJvdmFsIG9mIGNob3NlbiBwYXRoLgoKSSdsbCBuZWVkIHRvIGhhdmUKW1BBVENIIFYyXSBkdC1i
aW5kaW5nczogbnZtZW06IGxheW91dHM6IGFkZCBmaXhlZC1sYXlvdXQKcmV2aWV3ZWQvYWNrZWQg
Zmlyc3QuIElmIHlvdSBjYW4gZG8gdGhhdCB0aGF0J3MgZ3JlYXQuCgoKPj4gICAgKiBAa2VlcG91
dDoJT3B0aW9uYWwgYXJyYXkgb2Yga2VlcG91dCByYW5nZXMgKHNvcnRlZCBhc2NlbmRpbmcgYnkg
c3RhcnQpLgo+PiAgICAqIEBua2VlcG91dDoJTnVtYmVyIG9mIGVsZW1lbnRzIGluIHRoZSBrZWVw
b3V0IGFycmF5Lgo+PiAgICAqIEB0eXBlOglUeXBlIG9mIHRoZSBudm1lbSBzdG9yYWdlCj4+IEBA
IC0xMDMsNiArMTA0LDcgQEAgc3RydWN0IG52bWVtX2NvbmZpZyB7Cj4+ICAgCXN0cnVjdCBtb2R1
bGUJCSpvd25lcjsKPj4gICAJY29uc3Qgc3RydWN0IG52bWVtX2NlbGxfaW5mbwkqY2VsbHM7Cj4+
ICAgCWludAkJCW5jZWxsczsKPj4gKwlib29sCQkJdXNlX2ZpeGVkX29mX2NlbGxzOwo+PiAgIAlj
b25zdCBzdHJ1Y3QgbnZtZW1fa2VlcG91dCAqa2VlcG91dDsKPj4gICAJdW5zaWduZWQgaW50CQlu
a2VlcG91dDsKPj4gICAJZW51bSBudm1lbV90eXBlCQl0eXBlOwo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
