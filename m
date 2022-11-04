Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E63C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6A6eMtDaqxFgLsJN2qsmOBu75ggu2rPtGawlpUOGwWA=; b=T6P2EGqbXi3PEt
	wzuhBRyszVCiYZGHhSvZnlJm/aOcoD8jB7/8LkAgsZ8zbgt7rKQEyNP00VDneB4sYP6wcvDKFIKIS
	dskcxGBDa5WyoLhr8qea6GdH0+mUN9idI9SrobAr1AVJ9h0iL58hlUTt7Low3eQK0g1sFSOYo8y6d
	amwI8Dky18Kkq6P0R4Jkv32g5+nYFxLr6iUYFo9J87ZxpXKFgl4LOEwYbB0GcUsgfO6ArfCT8gJ1v
	IV0Bo2od7EyfzXDAPAaaaFy6Qp6WlLvgHjcTHHpbhi3fewbVMwin+kHnJtmFAILSlSkZ/KBoKLNXc
	e0o+xfJawH9AGrD1aWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsSP-0030uv-5P; Fri, 04 Nov 2022 08:53:45 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsSL-0030u6-Fm
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 08:53:42 +0000
Received: by mail-ed1-x52d.google.com with SMTP id a5so6583811edb.11
        for <linux-mtd@lists.infradead.org>; Fri, 04 Nov 2022 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6K3WLbhxOgDEZ9hXqPpZBln8equCl9q3CJzloOm20w=;
        b=VaWqn0XtodbhiJItcKfauFR5OaWGXYuLV0myA9mRKIkpXkwA+5VJhPaDHdGWF2URw6
         o4mFkAHj9Ws9pbqw8AUdvgzVpzJV44aRanXGq3tV9504fpqwQFhxsfwgi1/gk0hdhiuy
         lRlDOYbUcZZUwMAgimggG9kIiYiRcoyN/KUHLiX1Ics1sqhR1nEV9q1UP4kEImh/Kdfe
         oRi3Qtj6PTSWJ41WTW2JFcr90PjQ6p6jGCU/jZ4gvSvHaWqE72MvauvHS1gD8k4QO6Vm
         Y97mCrIVLTB212y3cUO5z+GzlGTglMCz4OKCSwX9h+R0VRI286LUJkkYE81P1fHLM7mt
         hhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6K3WLbhxOgDEZ9hXqPpZBln8equCl9q3CJzloOm20w=;
        b=kMFZbFTy2ktsxtwX4xp6+EMZXiJqYKJBAyQUksJkjGhhNTQ1iG5DCchSWH80ZTS5Xn
         GZd5rGrxjwMb71PyhaJWAYbPCSVOrA+tNsT+zD5t9Wdc0otmqu3Ot6Ds3i1cT67r3nLm
         /M5lLzMkC+e83ppMK3Z7oFW8sEw6GLVPe7WPqTcDNbFk5Et/5u6zgXmvyS/Rey241sdy
         1YamiIaewUM8efFPoP8bErcdCEseSUQDagforvBQeluq07PCNGqgwXfF81X6v9awvJBk
         b9dfmbu2UB6UNdPDV4KNDjs4G7/jHe5B8qusDQaSCbbJ5VXVxzNv4bo5O5N5zIiyoDq2
         gmeQ==
X-Gm-Message-State: ACrzQf2mRSceUGiTKHM+kxTby7D88Kc9Ofb4LZ9YijD+o2SQ07wlPZ0O
	6Sy9TXiTGc2F0Ph/nOMG19E=
X-Google-Smtp-Source: AMsMyM6N+RMg7YeRTFpM41/wWK3DkLMaDp6j2Jy+9Sx1Ou7kZ0Ctho+WCaMtkX0foLXQEl8iBVBodg==
X-Received: by 2002:a05:6402:4505:b0:451:1551:7b14 with SMTP id ez5-20020a056402450500b0045115517b14mr13428747edb.300.1667552016512;
        Fri, 04 Nov 2022 01:53:36 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id f12-20020a170906c08c00b0078d21574986sm1477599ejz.203.2022.11.04.01.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 01:53:36 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] dt-bindings: mtd: brcm,brcmnand: update interrupts description
