Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E29CD5BB8
	for <linux-mtd@archiver.kernel.org>; Sat, 23 May 2026 00:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WxD/h3ciSUxBPYbLopigx/sVx6Aw09/PHmENZsrpmeA=; b=FsJenHAWC/F0O3
	852uT4cXj+JKrPPgqZOCnaA1NHsYH0vIRRejSxUW+PwTGpPXFRW0CFNRJzSd1UoROJP8GVvBMp7Q9
	sfDhNUzDHwoBvlZfvrzHpwzIXIxpOYDu6CzW7k+MCOAUKvMUBwmlCc4TCEwLGz5f1SvK5o5pnOCpG
	/oF2udNI57E1WEWCahVhwcEqFHYcgtaStdv4ANYj0h9e2dxDkCm9PZWVl2oXx7Zwa2gFByxzIR7N7
	Zm3VR5D1DlLAXupAl9hQjOqNpoElWgdB1Ro8zt1ycYOTvFmuZywwFM0xWOiRtc+ARenCLFMlXc3xQ
	1LvhL/sDtA6oiz+WzuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQaNr-0000000CKl0-1mcM;
	Sat, 23 May 2026 00:38:31 +0000
Received: from mx0b-009ae801.pphosted.com ([208.56.12.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQaNo-0000000CKjr-01Qc
	for linux-mtd@lists.infradead.org;
	Sat, 23 May 2026 00:38:29 +0000
Received: from pps.filterd (m0495960.ppops.net [127.0.0.1])
	by mx0b-009ae801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MNvZ2g1597369;
	Sat, 23 May 2026 08:37:56 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=11242025; bh=ssqtisTv1UNKq885vrKmPVx
	FrW5Kz2x+5u0hqO7Z0ok=; b=XioQKdz4UP227YrWQ1e0NJqyOHVgUyZR765qFnW
	X66hUna0zkmbj3mpZJMdrfWce9FqcVef2nhsG1M9/IgP97xV+7yIg9MVxYOW3H2o
	Iiii0ugo8n26Pj53lJFJv7gaiBOExywMWMBdREq1lozmjnlTkcu+Ffrx88SAZ4Ju
	I4CpPIu01X4/zUCov0IkKvl6jl6bFmrE61lRBQiWQQO6FVrfHKiB0wFnUR8XpnjC
	qVzZPzmceS3cxlVHlyvVuZz2iIg8KRBCsptad4cXIHuA6LHtlofHRgvldS3ZY07d
	T4dCEe56WHKCFie/4ehfoGbzwdDdX9F4FjSpRw2kAf24PSw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023126.outbound.protection.outlook.com [40.93.196.126])
	by mx0b-009ae801.pphosted.com (PPS) with ESMTPS id 4e9fcs9p5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 23 May 2026 08:37:56 +0800 (WST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cB9FK3f5RIg3KiaV5+zkGk//i8FUqKUA3SsSwIxB9V39ROJ9ulTn5IiiMJq5OsZFRcP8ZoXybaLSxWd65B7srytIKCmwa/tga3omq6ZojdsgjKQG6l4lCM8PYBUW56FYmspyY4RXqdtw+WOQpBvVAqrICv7EWFCJ/B1CNUMe6Am6GNNMZJ2SWuivP03gJ4V4Vb2TBpwm0+mzU2fa8GHoN+anin+UgQh++XJGUjNoLLM6ErPeQhqvf5LNZcXDWo5F6ybZM9Qb3Ib3e44HxNcLcaNP2F56rkUGjsZr5NhVm8KgGfmwKo5cVa1tsQhS0hQcIC8Vx0L4/8fA89/uyidZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssqtisTv1UNKq885vrKmPVxFrW5Kz2x+5u0hqO7Z0ok=;
 b=HmY4POwPKEzYo6JcENjJWYcvfu6ysvixAXPu4YfCWjUwqAwvQxigf6VK9zJk7qRICw0oblBpwebP0prVimRXqp/w3dRH4NXKdNCyacaEnAeyEjqb53UOtAOsBdQvLfOJbyLC99BGVQ8SKywFivdplw3a7vsaz8vMMR7oIoqLCf+XPYpCRpPyGYV5d3fpfR2ALtvJAYyEoIaPLLE/DLGJQHyJOzBXZhsenP1xd9WmgIB7mm8vU259++oyA5ADf0V5eiDYKLskA3bTo8UJGn0x9VoceRAnw0F7XRlpzwtZmbZ6P4oSOZKRsqzYmP0XguMUb5F9lv9+pzux/ETn+1qohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=issi.com; dmarc=pass action=none header.from=issi.com;
 dkim=pass header.d=issi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssqtisTv1UNKq885vrKmPVxFrW5Kz2x+5u0hqO7Z0ok=;
 b=O6L7rkaRo8yDHBvFx+EgUcKh+YsBFSrstxzzF5kYXg1qz6nNuMZl1AMnNDtuTexRgX1PR5g0z0gLnvV0qo52QQbdGafyyoCaOAQxdVhcZDR3Q5KCauCgVe5Evecr0O0hp03+xELZLbUH7uIRIDhEr3/VinVnld59QFLDzCToJlE=
Received: from LV8PR19MB8597.namprd19.prod.outlook.com (2603:10b6:408:25c::15)
 by SJ1PR19MB6283.namprd19.prod.outlook.com (2603:10b6:a03:45a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Sat, 23 May
 2026 00:37:52 +0000
Received: from LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713]) by LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713%3]) with mapi id 15.21.0048.016; Sat, 23 May 2026
 00:37:51 +0000
