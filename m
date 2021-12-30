Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C53C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Dec 2021 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvLFVFihWPx5XvuZ09Tq+kR8vlCV4HJcWSfkuxi+kbM=; b=VPutMFguFgGw0e
	sJkC9D4EeSrRkXiLRRU6gI072kQqAV23oksH0r3g9Sq0veU2uYORhuSadB6fiVP3pkiSPt97zB3/2
	X11KON5rdfZ3uvKqwz3sSy8PZ8/0EmbymQGvQnzMzZCjnpAAQcdZVuswObyBi+lps6+J8MDkKygaT
	QRV9AQDi6medioCJNd+2aMJ1h8E8J+eOqITAvwVIdWwn50kzcgqyeG/9xhSwXk2McppvKs4zfzvNr
	xIvZylgNCMSOtSVVhWjrfb/VInukJEoLAwfuDFkZEOMV82xXcqFRZL6zmHW+MP4RcBqc4I4R0egU2
	CJL3ZkkaIUEPsF9WlKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2rN8-0046cX-2O; Thu, 30 Dec 2021 09:05:18 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2rMs-0046Zg-IQ
 for linux-mtd@lists.infradead.org; Thu, 30 Dec 2021 09:05:04 +0000
Received: by mail-lj1-x22d.google.com with SMTP id g13so27469807ljj.10
 for <linux-mtd@lists.infradead.org>; Thu, 30 Dec 2021 01:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJD186S2XKoNzVu+mbYMaAb2EZdG5LnCBd09sDF2R4A=;
 b=EjsU93qpYeMUtOLkHpD9TpRJWXawGtQX0ncW3Vln7DOBOb7pG/PC0LD5+gzmqz90S9
 URcbwRjLdqjwJBaL7HSbo9/3PUQVOkDubtkcz9taFMWidue0KtRxqI0bUVGn6Hcl1jA9
 8fT3ql0Ud0mZZ1WbfeEoZDHHPnoRC1JbUzLy6siGSjcHMeq1+VIaOXZV8n+j1yl41gk5
 nb7aHBixuMDx8HxA7ttJaOKjLCnDcU2y64afbH2lwD1NJ7V93sDw+6RmMpvEaPd+t5BB
 qolpaWTgW4ZJTiJEvqvUNUeUdNGnYH0sVJopNWS9yiG3K5KRahFhPoVkxs+Su6/gVOHN
 j4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJD186S2XKoNzVu+mbYMaAb2EZdG5LnCBd09sDF2R4A=;
 b=mwG4UMHjeTgwFsN49BmtYZryBMdpV6IIHhPeS0XzI9r0D00BtrZYQtOTJ9LHU092Sz
 v3Kbtfr4V0EZ83dU7TfM7jGPbsbES0e9lGkLHsaZ9cH32FaTN8mCQ3ERvxThh5cPJPEi
 l/gh1pYQCw/jHkxSt0IxXwK+22yHgonvJ261GU8JCKSjrn2VhL/wEkNWOVkKrYgv6X0R
 HMwQ7E35lxEQ0eGwsXeWRjPvY8OCbG4mZE+9LwPcIn0H6it9cxp2OUei5VVCAPxf13nU
 hoIgPdeJed1DGK3EjTO47G7fLJDSU6FhsAVtIoMUEVL7LyjeOoO+9EtY2/tt7eHZAuK9
 fUJA==
X-Gm-Message-State: AOAM532NDpLVnDOy5xQNS5cYnfWX9uF2SJ3PUGDg3QXlpC2dlNaFENJD
 6/474nXHEEhwat9KOQrbz0w=
X-Google-Smtp-Source: ABdhPJyMA2lF2DxYBvC1Nmxh8j3AMK1fbdok3UDzKj9earMnqtEk+Y1E7m/n3LlrJwGuzNL4/pGq8g==
X-Received: by 2002:a2e:9901:: with SMTP id v1mr26250906lji.61.1640855100917; 
 Thu, 30 Dec 2021 01:05:00 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id d5sm2440007lfl.242.2021.12.30.01.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:05:00 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/3] dt-bindings: nvmem: add U-Boot environment variables
 binding
