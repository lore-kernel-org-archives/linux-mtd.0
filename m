Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB35CA0FF9
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1E/4q3dsVfurOUgeHPH/HfcHn62anWWP/eR/FapARFI=; b=hu6hk9QxyPM5A8
	1Qmcu9jQ8Bx7S0T+AyM9NlRgUcM/HEXhxGYnWdmF/vdsoAA2sZ+oaf7ETXaF4ILlXuxrFalEXm1rX
	my2Y0/hCRlHZD0eNqdPlVME2FJHXU4JworsbgP86rIbBeH/sKEJ3AUy0BY1541iIEo4e4POZZAj6Y
	2JU+cm00dg1FAEwfS9k43h+39djwyaV7vXXYkK6oyqJQpP87nx3rq3Vtet369cd6IOcP4yv1WYrZT
	2XfX80M1w7FGsOwXkJtlrcSNU6qPlGmEHCsSA1vDbVdKpAMd81Lc2TLedA3nBe8FdJJ1oFXMFJC0z
	0dAS7BvDx4csK6tlzcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruMm-00000004woN-3dg3;
	Fri, 29 Aug 2025 08:21:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtxP-00000004qGf-2kJr
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 07:55:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2445806df50so14999395ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2025 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756454135; x=1757058935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkZ2LL+fO6oH27E7YsqUKpWK9h0JvMFOl/W1FWHyGxk=;
        b=W/Q6aypW9r17rCcF2AnkaxldELu+652caUb1pfge3uFgrbFA+nLShrOesDI0YaIS0f
         Za8U7Ekp5fmlvmcN0NZ6XvHR1qqySuVF+HfgoW3WY/FABQwHle6emU1Fjz+JunXTpcoc
         8siQ0rmQimU/apoz7mZxPixDFKqz90y/seMRxohd133u9zh7uOfWlmMkjYYpg+F0s7VO
         PT1WnAHfy+K1Yp0ZIhqLl1RDQBMchnspOJZEMRgUQBy1kgBPpTQ0K3sJA/zacCx8ce5t
         qPr+XstCK0WXQSbp9lSj8R3cfE72V2+nyOmFLe9357HEMUsmy+WImVTy3odE++J2+k7R
         ujJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454135; x=1757058935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkZ2LL+fO6oH27E7YsqUKpWK9h0JvMFOl/W1FWHyGxk=;
        b=HnZ0HQjj/nGs5raFVyo4vYzAKJNZtSiFqQ9nPBhn5VuTCCTiZ/aFmfibxw6gb5C4Hg
         HxyJknI24qVFWFbmKGAUHqMkL01NnJ5nyv0cStFc5+adgZNFUhp8w/DaQ/5hg68Y55hP
         XaXvgJosyxbcrYkWWefmRmzb+IxL+ocJ9EoPGfWSwGT1N+mlTIWu+hiQCW+xrW8vRwRV
         6h01RuMSIdXI8vs0itBjUpOdzX5V7YVM7HzQtkk2MOGr4JIP2QR5UBJ2BImcRTLGqtAd
         hdzr2oVzri961S8zNcht2ORdH3RA6HL3jkqVMrIBmaXrR5/M+iQbfAp1IxILrC/Py0Fv
         u9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWp2RuqhywRPeUuGh5GGvRh6/JRv+CzgOjqjeg2K+1w7lgSyIBdzgFCAPGc9UQCCGbNQNiWSqhoUQY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9eLQkQwfOU7z45vUU36/YeJFGpTbVthuFprV3xd1248CmZQHp
	NxidXvkP+7eKyg08x5LUoRUt6j7AKWQmJEGdvVWYAhChv94XVLa7jWxi
X-Gm-Gg: ASbGnct6Mttqs87+6VzuRka9Fa0Ti/5HMPRozOzrNA6dikeY30pJ6FHYcbtOsML9frY
	WZwesr5BN2CX8PZ7pBNyNGaT/taO8blW52dfYZtV6s/xbnGteaaqabYUgOn6FSh6Qv7o2GVjptf
	3/DrnUhR2DzzwC17JYAc1FqkRENSDbUhEVTZa+F3U8TY6doYl2iuBTzqCoGwoJ2n6XFgw0jkvgY
	NTCCOlLEWdBoi7CbzahY5CV3q8t4XoEBHtuuI6rId5XsG++TGk4OD9s3PWzlt2pDnCILSsOVv7G
	EilRypGUq2b9OK524pDbviTZyX/70Nx6Ui3HAr2BzMGPEi1/HiqlNA/BRnObjQuT+tiBuvdX0Nq
	hx5k0LOotalyrd8T/mwdH2uEeRGZpEjh1RNHu
X-Google-Smtp-Source: AGHT+IHJ0etjvptegteXgkUWoFIILA9nIajrzCKr99WRD5OzNxzSggv2jyDezns1lof2dGSUjRUcTQ==
X-Received: by 2002:a17:903:4b07:b0:249:2297:c424 with SMTP id d9443c01a7336-2492297c777mr3315565ad.15.1756454134776;
        Fri, 29 Aug 2025 00:55:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903724ec8sm16944365ad.41.2025.08.29.00.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:55:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id EF6DE4444CA3; Fri, 29 Aug 2025 14:55:27 +0700 (WIB)
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
	Linux Kernel Build System <linux-lbuild@vger.kernel.org>,
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
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexandru Ciobotaru <alcioa@amazon.com>,
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Steve French <stfrench@microsoft.com>,
	Meetakshi Setiya <msetiya@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/14] Documentation: damon: reclaim: Convert "Free Page Reporting" citation link
Date: Fri, 29 Aug 2025 14:55:12 +0700
Message-ID: <20250829075524.45635-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=839; i=bagasdotme@gmail.com; h=from:subject; bh=br/gH56HVzhrfYYqrTP3c/xceN5BBvTsvI3pBYQ/yVo=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY14UOzeckV2lWTlnxluBwiWvpt1jF+xvT61/ejpwa tSzw60XO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjAR0x5GhlnvrvsFdd3e6TjZ g2FTa8uK3U48C+++2yu+oPH13XO8khKMDP0RbvPq2Hk2WQbMuFkV7P77fsRatst+E/e4qhe89eI LYAcA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_005535_686558_02C43E9F 
X-CRM114-Status: GOOD (  15.64  )
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

Use internal cross-reference for the citation link to Free Page
Reporting docs.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/mm/damon/reclaim.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index af05ae6170184f..92bb7cf1b5587a 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -298,4 +298,4 @@ granularity reclamation. ::
 
 .. [1] https://research.google/pubs/pub48551/
 .. [2] https://lwn.net/Articles/787611/
-.. [3] https://www.kernel.org/doc/html/latest/mm/free_page_reporting.html
+.. [3] Documentation/mm/free_page_reporting.rst
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
