Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D44C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Dec 2022 15:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skwvTn240tOkmuK1st6xt2nEc/Okxw5XvZQ91qsMCcc=; b=Xkln1YzoB/6nZ+
	cESHxSbwCTsUT7stz0upt+ycRjmQSLoWIwxua3SYrT0nNZlcMLcVjG5y6SRZFy9EoopAT6H5V1Qez
	MSBVlDVQCQeZZM0NK8oYNZ0dp5KTScc6IJYiXlOeSk3/NhAlEo0u+17aMOmkP5IojeMOzMJjk3UdA
	1+vJ92h2Fu4Ess7b9FzlXH7BSRnOkH1filg9UxSI0EAx6cUfSeR/JcM/hDrNiMA7nuYGzXpiPR+xf
	LC2Di0+rkjvHQ5NXBscMSTGOK27yrxbzB+ZU9mBHHRp8v72rz/qfQo+ZWIo7gxLO4XGvhJUSB/TOt
	9safgMug3aIBKiHsVaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ebC-00HQ67-NM; Tue, 20 Dec 2022 15:32:10 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dS4-00GZvT-NW
	for linux-mtd@lists.infradead.org; Tue, 20 Dec 2022 14:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671545920; x=1703081920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RNoKwRr5C4L86GoAxSCU/infqiCSap2MrAl/iBgBGgQ=;
  b=W0xtRITmjTpTntT6Luilo+Pxgi5MmAmhD6OnH+TMVdcIb44a2+zBtDBr
   TRKeYOb9dTRBjn4/6WJbAYtEbmas+SHb3IhxHH1qjgoQHYYVq/hJd4LQY
   cQd2pe14hCrWnoSnORiFzoLKFMTeyV4aqj8m7hfneZY/5R3OsQpmo17Ii
   25+sAMOYcG2h6DfPEeHzj7whOJDnyL3Vo3C0kAw40R51gSp9qv+9YVIcr
   y219G1nrtEyVigKxFKXJuf4PjYADQmtrjSSWLo+h0+7NesZqTIb40H9YC
   P7sHTZlH2nN/Q+ev8rCrMOnVenW7Qp2hlTDXoE/r6RAYTzbY3Mh2lgBdz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="299964366"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="299964366"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 06:18:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="825277253"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="825277253"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2022 06:18:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 70BAC11D; Tue, 20 Dec 2022 16:19:05 +0200 (EET)
Date: Tue, 20 Dec 2022 16:19:05 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Message-ID: <Y6HEWZ840GiS0STk@black.fi.intel.com>
References: <20221220141352.1486360-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220141352.1486360-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_061840_821295_FCC9EAB4 
X-CRM114-Status: GOOD (  11.45  )
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

On Tue, Dec 20, 2022 at 03:13:34PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
> fails to build, as it includes the shared CFI header:
> 
> include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
>    62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
> 
> linux/mtd/spi-nor.h does not actually need to include cfi.h, so
> remove the inclusion here to fix the warning. This uncovers a
> missing #include in spi-nor/core.c so add that there to
> prevent a different build issue.
> 
> Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
