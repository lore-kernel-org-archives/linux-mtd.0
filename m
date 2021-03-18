Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17976C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:45:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 821B264F6B
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 821B264F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MOQ7krPn2a3MIG+ulIBxGVTHQ0MfTRZIzK6OTnTjoqQ=; b=DhAG727v9+wlWQv0lPqpnPNUzO
	BheUwz6IIzvbzqFtIT6gspNeOqn8dqroM48YZ/Gz1PQPmfkacn7HPCdnd5O9DiJQQFDoUX//S0NXn
	7j5hs1TorRzTEs4CHyvOBXYJ7fN1n0rZyjwjnP4xM8mx/Vvq6wxOJiluUK6kxzrtv6LL39IvFsZs+
	o4tIpVi40OWC5HrQ+bTH7TLrYvgxPrGoMCxWVL7zjBUQxDL0/h+lMIbptq6dENef0cqqr5zTLzKTu
	jvEipWs0XJCHg1B1C8f1gebsjRVH+S+tylkmUkASfR03Xc66PNaFff/RfkmbDy5rllt+zf56MoPFX
	xj1ye7ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMs0N-005F6Z-JG; Thu, 18 Mar 2021 12:43:59 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMs0K-005F69-2E
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 12:43:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id s21so2867052pjq.1
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4PFxTjdA6OPYv/Z0HQ6IxtumbuUjcIrZvu9tDP9b6fc=;
 b=hSbnLUfx8+yxJLMol5fTrHmYGhroPthMYISrambq8F0GJ8XtZBcTNTznPi4Cp/HFMa
 VKNffNvhiiqtFZCxzMyL4JCg11/Gd/tBrcGadlbyc4hjCj2Ta/98ALTlgXiDdEZmUajH
 /8YGadEFTn33ORLQZCoVMHCaxWEcWqPIOdaEEaxNNBrPWljx9Y7pPEa2wMeJew/DNxIR
 Bmh7JTsMnx3k/rd+LGZ4dY+p+b+DV6j58puabVoz6tszs//joOUysyDo/YRQEe9vbm0Z
 mH4tB0c7O20iPs+0LOs2MOUGin453G4QKm9u/GRXFXmwsaKdv4DZxqmsEz5GsPPI4U1f
 f6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4PFxTjdA6OPYv/Z0HQ6IxtumbuUjcIrZvu9tDP9b6fc=;
 b=LGmJCzB2+u7KtFjEnehI6ttmwbgYjBJynGzBWiDpGzmaus8bESVWIp1cV7pHFqrMo/
 zf8ewkeWgppp+i5F29wa1NagcDM4gIFyaWwHwhSomkP6m6AbNQ1P8Cb+SCtYExIjlC9P
 0OkMAjF7RCL8ZSCqy8wMOiqb2wb+PhhxELcJ4XEXwSX6vWzFyAA0Dlm3QNqLretT6Gnc
 vdbSqiZglUCAkvUv0cngzIaTEgksKVqTlLpHfp18qQ3ckNFWfh/DyoVlH0K2sIjizCHU
 76qQ0f1HXz1i+CrubIYMvFS+hOQotBYkSe/ku9so1zpT4XgG/5iqZfCw2fG+hAXZW0XR
 Q0aw==
X-Gm-Message-State: AOAM53106ZCjo0m3NA7mrSSnKmNPBVvcxAfhV8ri29FljTDHUZuTbA9s
 tpn9997d8aUY9M1cSJDANFzq
X-Google-Smtp-Source: ABdhPJyhf4LPDsQT+4ddw3OhbIRoLPuRSljfW+N6iK88femJmSTzQG1AFdT6kWzbRA2HE8lUSo/NgQ==
X-Received: by 2002:a17:90a:8a0f:: with SMTP id
 w15mr4099347pjn.200.1616071433983; 
 Thu, 18 Mar 2021 05:43:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6d00:4737:af26:182c:a57e:1d9e])
 by smtp.gmail.com with ESMTPSA id w84sm2530694pfc.142.2021.03.18.05.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 05:43:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 0/3] Add support for secure regions in NAND
Date: Thu, 18 Mar 2021 18:13:39 +0530
Message-Id: <20210318124342.32745-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_124356_218605_48F94383 
X-CRM114-Status: GOOD (  12.68  )
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

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So this series adds a property for declaring such secure regions in DT
so that the driver can skip touching them. While at it, the Qcom NANDc
DT binding is also converted to YAML format.

Thanks,
Mani

Changes in v6:

* Made use of "size" of the regions for comparision
* Used "secure" instead of "sec"
* Fixed the sizeof parameter in of_get_nand_secure_regions()

Changes in v5:

* Switched to "uint64-matrix" as suggested by Rob
* Moved the whole logic from qcom driver to nand core as suggested by Boris

Changes in v4:

* Used "uint32-matrix" instead of "uint32-array" as per Rob's review.
* Collected Rob's review tag for binding conversion patch

Changes in v3:

* Removed the nand prefix from DT property and moved the property parsing
  logic before nand_scan() in driver.

Changes in v2:

* Moved the secure-regions property to generic NAND binding as a NAND
  chip property and renamed it as "nand-secure-regions".

Manivannan Sadhasivam (3):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in NAND
    chips
  mtd: rawnand: Add support for secure regions in NAND memory

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/nand_base.c              | 111 ++++++++++
 include/linux/mtd/rawnand.h                   |   4 +
 5 files changed, 318 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
