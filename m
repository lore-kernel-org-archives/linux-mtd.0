Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BB5C43218
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D02208CA
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 16:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nSEmF0le";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJyPCLZ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D02208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VF955NClf3l85ZUAZTIK/s5bWPReQe0JknrOLlyRf+w=; b=nSEmF0leuYgHCu
	zD5ZhTJBSI4qNb0TSk6x+0yVaxBeHA6/x6GAp5s327PRBbTvijb4t0lfnh1vTm3xqM/nLuudgqe+v
	9gcuXBJ9OT/BxMzcfWgOvUqJPbty2VudJOlXhSTd5IhUfPtqt35cdSLWoF/oHJQAqJB3izH7Xq7Iu
	ecKCqpln5ylYptqO3HUp4OAFiH76ig6kW/HyMxbN5gkM7bYJ4Ym1XPw31VXfHDsoSpjeDpHBrJzJU
	6+sHQkGyaDY5g4A59aB+DeXm6N1JS1YdfntGMuvQ+3FLj5pIx0InvlRmJOALw/z0HD1SAlgreT5aP
	bpcN+y/A3+nacGr4NUUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK3wU-0004Kn-89; Fri, 26 Apr 2019 16:43:18 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK3vr-0003Rm-Uc
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2019 16:42:43 +0000
Received: by mail-lf1-x141.google.com with SMTP id j20so2982495lfh.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2019 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xuIU2BQoWzCiQ5FUAaKlSoiV2sVXtdwFfbdEhHMztTg=;
 b=nJyPCLZ3ErXNfXIjsfl5woXrqnWv2QZqmaztLmTuDHbc8Pm6jl+xN4GyYqWz4/+atE
 x/Krc5kqtqsgPSBxsx1kCTKIAyD7rMdQFUSpi3TwwZU7cAXHOKm+urN6HAoUiG3+pDde
 Z/7ar+DwOLS6ABUfEDthSB2ccA/Dwv1pCDbwYT3RpwBeJs8z1Qy0+DflkKU/IQmRwAKG
 105vW23kC0BwCHqVpmnxGRUYIPUJLEvLuVAN+xRAtxsBj1qoJPsvOci6zjmjDxqQ0faF
 7hCO88ooXCOZJNlba4guRggFXBcI4aixK6to8I9yrtAiU7M/X4+tausPBMSy0IFgwgZJ
 9eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xuIU2BQoWzCiQ5FUAaKlSoiV2sVXtdwFfbdEhHMztTg=;
 b=c+g76hluJFjIHiqrfJdpKQGKbA4sZzE5bOMrTQvwH7stQQtfLhs/gpQmp51WI5I38P
 dudcUDXRh0p8w1AYbYpmhj52eZbAtv9S41dXeetCPDn5GGG/D7MU10HAGk+KHEB23pye
 6XLwV5Zraz3VJ4Vlqesrx6wMPiyjGBP8AV1IbQi5p+rRWScFXMv2qlCr/CWjtQZawimo
 jNaNm4WWXmk00b9+O2jrNZ+N4XHWo0BmMgqT1E0uBrqJ8MpPAHx6K72QNvEkFTRV0uxu
 bDbBZRwTSJ3Lg1gjF+IOGrNVoRGspSrT2iY/f0AVbj48jaMc/GdbSDwsO6RCKj9UA+86
 ERdQ==
X-Gm-Message-State: APjAAAU2kO9YY6hucZlALzGHwLXiYgZvBp49+pcq6PzJrR6luB9DKphA
 Vquog5YJ97UM41Yp/uzyi2o=
X-Google-Smtp-Source: APXvYqxIhxB+pq7CSTz418WnS4sJZ3rJXeFB7fOmACoTnFhM5FbWtx1wP6RXgY3VH+fDux3BIpC9Ew==
X-Received: by 2002:ac2:5495:: with SMTP id t21mr24993782lfk.3.1556296958026; 
 Fri, 26 Apr 2019 09:42:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a315:5445:5300:2492:ad61:69f1:23cc])
 by smtp.googlemail.com with ESMTPSA id q11sm5637807lfc.51.2019.04.26.09.42.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 09:42:37 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To: kyungmin.park@samsung.com
