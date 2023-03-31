Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AF7C77B6D
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dL9V8IudKKkhIgY93Z8lSnTvmcCdduVPWIpPfZLYy8c=; b=KNzMfPr1boFkQQ
	hXg02/+L8Z6q8LzFmaJevDLVGJP1kMw/DW0VzbB/exSjt2/V5u1qbIKbL9tiaTmHVz9tadOKHoQsI
	dVNEMMz1UqdEDHZr/FdyKNo41wYzKYZ/VyF/92ov913r/g4Na+uRzb2rUCIasx9Yyb05MlAFyCr3G
	/fJQDuFEH7eYj70t1LYN2dXze46P76UJV+kALQf2TTaYdT1DVH0RT/D/nzfwuV5QwJlCY7VOveA9B
	JO5srXH1xckNBhUmvoEMS8R0tHl2D2nVxoisH8PANB7L6ZC/nuLq/VfCmMxkBUE6czkmXJqSYGXNX
	JuUzKKvhzZIUzN9GkD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9St-006D0U-0Q;
	Fri, 31 Mar 2023 07:46:27 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9So-006Ct3-0Q
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 07:46:24 +0000
Received: by mail-lf1-x135.google.com with SMTP id h11so20823758lfu.8
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680248775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pMraFU/tPRiVpv9JeCuToE/iyKjmq4cdy7RBmS30j8=;
        b=a2xc6P3BIbU9HViqxC5luoJqe1Z5BNokKvWSvidpmBZQN5PNJhVz3uxhS4mrWBLcpg
         hef4LAuCVpK8v/EBNUUMDskjn01qaaAJ1nIhSRWQTYo4IOAmY5lMLmNe98tDHkWfIlMs
         oPcADQLgvvqQwX3XhD6G4mFy+L/9CaaLvpUEmbr8RUVaGZ7UTw3tZ9q6vfMjVtgUE7um
         1m7mTbjJUbmYyu/i46Ys1VUVzZzfg85pc/nUjZxux1XulbTJl06No2LT2LJIXbond1jO
         t9sOIpwsVQudNbF5FAr8rpk1YWaBTB0zaZKEEHAqOHZzG8ZMm2pV3L6WxF9Kx28ffJYy
         GaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pMraFU/tPRiVpv9JeCuToE/iyKjmq4cdy7RBmS30j8=;
        b=uxXJvT+vgfsjTdZU9r94f93NAkh0Fb6zq40hj45rVlGNyv/0IPYvpIpRf01kuzpOND
         IdjPPSSSzuRLYrvyNV0mqQ2o/Qvma1nWDiuTcZ5sUoQ2AbDj5neNAF5n/l/skF79qPoe
         rKBmV4iYbp5MERGBZWHp09iouPAA+p78lXIdUw/xdSV1rCGIB0dwX2D6Job2RXhWgMWb
         yzO6/Bu+t+8ZSbncPldbRdTDrVaIqdIYuc2lOLO2x1XInqdlO9XSzAUDRQQrKdM0IIzr
         hPw8OS034701I2rBTSmpQN0Br/VW0cp8wkhx2waNLBSShPyunB1HeyJF0HlP6i86bc0H
         SwnQ==
X-Gm-Message-State: AAQBX9cP7UxoVCfgLyA4k2jvKFdtaIAtXQ6gLHNFALI8HtoxNsFC7ZZx
	OlnhzceO48/N7AI20RLuiM7itw==
X-Google-Smtp-Source: AKy350bGAI8Dt1/8LPSgMhIVrpvYp0Y5IEXcym6m0mizAvSfJXRcOZFguoi74BWJ/MBVXaYwXCP2Ww==
X-Received: by 2002:a19:c20a:0:b0:4a4:68b9:60ae with SMTP id l10-20020a19c20a000000b004a468b960aemr8189955lfc.57.1680248775241;
        Fri, 31 Mar 2023 00:46:15 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e8794000000b0029573844d03sm241201lji.109.2023.03.31.00.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:46:14 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	Takahiro.Kuwano@infineon.com,
	bacem.daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 03/10] mtd: spi-nor: core: Update name and description of spansion_set_4byte_addr_mode
Date: Fri, 31 Mar 2023 07:45:59 +0000
Message-Id: <20230331074606.3559258-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
References: <20230331074606.3559258-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_004622_213039_656882A5 
X-CRM114-Status: GOOD (  10.52  )
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

