Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602FBECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bl6Kqmy3SbYAbbjddiKnf92niN6Bev7Y6SJR4ofhSnc=; b=bVc1t/aewwyUgy
	PSeQZektmoEeAMhe532CkESofpeyXFjolOtVgDA6ctNsoPzFy8Co0AE8uAUKshDrX6U863h4IDCDM
	UD0ag8vzP9ZeKVmVIPOz9xdtxci7KTfKw8dOJJ3jCIR7oJ8gMot/Ic5u0OCFe2cV7JUJBJihm3d75
	6GnxCc960fky5UzL31I+0PQ4uxJ95fr6VfPCd6CrJByasLJ8D/72qniivfNBqit16TOfsijqbCPBW
	cGBnsas2vElS4rmh1FD3cDCeiMDyCAI7R874k9OwU64/98Ro6LOCiHwZXdeo0gaKfWE41nJ1eVmRE
	AS1RCn3GzoM3aeMAI/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGX-00000000vzh-08Tu;
	Mon, 09 Sep 2024 07:56:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGS-00000000vxd-3mk4
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:56:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso14486545e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868607; x=1726473407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4NS6jV5fKGk/mwoZluVrj+7uJlJEVUPyFdbxV7oRHQ=;
        b=WUtSBdgRLsm5pk759dZDwaPSxR0EayqwcfQcfbp6LNn1bSIiBhoUEwGmdQ/RDAWKAz
         HSh4ddJvsbZuYIQqHL71wo1X7Ce6Xr/DpgOeIQRt0gOhsDPjWqxC4947wopn/84tTXb0
         nAB08Lbv9/EgQHf5z0nRnvpL5NWpVBwJ79DGwa4msPB5EvfjDSujrrzO83yySHcIbLIw
         c1szKyS/5TqbtfdWux7zSOdAKcmfIQtWxWnSRFjpp/n+bBqEbG4XL+iIQKwlbiU8+NPq
         zB3+O/5pffxPKlWrJblT+hn9qxI3P1nhrKVuMN4VWT+Tq10cLx3V9XvaqMrJpy32MAZq
         XK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868607; x=1726473407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4NS6jV5fKGk/mwoZluVrj+7uJlJEVUPyFdbxV7oRHQ=;
        b=SugxxoBKocaOqcdCbxVlk+ID1E+vnYn1Uf7XlJEyYZlIz4K8MJSlOzL8aGTTH0ntky
         +6cvxB2rsnm9YxsttvPT77KZcrifckvNyGkTo92Hwajj6QBnPvmG+7VZcqLdPAfRi9Ul
         pMCI4lPme6FTSgfWVfXuG3Z3d09mKOSOGaMc4NXL3ddMY0erN+XDokHXkH1WH6gKyVe1
         oLcrwPwgpDMt6Wu4/8zP9ErX5ZcUNfXc7zOrIOXg2lkmyRHbUoK/nquCC91VxR3s6ly7
         1s5FWw3WXZ3YXmlprLGTJQEFfDwGxM1qjzEL2glYpG+KYb3KWQ95CskyGPaNoMFy9gej
         FbOw==
X-Forwarded-Encrypted: i=1; AJvYcCXrUuNnSxFWk373+KR0CWL6DpAIFgL4LfursxaXg8cJIJl05pdAEoY3a6v0cjW2bJt+ARi1tImedio=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHIeGdb/jtLrJjhzG5DZmI/N+q5Lez09xuIsUDWj+E1gDQUmSH
	oqv6jfLn3AaNu5m0G7HbWJJZzeY6qMdSfcmHFPT1nhA4Aea0e7Lv
X-Google-Smtp-Source: AGHT+IEA5yak33SFTx+YZRupolj5vmzjBVIUunnRVoxkecwVhW5D0ABKP0ZK9jxMzGmcV67/WpIyKA==
X-Received: by 2002:a05:600c:310a:b0:42c:8812:82a6 with SMTP id 5b1f17b1804b1-42c9f98a81cmr79250105e9.21.1725868606867;
        Mon, 09 Sep 2024 00:56:46 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:46 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
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
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH RESEND v2 00/19] random: Resolve circular include dependency and include <linux/percpu.h> 
Date: Mon,  9 Sep 2024 09:53:43 +0200
Message-ID: <20240909075641.258968-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005648_969994_5B6759B1 
X-CRM114-Status: GOOD (  23.63  )
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

Resent due to missing linux-kernel@ mailing list inclusion.

