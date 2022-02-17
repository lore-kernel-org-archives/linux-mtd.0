Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D357C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0IYU5mTg82P9Esk5ISaq2oO0O9VrkJmPi1PsLu4BoEE=; b=LTXEeGyTtMbM78
	jLYivyVuCsR4IhPR6jJqbGrvgGfFTBcN9JDYLfr/s2AKU0gEikYxz9ac+pcLv6H7qGcVzRAzuVysj
	H9BrirzHkTRnoMF2i6ynwMDHPr4PxktfjB4BZj1o31BJkXbTuwdq+JW/Gft1aBgCq1U6qEdBNKYCt
	BWRjXiyWM2P9i/BUKyhrEQuZDAm9OEEjjRQtCbqcbfGEUjs8tD+jhGPhPZJrCz3cbGwbCzlN2wXtr
	TiWyLJGYlbhYeZmxLLHl4f4zTMB+M810RAuYewVsBnW/9o9xxxuIr51wUtgbnG/tcDEowtJcCMY7x
	Up0fL98rlTuhkV1e5gQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKdyB-009tpi-2m; Thu, 17 Feb 2022 10:25:03 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKdy7-009tmU-29
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 10:25:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id e5so8998093lfr.9
 for <linux-mtd@lists.infradead.org>; Thu, 17 Feb 2022 02:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IP7PcCy1//3+2eLuk3yMfPvTyyCntet0laQmLiMhwkY=;
 b=puBtr+eDzVX5eCmyW9kBNnDrGEiAPkPMgWdkrIoIy1ZlzhGT6FWsStw+nHU2z3Y770
 IfBqQH+lFQuRzGQNw+P6W+AOW8bac49XWSCziqO3J20Mqc2Datidjnvmy1uWcFRV6fx4
 MltDn2QDShy95zzuLRGw4SRiLlznzvUXvsTcTVUBoKbXkDQI8KYrHRCtfJn2I17SsJDV
 3CSGueqBnM9uKrEZHg++Psyd9OS8cuhBR5KjYf/tn5QxqMu3rLnXSewRk72P1XyczO4D
 fUcONK4wXVgJq5oSepJYFxZ7XR7bWT7hckF7jpv3gT7gSRl5U72DT6+DcohFalf/0/a0
 dI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IP7PcCy1//3+2eLuk3yMfPvTyyCntet0laQmLiMhwkY=;
 b=Cc0E6QmqvAUuF5IgSQL2tvWspcBKlsvZjWtOdDySo+HDC0H2isj4NdcUg0aIDzP7gl
 dYwkpeUtm/4KTDyEIyPANym91zqG7FRtPV2OmYSrffzWvSw01ijWJtRcZAzBaqWiGaKG
 F8toN7Fg1CZ7N4CLR0hk2Zi16E5o47vMF6/2pWoi6nJyMlLsdInCvCp4G3gFVTsakxP4
 71lMmtoxeSA2mdWA408oDTE9AIss74+QIigU+ygvt7hoJ2qc80+ITfRW3dgk39PS+g1/
 +aQMxK+JvbiWmo/5XF8fM9b8Q5lcBs6BX+UXOJ0aoQC/w93I5Zl7aG5nm+xAzQuz2ObN
 3Eug==
X-Gm-Message-State: AOAM533TyzA0PLbOQf6r3GvWp6MIkHhGooS2nYFTIHbjRi6XVKrKlBE3
 TL1IriTZK5OLuZyLaqmoBm4=
X-Google-Smtp-Source: ABdhPJy9iN3pbnOBG9o3EF6L1/K5/6fnHQMeqcpOcXXTomGaoWM7oLrKjntmJZ0Orf/6bctKmhz+KQ==
X-Received: by 2002:ac2:5fe1:0:b0:443:3c53:b941 with SMTP id
 s1-20020ac25fe1000000b004433c53b941mr1536110lfg.146.1645093497226; 
 Thu, 17 Feb 2022 02:24:57 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id w8sm1303858lfr.242.2022.02.17.02.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:24:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>,
 Ricardo Salveti <ricardo@foundries.io>,
 Michal Simek <michal.simek@xilinx.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: mtd: partitions: add UBI binding
