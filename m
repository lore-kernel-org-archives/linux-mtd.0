Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4F2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CkzVpp0BtPBM0xiU0aFAFlEHS4BiUqnsi3OTtyf9Gwk=; b=VR61gpWpV09AIf
	aofGhlbVtJSt7Cv5u46AxDBmNyTVwseMZrJVQ4JC2SdLQI2NqAJQ1taBrYyCnOpzuBvoKjiAXIClR
	GOI39nvMcZwVaA0WCO4WhhMJv/7y+FwQAP+t5vdAGXqNAymzib4+8J9p0wp8I10U2cX3bvGn3nFGF
	qk4m7PCMgNXv8exh4nexFGMQ4A9tXvp3LLL4M8a6hRVskXNKwVtqMjY0iizGZraSs1O3sWTvisDhB
	5HiOQ+rMjbhFbbcFNbhdbH9OMzUB9joICmC09rTGKvXjG/z8ic4GlE457bg5PwfPIOHNnVTmH88Oh
	pXQp2SH8Ewsuxhlfsriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCQ8E-0098aK-1q; Tue, 25 Jan 2022 18:01:26 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCQ8A-0098ZO-T9; Tue, 25 Jan 2022 18:01:24 +0000
Received: by mail-lj1-x22c.google.com with SMTP id z14so16468241ljc.13;
 Tue, 25 Jan 2022 10:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GM66wyVEQfYH7PQMt46Z5bne3N5mqgIHb4gE5XOX3QU=;
 b=qyX4+YOYstvWZ1ZiNLgvZY9TpsI07bcy1pSRR/tryKGf6eHosT3nY2XJ3VnftoWE6D
 lFstLOcE3HaNjlqisM5DI9KtnQ5isJdsloqol6DpAHFh1PmGmpT/TzGhA92zXgcSlCw8
 vO80Ebh+IF2kJ2vQddoGyUSUAK/Eqia13m27m83QkJa7F4WBniAk81U0cxWDtkwoCKVQ
 cCLH1nBHXCbpg0cinEymgD/SZYqtgH7w/UvyEmBClP6JFwNigbVt525c24FGLyDKWscv
 7iQGHRpVIxrDrBLD9QTQvnbQm9ljrqtJTRN/3aeGeRy77WK0woITYfSeoSCIaQm2PT3c
 2gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GM66wyVEQfYH7PQMt46Z5bne3N5mqgIHb4gE5XOX3QU=;
 b=X4F4pyx3tzirA1TsMHz0mLJ64tdlnZ2gMTOXrfnwuJZ6JfqO+IO5YfsMm/dGBLPuuT
 VbGoSyY4zuVB7g3cW5nUgTqaKMKy1NH9EgIAbABiCrs5TXGldBW5/Vjv5sqEyEQWZhFY
 ehjK3Tb7yJVWh5qkbxlCRnQDCpd6QEivrl1ANB9eOhYq811M6ymwac4j3ADxLpAm1c+E
 H9anwPKUos/Bi5+GCzJRYL0m6hYdyYMVXaj4KT12pdA/RwlW6ZJm+empLgQz0jigRmL7
 fWTlxuvkO16PjR67igP8YNVqgCTKVM3pipdjQDqbiJ4zb4FoM3RfM3GkLigUKIJxcy1V
 LZPw==
X-Gm-Message-State: AOAM530hR5tuaKWLf6euuwHn4ArLwsj+4qDisIW665w7ZI0sCU4s7zbm
 /65/eoafHYNsicG+oNz0890=
