Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6254BC4346E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BAE12083B
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kEIMw9MG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FqiS1pLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BAE12083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tY0eEx3ek7oV4jPqWAbimWQKlYlRMw6z4HVLGs7S7a0=; b=kEIMw9MGSZ7RbE1toSer1lVhb
	GCumW/guMuZzl8pIxuzMwP40E9N53aMdLtYQGFURo+r/oIB931Y4Dri1zcAzf1hv/Re6IvnFhDZab
	vUiiE8xIXLbFWHiZxIc/U69ZPP/p4zMNoR0/mFoh94GSTDDSHX46vXUm9e0ydBcrdKauECM0C2af2
	vac/BWN8LEmJ3XksU7PNiqOfZ2Vhrjh57+HLCiafvBpF1VZXLq/5HLvVhv+qPryhQGBTy8B4ioiLo
	CamI3WAYSB2+i6Qw1bXNq1arHcS8Kigqbyo5aIDw78+6DKsPEB6/yNLqTQlvox3J5hYRpSKHObXAv
	11EAXnQlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNADo-0002hN-3v; Tue, 29 Sep 2020 07:38:48 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNADk-0002eg-IM
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 07:38:45 +0000
Received: by mail-pg1-x535.google.com with SMTP id d13so3162787pgl.6
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 00:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdWBWycOR7hqnrWkAS/968ffsGtggCj05eK2mj3BCB4=;
 b=FqiS1pLOELhsie1j6o0jtnJTPSFx3IPvc4aqCryfkmmJUh1B0/lgotSCCfhx3/lgVg
 /G1mZmxmqphDiydxkCMDJ/7kqffyAyd9SWG8sQuPAER7/AQ5jD2KhfpSHEZZQwSfYDIx
 izDMSK863QYUkA3qK4I9TsLnrk+Ew2iNq3bW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdWBWycOR7hqnrWkAS/968ffsGtggCj05eK2mj3BCB4=;
 b=WxkS4ZrzySVw4cJU0w7pj/8dPdpo7M5O9P6LZzT8XLdBAEmMi5yBw0Hnp+ACkolc6Z
 afHZGf4Iwk884tVUBZOkemcjYTwPmUeXzboRRYQem8fJw8oqLt/bx7h/c3dvUqiZWBS0
 FaSr132M9VU5kIzC4g9g2Xe5TjPRWkTYxwAEyAWeNkLL8LFs8RJfwr3VUkwHUJ3a1mcT
 SZFfz+IK9fE21n4NJHt8PuuqrohDUJip9nOmTmEhfRkEVX/rg/7NQxAe9vBhrpLA1Yyl
 kXP3xjLC60hpJee7VO0hRK8haSv/1spZSa9CTIJ1vNZQHSUSLkLBm6ngL2/gfd3njKj/
 fujQ==
X-Gm-Message-State: AOAM532EaFLoarCxcLS8sxXqhp1NN6+MocFTdVvEb2IDdMNeFfDgqdwj
 ikZuavmQB+14HZdsfMF5pnaSOA==
X-Google-Smtp-Source: ABdhPJwNuDHXRv+fMFFWAdjedaKH/6FBQiVK43v8u2Xp+S4IkbmZzClOGt3qLT+WtsqfLXTRl0SFGg==
X-Received: by 2002:a63:5420:: with SMTP id i32mr2335677pgb.149.1601365121972; 
 Tue, 29 Sep 2020 00:38:41 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id e13sm3737317pjy.38.2020.09.29.00.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 00:38:41 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: spi: add mt8192-nor compatible string
Date: Tue, 29 Sep 2020 15:37:52 +0800
Message-Id: <20200929153320.v4.1.I4cd089ef1fe576535c6b6e4f1778eaab1c4441cf@changeid>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
In-Reply-To: <20200929073755.3741416-1-ikjn@chromium.org>
References: <20200929073755.3741416-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_033844_651946_88049D8B 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add MT8192 spi-nor controller support.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>

---

(no changes since v1)

 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index 42c9205ac991..55c239446a5b 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt7622-nor
               - mediatek,mt7623-nor
               - mediatek,mt7629-nor
+              - mediatek,mt8192-nor
           - enum:
               - mediatek,mt8173-nor
       - items:
-- 
2.28.0.709.gb0816b6eb0-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
