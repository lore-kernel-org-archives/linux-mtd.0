Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED71BC35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jAXSPs3fZ80FUr16SpVuVheMM6U0zajCI2wmnl8Y6Y8=; b=YNDfc4slAmpAw7
	jq7ZpVAxByNEj7Auh8XV7PFBPZEk4l8nf+1lEceaXCQBsvIJSYIzisrXUsiGeQtmeL6kbTa6WSFwG
	emiZHPc99eUMvu0B1WBfxioh6VNA1AFoK5s9fajhhJ3dYB6kSG7kvs2dkp1wKD07TV9S/CEgfD+4b
	jc3sMTWlt4FRBzuiJ085Ba34q68b0RrNKaWAP1Loj9ppOByAen6PGD5RgWrL3YkKIZXsJFQisnnkH
	PbduAV7iaUPtFxYtc8vMqODr0ZgTWt+Eks5Ary70T2jzwXDTilZ/PYtkCGeHa5HwW5GkOaKa8AeS2
	hEIy9UkCqMBA+KJtpsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDLV-00An4s-0x;
	Mon, 18 Dec 2023 13:07:45 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDLR-00An1S-36;
	Mon, 18 Dec 2023 13:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1702904842; x=1703509642; i=wahrenst@gmx.net;
	bh=/EmEIgukyUVV+mucYcoe5GswB6Vz+ZnkRMJbuAm5b4Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=EqDtJLfJF/DoeuDfdtmEXu/+G66nrMzfmL+gHxllQO0ijl/Qq+eoZBd7DWGLi10w
	 bsLoqakw7eAh8IqIXTHvH+iYnz4feH5/AI2AEtxWXlT+lOkaCB/HYFfrdHryiZn5I
	 P7WOC8ZdUKv7DoLsWxADBzGT5FsnAJjOk1hC26GDeazJbiDCo7X+M57JXju/OMwe5
	 0GpKqP2EKizbkLPhvL6ibq3yGOh7/FhDH/yiqmDpOz+mYQytuetKKEB75buxigifs
	 Aq36skfufMwclB9gTbK+3tupBswRSTK2tP2MJRyZ18tbo0oFfj1rSEEob2az16Txd
	 eIn6Ipznzd2/4qxvpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Fs-1qv3M41Tx0-00oGuy; Mon, 18
 Dec 2023 14:07:22 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	=?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-imx@nxp.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/2] dt-bindings: mtd: partitions: u-boot: Fix typo
Date: Mon, 18 Dec 2023 14:06:55 +0100
Message-Id: <20231218130656.9020-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:g2XXFoLW07X6NELwc42+oN4U3EW3CCuZhhHVyAprnuMSVevkfGU
 8KpJ/8gS/go9jL1JbfacfrPIrEmHtoeAn6te5m5Uf3uwcKbQV+tf7EZ7DSqW4eU2vv+uRF9
 rWEAMWoJ9POQdlALiJgLNahvw8FcUS5wLeT1zOsm0dEJbWMbEW6WI0oNwnhCci8bB5jqnYe
 J/xXM9cpzSHt48mwcQIyQ==
UI-OutboundReport: notjunk:1;M01:P0:LFQ5K7s44Do=;8z25VehtrxK6n4FY7pIyBgFQX8B
 PoJzFWbtoNbQJlHLUKLQtizwspsx/T+npfI7MqTkLFG0762PEysahgzMXi9infv/JAL585VRz
 GUdewzX2L4XCn43A/JLXqlrGOzsmZezwV9+zi6ndDHOmNLEPgjdCuQR/4rzS1MtFtRwNkOn6d
 hUbR/8ep536im0DElSYGaefR8eD3e8R+NUwcOxefmDokCVjg3h9fJnTEUJzvgmTpLfwu5EpPo
 z+xnw3EqNOyTTMBfBCTQ8wa7fjSkDj2ogHhShtuhzQOyl/BBwqBS9vUbvH+8Dxbvgqujsw2RJ
 hLTfqtnbel9kM+dsx7+Zk25B0HN1JCK/8GEYZIdeJfeiI6g1apWigBYWA/lE7WYJmasGL7k7L
 2SyFrbwvX7UnVeU19QVVCrt0HMLOIaWkq0aJ314WN6u7E7BkOHYwprGeTtid4IIi++fqbgjyg
 pLe3mi/IQYy5Gc8WmOQFzQDyqtim3RaWN2u13uG+5RkA2zO260EjPILI/jm1NHpsu2mwSlT5M
 hHrw6zU5/XlJre3AWQigu/6S0xDNO3rMyWscl4QKn21yReGw9pdgR1i9DUOFMuXIpal6NFiMz
 PTfFJEzwCO26sfbR1eZPpQgSRTs7qtYMO21hOx2k3irwQClj1I5XQnYK4ldPCwK540UaEp3Dq
 OG+/xjoZeYnqC9qg7/W7OCl4rKFo7vAMcu1bmd9MeO6YBQKQCfdQAtCtDSB7/D/+xQrYno57J
 Ms58C3lTp8+WQGuScHlByeNHHOII6br33pLmsNo2XMhBZUjZAu6u54jor3lIasTm6H/M7BQC5
 PxQWAsIjMHjRNniLw1Lf4ZtuNHc/oTN33Uii4C6iqG6fTsaccdThHUhxqRSR8zrsBcfCGE+xN
 YR9loA+cYPXC1QGxxuteesznmlo7EAppuByAVba3wyYQMaYGfLW8ezcfW6FmOI12hiCXVlpcD
 wQTuYytU/Z6xiFyJH53TsoDfde0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_050742_305108_1AC9B76D 
X-CRM114-Status: UNSURE (   8.76  )
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

The initial description contained a typo.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
---
 Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml b/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml
index 3c56efe48efd..327fa872c001 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: U-Boot bootloader partition

 description: |
-  U-Boot is a bootlodaer commonly used in embedded devices. It's almost always
+  U-Boot is a bootloader commonly used in embedded devices. It's almost always
   located on some kind of flash device.

   Device configuration is stored as a set of environment variables that are
--
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