Date: Thu, 17 Feb 2022 11:24:48 +0100
Message-Id: <20220217102448.27586-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_022459_135154_F741C565 
X-CRM114-Status: GOOD (  14.00  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVUJJIGlzIG9mdGVuIHVz
ZWQgb24gZW1iZWRkZWQgZGV2aWNlcyB0byBzdG9yZSBVQkkgdm9sdW1lcyB3aXRoIGRldmljZQpj
b25maWd1cmF0aW9uIC8gY2FsaWJyYXRpb24gZGF0YS4gU3VjaCB2b2x1bWVzIG1heSBuZWVkIHRv
IGJlIGRvY3VtZW50ZWQKYW5kIHJlZmVyZW5jZWQgZm9yIHByb3BlciBib290ICYgc2V0dXAuCgpT
b21lIGV4YW1wbGVzOgoxLiBVLUJvb3QgZW52aXJvbm1lbnQgdmFyaWFibGVzCjIuIERldmljZSBj
YWxpYnJhdGlvbiBkYXRhCjMuIERlZmF1bHQgc2V0dXAgKGUuZy4gaW5pdGlhbCBwYXNzd29yZCkK
ClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KLS0tCiAu
Li4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwgICAgICAgICAgfCA2NyArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9u
cy91YmkueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy91YmkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy91YmkueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLmNkMDgxZjA2ZDRjYgotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91YmkueWFtbApAQCAtMCwwICsx
LDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTIt
Q2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9tdGQvcGFydGl0aW9ucy91YmkueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogVUJJIChVbnNvcnRlZCBCbG9jayBJ
bWFnZXMpIGRldmljZQorCitkZXNjcmlwdGlvbjogfAorICBVQkkgaXMgYSBsYXllciBwcm92aWRp
bmcgbG9naWNhbCB2b2x1bWVzIChjb25zaXN0aW5nIG9mIGxvZ2ljYWwgYmxvY2tzKSBvbiB0b3AK
KyAgb2YgcmF3IGZsYXNoIGRldmljZXMuIEl0IGRlYWxzIHdpdGggbG93LWxldmVsIGZsYXNoIGlz
c3VlcyAoYml0LWZsaXBzLCBiYWQKKyAgcGh5c2ljYWwgZXJhc2VibG9ja3MsIHdlYXJpbmcpIHBy
b3ZpZGluZyBhIHJlbGlhYmxlIGRhdGEgc3RvcmFnZS4KKworICBVQkkgZGV2aWNlIGlzIGJ1aWx0
IGFuZCBzdG9yZWQgaW4gYSBzaW5nbGUgZmxhc2ggcGFydGl0aW9uLgorCisgIFNvbWUgKHVzdWFs
bHkgZW1iZWRkZWQpIGRldmljZXMgdXNlIFVCSSB2b2x1bWVzIG9mIHNwZWNpZmljIG5hbWVzIG9y
IGluZGV4ZXMKKyAgdG8gc3RvcmUgc2V0dXAgLyBjb25maWd1cmF0aW9uIGRhdGEuIFRoaXMgYmlu
ZGluZyBhbGxvd3MgZGVzY3JpYmluZyBzdWNoCisgIHZvbHVtZXMgc28gdGhleSBjYW4gYmUgaWRl
bnRpZmllZCBhbmQgcmVmZXJlbmNlZCBieSBjb25zdW1lcnMuCisKK21haW50YWluZXJzOgorICAt
IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KKworYWxsT2Y6CisgIC0gJHJlZjog
cGFydGl0aW9uLnlhbWwjCisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6
IHViaQorCitwYXR0ZXJuUHJvcGVydGllczoKKyAgIl52b2x1bWUtWzAtOWEtZl0rJCI6CisgICAg
dHlwZTogb2JqZWN0CisgICAgZGVzY3JpcHRpb246IFVCSSB2b2x1bWUKKyAgICBwcm9wZXJ0aWVz
OgorICAgICAgdm9sdW1lLW5hbWU6CisgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3N0cmluZworICAgICAgdm9sdW1lLWlkOgorICAgICAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKKyAgICBhbnlPZjoKKyAgICAgIC0g
cmVxdWlyZWQ6CisgICAgICAgICAgLSB2b2x1bWUtbmFtZQorICAgICAgLSByZXF1aXJlZDoKKyAg
ICAgICAgICAtIHZvbHVtZS1pZAorCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4
YW1wbGVzOgorICAtIHwKKyAgICBwYXJ0aXRpb25zIHsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJm
aXhlZC1wYXJ0aXRpb25zIjsKKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAg
ICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIHBhcnRpdGlvbkAwIHsKKyAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAidWJpIjsKKyAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAgMHgxMDAw
MDAwPjsKKyAgICAgICAgICAgIGxhYmVsID0gImZpbGVzeXN0ZW0iOworCisgICAgICAgICAgICBl
bnY6IHZvbHVtZS0wIHsKKyAgICAgICAgICAgICAgICB2b2x1bWUtbmFtZSA9ICJ1LWJvb3QtZW52
IjsKKyAgICAgICAgICAgIH07CisKKyAgICAgICAgICAgIGNhbGlicmF0aW9uOiB2b2x1bWUtMSB7
CisgICAgICAgICAgICAgICAgdm9sdW1lLWlkID0gPDk5PjsKKyAgICAgICAgICAgIH07CisgICAg
ICAgIH07CisgICAgfTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
