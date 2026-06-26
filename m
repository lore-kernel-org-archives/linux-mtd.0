Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF23CD4F26
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixueIbrnatMI9cfs25IRtPeLcaEa+3jFqs3gxLML8i8=; b=ibIL10Qw7dZWkQ
	P98uJ/daIPE5D56eQXQrUVH1RrHS5N1wbx05zmdDIoq7QKs0WhNtz4DO3qt2/USX+pYeMmcUJFlJZ
	iJzSCrRTEndT7tDi37QtPg8tk9hOwUsXWPpBrn8pGmtp6lXy1MIcEQl2fW6/KZ8JPwxOIcpZ09MSj
	Iua72vEE/1X651TCgH/rtiHu5+gI/aaPmkpzy5EhbpoWsEnt5I2VmhGLeVAidPLhz0x7bkqPuEbZP
	eKqAGpkIuIVXKaqxXk4F0GtdmUdPOdPR/p74o2SAZe1UFswzP2rXv1OISJQaeFyqfQokIYppx+nFs
	6NZwU6O93SoADNUsZXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5YB-0000000BItB-1Sii;
	Fri, 26 Jun 2026 12:20:51 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5Y5-0000000BInD-2Cje
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 12:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782476445; x=1814012445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GQdkiFYQJIel4Gg360i3/xZux3oAYTuuUHnkPqH4GqA=;
  b=aXSxL9AriLkLr/K4kjoITesjNZyzaQpY6UilAX/ONoaU3BoLeixz3a3h
   92+vfs70ZXbVsYjSYRHFyVLuauYzP6wZ96k2IOJyVLEyGVFWoSqcK9HCW
   2h31UASfo6ZlmCncatX99fuwOwBgY1g+GsSNBrwiMPJIhsiZPt18ZKVAJ
   nEl9zifz9ezJgi2g0JLB4YPpC5WT4NBFw1Q0cWsglHDFZI2EiCRtwycAW
   frHJHw7zma8B1E0DnDVHglGj1zss2jIKsgHkEDn4FTIrSiiccmJy9xzIC
   CSXTybvew7POxo2sEJ7IZNnGvedo5p7fi83/LvSW2joZSQjZp4fwOVrrt
   w==;
X-CSE-ConnectionGUID: dmqDo4FfTkqHvAuRkOtu3Q==
X-CSE-MsgGUID: XL2GdXdWQ0CVGxquNVNfEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83037497"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83037497"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:18:44 -0700
X-CSE-ConnectionGUID: ili9L0J/Sr6VR/zo02vtpg==
X-CSE-MsgGUID: NKlMMr9hSSaFez4psVLROA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="251468981"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.1])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 05:18:42 -0700
Date: Fri, 26 Jun 2026 15:18:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
Message-ID: <aj5uH-7WfM4BPXbc@ashevche-desk.local>
References: <20260526103227.3152003-1-arnd@kernel.org>
 <20260526103227.3152003-2-arnd@kernel.org>
 <b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
 <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
 <5dd8cf26-533f-4a32-8885-3eaad7c57ed6@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5dd8cf26-533f-4a32-8885-3eaad7c57ed6@linux-m68k.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_052045_627281_D7B8749D 
X-CRM114-Status: GOOD (  12.56  )
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

On Fri, Jun 26, 2026 at 08:15:42AM +1000, Greg Ungerer wrote:
> On 26/6/26 00:10, Arnd Bergmann wrote:
> > On Thu, Jun 25, 2026, at 14:07, Greg Ungerer wrote:
> > > On 26/5/26 20:32, Arnd Bergmann wrote:

...

> > > No out of tree code is required. Most of the ColdFire defconfigs have
> > > CONFIG_MTD_UCLINUX enabled, since it is commonly used.
> > 
> > I see, this is surprising from reading the source and
> > git history, but I can see exactly how it got there.
> 
> The early, and probably more interesting history, predates git.
> It has always "just worked" on ColdFire platforms, so it really hasn't
> needed alot of change over the years for this use case.

If connect history.git and use `git replace`, one can get a history till
to the very begin of Linux kernel (yeah, some as tags and patch bombs, but...).

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
