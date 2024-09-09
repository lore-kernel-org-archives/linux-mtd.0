Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55971ECE579
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0OQhj2+xVVlLv9t2VVGq2revV65O660pDNW54tUzro=; b=bCXBc1ZeQSjz4G
	7fw1Yl6/XIOnFH6JnR/ikDn3eyxeUOcE52DRHb6HQNFLj8mYdGgY+cUqh/2NikLWDDQzjbyQiokyY
	FBeHEfM0mRsATKYUJ/7PBxFvF5FC8cd9FDm1dOebNqA98tl50I5iKpDnxrgmHvbzmILpjTSwTtyaK
	1GnF15GRe76/BuPsTZZkdg8EoVq7s7irAHYXTX3+fMrFbi3HINaZSvVmpt2uNVkR1IoIz9JS6pErE
	55Ah8++DWaJ3Zo00o8mi0dkhRUun3hx1njl64xTmeYBbWKA4u8OA3swmzIxvHh6CQHD0NkhL8XdwI
	JPyxy0t7FtMdjll9Z7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snglt-00000002ZFm-0bVM;
	Mon, 09 Sep 2024 15:57:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snglq-00000002ZDS-0zHf
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 15:57:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7B8D5C01DF;
	Mon,  9 Sep 2024 15:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2F1C4CEC8;
	Mon,  9 Sep 2024 15:57:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bOIXjvAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725897452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbWr4vi9pa8+Cqp83onNnmk1v5W+k1MGPgiQ/1MwNSc=;
	b=bOIXjvAESpiyWOLfxiXwIhAtPOG1y1+0opyH9Q87ZwFnbiPRA4b3wNogUcxJqtsfJjafy2
	EIPyfn290ab/wumQZS8/Njm/fN604qRqGzCtPRB3Oi6XyRiwcddBL2PngABSxf1zQ6eimS
	KerTR+BY/Q0Rag++udJH9dHwTPIZMJ8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 242879eb (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 9 Sep 2024 15:57:32 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:57:31 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
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
	Linus Torvalds <torvalds@linux-foundation.org>,
	Hannes Reinecke <hare@suse.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [PATCH RESEND v2 00/19] random: Resolve circular include
 dependency and include <linux/percpu.h>
Message-ID: <Zt8a6_RwLG2pEnZ6@zx2c4.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085742_415770_2FF98D11 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Uros,

On Mon, Sep 09, 2024 at 09:53:43AM +0200, Uros Bizjak wrote:
> a) Substitutes the inclusion of <linux/random.h> with the
> inclusion of <linux/prandom.h> where needed (patches 1 - 17).
> 
> b) Removes legacy inclusion of <linux/prandom.h> from
> <linux/random.h> (patch 18).
> 
> c) Includes <linux/percpu.h> in <linux/prandom.h> (patch 19).
 
Thanks for doing this. That seems like a fine initiative to me. (I'm
also curious about the future percpu changes you've got planned.)

Tree-wise, were you expecting me to take this through random.git? And if
so, what timeframe did you have in mind? For 6.12 next week (can you
poke folks for acks in time?), or punt it for 6.13? Or did you have a
different tree in mind for treewide changes (in which case, I'll send
you an ack for the [p]random.h changes).

Regards,
Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
