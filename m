Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E64D26D68
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRaSqh8RL4mIP+pHaTJYmGwx0vFbOHSIZ5atm66p2aE=; b=IE3wCzXPJazbV5
	YoJVndi+2R21txDtM1iJNn/xl0ZvTXRLgOvkZ6OOUP6JgyLAMvoyt0diCwnd2HIKdrlOpKBcPk70t
	tWly9/LDNVcWLHN6CSajMwqs1d9OEQ2/FNqxZLsmcuaUH6bIZSwD0iziWSo+XKL1gBTpLNoWry8IB
	zSJt99yxZUjNuaNHpo3Ir1RH/IGoVJF1FDwLrPBFKDr7n4TX8CLxzR12g3f905rYltsG1b4iGkZAE
	kwrEzEh4Jgu4ERqH+C5G1FF6RqZbNH0xSERdX8He720/dqoIMvoaLCLcTHd6dyaNXmfJf9a1uYw6Q
	BhySEKxfP+wa6NM7zUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEEH-00000002So2-0rKE;
	Fri, 09 Jan 2026 15:16:45 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEEF-00000002Snh-1W2S
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 15:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767971803; x=1799507803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TwCIHc4FDKyAmychWf6wK9UKfVVSINwm2NA+GwALIUQ=;
  b=DH07fKYPH3jsPpRJz3c1wwxuLIMtfKsBw9w3/QYM/WBqvzg3Ncf43s0h
   thQ/R8frisI6wUCMir+4n+zGL0Fz7tmq5PkFCr6/R4VG6QXgVo+64TErN
   bkYvBu13L2ecxLGNNNn5XP0jCe/Pwr0PJ9h2qddfj/cTSDj4tswsE4VVE
   NaQXxXge1vKvlvlfDeO6sDJVL1JfUr7WIQJRWxLDyo4YBqOdxtk/OyQkC
   sTNotmdJHf1Eu7n8YBjm1AqJi4k7S/djrpjFAsUxNcJPE+nmx8j5Eq883
   NevLOeaouu3reKbiEaJb7MsL4FyOya1dkTxxNN3wmF4HdEDUxMMG4Muem
   g==;
X-CSE-ConnectionGUID: IvB0I8ZOSf+dfkCK4y0BaQ==
X-CSE-MsgGUID: uBMRsQyjSoWe6L4iUQJdfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68553656"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="68553656"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 07:16:41 -0800
X-CSE-ConnectionGUID: rAY08spDT1KBcZcWw1GZ7Q==
X-CSE-MsgGUID: 8ZEnHRCBRnGnY0nObmfolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="203778588"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 07:16:39 -0800
Date: Fri, 9 Jan 2026 16:16:36 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
Message-ID: <aWEb1BF786hX6gmo@black.igk.intel.com>
References: <aUZFLezigzZQVt55@kspp>
 <aUZLNTOMgvJ8WrIy@black.igk.intel.com>
 <0c69b711-4c88-4e64-afe7-f7de147a490b@infradead.org>
 <aWDNNOoYTa0Mi7LM@black.igk.intel.com>
 <87a4ymyjxh.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a4ymyjxh.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_071643_443767_7F8DEB3D 
X-CRM114-Status: GOOD (  19.89  )
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

On Fri, Jan 09, 2026 at 02:50:18PM +0100, Miquel Raynal wrote:
> On 09/01/2026 at 10:41:08 +01, Raag Jadav <raag.jadav@intel.com> wrote:
> > On Wed, Jan 07, 2026 at 03:17:40PM -0800, Randy Dunlap wrote:
> >> Hi,
> >> 
> >> On 12/19/25 11:07 PM, Raag Jadav wrote:
> >> > On Sat, Dec 20, 2025 at 03:41:49PM +0900, Gustavo A. R. Silva wrote:
> >> >> Fix the UBSAN: array-index-out-of-bounds issue below by updating
> >> >> counter nvm->nregions before the first access to flexible-array
> >> >> member nvm->regions[].
> >> >>
> >> >> from kernel bugzilla:
> >> >> https://bugzilla.kernel.org/show_bug.cgi?id=220823
> >> >>
> >> >> Dec 15 22:01:52 orpheus kernel: UBSAN: array-index-out-of-bounds in
> >> >> /var/tmp/portage/sys-kernel/gentoo-kernel-6.18.1/work/linux-6.18/drivers/mtd/devices/mtd_intel_dg.c:750:15
> >> >>
> >> >> Notice that this flexible array is annotated with the counted_by()
> >> >> attribute, hence the counter must always be updated before the
> >> >> first access to the array.
> >> > 
> >> > Already fixed[1], but not sure if it's landed yet.
> >> > 
> >> > [1] https://lore.kernel.org/linux-mtd/20251111-mtd-nregions-v1-1-61db61e78c63@intel.com/
> >> 
> >> What's the status of this patch, please?
> >
> > I'm assuming it'll go through mtd tree? Miquel?
> 
> It should indeed. However only the mtd list has been included, so it
> won't appear in "my" todo list. Lucas can you please resend, and use a
> tool such as b4 to manage the series or at least run get_maintainers.pl?

Lucas is no longer with Intel. Sasha, would you be up for it?

Raag

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
