Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3D2CAC582
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNZU/mJfY/UnvIjq27M2L97uTdZmpLEvNYaTWJEjd50=; b=MvdnBDM/9hLYZx
	9WCU4SUVVtPGJAEcz6ndpfOgPq/hyesJa0c2sZ0ZPVrOq9jvgdm3iPH2YduWkl3I6ywMap7F0tlwd
	VV3QkRWHkL41BK5GWaODZghl5zeu0PhQmClL/6EgoZnwTP1/knsUSbNqtgBBwT+rEz2GOUNGkItMO
	5+/qpsbHCuywjg+Qh8pGtYgFOD6w+tkUy8BH46d/2Nh4rfjQVnugsGJTW/ox/kdoR7aj6sRo/SW/U
	h0y/MOToDt/8to2tPaTn907Fy5acT9PUD5kv1jK96z7fcJgmbcyioH2OVRio+lkLWctfSNVy5sNCl
	oktvtQQ1MYFPlOUTZYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoQ-0000000Bhfe-1wBF;
	Wed, 10 Sep 2025 02:43:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoN-0000000Bhe9-47B6
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:43:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24b2de2e427so44549425ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472235; x=1758077035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKHUedwTpnE+6902OLKWJUrKeeyE0icmaP4M6h8VeIM=;
        b=cN3xOZ1erDZkuJVuArHTaTf1pjj60p9FrHpLMeq2U5PIOgeo5P8QfjP306AJ6KQbh8
         vAOqp3g1Bheqb3zXRhY2UUEqTPKx9k1oa4HoFI2m52fH2cq9eE2J7PgP/cTMh6iwGBok
         l060cJY85DsxpKhcuM5UnRn0fyXOwkHlmdTpkvt+3l4bVV5kmr96A5REZL3eUA3Fc3GE
         i7UHKMvZuA53YTomu+1o3nZk7THjahSDB/TQdLfwHvI7F2KVF2q2WzEdMxIJS/ciWBqs
         F6r/VKMHTtVnr/hIpeW7O5+XglqslScWupnwd97iUAeo5B1/kke2PMw6HpOmPZzdj3VA
         vGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472235; x=1758077035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKHUedwTpnE+6902OLKWJUrKeeyE0icmaP4M6h8VeIM=;
        b=OJqt2o9qWWEMFTzcFeLE0b4TtGIOv7PeEpvB3x5VAXgQ0EqzBC3aGu0jxlJpuCAwvU
         aSa36SSTB5ZdMPu2i5EnrnjOtJFaH4x6JjxrY/h3Sy2zRQhld7kGlFoGAqoKs5SoUbcj
         hu81cl+hmnmamzMu25UuaEAleqatZ3fmMmyMVncS9slqaZhG/3puvN813AX6CIrYLtRt
         UjXHN2EdZSWzY/7Dr7ouEMCE8fqQQQ0tEll0yBNmPszeR3AYua4T/5tWIRJWRs33DkKs
         p+CpjH2XndakBtTLng5Pqv5xzT7wmEbuKJgNqVY6lDfRpKFLXZ5Q+x6w7sRs0Ocfuy39
         /lqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYlCeRocvu51+lhKPyiF5wpfwtCRa6BXo9/x0hXgpfGdwRxafU/+w9oXTZvKcIV/9hC8WFKDf5/yU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVoVS27wvr3J9tJrI3P3/gmAGJQBDZ8Y7i3IADpaWG/dMFhaOX
	IYgiKtVyRgVBXLybz9aGdFp/4+CqopZDfVzBlF0BitX8M3KZKcEtEARD
X-Gm-Gg: ASbGncvDnkZtNn2GtPH+UeNUkgJ1vpIzt4PEjIh2ZmBV5GZnVt+E7/uc07XRYaCHeUQ
	2TwKmmUu5dz1BWrHjMP68F0lp325peo433hS5TgrdoIZdOMcZrWhN5pSZ9fY2OjCrgblxO6qUGO
	TziCRTASh4GoFJusNlmQHiu+YhRBKCUL8kGherBuznhIM1A743N+31pWOd8Fq+UF0yNFTVDWNtw
	1oMmwnkL//Ds2rq/ENw6U6Bl51b8jHst2GdSAADsvcGeUmTo5r1o9KCym9OCsNI4t/6B4nOIT7+
	PH7FqIhnOa1gVUNiRw/K9VY/CMINi1WjnS6jcgQ1ej+iExcs1JjtkylgYgH/Ai9FawEBgtIqQHg
	aptYOLdj5PlxASRG5gI+oX1LkaQCHFqQpBwKL
X-Google-Smtp-Source: AGHT+IHbDjWZY3VztYJWV/FENnSrT7+pUTw9iPKJIW8vQLIXrlNVN5ahZX5GB9eL2BwlCwOB0bsRtA==
X-Received: by 2002:a17:902:fc50:b0:24b:640:ab6d with SMTP id d9443c01a7336-25172b4b335mr233139385ad.49.1757472234639;
        Tue, 09 Sep 2025 19:43:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422ffdsm11441735ad.17.2025.09.09.19.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:43:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E4226420A809; Wed, 10 Sep 2025 09:43:51 +0700 (WIB)
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
Subject: [PATCH v2 01/13] Documentation: hw-vuln: l1tf: Convert kernel docs external links
Date: Wed, 10 Sep 2025 09:43:16 +0700
Message-ID: <20250910024328.17911-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=bagasdotme@gmail.com; h=from:subject; bh=oQ/U51BIIgNGsRun+kwInz/tmig5xTqHruGeEvNRxQQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnig6a/JZLY81M41OfrJ5W/1jtyyro8lZM99fCflwN Zg5yrW3o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABOplmZkWLE7pDLv7RVG0Wlf H5ewasZymzr2NV7tNPkiErzi6eK/vxgZzoS7uJzLvPvRJPIa/z7RCs5jTcdeb3Q8EmZgt2n66RO ZTAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_194356_023000_42F5519B 
X-CRM114-Status: GOOD (  17.13  )
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

Convert external links to kernel docs to use internal cross-references.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/hw-vuln/l1tf.rst | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/hw-vuln/l1tf.rst b/Documentation/admin-guide/hw-vuln/l1tf.rst
index 3eeeb488d95527..60bfabbf0b6e2d 100644
--- a/Documentation/admin-guide/hw-vuln/l1tf.rst
+++ b/Documentation/admin-guide/hw-vuln/l1tf.rst
@@ -239,9 +239,8 @@ Guest mitigation mechanisms
    scenarios.
 
    For further information about confining guests to a single or to a group
-   of cores consult the cpusets documentation:
-
-   https://www.kernel.org/doc/Documentation/admin-guide/cgroup-v1/cpusets.rst
+   of cores consult the :doc:`cgroup cpusets documentation
+   <../cgroup-v1/cpusets>`.
 
 .. _interrupt_isolation:
 
@@ -266,9 +265,7 @@ Guest mitigation mechanisms
 
    Interrupt affinity can be controlled by the administrator via the
    /proc/irq/$NR/smp_affinity[_list] files. Limited documentation is
-   available at:
-
-   https://www.kernel.org/doc/Documentation/core-api/irq/irq-affinity.rst
+   available at Documentation/core-api/irq/irq-affinity.rst.
 
 .. _smt_control:
 
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
