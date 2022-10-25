Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D88C38A2D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOq8OaoiwwrQVxQnbe/UjNKn9qElEZqwopwu8++eFwc=; b=zzNhpJTQM95ZAj
	ZDCIyL89mXPDAh1vG6UC0qPsMt1tcE5jTSAfkKHhWXEHRdtWmLPsHGqPRGW2EzrfNNaEKapA1XMyc
	2pA5HwEiH75V+vrjs0PNIq6AFrhCssopY4gfMg0eLVNOGVUdEff4SotJxQU5xpAuYlvSoGRpzVGHg
	0yBC+0cQ/Z/zqKgyH78Jw0Qo1HfSZMLTFxHqvR+NrajcXXKSGS6lhPRNngc3hW042FWFE8wmGDxGF
	ZSENa5VBcLCbGzNC4MhT5KqJ8uvJew9cHMlyo9AKwpmUe9qEU3334oldaM2nzfDKQkqLseKBSQ4u9
	UFPlmV0+HrEGVhvWf/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9kl-003cdn-6Z; Tue, 25 Oct 2022 02:33:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9kf-003cbD-KL
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 02:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666665193; x=1698201193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KIcla/cBfKfsp2q+fhYfTr8alpP/iyi9SD4SxWv2kyM=;
  b=y7YQUeF5H/jkkijfCyV7zE3jjqGtS0PkxIQDfjuaTXNP6Fbi1PCGa5ly
   vcFKvlWRoh5f/1+ybwh0F3VORrpYYLIzoEbp23iIFwbmcO8G8U6OtmYiy
   SrklEeC6PFVPeLY6pDvLAhUJqTpzr/miVd3g9rPCIg0q+T0iaCYKBRany
   maUONgDp8pAHxgg2L4n9kOaYXiOmCf4NrbWafO5FrYVMhn0p39MBbmKo2
   ycVGlHNlAtQLpdkAvIzgkmprN2bW1WMbPDeyVMKihJzr5FdJbuV2RK+wn
   WYFapqR/asjd8byE9GG0TJMVbeouJLupg/WuI6+kdaxLAL7pvGnmRA2YA
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="196873207"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 19:33:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 19:33:08 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 24 Oct 2022 19:33:03 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <robh+dt@kernel.org>, <sai.krishna.potthuri@amd.com>,
	<miquel.raynal@bootlin.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<richard@nod.at>, <michael@walle.cc>, <pratyush@kernel.org>,
	<vigneshr@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<saikrishna12468@gmail.com>, <devicetree@vger.kernel.org>, <git@amd.com>
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: Add flash device reset support
Date: Tue, 25 Oct 2022 05:32:59 +0300
Message-ID: <166666517332.181018.1753222058274543983.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
References: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_193313_735236_7B93E42E 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, 8 Sep 2022 12:14:26 +0530, Sai Krishna Potthuri wrote:
> Update spi-nor dt-binding and spi-nor core to support flash device reset
> using reset-gpios property.
> 
> changes in v3:
> -> 1/2 - Add reset-gpios property in the example dts.
> 
> changes in v2:
> -> 1/2 - Updated the description of the 'reset-gpios' property.
> -> 2/2 - Updated the reset sequence to match with "active low" flag in
> device-tree, also removed unwanted comments.
> -> 2/2 - Updated the logic to perform the flash reset unconditionally.
> -> 2/2 - Updated the delay values to support more number of flash devices.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/2] dt-bindings: mtd: spi-nor: Add reset-gpios property
      https://git.kernel.org/mtd/c/7f2937efe186
[2/2] mtd: spi-nor: Add support for flash reset
      https://git.kernel.org/mtd/c/8f1ee9ef71d0

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
