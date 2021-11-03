Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F21C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 15:12:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27DE61073
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 15:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D27DE61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GjQdOXdnVJgYveOT1AJIk4XNqLm8I9k3fvQGjOhO3gw=; b=iZo39GmH+vbTqU
	PJyEMDBzRbtc8ndQCSoP24+b0JOjLreleIa/UhTXqmjW2tSfYAOGuC5po2etQWeD6dEGlcC1c4roP
	siJdu7/Vct9vtZoqb1eKJ1tSfPtN0ck67nbzgXIDSpMS9JWsKPlxjJbTfPiaQiLUBtPebokBvPGMc
	4AZChpCggAmIDmDl7FFvdQHqe1joHU/Gfiek1v3v0EdeYibPZSj1w+XDEXmX4EJ9jFZXe7rVe2gIS
	ABbpP1yZQhS6k0Z2uAzlIOt1Uo05Bv9K0MXBHD7JMcbw5tnJRW3qOfUbr50kMPh2NszVBpDAWgPQh
	RZRaTjEF7Pv3Zd4bQ4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miHvg-005Y8A-2t; Wed, 03 Nov 2021 15:11:56 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miHvJ-005Y4B-OE
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 15:11:35 +0000
Received: by mail-lf1-x135.google.com with SMTP id y26so5766360lfa.11
 for <linux-mtd@lists.infradead.org>; Wed, 03 Nov 2021 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSyypkrWYgiv2lYkLPORKCamq3LsikHsGPZpbO/m2so=;
 b=GWd3XNjwQm26tEVgFJwfFAJAAL+GISP8YDwzIOp6hmL82ybSnQgjKv6MPtXILELaqw
 ExAwETo2G4M8ZxVMKT/V7lh7GGLmc//XqbLnb1KP/BV77Kc6iTgd+toEBfbIWY2xr8Bb
 GN4GmOdM6fQdcCrXdLC95JWtSEhIQDaPYhfS+5aAt0MkitLiDTfYhIqLWXSnq114IBYV
 CRK/DjEC8kdHAWnfsffFLavV2vnubiSubB+d/fHNhiuUQOCEAo/nu6a3fyE5QMePGQrM
 fZZTty68XasKq0E9r/Mlc2ZJ7VG+8SM7+8oejEQ2dHAfwsOghT2u/eTy3MO9KTE3lPaV
 ncdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSyypkrWYgiv2lYkLPORKCamq3LsikHsGPZpbO/m2so=;
 b=lLFqdYQ+Czu4CCl6pjt7vQIiUBhLHOUEUgoTc1YdZTUTv2yhdrsletga4WJw9L+ngc
 pBcAp77PEpdHCuCbFARdh17LGQdHpL/nEanEG/Pkwlo0bQBmEotyjtVGc+tRv4TAXJit
 Y3EIo3Jjjzf/Y+HTVFqttNouY0cNwln2cKRpkWOye41Q62gYzX6AtqjIcpDP+/ljNCWk
 QrCUMIjB36jjxQlN0QAdHeu5YO3mtVjqGuuYd/LvKiydIr3jQGkOiFBpZIFYBeH5y/1m
 g96k2k9k81jEFb1t2RW4cSlLYwGxedVREFPkhEjw68agfeozVNXep32Zq50d19Vatvp+
 rnMQ==
X-Gm-Message-State: AOAM531CR9ewWevCjVAhKEPFsPTFV5sI1quG1fi8FkJqFAFoPIIa2jTz
 LhNu6dIUa2yHTbnnDFYjo94=
X-Google-Smtp-Source: ABdhPJzwhggvOEBCB7W1AcLLAV7uQJEMNZhut0ObYJ1T484MA3TIwZoAtPa1DD1INzU8y1iuOG7qkQ==
X-Received: by 2002:a05:6512:2609:: with SMTP id
 bt9mr41705858lfb.202.1635952290027; 
 Wed, 03 Nov 2021 08:11:30 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id p3sm224107ljc.25.2021.11.03.08.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:11:29 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: mtd: brcmnand: add "no-wp" property
Date: Wed,  3 Nov 2021 16:11:16 +0100
Message-Id: <20211103151117.18690-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_081133_834663_EC700D99 
X-CRM114-Status: GOOD (  11.20  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKSXQncyByZXF1aXJlZCB0
byBwcm9wZXJseSBkZXNjcmliZSBib2FyZHMgd2l0aG91dCBjb25uZWN0ZWQgV1AgcGluIChlLmcu
CkFzdXMgR1QtQUM1MzAwKS4KClNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxA
bWlsZWNraS5wbD4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2Jy
Y20sYnJjbW5hbmQueWFtbCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2Jy
Y20sYnJjbW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
YnJjbSxicmNtbmFuZC55YW1sCmluZGV4IGRkNWE2NDk2OWUzNy4uNDljNzg2MGMwZGFkIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5h
bmQueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20s
YnJjbW5hbmQueWFtbApAQCAtMTExLDYgKzExMSwxMSBAQCBwcm9wZXJ0aWVzOgogICAgICAgZWFy
bGllciB2ZXJzaW9ucyBvZiB0aGlzIGNvcmUgdGhhdCBpbmNsdWRlIFdQCiAgICAgdHlwZTogYm9v
bGVhbgogCisgIG5vLXdwOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhpcyBwcm9wZXJ0eSBt
YXJrcyBib2FyZHMgd2l0aCBXUCBwaW4gbm90IGNvbm5lY3RlZCB0byB0aGUgTkFORCBjaGlwLgor
ICAgIHR5cGU6IGJvb2xlYW4KKwogcGF0dGVyblByb3BlcnRpZXM6CiAgICJebmFuZEBbYS1mMC05
XSQiOgogICAgIHR5cGU6IG9iamVjdAotLSAKMi4zMS4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
