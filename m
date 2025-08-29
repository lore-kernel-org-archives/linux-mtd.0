Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17530CA0FF0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xlkQEcipySbQqGQkL2bBYcKOHHoEksILqH15emy4l8=; b=j9kiSZprL2B6wdMWHuz0Z68w1T
	nAl4uSR3Ud/9SueiyHmD1/dgFiwpIs9t3Z10GaLB4U2stRf8WcNMND4H8FdJqXn9w7QPNSdvxlJ/E
	2YAQyuFXm8045M2ipYIdZPR+5pvbS0epeVQnJ//prdwPgbbHon2qNBocOTkwtOHqtYp+66m6HQtT6
	UKfkx6wBiUDQZ2Qcapn89txB/GE/J3JwOnawInuGXpn6FrpJ5F9d+4BolU/6Pg/YJ4UTtvc4F/C6p
	/RKjoCfrzQIRSCc/pe27JgwBtjg9/IfTpyiYwySBu401pYmjoSbMPHLtXFjVsXDqQQu7WZW/Oj6rz
	sWpCwryQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4BB-00000006gPq-0i1M;
	Fri, 29 Aug 2025 18:50:29 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0jw-000000069UY-0rYh
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 15:10:09 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-30cceb3be82so2023891fac.2
        for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2025 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756480207; x=1757085007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtU8o3RRKlATt1ZkDZoqGZInz4LA3xlvTSiKt6WYT3E=;
        b=fcJlfvx4fJ2TwubWbTOa2lPblFGbzFwzTGjD09ufaeYdbadkjcYwCU1ltjL5t0m2I0
         l9Q3mWf27qyTnjmA0T6ut3uDGurbjYyqfwwXkWkW/bI2qZDPyqCTBhIPpMG9KV+4C+oP
         7Fay+Fa8A7BuSqQXNUZ7SbhtQmZDQhMWH15J8tPYC8IpwoSKRZ1dPqjxCjDJLqpsiEQy
         CnYIB47kNZYm6Qa1A4dkLIn0BY30HaXFDITT3bD3Oca3QFaSHWLfg0OwQRG2ontLC0a4
         L6Do/n1QqyZdo3YlxTH4FmRV5ezH1KAJXIFC/0YJTiTg62EwyvL1oc4jxGnv51APeqpI
         l+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756480207; x=1757085007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtU8o3RRKlATt1ZkDZoqGZInz4LA3xlvTSiKt6WYT3E=;
        b=e7j1U1d5+arIQXZjEHVDjyWbB/11SuumsccQCy3Ob5Y7J9hi0s9S4QBgxHUBmY4NsQ
         M/Vp6qGRe0R3bVDIzYQz73xfc8HjgAsSGJtFzNfrb2voNs1ytCF79NCODsZ6CSY+Le5d
         ufLAvwCy+07yf9k1yTzwVxX9WQ0MfdSskh8p+mU7pPi7Wik48TYR7j4M2oZFi9Pyk5Ce
         8K/tK9R/SmaREl7bKRHvsABL4vv4MJ+v/hjpvdGAayRzr6M7btugbH/O2nundWM3xHsL
         Qnm/PDs0gAFJ01ChHhqC1RtVAgknGWPMR/fVwPx3IfiCJqswlB5izKrTTg/B25FaUCH2
         a8BA==
X-Forwarded-Encrypted: i=1; AJvYcCWEJ6stVXVFRFXkqpBxVV4ZF4daYOp0j9XWfumc6oauQUy4uJ25F4xseS9wKWhO7vpAsWJI76+51qQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBRBdYnh3ch/GVGjSZcnk8M1XfEuF/mgdUoqI1ywnS0rJeN/2z
	WiDXPqSkproQy9zPn81CfgDBMWufpFA/weHNEjZGEMZv7sg7LzRayODL
X-Gm-Gg: ASbGnctLPqyQ7gtF2P73WWh87UD6oztXuoW3OhA6QQyKRVPy3P3Mx/wQkKRtr+/qpN3
	l0UjljulqNicc+wS/27uT+YWFUHw2NjlSOAW6k4MF6x4ZjnnGnhgHa8gTeSp9S+4nRdjoPgV8St
	C4mHT84PCjYHgDyxuNNr5a3m/A2/yqLEg4FaT4k64ACsVApsSxLsC/Ds06PjyMiZrDpTN7rQjPn
	5ZsaQ2lt4h4LSPSMTfGnSXi3g0UDyB74mgsGoONLGY8LYib1ZYG1A8IuEnyL5CB3DSidDXjHCRD
	7W/WNW+94pY3CW0OxkiEgZ3ge1K1IEbP4E0Q+njfEhc3tD4vddvfxl8yovFjuD+naCWfa5tL53n
	vhvQa5tfgf/4T1sQ68Tbz/oiyuQ==
X-Google-Smtp-Source: AGHT+IHoYRW1dTyT65+rU4V7sdHQy1ZAWCnUhYSUduVJT7h6pncITh0MMXOlALcxWQkuMLP36zurpg==
X-Received: by 2002:a05:6a21:339e:b0:243:9b4e:281b with SMTP id adf61e73a8af0-2439b4e296dmr15525181637.49.1756473541271;
        Fri, 29 Aug 2025 06:19:01 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4bac60sm2408193b3a.63.2025.08.29.06.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 06:19:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 51DA0409D7C0; Fri, 29 Aug 2025 20:18:56 +0700 (WIB)
Date: Fri, 29 Aug 2025 20:18:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
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
Subject: Re: [PATCH 00/14] Internalize www.kernel.org/doc cross-reference
Message-ID: <aLGovx7OpL_85YTf@archie.me>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
 <437912a24e94673c2355a2b7b50c3c4b6f68fcc6@intel.com>
MIME-Version: 1.0
In-Reply-To: <437912a24e94673c2355a2b7b50c3c4b6f68fcc6@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_081008_260203_40EC4DBD 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: multipart/mixed; boundary="===============5273896442326749453=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5273896442326749453==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v+QeNeXg1wIV/8Z8"
Content-Disposition: inline


--v+QeNeXg1wIV/8Z8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 03:18:20PM +0300, Jani Nikula wrote:
> FWIW, I'd much prefer using :ref: on rst anchors (that automatically
> pick the link text from the target heading) instead of manually adding
> link texts and file references.
>=20
> i.e.
>=20
> .. _some_target:
>=20
> Heading After Some Target
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> See :ref:`some_target`.
>=20
> Will generate "See Heading After Some Target".

I did that in patch [14/14], but I had to write out explicit anchor text
considering people reading rst source. When they encounter checkpatch warni=
ng
and they'd like to learn about solution by following See: links, they shoul=
d be
able to locate the actual docs and section mentioned without leaving the
terminal. Before this series, however, they need to click the https link
provided, which leads to relevant docs in docs.kernel.org that its source is
already in Documentation/.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--v+QeNeXg1wIV/8Z8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaLGougAKCRD2uYlJVVFO
oyLxAP95mJgSRTOQ+hTC3+7/hjakAGgQRjyWnfFgZF9dKlXeHgD/bJRCDtPLAnbQ
JLSf5TwAGdo1LgUd0wgEgetqhpMKwQI=
=82dj
-----END PGP SIGNATURE-----

--v+QeNeXg1wIV/8Z8--


--===============5273896442326749453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5273896442326749453==--

