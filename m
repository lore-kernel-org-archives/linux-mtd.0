Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57210C47077
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jan 2024 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kj9621rxTs/yPatFmIOWV1Dy9yzZykpYFVoxE0W/GMI=; b=qK7gmiXvuMZBZU
	cQMM2pjBHXxqShOInZv6LkZr+LAofNnnuGkXyagNiAaA7hkcSt5nJfEqafcjHV4ktjGlE+SL30yx2
	DbTzPXWAr5FcTetwQLdV7nnpyWz2Ld0zLXg7u9f6ElS8oTcXAj5NKnOJvPevmNs7ZcFZMTfT6MY5E
	gfxPmvgEoABk4AWADGxJ1qRZXi0tKz3y8qffVc4gFEWRXuPUXJwqHTluw87G/C3kYf74dYDEtjleH
	Z5ploui6AFwa1NdT2l2l88kSGrUjFYK1aEvCfqbJoRLzigpOnDMgvy0+8CDggSezQ7JYnj01n5SPB
	3vX2VH8s1Ql686l8rCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNu2J-0000vJ-2Y;
	Thu, 11 Jan 2024 12:19:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNu2H-0000tj-2p
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jan 2024 12:19:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a28e31563ebso559876866b.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2024 04:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704975588; x=1705580388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZKjNuKFpBIgAPNQXHjE+zGWxeFXDpn+QzaU3wJuCUk=;
        b=TFbfptJnl6NMFy1tmKP7lePLDjgZckCRBq/UiK7/OUFi5bSPbZa0S56ldHtprQy/EA
         W9qFu/8at5/N1A2teMymDyxQ76sZkFcUfME2p4n6PVkIWjz6O8+4GRWb0TmtI3clAqq/
         mHYXxPplsT1Z6I2Dz+a9q3gwJJQxdi0wycBQ8KW9/m2rbQTg5m2hl3c/id1YtHUSoUu6
         A7J5XqkRn6LhRbZtSpnJ5YTpbgcfrlkEph4T/D7mynQmcYO+GobAj75lhm5svrnrlf23
         OeIdVlWNukTwOuTKzRZhTSkwBF36iffsb1j7c8ZLoQoAt1ABR08fBywigyg8ZcrCfExH
         Sq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704975588; x=1705580388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZKjNuKFpBIgAPNQXHjE+zGWxeFXDpn+QzaU3wJuCUk=;
        b=blKcNjiFfJQ8ALMdEEWPMk9eIj7bAnvzqIhw7/2OIzuGM3Z/pw8y7NeaEZWlxEOXoz
         DTLvyiJDANqKkwu/NZnmGRopqY1RVoTNyKiMsHfwA72Cp5918yZ6ckj71Fp1O39PEI0i
         S4WZyBYjzbO9LP1eLsobC8OeDlNpWv/HN7GYi/qFJ6DB6U/QELjdW0nYReDMB7f91E4v
         b0a3P4E36BGEjRXcP1X2s2L8ZNJHKa245g20uhlYfvRsS/s6rWk/4BC8K8vwFXXwmYfp
         mian7VHnJ309vH2PJmj+3Kef4CU/uaQEJPz1713cIx+OE2csLucHv+j2ci4aMGGFfBY8
         vvrQ==
X-Gm-Message-State: AOJu0Yxcfln5+ly+QgFnIlUpmSDZm4CZoPVtCrHadDcWGw/I17yGEMfv
	RuxFlRvEE357tHWFMkM1mdw=
X-Google-Smtp-Source: AGHT+IE0vYW1NN1IddmhLKD400aKBqGOGGa9hyMtY0jMcoJXItKOxufMxs964noz+aSuTeIAVwliDA==
X-Received: by 2002:a17:906:ae54:b0:a28:7dd0:adb4 with SMTP id lf20-20020a170906ae5400b00a287dd0adb4mr551156ejb.83.1704975587591;
        Thu, 11 Jan 2024 04:19:47 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id m17-20020a170906235100b00a26ade46618sm516628eja.99.2024.01.11.04.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 04:19:47 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: mtd: partitions: make partition an NVMEM provider
Date: Thu, 11 Jan 2024 13:19:40 +0100
Message-Id: <20240111121940.15628-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_041949_914486_07EF4FBD 
X-CRM114-Status: GOOD (  10.45  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKTVREIHBhcnRpdGlvbiBw
cm92aWRlcyBmbGFzaCBkZXZpY2UgZGF0YSBhbmQgY2FuIGJlIHVzZWQgYXMgTlZNRU0KZGV2aWNl
LgoKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgotLS0K
IC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbCAgICAgICB8IDE2ICsr
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCmluZGV4IDFlYmU5ZTIzNDdlYS4u
N2IxZDg0Y2U1ZWY1IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3BhcnRpdGlvbnMvcGFydGl0aW9uLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sCkBAIC01NywxMyAr
NTcsMTUgQEAgcHJvcGVydGllczoKICAgICAgIHVzZXIgc3BhY2UgZnJvbQogICAgIHR5cGU6IGJv
b2xlYW4KIAotaWY6Ci0gIG5vdDoKLSAgICByZXF1aXJlZDogWyByZWcgXQotdGhlbjoKLSAgcHJv
cGVydGllczoKLSAgICAkbm9kZW5hbWU6Ci0gICAgICBwYXR0ZXJuOiAnXnBhcnRpdGlvbi0uKiQn
CithbGxPZjoKKyAgLSAkcmVmOiAvc2NoZW1hcy9udm1lbS9udm1lbS55YW1sCisgIC0gaWY6Cisg
ICAgICBub3Q6CisgICAgICAgIHJlcXVpcmVkOiBbIHJlZyBdCisgICAgdGhlbjoKKyAgICAgIHBy
b3BlcnRpZXM6CisgICAgICAgICRub2RlbmFtZToKKyAgICAgICAgICBwYXR0ZXJuOiAnXnBhcnRp
dGlvbi0uKiQnCiAKICMgVGhpcyBpcyBhIGdlbmVyaWMgZmlsZSBvdGhlciBiaW5kaW5nIGluaGVy
aXQgZnJvbSBhbmQgZXh0ZW5kCiBhZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQotLSAKMi4zNS4z
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
