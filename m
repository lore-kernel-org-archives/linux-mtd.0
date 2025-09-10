Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA419CAC582
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftBc7r5IyD45ZP9M65L/GtgPZWRaADAbeGk8PrOkl4w=; b=EEZh5AlLV2P8s5
	Kf4WMAMKR0DyEuq0oGMXS0bnIaWE5lmBw5aKNP7PMJHH8DSwJ40FeZd95R/tkTWNgohtt+jFL/bdG
	kUow5ij+r28uwWEwu1lwZXEuqDF8uqvDIciDS/YEfv9ZpcyupHXILEadGU03EIIEIOQaWGBSsBFQP
	mHhtKccCugoh/682qm7uMcM8c/qfCds+WiY9P8JkTRv9MK5ws0WfJ1Ow9lQdFpvwEtfAcite9kQh1
	7ubTDht5ylTQlddR8Z3K2Zq8M9j65xtexqmoh0t/hbmN3boszsFFCT5JJ/8c3PPEVmQN9082ctBMs
	jgwbAPLEm0zV6NhzpMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAov-0000000BiSl-1N3p;
	Wed, 10 Sep 2025 02:44:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAot-0000000BiQD-40Ke
	for linux-mtd@bombadil.infradead.org;
	Wed, 10 Sep 2025 02:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2kNx/lgQaweLHCKpOd5HxLBg5NtnJ9f3nOi2hx/97zs=; b=fbghnCj33OF8/XSi/tL05g7o7o
	cowtyiiMmgyRiXlYjEm0aMBcDzW4PvN6l4siq9VY+Py9soOLkI1ppLIRvq9mxOOarUattiotgDQqw
	eAqFWHLij6EjQB61ZZOmJiPvLqHVfgtRcZDoL67henWqYKKEuK01OxuKMJ5hdnru9hShYeSQKYd/q
	duena6QR2i7EBGWVCwC4PvNMUcP2oD55J90iRL24l9xf/Lmtwo0Ad5ieWUaUzLmVlhgnDkaY9v8b9
	cF7d2zjf2Ix3rCsCXT0jKmULKo/3iU37PXeZOm9kPGM20QW1WD7uk1cdy9PI88/itJ7TdxakKmhV/
	PdhLswyg==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoe-00000005hMA-3UsX
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:44:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-77246079bc9so7425197b3a.3
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472248; x=1758077048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kNx/lgQaweLHCKpOd5HxLBg5NtnJ9f3nOi2hx/97zs=;
        b=ZRwM/ulq4icbRZ0Vy+jNKWswNpZEjQ9InDWMbM7EnyJ52x3s0Afy4TkHxNlIKA/Kpl
         +JTDb46C0pBHDnGsqFmyRm/y3dPQNRpVnRnxrazaROm4bXBV45ZQh7+CzGeumpQTiqUd
         VJoeX4lZaZj3Qe7Y/4eFbkvmZl6RuNbKDOU3e8dxo8cv4lweJa0SO5TeCJYLiIzU15U5
         Da11/sls8nJdK3y2urFCbBXpNrWkOv6vgD06pUOP6t2Tde7TJy85JfIt7FbyiKn0GWrR
         0j913+bPUiqTid2DxH5+4tsir4980crtVKuRqyLk2yFaAUZwCEP0FpfHG1+gX9cCNKtX
         sc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472248; x=1758077048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2kNx/lgQaweLHCKpOd5HxLBg5NtnJ9f3nOi2hx/97zs=;
        b=Kixcnlq3/670xTqsrhWb1bSGDdi7dcyVEdkewrgg7CHrCDiJr2vYTa6HK7gsbK6arb
         /9Jv6DyLQ+JKTbon4ndwQrvO3nadSfhb/VM4wpbNdNwnZ9Iu3nrPtnC8M2fCo/VqkjLb
         trl9eCm3BrF1r0YW8qpo/fecYfKFKDuLxoDpreWCgrQBD/GjPLyzJZixCzux5pXHlFck
         zxDYPGBC69zpDadGNavjfBRVXDzzm2SmyvHvUsHUIeDFh5ISFYZI4um/LS3T3zAXDrlo
         xI54MkE/9A6WMZaRKoiQMB1SVzQQvQL+g38EeNbGBwX6EyDHi+H1rwUvYNMe1kAeNHja
         8veA==
