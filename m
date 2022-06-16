Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37797C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 05:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QA2aLQKkrYnTw9pphiZ308czqhRgGCVFutxjEhIYRgE=; b=goHjL/eb8ZbPp0
	8l9tiYn8DoYk+IqP5BsdbRLSgcOJON+dL/asvmaLJk89x5BLQet8KeXN/Vi5JmlIYCMByYDUtL+8T
	XH7AbbJTewoWcSEHWQt+KNAIKq7VPPNz1z34TgevZ2TW3bi3tfqXTyBiljMziNDXaXvXMr9DRIsOn
	6lsC/H9Gtzu2HmpT6KcxeMVbah1IwMwsAC8rXXC8YCqxRoIR3AM5TblpkxDjWIFjtUXXPR86tcarG
	TYGoJ2K+Hx61rkc0OAdmq/iSev6rwquZA4SycDB3xeOad098qp5DwSBajnqmcPfMbpmjAEZYSBlEW
	HJ8xiJHKJRcWffy/Xx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1i6F-000X1A-QV; Thu, 16 Jun 2022 05:31:23 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1i6D-000Wzw-8R
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 05:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655357481; x=1686893481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=idniUYYiBsnK5KguXLq8aPFkLwIsz0QVjklyx1DP7CI=;
  b=oAFPFtbjnIT+dvH3n1y2rA6dkJTaNNmlGaY85iOCEEar1ru1VS41czvf
   y5K1SI/0QMHNxm5lVGC8lVxd1U6wy+MKHF8KrN+mssk2PvKf34bLdpBnE
   o7SvSg91QxQSmJ5tPox9YppmbyXI3DOUH79me9hiDC0dH0A/SN0axWU6C
   rqhlZes1EHrWc1YCnhRYtEwB2uMHugS7+WLsmEwE6aHif89QNswlC8far
   1vrixgYtMN7Aohb0NluMJqlWhtNAAd7OD2+D0Y5CQ4g0+L4T1EMP7WKUU
   dEAVF8NxbQVsH40jVmNSO/nO4pP316/W37MjrQTMcaYeX9hGEKQ6qB3lD
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340824872"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="340824872"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:31:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="613034481"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:31:06 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 16 Jun 2022 08:31:04 +0300
Date: Thu, 16 Jun 2022 08:31:04 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, p.yadav@ti.com,
	michael@walle.cc, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, mauro.lima@eclypsium.com,
	lee.jones@linaro.org, linux-kernel@vger.kernel.org,
	xe-linux-external@cisco.com
Subject: Re: [PATCH v2] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <YqrAGKLUazeNH1XK@lahna>
References: <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
 <20220615191153.3017939-1-oocheret@cisco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615191153.3017939-1-oocheret@cisco.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_223121_379573_4414EE91 
X-CRM114-Status: GOOD (  14.50  )
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

On Wed, Jun 15, 2022 at 12:11:53PM -0700, Oleksandr Ocheretnyi wrote:
> Originally commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q*
> entries") and following one 8f93826 ("mtd: spi-nor: micron-st: convert
> USE_FSR to a manufacturer flag") enabled SPINOR_OP_RDFSR opcode handling
> ability, however some controller drivers still cannot handle it properly
> in the micron_st_nor_ready() call what breaks some mtd callbacks with
> next error logs:
> 
> mtdblock: erase of region [address1, size1] on "BIOS" failed
> mtdblock: erase of region [address2, size2] on "BIOS" failed
> 
> The Intel SPI controller does not support low level operations, like
> reading the flag status register (FSR). It only exposes a set of high
> level operations for software to use. For this reason check the return
> value of micron_st_nor_read_fsr() and if the operation was not
> supported, use the status register value only. This allows the chip to
> work even when attached to Intel SPI controller (there are such systems
> out there).
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I don't think I signed this off.

> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
> Link: https://lore.kernel.org/lkml/YmZUCIE%2FND82BlNh@lahna/
> ---

What changed between v1 and v2? And did you take into consideration the
comments I gave?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