From: Jeffrey Yu <jeyu@issi.com>
To: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "computersforpeace@gmail.com"
	<computersforpeace@gmail.com>,
        "bbrezillon@kernel.org"
	<bbrezillon@kernel.org>,
        "richard@nod.at" <richard@nod.at>,
        open list
	<linux-kernel@vger.kernel.org>,
        "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
 devices. (Octal SPI 2026)
Thread-Topic: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
 devices. (Octal SPI 2026)
Thread-Index: AQHc6ksyWgUP/M+iqUuPkNVVqRx5NA==
Date: Sat, 23 May 2026 00:37:51 +0000
Message-ID: <LV8PR19MB8597388B13A88785EF90CCAFB60C2@LV8PR19MB8597.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR19MB8597:EE_|SJ1PR19MB6283:EE_
x-ms-office365-filtering-correlation-id: ff4dce57-23bf-4c21-9af8-08deb86385cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|13003099007|56012099003|18002099003;
x-microsoft-antispam-message-info: CsPX9ATCA+XnTjcGgvro83e9yEgXd5zLBqYqyWCIckNUbmoa59XngxlbOQTsKPl/tOPceCqyaRb6qXCevOok8IHVV4C5EGvgPkqetX2aFRZ+afZy3NYpxW/9ocbYQIMUzIppBlBWXJCHvJz89PNFdai6peK6I+RMuMvsa9m/qGGV2rCZQjlmizEiJlSdN/YHK8eYz9odPHTPQCfqyYYiEIX/2gRNFh1ywWJsYGi/gdsV3y+z4LFyBR3EJAt7cDzZsrkAfUqXEdcBMchCNYxbyKfE89KyZruFJyaocthtM5LBOS0Oq5Eukau2ixyNITJ+Xwu5TUtQMdlkFoYlYjyWKbL+3/DhJ5cAgfJCIEBJnu3FUJX2H6wfEBU4cuFC2FM5f8/9xnG/vcjNc7bn5Ao1I//YIkIfMMgXlLDznh3T+4PMN77QNH9zf+IJKLMQT1adN9rCdUrruW86plM48rjRbIkeMMH2UdrpDk0Iu1B2nZcgnk+I7Ms//OVEWj4w/VdSjVJ6Zvu2pDMTKmyHW0M4yqL9P6JNPMPNr+3dVxGcAAgdQvjqPeHZMCwY1vE+TnKZ5OUbWvBcxI91/3ppogNVYPRk82NGv9U9M1Sxhe5LxRRUR28nMn2HV9lxp2yJJd5pcTagJTI8W/A1+Q3OOwsVJewaDp+Kg+H578Gr1IaBIYkL8JF21DOoyvDt1jRey21UuzXTRKJxsV06iCaksQvWVg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR19MB8597.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fywS/tX+C+ghp3ApthrABaOFGXOqf3nvXsg0GHEqQ/0/WJ0zr1f+pHUHlQ?=
 =?iso-8859-1?Q?MX3pyCBFz3W0pbO723Wcab8bt1Y1YFzPZtk3L3/Kcu/IVPhEFtMjPzveM/?=
 =?iso-8859-1?Q?N4XFyN9iJiExM43Sy7ANSdQYYV0hxj9m1/E/x3P6U3QUYGNNBXs9AKKXrG?=
 =?iso-8859-1?Q?gFgmPi9e5Xb1A3i6vnXND6lFGOpcqf6xw8qVjHWAk4ECNHM2gKBoaE8est?=
 =?iso-8859-1?Q?fQAIWy9q4TLHVleoTk8fClrCP52VugdF2clFbcePtEoaptxDeRC7LaSYUk?=
 =?iso-8859-1?Q?nY1OrPMDkCqxbd2N+5D8m19kKhZ8zOVyvcKe6R7sqI+//ETKEtaVx51Mwa?=
 =?iso-8859-1?Q?cP68fVUYkZuOR1/X+ndBI4bJdswGLxdnyuWPCUjEzxXShKpbcgdCiod/CL?=
 =?iso-8859-1?Q?aGiOGZRqh590h3zgiUydVJghEMap92TrccKy4nU55vpcYgrb3Jpju5CZ4s?=
 =?iso-8859-1?Q?4IhpcjLtN9ofiPXB716les95UNDe8tMKCtnYo3dDV6kDM8tupRUYklcHbO?=
 =?iso-8859-1?Q?j36aVUDlmLAVi4BgCOztRTfgYZkBluomTI7M9hADfdPjDPxqKTW8NaXfFt?=
 =?iso-8859-1?Q?yl8EqM6oKbBswPKxvxObKKRzZx4bOSS8ATAOOklby39Nxhs/9yWXyTVtjq?=
 =?iso-8859-1?Q?sL7kmj3FhCxxgJwUUjMYzOHhl71xYf1d4zTn+GntY11K3LHUWyqGuD5VbR?=
 =?iso-8859-1?Q?RJ53z6EiTcUkIWdCI11YM4pzQ4hzo0b2zmM7De9IIPCjpIOG3e9Zz12f0M?=
 =?iso-8859-1?Q?8zoYlz72Sf06EKI6OCyMWa/0SS0Rb22d+Ef+Y/iTGdGaQU28+DCj+PiC9c?=
 =?iso-8859-1?Q?BGlPGdWM0x2xyhcs1d8TmiUhZgo059jHEWwcOyHtEvEDP3mJG9Nbc3JZoF?=
 =?iso-8859-1?Q?W/l0D7P4U3Y3TtweenKvvJnOWBEvBfPSb/vFgN4T++kMZgL8NvPlVPo4Ms?=
 =?iso-8859-1?Q?N/7uId1m/YqATFgYsXHUO8VoDu2NJLw114s6DSGe3eFa8dgTMk1m4ugx3P?=
 =?iso-8859-1?Q?/1punXBtMlp8ltVTWF8zHUhHkzeYD47Ecuu8ko7K8Qy+lzYmhulJovXPq0?=
 =?iso-8859-1?Q?rh+q/NCGmjTw/3jqm+/RMayMXvce2Uwgts0LZdl5LVA1cenmrjUs1ynH3B?=
 =?iso-8859-1?Q?DABwzBnt8viJeFylFaWEJBuKoW1Mq+EbRXJyEzf29p8F8uOkJfQ7NFZs4x?=
 =?iso-8859-1?Q?ogaNG3JrEo/7viI02jYS5bhk1BusY9mUrIRODmK/nHSyXWmKZK5kdNtYAO?=
 =?iso-8859-1?Q?XPdLrjXKAdVaKpQJVC+5+eObHgf9zpDNuUxrZ6Urqg6y7XuvwI9jQTfIQe?=
 =?iso-8859-1?Q?MNDFwKKyN2zzxyZgbnprJl65Cf0pgEXctUhsH2J3RwhSvD6ynNrdkBa+oX?=
 =?iso-8859-1?Q?hHJF1XCEQthK0q7IKMbqg/+pOwyP4O+YajTIv0bqbr0n37NZWi6BsEQlq3?=
 =?iso-8859-1?Q?bA4KyGWsBOIuErcRl0hIr0pDkpuRFiM4RdKRa3ypPztBuoOHkAFB/h+cnA?=
 =?iso-8859-1?Q?bP3SNIMmBp3e0oSUVSvCozM6rKxRGXPvStwJ24mofLZukWHJpmnvwUivKM?=
 =?iso-8859-1?Q?U7opGYiRmbRa04CyJyjxecTMvvInTfwm1gkVyQqxogULQmKs9d+7wQlsBj?=
 =?iso-8859-1?Q?uYYB3I2C9ruBXUX6Y/mQRM/BQhAv0R45DCzSJemNvQR/Te/wkZnrK+Hikb?=
 =?iso-8859-1?Q?nRkQvymln2hZKj0jslCdOmUaQpXmjmbBKeDsdfS+SytRBm+K2EpslKMimz?=
 =?iso-8859-1?Q?lzQRs3rfzL4EN3JiLlV4HAHnw=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mYUGtADMeOWLlOpijE1P5dGAVCa1CihrmNxGvAtKaM5+1eTDn4bZuqrFKaJ8N2fQd8ekme7USkQB8H/WJMjG+dTe1K0hiRmalPufo9ZhzHxrFmG2KvJFvhWgNfDNzxKFZMXg0SZRmfLJ14S7va+/T4TVzY/au/9dCmBPvHAi7EQrVB8thG9o5fBxbnw1lBo8+biVPkR8ILdyox3S25URlj99Ra0NrFhL73sARzV/ckF9vej8aGCpYI/xoUuMTX2xE/zYW6CtUmYCHnHvA338/7V9COOcq+fRfV7UEKfnrhY5if4aMDirF78y22kHjkWApnYzoFCSFdAt4G8otcgF6g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hkRKeA4I2lvz4iWlGTEHy2jap0ZqlgULwwXaoI2U/ZUtLe6QUrGQVDttIxhCyeIjMOHdKShUql5288WXACZm4j9nQHpKeST9AASUkNU0DNW026lOFsTwEwFlUzV7tKSN6ZkzmNxPCl+EO3uo/9OUkBAZm2K9uYudbZIcKXp5sseT4fTIb3Dc3mI4ZGV1+3LLtqdh7mYZZzTZKh928dcFjqrpuEIZ67CG3ejTSDyamfaYD/ksgcZ51lLZEpKCJwKWV4IAbuKgQljRNx6eaLOV1LD/pQdNU4kp7+bU3xYKvV93q8w4+Yr9NteshTf+KQ5CFfZClWNwuCKK1kykY/UmxXzaYRBGiMYCPctWish0ugTdds0GAYSigKtTS+vmQ/DomBOX+YFkRG78n2TV40ng2u1sbYRLnYpUfsSB3Lq70RdZrE7CpKUQiNpOeA4UqA8NfrfmqtkE6KW04+n2QCW9cpMEQreJBHra2wQYJy1QpjBt6DMpRCt7Zgn0cCWfHynZBK3s4t8s7BStvNvJpXqWnZjDX+2g+ESKFzq7/Ht1GOt/imF07+vOmTp8vKNwYg0h1bHHCrAU6kPzjvkwZDU0owV+Tw94hYsKnVaUZmRzQewJtWF2i6w6fjPO+kM+dkZi
