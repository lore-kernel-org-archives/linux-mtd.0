Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E67C369C8
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKsE4l4p6VQoG0JPrAtn5q8lyHe+y0zpgO26jqpXZ7M=; b=vLNzWBK6sRbZ3W
	CYCXEOFHxFSPS9G1ZIGhVsdDHkiUyKtvHtpIrHWjJkQUOzz8EhBDuIUt1B61XE6cpB+/U3tXYGnUx
	908a52egmT9lORzb7O9loUF4iL/5jAIxcPHsM+RW7Qfqask+3osEPPVuiWT3gkr5GDZQhWKkuibED
	S7e1FFYXFQQZVkDvbjZCm+dIJ7hrlGspoLI/din2A/UQ3ER3bGA1/H+cuVZcOLzwfidC/iBaxefm+
	XaZu5m1AGE1MP8qQRqlj136qmQKBMUK5qxcKS406iAF+c8SpDJ8Lo/IStYvpBSm9R+RszgW2o86JH
	g9i9JSOuCdG/MjR3bj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP3C-00000004is0-0B7u;
	Wed, 25 Sep 2024 10:15:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP39-00000004ir1-2eqs
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 10:15:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so61130655e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727259310; x=1727864110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH3iAq1TAeBK36lg95WliQsOcKLSEbditM8M8e4wTwE=;
        b=YrXgTvIi0MZWTQllnf7o/aP+iDfZ35hbGtglL34esLMroCmSRLZN8UWstbKzzDOksF
         e+ee1g2MF8PSfMpyfCWEPNCjHsXrw9PIxOIrqwOfuAFjMlgIBAUaeOIqM7AUaJ7z1GYl
         qlL02470t7DsjISBKWRTDeK2wxOIPNQjgTld/Q70Sxn+ClFiFvOdQ+69rey1bTxuKt2W
         vsRDRWOR+z0N7haE9Ff77jT2kSX21ZTblVoKSne6Rzsk+cHfdNaFn/zH0OtlCDt/7lwC
         zuEepnC6UGgnTDXoU2iDH7rqsezCBQgl10+raA0l6XNhtb8oVKud7SvLOmMGJ/8ROS+4
         bpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259310; x=1727864110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH3iAq1TAeBK36lg95WliQsOcKLSEbditM8M8e4wTwE=;
        b=ae1aGr4jCZQo/pvVzO8jFESHtVBsmu6ziafvCz7VF266yNjzH8DqvxkJC2+brQ1EhH
         CM1xXr/LMxd+crSyx3YuJSMm2BPbhcVNLVgB0jcYy7Tws1EkQQKnFBztA3UzRavWNOm+
         wVnwaV3noOLK/OGAslxzYgRyNONS5FAP/TvngwousGEeoumb8PVKFZoqiYOMRxWfmGjX
         QJY5JyuXKeyvzqWrG0p097ggnYsuftMWe2nWRThVdjFVoksRYYI35msyF+Tl37b//yUe
         ylRWSZ/zSF9Z2oYCBMBpo4V909ZLaJDi8baxGch2W2JylO8xGwZCp7SrM9z7Jek9FUUL
         XQug==
X-Forwarded-Encrypted: i=1; AJvYcCV03uXJpz5g+2Qz1cnSWOaB85/X88Rn+cY+65TP+gixg6BEDmGt58oMdNObpqJJOWGQpePs2gFh+PY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0KeQWcuBWKnEybCXRDCUDAvweB/cRxTIVQefSW5u1ugxjw4f7
	lZgJUxSoG6AkNGDIMvkdJCgdZC3m2V82LdAHgh21ciZvneWY5TgJ
X-Google-Smtp-Source: AGHT+IEDuMF7AmbE72EiRIWfTyj8UDV6s6Ac8BVbi1Q8y0Keq8ajGW2UzIm9myAL8AG1LUQcAtjFmA==
X-Received: by 2002:adf:f1ca:0:b0:374:c8cc:1bb1 with SMTP id ffacd0b85a97d-37cc24b575bmr1521519f8f.39.1727259309987;
        Wed, 25 Sep 2024 03:15:09 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37cbc1560a7sm3628194f8f.0.2024.09.25.03.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:15:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	upstream@airoha.com
Subject: [PATCH 1/3] of: also export of_update_property
Date: Wed, 25 Sep 2024 12:13:57 +0200
Message-ID: <20240925101422.8373-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925101422.8373-1-ansuelsmth@gmail.com>
References: <20240925101422.8373-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031511_712182_DF2E9FBE 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Similar to how is done for of_add_property and of_remove_property, also
export of_update_property to permit kmod to use this additional function
and correctly update entry in DT.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20603d3c9931..b2d523cf4925 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1746,6 +1746,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(of_update_property);
 
 static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 			 int id, const char *stem, int stem_len)
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
