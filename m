Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D14C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pEs9rbw2CC6MokmLgPZcMO2OQLq4f5IAFd3blmoe1Y=; b=inOFUmr63g25fD
	OMXSepRAc9uVLz41MWCeWN79u3REuoPSbhsJb4OoojQjTtdV7MUNXw4dey10Z3xRFyNLJ5uKTFPCE
	xb2zB63Ad9wL8qC13RENrQHPF9q87JOBI4/8rQUFKh5fEaS6ifF3adq6dllpcJLHHL2RSVcGx4tmt
	SkBX6MF3vCs95VlfY+8jBmJivRyH7dtTEow9Oxts93kPVJy2fpYxbQBvtj5pRGzbewHl0GuS/PsoX
	XtwwunzBqQqZihMnL0oifRcUf6q9/QTpUPJXW56pxmlYoXl4GEErWmXVJLj0lXzLvyJjvnAqGsoSD
	GAbHRj9ayxBtaX+xW4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Qxl-00GLsA-1x; Wed, 14 Dec 2022 12:34:17 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Qxi-00GLqg-VW
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 12:34:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671021254; x=1702557254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gLUmLxK/mwLgHaeh9UkBdZ9YGpWxeUp7JgHpb5LXdic=;
  b=Kc8ofrMAROV/GHCMIe845KKqAg5nG5w1Sq/xbiwHeOMaSpdGs3MH4Ymn
   8IB/0AHC8yQfmPyhOFGvJVhzU5pIfpCq6H2QMm4jNQxEaMgp8PPs2UzTa
   w5JSmGofyNpS17+oUB4KYI9zInMwvH5hXuq3PVsO+tKdh/D2KZrGzuHCs
   nCWEEHARafv+Q7TQuS9/oy92jX5yGcn9tkUjyRZ6yLGweD4u/EPgoMtPO
   ReSnscCE7Wkljehw/o9uKBLN7NG5ZoWe19l1h2XENkemLYckAghrm5GtZ
   Jp2UUgyI6b9H4/1bLzmWY7vUYGc0qPPejd2LX09kBnQcW2ZvngTBnjpN7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="345460245"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="345460245"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 04:34:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="823243981"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="823243981"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 04:34:00 -0800
Date: Wed, 14 Dec 2022 13:33:58 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: david.keisarschm@mail.huji.ac.il, Vignesh Raghavendra <vigneshr@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexei Starovoitov <ast@kernel.org>,
	dri-devel@lists.freedesktop.org, Song Liu <song@kernel.org>,
	Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
	Stanislav Fomichev <sdf@google.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Christoph Lameter <cl@linux.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Richard Weinberger <richard@nod.at>, x86@kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>, ilay.bahat1@gmail.com,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, Jiri Pirko <jiri@nvidia.com>,
	David Rientjes <rientjes@google.com>, Yonghong Song <yhs@fb.com>,
	Paolo Abeni <pabeni@redhat.com>, intel-gfx@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>, Jiri Olsa <jolsa@kernel.org>,
	Hao Luo <haoluo@google.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	KP Singh <kpsingh@kernel.org>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Hannes Reinecke <hare@suse.de>, Andy Lutomirski <luto@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mm@kvack.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>, aksecurity@gmail.com,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <20221214123358.GA1062210@linux.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5c8KLzJFz/XZMiM@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_043415_099609_F474546D 
X-CRM114-Status: GOOD (  11.02  )
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

On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> Please CC me on future revisions.
> 
> As of 6.2, the prandom namespace is *only* for predictable randomness.
> There's no need to rename anything. So nack on this patch 1/5.

It is not obvious (for casual developers like me) that p in prandom
stands for predictable. Some renaming would be useful IMHO.

Regards
Stanislaw

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
