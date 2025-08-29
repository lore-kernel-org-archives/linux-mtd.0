Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D65CA0FFF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdu1jOpGadYiYKUW9ogkfW03gDuJZl/v4bRJm25zgTI=; b=EmSMJH90DLr5sA
	a2gjXlcKuAKMCT9fo2hkZ8sDIhy0xanPVFsDRjvR90z4+nNUlXGY32yjxCcDjostl33t+T8RNlQ8q
	SMR35MO0rDB8lal2137rK+4+vwkKneUtJWnHjDyYSLg1oyo64sAh3zE9zRb0jGAgPQ8x5BTTNB+nc
	SU9TC5brFEid9lIT2G+cQFDmSjhaKtZLi8WnV9vJNlZOdEAj+98zYzIS3omI2Gc8SYTCLIYxbiUBJ
	sHWJLOuhTDsMSfMgr3SzqVsneAaTcS8YGc+NOIVVPyjtuaENChY3sMsnnDamb4E6dA2NIF/zHmLtH
	0ZIq8uLFUOYVvpADzrqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uruQ1-00000004y2z-0sJL;
	Fri, 29 Aug 2025 08:25:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uru4X-00000004sps-0Fs4
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 08:02:58 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-32326793a85so1511341a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2025 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756454576; x=1757059376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdhbTSK6p9ht0YngyCDiyyRtcLCfpgxS9tGDrcGiJGs=;
        b=j5+HP3shiRZqldWYv6SpAk1+GmhtpvKbhuumT8u63RtZ/QTxIkCj9ZDLUBe0/gOp9W
         i1CKpONqyFUi84daiUsth3NGoG7XICqc+3X0u8+tQxlwH+rwPipsBVKsxm7UQQCyvops
         PNW3JAaMh1cdDjT45ux6OOEmDsVAYwdCR1mN5t9QzRUOfJpUr7Q0b1+jrRU+h8bgY2mL
         Y4IdyHR3rxJM9+lxn7xSVXiI9CLpW65OM3BUrgpL2oQVvPKA5Gd78j/uE+HWSUhmYbQe
         NgMW6/b4bbDut/rsdHIiu+mZc0zaLBxkGwXxcwGmtRQ8lCx17cgEoqyqMY4wLpmx5LuS
         M9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756454576; x=1757059376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdhbTSK6p9ht0YngyCDiyyRtcLCfpgxS9tGDrcGiJGs=;
        b=at4Yw2+j3Jr5S6GKNTIn7uE1ErwQnGm7vY+6PrxNYzXwK4c7N1QchxW6CD24iMjTvs
         rayp5CMk6aw+tN5eC6+UNcoB1p4nf/+IYQ4TvPetPNFxVdJIo2s0R9j9g6xsyoE5FjDk
         EDCT57h3S81UaHSgQ16lW1ZKI37IoCXZHe6AhFbJ0s1h4UOOvyQK1VXy8ReRWK/NQXSy
         XufpfWZv2H+3Y/h5kWcdQMQJQyRWHAiNTbySTxtAfG9WkeAjnffEdc5jDJvdUtBhdI3q
         efoXNv3hwheF9DtEE9nAaH/MtNx+d8rNRitK8GaGtUlKyc2Nq6KMMA2ilT1mGNqAC4sD
         R1dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVypu4vmELInY+4cbLZrOpgc7n+lqrVFp0c/GDDv9fhaSrKfgsOHWHtug1bjroAfKFb5OWKvlwlESY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe0Kf8dPCwcjebBBv8iXFZy5MSNwk3ka9O9zb5mC+jYPShb9O4
	9bVlcaH9fufIpjiktQTLcVyDZVtDDMV5HX2qbXSovR/ADFs1c+s8dLfw
X-Gm-Gg: ASbGncvYaTFaqF+xv7mXW4T2BZ+u7S7pIRSypkKvDBW6UI88ZYIxWsQ4mja3yTrabmV
	C0LkyME/PlerpXMpJgPNBubmomsiseh7jQJsAq8H3Y2bklHBFCFy5HkS4MbN0GWRbwq6cWXmhjh
	hZKxqUk5nKKvKLWu81A+uTnqqqnd178PdxVQHye0B9kXdd3MehBlJ5hk0gfiEjJaILqK+Eo6Hdy
	gvzRtVnbcWrnqOeOMGtIIeQnjWpl8HYFK4Gdu8yWm4aC6PkhK+CexyGzIIzY80n0MU6xmf7kAgp
	oZK8FR4fGjZLxcBqcldR1DnpTbTXBXXd5dOw50pedVtp0HdcNF5ybs3FZ0DQjFL65ijHnEKAbZ8
	DQezfb2rkrSy8odx8TnzIuQaSVOj0hd/xV/0z
X-Google-Smtp-Source: AGHT+IE+D5SeDqchp/24MDHXx5CQWTZci+ASgYtlboM+vs82gW00FOC1mk2B4v9sodvZwpxdBzPuFw==
X-Received: by 2002:a17:90b:3a87:b0:327:c9c1:4f2a with SMTP id 98e67ed59e1d1-327c9c1642bmr4975594a91.27.1756454576161;
        Fri, 29 Aug 2025 01:02:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327b01e90e5sm2191228a91.1.2025.08.29.01.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:02:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E8F6644809A5; Fri, 29 Aug 2025 14:55:28 +0700 (WIB)
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
Subject: [PATCH 10/14] Documentation: smb: smbdirect: Convert KSMBD docs link
Date: Fri, 29 Aug 2025 14:55:20 +0700
Message-ID: <20250829075524.45635-11-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829075524.45635-1-bagasdotme@gmail.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=bagasdotme@gmail.com; h=from:subject; bh=tVZea1ikNA4Sssls4g09ZchJ08JhUaFOY8Mmt8T2Tzg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkbY15VZXUEfpV/XXVSre/C87lNIRyCV5IjnItu7ShZU PiphvtYRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACbSt4OR4WixGWdF367Ci0f0 5/VHVx3YxHrvMF/c3LtfDf1enBJSvMrwV9hALHj9kQNbWF8l9WcGsahNXW7scuzOjYlmr0LWbpu 3gQUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_010257_094263_DC3C00EE 
X-CRM114-Status: GOOD (  17.22  )
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

Convert KSMBD docs link to internal link.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/smb/smbdirect.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/smb/smbdirect.rst b/Documentation/filesystems/smb/smbdirect.rst
index ca6927c0b2c084..6258de919511fa 100644
--- a/Documentation/filesystems/smb/smbdirect.rst
+++ b/Documentation/filesystems/smb/smbdirect.rst
@@ -76,8 +76,8 @@ Installation
 Setup and Usage
 ================
 
-- Set up and start a KSMBD server as described in the `KSMBD documentation
-  <https://www.kernel.org/doc/Documentation/filesystems/smb/ksmbd.rst>`_.
+- Set up and start a KSMBD server as described in the :doc:`KSMBD documentation
+  <ksmbd>`.
   Also add the "server multi channel support = yes" parameter to ksmbd.conf.
 
 - On the client, mount the share with `rdma` mount option to use SMB Direct
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
