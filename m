Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2011AC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D214C20756
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 12:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nq/uW6bY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1EQgOzY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D214C20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5XftCI2E4HTpFW93qn2dOra0jNO7zXrHPrr7PMoja0=; b=Nq/uW6bYiVh3YD
	Tq92TMegDc4Mu17n3HDCOCME17o2eSMxeDoc2Fw232u/Y9nSVbdH7H79RxoGjsI4lcEKIBvnhkRpj
	crtacz+PccPMme0NUFjWwGBXcbDmv3q8qH957P+v0HXj4QRboNa/ztPv83I8FRAfoVWMU9RFhrIYD
	7A938naB2O/grwjH++elaXxHXV7vPo398LtVuAgSGvQt1xkkOqEuYRoPvAUN2/4Uk+A9iYsm3KQ1R
	lC7j2y/7T/SLDsEPBppwulI3lPrEuaTCH95rnnzmJmUC49SaOFKUN5DHS3PijvL+O4cvfZhdblbi7
	w50CgB3vkhItSAtT1kvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6bO-0006tf-L4; Fri, 22 May 2020 12:16:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6aK-0005qa-Uv
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 12:15:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id n18so9611060wmj.5
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4yNx1y9U5EgzuiFpfmnXPZkM6PmgiQitcz5MxCPQ2c=;
 b=W1EQgOzYXSJQprjQLjvwtwJslRvrFbEUVhfTY06l99jlCnYkt0QrECz4ixvFb+WzkF
 nI5KWI9hssaaSX0BF/ddFhWF+YZwDoqE/JvniLs6z4NRUltpgVrkVVzc6YGvwjHxjR61
 rsMhc5f3wyCCj08QWQq2x5BAoCTxbaaiKhZBVts4UiaobRd/E4UPwgStLYpEcyBRD8nz
 VAsZiCjCtQQOAgvPObvDR0Eq9uIbCLYVEU59KtTQLieH3H89HUjqITJhUO+SNIfYa1R4
 L7p5yIUoOLPyibrL1KFoerfbax7JzrmV9gDnkzxWCalRSO83m1yUuHpmvkEST4KltoWo
 bM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4yNx1y9U5EgzuiFpfmnXPZkM6PmgiQitcz5MxCPQ2c=;
 b=TXKAI5yFrbpbCQlpZIA63EsTJ98GF3kfouaJc03Qw0fvvt4WVAee+m4SYXWkRleqQp
 xc8xkijFmYTO672eugbjPxQH8gVE8HJwrlzcJ4BODbRwh62ZwFaI3inKRVeJJddnKM9p
 JD2rcqZIHPR7wj/d0ZTtqijZLQTRUw+w8Dod8ver+3JCJhjLB0pSP/acnJgIv1VUAsd4
 F2TokrUlL+IqWMoyXvaD4k3ik/gMk26V0lMb2w4r1Nfpfx+SQPcM2sHgM7W/hVSx6xrT
 d4CB2kDg6Nb1YMk/zbosE1PRfsqrirZh2cC5XHMDjnkkBY8Cmz3WghoenZljM0XmAGJC
 fnNg==
X-Gm-Message-State: AOAM532KdUeXxeD8zFw4oW2EkkHxu0Qq1GGTw9R/2Z88nrAqCGejDVjr
 +P2MFfUcDwECXi98tUTMq/I=
X-Google-Smtp-Source: ABdhPJzx/3cvIYVr1YzP8V+5en8oMTO7gk7yIRawx1VQsZ5Waso3HWY83zQu4HfIjZirndiO+apE1Q==
X-Received: by 2002:a1c:3bc2:: with SMTP id
 i185mr12764224wma.157.1590149731455; 
 Fri, 22 May 2020 05:15:31 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id g6sm9293784wrp.75.2020.05.22.05.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:15:31 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date: Fri, 22 May 2020 14:15:23 +0200
Message-Id: <20200522121524.4161539-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522121524.4161539-1-noltari@gmail.com>
References: <20200522072525.3919332-1-noltari@gmail.com>
 <20200522121524.4161539-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_051533_021267_AC6B7A66 
X-CRM114-Status: UNSURE (   7.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWRkZWQgYnJjbSxicmNtbmFuZC12Mi4xIGFuZCBicmNtLGJyY21uYW5kLXYyLjIgYXMgcG9zc2li
bGUgY29tcGF0aWJsZQpzdHJpbmdzIHRvIHN1cHBvcnQgYnJjbW5hbmQgY29udHJvbGxlcnMgdjIu
MSBhbmQgdjIuMi4KClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+Ci0tLQogdjQ6IG5vIGNoYW5nZXMuCiB2Mzogbm8gY2hhbmdlcy4KIHYy
OiBhZGQgbmV3IHBhdGNoLgoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
YnJjbSxicmNtbmFuZC50eHQgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNt
LGJyY21uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJj
bSxicmNtbmFuZC50eHQKaW5kZXggMDU2NTFhNjU0YzY2Li40NDMzNWE0ZjhiZmIgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50
eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9icmNtLGJyY21u
YW5kLnR4dApAQCAtMjAsNiArMjAsOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAgICAgICAg
ICAgICAgICAgICAgImJyY20sYnJjbW5hbmQiIGFuZCBhbiBhcHByb3ByaWF0ZSB2ZXJzaW9uIGNv
bXBhdGliaWxpdHkKICAgICAgICAgICAgICAgICAgICAgIHN0cmluZywgbGlrZSAiYnJjbSxicmNt
bmFuZC12Ny4wIgogICAgICAgICAgICAgICAgICAgICAgUG9zc2libGUgdmFsdWVzOgorICAgICAg
ICAgICAgICAgICAgICAgICAgIGJyY20sYnJjbW5hbmQtdjIuMQorICAgICAgICAgICAgICAgICAg
ICAgICAgIGJyY20sYnJjbW5hbmQtdjIuMgogICAgICAgICAgICAgICAgICAgICAgICAgIGJyY20s
YnJjbW5hbmQtdjQuMAogICAgICAgICAgICAgICAgICAgICAgICAgIGJyY20sYnJjbW5hbmQtdjUu
MAogICAgICAgICAgICAgICAgICAgICAgICAgIGJyY20sYnJjbW5hbmQtdjYuMAotLSAKMi4yNi4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
