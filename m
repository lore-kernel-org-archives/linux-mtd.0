Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD68C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwVEI4qjIn0yDzSL+Ubno08Dv/rB4eHC+OeFbtiEmKA=; b=JV3B33dCQh9IMG
	hgxDRiN5GbvsJUhEP4apiMThvbq7jPQTR4X9AwZjUj9OMw0Mb06jM3Rt7u1O2j7WV8CFShz6mWaXw
	MkaXY5cYyqoVZeM92OSSy+QcNGT5ZbwGuIMqN8rmdObhwjoxTOnA6gBzONNULN6bRIa4ZQeUVD9zx
	14GsZnFY5j7c9BEJoU7bGDglTmElTVnxkWELUdafiVC4ZYtYezRHvHROBMzKcc4vTRvRYCigZOI5Z
	Mz4ej2af126cvuq9b5SXQu+hD/1Zk9VUVgjHrn+x+O5MwoSgc+1esc0yHk/xUcoWGfyCMpRNC6OmB
	Hu4habSgJ+IjGAi/TClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5UVq-000Zzo-1F; Wed, 14 Dec 2022 16:21:42 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5UVl-000ZuO-SO
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 16:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671034897; x=1702570897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sugwmwrUIAbwUVd9kUUcbnqMzWklglljdUgzpTG789o=;
  b=iluREUPRy2AabOEilDfvYA8tuM8VV3tLCtKFIaP3mZkyykZftTdeI561
   CkWpFCz6cJkiOcRRgR/ApF5DtSdKeSAdf57vKEmmPWlbk++BRhWFB+uie
   5WGEtvJ/Rk09iaSVMN1YbimWyUeCbVZzyP4vwy0SwfNcit9UUsyM3R4p0
   aakomFHRb1iNE7hwr2sxN0zgRZk8iZYG85FVe1eJxBuHkzHcbHxhbku1n
   3mgSSebIW8r1S3NMuil4hDu+3+NKs/ZzpkmaevjOEzGxzj2r8WZPrQb5d
   Zqes2x9mnE5zqWvTYa8/BpDRmDWxT0wXCEjmLvcFXBRhGJKj8XzLsFyWE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="404716306"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="404716306"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 08:21:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="642559944"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="642559944"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 08:21:20 -0800
Date: Wed, 14 Dec 2022 17:21:17 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexei Starovoitov <ast@kernel.org>,
	dri-devel@lists.freedesktop.org, Song Liu <song@kernel.org>,
	linux-mtd@lists.infradead.org, Stanislav Fomichev <sdf@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Christoph Lameter <cl@linux.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Richard Weinberger <richard@nod.at>, x86@kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>, ilay.bahat1@gmail.com,
	Ingo Molnar <mingo@redhat.com>,
	David Rientjes <rientjes@google.com>, Yonghong Song <yhs@fb.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Petr Mladek <pmladek@suse.com>, david.keisarschm@mail.huji.ac.il,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	intel-gfx@lists.freedesktop.org,
	Steven Rostedt <rostedt@goodmis.org>, KP Singh <kpsingh@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Borislav Petkov <bp@alien8.de>, Hannes Reinecke <hare@suse.de>,
	Andy Lutomirski <luto@kernel.org>, Jiri Pirko <jiri@nvidia.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	bpf@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Hao Luo <haoluo@google.com>, linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>, aksecurity@gmail.com,
	Jiri Olsa <jolsa@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <20221214162117.GC1062210@linux.intel.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com>
 <20221214123358.GA1062210@linux.intel.com>
 <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_082138_007755_8411B1F5 
X-CRM114-Status: GOOD (  15.39  )
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

On Wed, Dec 14, 2022 at 04:15:49PM +0100, Eric Dumazet wrote:
> On Wed, Dec 14, 2022 at 1:34 PM Stanislaw Gruszka
> <stanislaw.gruszka@linux.intel.com> wrote:
> >
> > On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> > > Please CC me on future revisions.
> > >
> > > As of 6.2, the prandom namespace is *only* for predictable randomness.
> > > There's no need to rename anything. So nack on this patch 1/5.
> >
> > It is not obvious (for casual developers like me) that p in prandom
> > stands for predictable. Some renaming would be useful IMHO.
> 
> Renaming makes backports more complicated, because stable teams will
> have to 'undo' name changes.
> Stable teams are already overwhelmed by the amount of backports, and
> silly merge conflicts.

Since when backporting problems is valid argument for stop making
changes? That's new for me.

> linux kernel is not for casual readers.

Sure.

Regards
Stanislaw

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