UmVuYW1lIG1ldGhvZCB0byBzcGlfbm9yX3NldF80Ynl0ZV9hZGRyX21vZGVfYnJ3ciBhbmQgZXh0
ZW5kIGl0cwpkZXNjcmlwdGlvbi4gVGhpcyBtZXRob2QgaXMgZGVzY3JpYmVkIGluIEpFU0QyMTYg
QkZQVFtTRkRQX0RXT1JEKDE2KV0sCkJJVCgyOCkgYW5kIEJJVCgyMCkuCgpTaWduZWQtb2ZmLWJ5
OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKaW5kZXggMDdiZTgxYWZk
YzMzLi5lOGY2MTQxYzBlZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
CisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCkBAIC01NjQsMTUgKzU2NCwyMCBAQCBp
bnQgc3BpX25vcl9zZXRfNGJ5dGVfYWRkcl9tb2RlX3dyZW5fZW40Yl9leDRiKHN0cnVjdCBzcGlf
bm9yICpub3IsIGJvb2wgZW5hYmxlKQogfQogCiAvKioKLSAqIHNwYW5zaW9uX3NldF80Ynl0ZV9h
ZGRyX21vZGUoKSAtIFNldCA0LWJ5dGUgYWRkcmVzcyBtb2RlIGZvciBTcGFuc2lvbgotICogZmxh
c2hlcy4KKyAqIHNwaV9ub3Jfc2V0XzRieXRlX2FkZHJfbW9kZV9icndyKCkgLSBTZXQgNC1ieXRl
IGFkZHJlc3MgbW9kZSB1c2luZworICoJCQlTUElOT1JfT1BfQlJXUi4gVHlwaWNhbGx5IHVzZWQg
YnkgU3BhbnNpb24gZmxhc2hlcy4KICAqIEBub3I6CXBvaW50ZXIgdG8gJ3N0cnVjdCBzcGlfbm9y
Jy4KICAqIEBlbmFibGU6CXRydWUgdG8gZW50ZXIgdGhlIDQtYnl0ZSBhZGRyZXNzIG1vZGUsIGZh
bHNlIHRvIGV4aXQgdGhlIDQtYnl0ZQogICoJCWFkZHJlc3MgbW9kZS4KICAqCisgKiA4LWJpdCB2
b2xhdGlsZSBiYW5rIHJlZ2lzdGVyIHVzZWQgdG8gZGVmaW5lIEFbMzA6QTI0XSBiaXRzLiBNU0Ig
KGJpdFs3XSkgaXMKKyAqIHVzZWQgdG8gZW5hYmxlL2Rpc2FibGUgNC1ieXRlIGFkZHJlc3MgbW9k
ZS4gV2hlbiBNU0IgaXMgc2V0IHRvIOKAmDHigJksIDQtYnl0ZQorICogYWRkcmVzcyBtb2RlIGlz
IGFjdGl2ZSBhbmQgQVszMDoyNF0gYml0cyBhcmUgZG9u4oCZdCBjYXJlLiBXcml0ZSBpbnN0cnVj
dGlvbiBpcworICogU1BJTk9SX09QX0JSV1IoMTdoKSB3aXRoIDEgYnl0ZSBvZiBkYXRhLgorICoK
ICAqIFJldHVybjogMCBvbiBzdWNjZXNzLCAtZXJybm8gb3RoZXJ3aXNlLgogICovCi1zdGF0aWMg
aW50IHNwYW5zaW9uX3NldF80Ynl0ZV9hZGRyX21vZGUoc3RydWN0IHNwaV9ub3IgKm5vciwgYm9v
bCBlbmFibGUpCitzdGF0aWMgaW50IHNwaV9ub3Jfc2V0XzRieXRlX2FkZHJfbW9kZV9icndyKHN0
cnVjdCBzcGlfbm9yICpub3IsIGJvb2wgZW5hYmxlKQogewogCWludCByZXQ7CiAKQEAgLTI5NjQs
NyArMjk2OSw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5pdF9kZWZhdWx0X3BhcmFtcyhzdHJ1
Y3Qgc3BpX25vciAqbm9yKQogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBzcGlfbm9yX2dldF9m
bGFzaF9ub2RlKG5vcik7CiAKIAlwYXJhbXMtPnF1YWRfZW5hYmxlID0gc3BpX25vcl9zcjJfYml0
MV9xdWFkX2VuYWJsZTsKLQlwYXJhbXMtPnNldF80Ynl0ZV9hZGRyX21vZGUgPSBzcGFuc2lvbl9z
ZXRfNGJ5dGVfYWRkcl9tb2RlOworCXBhcmFtcy0+c2V0XzRieXRlX2FkZHJfbW9kZSA9IHNwaV9u
b3Jfc2V0XzRieXRlX2FkZHJfbW9kZV9icndyOwogCXBhcmFtcy0+b3RwLm9yZyA9ICZpbmZvLT5v
dHBfb3JnOwogCiAJLyogRGVmYXVsdCB0byAxNi1iaXQgV3JpdGUgU3RhdHVzICgwMWgpIENvbW1h
bmQgKi8KLS0gCjIuNDAuMC4zNDguZ2Y5MzhiMDkzNjYtZ29vZwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