Subject: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree support
Date: Fri, 26 Apr 2019 18:42:23 +0200
Message-Id: <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_094240_382112_F8B82FA6 
X-CRM114-Status: GOOD (  14.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org,
 Tomasz Figa <tomasz.figa@gmail.com>, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4KClRoaXMgcGF0Y2ggYWRk
cyBkdC1iaW5kaW5ncyBmb3IgU2Ftc3VuZyBPbmVOQU5EIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6
IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFBhd2XF
giBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4KLS0tCiAuLi4vYmluZGlu
Z3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQgICAgICAgICAgfCA0NiArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4
dAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc2Ft
c3VuZy1vbmVuYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
c2Ftc3VuZy1vbmVuYW5kLnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
MDAuLjM0MWQ5N2NjMTUxMwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dApAQCAtMCwwICsxLDQ2IEBACitE
ZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgU2Ftc3VuZyBTb0MgT25lTkFORCBjb250cm9sbGVyCisK
K1JlcXVpcmVkIHByb3BlcnRpZXM6CisgLSBjb21wYXRpYmxlIDogdmFsdWUgc2hvdWxkIGJlIGVp
dGhlciBvZiB0aGUgZm9sbG93aW5nLgorICAgKGEpICJzYW1zdW5nLHMzYzY0MDAtb25lbmFuZCIg
LSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNvbXBhdGlibGUgd2l0aAorICAgICAgIFMzQzY0MDAg
U29DLAorICAgKGIpICJzYW1zdW5nLHMzYzY0MTAtb25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250
cm9sbGVyIGNvbXBhdGlibGUgd2l0aAorICAgICAgIFMzQzY0MTAgU29DLAorICAgKGMpICJzYW1z
dW5nLHM1cGMxMDAtb25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNvbXBhdGlibGUg
d2l0aAorICAgICAgIFM1UEMxMDAgU29DLAorICAgKGQpICJzYW1zdW5nLHM1cHYyMTAtb25lbmFu
ZCIgLSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNvbXBhdGlibGUgd2l0aAorICAgICAgIFM1UEMx
MTAvUzVQVjIxMCBTb0NzLgorCisgLSByZWcgOiB0d28gbWVtb3J5IG1hcHBlZCByZWdpc3RlciBy
ZWdpb25zOgorICAgLSBmaXJzdCBlbnRyeTogY29udHJvbCByZWdpc3RlcnMuCisgICAtIHNlY29u
ZCBhbmQgbmV4dCBlbnRyaWVzOiBtZW1vcnkgd2luZG93cyBvZiBwYXJ0aWN1bGFyIE9uZU5BTkQg
Y2hpcHM7CisgICAgIGZvciB2YXJpYW50cyBhKSwgYikgYW5kIGMpIG9ubHkgb25lIGlzIGFsbG93
ZWQsIGluIGNhc2Ugb2YgZCkgdXAgdG8KKyAgICAgdHdvIGNoaXBzIGNhbiBiZSBzdXBwb3J0ZWQu
CisKKyAtIGludGVycnVwdC1wYXJlbnQgOiBwaGFuZGxlIG9mIGludGVycnVwdCBjb250cm9sbGVy
IHRvIHdoaWNoIHRoZSBPbmVOQU5ECisgICBjb250cm9sbGVyIGlzIHdpcmVkLAorIC0gaW50ZXJy
dXB0cyA6IHNwZWNpZmllciBvZiBpbnRlcnJ1cHQgc2lnbmFsIHRvIHdoaWNoIHRoZSBPbmVOQU5E
IGNvbnRyb2xsZXIKKyAgIGlzIHdpcmVkOyBzaG91bGQgY29udGFpbiBqdXN0IG9uZSBlbnRyeS4K
KyAtIGNsb2NrLW5hbWVzIDogc2hvdWxkIGNvbnRhaW4gdHdvIGVudHJpZXM6CisgICAtICJidXMi
IC0gYnVzIGNsb2NrIG9mIHRoZSBjb250cm9sbGVyLAorICAgLSAib25lbmFuZCIgLSBjbG9jayBz
dXBwbGllZCB0byBPbmVOQU5EIG1lbW9yeS4KKyAtIGNsb2NrOiBzaG91bGQgY29udGFpbiBsaXN0
IG9mIHBoYW5kbGVzIGFuZCBzcGVjaWZpZXJzIGZvciBhbGwgY2xvY2tzIGxpc3RlZAorICAgaW4g
Y2xvY2stbmFtZXMgcHJvcGVydHkuCisgLSAjYWRkcmVzcy1jZWxscyA6IG11c3QgYmUgMSwKKyAt
ICNzaXplLWNlbGxzIDogbXVzdCBiZSAxLgorCitGb3IgcGFydGl0aW9uIHRhYmxlIHBhcnNpbmcg
KG9wdGlvbmFsKSBwbGVhc2UgcmVmZXIgdG86CisgWzFdIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9uLnR4dAorCitFeGFtcGxlIGZvciBhbiBzNXB2MjEwIGJv
YXJkOgorCisJb25lbmFuZEBiMDYwMDAwMCB7CisJCWNvbXBhdGlibGUgPSAic2Ftc3VuZyxzNXB2
MjEwLW9uZW5hbmQiOworCQlyZWcgPSA8MHhiMDYwMDAwMCAweDIwMDA+LCA8MHhiMDAwMDAwMCAw
eDIwMDAwPjsKKwkJaW50ZXJydXB0LXBhcmVudCA9IDwmdmljMT47CisJCWludGVycnVwdHMgPSA8
MzE+OworCQljbG9jay1uYW1lcyA9ICJidXMiLCAib25lbmFuZCI7CisJCWNsb2NrcyA9IDwmY2xv
Y2tzIE5BTkRYTD4sIDwmY2xvY2tzIERPVVRfRkxBU0g+OworCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKKwkJI3NpemUtY2VsbHMgPSA8MT47CisJfTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
