Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AB3C44536
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 22:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z2kUF+GWTlVcuDE6lhlchhZBuZYKg5hxpG4QekVYOzQ=; b=odpnIPYTdmWdzk
	B47LYybjPTafS60B2tVM9EJuTj7j7hrPYaYTDQT9RfSVapwgynM653zY70043CYg0hcoekNY6udUo
	AtLYl0RHE5GXNDQrUWaBpDrHLqJ5z7ywkfvb0TGbHsve0LTAiw6/SpgWAkeiqTgu997BC0HQC/TS8
	6I9MG4mGyYtL/aApQyG44s8UIhZmNyYUK46VlMHH6R8oEqEKoLEkBoqr01QhX3OUaSas/cYnQ32er
	5ie1cMQHIb/REmKT0ylMviRb1TQBDFCoo3Or/OZxrngHwUcf4xdT8MGdt4M8MNGavUFUGLkekBv9r
	5zGJwKlzS4ZpTnlWZUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vih8K-000000068RW-3IzQ;
	Wed, 21 Jan 2026 22:57:04 +0000
Received: from mx0a-009ae801.pphosted.com ([208.56.8.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vih8H-000000068R1-3PSk
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 22:57:03 +0000
Received: from pps.filterd (m0495959.ppops.net [127.0.0.1])
	by mx0a-009ae801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMXM3B3011553;
	Thu, 22 Jan 2026 06:56:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=11242025; bh=sK8z7PIKCjPSc3CiKLEeGJi
	+VPm0IoIcbr8a/K2x/pE=; b=KOufyP+k3KMJNAqB0i8ZaQnTGRHUG+ZTCD6RiR1
	ESjYIH3v61mCCdbso1HSEpHg417OZqhZ6j+DM8X5geXv/TMDuU0m0nk8lijud/W5
	nbHPCYzsPbZk1tmgA7LDUeV4mCqbjyeD8B4TKXu/4nb9bk3+aUhpd0iHDsJrJcGK
	NL+Avrfmmfrufh55ZIoQ5dhb9myqQ4ae5/oKjVxsXppKRdVcHEUXYNqj4KcB8QDF
	zdv8oO7770oa8Wg0rTebmhB5X/eJ0owhCLi+ioetIgZNqXZf+He55IB+lJUzTUri
	RxoSH4arxLmUSRZvABu56ZqkVMGRnk39mkH8x7T1KwW0MYQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020103.outbound.protection.outlook.com [52.101.193.103])
	by mx0a-009ae801.pphosted.com (PPS) with ESMTPS id 4btnec12fc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 06:56:32 +0800 (WST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vF4rM6e37fauJ6rP0OxzZw08cyZ+i7B8raER6Cd6afmOf5Nu5Z2+K9hUHjyMh9kS8IRvASIHN0GhlQjmYwU0Q+9qkDXizKH6v7CxJLBPQU1qEnou33bkjNH5xPRL3xaWBJnDDgB2H3qkrFVImR16g2Prg34islJrDyVD4g8VnLBMfKdh0MkRPUqMoyNbqDUApn2TWFaFotbOeyjcDn4n4u7qwz+vzVODZnerhVT6XHtAocew7cGL/eHtF/fYvmKjfAP0LMaQEy8ne9xR8o/RdozKUqHrDJwMdorgF4hg5VpR+/0uPJLPDwtVJmdw1pgEPzU+05wViFEFxKSrouCKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK8z7PIKCjPSc3CiKLEeGJi+VPm0IoIcbr8a/K2x/pE=;
 b=HmoMIfAkRviNa1LdHJRmEQYA62leOlnyR0gzUk27i0I8dJ8W2FRBK13hHYHNkS2hjF9c4y08SA4wr52OKoE/kk3Osdmx6E9cAfVaNvvWMg4/ZEWTLTwtz7ijKxcSdbQx57qLXic9Sulra8XkEU11kPXHTMzaXe60OXTiddWQTr3gisT4V9id2s9J2JmMg77N9suneTC5Bycm+BWcODkSA958eZ+Htu/lDekvRa9FMiFDCiXMI9+0eRAAg6W8y4JQNTKBi3CnxgA7swhXqT5jyx8oVv4JXj4tT9u5nnf0uLIKuepfdidKA3GaMCIrrpkT0oygpE81L6ihUjSVW8lKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=issi.com; dmarc=pass action=none header.from=issi.com;
 dkim=pass header.d=issi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK8z7PIKCjPSc3CiKLEeGJi+VPm0IoIcbr8a/K2x/pE=;
 b=H9l47WXcYIMn1hG+P1HnonJRmd1HTJhdSrJRDDLqIR1RsGOSEy0KonJMQA3pEqSE1GrgWuqvso6A53B2kax/d4aDQbkht7YP0hVQkBhQpbaS3ujeDfTEL+0OMFHQohEdq4+jCkcti1EG6aPSLIP2Q+3GekDxjXt4LVWqatJLrNg=
Received: from PH7PR19MB7361.namprd19.prod.outlook.com (2603:10b6:510:270::22)
 by DM3PPF59D2DD56F.namprd19.prod.outlook.com (2603:10b6:f:fc00::728) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 22:56:29 +0000
Received: from PH7PR19MB7361.namprd19.prod.outlook.com
 ([fe80::a7aa:919:7b51:2e07]) by PH7PR19MB7361.namprd19.prod.outlook.com
 ([fe80::a7aa:919:7b51:2e07%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 22:56:29 +0000
From: Jeffrey Yu <jeyu@issi.com>
To: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "computersforpeace@gmail.com"
	<computersforpeace@gmail.com>,
        "bbrezillon@kernel.org"
	<bbrezillon@kernel.org>,
        "richard@nod.at" <richard@nod.at>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        Ji-Ho Kim
	<jhkim@issi.com>, Anand Bagchi <abagchi@issi.com>,
        Ron Kalakuntla
	<rkalakun@issi.com>, Johnny Chien <jchien@issi.com>,
        "Mutya, Havish"
	<havish.mutya@amd.com>
Subject: [PATCH] mtd: spi-nor: add ISSI flash support
Thread-Topic: [PATCH] mtd: spi-nor: add ISSI flash support
Thread-Index: AQHciyavxZGeVSetPESVO5XTiuX7jA==
Date: Wed, 21 Jan 2026 22:56:29 +0000
Message-ID: <PH7PR19MB736163EFBE2A0D5D7EA107B3B696A@PH7PR19MB7361.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR19MB7361:EE_|DM3PPF59D2DD56F:EE_
x-ms-office365-filtering-correlation-id: 5eb3b3c7-417e-4142-40b5-08de59405073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?J18mKhJjKvUbRV9n5m2o+nruzR+Em74j9jkqAXuOJ8s8R3wFuv8w4HfKfW?=
 =?iso-8859-1?Q?gfEGU7IeOWZiMCr6L/TVVaO2jYQWujmp/0W6ScSv3ifoxQBD16xSdwcmov?=
 =?iso-8859-1?Q?YRjO0tge3acxysz2z1CxRCYbaC8itKlLQakVZ+YzOv79PI3LEAcKiHI4X4?=
 =?iso-8859-1?Q?qw0s2LAnN6BHhBj5VSzWGRxbtbSt31U2BgS7ksCZXMONswIjDkMlwneDUm?=
 =?iso-8859-1?Q?AgMcD2xcpRYfFcQymYlZFAPUfiLH7H78KzlyvC5qbUu87qqQW46Oj7tFuj?=
 =?iso-8859-1?Q?nGJIl2ZelNTg7ksK2wPISJhX1jhxLsqvu6vH4T48wcCx14VIPqSr993Hn6?=
 =?iso-8859-1?Q?KxBHLwxMsvQCRJN+muObe2j0YyhbuaomZfbCdMkIjEg6tR6lrc3PJVPZ05?=
 =?iso-8859-1?Q?jlGeS2i7NgVG6TneeeOmg2FbQET3jIGAN6RIOPeXNbVyCXosC4QllO5yyQ?=
 =?iso-8859-1?Q?18/yfCD5fp3jLe2vSHbf3VNympvhf2hziky3WLbn+6/x0AO5HzHCgL9yvE?=
 =?iso-8859-1?Q?SstAmeyXE0KTiHPhY12nig0hMgv6SQEgZ6Nwla/ZmqXYw/qi/rPTm7WO1i?=
 =?iso-8859-1?Q?Bf7meRbDJj8J0PKMHBn18WhjO0FdfWsbmOlLDc7MFy7Frt40DURBiwA2/w?=
 =?iso-8859-1?Q?z3WAZtfqMaoq8KiqfJCMo3Ld/7QU229xlyImxYagdVNMU/BL5OCWa8x7y0?=
 =?iso-8859-1?Q?QSZPq/2LMzSw4+HlCuggvd5SGcrSWjkB1ErrxmPwB5fVhjW4Hw5LTRLWsC?=
 =?iso-8859-1?Q?7e2nMc3m72CN9tGC4tlbS9H3e6HAWg4pnAfkGF2do1Ba/1LsMHwtxVFvoG?=
 =?iso-8859-1?Q?iLcyLAp7I01xbijstnItWCWoGOYy3lIPZPGe2fRK5WGZhlMXF7Zsk2Vqye?=
 =?iso-8859-1?Q?u4GpVqBQzc7sy6rpt99hiP9QwmGE+794dBp89LsqTtV+8BM1hXucafwH/H?=
 =?iso-8859-1?Q?TnRb4JfKb4AWhgs06fpQ3j/CiQYrN/01mqWJ8+ApXADZJ63XXZQpwDvZK2?=
 =?iso-8859-1?Q?QK87LfxEHRb1MUvMsq7OeI/gJyNGOGYfXD8N/AGOAJnd4n0WuLy/Ft+02q?=
 =?iso-8859-1?Q?P9d0Huvcb2uzMgQQwx1m5HD0CPQOlwjSgAjt8caZ/wGft41KbY4osWCp/M?=
 =?iso-8859-1?Q?8lhqeYWkIJ0ic2F9o8jSEBEmaw0KOtGOzjYtUhQgxu9ecVtWJ+j7sBTfZS?=
 =?iso-8859-1?Q?8ASd5VPNKYgwSknHKF+MhwAWbq+NJx/cPXH4WvcZNe8na2FGX4lxfcGGBX?=
 =?iso-8859-1?Q?6NtQGcQtZioWwnzJq+Op8mxng8mSam2G85cl/7pUW5P+zD0WylrFmviyDe?=
 =?iso-8859-1?Q?FbaGKz9Xms2OF+jt8O+zC45wRNYDNB3ORX6/8+oS1+SIaxP4BVSDol2yli?=
 =?iso-8859-1?Q?2RkiJwy2Q14/ncLoHIAOVpHGVMVyDhdFyIWztmSuwd32hLEN+UOemsAO0b?=
 =?iso-8859-1?Q?W6r8jsIF92htCRlWBJjjyt4ikAxTncq7r2yIPPM9E5bH2hAE9cdTf8LHhy?=
 =?iso-8859-1?Q?NNgIy2pHHqeij7GeOytUg33sfRupfgWcuxkrmJINjKC0T/7xgfsbTbP8Kb?=
 =?iso-8859-1?Q?iD8GdlBnppFgWWs4IuqJpnou6itrxj2Micn/7+h80W48k+fIRL5Rn1iygT?=
 =?iso-8859-1?Q?GVgg1viq3LW4wqgIeK5yJ5TuHZTuBtpgcmSD02GuLuZvZykUWFRBJVjDiG?=
 =?iso-8859-1?Q?cspbGXzQeLg1ALdvgrc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR19MB7361.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NUMZv4FHLpq+3VypzotLlPoMDNuaTtYJ36IRHxd3YkZ4mPRj+Eenrlm/8Q?=
 =?iso-8859-1?Q?sT6m1ByTimnhfe0ZdT1I9ZH6+8XLNHbdpTpsYOdBHJMBmCTtiTL6AJINda?=
 =?iso-8859-1?Q?aZPip2aj2O8OepiuKjU5hdJIkG5Rn6U/NBcaduSyVzthgAoSDu0swiVaZX?=
 =?iso-8859-1?Q?xLL4Um28IqOxMOneHLX2WMDt8dw4stI0F6eX8VBoawP04mLsAWLT1Yw25D?=
 =?iso-8859-1?Q?njxtmMfAyfkd0hrBsaqoDd2shjJhXNUqQV8t2XTNZ4c+GZDWV8A1E0Axxm?=
 =?iso-8859-1?Q?abkvhO2IIZh/R6N2eur3+W6ClgSwtXL90GxJvhegKZZcvBd77s0fDGa224?=
 =?iso-8859-1?Q?or0j+edo6+C+3T3bFlh1/y+gSN5uUqv+0SIMJV8lJnI4/zHu5Q1sNKrq3B?=
 =?iso-8859-1?Q?shtUyH/4QYCMLrNETki/M5JShbUc+8Ic7DBisp3oWNTJ4I5eFbz7+s1bgX?=
 =?iso-8859-1?Q?No/oCuwCvhdA7H7uUDEDvHsjKTCDLBN2TgG+RvpotfY6wxK3jx8ZKDKSo2?=
 =?iso-8859-1?Q?E5hNvSBcsEgDB2/Wmc0aSoi7RnW+OTo7QfAU65QGVyoT6bPRF+eBkh2Kn3?=
 =?iso-8859-1?Q?IJsX0ppkSd+CQFQH8W6IZMi9oSP2SSALasty6mhlks2YqDi2bCm+aMdF68?=
 =?iso-8859-1?Q?y7MMHnQKiyitH8uE2QcUxcpWS0gvw2P997QKAzQ9bLkS8Ocg6ENccHMjEi?=
 =?iso-8859-1?Q?p3Wz5hoKPa0mIx7lzeNkj0+i4tnXaIl1dyUvNma5z1HhEn5tbS7ron+N9V?=
 =?iso-8859-1?Q?sBpqcCj0WyJQU9WL6BSsSlTuXdlxxvpLx5RGzlwS3ZF/vHRwLTQ4i9UeO3?=
 =?iso-8859-1?Q?Fg1qDm6ZSxs3Uu26EKoZOw3oQmoC8mc0S/3tfqlKQFOJx8jTxAaUa4BcK+?=
 =?iso-8859-1?Q?warQWsPQzSAx+rgJeJCuwraX50+1rXNwlxRIgc756ew9B51zDrsx9oQwrM?=
 =?iso-8859-1?Q?n7poGSKusv/nhSQJI9m6GCh4pKcufXjx8GXd0PayDflCC0qjSawCjdVc/a?=
 =?iso-8859-1?Q?ZTxu6IJBndN82etWOmdIzsMrkj3f8S5jt7O4/Wd3UVfDMIDJXTPSIfGPcv?=
 =?iso-8859-1?Q?8NXpNphOYD1d9XlDhXwJSnOHN76sUpCAGViJbalmymsWXs8zXKhZqDV+is?=
 =?iso-8859-1?Q?DXnJOEiTwjkdRZAtRFQNwowntXws9/UmHka6/fljBLXLJabTJJwW56VC1t?=
 =?iso-8859-1?Q?+bcYOjq1t6UxrABdVevoqsSAxsrQCyfr5YJT80tOvcJrMPeP0onkznDky+?=
 =?iso-8859-1?Q?XO82v8m2WObrR2A+2rOVg/qd07kaIQ21ZepAgZT+JIgZkDzvSnXmn/DyF0?=
 =?iso-8859-1?Q?oEwmpacC+V06CNZZwm6BgjtPabqyi7oGXHzUH2dWFxbzlPiL2XdF088ntI?=
 =?iso-8859-1?Q?Jk+Jp5zVY4LxKY8TAuCN0wirMYNiBBwtCyEKMBnhxJcLFMSf3AOag+PhpD?=
 =?iso-8859-1?Q?Yb8qerzpmTyfofG2An0+LORFfAF7qoNJRNu+tD+TDJuC6roQ/B/5LtCZaP?=
 =?iso-8859-1?Q?LYsdLhHRlZpK8mHl3DdEyDm/4u17RaTKT5YpN4HfIOK2KbmxWLnO6A2Shl?=
 =?iso-8859-1?Q?FYr5gsyAru5jlvutnZQZWB4UnvC1O6CSwGkO4lXeqqzrwnKENgTW300B52?=
 =?iso-8859-1?Q?gQQWzCEqmTmVrjDU9vMEsasHNuw3wCSkT8Pc3gVv5o/uL1RiurIho5dZOL?=
 =?iso-8859-1?Q?vIdZbu/1kIS0DphXJ8AqlNgG6WGyiWdXN4WI+SEHuFoEPXwzPWJQJqUdVL?=
 =?iso-8859-1?Q?P26AEiHK1lrqQdkb9JUE3TrrU=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: b4ZW6JWHKuAsoMszQ+rcxVTsJeAkXQxqdqONHAU/JbOn3NgsPMeb3hCZKUEGSTd8aiAbfxCSuof+J6qA7V9WJVqkSWgTmp10wcWxYaH35ctDOil8U+yQ0USvOvUTZMcphc/j6qnaIE/McwkpMQnWNCVCOMXq3DmzT29g09TUvPBX/0dcF0UECojNtB4Ax3WzyjY1hQ/Um6PeOGP7noyLfJ1cCjOMZEk/Sz+GpyIdDJ8OqphBaY4Uo1BBfHbPSyES2J0dwEj52wC0BwU1htMJonW/O1z1/pZKanS9hHpHWE7MZvWV1C6zHMJ71f2Pb0nTHtpjsXOWTNUGdRMcAZNbc3mVYKDtNThBjSGtU+WCSZ4FCE0ifIyWGKqH+QLSeTrN4JQTUHRw0UVFhk9IGEKsk4nCvZuaGjikjmtLAZjo1bMoy7ylq+0yFCOzeDg6+aqi8MpG1erllGY2FbUhDr93efsZ0cOcOgv2qVcT3uky69Oh50aCMr5qbQZ35CkGaTdoFyOpayAkwKf9aWMZMrsLgZiXz9Mle2RYnlzb262IwEF7ngAnTOp5ioEyWBFSuvox8+n/B0pPtJQoRPxsniEy6Af+AbAUZTA2OTo80Bb8wy4P3Lx6RXoQaA2oYpzJ7syD
X-OriginatorOrg: issi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB7361.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb3b3c7-417e-4142-40b5-08de59405073
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 22:56:29.5267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6af618fc-4f7d-45f1-a2f2-8c59a26d2c10
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UGVvdSeO9NbUVCensHzUiDjd0MJz7PSqgDbSCSxWu7EGNamB95nWkpnMDNvQlg3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF59D2DD56F
X-Authority-Analysis: v=2.4 cv=Q6XfIo2a c=1 sm=1 tr=0 ts=697159a0 cx=c_pps
 a=Zp4+jYQMTYkjuDMG4rCdsg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=ozMtBe7fU4EA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=DUnRZS7UAAAA:8 a=lqh-w_4vWldSmBgjdVIA:9 a=wPNLvfGTeEIA:10
 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5MSBTYWx0ZWRfXyDhDnABry97T
 nkctNkcwdoF97KqvNiIXoxtZvBOBXnVuvwRc53tZqaO0gc0qbAvdOJPV48vGuZn+kICoBWCDoET
 oDN/Gs75GzKVHgKf6Dw2fnwxbvd85X3hDrfkdIdN8KCaIcTJXpBlp5nqKwDEmwpeSuCjJgCJVwa
 NVPadOjvokh+zi09CLeRks7Z8ONbR9eTONdgHEcJbs868Vadm3oAi7PYzedFpEUx4yIwpNDNcS1
 353iq+MQGTVchruSUPI3rg50WOE+If7LGd3Kp0hD/Rj9D4aWSs3HKliP2JqlM37P4V7CPqC9DNW
 AwtbjAXt+gxpL1f7XxgR73RDUKTH5zqbO1H6THn5D0ZSnbx7lxRvN5NKs9FlKe+nNaH/dYIs8pw
 Llo+haLNvX+vqL34rmmI35C+w0VfxXTHFg9WCpkS8FgNeWBIgRI34RT/Ksbdi/sxGaExNOVMvEK
 LejK0b3sdqEFyj5lYQw==
X-Proofpoint-GUID: WIjZH4_-qGtCls1t55bwi9hJOwp7_ZvW
X-Proofpoint-ORIG-GUID: WIjZH4_-qGtCls1t55bwi9hJOwp7_ZvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_145701_877522_6B5645F4 
X-CRM114-Status: GOOD (  11.32  )
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

Signed-off-by: jeffrey yu <jeyu@issi.com>
---
 drivers/mtd/spi-nor/issi.c | 571 +++++++++++++++++++++++++++++++++++++
 1 file changed, 571 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/issi.c

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
new file mode 100644
index 000000000000..a569bbc98df6
--- /dev/null
+++ b/drivers/mtd/spi-nor/issi.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+#define SPINOR_OP_IS_DTR_RD	0xfd	/* Fast Read opcode in DTR mode */
+#define SPINOR_OP_IS_RD_ANY_REG	0x85	/* Read volatile register */
+#define SPINOR_OP_IS_WR_ANY_REG	0x81	/* Write volatile register */
+#define SPINOR_REG_IS_CFR0V	0x00	/* For setting octal DTR mode */
+#define SPINOR_REG_IS_CFR1V	0x01	/* For setting dummy cycles */
+#define SPINOR_IS_OCT_DTR	0xe7	/* Enable Octal DTR. */
+#define SPINOR_IS_EXSPI		0xff	/* Enable Extended SPI (default) */
+
+static int spi_nor_issi_phy_enable(struct spi_nor *nor)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		goto ret;
+
+	buf[0] = SPINOR_IS_EXSPI;
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+	spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		goto ret;
+
+	nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
+	/* Read flash ID to make sure the switch was successful. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+			   SPI_MEM_OP_NO_ADDR,
+			   SPI_MEM_OP_DUMMY(0, 1),
+			   SPI_MEM_OP_DATA_IN(nor->info->id->len, buf, 1));
+
+	spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		goto ret;
+
+	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+		goto ret;
+
+	return 0;
+ret:
+	nor->spimem->spi->controller->flags &= ~SPI_CONTROLLER_SDR_PHY;
+	return 0;
+}
+static int spi_nor_issi_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf;
+	int ret;
+
+	if (enable) {
+		/* Use 20 dummy cycles for memory array reads. */
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			return ret;
+
+		*buf = 20;
+		op = (struct spi_mem_op)
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+				   SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+		if (ret)
+			return ret;
+
+		ret = spi_nor_wait_till_ready(nor);
+		if (ret)
+			return ret;
+	}
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (enable)
+		*buf = SPINOR_IS_OCT_DTR;
+	else
+		*buf = SPINOR_IS_EXSPI;
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+			   SPI_MEM_OP_ADDR(enable ? 3 : 4,
+					   SPINOR_REG_IS_CFR0V, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+	if (!enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
+		return 0;
+
+	/* Read flash ID to make sure the switch was successful. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+			   SPI_MEM_OP_NO_ADDR,
+			   SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
+			   SPI_MEM_OP_DATA_IN(round_up(nor->info->id->len, 2),
+					      buf, 1));
+
+	if (enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int is25wx256_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_set_4byte_addr_mode(nor, enable);
+	if (ret)
+		return ret;
+
+	return spi_nor_write_disable(nor);
+}
+
+static void is25wx256_default_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->set_octal_dtr = spi_nor_issi_octal_dtr_enable;
+	params->set_4byte_addr_mode = is25wx256_set_4byte_addr_mode;
+	params->phy_enable = spi_nor_issi_phy_enable;
+}
+
+static int is25wx256_post_sfdp_fixup(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	/* Set the Fast Read settings. */
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
+				  0, 20, SPINOR_OP_IS_DTR_RD,
+				  SNOR_PROTO_8_8_8_DTR);
+
+	nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+	params->rdsr_dummy = 8;
+	params->rdsr_addr_nbytes = 0;
+
+	/*
+	 * The BFPT quad enable field is set to a reserved value so the quad
+	 * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
+	 * disable it.
+	 */
+	params->quad_enable = NULL;
+
+	return 0;
+}
+
+static struct spi_nor_fixups is25wx256_fixups = {
+	.default_init = is25wx256_default_init,
+	.post_sfdp = is25wx256_post_sfdp_fixup,
+};
+
+static int
+is25lp256_post_bfpt_fixups(struct spi_nor *nor,
+			   const struct sfdp_parameter_header *bfpt_header,
+			   const struct sfdp_bfpt *bfpt)
+{
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	/*
+	 * IS25LP256 supports 4B opcodes, but the BFPT advertises
+	 * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY.
+	 * Overwrite the number of address bytes advertised by the BFPT.
+	 */
+	if ((bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
+		params->addr_nbytes = 4;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups is25lp256_fixups = {
+	.post_bfpt = is25lp256_post_bfpt_fixups,
+};
+
+static int pm25lv_nor_late_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	struct spi_nor_erase_map *map = &params->erase_map;
+	int i;
+
+	/* The PM25LV series has a different 4k sector erase opcode */
+	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
+		if (map->erase_type[i].size == 4096)
+			map->erase_type[i].opcode = SPINOR_OP_BE_4K_PMC;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups pm25lv_nor_fixups = {
+	.late_init = pm25lv_nor_late_init,
+};
+
+static const struct flash_info issi_nor_parts[] = {
+	/* ISSI */
+	{
+		.name = "pm25lv512",
+		.sector_size = SZ_32K,
+		.size = SZ_64K,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &pm25lv_nor_fixups
+	}, {
+		.name = "pm25lv010",
+		.sector_size = SZ_32K,
+		.size = SZ_128K,
+		.no_sfdp_flags = SECT_4K,
+		.fixups = &pm25lv_nor_fixups
+	}, {
+		.id = SNOR_ID(0x7f, 0x9d, 0x20),
+		.name = "is25cd512",
+		.sector_size = SZ_32K,
+		.size = SZ_512K,
+		.no_sfdp_flags = SECT_4K,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x7f, 0x9d, 0x46),
+		.name = "pm25lq032",
+		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x13),
+		.name = "is25lq040b",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x14),
+		.name = "is25lp080d",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x15),
+		.name = "is25lp016d",
+		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x16),
+		.name = "is25lp032",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x17),
+		.name = "is25lp064",
+		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x18),
+		.name = "is25lp128",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_BP3_SR_BIT5,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x71, 0x18),
+		.name = "is25wj128f",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+    }, {
+		.id = SNOR_ID(0x9d, 0x60, 0x19),
+		.name = "is25lp256",
+		.size = SZ_256M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &is25lp256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x1a),
+		.name = "is25lp512m",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x1b),
+		.name = "is25lp01g",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+						SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x21),
+		.name = "is25lp01gg",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x21),
+		.name = "is25lp01gj",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+    }, {
+		.id = SNOR_ID(0x9d, 0x60, 0x22),
+		.name = "is25lp02gg",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x16),
+		.name = "is25wp032",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+						SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x17),
+		.size = SZ_64M,
+		.name = "is25wp064",
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x18),
+		.name = "is25wp128",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x19),
+		.name = "is25wp256",
+		.size = SZ_256M,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+				SPI_NOR_4BIT_BP | SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &is25lp256_fixups,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x1a),
+		.name = "is25wp512m",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x20),
+		.name = "is25lp512mj",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+    }, {
+		.id = SNOR_ID(0x9d, 0x70, 0x1b),
+		.name = "is25wp01g",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5b, 0x19),
+		.name = "is25wx256",
+		.size = SZ_256M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+			   SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5a, 0x1a),
+		.name = "is25lx512m",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x22),
+		.name = "is25lp02gj",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x20),
+		.name = "is25wp512mj",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x21),
+		.name = "is25wp01gg",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x21),
+		.name = "is25wp01gj",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x1b),
+		.name = "is25wp02g",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x22),
+		.name = "is25wp02gg",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x22),
+		.name = "is25wp02gj",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x11),
+		.name = "is25lp010e",
+		.size = SZ_1M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x12),
+		.name = "is25lp020e",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x13),
+		.name = "is25lp040e",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x12),
+		.name = "is25wp020e",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x13),
+		.name = "is25wp040e",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x16),
+		.name = "is25wj032f",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x71, 0x17),
+		.name = "is25wj064f",
+		.size = SZ_64, 
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}
+};
+
+static void issi_nor_default_init(struct spi_nor *nor)
+{
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups issi_fixups = {
+	.default_init = issi_nor_default_init,
+};
+
+const struct spi_nor_manufacturer spi_nor_issi = {
+	.name = "issi",
+	.parts = issi_nor_parts,
+	.nparts = ARRAY_SIZE(issi_nor_parts),
+	.fixups = &issi_fixups,
+};
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
