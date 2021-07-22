Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B658C63793
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 10:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3F8E61249
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 10:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3F8E61249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8f7COykLUmSQol6lRXKk6Q/pf78+ff9qpvFcWTmscuk=; b=MRMM31Od1uwoZ6
	7Fyqhhy0y66E9T9uuou5KuGiWSq0ERD1aNsvEFiGnrZZkHN5gIWto0h0eS/aSyjPVSLyup5aVns5x
	83LefKyAkDfXI7mttLU0aLTOtFdeuiBtJFlmIy3PAoleVCHJrIBn6HOyABGGIdg8erXLy/beYO88g
	0s/nYVO4bDw/DHmZ8297CWrUNB40qIFQXR6tn1thfThA31hX/tpmJVFoU417x7owQhgoUPNLVE6Zb
	afbak4fqZivVpxqgTbKutfuS9CEHAMaqnJ8lPk09lntmARJw48cb2SQ/y/zyR7uR83L9dwmxFDnT8
	wDI80+E8DlMFBPkGNgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VX8-0015mZ-55; Thu, 22 Jul 2021 10:02:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6VV7-0014o8-Lw
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 10:00:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FB8161287;
 Thu, 22 Jul 2021 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626948020;
 bh=1Y4oOrO04OT1bQ0G0raCzLNZXj2VySRuILzlhimGt+8=;
 h=From:To:Cc:Subject:Date:From;
 b=iekcUmIFJVS0FCGNvU+4Sr9dptYQ3mlitjHAUkejxIDtZ+eScAZDBKzEx4eI12I0B
 z5UqRjMHa6KfnBHf8TZDY4ZcSDolDGT/72H3BpVJjC9MgFvUaKypksiXYdx4hAQMe+
 dPMtbubkcVQQHZrppaFly5p3vv4QtSK7hshAKdQWI3gzrVUfal+XYwSsjRnoH50pp/
 am/MYooYDD+Gt+vXX/QtCU4GW7a/odjGanJ8iQBkTYAIG3IlnWcLNWyPoi1JNM4CPU
 oRmNIylw5Rgd5vpOyemAb9oya0nq1ufrkoho2FBr3vorNAmD174KPMFJn9bcWNBhFI
 /2ityDm1joB4Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1m6VUz-008mHJ-DK; Thu, 22 Jul 2021 12:00:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Guenter Roeck <linux@roeck-us.net>, Jakub Kicinski <kuba@kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org
Subject: [PATCH 00/15] Fix some DT binding references at next-20210722
Date: Thu, 22 Jul 2021 11:59:57 +0200
Message-Id: <cover.1626947923.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_030021_782132_DE840311 
X-CRM114-Status: UNSURE (   7.33  )
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

Due to DT schema conversion to yaml, several references to dt-bindings got
broken.

Update them.

Mauro Carvalho Chehab (15):
  dt-bindings: mtd: update mtd-physmap.yaml reference
  dt-bindings: firmware: update arm,scpi.yaml reference
  dt-bindings: net: dsa: sja1105: update nxp,sja1105.yaml reference
  MAINTAINERS: update mtd-physmap.yaml reference
  MAINTAINERS: update arm,vic.yaml reference
  MAINTAINERS: update aspeed,i2c.yaml reference
  MAINTAINERS: update faraday,ftrtc010.yaml reference
  MAINTAINERS: update fsl,fec.yaml reference
  MAINTAINERS: update mtd-physmap.yaml reference
  MAINTAINERS: update ti,am654-hbmc.yaml reference
  MAINTAINERS: update ti,sci.yaml reference
  MAINTAINERS: update gpio-zynq.yaml reference
  MAINTAINERS: update arm,pl353-smc.yaml reference
  MAINTAINERS: update intel,ixp46x-rng.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference

 .../devicetree/bindings/mtd/gpmc-nor.txt      |  4 ++--
 Documentation/hwmon/scpi-hwmon.rst            |  2 +-
 Documentation/networking/dsa/sja1105.rst      |  2 +-
 MAINTAINERS                                   | 24 +++++++++----------
 4 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.31.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
