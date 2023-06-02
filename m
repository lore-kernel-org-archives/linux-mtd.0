Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829FBC7EE2A
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w4MA7R6qzjZ3rjur0YDQljiuE/0fiBb1OBqk/j9cRMk=; b=DzsdddO0ZbSnTW
	+YpP414fcDsM3XidH8pgHf+OnzN5RthPFD+R5Z9L7pPH/fmoBLgXJ9VDLiCV02WcU5kv7xKFhnx+9
	mobFq6sdLUu6hnub4YuTPo/b+6M7ZtL2PPrrtCChnT4R6GEKp9xI3CIETlp+v8CU5VoAv4nzmrDiA
	HIRqZDYPbxBCOOXfDUXvOQckvJepuE76FjiCyAqQm/57u8atBw8Vqhd1OEsWket9rIIZplGeAsPU1
	IjssFRijsiHAd9NSUqWQAMO+AQwP7yX/c+PBCtjh5qrIlGUSW2XmlJPP4SR+KmgFD68WW+Akn1kGN
	Ek/3AtbQdfwJ/BRd7mpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57MN-007MLm-1G;
	Fri, 02 Jun 2023 16:10:39 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57MK-007MJC-1X
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 16:10:37 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1a653b409so21901891fa.0
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2023 09:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685722231; x=1688314231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j1ZEEeRGUGH3H/iMpk1TZJqcGKpfUDVEFjxjQYGhSHo=;
        b=nhRjaCOe35BuO5WiBy9S5jcrAiy6h4/AOQwSbqggLC0HNm3y6KrHkNd+vcxJ/2GklB
         +8u5i7hZxZeYrUPJU5R0yPUFfd1wJj6rAiA4aNacvSSZPgXcQJnFH6G/s++fo2lv6Bt8
         3J5H6NvW2WuzaGFFq0ncAD4PVcXT1MeyxxmsyKJEt8YTQ7VM4yAlw3OQsMhqQJCsnC4w
         o/e/xYiZS85ss37af4wkDfVnBQocb+EOfu5gH6j4GOi7ew0wQ/BolEUsVR9pLK6bCZb+
         WQc6XNeIdvLLKj2tDN4QFDuIwX8O5YaMkFBsjM3fZfil9hqvJxM/Isha6fHGsJYtvRTq
         KbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722231; x=1688314231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1ZEEeRGUGH3H/iMpk1TZJqcGKpfUDVEFjxjQYGhSHo=;
        b=OfXtRsAegU5ut+9XQtOd2Vh6krq0ERczcJKesV5BuiOcPhHhjtXRh2dewPeHFEoeKc
         lS7Js8QekgH3MEH8Ji9upuQcPCuNYbxfskL/GekvDB+PQdDxIKfaa9dP6n8AUwvZS124
         1C5t1qM+ROVp1FjyJoVMDSZQGqJ6SKFyTD37wUS/x42xoF8W1ps8grqHUh/sao1p+DuG
         w1QX0opsuBiefqHTVn/4GGJKxDZwPYpc0HKj79CP6fouGC9xiwkXoCqt142yWR59IoEj
         eIspUXDcF0l5zd+yn10jX3g+BkJoDZgYK/cAzkJ5LNJ5ssuyLpUo/nruMTYwqDhpvk5I
         3Xig==
X-Gm-Message-State: AC+VfDytr4YhR2mmnCgvV2KObva1MydhuyIL0h/iPdKpMU1nNAQL0IGm
	g0/6rGYLsPB+FSF4wyrME20=
X-Google-Smtp-Source: ACHHUZ6bUUlLahxD+Eorcta9KYVd14vH1asfia/NmpqGxGzTxSiElWhc7kxyBWqNdarSm2DPFbJWbw==
X-Received: by 2002:a05:651c:32e:b0:2af:23dd:fd71 with SMTP id b14-20020a05651c032e00b002af23ddfd71mr64768ljp.25.1685722231203;
        Fri, 02 Jun 2023 09:10:31 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id d13-20020a2e890d000000b002a8ae16ac8csm267990lji.18.2023.06.02.09.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:10:30 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: mtd: partitions: Include TP-Link SafeLoader in allowed list
Date: Fri,  2 Jun 2023 18:10:23 +0200
Message-Id: <20230602161023.14739-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_091036_513413_B2CC4447 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBmaXhlcyB2YWxp
ZGF0aW9uIG9mIExpbnV4IGhvc3RlZCBEVFMgZmlsZXMgZm9yIE5vcnRoc3RhciBiYXNlZApUUC1M
aW5rIHJvdXRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL3BhcnRpdGlvbnMueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL3BhcnRpdGlvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwKaW5kZXggMmVkYzY1ZTBlMzYxLi4xZGRh
MmM4MDc0N2IgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy9wYXJ0aXRpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbnMueWFtbApAQCAtMjEsNiArMjEs
NyBAQCBvbmVPZjoKICAgLSAkcmVmOiBsaW5rc3lzLG5zLXBhcnRpdGlvbnMueWFtbAogICAtICRy
ZWY6IHFjb20sc21lbS1wYXJ0LnlhbWwKICAgLSAkcmVmOiByZWRib290LWZpcy55YW1sCisgIC0g
JHJlZjogdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sCiAKIHByb3BlcnRpZXM6CiAg
IGNvbXBhdGlibGU6IHRydWUKLS0gCjIuMzUuMwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
