Return-Path: <SRS0=Yojm=UM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E9DC31E45
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 11:31:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1EC208CA
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 11:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MBcrkB+F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFYVhGQ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D1EC208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8uSDXGs3+SeetmyDGYTm19hmIvxJgygjt82h4WRiPs=; b=MBcrkB+FhkNIpm
	MwWbquFXkKdvydNQ9SyDhh6ozjCEpI4oDAZmcNhQacQPAVbJ9k0C3op1nGYTgmeqhryRHpQvseIhf
	GoAzrcVrlVpn1SOtM/4FtuJ7/3LwEtPQHvTTh/1PF1udEkcKZlaltpZtbEPGVpvAhY/1MgSB4NGjw
	borzVIoeuq12grBhJ9ZaTBZwBdUJUG2CqgoCMtqhlO0GMT0Kmas8i+bMMZgyv9xY4X7X+cgDrhBzV
	YiTMa87cqfTEDAInc077yXbac/fAPmtJhpLCsW9Dei++hDNicMLspuS6S/AFHe+QEI2F/sIpTgk88
	kAoNOHmWNBQor6aPvFYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbNxS-0004LK-DB; Thu, 13 Jun 2019 11:31:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbNxO-0004KP-QO
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2019 11:31:52 +0000
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com
 [70.114.128.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FC31208CA;
 Thu, 13 Jun 2019 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560425509;
 bh=z3Dn3El1yjq4ZvN1Ri3867ZpWWj2G37nsF3RYxODv08=;
 h=From:To:Cc:Subject:Date:From;
 b=GFYVhGQ3k33CajiXZk+jbxVz7EZ3Rz+ks8Pa5+6chQG+Btl/GPCbJoELkp/mAXOHi
 bTV8mobxXxFEM5yKFgRgfVZ9W05srC52Od/N7jzgg5NhmGqAZptmHahcxgCRTAMQyo
 0hF15okOvub9atx5RxaZDDDIDD8T8E426aBTEVWg=
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv6 1/2] dt-bindings: cadence-quadspi: add options reset property
Date: Thu, 13 Jun 2019 06:31:37 -0500
Message-Id: <20190613113138.8280-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_043150_872348_9D056818 
X-CRM114-Status: UNSURE (   8.01  )
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
Cc: marex@denx.de, bbrezillon@kernel.org, tudor.ambarus@microchip.com,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The QSPI module can have an optional reset signals that will hold the
module in a reset state.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v6: no change
v5: document reset-names
v4: no change
v3: created base on review comments
v2: did not exist
v1: did not exist
---
 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index 4345c3a6f530..945be7d5b236 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -35,6 +35,9 @@ custom properties:
 		  (qspi_n_ss_out).
 - cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
                   and first bit transfer.
+- resets	: Must contain an entry for each entry in reset-names.
+		  See ../reset/reset.txt for details.
+- reset-names	: Must include either "qspi" and/or "qspi-ocp".
 
 Example:
 
@@ -50,6 +53,8 @@ Example:
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
