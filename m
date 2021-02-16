Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67237C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 21:27:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17D3B64D99
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 21:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17D3B64D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ot1QBX9rPZ6VHcw8YMV0t/cqKFUd2/lRNuIVoFP1x8s=; b=TPlEN8krgBvbbMn3NKcKge/Pjt
	r09BDwRiYCYkKBmFybSpmtUnVKnHFAmALHBAeynowkK0/JCGvUPm3QDt2000M/I2PFqnH/aS79qwx
	ZUIxe2eCyN3UdcgU6PvWLE7ux/kNGICnwqJLjNofxgfYlzaIXgOf2uXJnh2p1euiDonq23Jdr066x
	jjN0cL89mV03vRzuR2mDPoZgMUKkeLOo6ntyjl4/hZ2/ZPvrR0mxUnQJDfOf/i6iVgIUnw3BJ9RvY
	iJZM4480/jCp6fMd+yAO77mOcImlND9ekO/ypGOpfXnRpA/LqPq+BEHK44ho2K7gLpJf3aDs9c3C+
	2NxxJJng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC7rv-0004X2-Q8; Tue, 16 Feb 2021 21:26:51 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC7rt-0004WW-8W
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 21:26:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v15so15062005wrx.4
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 13:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kxwOUxUdnljLW686/SnZ2RHKtLcEjcyiO3FyMtlRrN4=;
 b=X4RzOuaEh/2mkJifv7IpFpIYZYQduaATcsKxtcHnSPyjRTfUTJhNhcnFZYWBVLmYM5
 pQIqvQnT5pEAFMv+79lSHPfGziI0Omjfqa+xQspACVzEQ+kMxrB3NTGDfavIRevZZxIp
 0XkOMufMufIXbAA9xYkax5DN96SkZkcQpMtjZxvtCBzdeqZEm8ShRRjSP3G0o2bVA9Z3
 2lBAVZAYpPkHUr6CeOKlEvTuSEy/7ef5/5OdvW6CtFi9ul3pF6FdG8PX1clegt/GObn4
 jnQtQ+QsKNTymM+YK9qVm7TsiD9zoPHeY7hffKgUvyNsiI2JuISyHdZ24gYaSvH9zW3m
 EWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kxwOUxUdnljLW686/SnZ2RHKtLcEjcyiO3FyMtlRrN4=;
 b=Fi427xco4j9ppzGOa/qywSq875Iixv8mjE0cHue/kthb6LD5lsqLFsxxyxu/EhlHAv
 kvU3LWuJ4uPMljJhGjti1DoUsZ1Cvl594JXju2rzhEfmego8zE6CrD//UJe+pgTohMbw
 GrJMuTq4iu7NrwUInWy0tZQwbT8WJwxwc4jP431s+dPh+PCce1nrmzGNYh5FulDINtjC
 7wN2r4d9WRlHDcyPmC3mddVqusHj3V2LYkbHUpT8b4hyJAyyWZsvyhUiBSZMkVpjuemA
 1Z99X77vApomVjUfKyRUJ+LqZb7yym8smLzOGardFBO1j1xvSo3tmXbDHW+sGnXBcwft
 FUmg==
X-Gm-Message-State: AOAM5325DY4TGUZTk5QuWDbypIOxiCLucywOJZyhD2DaH9yZBgA1nMpg
 yXccVIayLZ2PjFard0FedUw=
X-Google-Smtp-Source: ABdhPJzfGdlWuTpldxnRFP/xLQ4u1aqaj7Itud+leVccJg6SM6qHcMUDfY+0Eed4Iw8uv2LwuE5m7A==
X-Received: by 2002:adf:bac8:: with SMTP id w8mr7510534wrg.68.1613510808010;
 Tue, 16 Feb 2021 13:26:48 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-6-252-11.retail.telecomitalia.it. [87.6.252.11])
 by smtp.googlemail.com with ESMTPSA id s14sm7132182wmj.23.2021.02.16.13.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 13:26:47 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 0/3] Implement nvmem support for mtd
Date: Tue, 16 Feb 2021 22:26:25 +0100
Message-Id: <20210216212638.28382-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_162649_379901_920FC02D 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mtd support for the nvmem api has been stalled from 2018 with a patch
half pushed hoping that a scheme is found for the mtd name later. This
patchset try to address this.

The solution is simple.
New partitions scheme should always have the partitions {} structure and 
declare subnodes as partitions is deprecated and should not be used anymore.
Fixed-partitions parser is changed to parse direct subnode as partitions
only if the appropriate compatible is used. This change make possible
the use of nvmem-partitions compatible and the entire partition node can
be parsed by the nvmem of framework.
The current code register the partition to the nvmem framework every time
but skip actually of_node parting. The new nvmem-partitions compatible is
used to enable of_node parsing on the desired partitions.

Ansuel Smith (3):
  mtd: partitions: ofpart: skip subnodes parse with compatible
  mtd: core: add nvmem-partitions compatible to parse mtd as nvmem cells
  dt-bindings: mtd: Document use of nvmem-partitions compatible

 .../mtd/partitions/nvmem-partitions.yaml      | 105 ++++++++++++++++++
 drivers/mtd/mtdcore.c                         |   3 +-
 drivers/mtd/parsers/ofpart.c                  |   5 +
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-partitions.yaml

-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
