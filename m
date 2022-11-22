Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE42C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ybj/9bDl13dfUTZBiN13FFnfNEfQ0xMWnUitRLJnCl8=; b=uLPho1frBf3SJA
	hmK6aL5faMFySRQP4jPGzH63xUXWoKqkRrQlynh7m6WV+1Ai+HAKZo6Ra6ig2QDUyzEIfyVIniT86
	k+rrygtz/oyW7R31TZt02yqBvt6kJds2ziM6FhzqdhARwAgn9X9WV9Ua/ne1+jlOAxjGzpDU1wS0D
	7OK04V66b7jPqsTUgusUa5EYrXumuxesZapTQUOaAY5KBPXqGverQhx9PEZvlpZuXsYNDJ2iZdnnQ
	3H7aFkcPe+g5b2wZLck69BDGgu167y4jFEOPsOBRGtO6xf4VTq6QuKbyMTx2RdY9vE4Wft/5Z6F8M
	3eRzFMKSWz/QBqNf6Y0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSKp-0092qp-Uv; Tue, 22 Nov 2022 12:25:07 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxSKn-0092lu-Dt
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 12:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669119905; x=1700655905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cY6HgbrxlA3QWS/f+X29cpCFkfoRWuud2FEA31Hsz+8=;
  b=RlLDyLZfBF1lOnZV49JK2XCis/93iKwPzVSUD4LDynQhiMzjL6VCcqsQ
   BnkjIvJaALUK6n5N7rOXT8R5JeWIF64b6/EkT5t0mOEHyZieE0r+bGvfS
   zwyeuGKO8Y2tcl4oRyXXibfewKie3Dr/ICQp3wio82CC3FLbH7308ExKl
   Y0D/fHHJwRmZdxb1QnYwe17OXP6KmuNYroW49uQ2gMazvIhnDxnc8C0BU
   oREjpoTm/VQd+En+BQu9r5LPPkPYGgutgCd+2uWXkbrJWrqtBXE4YfykC
   /vARrU0doZHYT24BWke9JZNtQRQamuTzAShKtifccE4XYk3ngSDpYiAaN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="314951424"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="314951424"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 04:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="730374965"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="730374965"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2022 04:24:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6787D128; Tue, 22 Nov 2022 14:25:25 +0200 (EET)
Date: Tue, 22 Nov 2022 14:25:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: gigadevice: Add support for gd25lr256e
Message-ID: <Y3y/teAMsOp/tnUk@black.fi.intel.com>
References: <20221023065838.53616-1-mika.westerberg@linux.intel.com>
 <959a3de3-dd71-acaa-d26b-0e93f3db820a@microchip.com>
 <Y3yxDLw3n643Ivf2@black.fi.intel.com>
 <870780c6-6f2e-9b90-6540-2c408f206f6b@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <870780c6-6f2e-9b90-6540-2c408f206f6b@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_042505_561296_8B667AC9 
X-CRM114-Status: GOOD (  11.87  )
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

On Tue, Nov 22, 2022 at 11:59:47AM +0000, Tudor.Ambarus@microchip.com wrote:
> sure, it's fine, yes. Did you test the locking part of your patch?
> I'm asking because if you don't need the locking or you're not able to test
> it, then you can use the spi-nor-generic driver introduced by Michael at
> [1] and you won't need an entry for the flash at all.

Nice! I think this one should be enough for us. It's coming for v6.2
right?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
