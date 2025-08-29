Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1681BCA0FF9
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:CC:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkgMQlT/Nr6hheTgbYUxO+hMDl74tiJAM8z9kPuxlJ8=; b=0e835wKLP3C62X
	yrs6GnDTSQXQqYAhrACh6yhr3VYxFzStIiXYNFHmeMq98rylo/RqGm58Fy/kZY1/+Gd87YKyRZxRr
	Om9hohiuXRmIUu9XpZLiUbDsEFIxIalbdYwLNl+yrZLELedOpZod2es+Kt1FWyIBnkSvHKkkszjps
	x35XiymBIxalORXgUCM9rF6LUzLe0WhzRcgKEsxnWaEak+yPkn1kKl8IUMCZntnmYhjCA3Q5sMkOn
	F/mW+4zUHECUqxVcKZzP9L4IBTOsfL5qlcsU9Uy+T1ZBtfvt/BC+mljEy/VA5oX+nFb0ugHgGtQHM
	UUKV/qROTqp/0XFxoAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tp-00000006lh7-10hD;
	Fri, 29 Aug 2025 19:36:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1zN-00000006Oyg-088W
	for linux-mtd@bombadil.infradead.org;
	Fri, 29 Aug 2025 16:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:CC:To:From:Subject:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IUKH7q64B4AZKyl6BHgnsCPbmL/bBGjfZAM2AuF142M=; b=UP4EYsVUgpPEb39siinQ+Z3Hqq
	+OkYpMPIoIsws5hM6HLFi6cElZD94Hox2xMJItW1RfIcGSv4EQ7DvdEHlhXKoGEshAhPwzDi3Ycdp
	m2jgMA645+OygNyAqlFDCLnl+fzvSZhQKrCt1vArYFHipjFLpor6/2s1gzAogb5ar3czwrX8C8SFK
	31oPOw1GEU3Vx5mU6QnOJxm7jIdG5o+i/qE8NVx98U06QXyVAc9VBmHjZRi2i5+hdDL6ATSGomegW
	FLPCBi3yVcF1UTZspVf8NKahoOMxiY0QktREbSNoQcpwpGJCq8Wr8U1eytx1pAX5WSc8kJ9aFMVq9
	nF0n1A6w==;
Received: from iad-out-007.esa.us-east-1.outbound.mail-perimeter.amazon.com ([3.221.209.22])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1zJ-00000003EJG-25O9
	for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2025 16:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1756485005; x=1788021005;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version:subject;
  bh=IUKH7q64B4AZKyl6BHgnsCPbmL/bBGjfZAM2AuF142M=;
  b=r+Aw9mabVqDaAEzWqb+xhpilIwV/C0vnZXoKYCyU+WV35d80Sk6Kj2pw
   1pThFIRhlzDEp1LyTzG4kejkWt25EK/H8lO/Nx+0piQIOvt0iBXBzTweD
   OxU5SIAQwiUqPP/RxiLWoPAIXbZ6IqrTL/+rdAonVo9wh0ZYV7OWzwgHY
   Tu2JL2uZLvkX9gjji2rni9TWFUPuOr9I01bN0/B2Hhy31rcUM/9F1WdDc
   SteqfQG9XwN9KNRCWXSe1ChlpyXhMwsrUE09hlbDga49vfuUCrPvMiq3Q
   Kr4Lw5MbXSw1m6+gKnptnI/0x29pJREHKq9G1XHnqDXko5oN/Gsb57DWx
   A==;
X-CSE-ConnectionGUID: OvK25TeeSeK03kBznH2NIw==
X-CSE-MsgGUID: 1jG78zBmSY+y1d4F/Fqq7g==
X-IronPort-AV: E=Sophos;i="6.14,267,1736812800"; 
   d="scan'208";a="1617061"
Subject: RE: [PATCH 11/14] Documentation: net: Convert external kernel networking docs
Thread-Topic: [PATCH 11/14] Documentation: net: Convert external kernel networking docs
Received: from ip-10-4-10-75.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.10.75])
  by internal-iad-out-007.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 16:30:00 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.29.78:6180]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.50.39:2525] with esmtp (Farcaster)
 id 59b93efc-7ead-4e12-a773-4e7cd5d1b3cd; Fri, 29 Aug 2025 16:29:59 +0000 (UTC)
