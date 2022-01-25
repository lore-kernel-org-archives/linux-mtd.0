Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2869AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41h83FdZwaDs3RRFfLxHpb2HnjYG+xoI/fNw/KXb+xc=; b=Fzne8CnIF28usZ
	yxFHOprctagrtjz9cjEGS9elV5CKm1rcJHbtLXpisGUoxNBWp9xhG1sMX3NIypkH1UPV6TETVQ1oo
	FkOemfvfaNICsYRlbPMmx1RlqNgSYeptfhqWtIEnL+gd+p6D3pZ33d0McKno3F8kVXzzcPVw0lHES
	yyGx+8cP50Rm9YS7pVQtuNpAVqAQGkPTkP21c+VlTMKX6GnE5a1V6tl4VdcBSeRriXWYB8IAbU6u3
	Z4deRtGG8aiRHaps2MfgB/Ke/Y1Q/ipQVXH1Lonwo/apzMQTyOIB02L30jDf9Sae040WVN6RrVLsh
	yLNksyp8GBu8+0zzJTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCQ9X-0098zV-JJ; Tue, 25 Jan 2022 18:02:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCQ9T-0098xH-Iq; Tue, 25 Jan 2022 18:02:45 +0000
Received: by mail-lf1-x12c.google.com with SMTP id x7so58273316lfu.8;
 Tue, 25 Jan 2022 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQZEWLVjW3YrjRzePnAkpJ5fQMVb6UDAvzsIkL2SRjE=;
 b=SuNbqnWPzFlOJ670/rx6ivjeSBcGvnu+a5DfiEsSE7uFv8zJvo207gFnL0JipeAI/Q
 zqDyZHdVYvs/YDd6xNv5AqpcRcDF4+ulX8seHrzLdNt0NzGgcAKZ3zaVedkG1604kHah
 flXTgZ1tObxwKfmdg5YstW2xWQ2goSI6G5WD8Go/5bUQOTQ4nOfCE39ZhgVs3yUxr/EE
 t/dmUknXbkKuKSRrt6/w4cEeZZDG88ShgMXOxgxBMU2jtyfuPVAV1pXDeHk8iJfKgD/Y
 bPJS/fM8IVeKqwBduETRbseg/zkjIW+wMBtzFLXJvNR8qbUSTGDYxvP/h/+/nSUbHDU/
 YOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xQZEWLVjW3YrjRzePnAkpJ5fQMVb6UDAvzsIkL2SRjE=;
 b=eoWoaaEPojSa4/4acaH2VpUm9JVPALTy/4Gx8FHNp9wMeUo2BKNe64rXcN/QZJNvXU
 rrb9T7dkumdWc+yjGxaUuPHKisvsygbYoWnaT+oPoJFLzi5XDkrSQirSVSGVKGKDkxM9
 lEOsX8519Q/7PX6qVy1WsdhEPFu3UJXHF5t6PyqtivSS+x3kOipNdNINInxl+5yuFzf+
 fdPttDMvdGqP6cNALVOteD9HzozvXT5rpAL35hHOzAHnFYi5ZCNz4XPxnyocRGdFTklh
 b56b2HZCAKhh3DPjkbff7W4uVaJ4EIivc3pb0pX0tiWwM3TVdlayp34yxKn3dsAREv+Y
 3aSQ==
X-Gm-Message-State: AOAM531CH0l/gM7dUUcN8yrSmk8zFZJN40joLE2+/7nRGQmAl1wy+AwY
 f8qY4t3K4R4ye0VZM8iIMoc=
X-Google-Smtp-Source: ABdhPJzXQHBy23+18Vv7UseStSyjXEJqrlfYdu2UOaAlwGO+9xA/n9sx3s2ZN2JcmPTM8PtQ6/q1Zg==
X-Received: by 2002:a05:6512:11e2:: with SMTP id
 p2mr17974341lfs.580.1643133761576; 
 Tue, 25 Jan 2022 10:02:41 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id z24sm1149121lfb.206.2022.01.25.10.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 10:02:41 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] dt-bindings: nvmem: cells: add MAC address cell