X-Google-Smtp-Source: ABdhPJwoWthi4gg4kuMx//yhY6O7ZoD9EuAirCd3tjV+pL+5cXulMUAH0DG7CEqZRyZnq1GcejGO2Q==
X-Received: by 2002:a2e:8e21:: with SMTP id r1mr6874390ljk.433.1643133679587; 
 Tue, 25 Jan 2022 10:01:19 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id z24sm1149121lfb.206.2022.01.25.10.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 10:01:19 -0800 (PST)
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
Subject: [PATCH 0/2] dt-bindings: nvmem: support describing cells
Date: Tue, 25 Jan 2022 19:01:12 +0100
Message-Id: <20220125180114.12286-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_100122_993579_532AA035 
X-CRM114-Status: GOOD (  13.18  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTWljaGFlbCBoYXMgcmVj
ZW50bHkgcG9zdGVkIGEgY2xlYW5lZCB1cCBwYXRjaHNldCBmb3IgTlZNRU0KdHJhbnNmb3JtYXRp
b25zIHN1cHBvcnQ6CltQQVRDSCAwLzhdIG52bWVtOiBhZGQgZXRoZXJuZXQgYWRkcmVzcyBvZmZz
ZXQgc3VwcG9ydApodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjExMjI4MTQyNTQ5LjEy
NzU0MTItMS1taWNoYWVsQHdhbGxlLmNjL1QvCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVzPTI3ODY0NCZzdGF0ZT0qCgpJIGZpbmQgaXQg
dmVyeSBpbXBvcnRhbnQgJiBmdWxseSBzdXBwb3J0IGl0LiBJbiBob21lIHJvdXRlcnMgd2UgdmVy
eQpvZnRlbiBkZWFsIHdpdGgganVzdCBvbmUgTUFDIGFkZHJlc3MgdGhhdDoKMS4gSXMgYSBiYXNl
IGZvciBjYWxjdWxhdGluZyBtdWx0aXBsZSBFdGhlcm5ldCBhZGRyZXNzZXMKMi4gQ2FuIGJlIHN0
b3JlZCBpbiBiaW5hcnkgYXMgd2VsbCBhcyBBU0NJSSBmb3JtYXQKCkknZCBsaWtlIHRvIHN1Z2dl
c3QganVzdCBhIHNsaWdodGx5IGRpZmZlcmVudCBzb2x1dGlvbiB0aG91Z2guIEkgdGhpbmsKdGhh
dCB1c2luZyBzb21ldGhpbmcgbGlrZToKCm90cC0xIHsKICAgICAgICBjb21wYXRpYmxlID0gImtv
bnRyb24sc2wyOC12cGQiLCAidXNlci1vdHAiOwogICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
OwogICAgICAgICNzaXplLWNlbGxzID0gPDE+OwoKICAgICAgICBiYXNlX21hY19hZGRyZXNzOiBi
YXNlLW1hYy1hZGRyZXNzQDE3IHsKICAgICAgICAgICAgICAgICNudm1lbS1jZWxsLWNlbGxzID0g
PDE+OwogICAgICAgICAgICAgICAgcmVnID0gPDE3IDY+OwogICAgICAgIH07Cn07Cgppc24ndCBj
bGVhciBlbm91Z2ggYW5kIHJlcXVpcmVzIHRvbyBtdWNoIGNvbmRpdGlvbmFsIGNvZGUgaW4gTGlu
dXggLwp3aGF0ZXZlciBpbXBsZW1lbnRhdGlvbi4gRFQgZG9lc24ndCBtYWtlIGl0IGNsZWFyIHdo
aWNoIE5WTUVNIGNlbGxzCmFyZSB1c2VkIGZvciB3aGF0IGFuZCBob3cgc2hvdWxkIGJlIGhhbmRs
ZWQuIFRoYXQgaGFzIHRvIGJlIGhhcmRjb2RlZCBpbgphIExpbnV4IC8gd2hhdGV2ZXIgZHJpdmVy
LgoKTXkgaWRlYSBpcyB0byBhZGQgImNvbXBhdGlibGUiICYgYWRkaXRpb25hbCBmbGFncyB0byBO
Vk1FTSBjZWxscy4KRXhhbXBsZToKCm90cC0xIHsKICAgICAgICBjb21wYXRpYmxlID0gInVzZXIt
b3RwIjsKICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAjc2l6ZS1jZWxscyA9
IDwxPjsKCiAgICAgICAgYmFzZV9tYWNfYWRkcmVzczogYmFzZS1tYWMtYWRkcmVzc0AxNyB7CiAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1hYy1hZGRyZXNzIjsKICAgICAgICAgICAgICAg
IHJlZyA9IDwxNyA2PjsKICAgICAgICAgICAgICAgICNudm1lbS1jZWxsLWNlbGxzID0gPDE+Owog
ICAgICAgIH07Cn07CgooZm9yIG1vcmUgZXhhbXBsZXMgc2VlIFBBVENIIDIvMiBhbmQgaXRzIG1h
Yy1hZGRyZXNzLnlhbWwgLgoKUmFmYcWCIE1pxYJlY2tpICgyKToKICBkdC1iaW5kaW5nczogbnZt
ZW06IGV4dHJhY3QgTlZNRU0gY2VsbCB0byBzZXBhcmF0ZWQgZmlsZQogIGR0LWJpbmRpbmdzOiBu
dm1lbTogY2VsbHM6IGFkZCBNQUMgYWRkcmVzcyBjZWxsCgogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbnZtZW0vY2VsbHMvY2VsbC55YW1sIHwgMzUgKysrKysrKwogLi4uL2JpbmRpbmdzL252bWVt
L2NlbGxzL21hYy1hZGRyZXNzLnlhbWwgICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKwogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFtbCAgICAgIHwgMjUgKy0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTMxIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9jZWxs
cy9jZWxsLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbnZtZW0vY2VsbHMvbWFjLWFkZHJlc3MueWFtbAoKLS0gCjIuMzEuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