X-Farcaster-Flow-ID: 59b93efc-7ead-4e12-a773-4e7cd5d1b3cd
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17;
 Fri, 29 Aug 2025 16:29:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.17
 via Frontend Transport; Fri, 29 Aug 2025 16:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtENIYqvRtgX8aDglaxuSt+48zVaccnoEXpnVDszWlXifGkf0SwNKXmgc1yy5/PDep8yBC0SyGMMALlOsRKtmoWNxGtRbGNxCYFUXuHlCDrC4BEl07iMnuNPqM1VjGVoAQoeCn9DnJyyPfGcIUJlDo5KeMPVTQuXoNcXpa3lkr0EEUp0DdwMmsVGIFNtnWDkLs5ktjv5pk6U6YATlNECApWH/N/vJUg9yV3914ukC4nTYXRJ0O+4dsPkiqaV7VaFB//bqNSVVg3Hp3HsSdLo0AkXQYhzvTQeES6VmogVwFJZF1eUFJTA+7dTtqz9pmaLq9nPdVHrMQLzOqM0kJvsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUKH7q64B4AZKyl6BHgnsCPbmL/bBGjfZAM2AuF142M=;
 b=wq6IsXOecUvJu1WfbChOLnHQv98h+xssqAVbZOEJcjBa20XhC2GM4tQOcAq5ciF/d/qZTaKYAdgBFch9XXFVPnEdGYue7ANs96dbmV3V7vs1LfeCGkPtKPAHNv5wn6pPzT2cuwgEOev53shUmUiGH+jmIIqkTOx+30xonWlmzmZOVz6+ZzBiCjnWl71nZ1ZcFa6ysWA/FgxDVipZm0CPd5ZpmRC39ondeoU6qcSDVbz8tCIxo63nv8wFEuMUmWseQSrEH0kqUa+TafLCLZJEq1RlWkWgT2kZCtFngTjEkEdin9CGIu5Vr/tvFhMNEHV5KzdijkRH/qI7yKN4SUGCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from SA1PR18MB4664.namprd18.prod.outlook.com (2603:10b6:806:1d7::5)
 by CH0PR18MB4145.namprd18.prod.outlook.com (2603:10b6:610:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 29 Aug
 2025 16:29:46 +0000
Received: from SA1PR18MB4664.namprd18.prod.outlook.com
 ([fe80::55d3:142d:553d:9b9]) by SA1PR18MB4664.namprd18.prod.outlook.com
 ([fe80::55d3:142d:553d:9b9%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:29:46 +0000
From: "Kiyanovski, Arthur" <akiyano@amazon.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Documentation
	<linux-doc@vger.kernel.org>, Linux DAMON <damon@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Linux Power Management
	<linux-pm@vger.kernel.org>, Linux Block Devices
	<linux-block@vger.kernel.org>, Linux BPF <bpf@vger.kernel.org>, "Linux Kernel
 Workflows" <workflows@vger.kernel.org>, Linux KASAN
	<kasan-dev@googlegroups.com>, Linux Devicetree <devicetree@vger.kernel.org>,
	Linux fsverity <fsverity@lists.linux.dev>, Linux MTD
	<linux-mtd@lists.infradead.org>, Linux DRI Development
	<dri-devel@lists.freedesktop.org>, Linux Kernel Build System
	<linux-lbuild@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>,
	Linux Sound <linux-sound@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Jonathan Corbet
	<corbet@lwn.net>, SeongJae Park <sj@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy"
	<gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
	<john.fastabend@gmail.com>, "KP Singh" <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
	<jolsa@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	<lukas.bulwahn@gmail.com>, "Joe Perches" <joe@perches.com>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Eric Biggers" <ebiggers@kernel.org>, "tytso@mit.edu"
	<tytso@mit.edu>, "Richard Weinberger" <richard@nod.at>, Zhihao Cheng
	<chengzhihao1@huawei.com>, "David Airlie" <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	"Nathan Chancellor" <nathan@kernel.org>, Nicolas Schier
	<nicolas.schier@linux.dev>, Ingo Molnar <mingo@redhat.com>, Will Deacon
	<will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Waiman Long
	<longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, "Allen, Neil"
	<shayagr@amazon.com>, "Arinzon, David" <darinzon@amazon.com>, "Bshara, Saeed"
	<saeedb@amazon.com>, Andrew Lunn <andrew@lunn.ch>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexandru Ciobotaru
	<alcioa@amazon.com>, "The AWS Nitro Enclaves Team"
	<aws-nitro-enclaves-devel@amazon.com>, Jesper Dangaard Brouer
	<hawk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Steve French <stfrench@microsoft.com>, Meetakshi Setiya
	<msetiya@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche
	<bvanassche@acm.org>, =?iso-8859-1?Q?Thomas_Wei=DFschuh?=
	<linux@weissschuh.net>, Masahiro Yamada <masahiroy@kernel.org>
Thread-Index: AQHcGLuTBzGQJ2HjQUKWAGuAiYwph7R5z5Qw
Date: Fri, 29 Aug 2025 16:29:45 +0000
Deferred-Delivery: Fri, 29 Aug 2025 16:29:36 +0000
Message-ID: <SA1PR18MB46647E011B94C5CC701F7104D93AA@SA1PR18MB4664.namprd18.prod.outlook.com>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
 <20250829075524.45635-12-bagasdotme@gmail.com>
In-Reply-To: <20250829075524.45635-12-bagasdotme@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR18MB4664:EE_|CH0PR18MB4145:EE_
x-ms-office365-filtering-correlation-id: 2351047a-1357-4c69-30c7-08dde719445b
x-ld-processed: 5280104a-472d-4538-9ccf-1e1d0efe8b1b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Y9Ys02gnEJbWPt+eT+U/MY71EKPRYTyZT2JzkuTz1xe2f2N8P8bGN4znEb?=
 =?iso-8859-1?Q?CYv36gAwTgpCldhxYlTRS77nGlIMePC8jpWdyaKHKs4/QaWxAnFknquQgv?=
 =?iso-8859-1?Q?6QhkT+DWIl7xt0KUeC4z1rV6EmvjAoVborymKzgstHU112TqUthTP3sR9z?=
 =?iso-8859-1?Q?IOmJS/XTxwSNYRUw38i9wPSDVvDjmOZInb4LHsCSFxH3boRYnjbQ0rYOrH?=
 =?iso-8859-1?Q?8aosECfMdk9EUrl1mP5RNitferT8DRyNsa5qAv1MHqpEvLwiX2/14ep6iB?=
 =?iso-8859-1?Q?obUbfDm62MIyRCI+vIBtoaGzt372h0uknTTcoTcs6peXVRtCmKbDjg6IBr?=
 =?iso-8859-1?Q?02mvhzFARUM2MuttCHUMKqqEyW7MzepFKW2AKYV5jKr4Y7j4kRv7M/87Um?=
 =?iso-8859-1?Q?GWuzGmVLtuvpPOVtqnuEeXa0/4Xod0iXvBMBJvcpyxSSSr106aMFwCNp0Z?=
 =?iso-8859-1?Q?1Y2/08y/u2QuD4oS9Sf7QUS9DC0crB1rATOUFVZ/QpO3Xgyzfm0RyOOSCr?=
 =?iso-8859-1?Q?NVYe4uyrDU3ufVxFduB8LRVwIDxEnfhjKvIqFPtgQ1ny+DffCeLrESQcxE?=
 =?iso-8859-1?Q?4N7UNDYLC8iKUJzfggWCJOtagow0pmbDMjbPlwHl7f0983pZDtxRWmkCiR?=
 =?iso-8859-1?Q?NK0F2JzSK1k5v/dkboceaIktU5T3Iv+G1X6AV1LRVAnvNr6UpU0v2achsU?=
 =?iso-8859-1?Q?MmUH+djEYxb8TwAYI7B7iOfZXO2P8a5cdspxb43dvxJvgLvM37V9tQlbNZ?=
 =?iso-8859-1?Q?lFAJ09LRoEFuEyi0UrrLUIjL6yoJqZRcq0hcmPotF7Hm18i/pHILaxURjo?=
 =?iso-8859-1?Q?kDAutEIq83FsT7yQ0b2vSTLPZwyqQP/nmUBW6FNPi7ENXys22npsyVXh8D?=
 =?iso-8859-1?Q?tGx+/S4/Gi6JPoBEXYTXuRpZvGuDFuHBN8SrUCI+mjUixpEP/q5D3k2IUu?=
 =?iso-8859-1?Q?HtuR+J9wpVsTOTx4JKPZweAZo2rJAu6rEvdrLDoq9n39JTj0fOaB84aM32?=
 =?iso-8859-1?Q?dMTA4qx7/vcvqJijNlw4QdisW8IhQhvxhslHnaGqy4RcfGGATWcKcTbgW8?=
 =?iso-8859-1?Q?56+6PDrKTPE+6n/E7MwyhHBA/28CkFdAKUik4bb9hKLSCuHgNQI43gcVh8?=
 =?iso-8859-1?Q?NhcEJODpE4P9v56aj43xh1hcWZ9NHFNlQWOvzsvJKCyyW1CPsvpi2V6voE?=
 =?iso-8859-1?Q?ksLmhpiyB/wB6YCdhUnFHrmqgVvGg9jcDzaVPYDrcYyLvQL8iuz3PSBQVF?=
 =?iso-8859-1?Q?jPPm/zGCWLxEa28wjWrya8OdmTbViOo7eD43nHhdZb59VLm1X5m43BHrkI?=
 =?iso-8859-1?Q?GdPegWDi8jYOgPWQFUrPfn9eBVeKj/Pxc05z357yk9g8hfNtXxHH5MepQt?=
 =?iso-8859-1?Q?dZ6gixYudDjTDpsGmdilN3V5yr5eN2zftqyrSY52CkxapTOk3ChqOk5HR4?=
 =?iso-8859-1?Q?wOLU31QA1eTy0ha5nOeamOxoA5dN9xHQAyT2kFGcVtA3gVV+TZk825/8/i?=
 =?iso-8859-1?Q?QmQmyxmEK6P+GDFJI/At23PG8tGAN407c6QECO9/ce6jh0PLXUJW9rHexm?=
 =?iso-8859-1?Q?CTw6zVeVY4zRfhhVbpLXAOvZ+z/n?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR18MB4664.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FxkdxsX4Ybdn+q9ZpwXflRzDTr62JDlnYm3D42LaQVEm3V+vLWxj3gF3q1?=
 =?iso-8859-1?Q?rOGS4Wu8vkkfrN+RelS9TCYjLq6ZHm7U0TKovMIGd6ovmetjaRGO9EEC8v?=
 =?iso-8859-1?Q?MjVvF/Y30865iWklmOwSLSZ17y/j+W1zVRp6mfCLvdH3xEy+gx6LTwROzZ?=
 =?iso-8859-1?Q?iKhYTy0+ekwMwpkmioArTqE4RUZUTIuMkj8xBs7vdZAB1WwxfQXn4n/Rut?=
 =?iso-8859-1?Q?/lwaLv7+4dkqpF2qZeYNs/5KcloADG7IqRTXGtIUb0C7XjeQ3AKmu10I6k?=
 =?iso-8859-1?Q?zCdMrbzpV+QQysdEM6PMIIM3k9Ky1fNyPKhZYr+uvsD6pcFQ6u1lvSGE2i?=
 =?iso-8859-1?Q?niipjghj05d0+d3cP8pv1FvTNCY0C1pbST1aGR2CdYzwE4Q7PPX+sbto2T?=
 =?iso-8859-1?Q?abH1lci5iYl2udP7bdsrMTA5hJaxGUCAcQk5ko2bTUUIoa6glqRzgODSIC?=
 =?iso-8859-1?Q?GNCo9EjoeMSQsJlK6b1eOlrdIeXPNO1doUaaTssGNZLCCWwTKKOruhav69?=
 =?iso-8859-1?Q?g8d6MRvviA/Q+1SiTcERMfkUnmY+vF+8E9G71vcBg8O4pmZ8LJVL1Xi+N2?=
 =?iso-8859-1?Q?vk2meoPoTPK5CKG4DIo7Cpk8Ld0GkrB3qvLWJETsUwbVL1s6/xkzG9u9Yo?=
 =?iso-8859-1?Q?VlTExGdeYcnwL/BF4vKwB2nIAZIMDm/YJdOWZsx6seL2jlqWqrx1rk1GAh?=
 =?iso-8859-1?Q?fV8O8wNr5ahRxm65cF/l0v+cm7TvZPbd5jbEKlgNPfQd7KS4uV5JjdjF/q?=
 =?iso-8859-1?Q?qcFnR5BYpfNnKU1afhOzlNe/LYGmE43A2gH04+j0FGv+9rKK3PROOof4D2?=
 =?iso-8859-1?Q?qePL0CbYM6PiWFEdTN6zxWx2K+K6x4KC6xu9hOy5lLiIv5wE/ln/J8GKky?=
 =?iso-8859-1?Q?M+XJiDloFrCBR04DPcq6pQvaBP1E8DHn5a+aPDF8Sbi3PeSg22pLIh9Mqy?=
 =?iso-8859-1?Q?xue1RkxaHhWFgZFlSsSV7r42PvNvpGGn6WcsqmJDzrMrHLNArdR9a2Duy6?=
 =?iso-8859-1?Q?vBk0U/2vvkKBDpOFIH90NzO2xBSAsl+uQqGybysJHNs/tnwgGDI2Z0WiUq?=
 =?iso-8859-1?Q?qyzfWTgbVu8W4Xn2q3+D+m8ZpEpCM+euu9rMX/ROxvfi9rw6+tsw4kUz3A?=
 =?iso-8859-1?Q?tKLBHrqqQs3pC5RZbqiGmN6E9n0VsRRrV7BKhOERWjFDx5P29NMdxZ4V4P?=
 =?iso-8859-1?Q?zyzK/9woYmfizLHFCLFYIzS7y8OfhdUL4fhzC/5DihYZ4XU13hnHPGIwAM?=
 =?iso-8859-1?Q?Je+Pwn7rVWtOs73OJQgxUISrD52xDJo3l4nTLpEL2IIt1o5+bTGLhdwpD9?=
 =?iso-8859-1?Q?IG7s7kjSmiEGFsY7lJIO0h0oT2cMA9vxHldypzS8MXLmwDnQUkd/bY//6x?=
 =?iso-8859-1?Q?jcc0aD/4jT1gWr1gUQAG/DPdyrLKsJAbZR/i7khJaq/YAxkfHzRB8Gv6rm?=
 =?iso-8859-1?Q?u1h+G/T3gnu3YARUvpu81+WkM7dzmB+uyxIP+dTi5caF1VdxkkawN2fBuj?=
 =?iso-8859-1?Q?UkQJZHmPcRMmIbdqcUA5w67QLGJv4nNUUsJyD5JSIoKjx3DS22tZ7o3kQ1?=
 =?iso-8859-1?Q?CpBROfMCmldWvuSYTlAZXzHmx4kSy0DHooIk8i9oPbeZFY5vBUVB8mCwrT?=
 =?iso-8859-1?Q?B1xISVEUAeMeJS5BZ08J2DfFYZifnT4ayw?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR18MB4664.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2351047a-1357-4c69-30c7-08dde719445b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:29:46.3033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVgFsZAGNaAA9eeS15tivTDWmK1XhrMYR7+sAIZd6T5lrUSIL/Z7akZChYV7Dedcir2CBw/WMllCE4SWQHjGsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4145
X-OriginatorOrg: amazon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_173005_893204_3A4DAA69 
X-CRM114-Status: GOOD (  16.99  )
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

> -----Original Message-----
> From: Bagas Sanjaya <bagasdotme@gmail.com>
> Sent: Friday, August 29, 2025 12:55 AM
>
> Convert cross-references to kernel networking docs that use external links
> into internal ones.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  .../device_drivers/can/ctu/ctucanfd-driver.rst       |  3 +--
>  .../device_drivers/ethernet/amazon/ena.rst           |  4 ++--
>  Documentation/networking/ethtool-netlink.rst         |  3 +--
>  Documentation/networking/snmp_counter.rst            | 12 +++++-------
>  4 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git
> a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
> b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
> index 14784a0a6a8a10..b7b314de857b01 100644
> --- a/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
> +++ b/Documentation/networking/device_drivers/ethernet/amazon/ena.rst
> @@ -366,9 +366,9 @@ RSS
> 
>  DEVLINK SUPPORT
>  ===============
> -.. _`devlink`:
> https://www.kernel.org/doc/html/latest/networking/devlink/index.html
> 
> -`devlink`_ supports reloading the driver and initiating re-negotiation with the
> ENA device
> +:doc:`devlink </networking/devlink/index>` supports reloading the
> +driver and initiating re-negotiation with the ENA device
> 
>  .. code-block:: shell

Thank you for submitting this patchset.
For the ena driver change:

Reviewed-by: Arthur Kiyanovski <akiyano@amazon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