Date: Tue, 25 Jan 2022 19:01:14 +0100
Message-Id: <20220125180114.12286-3-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125180114.12286-1-zajec5@gmail.com>
References: <20220125180114.12286-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_100243_692943_9C998BCE 
X-CRM114-Status: GOOD (  14.81  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBhZGRzIHN1cHBv
cnQgZm9yIGRlc2NyaWJpbmcgZGV0YWlscyBvZiBOVk1FTSBjZWxsIGNvbnRhaW5pbmcgTUFDCmFk
ZHJlc3MuIFRob3NlIGFyZSBvZnRlbiBkZXZpY2Ugc3BlY2lmaWMgYW5kIGNvdWxkIGJlIG5pY2Vs
eSBzdG9yZWQgaW4KRFQuCgpJbml0aWFsIGRvY3VtZW50YXRpb24gaW5jbHVkZXMgc3VwcG9ydCBm
b3IgZGVzY3JpYmluZzoKMS4gQ2VsbCBkYXRhIGZvcm1hdCAoZS5nLiBCcm9hZGNvbSdzIE5WUkFN
IHVzZXMgQVNDSUkgdG8gc3RvcmUgTUFDKQoyLiBSZXZlcnNlZCBieXRlcyBmbGFzaCAocmVxdWly
ZWQgZm9yIGkuTVg2L2kuTVg3IE9DT1RQIHN1cHBvcnQpCjMuIFNvdXJjZSBmb3IgbXVsdGlwbGUg
YWRkcmVzc2VzICh2ZXJ5IGNvbW1vbiBpbiBob21lIHJvdXRlcnMpCgpTaWduZWQtb2ZmLWJ5OiBS
YWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Ci0tLQogLi4uL2JpbmRpbmdzL252bWVt
L2NlbGxzL21hYy1hZGRyZXNzLnlhbWwgICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vY2VsbHMvbWFjLWFkZHJlc3MueWFtbAoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxs
cy9tYWMtYWRkcmVzcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252
bWVtL2NlbGxzL21hYy1hZGRyZXNzLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5mOGQxOWU4N2NkZjAKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vY2VsbHMvbWFjLWFkZHJlc3MueWFtbApAQCAtMCww
ICsxLDk0IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9udm1lbS9jZWxscy9tYWMtYWRkcmVzcy55YW1sIworJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBOVk1FTSBjZWxsIGNv
bnRhaW5pbmcgYSBNQUMgYWRkcmVzcworCittYWludGFpbmVyczoKKyAgLSBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAg
Y29uc3Q6IG1hYy1hZGRyZXNzCisKKyAgZm9ybWF0OgorICAgIGRlc2NyaXB0aW9uOiB8CisgICAg
ICBTb21lIE5WTUVNIGNlbGxzIGNvbnRhaW4gTUFDIGluIGEgbm9uLWJpbmFyeSBmb3JtYXQuCisK
KyAgICAgIEFTQ0lJIHNob3VsZCBiZSBzcGVjaWZpZWQgaWYgTUFDIGlzIHN0cmluZyBmb3JtYXR0
ZWQgbGlrZToKKyAgICAgIC0gIjAxOjIzOjQ1OjY3Ojg5OkFCIiAoMzAgMzEgM2EgMzIgMzMgM2Eg
MzQgMzUgM2EgMzYgMzcgM2EgMzggMzkgM2EgNDEgNDIpCisgICAgICAtICIwMS0yMy00NS02Ny04
OS1BQiIKKyAgICAgIC0gIjAxMjM0NTY3ODlBQiIKKyAgICBlbnVtOgorICAgICAgLSBhc2NpaQor
CisgIHJldmVyc2VkLWJ5dGVzOgorICAgIHR5cGU6IGJvb2xlYW4KKyAgICBkZXNjcmlwdGlvbjog
fAorICAgICAgTUFDIGlzIHN0b3JlZCBpbiByZXZlcnNlZCBieXRlcyBvcmRlci4gRXhhbXBsZToK
KyAgICAgIFN0b3JlZCB2YWx1ZTogQUIgODkgNjcgNDUgMjMgMDEKKyAgICAgIEFjdHVhbCBNQUM6
IDAxIDIzIDQ1IDY3IDg5IEFCCisKKyAgYmFzZS1hZGRyZXNzOgorICAgIHR5cGU6IGJvb2xlYW4K
KyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgTWFya3MgTlZNRU0gY2VsbCBhcyBwcm92aWRlciBv
ZiBtdWx0aXBsZSBhZGRyZXNzZXMgdGhhdCBhcmUgcmVsYXRpdmUgdG8KKyAgICAgIHRoZSBvbmUg
YWN0dWFsbHkgc3RvcmVkIHBoeXNpY2FsbHkuIFJlc3BlY3RpdmUgYWRkcmVzc2VzIGNhbiBiZSBy
ZXF1ZXN0ZWQKKyAgICAgIGJ5IHNwZWNpZnlpbmcgY2VsbCBpbmRleCBvZiBOVk1FTSBjZWxsLgor
CithbGxPZjoKKyAgLSAkcmVmOiBjZWxsLnlhbWwjCisgIC0gaWY6CisgICAgICByZXF1aXJlZDoK
KyAgICAgICAgLSBiYXNlLWFkZHJlc3MKKyAgICB0aGVuOgorICAgICAgcHJvcGVydGllczoKKyAg
ICAgICAgIiNudm1lbS1jZWxsLWNlbGxzIjoKKyAgICAgICAgICBjb25zdDogMQorICAgICAgcmVx
dWlyZWQ6CisgICAgICAgIC0gIiNudm1lbS1jZWxsLWNlbGxzIgorCit1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICBwYXJ0aXRpb25zIHsKKyAgICAg
ICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHBhcnRpdGlv
bkBmMDAwMDAgeworICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJudm1lbS1jZWxscyI7CisgICAg
ICAgICAgICBsYWJlbCA9ICJjYWxpYnJhdGlvbiI7CisgICAgICAgICAgICByZWcgPSA8MHhmMDAw
MDAgMHgxMDAwMDA+OworICAgICAgICAgICAgcmFuZ2VzID0gPDAgMHhmMDAwMDAgMHgxMDAwMDA+
OworICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAjc2l6ZS1j
ZWxscyA9IDwxPjsKKworICAgICAgICAgICAgbWFjQDEwMCB7CisgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJtYWMtYWRkcmVzcyI7CisgICAgICAgICAgICAgICAgcmVnID0gPDB4MTAwIDB4
Nj47CisgICAgICAgICAgICB9OworCisgICAgICAgICAgICBtYWNAMjAwIHsKKyAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gIm1hYy1hZGRyZXNzIjsKKyAgICAgICAgICAgICAgICByZWcgPSA8
MHgyMDAgMHg2PjsKKyAgICAgICAgICAgICAgICByZXZlcnNlZC1ieXRlczsKKyAgICAgICAgICAg
IH07CisKKyAgICAgICAgICAgIG1hY0AzMDAgeworICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAibWFjLWFkZHJlc3MiOworICAgICAgICAgICAgICAgIHJlZyA9IDwweDMwMCAweDExPjsKKyAg
ICAgICAgICAgICAgICBmb3JtYXQgPSAiYXNjaWkiOworICAgICAgICAgICAgfTsKKworICAgICAg
ICAgICAgbWFjQDQwMCB7CisgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtYWMtYWRkcmVz
cyI7CisgICAgICAgICAgICAgICAgcmVnID0gPDB4NDAwIDB4Nj47CisgICAgICAgICAgICAgICAg
YmFzZS1hZGRyZXNzOworICAgICAgICAgICAgICAgICNudm1lbS1jZWxsLWNlbGxzID0gPDE+Owor
ICAgICAgICAgICAgfTsKKyAgICAgICAgfTsKKyAgICB9OwotLSAKMi4zMS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