X-OriginatorOrg: issi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR19MB8597.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4dce57-23bf-4c21-9af8-08deb86385cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2026 00:37:51.8985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6af618fc-4f7d-45f1-a2f2-8c59a26d2c10
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbNUoaVetpjh1LuHWbILz/ixcoqSLiWAKzY7epGebpenZ35lPki/tQFURjIPwGao
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6283
X-Proofpoint-GUID: jpiZSgSubaPuYpNz0ZSkXWq_K_RFANNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDAwMyBTYWx0ZWRfX/IgsXdSw9CjD
 4fBNUrjVwW8hMf4n0yw5p2EBL9HDAO86bg98detyWilJojcCW0QmIojTapr9JtJJXsoeI1ia1ny
 Y6R3xHEyJApjA9ZvdSAlQRCY02oTOJegpDd/FbOBwwvO0aovj7hK/ItZ0HONaEERVsWdl+yRFxE
 CBhALYZQp8I70S7xVfcoyipvkzaGfgFmxsE5E7TWS5I9un3Ewh1C2tHhQWwnDUfAwWTcV90ZxFR
 QMg0+UGBP4llZysXEgh4lpzZVj9Fg4sJu/VrCFAtnbJKddpkulOhQeIq08ECHxtrT/PEyAt3L8b
 7hO+3uj9sNGzTHBWg71KAZehAJrSAhNhsJ2A+mXES21DnVEAq5ecFjPhVMiqpfbXTDweV/aMavm
 pLxb4DzQXkWdMqqlW4tbWjtEXT6GXwKMLUqZzXTrm49Znb82UM3gyv6QV6nPQE2JUhLKo4v66+6
 IyYIZGk0h2UmRAc9hWg==
