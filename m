Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5187CA1003
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXhNnmZDU6hmp5gQLXHS+8EtiaVzxYLxC7LwK6+y6W0=; b=azXgEW4dXIEebh
	g/Z6OZQHbkacmNzuBuInd5fafaICnFXMx7KhCMDG7T2C46g5TA3uJOqXpsv9Q4Uephefqw6w/9cOe
	579bUBoj5Fi9u99uIxjvyXx2nqbfMH1seIdmWOmGWM33SNmuKXYeGoGJmXeYbVK0lmuFyZWToOL1M
	JXSocpYqHtYZYVOq0mSDwJz8INLQTjqbORMNJkTWqmbqLT3z0zXu+1XnRgOXDjJmDKJsOZzo6tyNN
	Ut3aAvhMtJV26YPerBTxD6BxBiZbhM7pl4UT02N+JXqeW5BvlFHMTSmwdJ8c5ordgrsPBGkVvSkpW
	k4ORzoTO5Qsu+5XjIeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruMq-00000004wrP-2OVv;
	Fri, 29 Aug 2025 08:21:52 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urtxd-00000004qRo-2iis
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 07:55:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-32326e8005bso1895363a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2025 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756454149; x=1757058949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQcUO3MMNiHKjyp0GXG4A4uvsTQgAsYSLBA8ucpISkE=;
        b=ZmY11Ts6oGqxELsaOk1E5u0TywDZgsi7NPUxxOk+8BMe7eDxKDiAaFj4oCt5YGwI/t
         o9+gidjbZ9QdC17rx5inzchkO0HFHMoMhjLaKcZnkcajpp/FCXJH1+BkaNJMlTCXlfb2
         Mq+T77dfKXrk7KtbKiySsCgfvM2IU0PaFYl6EbmdUefATbBqbWqzikNi5NiO7QKbuiF6
         vmj6ObTiWuAEmGYLkbCQGJcPI+T9cDrG04k/3L6hfPa1Qnklh05MsPoFJCzJDDxYD2FQ
         +YT/i/WVJpdB9sb0O2sm94aeUJXUaEJqAdA44xt9PGapiDo94WYEjNmkz6qkbT50Oen9
         pTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454149; x=1757058949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQcUO3MMNiHKjyp0GXG4A4uvsTQgAsYSLBA8ucpISkE=;
        b=cFuCgfCnEqnzbl7CTGLakWRVFSgWBK30QZqjv+Jk7naua0PMzrG0NQZFZ6nkxUfRt7
         NLTeDUSNEIXDDGmFRkrMlDfFuKRSvkrdxSXkQmnFgbIvJ7XrW6eA4V4uYLqhNfucCded
         4W8Nzxs1HPAL/KbwTCl0y4nmdg4Ei32Y2BHesIDYudpKQzt/dJfBBnTyqmdI+vruNzf1
         3gBZ032E8d3zY65p7rYMY1fyAELULTkckfWYuLgxcDeBn/7F617COQMu7rc3JX1jdSAf
         DCQjgx6Es38if3xLGyoyJJogmqR7mnrMaA79uTaK5FFl4hOW/w1VvOqMSicVehaZ4T3u
         MdEw==
X-Forwarded-Encrypted: i=1; AJvYcCU+AHGJ0KKKmZ4P9ylbRkOERBblm7hWLSQ1Ycbxt2v4iARjYV/08GdSBhCyekPqxQoujXfdZXhwPkA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxR4lJtEUHhbXS8dMDZZJj6dIs1YeLxNgasXmciWssqDnPOwS5e
	YHzA97mNX/YBjIX3GWqhUDiyzRPJJmHBgtEFIQhlMlANLY+kh/CZLeG3
X-Gm-Gg: ASbGnctGDFGov8IVkkXsNJ1z/2SrDHDJoObxFQPzJ3horUDo/hulQwWCwxCRF3crogF
	Ksf8p4TO1shgfu6ykYrVxleNxsOeJXvjxH7DFCDqEQmyM76yFq0QwxdgRUA3wMbOEBdnIoMYd1M
	xu25wUUtBbLIUiPURt7gcUo+lJd+n40vfSEhgcYgUHBT6WQ+MCQffQhFhU3n5NspmdzHdaf30Vb
	nmBD4u72AL51xeTj8+RfBgwZw1tU/3PuYW/jnjlpoSoeLvrALwHcZg8VcibvLOk5y+Wq4mVOfd0
	SRybkNlkYNwa4ijB+S4yR+Zz3J7uKPQLHfmlWERr3jZAiPb2LyelsAqrHeeIbZfuUTUmUnzARg9
	KEmVQErDncb40TRNOWKPwaBFtV3f+Cibz1BBy
X-Google-Smtp-Source: AGHT+IHLqM32trOVVzh172ftn7E15FM6Ea2Jk4ybBnzNmcbOCkm5faJ3oUsml9NRpuaa5OiBwPVbig==
X-Received: by 2002:a17:90b:4ccc:b0:327:7c5a:fe77 with SMTP id 98e67ed59e1d1-3277c5aff68mr10961209a91.30.1756454148623;
        Fri, 29 Aug 2025 00:55:48 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327a22ec24dsm2591905a91.3.2025.08.29.00.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 00:55:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3924545A3F85; Fri, 29 Aug 2025 14:55:29 +0700 (WIB)
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
Subject: [PATCH 13/14] nitro_enclaves: Use internal cross-reference for kernel docs links
Date: Fri, 29 Aug 2025 14:55:23 +0700
Message-ID: <20250829075524.45635-14-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=bagasdotme@gmail.com; h=from:subject; bh=evrdLEAoXKuQzTljW81Kh3KyWLApG8gUObVzJ2YlNgE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY16J9usWFB1WvT+NSavLIanh+698vZJvp5Iqyn5cF Oeb1Xiho5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABPJ/8zI8C+tSSfleGvDlW33 Ss5v/Xrog5zFrjCmKzem/Vr2Ka6JL4WRod0y2uaV0GJBfuHrJzY9vTqdTVAvLqhtcdO5S89liyP teAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_005549_730170_0E8B47A5 
X-CRM114-Status: GOOD (  16.00  )
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
