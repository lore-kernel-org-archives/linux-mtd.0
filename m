Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D673CAC591
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8MCqmnxs7+RPvYySLJNUy1+EHoXsKrRi8pGFzj6hwk=; b=CJ2FeslD/yn2Ao
	FSsr5dJ9zLGqBPC/UkNaQJcHfDlH+tOMao2emnhDWRY7djxKpjei2N4qIvF6BAYWj5wl2wMIn3GZr
	d/4x+rcKidLHhRpykLIkK7rZnQznyOnWZttmKKD2Ec8z+EQe1vn7QAQsOwXHtvwNVFX97njg+GGa6
	3oLy0kyZWKDYj8knji3zrHnEVSnv9F8Hikq6b/2pBzen5Od/QQ+9+hkkGXrnSM6camfMPkYkMXXAI
	Om2H+8K6F9/9awGOeaN64QYMid4ZAf7zkzUeW92s1USZhTcqWsfYuoKTDlYPoLp18HAyFMk5dIo6I
	kWLn+FbShXStvCiODmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoW-0000000BhlR-047g;
	Wed, 10 Sep 2025 02:44:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoS-0000000Bhh9-3nns
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:44:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so5200833b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472240; x=1758077040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exY9byyl4etH+4IQEKnm6qXO5lYPceGxvCuurSN7fh0=;
        b=FG/IZzAtjO/Qf8/eoK7K/n74Yw7N1nncWgIQtvGu26yfUGQWYWX4d4+Q/x66pqOfH0
         +ag3v86P5OukQ9Lxg2rTeOkVW+KaXH75kJ5BN8EHxANG4cuVQwAraHWU67IpgWeZ7CJ8
         eCGP3fyrq3IjSK1sbuXZZSHi4kBRKHxtidW0Lgv9NV8VuN8x9b1h45RhWX0brGBLrC2A
         HcnBlc5V7X2tv+ICg9GpBJES0x4YU2S2HTSFX1nK37NeeoFizVbV7Mugm816x5FSolWm
         ZiddzINl3X7/7fd/Iv8mq2fhEtSjCt9JT7N8XyNYmxHl9fFpf+GEAu0AjGOePIqMDnqo
         mJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472240; x=1758077040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exY9byyl4etH+4IQEKnm6qXO5lYPceGxvCuurSN7fh0=;
        b=Cndwjxy3YfTb/5sbpG81SSQgapLe+RU7DXKFVGALYsc22rUZmlm4bYYbwH3Mm8NzL7
         YYR5hgnJKpt2beca/BhZ0fX9LxDQalw+211EVkYHnMVwKwQspYnG9OXDM2JLa0ecUjB2
         ub+lYYyQRhfVOUjJg0Gfm/1HvvrFQhYsy4MMcmD8izTbQDNj5jRD3bFUrwzf3ALxo7SY
         UhHkgGhZUM1yvukF48LAbiFdVtsVIP/zVGBVVjBG9o3rWJNxKCVEezVfy/sQumC9t/Gg
         v7i7k1yspVcrHxNzNRCv5fM8J+//0QREPUt1Wqt9GC1QMh1NKKQ6+7os6m9/jSbqn9d4
         vmKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbsclb0m/bJ8p1GBv/aGtehNA1GqPUtuh8aS8mQE3u5rHRCAEOzv/nsiXtrLHLlLTtAOwGqqY3KRY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRaSv7Lvg7HqPu3h4UOFYo8iHrr32fACC/8hKA0+LLy1ZOCAsx
	KmxCzVDFLgAZSwe6SD6BH2VepLELMpjxZhK0+9deKfBfIDglA48pjIOw
X-Gm-Gg: ASbGnctEzjil2EPWuQ08WInI1FCcgIBnHvZJIAnTS6u3Gvg1Vhepgl0dtN+Vw9v1mV3
	hg0aAEahhyW5jRmQ+75VWB9zRj88qpZwGiYvQw07ouh90m2R36D3R/HBn03krK2cDx4vfGZshza
	5ye+69Fkxr8OhaMpba+pcoMcrkyzcsLIJ1p+AmjTn3VRJ3i/4bonucTz5r8XNH9ZkSBClgj91D6
	K3iViyngZdkYPPEwArR9+iB5pmdXfDV0SF+nl0OlqMt6zHZd++lFhoP8m2zJ8cZgcM/VLmuSeeP
	ijw/7FT0wGlENOhwtM6OTjwNePucBfAqoFR7rSNb+KiXOpEg/xRHuCm+oz2PZzYuZWtq6iH58h1
	xWY5cheDNVz6Non3fLr3KabU7KyRz04GzgaOrhByFWTbspn0=
