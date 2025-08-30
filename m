Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DB5CA0FFE
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Aug 2025 23:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awVBemkMdQTquSQe7o7pQHUsRatT87RAVvXvetYRYxI=; b=MLcjgaT7IHU7EUCuxN4MBIwPcd
	ucQZUuSSafn1DSr5T0+s3rkpNxLNt+adL7UvadvHengcfXzW2LvK5eg0eH7uFBct6OqaI9rBPh4Zy
	PnrpCVwWkAnBKaoLwP4ciPbvWZRTZ8t0hzujXESs7bKP1yUB/b+qHgUDNC87hN6GRsPqSxZb8xk5m
	7PLI2kte0qcE/bIP2gG5OCbsTL8t7D6d08HKYuiVDZ3+eJe4IZj0PZV9xuu39xMUuYVdZ0oisfPeW
	nJnTTz6im6FUF2AXmLAbpXMgEzZ7u7F+rjT+HCZmcIMb4nWuE+KjBXoR2OGHf7KN61XSYEIaSsxdP
	vpcUXZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usUjQ-00000008WS9-2tUa;
	Sat, 30 Aug 2025 23:11:36 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usUjO-00000008WRm-1yf1
	for linux-mtd@lists.infradead.org;
	Sat, 30 Aug 2025 23:11:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b471756592cso2114199a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 30 Aug 2025 16:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756595493; x=1757200293; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pKJR3d1y6/pE646jp/qQ2LVHmuXD7qWjBS7Rpy0QVAg=;
        b=C/K3XZg75aCE76JPNtQxxnNzFAkW1Fmem2wO1gKNBS1ivKEraaAgeKamo4sQlvDRrJ
         rXUF2UKxLyN9xWm02fWUgP3ZpLUafEhJRPeMNMbYMYIVjx2K8/MXJthR1sYR1HTAu2wL
         ALqh8SFoL8zimbAA4RIDD1XJRU0F+AWo784ui1r789zvez08ARy/Q2DPhnMBXgY1eb2Z
         nTf7niVpkjgYAo9JT0+vhxsJmJf4ajsdnVK3MCrx7cuX1TigVsfycuFH4z5leMkQYqlS
         ZmvuOpgRl+CLT0/ZicHMUvnv7v82b3Lfv43Wlj9gjKpFN2V6Cc7k7wprgHYpbk5DY4hC
         ukYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756595493; x=1757200293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKJR3d1y6/pE646jp/qQ2LVHmuXD7qWjBS7Rpy0QVAg=;
        b=SQFe80CBfb/Ur+Qm7wv9W2yMTb8OaJ0mrJaze9kmnOapuR/PvGwPlqDgG6xInEHaDu
         foH7RjJ6J6V4OIuJDUdk9p4ifxskHHPcIiVHOo47RyZMbvY7IYETHnpcccAvERaN9rnG
         9bEUsE3kKeolxq+PTPtO1qIuUoN9Nw4tKozQc2FtQq/GeasjFJD23ptLPrs70icU84n2
         bhYkkiDT6pY21OGqN45cccTONUgkG9lkCLdSkHsSNPXJvW7KnOloSUXpZKUhizRq0iHJ
         HEh1LBdTWnvFYQXYeQBdooyHxzl6oHmSOqqInEry+ST9vcGk/WeqEC0O2QT1DXAPt1Z6
         0uvA==
X-Forwarded-Encrypted: i=1; AJvYcCWjjuo0KT/6Xipl2ll5xFccRDcDY5Gk6ZchUq+/vj/SFXdZMoJdI2ZUY1mUPEttaw3d1NFx4t/3QR8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXULYiDcExdFUgc/RBg3SUwdcGL+XF/OYoSeS/rlxpr3P6t5CA
	uJ3DYLLyVsspMagKpjUloZXUZMlBqD5ez0gM5LgVex+p5S9U3ndicMm+