X-Authority-Analysis: v=2.4 cv=WPNPmHsR c=1 sm=1 tr=0 ts=6a10f6e4 cx=c_pps
 a=y8YxP5mruHbmkpqRckQjqQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=ozMtBe7fU4EA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yOHNzV93IasTtWdH6Nhn:22 a=US3Q6AVWkkt9IXfmMOXc:22 a=DUnRZS7UAAAA:8
 a=psuadeYQkFtU_rZ7NxMA:9 a=wPNLvfGTeEIA:10 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-ORIG-GUID: jpiZSgSubaPuYpNz0ZSkXWq_K_RFANNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_173828_186178_8D677DAF 
X-CRM114-Status: GOOD (  10.22  )
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

Add JEDEC ID table entries for additional ISSI SPI-NOR 
 devices. (Octal SPI 2026)

These parts previously not yet supported.
With these entries, Linux software can match the device by JEDEC ID
and use the existing ISSI SPI-NOR device handling.

Newly added devices include:
  - IS25WX256  (JEDEC 0x9d5b19)
    https://www.issi.com/WW/pdf/25LX-WX256-128.pdf
  - IS25LX256  (JEDEC 0x9d5a19)
    https://www.issi.com/WW/pdf/25LX-WX256-128.pdf
  - IS25WX512M   (JEDEC 0x9d5b1a)
    https://www.issi.com/WW/pdf/25LX-WX512M.pdf
  - IS25LX512M   (JEDEC 0x9d5a1a)
    https://www.issi.com/WW/pdf/25LX-WX512M.pdf
  - IS25WX01G   (JEDEC 0x9d5b1b)
    https://www.issi.com/WW/pdf/25LX-WX01G.pdf
  - IS25LX01G   (JEDEC 0x9d5a1b)
    https://www.issi.com/WW/pdf/25LX-WX01G.pdf

