Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EF8CAC58E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXhNnmZDU6hmp5gQLXHS+8EtiaVzxYLxC7LwK6+y6W0=; b=m3KKes+qoSLheU
	74EKwTeQY5M6+bwlPTewzm//1RWjHHD44gyDH9w7WyEuI9abnzN4N/+HgMjX2TF8VR/gxjzrCtzTt
	q213ivENWp0cmw44dULYeAdF+XZmU4TappXUL6XMj4mvHFtkLe0CqfDFqOXyvsajrQKk6r7aH9AAH
	2ZIw6uepxuBvyUZrAemm8AHnSFACnSv3Ex1Y8+dJ4Ivxy72Dqc7SU8ZcHpIfSXj/I/McytrTsNbyB
	sWEdL6jwEWCqG65Mcg+a60YaVg+MWBjg8Cec9e9GHc7YcUtZDMB89u4U3tTlA76wM/mXJJsEq4gRj
	FYHrQTjsWpMVQcmeQhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAwA-0000000BkoJ-0z6W;
	Wed, 10 Sep 2025 02:51:58 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAw7-0000000Bkla-2rds
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:51:56 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32b959b4895so4349929a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472715; x=1758077515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQcUO3MMNiHKjyp0GXG4A4uvsTQgAsYSLBA8ucpISkE=;
        b=bcg/RWWNiJxVgeqomvEZ9Gel1d4ULoYISolv46xhw7e+v/asfDmSRayjGKDMh8a/WQ
         dB2o00JFTiu87SPsgvhMxpjw1nGxuLefsIo0alJqfGOx7CtTs65qiDNlljvYSqwcLu10
         B37ZK07P4ZDhWCdM/qhpv7zXomtNANioE8ta0tWHO4qiEquYOzOj0TarKc85QLHVTYYc
         UauNd8Qc5SUNSt3VHRB+fJCZy1eiTel4nOsM5oln3868PCipoaN+hCLz7IG/JV9rmP2f
         RcBwwx3YCByly5XBn+G4ll/Oc3MQ6JV8WOt9ArcTLr8gsPYuORL+4XCkyaPP7bj1KNgw
         YeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472715; x=1758077515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQcUO3MMNiHKjyp0GXG4A4uvsTQgAsYSLBA8ucpISkE=;
        b=Rdn1nUZGsR4lp7tgZGmIn4UefLTsyEmT+Qds+OINH7TGorEC+UBDDeSfeSou70F3hF
         mbxoqtiTcnYTh2BhxRRzm6V5Ft0FOtJ6wswSJ9DLxihFnRkOGYG17nfm+tGC6oyRFgcm
         I1JsQfswDFdhKwhdlaQpiVOXoEt4RoPkswVpkmkTsWoKWt2od4N6kALRjjLmz7vTcxp3
         XM6avgmfBIm7ZYkwha78D4rmI4vjyhl4VwUtZObHwVGtP4XiCzH6kqAzx6IFD/nOOpzg
         WBXtNOWdJcMM/CK0PhSPDYVXnzdBHdvVhXtAvYEOXwKJbAwP86h94L/Es7afR34ryHxa
         DMuw==
X-Forwarded-Encrypted: i=1; AJvYcCUQS6hft2Urn+o2fp86bzV5geSpKP/dLGJWkM2qzXsiY+w2k2GXLw+q9hh8LoqSJ9hmgtwbo4n1akw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsaZBACY9i4EmIAq0cniq/kNNCz3I4Tm98TBPhnAJDEz/GdUyL
	CLHhYANZ5cNOlpX2iSYmDLcNXYO3UnpANV4Yh7I/gs/gSweEsLH/Nm2J
X-Gm-Gg: ASbGncuWCvZcJmD0yD1PZ5ekvVDiBoh6f25m4/CeMBKWo6flkKlI0lhAUbMVEJiA0xT
	St4Q3C8tMCOUmBhEqRecuUz95U+C4Vpq99RBnAPic+zL0w62yz81FdifmiyEdisGnGW0DT/zBsN
	Xlhhxz8a4kX8J/4MXVRe4oIQGohNz/uwDHyWf49D1ScPzOPfAUBXA26iTR2KjKXtZe/D+J9XFzG
	qM/tH8fHdezIN3vstzXep6Iovx3/QdUVrt0Iw1DsqNBuR6NMZfmhEEWfTEuHOtG4I1Cc/HCGPpM
	ctjyoJhYWQUkyssSZP9JKEdEfj1lr4MjucwGvICQE6kF8CcP69bLgIFQKdESyP/GTOjnnNl8sIC
	IPL4nCUqSFF0l7R9LtXeFfmB612is6eIPUc3g
X-Google-Smtp-Source: AGHT+IHumoKCl0BwECrl0jFgQDm+a5TPs08x2B/wSLqiGEG+ifiNXW+7jwodpJ99kFpH7Ms7vygGwQ==
X-Received: by 2002:a17:90b:2b43:b0:32b:5195:d119 with SMTP id 98e67ed59e1d1-32d43f04fc5mr19535835a91.12.1757472714800;
        Tue, 09 Sep 2025 19:51:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb313dbasm659049a91.5.2025.09.09.19.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:51:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 158E941BDD48; Wed, 10 Sep 2025 09:43:53 +0700 (WIB)
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
Subject: [PATCH v2 12/13] nitro_enclaves: Use internal cross-reference for kernel docs links
Date: Wed, 10 Sep 2025 09:43:27 +0700
Message-ID: <20250910024328.17911-13-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=bagasdotme@gmail.com; h=from:subject; bh=evrdLEAoXKuQzTljW81Kh3KyWLApG8gUObVzJ2YlNgE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHniiL9usWFB1WvT+NSavLIanh+698vZJvp5Iqyn5cF Oeb1Xiho5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABN50cHwvzL4D8eTgyE89fse HlBVStE02WjOOvl23fZ49/PHUnNONTP8FYh3YzzAeWbK5vj6FqvtSXp3M3+Vxhz3fMrXXv7oQq4 HPwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_195155_719235_C99BF2DB 
X-CRM114-Status: GOOD (  16.52  )
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

Convert links to kernel docs pages from external link to internal
cross-references.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/virt/ne_overview.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/ne_overview.rst b/Documentation/virt/ne_overview.rst
index 74c2f5919c886e..572105eab452b2 100644
--- a/Documentation/virt/ne_overview.rst
+++ b/Documentation/virt/ne_overview.rst
@@ -91,10 +91,10 @@ running in the primary VM via a poll notification mechanism. Then the user space
 enclave process can exit.
 
 [1] https://aws.amazon.com/ec2/nitro/nitro-enclaves/
-[2] https://www.kernel.org/doc/html/latest/admin-guide/mm/hugetlbpage.html
+[2] Documentation/admin-guide/mm/hugetlbpage.rst
 [3] https://lwn.net/Articles/807108/
-[4] https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
+[4] Documentation/admin-guide/kernel-parameters.rst
 [5] https://man7.org/linux/man-pages/man7/vsock.7.html
-[6] https://www.kernel.org/doc/html/latest/x86/boot.html
-[7] https://www.kernel.org/doc/html/latest/arm64/hugetlbpage.html
-[8] https://www.kernel.org/doc/html/latest/arm64/booting.html
+[6] Documentation/arch/x86/boot.rst
+[7] Documentation/arch/arm64/hugetlbpage.rst
+[8] Documentation/arch/arm64/booting.rst
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
