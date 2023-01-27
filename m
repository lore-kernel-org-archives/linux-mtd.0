Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C14C61D97
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfh5eqGuxpkMTY7HrVKU34z3niFVLDS+pOWjziymGeA=; b=eecNAB1DZRed/N
	sxqqD9LgtYOJ83akQLLPyv3SoGN2o/0S1WyLIpbB27tMJQ/3XKGJz6U3yc/E3bZD2kUglr2oTsxo+
	MvWUy8wrpFtgQWSQZGjjsoRZRn/yFzgriHZW+FR553SJx/+wLOzGjAZipW5/rYQWzVCK0i+wmFPFm
	ufCEwHjOR26VGAmkjsMzrgF2nINONprwrKI72XQSEmDI5kObM0DX/niqRD6aCJFLQ2xrQnMlOsY9A
	DJUi7K3KafYKL26lH6N6itZGrPdLEHTNnqy/Mlv/BIynJl/F3vHZcc9JSSFLwds2VVpPzrPvlrAwJ
	ebJmvMihto7/1JNqwwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLLAD-00DhrF-1w; Fri, 27 Jan 2023 09:36:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLL62-00DgGD-LG
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2023 09:32:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id l8so2997028wms.3
        for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bk9rrRbVlBSUREXw1iLQlsEZh4LHFBUluT2+RY/DXog=;
        b=T4ho7Z56EkelNKuLOIS7cADyCVSEQ8LKxCT/HEcCYIM9LjiuPwF5dDpt/48Ki3aOYF
         /X1dONb0m0tFA8HRxbGg/ELLlsV82x274Dsht5yhsCoc0Z1z+XageqYoXhIjIg9dOyZ2
         wmCG2WmL1hQ3eaP7KZima2CGPK1YWOI9aOYcnlqhRaWqcmxI/+BQu4FzDLISdHXsfkkt
         OXuuDN+AK9ozvh9AerLh0LNm14jNUVLcxGDpUiCq+QzWmirbFguu/Fql/MOaCopNqCVk
         Lw1ey9dHYDYMiYGsF7Q2qJlMsrMYV3G23lmLT98Jpf2H+SRM7mYpr1WNPIIiaHar9QuI
         XIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bk9rrRbVlBSUREXw1iLQlsEZh4LHFBUluT2+RY/DXog=;
        b=Z+TD3Pk/uSoxbm/AY5OYsbHk0krjmGrFjBcTUNVVQF4JOGTx5IKnVfMhGXA9vzJLWs
         B9/i54QIdICdia7vBmhlClECq7/ADIYZCG4BoakNrA+lIvcSeEWnr88YC9YrutrKj9eY
         OIQg4Fq1x7abHto5EygvxOG11zBH/3Qjnv2r2GZkRVN3y7aX5Z2RX9a2uzw538RU+0FO
         z6O0t7jE9+OEMJfGEZWN6Hk9zkhZPHX86JQ2D7bc8uBHQfBH6OfBWFP79pjddr0fiocX
         y6WCwh37lcAGAnrPP4WX+ScWCrntEngdBLLVzSDlaJcpyxeNBA7mFgTKuplTDSOkInRM
         JPQQ==
X-Gm-Message-State: AFqh2koewNiiVw6n8Gz5wKmnGJfxc7hYanPv131kp6B9jWkkR/0lufBf
	zD2kxViwpiZcUmH42zM1LTHV9A==
X-Google-Smtp-Source: AMrXdXuAo2Nkeby8FQaCuLvu5bATGCZjCqz2ulVwr97qbd2CrEuId5snzSLLdj6GWfPdbIO6KKjm1A==
X-Received: by 2002:a05:600c:54d0:b0:3d9:7847:96e2 with SMTP id iw16-20020a05600c54d000b003d9784796e2mr38265609wmb.2.1674811949873;
        Fri, 27 Jan 2023 01:32:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm3795265wmn.19.2023.01.27.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:32:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Marek Vasut <marex@denx.de>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] dt-bindings: serial: restrict possible child node names
Date: Fri, 27 Jan 2023 10:32:17 +0100
Message-Id: <20230127093217.60818-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_013234_726947_245E1608 
X-CRM114-Status: GOOD (  11.47  )
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

The re-usable serial.yaml schema matches every property with ".*"
pattern, thus any other schema referencing it will not report unknown
(unevaluated) properties.  This hides several wrong properties.  It is
a limitation of dtschema, thus provide a simple workaround: expect
children to be only of few names matching upstream usage (Bluetooth,
GNSS, GPS and MCU).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index e05ad3ac2abc..c9231e501f1f 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -96,7 +96,7 @@ then:
     rts-gpios: false
 
 patternProperties:
-  ".*":
+  "^bluetooth|gnss|gps|mcu$":
     if:
       type: object
     then:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
