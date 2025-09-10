Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD1CAC582
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fm2h8V5Ruejtps9dgNjfX2iHgMRfcEfrzfgHBeSk25A=; b=iRyPklN3IzWUeO
	7L0AWj54QTWy1G17AreiHNp+IaanwmWT+9Ago8PvGDD6EO+VGY0ngZh7+fDeLRrYrBMoi/r/PS/cY
	puCUMx0xavSXcw/3xNYvbRneHWYeeAgMmwnjctx7uvazs/r90AF+sbuurif+XhyRlPd/QMLfTN2TJ
	Y9QgT0i4nXnZ4qlbDnMCEVTEoOVb4t0ldV3XImRYzDdzb7IAfrJ0J6CCBmSsAepTZ6KU1DEa3c8wy
	HNZPIzx5jvvP0mHpVqJqheogaY9NWF333fAjMsHAYyysCFv3Iy6gAyLdrjQv4vVYJvKdJp2jbH983
	i4lP+69XpZApBIrPPjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoY-0000000BhpT-1vgw;
	Wed, 10 Sep 2025 02:44:06 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoT-0000000Bhhh-1nVl
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:44:03 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b47173749dbso4360490a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472240; x=1758077040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isRfEajvq74JD8Gx5JZkbk62qSgMtw6IJwcPrIolSGc=;
        b=Txj1HRMq5WJqlSkuG2b1wEtdcKZYMGLtcCeYK9JeqqeeX7QcOme6wzZV4yhoHp/+fB
         /m7AstYTIp5ZBOOvqFHYk+e7WqEfkEF3NJI0gmAULVHbckB29iIislKO2SBdINNDIfSL
         FkQHmthwyJI4TfuBQWW2WiBcoPRxO8qRa5sdgshjKJp52uDif+iU13lnXKl0qXapNpgn
         g5p/8RiBGAqi5zy3ZZMg08bTvQSC2FysZYxjNyCQREmfWYj7GrBraiSJ5+oie7o0sZrt
         UTop4M6Nil6D5gT3GByxareM1IgvSpFpZ+kZenpIt/yxANQf+ttHS3dhthS5tF42HXX2
         7ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472240; x=1758077040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isRfEajvq74JD8Gx5JZkbk62qSgMtw6IJwcPrIolSGc=;
        b=wsAuqgnyZ3TICq0wIGj0/z95ZbWI9EHDtWrmd2+xuJPseKYaJsslOebMSUEfQgxgiU
         /C6cgnQhzA6q3xYhBIb6NSXPWoKHW+eh7m6KwcDf4L2ljk5kMVwQ+14rqVhM2R4s1F7+
         9b6W9PErpb8dfjTRCpXAv9GJ27bCQYDJ6OBLdWqckAoe39rH1XLhJi0qiiGC/rC9yTm8
         Je3iryt+ieGQHOV95Ma4GQGXJzPPlhRWKA3Lt7WSlHqxBMz9Ee/AiqREUfweJFvaab0x
         d88uerYivCj8a3DjKMOYNmVFA6g3w61IAE1NDniTggD60hPkeXm6HoL2qTHKKxwVeU/m
         aeMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqYmTQnIx+toDe45en2EsFyBoVhN8J4VGvpVxfKogmATB4+Ky/v6H58/moj4G6fO4uRgY9qDinNcI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEW79zEoZ3hA7q094841z1xjgoCJV7MTveoScl957PGzpZi2cp
	4oRcwWOZZVWml3OumstWMii+8q4+510aDlv642fXRQJ19JD7LBbsImoy
X-Gm-Gg: ASbGncssLD47AhtcLB17+6AEhLrcteXVUmLShqYr90OBCf0wSuFvCCtxv4Plec0AS7k
	cnEcnNzd+Ey6FAh7LaBrpq3lqs+xcivioP9tD2gc7EgEfRlWcHr6grxwFW1FcFaSCQMmPKEzN8n
	iqs5Fe/xSY4GK+0eyR1r/ka67Px9iR+HFgQ0+XCIMJqV31TtA5LZ/6PWxuuYTeF0kYfBYDcipH2
	4MatkG2qtQwbxxeMVqzgdJZCUlG5/n9xzpN/I/8R2OvKnWr8GOsUuY+Qa0q0e4DWKkOwjWk/RmN
	+Hs82jhLPOrSQwruFcmQyUEr5iJZXjqQtT8AqgJnwEc+r4+F4Kk4cmdSKXdN94mV/9HLAOWsHyZ
	5IDr690l9EJHoLsQguHr9W0USHw==
X-Google-Smtp-Source: AGHT+IFrrGtrsp5QApHqrAEsH4Lf99kNe3GTHl7qChWDynb5tQqdU4zGL9zb4NWW/Nh5w4cYNQSmBA==
X-Received: by 2002:a17:902:c943:b0:24e:8118:cc2f with SMTP id d9443c01a7336-251734f2edcmr195946635ad.59.1757472240373;
        Tue, 09 Sep 2025 19:44:00 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2ac085d8sm10840225ad.118.2025.09.09.19.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:43:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 4B76441F3D85; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
	Jani Nikula <jani.nikula@intel.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v2 04/13] Documentation: amd-pstate: Use internal link to kselftest
Date: Wed, 10 Sep 2025 09:43:19 +0700
Message-ID: <20250910024328.17911-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=bagasdotme@gmail.com; h=from:subject; bh=Rg8Js/mQ+ji0aVDnd3uUR+wPkIV7f8cZoyAXSG+WzrA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnihuCjbtUDpafXJnbOHtXRdvzJjhG/D0b9KEh6svl Jx1Ocjf0VHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJSHcx/FNfPsFU6huDt7vJ kh1V1uZRLxRT1SOqp3E8VV6+6XDdK15GhiW/r34XtloUdOCT982MLd7bz2VGXmhWZatxbn38c0u qDSMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_194401_490957_C57F32A1 
X-CRM114-Status: GOOD (  15.57  )
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

Convert kselftest docs link to internal cross-reference.

Acked-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/pm/amd-pstate.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pm/amd-pstate.rst b/Documentation/admin-guide/pm/amd-pstate.rst
index e1771f2225d5f0..37082f2493a7c1 100644
--- a/Documentation/admin-guide/pm/amd-pstate.rst
+++ b/Documentation/admin-guide/pm/amd-pstate.rst
@@ -798,5 +798,4 @@ Reference
 .. [3] Processor Programming Reference (PPR) for AMD Family 19h Model 51h, Revision A1 Processors
        https://www.amd.com/system/files/TechDocs/56569-A1-PUB.zip
 
-.. [4] Linux Kernel Selftests,
-       https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html
+.. [4] Documentation/dev-tools/kselftest.rst
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
