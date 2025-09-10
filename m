Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475FFCAC587
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tc1buf3OH3Np8wsvcqmYJzJOp5yIUrA3lkEZ1cXftWk=; b=k1q4E/DYe0bN5l
	ZGF8cgoa4gjndvisFZhVEAkvTky8NlmSrWTVoLxqf60RzaaNPgR4ibt4BQxSxuCZiXwfwPWaGxUvL
	utGmLJcxgO3s0hPlWArgJSy1lAZOrjMfvQVmzmHC1QrDa1Cy3ZW6pHVnfSt9QyHGC2h3fiC5HdKuN
	Z+a6uLoTlAzVu+4ExTOiw6mBh9sNWOxg30jsf2q4DWA1mC6X/AljWOmR8QnGJDyjOhOiqukhwClux
	FcoeiYKtp4EVsqj1k4XvequR9zgrqICUnCtqy44QU3QQxs2LTTE9CxX+j6IfW+uwnBLRk2ck5hlU6
	2L26MugyrM+H9zApV5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoZ-0000000BhrU-1ghm;
	Wed, 10 Sep 2025 02:44:07 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAoW-0000000BhlJ-1CYX
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:44:06 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b4c9a6d3fc7so3799952a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472243; x=1758077043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0koFSnJrv2UowuMhMeqtiJIslvN7BbZv6mHXQ/mKo7A=;
        b=LjDemJuKWMIONJoYN1PePkmysScQlRyxUm6VfuN7eNW4/GipmwncEqDlqxjddSFn6B
         1Ywvs4bEfYiunQRUQd2nlZNx2DghPDMaIioA9+L57gdsLisp+BDXPZm5+nsCMvExTtce
         tuIuwI7yyo+dvjIgrQhV9tXZ7b5yZYI4K45ygY4pwZdsJv/sP/he07P/yg849c+/pP2O
         uY4PIbDR4EMh0br8WKwxNahHUR89W5shnbVvmmNBVJ8CAjrY5YnlSM6C3zskwqdYKSpD
         QHv7mD+6tKLtLVWtPQ76r9vM8Mc4ddVEgJdRyNTgOXY3ohk5jsxtINJxvEKpTq+CPaCj
         u69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472243; x=1758077043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0koFSnJrv2UowuMhMeqtiJIslvN7BbZv6mHXQ/mKo7A=;
        b=nPNmZC+PvjNEDQBqTRf0b6FOeCgxkdDSyGhHR241kd+/D4zgDwPWXyd9F48OEFrhe3
         EMPyA3AfaiFm/3qcrKX1BVJHoxvH+F4uAGdY9I9TleSNTQlEt20HHwoUz1i2IZxPzWvx
         O71Qc2huCN8cwpCSucrseTIA1ZaUo67H6K6EM8+kz5DDu9+uwbYvxzkuMldrvfVlvUAb
         Bx5xQgdUlR1Wgtn1fwvwC5uIupzV+J4T6qnYbNTyUDB3elmkRkZqfVQL98noaycz4dFC
         a9N7HfekYWq/DWyVYhHhWmZLJDTt6JiSa1gDAt+JrMBwMrNm1x0bcmPuWLZOjv65RFcR
         6F4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvjtrvy2BNeotkfqXPW23rx9tAXNagQpUB2wwj135uYjelu6hKx0E5NoVHYdlbEt+9kWdo97P08jQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAzzqLyZaryNoe4zOV5t383yRc+P2uHWSIsl6AdOkoyYB+qC61
	6blgIG1/Ys0RS0xiFbS2s3TsXKnEXOmIvfFfcOKviMR/icXIJqqswgDm
X-Gm-Gg: ASbGnctdg1ej+mzNQHGydGIaoGqS44v5uX9NnLXu6IeCKaWigQXB7zXKxT4CUVnq2eN
	lLeMjLfVra+l9+vto3jmW7cFcEuFhyfB3j5UBV3V+PE2fDYWRcZRMbf12duCJO3JZ4YKdNYI65W
	1e47u52Nx+AM65bRXFiCcm3ovCC0xDYhwxcXBudON4x1FKU56F9kNmzOwuKCuRmp9hTMzKTZg9f
	+QlxqdgNpgX4w+B1ckIefZk9XvyVBPxuOAlwnBaztUg9h9L2Ui778siqBrEtcIjhF0E72Rh0IhL
	XcOgXD1WUxEXSZ060P2v+wdOv7DFfs4bTVX3QwRVwjU5aac/d5NPto/vMWPp2KUY/G/WTKu+wUm
	YwM9UWVVrJ/mnexn6uSdw9fFTmQm90GNayLpC
X-Google-Smtp-Source: AGHT+IHze3NqUFgqDMM+sZM9Wi/Xmfyi7sD03WA5eGHes94PFV7I4KKOuKIIQBvLXj+TekGgIh8lMA==
X-Received: by 2002:a17:90b:1e51:b0:32b:d089:5c14 with SMTP id 98e67ed59e1d1-32d440c5edfmr18323077a91.35.1757472243321;
        Tue, 09 Sep 2025 19:44:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dbc1c467csm201563a91.7.2025.09.09.19.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:43:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3876D41FA3A5; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
Subject: [PATCH v2 03/13] Documentation: perf-security: Convert security credentials bibliography link
Date: Wed, 10 Sep 2025 09:43:18 +0700
Message-ID: <20250910024328.17911-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=bagasdotme@gmail.com; h=from:subject; bh=OYt2QegR/+u0q3CRKm7Zg38q7SY9D/3L6tdzv43Jflg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHnijWLH+uxHuD5TvzhcJo65MVRz8evf+ht/Kg8H3eu d3xR8redZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiXd8Y/pkdXvTh5u5HL7eU z3No81zweEv6gxSt+G/HWyxWsM1N7zjH8E/xHeNT5tNsutFpemIVy+M+5pasa5QSXynjZOFf2v3 OnBkA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_194404_330246_61067BBA 
X-CRM114-Status: GOOD (  16.03  )
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

Use internal cross-reference for bibliography link to security
credentials docs.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/perf-security.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf-security.rst b/Documentation/admin-guide/perf-security.rst
index 34aa334320cad3..ec308e00771427 100644
--- a/Documentation/admin-guide/perf-security.rst
+++ b/Documentation/admin-guide/perf-security.rst
@@ -311,7 +311,7 @@ Bibliography
 .. [2] `<http://man7.org/linux/man-pages/man2/perf_event_open.2.html>`_
 .. [3] `<http://web.eece.maine.edu/~vweaver/projects/perf_events/>`_
 .. [4] `<https://perf.wiki.kernel.org/index.php/Main_Page>`_
-.. [5] `<https://www.kernel.org/doc/html/latest/security/credentials.html>`_
+.. [5] Documentation/security/credentials.rst
 .. [6] `<http://man7.org/linux/man-pages/man7/capabilities.7.html>`_
 .. [7] `<http://man7.org/linux/man-pages/man2/ptrace.2.html>`_
 .. [8] `<https://en.wikipedia.org/wiki/Hardware_performance_counter>`_
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
