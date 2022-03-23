Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34EEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 11:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8+JiPAsKPBC64ywXlOLAYrHjVI4F0H5R7h32sONldRw=; b=yyxOR6CvCB6O/n
	Ml8NATnreauU0/0TcsHb4Wo2wQIB/sRt/K7YD8uDY28B8zvQzzksvpXx9H2ZE9XTM0dubzqyaxvO5
	I6pT/WftdrigTO8tuT3r3Ns5mVlXAvf/NWxPfo55Em5RMtGLCqUwC/WhrUJosI7lTAIdOUT2UAnIF
	iltDEsYC630/YsGuGiJ3YcQpg06hNcRJaDHtZbA2exdkVrEkllcAD4lQzoTDmlwEtSbmKBtsDrfk7
	FuVr6QoBEE2hXN7SWug6DomqavKrJdx7ZWHIF01/ycu9cyv5idYHkUBFaGgCNjWHEb5rWjFiRsd90
	04m4AQFJE94GQZpiN4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWz1E-00DRCB-5V; Wed, 23 Mar 2022 11:19:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWz19-00DR9s-4w
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 11:19:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11E5BB81E66;
 Wed, 23 Mar 2022 11:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5465BC340E8;
 Wed, 23 Mar 2022 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648034339;
 bh=VSAZjkveq4fmcyeXmTJGzRshnDTfjprYF22vCHdNxko=;
 h=From:To:Cc:Subject:Date:From;
 b=euGbF8HpxcyzAHvPIBRQUJQILWx/oV62xcQYM7caTIdFAc3CObhAxmFTovS+vMDtJ
 Vpz1IKcihXIoVuDCCuNxP1ucSoBiRGFQ9EvVgpqi2igLt9BPbWpNXwphi/Cd//UUVa
 bnp5mXhRuEzwMkIarn+HCjN2W9X5Yaf2xYJon/SdK65xCcS98XEMICVYwtWNv0Wvw4
 PBUo0eBFOZPx+73Sh9gHJrpwH+HM3cE33yQcNwghHY47AQNl0uPxTmuJjf+6HiS7EO
 wT6czE+KsUItdXd1H/51r01MCzCLmi4lzP8YcJM8TBRYhCdYzA0gWVHYwTW05kf7zz
 qRmoKeowcVw7w==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 0/3] mtd: rawnand: omap_elm: convert DT binding to yaml
Date: Wed, 23 Mar 2022 13:18:48 +0200
Message-Id: <20220323111851.4699-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_041907_355651_328ADA58 
X-CRM114-Status: GOOD (  10.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series converts omap_elm DT bindings to yaml and adds
support for ELM on AM64 SoC.

cheers,
-roger

Roger Quadros (3):
  dt-bindings: mtd: ti,elm: Convert to yaml
  dt-bindings: mtd: ti,elm: Add support for AM64 ELM
  mtd: rawnand: omap_elm: Add compatible for AM64 ELM

 Documentation/devicetree/bindings/mtd/elm.txt | 16 ----
 .../devicetree/bindings/mtd/ti,elm.yaml       | 73 +++++++++++++++++++
 drivers/mtd/nand/raw/omap_elm.c               |  1 +
 3 files changed, 74 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,elm.yaml

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
