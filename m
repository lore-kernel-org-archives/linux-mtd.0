Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24086CF34D5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 00:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VqJDjRIn7i5DguSwoKZ56poxmFnp0Ojy9IizxouDAY=; b=YOUXH0cEXJGVtc
	m3gEdWAHT33HR5AgOyvXfdmOPBA0txyex0swEfIuH3Ighc3qTZB84KAj78pK+fk0dCyt7QrwLLya7
	6d2eAgWAnW9I39UzzcnGpOHGTxwJHg60XrdsmShqDSJluAbMBSieFGR2r3LBDEB7b6clZlsH9FzY2
	aimk49d1UwaRaW0eiLrsGHhL0QyioT9SzG6P4kKQtYvIOiFJFqUh0l4mzay7BJPXhQAo+Jmws1PEE
	AsVPr5G0lIL1nAuauF+MYSWgXC3QH6CTdYXxsTPG+Z0NW3O9dAc5RLg0SrO78BorvCAZe+ZoZWPhY
	kHytveoQLmHMgAha4SpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swVqI-0000000AhyI-2gWm;
	Fri, 04 Oct 2024 00:06:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swVkI-0000000AgVL-1cNA;
	Fri, 04 Oct 2024 00:00:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-718d91eef2eso1143270b3a.1;
        Thu, 03 Oct 2024 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000033; x=1728604833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPG7NWLbTV1K4yXh2AqTy27S5IzvT22XN7gfixbpbfM=;
        b=kJiZNYGWsAPcGwfGDWYfivnVsnOOZ99eClGEYzENNh8P0ChSRzdBmyHpLZBIvoo7h8
         iquVJ0ySKg0KIol93faVOolLtT8N++j25mAmJfvoH+WcZ299x+xKLlfvTQMkeYxlJmUd
         e6Q+yeLMHWV8I0sSzn7Y4yUVLVaZzsyjsB1Hr7o7sfIMUQtCwgQehB4CuhxVKtpj4t45
         M9oFeepVN1JoKMzy/hADbvF6OOZCGgabtXwWr6QeQQq2hb9UaF8q+LGGRmi1sCfQdBh5
         Dk0ndaRtyny/t2LTkvC3P4uWdiRtE64j8jTndgmybZdAYH7AyUKFtTxvAfJ3AJQmR8I4
         sfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000033; x=1728604833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPG7NWLbTV1K4yXh2AqTy27S5IzvT22XN7gfixbpbfM=;
        b=RWgrGaJNkppxZNAbudo89Jfoj0mAhrK+Isagsdco17OGnpbXsa3YJ5sI1StYNs4rG8
         n3psbcMv4AYFdQo70arUy+2SiFK/8Y7MyGXgc0ToAw+zxYa6u1giUlaplcuyD0u9CYdz
         OwNjB7eDreuWtl5Avxs3iLUx0H987eQyoCPww/Bb4YN9+kUqrWbdqfchaDn+5stp001C
         DBvw6rnrlDJLB2+WOxdXilAahu8/YgHFGjNiTUJAenSd5ddO3ltOZl0AQdbWGzzravEb
         RLNBzY0PlB8lje6yNCJi2BXL12VmuRt0sRouH/VyRgYzhYopNz+3EX2bFL6N4D6lkfaS
         /Gnw==
X-Forwarded-Encrypted: i=1; AJvYcCUTYnGdNRVKQqZGHtZDuwuQonk3ZNw3WvQE9Xo3Xw7AIVCQaCo2lqb+Sdx/YzBNBEHyiOZsnoGQADJ9OLQ25gs=@lists.infradead.org, AJvYcCV0YtB7liTPCkmGI17YmJ2fGGXGWXR4bpT/TFE2Qal8OE4tC736Uc0iTW3/fKzVg7nj810TiM9IiRBYaYhA/Cck@lists.infradead.org, AJvYcCVwN47qcwJEZucqB/8pxKgmOukJnC0e/YQXnVA2+Zw8SQk/FMjD7+yXti42lfWWbmcqbMM0wdSHPjUm@lists.infradead.org
X-Gm-Message-State: AOJu0YxnTqBqInjuSf+IxdQvdjM4eAIDKl0WRqiXp0ws+RND7xtK7fm4
	/FPjtsRefb8p9c72tfOcHXjnMmjYvZ1qd+4t+pKWcyUYEkkiRVg7
X-Google-Smtp-Source: AGHT+IFRpqusbyBChPGJdLDMkF4flvi5LdGXwNB5TEbIL5IvxwzIRTPeVbU6C3UfDDB2eSYpuaFaIQ==
X-Received: by 2002:a05:6a00:238d:b0:717:92d8:ca5c with SMTP id d2e1a72fcca58-71dd5ae0c7dmr9336561b3a.3.1728000033244;
        Thu, 03 Oct 2024 17:00:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 5/5] documentation: use nvmem-layout in examples
Date: Thu,  3 Oct 2024 17:00:15 -0700
Message-ID: <20241004000015.544297-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_170034_445320_5E94FAF2 
X-CRM114-Status: GOOD (  10.49  )
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

nvmem-cells are deprecated and replaced with nvmem-layout. For these
examples, replace. They're not relevant to the main point of the
document anyway.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++++++--------
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++++++-----
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
index 1c2b4e780ca9..8ae149534b23 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -45,17 +45,20 @@ examples:
             compatible = "qcom,smem-part";
 
             partition-art {
-                compatible = "nvmem-cells";
-                #address-cells = <1>;
-                #size-cells = <1>;
                 label = "0:art";
 
-                macaddr_art_0: macaddr@0 {
-                    reg = <0x0 0x6>;
-                };
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    macaddr_art_0: macaddr@0 {
+                        reg = <0x0 0x6>;
+                    };
 
-                macaddr_art_6: macaddr@6 {
-                    reg = <0x6 0x6>;
+                    macaddr_art_6: macaddr@6 {
+                        reg = <0x6 0x6>;
+                    };
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/net/marvell,aquantia.yaml b/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
index 9854fab4c4db..5d118553228b 100644
--- a/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
+++ b/Documentation/devicetree/bindings/net/marvell,aquantia.yaml
@@ -98,15 +98,18 @@ examples:
             /* ... */
 
             partition@650000 {
-                compatible = "nvmem-cells";
                 label = "0:ethphyfw";
                 reg = <0x650000 0x80000>;
                 read-only;
-                #address-cells = <1>;
-                #size-cells = <1>;
 
-                aqr_fw: aqr_fw@0 {
-                    reg = <0x0 0x5f42a>;
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    aqr_fw: aqr_fw@0 {
+                        reg = <0x0 0x5f42a>;
+                    };
                 };
             };
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
