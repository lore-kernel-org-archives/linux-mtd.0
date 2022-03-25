Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+QF5ts6opTPMVhc7Zr7MGyVIqM1IzUGJDWbVc92iML0=; b=wYeVZVBJ9bGkFg
	KTBmuDbxdCcChc9jWS5+W4KQLmtf9q5ibtEnVxivvTQjJlxFMJbjSmkUHBrYif1vUOxT7EZ1nsC/8
	mH7keoLChjxF1+l9dp2XkGeEwBGpSqoZBX2Woaf+p2TzShZLWndEJLgCy6JJ8PKL448aAj/EFC2kj
	fEgQw0DJ0qQYlsSB0BdHgAvbSCjDF0SPuL0agyH2zLOvcfjR96aIUL2sb2vWGLlwWzrBJJUUCfE/+
	sGG0D9OUFm1x6TIMa9IX2zHl9A3dIH65xD46H93p7DbQ0G4ROSEDCad9axDon5kdNJAd13MCcnAmQ
	SIaC7RvF0521mjU8wckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXjBt-0024yA-I0; Fri, 25 Mar 2022 12:37:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXjBq-0024xX-PB
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:37:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F6F5619F7;
 Fri, 25 Mar 2022 12:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BECDC340E9;
 Fri, 25 Mar 2022 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648211833;
 bh=GZihoK7xdXZWYogtHpi8BIMEjFnQFzjhtRhwaFsx2Nk=;
 h=From:To:Cc:Subject:Date:From;
 b=EkH5CyRfQaGrQJSUzyXGHL3S667AwxxX+mmrWajpqcosqPHiHXCeY5HKZT8NdOyMP
 pIeNsj0QNJow3TpRdgc4Uu5JwbG95F59NoZ6ku16HFOgdJpwtmrZN0kqTMi/hI43bm
 fs2DfYXjKY+LDxtMgx2ZjAq7jfseloenf7WCI4nBV3p7SbQszTXbmYrrbJaN6lDD1L
 h4W8sWWGK5nuBmrJYHA3o4Zn2eThoMKJTUruQ3MT6v9kQk/U0WyCl76Wu/05CJi/uL
 u2y6G1DH+eM329NzpOZ5Fpj/mOlmyDwHAEBss3br542EhpeRBL517iY7mQ0Ae0UOeE
 QDhiutaLxSbNw==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, krzk@kernel.org, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 0/3] mtd: rawnand: omap_elm: convert DT binding to yaml
Date: Fri, 25 Mar 2022 14:37:04 +0200
Message-Id: <20220325123707.22020-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_053714_901442_30D085DC 
X-CRM114-Status: GOOD (  10.87  )
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

Changelog:
v2
- explain hwmod usage deprecated in commit log
- fix example node name to 'ecc'
- remove 'items' for single compatible specifier

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
