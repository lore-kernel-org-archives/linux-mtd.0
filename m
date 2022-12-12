Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C946C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 14:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNyigIqzYxFVzFHQZmiaxNMFdfu+ENVLDbBZSUfVPsc=; b=BR8m6b+jmuItNX
	P6RU2b1ZH3HPU968Y6S/A7t24N6qhfgPULymqrbXB6cZNdznpY6VqZYVwXq7GwgJhK1ZC1W5CGtIs
	3enWYcjNEkIggQDeFXKIqbNPRw8r0a3h3+30bHpsTuArDy7zWTrOjUorKK3YD9Q479orOCSNOjxwN
	FKzW5Ex05Y+AcqUKirI0lHbqFE5TtC1P1cXjSvsSjuS2w+B+H/5/Zx9yT2mkGAgfb4urox4nWxF3Y
	rZiM5nlOOYrChV5JMOpYn4mlvNbLbhYikOTezCmDH5FaStdXBNqL92/vROgUxznT7xe8RGwER/Xsz
	gfJrBWkH23OadMWZZELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ju6-0002xa-7x; Mon, 12 Dec 2022 14:35:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4ju2-0002rM-KO
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 14:35:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9C246B80D8A;
	Mon, 12 Dec 2022 14:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7EEC433EF;
	Mon, 12 Dec 2022 14:35:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Wl6pADoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1670855721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KyY32z5nf0Lu8vM4J/2IpAlTcstrOO9+asdsS0mdQs=;
	b=Wl6pADoHCtIIbQYtGWyzoK0/ft/6K3+8UZfyGZQbHCn0OgumkLD978IERouS9rLh91V7py
	ofol1dOocMk4p1DFNAhuJ2rC6+TlFlqFiUo0IADIb6l2vBWdPsmninRN5yWI9N/OpXZpdd
	5BCaUAKkpp98C6Hq6gwjcSOdDz781ww=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db04abc2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 12 Dec 2022 14:35:21 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:35:20 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: david.keisarschm@mail.huji.ac.il
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jiri Pirko <jiri@nvidia.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, aksecurity@gmail.com,
	ilay.bahat1@gmail.com, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, netdev@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 1/5] Renaming weak prng invocations -
 prandom_bytes_state, prandom_u32_state
Message-ID: <Y5c8KLzJFz/XZMiM@zx2c4.com>
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_063535_016267_512D7458 
X-CRM114-Status: GOOD (  12.11  )
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

Please CC me on future revisions.

As of 6.2, the prandom namespace is *only* for predictable randomness.
There's no need to rename anything. So nack on this patch 1/5.

With regards to the remaining patches in this series, if you want to
move prandom_u32_state callers over to get_random_bytes() and
get_random_u32(), that's fine from my perspective, but last I looked,
there was much usage in places where being repeatable was actually the
goal - test suites and such, where you want to be able to redo your
tests with the same seed. So you'll have to look at each instance case
by case and convince whoever maintains that code that they don't need
predictability. However, if you do that, the right functions to use are
get_random_bytes() and get_random_u32().

Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