X-Google-Smtp-Source: AGHT+IF4N06fuW1A2YnqT9YeYfBmdnDVAaiP1zDRDWLaUsyjpra5p/f/1OQFfNYpt7LKVATNwvRwQw==
X-Received: by 2002:a05:6a21:33a6:b0:252:fbd4:630c with SMTP id adf61e73a8af0-253466f83c8mr21797369637.52.1757472239935;
        Tue, 09 Sep 2025 19:43:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a602e14sm1057772a12.21.2025.09.09.19.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:43:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 614CF41F3D7B; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DAMON <damon@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux Block Devices <linux-block@vger.kernel.org>,
	Linux BPF <bpf@vger.kernel.org>,
	Linux Kernel Workflows <workflows@vger.kernel.org>,
	Linux KASAN <kasan-dev@googlegroups.com>,
	Linux Devicetree <devicetree@vger.kernel.org>,
	Linux fsverity <fsverity@lists.linux.dev>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux Sound <linux-sound@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Huang Rui <ray.huang@amd.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	tytso@mit.edu,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandru Ciobotaru <alcioa@amazon.com>,
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ranganath V N <vnranganath.20@gmail.com>,
	Steve French <stfrench@microsoft.com>,
	Meetakshi Setiya <msetiya@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 05/13] Documentation: blk-mq: Convert block layer docs external links
Date: Wed, 10 Sep 2025 09:43:20 +0700
Message-ID: <20250910024328.17911-6-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751; i=bagasdotme@gmail.com; h=from:subject; bh=7QXrNRuCbHeHgCYdGUN3dSXlo+bJ6ZwXyeTt5Kf+8Ys=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnijp3TFftH6q+kyOiIzsCLYVR/ZOd/GUnnS+Yu6/k 6t6/fl6OkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRydwM/yu/ZhfqF9YvP7NL t0p2f917xpei8yqP3w+TKtx3xMg27gbDX5mQVefmZ+9qe6G15Ils7rRL855MXJGSeHOCjN6Gx61 PyrkA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_194400_951731_2510C479 
X-CRM114-Status: GOOD (  19.77  )
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

Convert external links to block layer docs to use internal linking.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/block/blk-mq.rst | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/Documentation/block/blk-mq.rst b/Documentation/block/blk-mq.rst
index fc06761b6ea906..4d511feda39cfd 100644
--- a/Documentation/block/blk-mq.rst
+++ b/Documentation/block/blk-mq.rst
@@ -87,17 +87,16 @@ IO Schedulers
 There are several schedulers implemented by the block layer, each one following
 a heuristic to improve the IO performance. They are "pluggable" (as in plug
 and play), in the sense of they can be selected at run time using sysfs. You
-can read more about Linux's IO schedulers `here
-<https://www.kernel.org/doc/html/latest/block/index.html>`_. The scheduling
-happens only between requests in the same queue, so it is not possible to merge
-requests from different queues, otherwise there would be cache trashing and a
-need to have a lock for each queue. After the scheduling, the requests are
-eligible to be sent to the hardware. One of the possible schedulers to be
-selected is the NONE scheduler, the most straightforward one. It will just
-place requests on whatever software queue the process is running on, without
-any reordering. When the device starts processing requests in the hardware
-queue (a.k.a. run the hardware queue), the software queues mapped to that
-hardware queue will be drained in sequence according to their mapping.
+can read more about Linux's IO schedulers at Documentation/block/index.rst.
+The scheduling happens only between requests in the same queue, so it is not
+possible to merge requests from different queues, otherwise there would be
+cache trashing and a need to have a lock for each queue. After the scheduling,
+the requests are eligible to be sent to the hardware. One of the possible
+schedulers to be selected is the NONE scheduler, the most straightforward one.
+It will just place requests on whatever software queue the process is running
+on, without any reordering. When the device starts processing requests in the
+hardware queue (a.k.a. run the hardware queue), the software queues mapped to
+that hardware queue will be drained in sequence according to their mapping.
 
 Hardware dispatch queues
 ~~~~~~~~~~~~~~~~~~~~~~~~
@@ -143,7 +142,7 @@ Further reading
 
 - `NOOP scheduler <https://en.wikipedia.org/wiki/Noop_scheduler>`_
 
-- `Null block device driver <https://www.kernel.org/doc/html/latest/block/null_blk.html>`_
+- Documentation/block/null_blk.rst
 
 Source code documentation
 =========================
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
