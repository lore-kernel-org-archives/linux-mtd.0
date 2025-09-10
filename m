Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F0DCA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH3bMkTq9N5+vFWesRjADmU3mhXftUVzsJ6o3CQjGRU=; b=tnfBaELS/ba0Kt
	4NorXOzO5d3fvFR/tJbKIfSZb1jfiv5lsNBvx/DsI80OGeCVxxfqqPzKrv3B84nZlzOTrwmr+muIP
	rrEdjd0lOW2j2z/DJaeDrV2lCO+AlfL3TvUUt1RqBb/X+3gfhksw3FqmdO2kWWz6FzFIlD57vMU0x
	K8c/es9381NOtwGjPMOKowhdIy2or3MeUMZiOSUQhWySTuhvstbb/B2wBYJ19kjJO/gCKuripFRWf
	Xh46Y5u9FrF1D3IPFUAS2+077rVyNkgcHJIODRgnLQyYNhhXx4jFHqhv22Ye1aJAmd/dY3rVAvyZg
	KY3A6Au4mHy7tHeLdUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAod-0000000Bi0l-3pV3;
	Wed, 10 Sep 2025 02:44:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoa-0000000BhtB-2JKd
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:44:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2570bf605b1so30274765ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472248; x=1758077048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BATnrPttTGOeKRCCT0K3V4HzIU9KTE8stAVBRczt2LY=;
        b=iWUV+LuFWIAvSdSflO9O+EK0sf6DSmEsuoXOSBnxSBIPUTdJk+iehcDynJRdgc6p+d
         Ei8UdOCuRNWu6MuUGYEK/uRjnej4pwRbXUqpb2Ki8Lj54oagIS5h4wJCoSSCexwLNROK
         0D/aY4kF1Buz4VIj2p3B4zDp0YyVy707LYnSH/0G+eutf2DXNr2bcLu4g4dyjb46QJDb
         GKTqBXvMkY0gJio5nTTkMveu3pG1swHR+ZKTXxM70qFDN0USnWMctMyybN51ArMo2KQL
         PT4kaQM1y6RP9PJZjavdfAljK2USddI5o+58YBn9/7qaXbxs8Sjf8kIZbh+EP2HHLdHp
         R0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472248; x=1758077048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BATnrPttTGOeKRCCT0K3V4HzIU9KTE8stAVBRczt2LY=;
        b=Yn14d0VVF3XbTEaaOll1fCZ3vVxt07OvDM+m0Ca+NpC2+gdTw3v649aZK516sfvE//
         kqfG/fuLwM2qTtr2OW5fM0D4HrnhfvSDMAhVReWRkVKLMsBveYbVtfI5OqixqjcA4bg/
         ExEks+0iogjppQTY75hbCLOTleOrQ38F8wQf6oID/tn9SdReSyy1DG1uIAvP8imc9xRk
         bSUduSOtpndM95LcZbtVIRX65mZd2iKCK3lE/0Z4ksiKMqxfZO+YXqKH3rto4hsO21Q2
         ppsVdm6tqonb4rhBJiLUqdAGIeW7hRzGkmojNhZXxJHWhKMAC85uoxuvpSU9nCn1geZz
         E4kA==
X-Forwarded-Encrypted: i=1; AJvYcCXJtp8NDMx4OfyxGg1ubhfacHooNylW8ALOEA1JgidnMLia6z9ggHgaoHb0m/RqEsZtzjcz0vnJwnw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpwZTjhpkNImrxAgj/tReXMvQBUqoTDDVDua7WuZvAw5HrQKMi
	CS3GSB+jw6Z7JU9CVkGL+xVP5X3aAt7TWmcEX7e9srdu39t5w4zvuJtj
X-Gm-Gg: ASbGnctGy8gjTDCKx4Meo8xM7tp5rN0aLd49UOT2xhq2TtAXMuq0iXOvK96u1kheV7/
	7O+kGmCbEc1X+hExBIQg16Q05cuBG80qyW+/GDmQaoGGyuyiyPXPO+WEa6XUt8w3syFmHM7BwRH
	NlXCpMF2pugeM9KZU+c8jxmHmj3Qv64XtW+NLb8jkZef7UYS3nW5s/wm9aMjm8iR45LsgePw6oM
	R1N5XD2vsKfr7OcA3xD1cpcaqUdo8RAyfb356admzN9dVuBXT1Eo2C6UyxKUDnzEzah9Xb4j+6G
	nI2DtgZ8zCQsqRCy4GbMXgTVCibZHpTc9QX0xLDj4rWHfk6FsIYs+05aPS54Fyo9Zo2d2DpWW1/
	KF0QGHvzpYaGzEBi/Keop0oRDiuGWg3oXnuDD
X-Google-Smtp-Source: AGHT+IFT6YbUc/m0qKUsx2gIlS1cyHwFE/YTWi5ShK7yx8zu8toS/bxgvdpLpOBm2BAA4mGAvmnSyA==
X-Received: by 2002:a17:902:d501:b0:24e:3cf2:2457 with SMTP id d9443c01a7336-2516e69aee6mr211563725ad.24.1757472247632;
        Tue, 09 Sep 2025 19:44:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662ef781sm3491871b3a.90.2025.09.09.19.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:44:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id AD39841BEA9E; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
Subject: [PATCH v2 08/13] Documentation: gpu: Use internal link to kunit
Date: Wed, 10 Sep 2025 09:43:23 +0700
Message-ID: <20250910024328.17911-9-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=bagasdotme@gmail.com; h=from:subject; bh=WOOeaeuC9/RH4phIV+H+QiLxF/prahARBSHjeoa181M=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnijZrvnhN9eJ1+LvAp2zslcUft9O2uC6e1HKcd4J/ rFLDLiudJSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiyg8Y/lmtiNJu8EtVbugK fub0kTH31Gy3pLdrgoTZz7qUXricksHI8GebzZaeM9lhFZ8KFVTdJ9stibqczP1vypfAmIZda2d 1MwIA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_194408_613357_83FFE9E6 
X-CRM114-Status: GOOD (  18.14  )
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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