There were several attempts to resolve circular include dependency
after the addition of percpu.h: 1c9df907da83 ("random: fix circular
include dependency on arm64 after addition of percpu.h"), c0842fbc1b18
("random32: move the pseudo-random 32-bit definitions to prandom.h") and
finally d9f29deb7fe8 ("prandom: Remove unused include") that completely
removes the inclusion of <linux/percpu.h>.

Due to legacy reasons, <linux/random.h> includes <linux/prandom.h>, but
with the commit entry remark:

--quote--
A further cleanup step would be to remove this from <linux/random.h>
entirely, and make people who use the prandom infrastructure include
just the new header file.  That's a bit of a churn patch, but grepping
for "prandom_" and "next_pseudo_random32" "struct rnd_state" should
catch most users.

But it turns out that that nice cleanup step is fairly painful, because
a _lot_ of code currently seems to depend on the implicit include of
<linux/random.h>, which can currently come in a lot of ways, including
such fairly core headfers as <linux/net.h>.

So the "nice cleanup" part may or may never happen.
--/quote--

We would like to include <linux/percpu.h> in <linux/prandom.h>.
In [1] we would like to repurpose __percpu tag as a named address space
qualifier, where __percpu macro uses defines from <linux/percpu.h>.

The major roadblock to inclusion of <linux/percpu.h> is the above
mentioned legacy inclusion of <linux/prandom.h> in <linux/random.h> that
causes circular include dependency that prevents <linux/percpu.h>
inclusion.

This patch series is the "nice cleanup" part that:

a) Substitutes the inclusion of <linux/random.h> with the
inclusion of <linux/prandom.h> where needed (patches 1 - 17).

b) Removes legacy inclusion of <linux/prandom.h> from
<linux/random.h> (patch 18).

c) Includes <linux/percpu.h> in <linux/prandom.h> (patch 19).

The whole series was tested by compiling the kernel for x86_64 allconfig
and some popular architectures, namely arm64 defconfig, powerpc defconfig
and loongarch defconfig.

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>
Cc: Rae Moar <rmoar@google.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
v2: - Reword commit messages to mention the removal of legacy inclusion
    of <linux/prandom.h> from <linux/random.h>
    - Add missing substitution in crypto/testmgr.c
    (reported by kernel test robot)
    - Add Acked-by:.

Uros Bizjak (19):
  x86/kaslr: Include <linux/prandom.h> instead of <linux/random.h>
  crypto: testmgr: Include <linux/prandom.h> instead of <linux/random.h>
  drm/i915/selftests: Include <linux/prandom.h> instead of
    <linux/random.h>
  drm/lib: Include <linux/prandom.h> instead of <linux/random.h>
  media: vivid: Include <linux/prandom.h> in vivid-vid-cap.c
  mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
  fscrypt: Include <linux/once.h> in fs/crypto/keyring.c
  scsi: libfcoe: Include <linux/prandom.h> instead of <linux/random.h>
  bpf: Include <linux/prandom.h> instead of <linux/random.h>
  lib/interval_tree_test.c: Include <linux/prandom.h> instead of
    <linux/random.h>
  kunit: string-stream-test: Include <linux/prandom.h> instead of
    <linux/random.h>
  random32: Include <linux/prandom.h> instead of <linux/random.h>
  lib/rbtree-test: Include <linux/prandom.h> instead of <linux/random.h>
  bpf/tests: Include <linux/prandom.h> instead of <linux/random.h>
  lib/test_parman: Include <linux/prandom.h> instead of <linux/random.h>
  lib/test_scanf: Include <linux/prandom.h> instead of <linux/random.h>
  netem: Include <linux/prandom.h> in sch_netem.c
  random: Do not include <linux/prandom.h> in <linux/random.h>
  prandom: Include <linux/percpu.h> in <linux/prandom.h>

 arch/x86/mm/kaslr.c                              | 2 +-
 crypto/testmgr.c                                 | 2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c        | 2 +-
 drivers/gpu/drm/i915/selftests/i915_random.h     | 2 +-
 drivers/gpu/drm/i915/selftests/scatterlist.c     | 2 +-
 drivers/gpu/drm/lib/drm_random.h                 | 2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 1 +
 drivers/mtd/tests/oobtest.c                      | 2 +-
 drivers/mtd/tests/pagetest.c                     | 2 +-
 drivers/mtd/tests/subpagetest.c                  | 2 +-
 fs/crypto/keyring.c                              | 1 +
 include/linux/prandom.h                          | 1 +
 include/linux/random.h                           | 7 -------
 include/scsi/libfcoe.h                           | 2 +-
 kernel/bpf/core.c                                | 2 +-
 lib/interval_tree_test.c                         | 2 +-
 lib/kunit/string-stream-test.c                   | 1 +
 lib/random32.c                                   | 2 +-
 lib/rbtree_test.c                                | 2 +-
 lib/test_bpf.c                                   | 2 +-
 lib/test_parman.c                                | 2 +-
 lib/test_scanf.c                                 | 2 +-
 net/sched/sch_netem.c                            | 1 +
 23 files changed, 22 insertions(+), 24 deletions(-)

-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
