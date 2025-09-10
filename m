Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40201CAC587
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zU0jFIHvAJPPafbEHfCq3JPDMVdJhCQPpZv0e6BkkWA=; b=020gpzrElF0aK6
	nJI4VmqXF03rAH7rTSuFW7W31P1NsWnhPWSoR+vxUU9b52Uwew1HrJ2L/oqkZqVRCMUlsOYlDAeF6
	5MQ2PY+ILNakNtpIIzSwjo8+wTGBA9A2U4Fd6svbND4Fw1tomhSYmAJjv69Rk9uoxIazRPE3JiG2T
	QZ8au0DUC5J7dF1dKi1QfNhoXy8Y8y2tvaMZAczuYAYjkmAm2vNeMDUGCtTQh9e249buHbz28aOZD
	rDsAsbnTfbjKvq/kgSghfLj+xT20anluIh85MVYc9/yCx3LI8k2P/Qg/MAHEyY981XQWHlfTjuXvY
	CxUhv/178tHaLpPwLy3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAwB-0000000Bkp0-2Tjf;
	Wed, 10 Sep 2025 02:51:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAw7-0000000BklZ-2rn8
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 02:51:57 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7725147ec88so104558b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2025 19:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757472715; x=1758077515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2TiZwTLryn0Z2XdO8OaBNvuenSuTUZNT9oHE0TAuq4=;
        b=EvNbBxAPy2nDOV7IIjsVv3zkYwBu+uC6ow7Tiv0wjrZFmdo48290UVry46s7EJ4fRd
         5L7lvjXKo+g7x5uVDESKCqXd3zOFwZbALYerNbX+q1T821I/2Df1dB4YQB/hpqOkTL3R
         jnpvaL0jQdXiTs3CFy5kIsfe6R7WlhhYtBqn3syVhOddlUrhhILbpPs7Dla6AB71L3jm
         VrUQ1ExN5vkFtQKw1BL3k7vD4nSYMyddBPRwk06YIxr8cW+nogdVyiVs2wBl+V4TCebB
         9yd6y2NF2VfU+d/VF/D3eM0YdJhG2FBBauTXSNHItbVM3c/QJzIm0Iv4vMnOIVMyVLAZ
         WKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757472715; x=1758077515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2TiZwTLryn0Z2XdO8OaBNvuenSuTUZNT9oHE0TAuq4=;
        b=liGpsxl/iJegoMV4PbpCa9hlOwvoGG3IJJMc0FkRxmr6ZlTmnV+EALcZEArLLQV6CK
         MKY8HTtq6zKVBhLooJq04PrxQftz6P92wJB4+dPQoik1kOkYaZ98Yx9yzfOdmLM26Anl
         5XgU5+96pr6Jqb4ld0+cWnEAARnYbqcIfCEPSTmf3CiDGQ0B2dA4YCuT1DgxfQbtBreK
         609JODZVpIDUvuH9vN6EV5TvGBdfgDZdaY8CLUeCw0TPtF+rCao9hbXCkkoCXyVc65T1
         Zw3GVDr+PRPoVeAnt4wvdx4Lc4jRKVqTJff4NnN4UdtxMwTqkFvyXcvVWyTiIgfg22r1
         kulQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYj66X9NKCdXyKdjZvCSveLX9ZiNPxn3PBZpoZPGKRLlKo/ASOPkkLd5CuXjmaORIDdZZ/4qWt+6I=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsM2U6LDyiBmkp1b4tkAczLZl377M0iY+bKaLwyiX0xHRJcReR
	v/WYmcPSv77oz5RPxPpA4uys0tvYbMXVfWqmfTd2/gpwVHO2CIZ5xwZ1
X-Gm-Gg: ASbGncsfWooxDObDXBArTAADmnuHfdrsPNY7Z8+oSvSVPL3PXNx/UR1q5WiO4NxMhGj
	Yao1ti4YwsbKoWhFSKuqkYHF6VtXUISNP6y3+dvG1IiAnPn8FvuIXybG+pDCOqLDSBJuU69d/C5
	JIgdM8Fe9PaeSFj8pVqjH2Wc+NtgY28c4TnIoFu814JqWRHuEGEq9EfucYwfHqywLdrf2icB8O8
	q5dhahjbXOeSGISt8MSdd/LYvj+Tye3pp7TJ6NnnSqErkoFvOKZmPXNsNPN2lqVUFAoLcNU1E2O
	5fvzAFJRwyp3B89AaZkVwVmMjwqZTAFtegpTV/wr71pE/BoV/1481PcrL/9mkiv6it8HSLiCsBI
	5eyBieIGhDb7tR/Jaaa0atYc67rFybNgN4K5A