Date: Fri,  4 Nov 2022 09:53:16 +0100
Message-Id: <20221104085316.24499-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_015341_585980_CDDEC069 
X-CRM114-Status: GOOD (  11.86  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKMS4gRE1BIGFuZCBFRFUg
YXJlIG11dHVhbGx5IGV4Y2x1c2l2ZTogZG9uJ3QgYWxsb3cgYm90aCBhdCB0aGUgc2FtZSB0aW1l
CjIuIFJlcXVpcmUgaW50ZXJydXB0LW5hbWVzIGZvciAyKyBpbnRlcnJ1cHRzIHRvIGF2b2lkIC9n
dWVzc2luZy8KClJlcG9ydGVkLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWls
LmNvbT4KU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgot
LS0KSSBhbHNvIHRob3VnaHQgb2Ygc29tZXRoaW5nIGxpa2U6CiAgaW50ZXJydXB0czoKICAgIG1p
bkl0ZW1zOiAxCiAgICBpdGVtczoKICAgICAgLSBkZXNjcmlwdGlvbjogTkFORCBDVExSRFkgaW50
ZXJydXB0CiAgICAgIC0gYW55T2Y6CiAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBGTEFTSF9ETUFf
RE9ORSBpZiBmbGFzaCBETUEgaXMgYXZhaWxhYmxlCiAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBG
TEFTSF9FRFVfRE9ORSBpZiBFRFUgaXMgYXZhaWxhYmxlCih0byBhdm9pZCB0ZXh0LWZvcm0gIm9y
IiBpbiAiZGVzY3JpcHRpb24iKSBidXQgdGhhdCBkaWRuJ3Qgd29yazoKICBDSEtEVCAgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wcm9jZXNzZWQtc2NoZW1hLmpzb24KLi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbDogZXJy
b3IgY2hlY2tpbmcgc2NoZW1hIGZpbGUKICBTQ0hFTUEgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wcm9jZXNzZWQtc2NoZW1hLmpzb24KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9icmNtLGJyY21uYW5kLnlhbWw6IGlnbm9yaW5nLCBlcnJvciBpbiBzY2hl
bWE6IHByb3BlcnRpZXM6IGludGVycnVwdHMKLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvYnJjbSxicmNtbmFuZC55YW1sICAgfCAxNiArKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC55YW1sCmlu
ZGV4IGRkNWE2NDk2OWUzNy4uY2Q2MDZhMjFiNTNiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQueWFtbApAQCAtODYs
MTUgKzg2LDE1IEBAIHByb3BlcnRpZXM6CiAgICAgbWluSXRlbXM6IDEKICAgICBpdGVtczoKICAg
ICAgIC0gZGVzY3JpcHRpb246IE5BTkQgQ1RMUkRZIGludGVycnVwdAotICAgICAgLSBkZXNjcmlw
dGlvbjogRkxBU0hfRE1BX0RPTkUgaWYgZmxhc2ggRE1BIGlzIGF2YWlsYWJsZQotICAgICAgLSBk
ZXNjcmlwdGlvbjogRkxBU0hfRURVX0RPTkUgaWYgRURVIGlzIGF2YWlsYWJsZQorICAgICAgLSBk
ZXNjcmlwdGlvbjogRkxBU0hfRE1BX0RPTkUgKGlmIGZsYXNoIERNQSBpcyBhdmFpbGFibGUpIG9y
IEZMQVNIX0VEVV9ET05FIChpZiBFRFUgaXMgYXZhaWxhYmxlKQogCiAgIGludGVycnVwdC1uYW1l
czoKICAgICBtaW5JdGVtczogMQogICAgIGl0ZW1zOgogICAgICAgLSBjb25zdDogbmFuZF9jdGxy
ZHkKLSAgICAgIC0gY29uc3Q6IGZsYXNoX2RtYV9kb25lCi0gICAgICAtIGNvbnN0OiBmbGFzaF9l
ZHVfZG9uZQorICAgICAgLSBlbnVtOgorICAgICAgICAgIC0gZmxhc2hfZG1hX2RvbmUKKyAgICAg
ICAgICAtIGZsYXNoX2VkdV9kb25lCiAKICAgY2xvY2tzOgogICAgIG1heEl0ZW1zOiAxCkBAIC0x
NzMsNiArMTczLDEzIEBAIGFsbE9mOgogICAgICAgICAgICAgLSBjb25zdDogbmFuZAogICAgICAg
ICAgICAgLSBjb25zdDogaXByb2MtaWRtCiAgICAgICAgICAgICAtIGNvbnN0OiBpcHJvYy1leHQK
KyAgLSBpZjoKKyAgICAgIHByb3BlcnRpZXM6CisgICAgICAgIGludGVycnVwdHM6CisgICAgICAg
ICAgbWluSXRlbXM6IDIKKyAgICB0aGVuOgorICAgICAgcmVxdWlyZWQ6CisgICAgICAgIC0gaW50
ZXJydXB0LW5hbWVzCiAKIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKIApAQCAtMTkwLDYg
KzE5Nyw3IEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgcmVnLW5hbWVzID0gIm5hbmQiLCAiZmxh
c2gtZG1hIjsKICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmhpZl9pbnRyMl9pbnRj
PjsKICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MjQ+LCA8ND47CisgICAgICAgICAgICBpbnRl
cnJ1cHQtbmFtZXMgPSAibmFuZF9jdGxyZHkiLCAiZmxhc2hfZG1hX2RvbmUiOwogCiAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+
OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