Date: Thu, 30 Dec 2021 10:04:48 +0100
Message-Id: <20211230090449.11808-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230090449.11808-1-zajec5@gmail.com>
References: <20211230090449.11808-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_010502_644241_C0D69259 
X-CRM114-Status: GOOD (  15.48  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBiaW5kaW5nIGFs
bG93cyBkZXNjcmliaW5nIGEgKHBhcnQgb2YpIE1URCBkZXZpY2UgKHBhcnRpdGlvbikgdGhhdApj
b250YWlucyBhIGJsb2NrIHdpdGggZW52aXJvbm1lbnQgdmFyaWFibGVzLiBPcGVyYXRpbmcgc3lz
dGVtIHVzdWFsbHkKbmVlZHMgdG8gcGFyc2UgdGhhdCBibG9jayB0byByZWFkIHZhcmlhYmxlcyB2
YWx1ZXMgdGhhdCBtYXkgYWZmZWN0CmJvb3RpbmcgcHJvY2VzcyAmIGRldmljZSBjb25maWd1cmF0
aW9uLgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgot
LS0KVjI6IHMvdSxib290L3UtYm9vdC8KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS91LWJvb3QsZW52LnlhbWwgfCA1NiArKysrKysrKysrKysrKysrKysrCiBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKwogMiBmaWxlcyBjaGFuZ2Vk
LCA2MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZTMyOTZlMDA1ZmZkCi0tLSAvZGV2
L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9v
dCxlbnYueWFtbApAQCAtMCwwICsxLDU2IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL252bWVtL3UtYm9vdCxlbnYueWFtbCMKKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTog
VS1Cb290IGVudmlyb25tZW50IHZhcmlhYmxlcworCitkZXNjcmlwdGlvbjogfAorICBVLUJvb3Qg
dXNlcyBlbnZpcm9ubWVudCB2YXJpYWJsZXMgdG8gc3RvcmUgZGV2aWNlIHBhcmFtZXRlcnMgYW5k
CisgIGNvbmZpZ3VyYXRpb24uIFRoZXkgbWF5IGJlIHVzZWQgZm9yIGJvb3RpbmcgcHJvY2Vzcywg
c2V0dXAgb3Iga2VlcGluZyBlbmQgdXNlcgorICBpbnRlcmVzdGluZyBpbmZvLgorCisgIERhdGEg
aXMgc3RvcmVkIG9uIGZsYXNoIHBhcnRpdGlvbiBpbiBhIFUtQm9vdCBzcGVjaWZpYyBmb3JtYXQg
KENSQzMyIGFuZCBOVUwKKyAgc2VwYXJhdGVkIGtleS12YWx1ZSBwYWlycykuCisKKyAgVGhpcyBi
aW5kaW5nIGFsbG93cyBzcGVjaWZ5aW5nIGRhdGEgbG9jYXRpb24gYW5kIGZvcm1hdCAoZGVmYXVs
dCBvbmUgb3IgdmVuZG9yCisgIHNwZWNpZmljKS4KKworbWFpbnRhaW5lcnM6CisgIC0gUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgorCithbGxPZjoKKyAgLSAkcmVmOiBudm1lbS55
YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGVudW06CisgICAgICAtIHUt
Ym9vdCxlbnYKKyAgICAgIC0gYnJjbSxlbnYKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKwor
dW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgcGFy
dGl0aW9ucyB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CisgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKKwor
ICAgICAgICBwYXJ0aXRpb25AMCB7CisgICAgICAgICAgICBsYWJlbCA9ICJ1Ym9vdCI7CisgICAg
ICAgICAgICByZWcgPSA8MHgwIDB4MTAwMDAwPjsKKworICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKKworICAgICAgICAgICAg
bnZtZW1AMTAwMDAgeworICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiI7
CisgICAgICAgICAgICAgICAgcmVnID0gPDB4MTAwMDAgMHgxMDAwMD47CisgICAgICAgICAgICB9
OworICAgICAgICB9OworICAgIH07CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCmluZGV4IDY3NTU4MDk3YmI2Ni4uMjcxYzI5Yzg0YzdkIDEwMDY0NAotLS0gYS9NQUlOVEFJ
TkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTk2MjQsNiArMTk2MjQsMTEgQEAgVzoJaHR0cDov
L2xpbnV4dHYub3JnCiBUOglnaXQgZ2l0Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQKIEY6
CWRyaXZlcnMvbWVkaWEvcGNpL3R3Njg2eC8KIAorVS1CT09UIEVOVklST05NRU5UIFZBUklBQkxF
UworTToJUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgorUzoJTWFpbnRhaW5lZAor
RjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3UtYm9vdCxlbnYueWFt
bAorCiBVQUNDRSBBQ0NFTEVSQVRPUiBGUkFNRVdPUksKIE06CVpoYW5nZmVpIEdhbyA8emhhbmdm
ZWkuZ2FvQGxpbmFyby5vcmc+CiBNOglaaG91IFdhbmcgPHdhbmd6aG91MUBoaXNpbGljb24uY29t
PgotLSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
