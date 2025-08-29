Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796B3CA0FF9
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhD/tpYTY/W4G9UHduwzVWY0WRU7G2/tYVDihHfB7+s=; b=I3L3Ua4TFvtDue
	jeG4HTQidG6tGv+pmzUhUfgdVk4W9kjiyTdVlOOHCo2bp2Tjc6z5Ro84oFspD4IWF2LTfw33gvzP5
	qZ8YEFezwZ6KS2F7y3a5fka8gdMxYW3nFFrk/kLvGyoc6mOgz5vzU9LgzR7fWTceJQf5AN6a/1MJ8
	jG8or+c6TCXheazQ6M/nK51CZFnaqFdcY4E4zSskzPSpNA8KvcN2e6XqD7g2aNvpQD6jfMhU7vlPd
	BhmM1NfQqpdjop2AUEfMkYw9uX3Wj2HqmCQQsGdPfjlyD1VoVkQ8ry1ZWBfsGwBtC/0XrxC90bpNh
	6TdM2CFygulSQN6eUhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1GW-00000006Fpi-3KPs;
	Fri, 29 Aug 2025 15:43:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ury4F-00000005cfy-2mKQ
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756469936; x=1788005936;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lmOaDJrWsALHNdIkFkPEn+1/tHhvy8ASz+0CpcTOxMQ=;
  b=CfLeWtqIc9lVozG409nM70Dz/hRLKSwGya7Jd1HDm9iYwmvthIl/aZHx
   9yMUrh2o6+y8GytgKNaUu/VTgfjY/BNjJiK92wsUd0fqlaKWbi5WHi897
   bwCe6HwQ/vW09Cwf4r/c7e0PDYnQ/K9jXkIU/8CG+ouDc/T3usPKv9ckW
   wHlV9U41CCGpMyFsDv7nINpR9u+bDkAmSpOgSP65acEFiXonDC8bS7TJT
   di/eDUsYEjs83dW16L+MKTSasmJ9zAzm/3l4w/1ByLUBjK/tT1yRKQGaO
   OPLFak9A8mSOastFEepkQGShCDyI5jl4pYsaWreBkzyy8q8P6EZbBqCc8
   g==;
X-CSE-ConnectionGUID: iktCQJkORVeMZpNPYVxYxw==
X-CSE-MsgGUID: biXB64hgSIagm/lJgH1ZlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58603811"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58603811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 05:18:51 -0700
X-CSE-ConnectionGUID: FceyOGKfTMK8J/ArNXLz6w==
X-CSE-MsgGUID: nahg4MG6QSGDgmwgF/j0Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170753940"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.58])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 05:18:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux DAMON <damon@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>, Linux Power Management
 <linux-pm@vger.kernel.org>, Linux Block Devices
 <linux-block@vger.kernel.org>, Linux BPF <bpf@vger.kernel.org>, Linux
 Kernel Workflows <workflows@vger.kernel.org>, Linux KASAN
 <kasan-dev@googlegroups.com>, Linux Devicetree
 <devicetree@vger.kernel.org>, Linux fsverity <fsverity@lists.linux.dev>,
 Linux MTD <linux-mtd@lists.infradead.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, Linux Kernel Build System
 <linux-lbuild@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy"
 <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu,
 Richard Weinberger <richard@nod.at>, Zhihao Cheng
 <chengzhihao1@huawei.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long
 <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David
 Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Andrew
 Lunn <andrew@lunn.ch>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Alexandru Ciobotaru <alcioa@amazon.com>, The AWS Nitro
 Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, Jesper Dangaard
 Brouer <hawk@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Steve French
 <stfrench@microsoft.com>, Meetakshi Setiya <msetiya@microsoft.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Masahiro Yamada
 <masahiroy@kernel.org>
Subject: Re: [PATCH 00/14] Internalize www.kernel.org/doc cross-reference
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250829075524.45635-1-bagasdotme@gmail.com>
Date: Fri, 29 Aug 2025 15:18:20 +0300
Message-ID: <437912a24e94673c2355a2b7b50c3c4b6f68fcc6@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_051855_768925_2EC88C85 
X-CRM114-Status: GOOD (  11.38  )
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

On Fri, 29 Aug 2025, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> Cross-references to other docs (so-called internal links) are typically
> done following Documentation/doc-guide/sphinx.rst: either simply
> write the target docs (preferred) or use :doc: or :ref: reST directives
> (for use-cases like having anchor text or cross-referencing sections).
> In some places, however, links to https://www.kernel.org/doc
> are used instead (outgoing, external links), owing inconsistency as
> these requires Internet connection only to see docs that otherwise
> can be accessed locally (after building with ``make htmldocs``).
>
> Convert such external links to internal links. Note that this does not
> cover docs.kernel.org links nor touching Documentation/tools (as
> docs containing external links are in manpages).

FWIW, I'd much prefer using :ref: on rst anchors (that automatically
pick the link text from the target heading) instead of manually adding
link texts and file references.

i.e.

.. _some_target:

Heading After Some Target
=========================

See :ref:`some_target`.

Will generate "See Heading After Some Target".


BR,
Jani.


-- 
Jani Nikula, Intel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
