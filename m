Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72801C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 23:02:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E2261987
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 23:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E2261987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K911A0cupRLuDWprB6bABfjjfWRMogajLXJOKS+MvDI=; b=G0Qk6nrsjq5Ldl5ojGepEV7KFh
	hTTyOt+CUTBG0pqM8hmgMvwJynf7ZYnSozC3zgxnnTdlEDdPyN3dqF1FJf2qkqV/1rj+qaS/GmJnU
	/zTeS2uZVYBCMxrVN1cO1zvA7iTuNO00rF4ErS8qvC0B1Jn9QhH8E6vgGEeMrtKHzMg53uGwHGLae
	ZuPEJrGztUz9P4XAybSdu44Hp6x7ryIHv0YH5zVUry56IhBWaZfU7SPMicK+ajwWYDX844Gq2BMPb
	WJkrUSVNU0QUvwbmzqmZNdXEvGDkmOZwY/ubfc+VUC4Vjtq6rstPbYmCkGpUWDMof4JX3dnYZPrNm
	Ez86jj6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0sz-001oM1-39; Mon, 29 Mar 2021 23:01:29 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtVB-000j6i-So
 for linux-mtd@lists.infradead.org; Mon, 29 Mar 2021 15:08:29 +0000
Received: by mail-lj1-x22f.google.com with SMTP id u20so16269961lja.13
 for <linux-mtd@lists.infradead.org>; Mon, 29 Mar 2021 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDDmFmsHZgwdbTfVjpjnsy2iBOi2U6nao1mVmmYBSic=;
 b=NknxoUeYE+8xYhdPNOy4TCHwUS7oxr8ZVQfzM27GSP4VpPbF7/6IVGywf8ZvgLaHTo
 Mgm/UKLTFfhxbUWGeOcuNQX4L6kGmGP51YwiUFR0hD8Pbqo08sFuQDrJhTmd1S3JNYue
 EfVct2+dHyokXqR4qu49Z9Eu/YQ9luAi87+beCEJantV8kRrroyCyPpNPJU1B8QD/Caj
 1A3uTzvMVr/a4Yg7S/B0jo6vWs1gblfIYRsNHRkqNZNQrB8OxwhtvWCh0jr34HpurzJ/
 WYUrv5v9v+8NeUM/vsFTa7KNR3pV3iI89YUCuI1vQkpQd+L/szys8vREFjg5xDn2cwnA
 V2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDDmFmsHZgwdbTfVjpjnsy2iBOi2U6nao1mVmmYBSic=;
 b=LTuf+ZJoobHtUfSp3S1rsHGeDioOui5wDRZ8nlSDh05vwLP0zMpQg6q2SnnqGDWGb5
 aEdDNvZh8UIs7zFzSHmakg7rp1a4uMBVaHGsq5ED3NVywNJEBQlNxMWSaDZcbksUryRk
 L0SXWSKmlLnY1z/xzKc6+UOix4mtHso8UWwClQmwAnvxzcB5Eqb15e6PakzG9cYQ0ntc
 zzeBmKRe4/zXXwny0FQAzXlM1zEK2PaqZjnSmgexxVPSmBoKDugwVz/9B6+LNibqpH4v
 1tj28fh9z1b3AUhEGMUSL4LY1AnSI3JfsVtdIfHOkEmbnKGBuFDmMePbEl5vEm5squsi
 +dlQ==
X-Gm-Message-State: AOAM532V5S0A6exZfGRSEOqA+S+m75v9c0RJhmkRPCcdf7Oea3IAUG9I
 xwrPvkyTH1EveiiFOW7bk2d+1h3OvILWlw==
X-Google-Smtp-Source: ABdhPJyzv+4TA8ltw+KgeNf2jfYPXfh2rNdpNFCj/iUr6AuE7N4cB3x+gwlwCt91EN/hXRPh9jYjJQ==
X-Received: by 2002:a2e:8591:: with SMTP id b17mr17952575lji.230.1617030504907; 
 Mon, 29 Mar 2021 08:08:24 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl.
 [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id d4sm1865477lfs.45.2021.03.29.08.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 08:08:24 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Ansuel Smith <ansuelsmth@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC] dt-bindings: mtd: allow NVMEM cells in BCM4908 partitions
Date: Mon, 29 Mar 2021 17:07:23 +0200
Message-Id: <20210329150723.26584-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_160828_206365_D38A5335 
X-CRM114-Status: GOOD (  15.11  )
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKRXZlcnkgTVREIHBhcnRp
dGlvbiBjYW4gYmUgTlZNRU0gcHJvdmlkZXIgbm93LiBJdCdzIG5vdCBoYW5kbGVkIGJ5IHRoZQpz
aGFyZWQgcGFydGl0aW9uLnlhbWwgc28gYWRkIHByb3BlciAiY29tcGF0aWJsZSIgdG8gdGhlIEJD
TTQ5MDguCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Ci0tLQpJZGVhbGx5IEknZCBsaWtlIHRvIGhhdmU6CjEuIHBhcnRpdGlvbi55YW1sIGFsbG93aW5n
ICJudm1lbS1jZWxscyIgYnkgdXNpbmcgbnZtZW0tY2VsbHMueWFtbAoyLiBicmNtLGJjbTQ5MDgt
cGFydGl0aW9ucy55YW1sIHVzaW5nIHBhcnRpdGlvbi55YW1sIGFuZCBleHRlbmRpbmcgdGhlCiAg
IGNvbXBhdGlibGUgbGlzdCBieSAiYnJjbSxiY200OTA4LWZpcm13YXJlIgoKSSBkb24ndCBrbm93
IGlmIHN1Y2ggYSBzb2x1dGlvbiBpcyBwb3NzaWJsZSB0byBpbXBsZW1lbnQgdXNpbmcgWUFNTD8K
ClByb3Bvc2VkIHNvbHV0aW9uIChSRkMpIGlzbid0IGEgcmVhbGx5IGNsZWFuIG9uZToKMS4gSXQg
ZHVwbGljYXRlcyAibnZtZW0tY2VsbHMiIHdoaWNoIGlzIGFscmVhZHkgaW4gdGhlIG52bWVtLWNl
bGxzLnlhbWwKMi4gR2VuZXJpYyAibnZtZW0tY2VsbHMiIHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBw
YXJ0aXRpb24ueWFtbAoKUm9iPyBIZWxwPyA6KQotLS0KIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sICAgICAgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4
LXBhcnRpdGlvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9icmNtLGJjbTQ5MDgtcGFydGl0aW9ucy55YW1sCmluZGV4IDdiMTEzZTVlMzQy
MS4uMjhhYTNiZGQxMTAzIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200OTA4LXBhcnRpdGlvbnMueWFtbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSxiY200
OTA4LXBhcnRpdGlvbnMueWFtbApAQCAtMzIsNyArMzIsOSBAQCBwYXR0ZXJuUHJvcGVydGllczoK
ICAgICAkcmVmOiAicGFydGl0aW9uLnlhbWwjIgogICAgIHByb3BlcnRpZXM6CiAgICAgICBjb21w
YXRpYmxlOgotICAgICAgICBjb25zdDogYnJjbSxiY200OTA4LWZpcm13YXJlCisgICAgICAgIGVu
dW06CisgICAgICAgICAgLSBicmNtLGJjbTQ5MDgtZmlybXdhcmUKKyAgICAgICAgICAtIG52bWVt
LWNlbGxzCiAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQogCiByZXF1aXJlZDoKLS0g
CjIuMjYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
