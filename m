Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21D4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOmcM5nPiGCjMFnTpakng7bRQFKtnii2RH5xXtrZ2e0=; b=FK8H8YiNi2mhrX
	Lx+cTf/XmzvXviyu/1K1Z0ubNqQaGDRoL0ahaDr8+cMFI8wmabJeamcWnOYxXEXco+MJ12M6wh+YN
	V1t5TgPBRuomauQ7P1okFGtNThwvVdzy9pQPlx4gbFm5Iv+H4iCtrWu1BGSueeZH4Dut24zwZDGCm
	GOyruC3DmDcMQJ4U4/069GtaFd60+EE7Y4j7/cKYv+GRcvAwwSXu78kL4+iKX0RyYBhIm9BUgapwr
	0RBqtAcMXEclGrilaBOwJwDWXydsHirdYYqZQ6GxLVPmCM+pRPKhxcQAy1ZAx/O5dLqzwz/NxMCu9
	XVLOakMcIdL3dSaFUgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitZp-008h6h-BQ; Mon, 25 Apr 2022 07:56:09 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitZj-008h3I-7k
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 07:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650873363; x=1682409363;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XQv8wyBFruRQaLwD5UI6qiGXru0gitI+QJEBT5NMidw=;
 b=aOPVBGGkvUL3Pq22ItC6w5tbZZQ8a5WtndFyGBc3D09/zZ2N6lW1EFfK
 gDLVbX7dg0a3JRzlgidyqEhPpvi0aDtCmyuNZVl0Hnqru8tgF3/ylqCqF
 N1r39ZqdaTjUxVPg2iwVf3H0DdhZaoFbzFjdiWDC/C5yHK32MMOdedlHz
 zO1BiUzVu4eTVbP3sEpJ9FY0w9dDPN/pAIckmE96UC6BynXKVqgrWfzUF
 2C2O91cRigaaG97aOTnIDzIk8hN7WlgJNz3WWf4YkGkH7CI6DPLlJdTAu
 48CoRTh+l+9O4m03I35tCP+wKu3vydwulwRo3JFYJKv3mS3fMmlAULSSm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="328113973"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="328113973"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 00:55:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; d="scan'208";a="660037713"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 00:55:55 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 25 Apr 2022 10:55:52 +0300
Date: Mon, 25 Apr 2022 10:55:52 +0300
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: "Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco)"
 <oocheret@cisco.com>
Cc: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "michael@walle.cc" <michael@walle.cc>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "mauro.lima@eclypsium.com" <mauro.lima@eclypsium.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: mtd: spi-nor: fatal issue during the mtd_erase() calls
Message-ID: <YmZUCIE/ND82BlNh@lahna>
References: <BYAPR11MB27570C5DC510D0F37FC106E4CDF69@BYAPR11MB2757.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR11MB27570C5DC510D0F37FC106E4CDF69@BYAPR11MB2757.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_005603_375702_1FF8DB7B 
X-CRM114-Status: GOOD (  15.54  )
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

Hi,

On Sat, Apr 23, 2022 at 10:32:28PM +0000, Oleksandr Ocheretnyi -X (oocheret - GLOBALLOGIC INC at Cisco) wrote:
>    Hello guys,
> 
>    recently I've faced the fatal issue "mtdblock: erase of region ... on
>    ... failed"
> 
>    working with MTD device (Micron n25q128a13) on recent kernels with
>    version
> 
>    5.15.x and newer.
> 
>    Commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q* entries")
>    adds
> 
>    SPINOR_OP_RDFSR opcode handling ability, however controller driver's
>    side
> 
>    (i.e. intel-spi) cannot handle it properly in the intel_spi_hw_cycle()
>    what causes
> 
>    a failures in the the spi_nor_fsr_ready() call what breaks some mtd
>    callbacks.
> 
>    Are there any plans to implement this SPINOR_OP_RDFSR opcode handling
> 
>    on the intel controller side? Is there acceptable way to provide
>    ENOTSUPP
> 
>    case response from controller driver side to spi-nor driver?

I think the Intel controller does support this internally but it does
not expose this to the software. I wonder if in this case we can, like
you suggest, return -ENOTSUPP and make micron_st_nor_ready() to handle
that case?

SPI-NOR folks, what you do think?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