X-Google-Smtp-Source: AGHT+IFTyhfnUg3CqVtgOKW3+2pEfzFWWNjw1TnoTWF2WDPCy8Lg+0w3QYglyJRg7NnUo5SJL/6TsA==
X-Received: by 2002:a05:6a00:882:b0:770:4753:b984 with SMTP id d2e1a72fcca58-7742e4bf142mr18186197b3a.16.1757472714666;
        Tue, 09 Sep 2025 19:51:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77466293757sm3470498b3a.63.2025.09.09.19.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:51:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F395041BDD47; Wed, 10 Sep 2025 09:43:52 +0700 (WIB)
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
Subject: [PATCH v2 11/13] Documentation: net: Convert external kernel networking docs
Date: Wed, 10 Sep 2025 09:43:26 +0700
Message-ID: <20250910024328.17911-12-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910024328.17911-1-bagasdotme@gmail.com>
References: <20250910024328.17911-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4165; i=bagasdotme@gmail.com; h=from:subject; bh=3KTOccWMzr8DxZPfBNk641Us82FbHT4BEw3lrJOsNTs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkHniglPN1/l+G0b3W08+an+40OlbWa5hi83XTh+GX/4 C8C1xeFdZSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiBZEM/4u927OPq/vretv+ eb/f6YB5Kk/Laj31K1IKboVhiko7uxj+pxYZGDy7rZrM+OWh+Y5vk3hP+ti0xKVJLGg67/x7TvV +PgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_195155_729579_4894B036 
X-CRM114-Status: GOOD (  19.23  )
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

Convert cross-references to kernel networking docs that use external
links into internal ones.

Reviewed-by: Arthur Kiyanovski <akiyano@amazon.com> # ena driver
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../device_drivers/can/ctu/ctucanfd-driver.rst       |  3 +--
 .../device_drivers/ethernet/amazon/ena.rst           |  4 ++--
 Documentation/networking/ethtool-netlink.rst         |  3 +--
 Documentation/networking/snmp_counter.rst            | 12 +++++-------
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst b/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst
index 1661d13174d5b8..4f9f36414333fd 100644
--- a/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst
+++ b/Documentation/networking/device_drivers/can/ctu/ctucanfd-driver.rst
@@ -40,8 +40,7 @@ About SocketCAN
 SocketCAN is a standard common interface for CAN devices in the Linux
 kernel. As the name suggests, the bus is accessed via sockets, similarly
 to common network devices. The reasoning behind this is in depth
-described in `Linux SocketCAN <https://www.kernel.org/doc/html/latest/networking/can.html>`_.
-In short, it offers a
+described in Documentation/networking/can.rst. In short, it offers a
 natural way to implement and work with higher layer protocols over CAN,
 in the same way as, e.g., UDP/IP over Ethernet.
 
diff --git a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
index 14784a0a6a8a10..b7b314de857b01 100644
--- a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
+++ b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
@@ -366,9 +366,9 @@ RSS
 
 DEVLINK SUPPORT
 ===============
-.. _`devlink`: https://www.kernel.org/doc/html/latest/networking/devlink/index.html
 
-`devlink`_ supports reloading the driver and initiating re-negotiation with the ENA device
+:doc:`devlink </networking/devlink/index>` supports reloading the driver and
+initiating re-negotiation with the ENA device
 
 .. code-block:: shell
 
diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index ab20c644af2485..3445b575cb5d39 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1100,8 +1100,7 @@ This feature is mainly of interest for specific USB devices which does not cope
 well with frequent small-sized URBs transmissions.
 
 ``ETHTOOL_A_COALESCE_RX_PROFILE`` and ``ETHTOOL_A_COALESCE_TX_PROFILE`` refer
-to DIM parameters, see `Generic Network Dynamic Interrupt Moderation (Net DIM)
-<https://www.kernel.org/doc/Documentation/networking/net_dim.rst>`_.
+to DIM parameters, see Documentation/networking/net_dim.rst.
 
 COALESCE_SET
 ============
diff --git a/Documentation/networking/snmp_counter.rst b/Documentation/networking/snmp_counter.rst
index ff1e6a8ffe2164..c51d6ca9eff2c7 100644
--- a/Documentation/networking/snmp_counter.rst
+++ b/Documentation/networking/snmp_counter.rst
@@ -782,13 +782,11 @@ TCP ACK skip
 ============
 In some scenarios, kernel would avoid sending duplicate ACKs too
 frequently. Please find more details in the tcp_invalid_ratelimit
-section of the `sysctl document`_. When kernel decides to skip an ACK
-due to tcp_invalid_ratelimit, kernel would update one of below
-counters to indicate the ACK is skipped in which scenario. The ACK
-would only be skipped if the received packet is either a SYN packet or
-it has no data.
-
-.. _sysctl document: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.rst
+section of the Documentation/networking/ip-sysctl.rst. When kernel
+decides to skip an ACK due to tcp_invalid_ratelimit, kernel would
+update one of below counters to indicate the ACK is skipped in
+which scenario. The ACK would only be skipped if the received
+packet is either a SYN packet or it has no data.
 
 * TcpExtTCPACKSkippedSynRecv
 
-- 
An old man doll... just what I always wanted! - Clara


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
