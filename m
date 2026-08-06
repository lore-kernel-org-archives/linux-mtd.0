Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81F2C5AC67
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2026 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HseKqFyUm2GRgbH2ECkHlUpenpq6ByYE1zy50V3/Q44=; b=XwzCfzmoS19LDl
	4amW73K54GZgq0k3CvEsDHMMseouHn/45zyOSetWM9a9liizLOiiGcswH48k9r6FeJ2E3XktuBzKx
	c7sQZNqFpn3fL/WQUUzQXuouc9BtFrGu2OX4HmD0q+tnvEvwccIOD5rzKrDiLYyE0oxJq5//x7HHK
	Sci/ub6Fh2ZwYPCJqU3ZCOmFAgoMFp6JgRm5YdvnT7sShzvDzTS8tGN44zkouBa01TAw+V1/yml3f
	g6ZDBk91wQmn5H92HkzKnmEl5/1df9/3p4tb99MBWwUu3Jgr9c3jjOh4C4YKFBP0SBHlvio2Hw5V0
	d1ysp5yxV1Q/IB1HoDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Bf-00000006hKm-1lPe;
	Thu, 06 Aug 2026 20:59:35 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5Bb-00000006hK9-1ztP
	for linux-mtd@lists.infradead.org;
	Thu, 06 Aug 2026 20:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786049972; x=1817585972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eiEq6ajoVam5UhmcN6KR8EBVr/vL0hNsTUjeeAevvRc=;
  b=D77AWFvkBitmlNOLpaVQ8HBh6tyE3tCy+u3rMMYHPbZ03CrMpzW4sXNR
   UKS6fkjexLR7nCAb09Uiz3gNsGPQgeIOMkTDjYChKbrRlutiK6qBS2HNE
   vZ32COzt8EmD3OMrFqhlAiBYWJKtaulOVldkuuS1XHeaZBuw/FG0jpXww
   l/sIHNHJSmT0MrglqV7vIhEu9ufpQM3a4hvA6QesTuHds8ZMYotFUXujE
   XRhW5B9W/V7k7UFlBpeVeBEKEjDp9KU3dOpNiYtWFWMN1kGLs9x0pLbUN
   T+voCapTRVnYkzlQzDrgZPvJ5YIlCb7/3Jab01w9UyQVn9MHoE6q+GFsZ
   g==;
X-CSE-ConnectionGUID: u1kyC/GYTs+6y7KRe61g5Q==
X-CSE-MsgGUID: LlqOu8MESWSccO6Wqk6Grg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86666474"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86666474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:59:06 -0700
X-CSE-ConnectionGUID: S8czKJ88Q1eQl5p3rZmLbg==
X-CSE-MsgGUID: k39Aw2euSQGOL7HH9KgulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="260437836"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 13:59:04 -0700
Date: Thu, 6 Aug 2026 23:59:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	arnd@arndb.de, sean@mess.org, rdunlap@infradead.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: maps: remove dead select of MTD_CFI_BE_BYTE_SWAP
Message-ID: <anT1lU7zm95HPs6J@ashevche-desk.local>
References: <20260722220618.198164-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260722220618.198164-1-julianbraha@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_135931_563248_A9C1CF35 
X-CRM114-Status: GOOD (  10.28  )
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

On Wed, Jul 22, 2026 at 11:06:18PM +0100, Julian Braha wrote:
> 'select' does not work on config options in a 'choice', so currently it is
> possible to enable MTD_PHYSMAP_IXP4XX without MTD_CFI_BE_BYTE_SWAP.
> 
> From a previous conversation, it was decided to remove the select entirely:
> https://lore.kernel.org/all/c6268184-4904-49d9-b14f-0e11dce8bdad@app.fastmail.com/

You can make this a proper Link tag.

"From a previous conversation [1], it was decided to remove the select entirely.
 ...
 Link: $URL [1]"


> This dead select was found by kconfirm, a static analysis tool for Kconfig.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
