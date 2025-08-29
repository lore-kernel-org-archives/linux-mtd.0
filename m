Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B573C8303F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bkb8gb8fNgbP1iXcNbupAwl/J1ktfZCZC2eJsGWULg=; b=oYbbXLsWQeQXYZ
	XsPTK82k6Ta4045UQTD6XmDk3VfpeubFi3CgVDWF0lMGTlpaEi2GQAyqeSqJDRYuPhCHwFnsdvlgK
	iahXAyaINc9q/dvtu3w19rJ88u+HBv8IJ8xed+9nv7Mv8NekaMGEBZdsjgg/zPeCaN2Lpw3pU8Jw9
	IDI4EiiIawqtdq1IQ4LTrRrY0OxYjWYc8DIsyry1TLLs6fhAwnIDowbs5nHblBoF3dNbSl3Xy9yLx
	1LL/8KedJWQCtVUdbdNySAHPy/aNtd14wyVEhnOtVotJRWH3oefuPvnkH+g4Hv9z79C3VzCs+6Dqg
	9DrRwNXJ4JfXWlHi4erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruQ0-00000004y22-0SUB;
	Fri, 29 Aug 2025 08:25:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uru4W-00000004spN-2lq4
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 08:02:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-771e15ce64eso1538684b3a.0
        for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2025 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756454576; x=1757059376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUuceR9E3vzJz5a/JHCoOJAb1uIOOWcnyWbxLYGhp7M=;
        b=DnglPYQc33Fhn6qwyXAsl94KAwiOUFdAlDmdkD9GNvVLb2Re9b0JGp7DDic4839sJ6
         APVL82E+jZdZoEDS6I4fiq4O0LmN3SM5GLA4dPB7u1xrKh/eNV9i5vcz1jrIVDIQsegQ
         AFSNGtMbdR4bhyS+60TX01B+a4x7TLlIgb9VY81a+X8Gn349qAhWBw9Za/oU2LHKDlF1
         FgbnWqyktlRXadgBfb0oe6Pwrnc2ye/CvtpFXXsqsemjoaj/QU6jgMONcq7L2FQ+2k2y
         l2U5tqs5nP80uItLq4v1I4TT570cqDXaWmNeOO1RW+qNf+6tnkVHWjVTgXXUfGdJgZ+n
         axDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454576; x=1757059376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUuceR9E3vzJz5a/JHCoOJAb1uIOOWcnyWbxLYGhp7M=;
        b=EkZrDCp8J1JetEQLqBR9svPfMtp9WHJuwWNeOtjltulPnbf/b9jOj/UY4NgA1s6yhO
         wr2k/yppTn5maiSLrcsUKAaeViWoruV50H75poAO0w3LeVnQ1q/SFRV3XF3emnbyTy3u
         k8eLWZJGszzY51QoGPPlUvVkiVXAdPOOHvNFBZUdgRkXyJgL7kPv3pw6tpbxk5pjei+h
         mbudvyM+hN5lBMo7pVROpcAby2UoV44+jUBoebI1RUHuUzN3KwcNX/YrWvlve452l0C1
         LKRc5gt47LX5l9SXJt9v4/6ev6JGUQdiynnO6AS3dqY+VD0DrtU/6baOPDkVkiruKH/3
         EAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcKYgkInFR0n7IZdV1l4DSUABuN68yQaVytTDB+xMsYg7ST3R6AbpNWetGceflbM6opIuCNs5T6Vc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+7c5a7VQthvSLygwgZga8bej/fKXq+CXgWS/x438KXqLnEApt
	jwcj+4+NTsa+R1KtDjIU8eAbzD5BN98vYznRhFHigHUxsA04aAJzkgDR
X-Gm-Gg: ASbGncuaphxge0mHJSDFmzcgZl7xtapk1lKv0we3PSyzTh3uvgBDAkcmqmRtEfc7HYJ
	6gfYdrwBkwzTdhMeeEN3uULEPB92aM6JPJqNpt6zt2J0KOXDrf8Fg2YzJriKrJe6RW2A96C17jk
	ZDVDd1YNMW+eGhgpv/uIs6DNQ6k/+vBZncuCQDzJceapoE7LYBUED0obvZqIEx/+mBQF9uS2sl4
	uMHFgA2bw/Ctq0gI18Nd/n/zVYpRQK0iDz7638OpybzUnS7JY4+KXOB1mE1zkurLfDGKBPPBuVZ
	uG23A6nffgAD2jPOog5nRSLbuVzllgdKEBKImUeSGxIpM/O3seuokWNeEEWMbnwoH2/I1LYgd0+
	PCD3DskxRX5QuyvT/9jcLtvv4biA1um/L+/fF
X-Google-Smtp-Source: AGHT+IFt0CgZnKjzhJ5g4aj0Cm28ZWwwe3q9IBbh2aQ/4X9BQsH63Txhma9tsRWuYD6j70bLTYHjgg==
X-Received: by 2002:a17:902:e890:b0:246:bcf4:c82d with SMTP id d9443c01a7336-246bcf4cc37mr269048275ad.52.1756454575739;
        Fri, 29 Aug 2025 01:02:55 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249067de9f1sm16493345ad.151.2025.08.29.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:02:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B95C34480990; Fri, 29 Aug 2025 14:55:28 +0700 (WIB)
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
Subject: [PATCH 08/14] Documentation: gpu: Use internal link to kunit
Date: Fri, 29 Aug 2025 14:55:18 +0700
Message-ID: <20250829075524.45635-9-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122; i=bagasdotme@gmail.com; h=from:subject; bh=lGvjj6RPPbr58GqrWqgYvJfKnQd0kE/Khje7rmfw55Q=; b=kA0DAAoW9rmJSVVRTqMByyZiAGixXOmjSTNEt/JFR6AhPDWfGCcGj/Np82/Az7wMJic3oIar2 Ih1BAAWCgAdFiEEkmEOgsu6MhTQh61B9rmJSVVRTqMFAmixXOkACgkQ9rmJSVVRTqNRJAD+IU+J KWDSPb94prUVj+FntqxPO7boU221XL2jEkITc6cBAKhpWT1CuLYVAMm4rv4hGzdOOa9sljkO4cB hdLolzx8O
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_010256_699344_074377FD 
X-CRM114-Status: GOOD (  17.47  )
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

Use internal linking to kunit documentation.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe950..efe9393f260ae2 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -655,9 +655,9 @@ Better Testing
 Add unit tests using the Kernel Unit Testing (KUnit) framework
 --------------------------------------------------------------
 
-The `KUnit <https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html>`_
-provides a common framework for unit tests within the Linux kernel. Having a
-test suite would allow to identify regressions earlier.
+The :doc:`KUnit </dev-tools/kunit/index>` provides a common framework for unit
+tests within the Linux kernel. Having a test suite would allow to identify
+regressions earlier.
 
 A good candidate for the first unit tests are the format-conversion helpers in
 ``drm_format_helper.c``.
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
