Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596F9CAC58D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTzNy58gAPbdroQ3VWKj4LMDyMLQHux7u+glAwkNa2c=; b=jF/qFWyx6jdLTz
	Qr4mubilqi0a29spVMfjxIaP5/x876mN9W8dd0CcR4jqNeyvRNUfPy1Mcee+lyTWs9Gs/VXa+O46g
	t0VWtDEhbyaBZoe1K+l63WUDflLu5iquW7tW+Q7PVwA/x73Tx5MHyUGRgpm0EMdleHNYMYQliFA87
	7IKYgShR7yAj1n9DSR8oJ41ZudfyNLYgurwexx5l1IhQ3DjWvFK2/EF3hGMHOW652o0gk6LxU37S0
	wKQf9IUHmQocl3KHSH7PPcayX8VkxN7HS/0eUtgdG+xv039Lzh/XFAsGolK7GhDrDC0QE9fhY2XBO
	TRMAzx1MVL0tpvQbh3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdRf-000000023dc-3Omp;
	Thu, 11 Sep 2025 09:18:23 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdRd-000000023ce-0B2a
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 09:18:22 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-80a59f06a4fso73422685a.2
        for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2025 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757582299; x=1758187099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1B3D6WIyM4uKCWTK+JvwjK5rmKnBn1DsJarcuewJmQY=;
        b=qaXnWBSLchWHkG62G/1EM+9GVkS26fn48bmZDa0O8Ivb9a1YCjeFEqbGuqMXAUnKQ7
         3TSXn1r83/l4+SpyH9w4jF01tIHwpkH5xKLJHRmopEsmeI/HpU59w5fjtbCobE4upds0
         /xX74v8429aXrmW7t5m/Kg4JZobWMkD+RPS85rTmsE26hdFGsuIP9PaYMGrDvwf/EeHY
         xrmhIJdMEX0c/kgb0CIb5N9iZF+2JXRrvtMJlzTjx9WbqMa1q1dS/I2FrGPW6QkbjSFC
         Ks7OiPOxFbBSuXz5hXX/S8FidqsMNCcLtagiXHn27yO32b5O3Akb/2mKasfFsDMSYi4T
         xnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582299; x=1758187099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1B3D6WIyM4uKCWTK+JvwjK5rmKnBn1DsJarcuewJmQY=;
        b=lp2P+ChnKiyXfvYCC7s6lwbknt5Hi3JOop6o6IGNLddPOEcBEohVuDvWjdz+EDwl/a
         /toMdBQadNY/alXaoSziziO+6A2R4xofQ/QjCO+9qmD7qmabnuY7rZsC8Ypd2sfyffJP
         asUGO5j7MyQ1kk+9n26mAIe3EW3igNt87joWUc3BN42NE4f/O+6CEd5opEU6aXExiplS
         nz/ixa2oDfUrRVWbd7SlbQUqI8OIzQabdX+CMTllerKoNtf7M/8U//ZKwflwMJe9fK4m
         umKIkn2WJ/LxTejyKbVvnJhwFlmXpID0QYdxNdcFrafI1He6Tg0V5Ju1DWauyU4GQdCT
         SU9w==
X-Forwarded-Encrypted: i=1; AJvYcCWxYaVZllgCvLrVf8jrBKhKIu0vW6mSE2nkpF7/ybR7TvC5S6KYktWqAFqy/TLPhn1gXZkP78PGl1k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1FOf7WhEavnW0dyhp/dt0dBcTjhyVrTB7x96cZ2UhHs34z24o
	iVHQiX25nSXT49GqsdDIac6u7NUPl/rYfbPwf0+TDWg01/oiq6ll6GDj2ueDSCPepttJQdQxuvK
	zNSM+HfgocyzG9O+B+pQVxUW14nO+U5UThucRaHMM
X-Gm-Gg: ASbGncs0eSGLHsNxmOrFrko6RQ/1YuO2eWUS/Zcp6MpH0w4uq7hBW8stF94sufXJp2G
	syVLjs9iq1H/IhGzaFrAm/NMVLnJjD6K7uxj+UsKuKqgluArxGKhfDnL4A+WUaMeIG/x1tcso60
	l9TWKsL33ygGrQUi3r38QJArcMgkL8P26wAd93rNSDICGISoywF9aMLtvga4acwiEf1ByxOn0jd
	pDurhldS1NAmfUW2qfKu+jyT9gSDWBJKl2zo0M3Apzb
X-Google-Smtp-Source: AGHT+IEAdn2JRKDnhaL2qmt37A4l17luV2CMhXbLee/vFTGYZd/pxxVUthlBX8HJQeQEoIdvrbi8slCg3eRXyv3n/Qs=
X-Received: by 2002:a05:620a:45a7:b0:813:8842:93bf with SMTP id
 af79cd13be357-813c1e8e0femr1958044985a.40.1757582298381; Thu, 11 Sep 2025
 02:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250910024328.17911-1-bagasdotme@gmail.com> <20250910024328.17911-8-bagasdotme@gmail.com>
In-Reply-To: <20250910024328.17911-8-bagasdotme@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 11 Sep 2025 11:17:41 +0200
X-Gm-Features: AS18NWC9Ax6HJ7xE41xsztIAoL9MxJcZhppucVI7C3-6QUaMqtQ6glgozKyha94
Message-ID: <CAG_fn=WPCtL2Knk7_so+9QMcUPY2wCG93BZN-rwJC+ELLgJ4nQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] Documentation: kasan: Use internal link to kunit
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux DAMON <damon@lists.linux.dev>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Power Management <linux-pm@vger.kernel.org>, 
	Linux Block Devices <linux-block@vger.kernel.org>, Linux BPF <bpf@vger.kernel.org>, 
	Linux Kernel Workflows <workflows@vger.kernel.org>, Linux KASAN <kasan-dev@googlegroups.com>, 
	Linux Devicetree <devicetree@vger.kernel.org>, Linux fsverity <fsverity@lists.linux.dev>, 
	Linux MTD <linux-mtd@lists.infradead.org>, 
	Linux DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>, 
	Linux Sound <linux-sound@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu, Richard Weinberger <richard@nod.at>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Andrew Lunn <andrew@lunn.ch>, 
	Alexandru Ciobotaru <alcioa@amazon.com>, 
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Ranganath V N <vnranganath.20@gmail.com>, Steve French <stfrench@microsoft.com>, 
	Meetakshi Setiya <msetiya@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_021821_091110_9337881E 
X-CRM114-Status: GOOD (  13.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgNDo0NOKAr0FNIEJhZ2FzIFNhbmpheWEgPGJhZ2FzZG90
bWVAZ21haWwuY29tPiB3cm90ZToKPgo+IFVzZSBpbnRlcm5hbCBsaW5raW5nIHRvIEtVbml0IGRv
Y3VtZW50YXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYWdhcyBTYW5qYXlhIDxiYWdhc2RvdG1l
QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBQb3RhcGVua28gPGdsaWRlckBnb29n
bGUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
