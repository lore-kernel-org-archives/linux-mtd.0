Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD04C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 17:21:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E43C0206DB
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 17:21:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lBYuOpu0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E43C0206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AvlRwDpFXtORhcNTdYz8kllADcVwxjRKjFRFHCK/Jik=; b=lBYuOpu00qwUyq
	GkI3v8aRlWqB+Ak4HdQB1ujPrLH7O1yOG22KDHyopKTLIomDpe2GWGLXghwkdMBS7+QsiE7sQTtd2
	pYePS6H/0wMOqMb25uTLCSSCixA0Jq/5UjyQTBKp8aQdkyY9vm6gkm2fFqCI0XBPcU2swTdPeBsTj
	K398UOuGa0Vhf/ZxQaHlD6Ij1Pz01OwPt9KfpyomMxoN3fMf95wxflzB9fYOcBdApi82LeHdfPzy/
	3JTZ8Slj4Ui1cLuFcC5GgLO/3LcUDtSkNo5ZyqbRmNUbLPE1Jaf93h4U+gAr9+kyN+iCLK7ZrizaG
	u7JUlJ5wFrO+6dlOMsJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHsf8-0004jV-2l; Fri, 27 Mar 2020 17:20:54 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHsal-0008Gb-6q
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 17:16:28 +0000
IronPort-SDR: HkXwg02gJA/HyQBmKeEO6pJfV5GLXCOXpEulNy6AP0PLcBEq6h0AJSIllTx0CYtmOkA4DsK9ow
 Lv+h2bcgd0aA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 10:16:22 -0700
IronPort-SDR: aHv7Unn8mRwlgi3Qfr+gYuN24RZvQH5Ykuht/FJccfB07SbCf4u/uOAmlYxrlrrJBJRndq+vlz
 rSJTyXomDiZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="358542686"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 27 Mar 2020 10:16:19 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 27 Mar 2020 19:16:19 +0200
Date: Fri, 27 Mar 2020 19:16:19 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200327171619.GO2564@lahna.fi.intel.com>
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
 <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
 <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <CAP6exYJ_jzrB0D=RLXMNeegu4BwQq8raXVOMugkqzX2ZP_JSqw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
 <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_101623_690663_2E0A0540 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Mar 27, 2020 at 10:05:52AM -0700, ron minnich wrote:
> I did try the \ thing but found it a bit tricky to work with, with
> lots of potential for simple errors.
> 
> It would require cmdlines like this
> mtdparts=0000\:00\:0.1f:etcetc
> 
> A lot of these mtdparts definitions are produced by scripts and
> Makefiles and there are many, many places where \\ have a way of
> vanishing.

Right. One option would be to use the printf() style escaping and make
:: to be literal : in the same way %% is literal %.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