X-Gm-Gg: ASbGncv7wfCFvJtxOP3mRvjvXf8EGpCDD9PlLMjye2M55TnmlOv0nJFHLsj/PbR9F35
	tFUVTmzos9LUe4IGzWhID7drQ46wdF8jzMUhuNVvX7AWW+ue37LvHVTp5VZlcZzwIGMlM5EEWZV
	DYt1+cYYxVtqFJ3M2p/CrtfMeBDWt202wv21zlNGNz8rW6j9ucq1wJmv3t2uC24wUa+hRzwVUdR
	L9/AGgzlOhMLBRmFF9iyeo1UFteqimK31wlYLTg46rinnm8nfhSqFGHtu36TQDh2BO2U4dM/lW2
	WllB3djIU1Y5efXvjVTyHRRWcK+3+FSgaqfkeVY68LO/OExnmr+FPdfv6saZHdfOBR/r+BDhgdi
	xcUlzWVWklBmys590LHPIdwAbfHDngYuL/O9k
X-Google-Smtp-Source: AGHT+IH09TdLkBTBS46a9KkDQcsPHCKV5BjcOl3BN1JIlX/axUWBHc8jxps5fYfmQWtY+6vT/lzr2w==
X-Received: by 2002:a17:902:c952:b0:248:cd4c:d6e with SMTP id d9443c01a7336-2494488a679mr39782015ad.9.1756595492940;
        Sat, 30 Aug 2025 16:11:32 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24906395aa0sm61840295ad.100.2025.08.30.16.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 16:11:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3F63E4222987; Sun, 31 Aug 2025 06:11:28 +0700 (WIB)
Date: Sun, 31 Aug 2025 06:11:28 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
	Linux Sound <linux-sound@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
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
	Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>, Andrew Lunn <andrew@lunn.ch>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexandru Ciobotaru <alcioa@amazon.com>,
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Steve French <stfrench@microsoft.com>,
	Meetakshi Setiya <msetiya@microsoft.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 12/14] ASoC: doc: Internally link to Writing an ALSA
 Driver docs
Message-ID: <aLOFIEknbxQZ6FM2@archie.me>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
 <20250829075524.45635-13-bagasdotme@gmail.com>
 <20250830224614.6a124f82@foz.lan>
MIME-Version: 1.0
In-Reply-To: <20250830224614.6a124f82@foz.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_161134_515053_E4423682 
X-CRM114-Status: GOOD (  19.48  )
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
Content-Type: multipart/mixed; boundary="===============5779794654293183950=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5779794654293183950==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q50L9+H94gXo88jD"
Content-Disposition: inline


--q50L9+H94gXo88jD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 10:46:22PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 29 Aug 2025 14:55:22 +0700
> Bagas Sanjaya <bagasdotme@gmail.com> escreveu:
> > -Please refer to the ALSA driver documentation for details of audio DMA.
> > -https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-als=
a-driver.html
> > +Please refer to the :doc:`ALSA driver documentation
> > +<../kernel-api/writing-an-alsa-driver>` for details of audio DMA.
>=20
> Don't use relative paths for :doc:. They don't work well, specially
> when one uses SPHINXDIRS.
>=20
> The best is o use Documentation/kernel-api/writing-an-alsa-driver.rst
> and let automarkup figure it out. As we have a checker, broken
> references generate warnings at build time.

Thanks for the tip!

--=20
An old man doll... just what I always wanted! - Clara

--q50L9+H94gXo88jD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaLOFGwAKCRD2uYlJVVFO
o9MMAPwIm+r4BZdTF0jZV4Naj+z2WrUBji4gRFJQ4f97vYNhfgEAwX/UGgC71a9U
lMJHF+utPAWnldcv9PoyPOBgO71EEAA=
=C7rV
-----END PGP SIGNATURE-----

--q50L9+H94gXo88jD--


--===============5779794654293183950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5779794654293183950==--

