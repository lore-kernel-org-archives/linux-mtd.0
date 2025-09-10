Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36041CAC58D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdu1jOpGadYiYKUW9ogkfW03gDuJZl/v4bRJm25zgTI=; b=O7UTWyCo2R4TpG
	trK8xCbmrQ+IMjSctoppntY6Rw4czgLBf4AV0SMXPzTNvp+DBADcTOkgF2qhaYqGX/x7wXnh21zoA
	bqMoVvGCzEipDNfEosQ/YK8j7z8Dt3cY/LxkTCfy9+4oZC+ggCdYLkQ7BX0eDaJIW1vHq6ImruoDs
	p+0dxNjAM7R/82Nk8lpxsZlXS8oqQImZi4qByvJMJyBwyAxWCeoFastEj3T2USuEx0H6auU1l1hDA
	jLKYFqSrfaEdiO0acKdxQDCbyx2VWdAmlifbGQYKz65PqQgycjfWzlZtafH0CxNvvD94CLi1K2ncZ
	hBUXxqW48Bs9+icEOMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAw9-0000000BknU-1vCQ;
	Wed, 10 Sep 2025 02:51:57 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAw7-0000000BklL-0n66
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:51:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b4c8bee055cso5374227a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472714; x=1758077514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdhbTSK6p9ht0YngyCDiyyRtcLCfpgxS9tGDrcGiJGs=;
        b=WC/OY9kzPDl7iwqcahXUoHczgdmRZTiwgC4gNkw9dvl7SvnD+TSldfTzgMC7kBVV92
         LOGVSizhSmLcFP+LfMhsT8ZGL5RTKQOgobm0GX9oWHUJ8IrA7VKbIcmVoOZOv+Z16N9w
         XiGOxNpyT6EH09kpaZXAhLhZhjUsw4oxgtKGxWbIafeU/MrP1LiE4kXx0zaj7WlnZtLg
         owG4KK1FpcDZOcRJ17i87efax0qlhieBU8ykiHIEjsNfep2x2h0oJxlqO5r+v27z+RUF
         6Jfj0TxVocWi9JmjzQaYjxsKVBH6GZD4lHmInLtlDRRcQEcElPAxoiDhz+QGUg4APrcv
         auNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472714; x=1758077514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdhbTSK6p9ht0YngyCDiyyRtcLCfpgxS9tGDrcGiJGs=;
        b=ClWxoO1kG92W62TaVgIkajTnHEhMc30uOx8uq3E8M+/lXWRcjGBoHVpJArN6UsYpf1
         SgQl5YWzZlN7v1XY+tyqjKbo9AWodiPiRCnyPyeIXKR6xjFhlYZ8QywnEUJ/F68yvPtc
         BrPqwlYX1sanvuky2I9d91DwRTvXbCTBuAk1KQQDRp9lrJuyjaxbDQW8AboerZyY2br1
         9fz1v5QIMC3oKaYmSLtYriMg3ulzwpoeCUJm+nBxl/rAuuqtJiRCXVpEMyJvMvBCW5xH
         HoEDphKymcbUlP2rXLwYkbgj41DIhyt/qqrazoDPgWyaP/JOmTcg8FGq7FplN796x5Th
         ijyw==
X-Forwarded-Encrypted: i=1; AJvYcCU2Vd2Hi/D2IhjC1BQ+f5ApKutXvSvkYShhUvjCMLfRaJuJeK3h2pzL+LGGA4HjXYPhokZKpFQmMHs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgRwi6qIahHH1IITOo+BFrfOasBEyH46zPmA0PAg2IM1dpwHhq
	B7Kd3fkuj/qCFlp7ePcPiLpCOwqhS+CpEdLwBm2goX8MpM+gEWzGoF7h
X-Gm-Gg: ASbGncu85dvm1JnIBmMq0405gPO4NmK118Li5ry8ooyfeP05BXm49tpKJwW+3vl2/QP
	0GHn9vWz6Tt2Ro9ipJ+0BzhAh1WO59ydPLI5M8r/pA6MtsmVisRhYTO8k4YUfHfEC8Wl8ZUlaFV
	GrGChaqTs65YAeVNbv+NNDoYcmkJLnjwT2TQd31IDQsmCGWBLfWIAHs/7Hv/AkIUJAcom8iLl46
	OF53abJajERHHkWwwE4vQsLOdK47G21rPGOhwX3fTMGyneK6L097FcBKuMyw/3rnLgz3Z16bfWf
	REZix8k6nRPDYACiraRr40iLfjyaEUkkDChFYT4IzIr/H4PNUdxwDoBOj/KwZtcnqnF2gipZKRn
	srGTYaWJCDpF8SvpWVphWzY5g6A==
X-Google-Smtp-Source: AGHT+IEB/m099LrAl5yQVt4L0Nzl0jupOns8XwrHabjqcwIBBCUNyigNNYELdZPt4mBJxRKyTxzUaA==
X-Received: by 2002:a17:902:da82:b0:24b:2b07:5f6d with SMTP id d9443c01a7336-2516d818031mr154485025ad.9.1757472714167;
        Tue, 09 Sep 2025 19:51:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbb032dc6sm679647a91.0.2025.09.09.19.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:51:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DC0B441BEAA1; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
Subject: [PATCH v2 10/13] Documentation: smb: smbdirect: Convert KSMBD docs link
Date: Wed, 10 Sep 2025 09:43:25 +0700
Message-ID: <20250910024328.17911-11-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=bagasdotme@gmail.com; h=from:subject; bh=tVZea1ikNA4Sssls4g09ZchJ08JhUaFOY8Mmt8T2Tzg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnihVZXUEfpV/XXVSre/C87lNIRyCV5IjnItu7ShZU PiphvtYRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZych0jw9MiYfOuPx0mkkFP UiIWTa/TFphmY/DisofsPrHQd/6Zwgx/paxTd1xaG72+5ivH8bnS+nm3e6W3try5uGL6W3UVsUu 32QA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_195155_225992_7A7167EC 
X-CRM114-Status: GOOD (  17.82  )
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
