Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629E7ECE59C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 00:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bn6I/G1+1tOOhu8zHB/PML5ffwRLSzdzd19yyU6Ai9o=; b=rup+yrTLNKRccW
	pxe90uGDEF+EGvx04BlIO/fJP4QfjSlkSry3wPYdiwwVrsCOuAYCEx5hK98LZBrakJinDlu5YixIk
	g2tyaHWllDQxUQ6cOffJvNBd7YIbJIBgdBhoN+FEVMR6vV6ACSuoAuGqFsckAvI1/wrxSftBw14v6
	F9hy7b5XEa02kKOykW01FkNOuhUzpSsIe705Ggn54Y0L9GPhV0Jw1RGgxgsjzhKQ2uBLELElBSzf+
	RqE8IPhSvYIvocg6BQLNXHEAMLKea/7K5b43VIks+qV3QWN9QXT9SSVLCv7cxCeOEA2Pnjs6tkCzM
	P2PD7i82z7PhrENISI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snotO-00000003hbB-2zIt;
	Tue, 10 Sep 2024 00:38:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snotL-00000003hZ6-1mk5
	for linux-mtd@lists.infradead.org;
	Tue, 10 Sep 2024 00:38:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D5DEA43FFD;
	Tue, 10 Sep 2024 00:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DC3C4CEC5;
	Tue, 10 Sep 2024 00:37:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZKwT+fr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725928668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OQLtanPdpI6IiO92yLD4QK+WpMduqZbfYjfvTA4Wjlg=;
	b=ZKwT+fr48l6iq8LtejYrRYTAB9HVjSoYl2w9SIS8taTr8eJGaMN+UnDXFn2Y+3WPqB/R/F
	rRaSffSolaALbBnXYJobLzN3VpV4Ezx51BMaa/1NhCLY3oqj42i7Mx1nH5OoYZ9G42zSuF
	N4doRAUS+Xs6qZlnbpNizLgjSg5FNi8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9dac766c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 10 Sep 2024 00:37:47 +0000 (UTC)
Date: Tue, 10 Sep 2024 02:37:38 +0200
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [PATCH RESEND v2 00/19] random: Resolve circular include
 dependency and include <linux/percpu.h>
Message-ID: <Zt-U0opo2EW8LSRJ@zx2c4.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <Zt8a6_RwLG2pEnZ6@zx2c4.com>
 <CAFULd4ak3n1x0tGrqiNoxvDBRw6AWgchfBO_k4aKps34DomPvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFULd4ak3n1x0tGrqiNoxvDBRw6AWgchfBO_k4aKps34DomPvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_173759_838466_845EB491 
X-CRM114-Status: GOOD (  21.59  )
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

On Mon, Sep 09, 2024 at 09:30:06PM +0200, Uros Bizjak wrote:
> Besides GCC, clang can define various named address space via
> address_space attribute:
> 
> --cut here--
> #define __as(N) __attribute__((address_space(N)))
> 
> void *foo(void __as(1) *x) { return x; }         // error
> 
> void *bar(void __as(1) *x) { return (void *)x; } // fine
> --cut here--
> 
> When compiling this, the compiler returns:
> 
> clang-as.c:3:37: error: returning '__as(1) void *' from a function
> with result type 'void *' changes address space of pointer

Super cool. Looking forward to having it all wired up and the bugs we'll
find with it. 

> I think that the best approach is to target this patchset for linux
> 6.13 via random.git tree. I will prepare a v3 after 6.12rc1, so when
> committed to random.git, the patchset will be able to spend some time
> in linux-next. This way, there will be plenty of time for CI robots to
> do additional checks also for some less popular targets (although
> individual patches are dead simple, removing these kinds of "legacy"
> includes can be tricky), and I will also be able to collect Acked-by:s
> in the meantime.
> 
> While the patchset is an improvement by itself, its inclusion is not
> time sensitive. The follow up percpu named address checking
> functionality requires a very recent feature (__typeof_unqual__
> keyword), which is only supported in recent compilers (gcc-14 and
> clang-20). Besides compiler support, sparse doesn't know about
> __typeof_unqual__, resulting in broken type tracing and hundreds of
> sparse errors with C=1 due to unknown keyword.
> 
> So, I think we are not in a hurry and can take the slow and safe path.

Okay, sure, that sounds good to me. I'll keep my eyes open for v3
in a few weeks then.

Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
