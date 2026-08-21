Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2169C5DF88
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Aug 2026 04:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYeopHzNM8RJ240uFgNJnZ2MZqOZ4po5hBZMy5eL4pA=; b=H9YaCz/0eoVo0c
	0NuOsTWpy2RfE92itSH3BkuE9tOgAgzc0TpjQUVSGFbMVLFA29TnjfpCUb+CZRrBKpP0I3tnDrQju
	Tj1pJX3fb/+xoFfXRjs51aUEfXqBPxP4+Thh4ECtvwhYsLCa3hJsnIjX7Yutfyr2hq8nVEn/G4JIw
	VTUUkGb8VzNc7NHz3LnimdCEBxo3M1BC9v01GTHrHYILPYRp5HqRaoxSqakt9AmZ1ikv/+3ZkuJ8A
	JpMc5ZwX7vqhMj+HiGBUV9bgL2oJ9VLPBFOLEeI5HuVAkN5Q3w9rZtvuYLhPzy6dFou8D3enZSFFX
	qexU5nbQkBqsezihmOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxGdB-0000000CW10-3FRy;
	Fri, 21 Aug 2026 04:13:25 +0000
Received: from mail-westus2azolkn19012054.outbound.protection.outlook.com ([52.103.10.54] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxGd6-0000000CW0C-1CtG;
	Fri, 21 Aug 2026 04:13:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faf6PAn6grplnPPA8bsRN9eBcLQa23f1cRjb8HLUEBwqgJY23EOl8XjBH+qFphKFlVF0tLN/F5wyLoRuFxk/cw9fV+/vBdJs3iyYJQUDA/itQgovYbvWaZSChMaSYKBzLLYrStKwrSP+lQ8jaWH7WZZgjQfQyAg8WX/ZBGzvnhatAYPNwOsVUfO0Xm6W573uAeIEesMbjrbVBFG3JEsh8X6V82EW3mao3ahHkr/9rhWgf5r1zhtwjUaWN37mz5DEGgKoxsNyhIt3CquyeCWx+9HYzroJOXAJY3K8FrMFRsmMvHhHLbN29Dx6VYYbiahDIy2Kmxj6U/3MIJfh2tAE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFO8zrhqtB66cXJ33SuIgQV5/DBxessQoz1LFr6UcfM=;
 b=Kyc8TaG1qr343TKoVJdVFeHFQ7p1BpUq3nnDVGmEfif1SpIFcnUnOmG3o4ql+sLFIS1qWgN7zR14Of7ykIYKe30JJVChgvZc1zXSoc9XAa7brAdY5ye42bFlc/6hQadLnt5KL56nfM6hWB7Qm0XGka0gJtU3s5ZyTxAgyRJzM9I074tnI06++rLDzr7SU+6kZbE5jE9DgFaSbtud6Z5igW8+9NTVQ49/sLhqeuw2gM+xfsYPrc/KZ4heDyn/jzH3ofn8Py2beSCrG4f0/oY8kTX/2BD7lgX7M9X8+PxCKqKKaKFj4ZJXs2zF7ffFPQbmrX9tnDQk2nPmYNV0xth69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFO8zrhqtB66cXJ33SuIgQV5/DBxessQoz1LFr6UcfM=;
 b=n9paxuXBIzPpMMrgaqCD794zank0ubKqBqfwTSpoKIvYuz4720XKS5YLZotrj1aE4TBg4PmCbrkr4JBGCt09/36t3cirkM49LcL12a185JqsaTRyQrAO4SkfzdPQBpNzyca7vg0DwJSV4jyqUwrkr+FaeKakDRC1dERSyqA8wLD2CjD0GUnbddAKSnrEHlupzgXA/2uJcFOmw0008EB/sEb6A4D8vXc5Cinxqr051u5GFHZzvjrB0fYfZH0PITsJKLcjFtREvTiwuTQflcWiRybeQdyGAn44FKXxTT5QUTby+dE6Vsnk4lt2GNQuDjk4d32FnMkvtCax9ct5IYEqGg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SA1PR02MB9758.namprd02.prod.outlook.com (2603:10b6:806:373::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 04:13:06 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 04:13:06 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Juergen Gross <jgross@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "virtualization@lists.linux.dev"
	<virtualization@lists.linux.dev>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-ide@vger.kernel.org"
	<linux-ide@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
	<linux-fbdev@vger.kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan
 Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, Sean
 Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Ajay
 Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov
	<alexey.makhalov@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Josh Poimboeuf
	<jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Pu
 Wen <puwen@hygon.cn>, Tony Luck <tony.luck@intel.com>, Reinette Chatre
	<reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>, James Morse
	<james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Tony W Wang-oc
	<TonyWWang-oc@zhaoxin.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Andy
 Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Kiryl
 Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, David
 Airlie <airlied@redhat.com>, Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Viresh Kumar <viresh.kumar@linaro.org>, Huang
 Rui <ray.huang@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Perry
 Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Srinivas
 Pandruvada <srinivas.pandruvada@linux.intel.com>, Yazen Ghannam
	<yazen.ghannam@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Artem Bityutskiy
	<dedekind1@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
	=?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>, Rajneesh
 Bhardwaj <irenic.rajneesh@gmail.com>, David E Box <david.e.box@intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>, Helge Deller <deller@gmx.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-geode@lists.infradead.org" <linux-geode@lists.infradead.org>
Subject: RE: [PATCH v2 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
Thread-Topic: [PATCH v2 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
Thread-Index: AQINTp4TPtSs6ebCNDDLlaH1nXSnpAH3JEcqtjc5VeA=
Date: Fri, 21 Aug 2026 04:13:05 +0000
Message-ID: <SN6PR02MB4157769F2FAEB7D78259164ED4A32@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20260819102314.1499258-1-jgross@suse.com>
 <20260819102314.1499258-13-jgross@suse.com>
In-Reply-To: <20260819102314.1499258-13-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SA1PR02MB9758:EE_
x-ms-office365-filtering-correlation-id: 0eaa3b97-02b3-491e-1f8c-08deff3a8045
x-microsoft-antispam: BCL:0;ARA:14566002|41001999006|25010399006|4140399003|8062599012|31061999003|24021099003|8060799015|37011999003|19110799012|15080799012|55001999006|13091999003|440099028|3412199025|102099032|31055399003|52005399003|40105399003|2607281247196008;
x-microsoft-antispam-message-info: =?utf-8?B?VE5jb3pZT3lrd3UvVklPb0ZabFZoczZDTTJGM2VaWFlLSkxEb0kwZUtpTGs4?=
 =?utf-8?B?RjRjVXBBTzdtcHA2aGdoN3dVRGtyT2c1bGNTT0dBSExNSDVFbWJwRHNqUnBR?=
 =?utf-8?B?NUxSUjI0QlAyZlRYd3M4WVNEN0xaT0kxVE1CeHk5MElwdHdSUlQ3d3g3YytC?=
 =?utf-8?B?VjN0RElNWjRrZ3ZWY2R4S251MEhZdzFWdWo5a0RkMVRCUGZCS2RvQVMxdjRp?=
 =?utf-8?B?T1dLQ0tWbFBTVnpTeUFabnhKZktaYkdNRWJjd00wRjN2VjZDZ3d6WkE0d2w4?=
 =?utf-8?B?QlBMZFIzUGlSbGR6Vk8xQVNkNVZSaTQvNERSMDJOZUdWSXJuSHE0NXBFZFoz?=
 =?utf-8?B?MHhTaW5KL01QV2grYTdad3Rqb0crdk1OMVAwUHZBbjNiVmpPU09nQnBkd2NT?=
 =?utf-8?B?M1BBeTV1ZXQ0SDZud0pvbEdxc2pSV05HbUN3aWNodTN1bndDRTdzeGhlUjhv?=
 =?utf-8?B?eGlxZ296MXZjTTU1WmtZWU5zbFpnRysydmlnb0xwZm9RZ3NjV1dWeVYzNUFD?=
 =?utf-8?B?U3RSNWJBUDdvZThxWkZwcTVDVGN3dmxoNEJmVVo2UW5qMEhzdFVBNXMzTlpt?=
 =?utf-8?B?aU1VMThWdFc0V293R2V0Z1RWYW5ZeEhEZjBJZk5IeW9kRFVId0tyKzF3TDFN?=
 =?utf-8?B?THRxY3pVREVBeFVGSVl2RFhOYUNCRnlTR1dCYkNqdDZ1OG8wN3NBRnBZeVB6?=
 =?utf-8?B?YUorOWVhRHhFWFlHTFJuYmtIeGU3OU1rblhVOHkvZVZhcTJBcVRCWjBPRE5w?=
 =?utf-8?B?L011MEZIbE9hK0dGdkQxVm0xVUZ0dFcyRG5wMCs2cEZidUt3U1VDUWhLQVdk?=
 =?utf-8?B?alFKUkxrZUhpL2t1cTBDYUZ4T1YvN0dpU0tDSXB5ZDdDUmViZFk4UGNTQXRm?=
 =?utf-8?B?VWJZTkNSVitHL3h4c3NVM2RuKyswRVhFSURoa2U1bTFOY3Z5d1hCczMralF2?=
 =?utf-8?B?WUpaQUpmWHlDWkxrd3NsZ3Zia3ozdnBVU0M2MmNrT2xNUWorRGxOVzhnQnI1?=
 =?utf-8?B?My9xbE1qUmNTOE5YdmxLUXJFZkhJcTdNVkdhZzRsV0J6MDFieXVCeFdKWEdC?=
 =?utf-8?B?OEluWGRYUTIxNVZNVDg1L3ovbzBiSzR5U29iWXdzeTlIakZUUi9PVDF5Ri9T?=
 =?utf-8?B?NHAvSU14WE9SS3VENDMyVElBWmxnU0dZL1BZWHZMenYrY3pXdXY3V3J5N0o0?=
 =?utf-8?B?ZUdrUUJLU1VHRi9qSUZYMWJJM3pGMkZCZnZHTE9FbjFMay90UzU0NkVqVVJP?=
 =?utf-8?B?Wlh3WlBxVlJNcGZQdWd6ZmhIWEhLSmxVUVYwWVVvSEVnRFZRUzJBNkVabEhZ?=
 =?utf-8?B?WkpUSDlvRk55L3RoM1BkNG1BWjNteTk4eG5IczQ3KzJyUkJRb1FJdW1KeGt2?=
 =?utf-8?B?TjhXcWVVditaKy8rdVUzb0JIV2VpbTRlOTg2UEd1T3RHRGg4QUtHZno2d1o0?=
 =?utf-8?B?eldwb3NJQUVNSTIyZHcvRnpPYzZha1RqR0QrSHlpNlo0em1TY2l5VHo3Nm5B?=
 =?utf-8?Q?y0IhSY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmM3eFlkSHNPYWVSaWpRaDVqT2g3dE5Edk9DUnVvSVc2aTZPTVprd2VGYUdx?=
 =?utf-8?B?LzFsRW1hODBnZmVwUGExU3Ftc21jYlZBbDk2Z2pTVjFSYlhFY1ZrTmZTc3Fp?=
 =?utf-8?B?RTNQTHlBZC9jZit0NHVkV1pjQTZtU1hiK0lhank3cUl4a21BYUdKNkw3NFNn?=
 =?utf-8?B?aStuMk1uYytLNGlSRUxDc2NoWWJkR2ZiOUYxRkJ3OFpMUHZRaHFCcUJjS2Vv?=
 =?utf-8?B?V1B3Rmd5bll2Uk1FcUdpZ1pIQU93S3VsVmM2VXlORURwbm1Od2pQYkkzWUxJ?=
 =?utf-8?B?ZU9aMG9UbTk4V2ErVXhCQVAzRTZIV3FEZ0N4L3IzUVZIRFl1TndVdG1pQmhP?=
 =?utf-8?B?SnUyZjE5Q2l4dDVXbXBMOEJibDl2TUgweURkMjFyL3ZTOTc1QUlaTFhUa01q?=
 =?utf-8?B?THMvS3ordk8zYzR2MnBHR1I0Z1M2YmwweE9kWEF2Y3RmRFJ4clhvaWFhRUdr?=
 =?utf-8?B?UmtHSlVxUzBrRFByN0pwUHAyaEFTUmVrLy92Q1VjRytpZTA2b3dnTTB1ZEU5?=
 =?utf-8?B?VExNeVA1cHBabHo3dXFVajJUb1c5RVFFUjZuRWRVU1ZpdHZyN1Ura1VVWDB3?=
 =?utf-8?B?NDN6T3g3aHU5Mm1wMHFFWkgxNWVXTHI1blNPSEVZWkhQL0xXcXVMVEE0SE8x?=
 =?utf-8?B?Z0FUUWNkdkJDNko3VEh3K0dOV1dyK1c4WU9NYzd2SUVralUyczFRWlplSUlj?=
 =?utf-8?B?M3pWdW9pc1RzZ25ya0dXMjRUZnpaOUpNYWJycmllWHBRMUgyNncxNWg4d2Fw?=
 =?utf-8?B?MndtWHQvWlhkaXVmUTBSN014VFlvNkxKb0xjaWFtUTJTdGhyY2R5N25YaERK?=
 =?utf-8?B?aEJkK1VheE9wNEZYOW5KY2h0Ty9TNllaRXhFWkw0cnlpMUsvYUROVkVHWUdH?=
 =?utf-8?B?QkZYZXZwZCs2bUNqNkp1ZndVdGl1ZjlsaW5OYmhKSmlkMExqejdlQjkwcy91?=
 =?utf-8?B?ZEdYOVNSREx3NUJBZHBuc2RkWnJ5OVRNYndxNC9YM2hSRzBKSjVFL2swZkt0?=
 =?utf-8?B?K1NSQlRvaEhvU2tmVysxc1dWcXZ5bnhoTlZEUHA5UVFLZzJ1YUg3aTcrN0NK?=
 =?utf-8?B?VUFXUkJPZ0hhejRGNFY2ZndQMWhzOXk2cDZYTFlHNTNjUnI0cjg5cmJsTXc3?=
 =?utf-8?B?MExzT0o0ZFVEeG9xU2dxS2wwVytjSDRrenJjL05Ncnp3bmF3L2lPZkxETWtD?=
 =?utf-8?B?YzRydFB6ZlZ0VjdwdGlVY3h2bm1MeXh3UjZQQTVabkxScU00UVB0dXYwcHVG?=
 =?utf-8?B?R2s0TGFNMEFuV1ZmMlp4c0lLQXBJemFOMmhjZ2lEMXJ2Z1BIVFJLRFV3UHNz?=
 =?utf-8?B?UHVvc3F4MTBEOGxEZlhVYWdXM0ttaDk1TEVUaU1Yb3pKOWxoODEwYzFha0JR?=
 =?utf-8?B?UDRxZnNlaXJmZm54bWZ2a3VCdHRmVXFvR2lZOXBuR0htN0gzUFJKdDdXbHEy?=
 =?utf-8?B?YjJIRnMzRzRJQW5LUjYxSFFIU0cxbU8zc1l4TDltV1psc2dKMkkySHN0VU1h?=
 =?utf-8?B?QXcrNThabVU3cFFBOCtneVNDbHkxQXdjUzQ4N2M4NzlDQWZmUjcvNS9OYWFt?=
 =?utf-8?B?dEF1dkorcm90ZzZZQkJjQjJWMjFyYVZvZ2V0OHhWdDk4Lzd5UHAxSU85RUkz?=
 =?utf-8?B?b2d0YlRUZXExN2wrZUVHaC9BdlVWeGM1M2c4Y2F5cjNsQm55TG0vZmVhYnBn?=
 =?utf-8?B?U011azlvWnlOZlFWemJGcXR0bkxRanN0WE5xU1V1UkVwNDlTbFNOYmNqVHFz?=
 =?utf-8?B?MU43c1ZlUG50WnFrM0hZWE5sNEN1U0d6SnRwVEE2Y0RCYkdhK0RNZ1dNMEVi?=
 =?utf-8?Q?NBDvWmZW+2kzq14/wMMlZbp8tNDkCgF/8lz/s=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eaa3b97-02b3-491e-1f8c-08deff3a8045
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 04:13:05.8171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB9758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_211320_397968_3550BFF4 
X-CRM114-Status: GOOD (  16.33  )
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

From: Juergen Gross <jgross@suse.com> Sent: Wednesday, August 19, 2026 3:23 AM
> 
> Today rdmsrq() is a macro using its second parameter as the target for
> storing the read MSR value.
> 
> Convert rdmsrq() to an inline function returning the MSR value.
> 
> The users have been converted using the following semantic patch:
> 
>   // Options: --include-headers
> 
>   virtual patch
>   virtual report
> 
>   @@
>   expression msr, val;
>   @@
>   (
>   - rdmsrq(msr,val)
>   + val = rdmsrq(msr)
>   )
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/coco/sev/core.c                      |  2 +-
>  arch/x86/events/amd/brs.c                     |  4 +--
>  arch/x86/events/amd/core.c                    |  4 +--
>  arch/x86/events/amd/ibs.c                     | 18 +++++-----
>  arch/x86/events/amd/lbr.c                     |  8 ++---
>  arch/x86/events/amd/power.c                   |  8 ++---
>  arch/x86/events/amd/uncore.c                  |  4 +--
>  arch/x86/events/core.c                        | 20 +++++------
>  arch/x86/events/intel/core.c                  | 11 +++---
>  arch/x86/events/intel/cstate.c                |  2 +-
>  arch/x86/events/intel/ds.c                    |  2 +-
>  arch/x86/events/intel/knc.c                   |  6 ++--
>  arch/x86/events/intel/lbr.c                   | 14 ++++----
>  arch/x86/events/intel/p4.c                    |  6 ++--
>  arch/x86/events/intel/p6.c                    |  4 +--
>  arch/x86/events/intel/pt.c                    | 12 +++----
>  arch/x86/events/intel/uncore.c                |  2 +-
>  arch/x86/events/intel/uncore_nhmex.c          |  4 +--
>  arch/x86/events/intel/uncore_snb.c            |  2 +-
>  arch/x86/events/intel/uncore_snbep.c          |  6 ++--
>  arch/x86/events/msr.c                         |  2 +-
>  arch/x86/events/perf_event.h                  |  6 ++--
>  arch/x86/events/rapl.c                        |  4 +--
>  arch/x86/events/zhaoxin/core.c                |  6 ++--
>  arch/x86/hyperv/hv_apic.c                     |  6 ++--
>  arch/x86/hyperv/hv_init.c                     | 26 +++++++-------
>  arch/x86/hyperv/hv_spinlock.c                 |  2 +-
>  arch/x86/include/asm/apic.h                   |  4 +--
>  arch/x86/include/asm/debugreg.h               |  2 +-
>  arch/x86/include/asm/fsgsbase.h               |  2 +-
>  arch/x86/include/asm/kvm_host.h               |  2 +-
>  arch/x86/include/asm/msr.h                    | 15 ++++----
>  arch/x86/include/asm/paravirt.h               |  8 ++---
>  arch/x86/kernel/apic/apic.c                   | 14 ++++----
>  arch/x86/kernel/apic/apic_numachip.c          |  6 ++--
>  arch/x86/kernel/cet.c                         |  2 +-
>  arch/x86/kernel/cpu/amd.c                     | 14 ++++----
>  arch/x86/kernel/cpu/aperfmperf.c              |  8 ++---
>  arch/x86/kernel/cpu/bugs.c                    | 12 +++----
>  arch/x86/kernel/cpu/bus_lock.c                |  8 ++---
>  arch/x86/kernel/cpu/centaur.c                 |  8 ++---
>  arch/x86/kernel/cpu/common.c                  | 12 +++----
>  arch/x86/kernel/cpu/feat_ctl.c                |  4 +--
>  arch/x86/kernel/cpu/hygon.c                   |  4 +--
>  arch/x86/kernel/cpu/intel.c                   |  6 ++--
>  arch/x86/kernel/cpu/intel_epb.c               |  4 +--
>  arch/x86/kernel/cpu/mce/amd.c                 |  4 +--
>  arch/x86/kernel/cpu/mce/core.c                |  8 ++---
>  arch/x86/kernel/cpu/mce/inject.c              |  2 +-
>  arch/x86/kernel/cpu/mce/intel.c               | 18 +++++-----
>  arch/x86/kernel/cpu/mce/p5.c                  |  8 ++---
>  arch/x86/kernel/cpu/mce/winchip.c             |  2 +-
>  arch/x86/kernel/cpu/microcode/intel.c         |  2 +-
>  arch/x86/kernel/cpu/mshyperv.c                |  6 ++--
>  arch/x86/kernel/cpu/mtrr/amd.c                |  4 +--
>  arch/x86/kernel/cpu/mtrr/cleanup.c            |  4 +--
>  arch/x86/kernel/cpu/mtrr/generic.c            | 32 ++++++++---------
>  arch/x86/kernel/cpu/mtrr/mtrr.c               |  2 +-
>  arch/x86/kernel/cpu/resctrl/core.c            |  2 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c         |  4 +--
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c     |  4 +--
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  2 +-
>  arch/x86/kernel/cpu/topology.c                |  2 +-
>  arch/x86/kernel/cpu/topology_amd.c            |  4 +--
>  arch/x86/kernel/cpu/transmeta.c               |  2 +-
>  arch/x86/kernel/cpu/tsx.c                     | 10 +++---
>  arch/x86/kernel/cpu/umwait.c                  |  2 +-
>  arch/x86/kernel/cpu/zhaoxin.c                 |  4 +--
>  arch/x86/kernel/fpu/core.c                    |  2 +-
>  arch/x86/kernel/hpet.c                        |  2 +-
>  arch/x86/kernel/kvm.c                         |  2 +-
>  arch/x86/kernel/mmconf-fam10h_64.c            |  6 ++--
>  arch/x86/kernel/process.c                     |  4 +--
>  arch/x86/kernel/process_64.c                  | 14 ++++----
>  arch/x86/kernel/shstk.c                       |  8 ++---
>  arch/x86/kernel/traps.c                       |  4 +--
>  arch/x86/kernel/tsc.c                         |  2 +-
>  arch/x86/kernel/tsc_msr.c                     |  6 ++--
>  arch/x86/kernel/tsc_sync.c                    |  6 ++--
>  arch/x86/kvm/svm/pmu.c                        |  4 +--
>  arch/x86/kvm/svm/svm.c                        |  4 +--
>  arch/x86/kvm/vmx/nested.c                     |  4 +--
>  arch/x86/kvm/vmx/pmu_intel.c                  |  8 ++---
>  arch/x86/kvm/vmx/sgx.c                        |  6 ++--
>  arch/x86/kvm/vmx/vmx.c                        | 36 +++++++++----------
>  arch/x86/kvm/x86.c                            |  8 ++---
>  arch/x86/lib/insn-eval.c                      |  6 ++--
>  arch/x86/lib/msr-smp.c                        |  2 +-
>  arch/x86/mm/pat/memtype.c                     |  2 +-
>  arch/x86/pci/amd_bus.c                        |  8 ++---
>  arch/x86/platform/olpc/olpc-xo1-rtc.c         |  6 ++--
>  arch/x86/platform/olpc/olpc-xo1-sci.c         |  2 +-
>  arch/x86/power/cpu.c                          | 10 +++---
>  arch/x86/realmode/init.c                      |  2 +-
>  arch/x86/virt/hw.c                            |  8 ++---
>  arch/x86/virt/svm/sev.c                       | 18 +++++-----
>  arch/x86/virt/vmx/tdx/tdx.c                   |  2 +-
>  arch/x86/xen/suspend.c                        |  2 +-
>  drivers/acpi/processor_perflib.c              |  2 +-
>  drivers/ata/pata_cs5535.c                     |  4 +--
>  drivers/ata/pata_cs5536.c                     |  2 +-
>  drivers/char/agp/nvidia-agp.c                 |  6 ++--
>  drivers/char/hw_random/via-rng.c              |  4 +--
>  drivers/cpufreq/acpi-cpufreq.c                |  8 ++---
>  drivers/cpufreq/amd-pstate.c                  |  4 +--
>  drivers/cpufreq/e_powersaver.c                | 20 +++++------
>  drivers/cpufreq/intel_pstate.c                | 30 ++++++++--------
>  drivers/cpufreq/longhaul.c                    | 12 +++----
>  drivers/cpufreq/longrun.c                     | 16 ++++-----
>  drivers/cpufreq/powernow-k7.c                 | 10 +++---
>  drivers/cpufreq/powernow-k8.c                 |  8 ++---
>  drivers/cpufreq/speedstep-centrino.c          |  4 +--
>  drivers/cpufreq/speedstep-lib.c               | 14 ++++----
>  drivers/edac/amd64_edac.c                     |  6 ++--
>  drivers/gpio/gpio-cs5535.c                    |  2 +-
>  drivers/hv/mshv_vtl_main.c                    |  2 +-
>  drivers/hwmon/hwmon-vid.c                     |  4 +--
>  drivers/idle/intel_idle.c                     | 26 +++++++-------
>  drivers/misc/cs5535-mfgpt.c                   |  6 ++--
>  drivers/mtd/nand/raw/cs553x_nand.c            |  6 ++--
>  drivers/platform/x86/intel/ifs/load.c         | 10 +++---
>  drivers/platform/x86/intel/ifs/runtest.c      |  8 ++---
>  drivers/platform/x86/intel/pmc/cnp.c          |  2 +-
>  .../intel/speed_select_if/isst_if_mbox_msr.c  |  6 ++--
>  .../intel/speed_select_if/isst_tpmi_core.c    |  2 +-
>  drivers/platform/x86/intel_ips.c              | 20 +++++------
>  drivers/powercap/intel_rapl_msr.c             |  2 +-
>  drivers/thermal/intel/intel_hfi.c             |  8 ++---
>  drivers/thermal/intel/therm_throt.c           | 22 ++++++------
>  drivers/thermal/intel/x86_pkg_temp_thermal.c  |  6 ++--
>  drivers/video/fbdev/geode/display_gx.c        |  2 +-
>  drivers/video/fbdev/geode/gxfb_core.c         |  2 +-
>  drivers/video/fbdev/geode/lxfb_ops.c          | 18 +++++-----
>  drivers/video/fbdev/geode/suspend_gx.c        |  8 ++---
>  drivers/video/fbdev/geode/video_gx.c          |  8 ++---
>  include/linux/cs5535.h                        |  2 +-
>  136 files changed, 484 insertions(+), 486 deletions(-)
> 

[snip]

> diff --git a/arch/x86/hyperv/hv_apic.c b/arch/x86/hyperv/hv_apic.c
> index 95f1782d1e17..4e30f9a11bc4 100644
> --- a/arch/x86/hyperv/hv_apic.c
> +++ b/arch/x86/hyperv/hv_apic.c
> @@ -38,7 +38,7 @@ static u64 hv_apic_icr_read(void)
>  {
>  	u64 reg_val;
> 
> -	rdmsrq(HV_X64_MSR_ICR, reg_val);
> +	reg_val = rdmsrq(HV_X64_MSR_ICR);
>  	return reg_val;
>  }
> 
> @@ -64,10 +64,10 @@ static u32 hv_apic_read(u32 reg)
> 
>  	switch (reg) {
>  	case APIC_EOI:
> -		rdmsrq(HV_X64_MSR_EOI, reg_val.q);
> +		reg_val.q = rdmsrq(HV_X64_MSR_EOI);
>  		return reg_val.l;
>  	case APIC_TASKPRI:
> -		rdmsrq(HV_X64_MSR_TPR, reg_val.q);
> +		reg_val.q = rdmsrq(HV_X64_MSR_TPR);
>  		return reg_val.l;
> 
>  	default:
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index 55a8b6de2865..bc8f91114868 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -101,7 +101,7 @@ static int hyperv_init_ghcb(void)
>  	 * returned by MSR_AMD64_SEV_ES_GHCB is above shared
>  	 * memory boundary and map it here.
>  	 */
> -	rdmsrq(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
> +	ghcb_gpa = rdmsrq(MSR_AMD64_SEV_ES_GHCB);
> 
>  	/* Mask out vTOM bit and map as decrypted */
>  	ghcb_gpa &= ~ms_hyperv.shared_gpa_boundary;
> @@ -134,7 +134,7 @@ static int hv_cpu_init(unsigned int cpu)
>  		 * For root partition we get the hypervisor provided VP assist
>  		 * page, instead of allocating a new page.
>  		 */
> -		rdmsrq(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
> +		msr.as_uint64 = rdmsrq(HV_X64_MSR_VP_ASSIST_PAGE);
>  		*hvp = memremap(msr.pfn << HV_X64_MSR_VP_ASSIST_PAGE_ADDRESS_SHIFT,
>  				PAGE_SIZE, MEMREMAP_WB);
>  	} else {
> @@ -183,7 +183,7 @@ static void hv_reenlightenment_notify(struct work_struct *dummy)
>  {
>  	struct hv_tsc_emulation_status emu_status;
> 
> -	rdmsrq(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
> +	*(u64 *)&emu_status = rdmsrq(HV_X64_MSR_TSC_EMULATION_STATUS);
> 
>  	/* Don't issue the callback if TSC accesses are not emulated */
>  	if (hv_reenlightenment_cb && emu_status.inprogress)
> @@ -196,11 +196,11 @@ void hyperv_stop_tsc_emulation(void)
>  	u64 freq;
>  	struct hv_tsc_emulation_status emu_status;
> 
> -	rdmsrq(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
> +	*(u64 *)&emu_status = rdmsrq(HV_X64_MSR_TSC_EMULATION_STATUS);
>  	emu_status.inprogress = 0;
>  	wrmsrq(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
> 
> -	rdmsrq(HV_X64_MSR_TSC_FREQUENCY, freq);
> +	freq = rdmsrq(HV_X64_MSR_TSC_FREQUENCY);
>  	tsc_khz = div64_u64(freq, 1000);
>  }
>  EXPORT_SYMBOL_GPL(hyperv_stop_tsc_emulation);
> @@ -260,7 +260,7 @@ void clear_hv_tscchange_cb(void)
>  	if (!hv_reenlightenment_available())
>  		return;
> 
> -	rdmsrq(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *(u64 *)&re_ctrl);
> +	*(u64 *)&re_ctrl = rdmsrq(HV_X64_MSR_REENLIGHTENMENT_CONTROL);
>  	re_ctrl.enabled = 0;
>  	wrmsrq(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *(u64 *)&re_ctrl);
> 
> @@ -297,7 +297,7 @@ static int hv_cpu_die(unsigned int cpu)
>  			 */
>  			memunmap(hv_vp_assist_page[cpu]);
>  			hv_vp_assist_page[cpu] = NULL;
> -			rdmsrq(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
> +			msr.as_uint64 = rdmsrq(HV_X64_MSR_VP_ASSIST_PAGE);
>  			msr.enable = 0;
>  		}
>  		wrmsrq(HV_X64_MSR_VP_ASSIST_PAGE, msr.as_uint64);
> @@ -306,7 +306,7 @@ static int hv_cpu_die(unsigned int cpu)
>  	if (hv_reenlightenment_cb == NULL)
>  		return 0;
> 
> -	rdmsrq(HV_X64_MSR_REENLIGHTENMENT_CONTROL, *((u64 *)&re_ctrl));
> +	*((u64 *)&re_ctrl) = rdmsrq(HV_X64_MSR_REENLIGHTENMENT_CONTROL);
>  	if (re_ctrl.target_vp == hv_vp_index[cpu]) {
>  		/*
>  		 * Reassign reenlightenment notifications to some other online
> @@ -377,7 +377,7 @@ static int hv_suspend(void *data)
>  	hv_set_hypercall_pg(NULL);
> 
>  	/* Disable the hypercall page in the hypervisor */
> -	rdmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> +	hypercall_msr.as_uint64 = rdmsrq(HV_X64_MSR_HYPERCALL);
>  	hypercall_msr.enable = 0;
>  	wrmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> 
> @@ -394,7 +394,7 @@ static void hv_resume(void *data)
>  	WARN_ON(ret);
> 
>  	/* Re-enable the hypercall page */
> -	rdmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> +	hypercall_msr.as_uint64 = rdmsrq(HV_X64_MSR_HYPERCALL);
>  	hypercall_msr.enable = 1;
>  	hypercall_msr.guest_physical_address =
>  		vmalloc_to_pfn(hv_hypercall_pg_saved);
> @@ -529,7 +529,7 @@ void __init hyperv_init(void)
>  	if (hv_hypercall_pg == NULL)
>  		goto clean_guest_os_id;
> 
> -	rdmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> +	hypercall_msr.as_uint64 = rdmsrq(HV_X64_MSR_HYPERCALL);
>  	hypercall_msr.enable = 1;
> 
>  	if (hv_root_partition()) {
> @@ -671,7 +671,7 @@ void hyperv_report_panic(struct pt_regs *regs, long err, bool in_die)
>  		return;
>  	panic_reported = true;
> 
> -	rdmsrq(HV_X64_MSR_GUEST_OS_ID, guest_id);
> +	guest_id = rdmsrq(HV_X64_MSR_GUEST_OS_ID);
> 
>  	wrmsrq(HV_X64_MSR_CRASH_P0, err);
>  	wrmsrq(HV_X64_MSR_CRASH_P1, guest_id);
> @@ -705,7 +705,7 @@ bool hv_is_hyperv_initialized(void)
>  	 * that the hypercall page is setup
>  	 */
>  	hypercall_msr.as_uint64 = 0;
> -	rdmsrq(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> +	hypercall_msr.as_uint64 = rdmsrq(HV_X64_MSR_HYPERCALL);
> 
>  	return hypercall_msr.enable;
>  }
> diff --git a/arch/x86/hyperv/hv_spinlock.c b/arch/x86/hyperv/hv_spinlock.c
> index 6b4bdea18218..7ef2d794e2e8 100644
> --- a/arch/x86/hyperv/hv_spinlock.c
> +++ b/arch/x86/hyperv/hv_spinlock.c
> @@ -50,7 +50,7 @@ static void hv_qlock_wait(u8 *byte, u8 val)
>  	if (READ_ONCE(*byte) == val) {
>  		unsigned long msr_val;
> 
> -		rdmsrq(HV_X64_MSR_GUEST_IDLE, msr_val);
> +		msr_val = rdmsrq(HV_X64_MSR_GUEST_IDLE);
> 
>  		(void)msr_val;
>  	}

[snip]

> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> index 185d4f677ec0..65ad235ef5c6 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -74,7 +74,7 @@ u64 hv_get_non_nested_msr(unsigned int reg)
>  	if (hv_is_synic_msr(reg) && ms_hyperv.paravisor_present)
>  		hv_ivm_msr_read(reg, &value);
>  	else
> -		rdmsrq(reg, value);
> +		value = rdmsrq(reg);
>  	return value;
>  }
>  EXPORT_SYMBOL_GPL(hv_get_non_nested_msr);
> @@ -399,7 +399,7 @@ static unsigned long hv_get_tsc_khz(void)
>  {
>  	unsigned long freq;
> 
> -	rdmsrq(HV_X64_MSR_TSC_FREQUENCY, freq);
> +	freq = rdmsrq(HV_X64_MSR_TSC_FREQUENCY);
> 
>  	return freq / 1000;
>  }
> @@ -645,7 +645,7 @@ static void __init ms_hyperv_init_platform(void)
>  		 */
>  		u64	hv_lapic_frequency;
> 
> -		rdmsrq(HV_X64_MSR_APIC_FREQUENCY, hv_lapic_frequency);
> +		hv_lapic_frequency = rdmsrq(HV_X64_MSR_APIC_FREQUENCY);
>  		hv_lapic_frequency = div_u64(hv_lapic_frequency, HZ);
>  		lapic_timer_period = hv_lapic_frequency;
>  		pr_info("Hyper-V: LAPIC Timer Frequency: %#x\n",

For this Hyper-V specific code,

Reviewed-by: Michael Kelley <mhklinux@outlook.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