Signed-off-by: Jeffrey Y <jeyu@issi.com>
---
 drivers/mtd/spi-nor/issi.c | 322 +++++++++++++++++++++++++++++++++++++
 1 file changed, 322 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/issi.c

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
new file mode 100644
index 000000000000..13c06d207864
--- /dev/null
+++ b/drivers/mtd/spi-nor/issi.c
@@ -0,0 +1,322 @@
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
+#define SPINOR_OP_IS_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
+#define SPINOR_OP_IS_RD_ANY_REG        0x85    /* Read volatile register */
+#define SPINOR_OP_IS_WR_ANY_REG        0x81    /* Write volatile register */
+#define SPINOR_REG_IS_CFR0V    0x00    /* For setting octal DTR mode */
+#define SPINOR_REG_IS_CFR1V    0x01    /* For setting dummy cycles */
+#define SPINOR_IS_OCT_DTR      0xe7    /* Enable Octal DTR. */
+#define SPINOR_IS_EXSPI                0xff    /* Enable Extended SPI (default) */
+
+static int spi_nor_issi_phy_enable(struct spi_nor *nor)
+{
+       struct spi_mem_op op;
+       u8 *buf = nor->bouncebuf;
+       int ret;
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               goto ret;
+
+       buf[0] = SPINOR_IS_EXSPI;
+
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                          SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
+                          SPI_MEM_OP_NO_DUMMY,
+                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               goto ret;
+
+       nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
+       /* Read flash ID to make sure the switch was successful. */
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+                          SPI_MEM_OP_NO_ADDR,
+                          SPI_MEM_OP_DUMMY(0, 1),
+                          SPI_MEM_OP_DATA_IN(nor->info->id->len, buf, 1));
+
+       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               goto ret;
+
+       if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+               goto ret;
+
+       return 0;
+ret:
+       nor->spimem->spi->controller->flags &= ~SPI_CONTROLLER_SDR_PHY;
+       return 0;
+}
+static int spi_nor_issi_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+       struct spi_mem_op op;
+       u8 *buf = nor->bouncebuf;
+       int ret;
+
+       if (enable) {
+               /* Use 20 dummy cycles for memory array reads. */
+               ret = spi_nor_write_enable(nor);
+               if (ret)
+                       return ret;
+
+               *buf = 20;
+               op = (struct spi_mem_op)
+                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
+                                  SPI_MEM_OP_NO_DUMMY,
+                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+               ret = spi_mem_exec_op(nor->spimem, &op);
+               if (ret)
+                       return ret;
+
+               ret = spi_nor_wait_till_ready(nor);
+               if (ret)
+                       return ret;
+       }
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               return ret;
+
+       if (enable)
+               *buf = SPINOR_IS_OCT_DTR;
+       else
+               *buf = SPINOR_IS_EXSPI;
+
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
+                                          SPINOR_REG_IS_CFR0V, 1),
+                          SPI_MEM_OP_NO_DUMMY,
+                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+       if (!enable)
+               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               return ret;
+
+       if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
+               return 0;
+
+       /* Read flash ID to make sure the switch was successful. */
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+                          SPI_MEM_OP_NO_ADDR,
+                          SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
+                          SPI_MEM_OP_DATA_IN(round_up(nor->info->id->len, 2),
+                                             buf, 1));
+
+       if (enable)
+               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               return ret;
+
+       if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+               return -EINVAL;
+
+       return 0;
+}
+
+static int is25wx256_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+       int ret;
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               return ret;
+
+       ret = spi_nor_set_4byte_addr_mode(nor, enable);
+       if (ret)
+               return ret;
+
+       return spi_nor_write_disable(nor);
+}
+
+static void is25wx256_default_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       params->set_octal_dtr = spi_nor_issi_octal_dtr_enable;
+       params->set_4byte_addr_mode = is25wx256_set_4byte_addr_mode;
+       params->phy_enable = spi_nor_issi_phy_enable;
+}
+
+static int is25wx256_post_sfdp_fixup(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       /* Set the Fast Read settings. */
+       params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+       spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
+                                 0, 20, SPINOR_OP_IS_DTR_RD,
+                                 SNOR_PROTO_8_8_8_DTR);
+
+       nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+       params->rdsr_dummy = 8;
+       params->rdsr_addr_nbytes = 0;
+
+       /*
+        * The BFPT quad enable field is set to a reserved value so the quad
+        * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
+        * disable it.
+        */
+       params->quad_enable = NULL;
+
+       return 0;
+}
+
+static struct spi_nor_fixups is25wx256_fixups = {
+       .default_init = is25wx256_default_init,
+       .post_sfdp = is25wx256_post_sfdp_fixup,
+};
+
+static int
+is25lp256_post_bfpt_fixups(struct spi_nor *nor,
+                          const struct sfdp_parameter_header *bfpt_header,
+                          const struct sfdp_bfpt *bfpt)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       /*
+        * IS25LP256 supports 4B opcodes, but the BFPT advertises
+        * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY.
+        * Overwrite the number of address bytes advertised by the BFPT.
+        */
+       if ((bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+               BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
+               params->addr_nbytes = 4;
+
+       return 0;
+}
+
+static const struct spi_nor_fixups is25lp256_fixups = {
+       .post_bfpt = is25lp256_post_bfpt_fixups,
+};
+
+static int pm25lv_nor_late_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+       struct spi_nor_erase_map *map = &params->erase_map;
+       int i;
+
+       /* The PM25LV series has a different 4k sector erase opcode */
+       for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
+               if (map->erase_type[i].size == 4096)
+                       map->erase_type[i].opcode = SPINOR_OP_BE_4K_PMC;
+
+       return 0;
+}
+
+static const struct spi_nor_fixups pm25lv_nor_fixups = {
+       .late_init = pm25lv_nor_late_init,
+};
+
+static const struct flash_info issi_nor_parts[] = {
+       /* ISSI */
+       {
+               .id = SNOR_ID(0x9d, 0x5b, 0x19),
+               .name = "is25wx256",
+               .size = SZ_256M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+               .id = SNOR_ID(0x9d, 0x5a, 0x19),
+               .name = "is25lx256",
+               .size = SZ_256M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+               .id = SNOR_ID(0x9d, 0x5b, 0x1a),
+               .name = "is25wx512m",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+	       .id = SNOR_ID(0x9d, 0x5a, 0x1a),
+	       .name = "is25lx512m",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
+		.name = "is25wx01g",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+       }, {
+		.id = SNOR_ID(0x9d, 0x5a, 0x1b),
+		.name = "is25lx01g",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+       }
+};
+
+static void issi_nor_default_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+       params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups issi_fixups = {
+       .default_init = issi_nor_default_init,
+};
+
+const struct spi_nor_manufacturer spi_nor_issi = {
+       .name = "issi",
+       .parts = issi_nor_parts,
+       .nparts = ARRAY_SIZE(issi_nor_parts),
+       .fixups = &issi_fixups,
+};
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
