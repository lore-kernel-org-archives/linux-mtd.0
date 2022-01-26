Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB183C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41h83FdZwaDs3RRFfLxHpb2HnjYG+xoI/fNw/KXb+xc=; b=GlHdJUCk7OvdYE
	BHtL7yPluZxAf4WBnX0KD51gRZoaoY1idTajsTdJj4Gn47Y3JkMVl2wJD9kbKkMaCntHiD+tGBp69
	N4S7EJs4paep/Sa45bos5DdnlpsnPsit/3mXDMVhl9xxGr/Pe4hGhRJ3fezKo3H3AK88zz+LRMzHv
	P2WrdeCZUQUJDQpGB3mkmsUUw14X3Z3qH9jKtwiHCJCVSCEN19KS5WtDe6NrvOzh5r7HwJN6+/Lb5
	w/flBuX/czdatGLxfgUY0OCylnPMUDxKsx8/0Z+R6fu0fyMuoAr0+q0RXM+YbWMqxDuiV36AdfC0g
	HD++q8v/yNiHGGklhIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcPT-00APx6-2H; Wed, 26 Jan 2022 07:08:03 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcPM-00APta-Vy; Wed, 26 Jan 2022 07:07:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id u6so29525681lfm.10;
 Tue, 25 Jan 2022 23:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQZEWLVjW3YrjRzePnAkpJ5fQMVb6UDAvzsIkL2SRjE=;
 b=mfSQf867UF/OUBwanRxTRw5HO5INlp0P7eNgiEXHdYpfwaQd9QovmJTUnGByA+CLoY
 ULmZSvg+0nWSRAuc0YlGjhyKq+i7ydEgOKqGlMo53hHvKMQ81VKuV2Dv7xIGjwHabE70
 0ctSI7hCFLbYDOkrdgPJbIycwV7erUloSJJGV/vq7qxR1f2cPx1ONbxeoUyyD1Lz9Ciy
 +mRyYRGQbHOHd+sRGqeiCmZtxWJRodgiSzoe5XMNVnf5pzUim25Nnnnxcsa7wlP7veIP
 vgSNycaudUJVCRuk/kJFCH1Eeyov3qvyt6DILBlDErhMzoSaT4nsrMENw3ivfDSpaPwK
 tvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xQZEWLVjW3YrjRzePnAkpJ5fQMVb6UDAvzsIkL2SRjE=;
 b=D1F5fh8q0TUgxa8vwXFG5U/LSjsQLJnzk0bFWrWHXV91tfAqiKg3fJVAMV7ipiJpPe
 TsEcBqCO13WXGLpZkUC9+uKrsPDA5Lr4GkMjOVdrkzT5lFwTH/QlIBI6M8DBe+o1FsLU
 b8V5KLqWpR466m12N+l8dlJp76EnqZeZY0w5eaw8AtNJrlqxXaRm7QLaSKr6kVdpx5YP
 XXu6BEJXws6qTXb0z1a8/vTbPhJXf4SvvA0ByBAX6Rld/Pmrm3VRJQu9gamR0JvvyLTO
 PlcypEPbZ100zHIz1MJJfSM1weiy2on4WM7aDxSQ4TBMTGMC9XuNWviXkAZcXr0I+NcA
 RVbA==
X-Gm-Message-State: AOAM530iERXoSHEymNojveMcG9WcTYKEQwaBs9zkcr1LQSw3D7zRtKBo
 SBD2kEaEL2cUVHNFR6bumRE=
X-Google-Smtp-Source: ABdhPJzYh58bTg1fZy7W1sPSSAvbXbjS9pFrKpgk3eoYCidLV9/Wf27XOE9qQ/2WZEzSq/MjTCvxyw==
X-Received: by 2002:a19:5047:: with SMTP id z7mr6178840lfj.666.1643180875552; 
 Tue, 25 Jan 2022 23:07:55 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id b39sm1465764ljr.88.2022.01.25.23.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 23:07:55 -0800 (PST)
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
Subject: [PATCH REBASED 2/2] dt-bindings: nvmem: cells: add MAC address cell
Date: Wed, 26 Jan 2022 08:07:45 +0100
Message-Id: <20220126070745.32305-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126070745.32305-1-zajec5@gmail.com>
References: <20220125180114.12286-1-zajec5@gmail.com>
 <20220126070745.32305-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_230757_428488_609E7E02 
X-CRM114-Status: GOOD (  14.95  )
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
