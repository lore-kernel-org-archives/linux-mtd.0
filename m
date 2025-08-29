Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADE0CA0FF7
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9saP85gNt88nd+HBFFFYUb4Ia+ldpnWmf9UA0rc524Q=; b=tvQ1qPCQBrV3Af
	NLsCf4Fs+eU6BxJsdRTm5VXKazWfXhbfgxeyUisFdf+Cido5qlTWv+vJhF/l6HCCFUY0tFI8+0c5+
	PmUGI1T8/bwMR+7I6/a3Gt9P2uhvoAtWzSk9+GOOqlTd1/mxpOWGhJIugBBLaGw4HI5Jm9CquQtnq
	g782/gbW550tg+KEmUY10bfIQp2XaTJ2AxPQgz3whviNUBNRKlYfExSmhSHkGaQR8PxkFejcQ0iTk
	tKEPoIxu5T5kOHrhEIWFoPOksI3z58mVPlLYBBq4vwb/hjKMM0tFGsA3ref3t9pQdpCOvoFxTXNtg
	OMzf1Q0HBBM0W8PIdTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruMl-00000004wnY-3LL4;
	Fri, 29 Aug 2025 08:21:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtxO-00000004qFq-3EIF
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 07:55:36 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-244580523a0so18916785ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2025 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756454134; x=1757058934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1dzl/9HN9fCmWWoku2EUAe+4oZJtgdEcU9UZmXN/7A=;
        b=RZLnLfPB4DejByxQZZygayvoJw7xn+8+FdriBgD+ORs0TK1BRi5fbMhizTHSCyw3Mn
         HWhYPLFdA9306xWpx89AAkYapiTu5yxnr1zW9Epw+qjVikzv45wdbP6BCRjHrp5MNp65
         T+3qSGPOWOT7tgXp98Kv5MwYUbULk2HkeDcnYedDSCuOd180aUT8bCrFGMfPel8CR1Ym
         phXJe6QRwMss20H6wIc+9s3L2KUC4X05ipsUiEzixd9WqQviSLQ1f3TRYrH4OagwgzwO
         z9koOFMJbitl2SR6yZQUzrV/gdySkQwKBUHpfvf0D76zbnWNQCG7mfVnttjf5USvytOC
         N7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454134; x=1757058934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1dzl/9HN9fCmWWoku2EUAe+4oZJtgdEcU9UZmXN/7A=;
        b=MFm302J0PZWSV9k7zBhUpLzVxMTxVPhfK3wYmVGDbAOofsbXyLTmINu5+qRW7ANqez
         g1aVzuKb1SccFgK+3uHdYveXlhhmFdVm4G3+uNxILZGg80SqwD13S28DDy5P8VnIQMnv
         GAMxl9/IkuWTPKn1ofJgWGjZz7TFjcFOFWCO6Lkoik9mriO3ww/WzxkDWmwatRwtfxPV
         pTnGBOUwtuZE1jVXT7Nx9615Z11Tm0jCmlI2L5VFGX68tXnu9o726i0vMTP8IbSIMGwO
         /C/9HyR/mKSf26EwBUiD6Qxb6TSXPiCZyHyyrXMLFRR0h8hk0OilW1uAujY043N2S5wp
         g+0w==
X-Forwarded-Encrypted: i=1; AJvYcCXiIk8yv5lEXjfF6wnZyNG/NoRObUOMx7YzWicEPlVLC9a/oeKiuIe1GC5zuYzIZo8FMpIRlf/eZaI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ0ETt5BgxOpdqnqUbuIGWRM2yhUbb/5fxTLFn/DuD8qPMZpHJ
	YzLkyWPNKtjzISzi35++M7aeW3oJv73sBkVnSW4YT8WNaM3aOCjZa8mV
X-Gm-Gg: ASbGnctTefPodZBja8nKkEmIuSl5U+I+DDuh49R4q3miexsqN2JsPZWUlvlY42mfIH6
	R92/fk0u5jwbe58SzV7KquUotDkRyBtoJRV5eniDJB02E0TGun3GA3xvXX3QhdlryqD513ykNQW
	GnYlfhuMCDBiVlD5r8E2+tMO+QKHnQszrZZ51TpGrDRQHg4l4t0BpGJJNJlVDWLHV3tm/xl5Wh9
	onk86YX+gfZ8u5BxU7ghp2oY2oREXYu2XFU19eqMR4oxoBPyRgSP6zQGCIAo79t7/KxQieJjnVD
	SViFJeiecTog3DqFt/AEn05VRrr5zI+JCbDoWFF2gTqfDwEhYVad+jP/9yLJhcIbbscZX3OLGW/
	nJw/ZxofYwcBV5Pzt2X99xtYg/GTtZIC+TUVL
