Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802A6C004C9
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 01:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5111120656
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 01:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uEVui9wW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHOQf7dB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5111120656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q8fFhC2HTQnL2fJ6V64LFMW+F7Lxuo/Qvwq6wzep6Bs=; b=uEVui9wWPidufF
	Kj5rSwGLWkbWp7Rgh2of9UxWRlKH8iEnQMqonPgoW/FfHzu2Xr2KLsq5eJwG0CPQF11jfEAOy0H5z
	MEbC0UphzYlnjGyWRzSoN25Lz5oETLL+8V/iBHL8KJ4003tFUZED+P5gUUNbozG/SFduVeIHC+JPn
	dvrG44C/PGYPFeMt2uBF/VJRLVd6vx4Pd1HaFOCyAr7rN2OKzHE+w+L91eTwMlUU3N1EJBk03vpAe
	qfk6USvM+iHxNRqZ0MGMU/I/Hw8gV/L2/nrMLwCXMerSsGDFJkIMUTsG1Hgvsxu+cdX0hCFmNv1p+
	9tUgnXZXJO+tiOiNnWaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOBDO-0002OA-Jl; Wed, 08 May 2019 01:17:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOBDL-0002MY-NO
 for linux-mtd@lists.infradead.org; Wed, 08 May 2019 01:17:44 +0000
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com
 [70.114.128.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4956220656;
 Wed,  8 May 2019 01:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557278263;
 bh=xprzQNXnjgl0sRF9o5r/xzeUA1KdsH6ymcebTYGISB4=;
 h=From:To:Cc:Subject:Date:From;
 b=AHOQf7dBy/Ju9H9H2/XBl64k5L0GkH5hqk1CX2ZcfzlAoPJgeLUpXKwSU/FrNDvT5
 jq+zgAdBF+9bx/wB6zrt4p/4yo2cMHKH7lcILnjng2ZdjiQq7xxM6enZsRqJROJmrF
 ZILE4hrd4yz/x2CTiNM+IpUqb8oPO7gD/n1YlNdA=
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv3 1/2] dt-bindings: cadence-quadspi: add options reset property
Date: Tue,  7 May 2019 20:17:33 -0500
Message-Id: <20190508011734.14966-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_181743_786644_27CE3F90 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marex@denx.de, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The QSPI module can have an optional reset signals that will hold the
module in a reset state.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index 4345c3a6f530..b6264323a03c 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -35,6 +35,8 @@ custom properties:
 		  (qspi_n_ss_out).
 - cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
                   and first bit transfer.
+- resets	: Must contain an entry for each entry in reset-names.
+		  See ../reset/reset.txt for details.
 
 Example:
 
@@ -50,6 +52,8 @@ Example:
 		cdns,fifo-depth = <128>;
 		cdns,fifo-width = <4>;
 		cdns,trigger-address = <0x00000000>;
+		resets = <&rst QSPI_RESET>, <&rst QSPI_OCP_RESET>;
+		reset-names = "qspi", "qspi-ocp";
 
 		flash0: n25q00@0 {
 			...
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
