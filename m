Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EA9C47074
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycktWsqgeGyUgb0huvxRgv+uOmKOG2YsWnUeRuxHBus=; b=lMvhfCIkb9GE/o
	mQUjbWpRe38/5GC5q1npv+hBfLmPwtwJgblBqZyIMrJw7EI+hexAIWmg6zpIqSq5rZWmbJUYvz3jd
	b8uxnYm9NSzHgTzXaIuGBIOFBe35t9cVvSlFSJ1G2yA7outzXhGSkYwJSJWTBd+YZBBWAQtO11iDY
	k03MCdokII9rtawOUVv9g+1IqUMq8Qw9nJmZBpRqLE4zBUhyFEFK3KmMeLp9gycMS1N1j9saZcQyC
	ewCnF6jGNrbiYzNLOW1GI9fcJcuL90xxQCub8hLNh3Y4T6aqQdqJ1plrjNOOE4a9UcZD189N1mXLh
	ke66HDXH/H9LJo12d4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKevd-0087PL-1E;
	Tue, 02 Jan 2024 13:35:33 +0000
Received: from mail-am7eur03on20600.outbound.protection.outlook.com ([2a01:111:f403:260e::600] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKevZ-0087N0-2B
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 13:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+CvUZ4/JDH+4Sdl1eU7ovIGJqscUvWJsRm5AZDpXavzH8kRTzl2kVUeyEZkLqTLHZJ3XmBEatwscH7rbep6U69U3FUG/5IniG6/Rw3yOFWfIfU4DR14derGO/rJBphcUCD+Vk+npHYwU9wd3Y8Q5RQTdXbx2EtLCdK/vFYErLXCOUVAHwiW/952Rb45MR91o3MKRPX4gyR6UfWMN84puXfF3GaoyHgOPHG0khilQqZJtpW4+AiSbCHBacJhPIcLoKG57AxItdZ8CJ8/nI8VYa7QaoJ1DFEfT3wqv6C1n9mJIoZhXD1dI2QsPVR/GwovaRN4w7QoT0Dw9Oc+nbpFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=im4xRGerdvcpoL6itMB2ojf8XDVZ94iPu119DPHeOnk=;
 b=FXWXaeE0Ffvl8RQ7pRXRv/SG6QqGuqhVh+3S3/T6ycEPgemu54Pqb/FS+qEtvIMo2yw2SGNaVXMygESZ3OR0C2/2fvcrDJsNWy4/75xvdr2+l2uxf4WIeQlbbvKdyFa+q5XKAAXUDvElPx7t/X35k4p00uPwcBPhvDu42ZNRD4Y9yPesksLYRmEP4frMzYTr446FSby+qlN/7zbZ1a+mxE3HmTMO/ESgjVTATM/Lr4WuRvXnuG9bCYU6Eqq7+KyXtZjzaDg+cg/Kx5foGam/1u6UIxEzSRGpwpEO7C8nwG1tF5L2DyYT7istq64EmJ1mpoeCwyv8MhTgwPuXVSS91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andasis.com; dmarc=pass action=none header.from=andasis.com;
 dkim=pass header.d=andasis.com; arc=none
Received: from VI1P192MB0285.EURP192.PROD.OUTLOOK.COM (2603:10a6:803:36::14)
 by PAWP192MB2252.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:362::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 13:35:15 +0000
Received: from VI1P192MB0285.EURP192.PROD.OUTLOOK.COM
 ([fe80::e1a8:c8a2:1164:7882]) by VI1P192MB0285.EURP192.PROD.OUTLOOK.COM
 ([fe80::e1a8:c8a2:1164:7882%5]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 13:35:15 +0000
From: yusuf.kaya andasis.com <yusuf.kaya@andasis.com>
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: Ubifs mounting error causes kernel panic
Thread-Topic: Ubifs mounting error causes kernel panic
Thread-Index: AQHaKB7cksKDZkXE3UO8BHbgs6b637DGsFPv
Date: Tue, 2 Jan 2024 13:35:15 +0000
Message-ID: <VI1P192MB028564E26AA498297D5EBDF88661A@VI1P192MB0285.EURP192.PROD.OUTLOOK.COM>
References: <MEYP282MB316494F5098A895BD2941C0CBF84A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <MEYP282MB316494F5098A895BD2941C0CBF84A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andasis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P192MB0285:EE_|PAWP192MB2252:EE_
x-ms-office365-filtering-correlation-id: 37c3e8a4-f0ba-4818-dd89-08dc0b97a74c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H8yYMOSv9h7/OASGePdR/EFILZcrk/1BqlaGB5QNSzZUEks8thmDt/2PGwfXlE7iM8A1lFso4+eTG7dp946+T8LPY0r3QjwFPtJgW7rIs34X8bFEvxfF4Vrr2K3xdfBE7aGglxoikiStD3zAOPr9fosAski5NZZCGHOYpL4dKEKf4vMSw2eBW1hbjBHGJybQVkIlgykt9q/oc5Wz+q9pLVUN1aMxsw9gKOOpKUTen/+b55XdxWur3RKJ2UJLbFD6rFG7fiy4HCNG+pf9hqrHotDEwzMr5WqJ1zfooDNlxPzvDhe9JMQXOAFX7j8M9JzAE8XmhvIH/rDg17t22r9qOqzr9zTyWgUh8hxJqjnMvg/gLlRUl9xKCokGBzlghpKSydYypwVQHMmkhj7oW/Pa6fxIVVw7w8G0emCs7syT65fxf/K34qNTiOoTPt70gl3fuHYXJ88jvkqYv8yKcvyKYC07B/SD1NOlqx2r8XTBMELbOM9Im3GaHr/C1oTk/GnHhcYeRz6TqcgCT8v/XdTYC+jUQGMQ5lIbqX3Ew1z/m2XyeTghPv3yqV5IeDNXliuhxFo4Zk3eb6QBp2q+mjb6vm/CdaQU0wyJ0j0Ob+uANW0KlQOFD8fTdqmSIcQq+Mii
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P192MB0285.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39830400003)(396003)(136003)(376002)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(26005)(71200400001)(122000001)(83380400001)(38100700002)(76116006)(110136005)(66946007)(66556008)(64756008)(66446008)(66476007)(316002)(478600001)(86362001)(55016003)(5660300002)(2906002)(52536014)(33656002)(8936002)(8676002)(38070700009)(9686003)(6506007)(7696005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VKBs2No6Xxk3upglRHFjJwBecIXXaFpeE11UsH0gZkpnzwR4+7LU/aDMI1?=
 =?iso-8859-1?Q?pfm/ll0N/H/bG6iNIRY5U8gGtG8kz6ypvMB1w9IsvMKkd+SpcolSchWIJc?=
 =?iso-8859-1?Q?lLSO54JpAmIJ0sXlzUBMC25XgRhjoF7wcCDSY9O4N4HkltcZ94Chx4mcY3?=
 =?iso-8859-1?Q?q2JNauQabpsw5bp7lMnduCBmuULx/XcZC0KQo3rjleP8OCXBGVxb/sbELU?=
 =?iso-8859-1?Q?nX3kWLyzk2nf5hu5xuWqR8U2UrOse+glO9OIWQEiHpur946XFPemVl3c51?=
 =?iso-8859-1?Q?3rP2giOfOBrpgBrZmfac62WW1azoAUcHNUDRLOgDM3AxYik/iwoRB2cORQ?=
 =?iso-8859-1?Q?4aAuo8Nzi1e79RPSZ9XkBmMvxwIo5v7c1cSozOyuHxwthFob8bG1MqpzTU?=
 =?iso-8859-1?Q?+k1j7kqhaYOGbn8nVvMH9+s0Qe9cV0eHfeOkKdnm+TKRL+LQilgJH1uWqd?=
 =?iso-8859-1?Q?mOdwscHypPjamR5HwWmTz1QFwHty+QECYyjQ2nCFjySf2FJ6dwrJ5Seurb?=
 =?iso-8859-1?Q?8BvDsqTBX9pLKR6+nYsbtNSVFWK9rnNlmr8fzyHPeaA6tLKBKCama3ORFi?=
 =?iso-8859-1?Q?t+/6hrJqchyJkUbRBTSoNEGIKH5UNvf5WuswCcUD8lTiFJhysai/+09ueK?=
 =?iso-8859-1?Q?eFnN+l6nhiFgHLPnfqbaokd2Ejsa8kupN9fky4uWjCvdsrlJTS4XdAZoB3?=
 =?iso-8859-1?Q?0dWXo4141DCc72vvc0OwNwC3W+Ts951OURdvHsBr0TIRBUh74iqyJVCC6x?=
 =?iso-8859-1?Q?hwKuEaZ594MtCabWVajLrmw33Od7/hDhgT0nF82CRS+nwswobzvkOJiEk+?=
 =?iso-8859-1?Q?MHEdbcB0LJYCl3m1SYY0bRkLl6auA7+kcKeq8UrRrrZdZDGMhNkWIWhGm8?=
 =?iso-8859-1?Q?41N+TTBp7uLVNVtIdUbFPbKb6kInhfOM4JCg6jpoxpmRC4OEqB23tixe23?=
 =?iso-8859-1?Q?/yDHRjSrNZieVTyo/m3qAfGe+WSXeh03H0JvtPX6xg9ZkCYghp8w1aItFz?=
 =?iso-8859-1?Q?lvrjUS+DZnc2JSJmH0c6/ZUS0mngEt/cW/GmSKl6B/5BtSbHAiNbB0EFOc?=
 =?iso-8859-1?Q?UXA0A8lw2G4Vke/B37UHQmG30wcGv52ls+ebpXLLZIDQl0dPxXVgPvlKGG?=
 =?iso-8859-1?Q?93AG2Qe6h7Xm+93brXByvPw5AwuL6CGb84lfcoT1V5Ic4wNUDdosyjHmW5?=
 =?iso-8859-1?Q?HkRmxXomU5rT3Fcp9d3RcZ7wcIBUrqelP9b6R0f0pLdOWFcDBq+rPCKKY9?=
 =?iso-8859-1?Q?fO01KgKh2e4jm3ifyr/+ARQvYsapvpj/qJq0iJnZwQfNPxrFdesFtfmdGy?=
 =?iso-8859-1?Q?lFkHjEBhpiv6vW+5fKHnYZvSHdmlV+/RnrcwLaAZvk1MXbYiuWSzQeSXmD?=
 =?iso-8859-1?Q?PZlp9S3rJMsfGorguzVAKaSOxumMHGl2R+oOJu1UKLax6fkDcW/NzC22bw?=
 =?iso-8859-1?Q?sXI9/vGbgKjZvajURZ+69q+ICw2ycIPQHGbNzKhF1eeyP1ou/cY/EVuAVu?=
 =?iso-8859-1?Q?GcJCHc8KcxhlwwfRGNsl5sf1kpC+jzDjY/Zx/77xqaLhstI2OGURMA9X5m?=
 =?iso-8859-1?Q?5blmFGXTED/IVZ9uQQiurXUdbgQ6MdY8kOmWMf3hozZFZkXLavGp4x4v3X?=
 =?iso-8859-1?Q?DszsxZKz43PnChbtOWgBAM8FEdkclVF78n?=
MIME-Version: 1.0
X-OriginatorOrg: andasis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P192MB0285.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c3e8a4-f0ba-4818-dd89-08dc0b97a74c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 13:35:15.4046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb78fb6a-1c86-49dc-ad03-faf7dff294ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J1r6IT6qccKgWn6GYIMqTTXcXeLbCTXD5iv0c/25KbjhTUVGWfxRNMkX2hWZHNxAkURp8dxv6OgRkT8Coj+xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_053529_735918_F9EB7169 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

> > ubi0: available PEBs: 0, total reserved PEBs: 360, PEBs reserved for bad PEB handling: 80

> available PEBs can never be 0. You should firstly check this.

But it is also working fine when available PEBs are 0. After that message I think it uses reserved PEBs and creates the volume in correct size (see below lines).  So what is available and reserved PEBS means and how can I understand why my available PEBs are 0 and all goes to reserved? By the way when I try to sum up the PEB and LEB counts I couldn't get the exact results. For example in the rootfs partition below, it says;
Good PEBs: 1748,
Bad PEBs: 4,
Corrupted PEBs: 0,
Available PEBs: 0,
Total reserved PEBs: 1748,
PEBs reserved for bad PEB handling: 76,
(As far as here ok, I understand that there is 1752 PEBs total and 4 of them are bad PEBs, so they wont used. And 76 PEBs also reserved for bad PEB handling just in case, so they wont used either. Then we have 1672 PEBs total for can be used.)
FS size: 200MiB, 1657 LEBs,
Journal size: 8MiB, 72 LEBs
(Here why we have 1657 LEBs remained? Shouldn't we have 1672 PEBs? The infradead says 4-5 PEBs used as flash overhead but there is 15 PEBs difference. And the FS size includes journal size or not?)

/* Rootfs mounting logs begin */
[    3.905750] ubi0: attaching mtd4
[    3.984291] random: fast init done
[    5.345916] ubi0: scanning is finished
[    5.362184] ubi0: attached mtd4 (name "NAND.file-system", size 219 MiB)
[    5.368824] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    5.375717] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    5.382523] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    5.389504] ubi0: good PEBs: 1748, bad PEBs: 4, corrupted PEBs: 0
[    5.395614] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    5.402855] ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 1086286734
[    5.412013] ubi0: available PEBs: 0, total reserved PEBs: 1748, PEBs reserved for bad PEB handling: 76
[    5.476431] UBIFS: parse sync
[    5.480400] UBIFS (ubi0:0): Mounting in unauthenticated mode
[    5.486182] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 241
[    5.536650] UBIFS (ubi0:0): recovery needed
[    5.666057] UBIFS (ubi0:0): recovery completed
[    5.670584] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "NAND.file-system"
[    5.678870] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    5.688811] UBIFS (ubi0:0): FS size: 210399232 bytes (200 MiB, 1657 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    5.699531] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
[    5.705379] UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID A820488C-5A5A-496A-8898-D990B0325EDC, small LPT model
[    5.718319] VFS: Mounted root (ubifs filesystem) on device 0:20.
[    5.727175] devtmpfs: mounted
/* Rootfs mounting logs end */
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