X-Forwarded-Encrypted: i=1; AJvYcCXXWX+5W7LNIJF5WJvy8N3JI/fdujUoQ+lZ0ObZfT/hVMswgvALNlW5wtTkx0KtB0y9aniko/LZdLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+abAFfbBIMNI2Md5EIV1//e1Ohz/dM0CDQ/A5RlOccbYjHAAp
	e31uA+VRC4wO+GH9XbalXB8uSrlRN03tjBU6OlZDUG+hzH3vWMXwUbQ5
X-Gm-Gg: ASbGncvK3BukOE6Np16KOGtSflBfuhr5yvxnFGJuK4oigYiRNDZD76FB0Che3b4m9RK
	U2ZoLp/bK63QM/uX/0S/U8KPraPTWZfyAaEGGnSdGpLybdOnfdsghCwHhO6lR0IwsScMcN6HRfW
	H79GQ/W/1xrziLXz5QwyDrAXyuxYgVc8xQfRUkrTmWIlDwkbEaUAmz3UmymoLzEmHy/fqcp69Bg
	Vxwj5tOCd4Ki4KCINOyFvWYHyjjwmJulkbRa4CladsNDezvro3unx9vvAlGZQIzBJsH3WN5dxmm
	or1aOSuGg6TxUBvdKHRZx1f3wHIQNFoWsbzPtfGodMvzJEIVYa9dRyPAkvySe6EOGc02S9n8u3p
	IAJ7j4l5x/wWl2Q8EmM0ugfd6kw==
X-Google-Smtp-Source: AGHT+IEyED1mSm10/nBWu/PDugDe2kHeGr2B1Dlm/0Mxg3VMmmsn8EtrKKBRn8Kt1DMp+jVk5SErrA==
X-Received: by 2002:a05:6a21:998d:b0:24e:e270:2f5d with SMTP id adf61e73a8af0-2534547a6fbmr21436774637.43.1757472247740;
        Tue, 09 Sep 2025 19:44:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b548a6bbc9fsm1061117a12.43.2025.09.09.19.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:44:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 999D241BEA9D; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
Subject: [PATCH v2 07/13] Documentation: kasan: Use internal link to kunit
Date: Wed, 10 Sep 2025 09:43:22 +0700
Message-ID: <20250910024328.17911-8-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=bagasdotme@gmail.com; h=from:subject; bh=yEY9P3BA6E4kqaGTHyjuJlgmOOGj2m2ZOET4fPd8xcs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnihdUeC/XH99x9zD0/p/z/9z+OvEiwfuXjriUbHJw 5Al4fDvwo5SFgYxLgZZMUWWSYl8Tad3GYlcaF/rCDOHlQlkCAMXpwBMpGYSI8Phu5uLfVhjJryT C+XOkO/82KnH+HRZtlehgA+3hxWLXwPDX5ny7U3LZzLMPNBzWixMoIP59nkt/0fGhV4ZjM5rXH1 d+AA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_034421_037592_D78498F1 
X-CRM114-Status: GOOD (  17.74  )
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

Use internal linking to KUnit documentation.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/dev-tools/kasan.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 0a1418ab72fdfc..c0896d55c97af8 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -562,7 +562,5 @@ There are a few ways to run the KASAN tests.
    With ``CONFIG_KUNIT`` and ``CONFIG_KASAN_KUNIT_TEST`` built-in, it is also
    possible to use ``kunit_tool`` to see the results of KUnit tests in a more
    readable way. This will not print the KASAN reports of the tests that passed.
-   See `KUnit documentation <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
-   for more up-to-date information on ``kunit_tool``.
-
-.. _KUnit: https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html
+   See :doc:`KUnit documentation <kunit/index>` for more up-to-date information
+   on ``kunit_tool``.
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
