Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B15AC25B67
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVuPJkQ2KWhlpmFq1XNxysbyf/Q3Yr7uGyII0rJkRxE=; b=QgR1s8lynY8mhy
	D5vs10LuW5mzMpM//zg7niqlJFny6/j1JTNRQAprwQk+qOJQfL+w1v8YggXNHZ7SsZnzd6SM+Dvvm
	cir6p8zi1PP+xUTvWJgJNQX01d1tNYYzNZMo7NPETMDnbWBvJ0bmYTm7KMVaWfNth6FgB16cjKfZR
	p0ESbyCHU7vW43PBp1fgLPsVRk1TDBVr8sNQANBu7iMlVY+lYPtdl/WMrdfO9LAuJAMB/TInRMv04
	91H7uMWdMlMmqlp1TNns52UkHC8yrAF7v8TqBi7sznPDuWwQnxPmqAv74Jx21i51zc/4ycast7T3k
	ie9EqI+dCaabnrZwoL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJQU-00G3i4-0w;
	Fri, 27 Oct 2023 09:46:46 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJQR-00G3gq-2M
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 09:46:45 +0000
Received: (qmail 28601 invoked from network); 27 Oct 2023 09:46:35 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 27 Oct 2023 09:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=2018; bh=e/fxR6YN2xfO3OOXNQJoLD0l/
	XKbPIRpysCe8SRGnEY=; b=TNj9Q7hmJlSBMUtz2Lpd5RugEr9Y2/WrOsjJ9amWh
	9MxWnjBmhjfnVVImCjlh1ftaxMb5m66a/LWrwX1v/DKgVwgcChupRLCEjsMuXuAV
	ODq+AIpBYc6fQorWonYIq8D7sMJydWwyLgNFfUJAH6ALysK67mf+zBOeE6+TfdLr
	qU=
Received: (qmail 19138 invoked from network); 27 Oct 2023 09:46:35 -0000
Received: by simscan 1.4.0 ppid: 19049, pid: 19125, t: 0.5299s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 27 Oct 2023 09:46:34 -0000
From: Edward Chow <equu@openmail.cc>
To: Rob Herring <robh+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lech Perczak <lech.perczak@camlingroup.com>,
	Edward Chow <equu@openmail.cc>
Subject: [PATCH v2 0/2] dt-bindings: mtd: partitions: Export special values
Date: Fri, 27 Oct 2023 17:46:08 +0800
Message-ID: <20231027094610.1022114-1-equu@openmail.cc>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025052937.830813-1-equu@openmail.cc>
References: <20231025052937.830813-1-equu@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_024644_069420_851837AF 
X-CRM114-Status: GOOD (  10.10  )
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

There are special "offset" and "size" values defined and documented in
linux/mtd/partitions.h:

/* consume as much as possible, leaving size after the end of partition. */
 #define MTDPART_OFS_RETAIN (uint64_t)(-3)

/* the partition will start at the next erase block. */
 #define MTDPART_OFS_NXTBLK (uint64_t)(-2)

/* the partition will start where the previous one ended. */
 #define MTDPART_OFS_APPEND (uint64_t)(-1)

(Though not explicitly, they are compared against variables in uint64_t
in drivers/mtd/mtdpart.c, so they had better be considered as such.)

/* the partition will extend to the end of the master MTD device. */
 #define MTDPART_SIZ_FULL (0)

These special values could be used to define partitions automatically
fitting to the size of the master MTD device at runtime.

However, these values used not to be exported to dt-bindings, thus
seldom used before, since they might have been only used in numeric form,
such as "(-1) (-3)" for MTDPART_OFS_RETAIN.

Now, they are exported in dt-bindings/mtd/partitions.h as 32-bit cell
values, so 2-cell addressed should be defined to use special offset values,
such as "MTDPART_OFS_SPECIAL MTDPART_OFS_RETAIN" for MTDPART_OFS_RETAIN in
linux/mtd/partitions.h. An example is added to fixed-partitions.yaml.

Edward Chow (2):
  dt-bindings: mtd: partitions: Export special values
  dt-bindings: mtd: partitions: Document special values

 .../mtd/partitions/fixed-partitions.yaml      | 30 +++++++++++++++++++
 MAINTAINERS                                   |  2 ++
 include/dt-bindings/mtd/partitions.h          | 15 ++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 include/dt-bindings/mtd/partitions.h

--
2.42.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
