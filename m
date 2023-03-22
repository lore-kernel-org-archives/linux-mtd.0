Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7360C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 06:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGdjqR1BcRBDUXN79iW4DONxyzEYYXMqM2I7euS3DPo=; b=1m0IHhfyxo27WE
	dK37GYW8nGW7T0NEFaM3eJtM52Ui0fCUQE4L4Ks1/7bI4hX+ihSZsH0Wru0KKPqb749oq/LncV5EO
	jvDhEHSRK9OxHMMQm8MDNMxU9BDbJul+tHn6FX6skzbyRdhRs1Btv77KikqbpqDdmvXveKI6q79Eh
	ZLQW2gK8dvEJ80qmanAD58EbHSdvm20o7sbr9anf19Ndmw9gDXSWVorp5vtTgsZsA5imxsbf1hKWC
	OVo7OWvRI4pFsctc7prC/SDOgl3CRn2pPRTZPtonyDC/SVL86bhU+yFRPPGOP3Wy5vqKnSWcb5AXV
	OC+UJa16zP9IA2d1Nz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9O-00EtoB-2g;
	Wed, 22 Mar 2023 06:40:46 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pes9J-00Etk4-0D
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 06:40:43 +0000
Received: by mail-lf1-x12a.google.com with SMTP id y20so22080449lfj.2
        for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2023 23:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679467239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+znX5tPTNkGmk0JqPSC8AVns2+lpyBiaG5wqS+7IkU=;
        b=upBa8JoJB+dW1aq5RxiwsD3VkAe3BDxYlaWXFj12EKZi/U6P/pmFw4z0Wol2+Q3ONE
         GPeGTQMnf3Y1MOjSItUZk2NBpKmmMBo2+n1YkFo2w4bXZsYZdqnHMjGf9Dcgmpv4hPFe
         gtupyxjvFkaZIBDwMMRD72xYjvQwDRWy9zHNEMjmpTmVSnSnBcaxrbVUc+rCBfp55OCB
         I3Dse1PcyhPrSrksuBrQqbz696fAQk3wM9VsoMlkmZRqceeKZxIBvfF1juQuZUzoZSOY
         hVFFujtKuwZe9BTgR6ot58r3kOf4Jf4LA72DOjyWQllDyougtq+zi0PWEo676/YxJgqJ
         l8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679467239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+znX5tPTNkGmk0JqPSC8AVns2+lpyBiaG5wqS+7IkU=;
        b=3lsoQX8Er1b3lTWIyWqTkqjsconmu1UA4woTOn00FcafbuTVo1kO5lLsCY1C+ywhgG
         tUwyuwoZOPKhaj2DWeuzb3AP1BOyR6UqBDILXAt60AJJ9q/o8NwELPDd2/oje01Fm89N
         tA/uD0p5AFG4k4HiI24dgNDpYEDNXxWfqFc2m0hV5kwO7jnJ6zU3K6r8ZImx3IsX1uma
         EE1O/5prepE4eu01JX0T+HNmtDQHgH5B7PPFiXnTpTmS8oQWJb5UFu14D/MKIVFz7L+2
         +9gitHEAYgsNf4WTp/3cv81D8xIh+XLMy+0YL41FZe1IA9xpQPlyabEj1opd1LXmdtPh
         sJbA==
X-Gm-Message-State: AO0yUKXEjWIRYX/4DLyOJE0twCN+7gvUbi9qgOVknovkbXPc0BGBl4yh
	MvT48dmFaGL/Wm3SAUhS4fqD6eylg/Wz4QUssq006Q==
X-Google-Smtp-Source: AK7set8Hp2tr7q5+wrvsbOObm6X3ICWNwQTG0szK8hhiPXxRRBMP8UDsjz0rg5nsIHz+J3PHlcoMfQ==
X-Received: by 2002:a05:6512:1285:b0:4e8:3cfe:98c7 with SMTP id u5-20020a056512128500b004e83cfe98c7mr337794lfs.4.1679467239263;
        Tue, 21 Mar 2023 23:40:39 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b004dafde0e7b7sm2462255lfl.279.2023.03.21.23.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 23:40:38 -0700 (PDT)
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
Subject: [PATCH v4 03/11] mtd: spi-nor: core: Update name and description of spansion_set_4byte_addr_mode
Date: Wed, 22 Mar 2023 06:40:25 +0000
Message-Id: <20230322064033.2370483-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
References: <20230322064033.2370483-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_234041_102993_77D2BB07 
X-CRM114-Status: GOOD (  11.06  )
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
aS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKaW5kZXggMmNiNzQyNWIz
Njk0Li5lODBkY2Q4NzE4OWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5j
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
cnVjdCBzcGlfbm9yICpub3IsIGJvb2wgZW5hYmxlKQogewogCWludCByZXQ7CiAKQEAgLTI1OTks
NyArMjYwNCw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5pdF9kZWZhdWx0X3BhcmFtcyhzdHJ1
Y3Qgc3BpX25vciAqbm9yKQogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBzcGlfbm9yX2dldF9m
bGFzaF9ub2RlKG5vcik7CiAKIAlwYXJhbXMtPnF1YWRfZW5hYmxlID0gc3BpX25vcl9zcjJfYml0
MV9xdWFkX2VuYWJsZTsKLQlwYXJhbXMtPnNldF80Ynl0ZV9hZGRyX21vZGUgPSBzcGFuc2lvbl9z
ZXRfNGJ5dGVfYWRkcl9tb2RlOworCXBhcmFtcy0+c2V0XzRieXRlX2FkZHJfbW9kZSA9IHNwaV9u
b3Jfc2V0XzRieXRlX2FkZHJfbW9kZV9icndyOwogCXBhcmFtcy0+b3RwLm9yZyA9ICZpbmZvLT5v
dHBfb3JnOwogCiAJLyogRGVmYXVsdCB0byAxNi1iaXQgV3JpdGUgU3RhdHVzICgwMWgpIENvbW1h
bmQgKi8KLS0gCjIuNDAuMC5yYzEuMjg0Lmc4ODI1NGQ1MWM1LWdvb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