X-Google-Smtp-Source: AGHT+IHHspv4kBSvuOju+syLfWNvxBR1WSkz7mrwJNK9paKzC+4NcNK8VdwZC8CcLSepusoSJLIitw==
X-Received: by 2002:a17:903:15ce:b0:246:c7dd:8da7 with SMTP id d9443c01a7336-246c7dd91f6mr219457635ad.32.1756454133503;
        Fri, 29 Aug 2025 00:55:33 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037043b3sm17009045ad.22.2025.08.29.00.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:55:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 92CC9411BF96; Fri, 29 Aug 2025 14:55:27 +0700 (WIB)
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
Subject: [PATCH 00/14] Internalize www.kernel.org/doc cross-reference
Date: Fri, 29 Aug 2025 14:55:10 +0700
Message-ID: <20250829075524.45635-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498; i=bagasdotme@gmail.com; h=from:subject; bh=UJUK8/oCaP8or4xMM6dYj2gtHalMI9xq0zTRRM+Er48=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY17c4br6T35GuJHFF8Yt24416R5lZZr0d5nIjOkLd Wbtjd2k0FHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJxIow/NNvVZZWvf59gvln 8f09a96zlV1ddP/qfkeet3OelO1bF7GW4X+WSslpN8ZtovrZdcGNj+0m353MlHX12bkXf15P2h5 ctoADAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_005534_812117_5909DB3B 
X-CRM114-Status: GOOD (  15.17  )
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

Cross-references to other docs (so-called internal links) are typically
done following Documentation/doc-guide/sphinx.rst: either simply
write the target docs (preferred) or use :doc: or :ref: reST directives
(for use-cases like having anchor text or cross-referencing sections).
In some places, however, links to https://www.kernel.org/doc
are used instead (outgoing, external links), owing inconsistency as
these requires Internet connection only to see docs that otherwise
can be accessed locally (after building with ``make htmldocs``).

Convert such external links to internal links. Note that this does not
cover docs.kernel.org links nor touching Documentation/tools (as
docs containing external links are in manpages).

This series is based on docs-next tree.

Bagas Sanjaya (14):
  Documentation: hw-vuln: l1tf: Convert kernel docs external links
  Documentation: damon: reclaim: Convert "Free Page Reporting" citation
    link
  Documentation: perf-security: Convert security credentials
    bibliography link
  Documentation: amd-pstate: Use internal link to kselftest
  Documentation: blk-mq: Convert block layer docs external links
  Documentation: bpf: Convert external kernel docs link
  Documentation: kasan: Use internal link to kunit
  Documentation: gpu: Use internal link to kunit
  Documentation: filesystems: Fix stale reference to device-mapper docs
  Documentation: smb: smbdirect: Convert KSMBD docs link
  Documentation: net: Convert external kernel networking docs
  ASoC: doc: Internally link to Writing an ALSA Driver docs
  nitro_enclaves: Use internal cross-reference for kernel docs links
  Documentation: checkpatch: Convert kernel docs references

 Documentation/admin-guide/hw-vuln/l1tf.rst    |   9 +-
 .../admin-guide/mm/damon/reclaim.rst          |   2 +-
 Documentation/admin-guide/perf-security.rst   |   2 +-
 Documentation/admin-guide/pm/amd-pstate.rst   |   3 +-
 Documentation/block/blk-mq.rst                |  23 ++--
 Documentation/bpf/bpf_iterators.rst           |   3 +-
 Documentation/bpf/map_xskmap.rst              |   5 +-
 Documentation/dev-tools/checkpatch.rst        | 121 ++++++++++++------
 Documentation/dev-tools/kasan.rst             |   6 +-
 .../bindings/submitting-patches.rst           |   2 +
 .../driver-api/driver-model/device.rst        |   2 +
 Documentation/filesystems/fsverity.rst        |  11 +-
 Documentation/filesystems/smb/smbdirect.rst   |   4 +-
 Documentation/filesystems/sysfs.rst           |   2 +
 .../filesystems/ubifs-authentication.rst      |   4 +-
 Documentation/gpu/todo.rst                    |   6 +-
 Documentation/kbuild/reproducible-builds.rst  |   2 +
 Documentation/locking/lockdep-design.rst      |   2 +
 .../can/ctu/ctucanfd-driver.rst               |   3 +-
 .../device_drivers/ethernet/amazon/ena.rst    |   4 +-
 Documentation/networking/ethtool-netlink.rst  |   3 +-
 Documentation/networking/snmp_counter.rst     |  12 +-
 Documentation/process/coding-style.rst        |  15 +++
 Documentation/process/deprecated.rst          |   4 +
 Documentation/process/submitting-patches.rst  |   4 +
 Documentation/sound/soc/codec.rst             |   4 +-
 Documentation/sound/soc/platform.rst          |   4 +-
 Documentation/virt/ne_overview.rst            |  10 +-
 28 files changed, 165 insertions(+), 107 deletions(-)


base-commit: ee9a6691935490dc39605882b41b9452844d5e4e
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
