Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D70CD5BB9
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u75WNQ6khVaMXhPBjbYXARsL3TXqI3XssdQSNtcLHW0=; b=2UtNEDRE3tEL4z
	XlL8Z6rFpRcQI4LRqdJzlTP5aGvu26NdWV9PSFkTxqXg2kYVv/nmva0tHE9/O177LBCsvnZ/fPnEw
	MjnDMeHwnSPgGZIh2LTIwtaig58oePq4xUK7P+NG1h1n3sFt29m4eSJzg5NbQEwbwF8at9Z9AIXcC
	7sjP+ua3p5ryTOPYlyt97RNiX2TM/dU+AtLX8eJ7lUr/jKmpGUWmtE4OqpX+5Y1//Vej5rCD4NTMR
	8oXSDjAazUedBHWhc5jyg1AdTugYFej/ox3OGVqvG3sMxtuYpXp5SnQ12+spNPnOIi4eqBPA8ZptK
	0P4VkU15HSTMCNopTUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBnd-00000008MZy-2SGK;
	Thu, 05 Sep 2024 12:41:21 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBnZ-00000008MXg-2tM0
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 12:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725540078; x=1757076078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vmi+1f/dZY2VqSgcwNZ8hfyxCiVY3aGx6vrPWR7PizU=;
  b=k+u0KmRrD2tSImt7iLsvH9Un8CRsWMsjuIypCR1VJRzwTbkhHoLmm4Dc
   8tSJSG/EEt+8BOCW6Y90yCcPKqZUt8wz2Dz0rs9wahjHKOpJNbxc7d7Y9
   xe0dz4sgnKbBF4vK+QfXwVNr6aRMhOIQP3Lwl0iFgLjrOdrhAfWiWsjCO
   veAY/36UloyRmBkcmElqtKT4C8xtYBxbiGAuR51hAfCtO/H5mcs1z44VX
   R6Wdy7/BrBRgsVRV3pYnJyj5u0EHLSRmXmC/SI/ngNWsZAWNgNZn9FIbu
   uvQ/e7QL/pnfjVFEDqrg+NenEOMWq7PYYsu26gixpi3GHxqhnwSd133ZW
   Q==;
X-CSE-ConnectionGUID: x8pNkXZoRaau2N8w/iwCcg==
X-CSE-MsgGUID: UmoZrR6FS8K1t/Ra4bbp5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34919023"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="34919023"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:41:12 -0700
X-CSE-ConnectionGUID: g0N9q6twQTC2A0FV6dSL6w==
X-CSE-MsgGUID: kQc8pjfKTDeNleY3Fp7LKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65301491"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:40:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smBn9-00000005OYX-3K6o;
	Thu, 05 Sep 2024 15:40:51 +0300
Date: Thu, 5 Sep 2024 15:40:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH 00/18] random: Include <linux/percpu.h> and resolve
 circular include dependency
Message-ID: <Ztmm00eLBQGtiwRM@smile.fi.intel.com>
References: <20240905122020.872466-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905122020.872466-1-ubizjak@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_054117_757154_0CBC4EFE 
X-CRM114-Status: GOOD (  25.95  )
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

On Thu, Sep 05, 2024 at 02:17:08PM +0200, Uros Bizjak wrote:
> There were several attempts to resolve circular include dependency
> after the addition of percpu.h: 1c9df907da83 ("random: fix circular
> include dependency on arm64 after addition of percpu.h"), c0842fbc1b18
> ("random32: move the pseudo-random 32-bit definitions to prandom.h") and
> finally d9f29deb7fe8 ("prandom: Remove unused include") that completely
> removes inclusion of <linux/percpu.h>.
> 
> Due to legacy reasons, <linux/random.h> includes <linux/prandom.h>, but
> with the commit entry remark:
> 
> --quote--
> A further cleanup step would be to remove this from <linux/random.h>
> entirely, and make people who use the prandom infrastructure include
> just the new header file.  That's a bit of a churn patch, but grepping
> for "prandom_" and "next_pseudo_random32" "struct rnd_state" should
> catch most users.
> 
> But it turns out that that nice cleanup step is fairly painful, because
> a _lot_ of code currently seems to depend on the implicit include of
> <linux/random.h>, which can currently come in a lot of ways, including
> such fairly core headfers as <linux/net.h>.
> 
> So the "nice cleanup" part may or may never happen.
> --/quote--
> 
> __percpu tag is currently defined in include/linux/compiler_types.h,
> so there is no direct need for the inclusion of <linux/percpu.h>.
> However, in [1] we would like to repurpose __percpu tag as a named
> address space qualifier, where __percpu macro uses defines from
> <linux/percpu.h>.
> 
> This patch series is the "nice cleanup" part, and allows us to finally
> include <linux/percpu.h> in prandom.h.
> 
> The whole series was tested by compiling the kernel for x86_64 allconfig
> and some popular architectures, namely arm64 defconfig, powerpc defconfig
> and loongarch defconfig.

Obvious question(s) is(are):
1) have you seen the Ingo's gigantic patch series towards resolving issues with
the headers?
2) if not, please look at the preliminary work and take something from there, I
believe there are many useful changes already waiting for a couple of years to
be applied.

Because I haven't found any references nor mentions of that in the cover letter
here and explanation why it was not taking into consideration.

> [1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
