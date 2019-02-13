Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAD_ENC_HEADER,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0DDC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 23:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AFC5222A4
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 23:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VFtnH2v7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=telspandata.onmicrosoft.com header.i=@telspandata.onmicrosoft.com header.b="IhmnZ7GY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AFC5222A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telspandata.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m/8yOgbu4HPK0N8CU9ogKdgH0nroosyr2cL4JBo2+bE=; b=VFtnH2v7OTuUyh
	W5s5QTnCMsdpOnud894sBHCBOfVv+nOvlFGgsdEy2zJjKE1LWot9R+xyc3xkMaGbgaaoEvdmhx9Jr
	8L0ZlWdE68qxGYVpTbBGbkVhxGghpErg/s5NMXDNiWpkzcKZNGFg78jd0UDvfNssI0zJZWAyRsmcd
	Pq7yDvFABQZ0N7iuIbZraQ9mCMl1JuWzPAPNXvnkMH9kJ4+I0jj8DcbRCzRjjoT1+Vc3akgzfOLDX
	Ph0J6AHv9stKWglj/oRvQwA6fUsqNbbxNorhbZJnVenCaChlNCjZLARzBhZXG8AzCxH8PIYD6U50t
	augr44PJWmKxBPw9RIPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu49b-0000hY-Mo; Wed, 13 Feb 2019 23:41:23 +0000
Received: from mail-eopbgr680040.outbound.protection.outlook.com
 ([40.107.68.40] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu49X-0000h7-9i
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 23:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=telspandata.onmicrosoft.com; s=selector1-telspandata-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSDivGxX0Y789R+MgU1W2+pcBu8iTCOAsw7CELXKqO0=;
 b=IhmnZ7GYRTiBhT2mcF1QHc9PvAG9LDsh+pAvHwBy19vT/5KysKT2q+N89kh/165Yb5EbnLtxBN+RPAPI1Wa3ADtMoI+P7NxJDSbZIJlwgQEZxYIux0a7uQRWZ11bYPWkvVP/0Lycvp6fgsvsixuQ3kKAiCS0X9VbbRKE5Pf6Ln4=
Received: from DM6PR16MB2665.namprd16.prod.outlook.com (20.177.220.10) by
 DM6PR16MB3036.namprd16.prod.outlook.com (10.255.61.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 13 Feb 2019 23:41:13 +0000
Received: from DM6PR16MB2665.namprd16.prod.outlook.com
 ([fe80::2458:9950:7549:af0]) by DM6PR16MB2665.namprd16.prod.outlook.com
 ([fe80::2458:9950:7549:af0%5]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 23:41:13 +0000
From: Matt Schepers <mschepers@telspandata.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd utilities work but ubi utilities do not?
Thread-Topic: mtd utilities work but ubi utilities do not?
Thread-Index: AQHUw/Wa2AwIel9T9kixDMSG2KbPfA==
Date: Wed, 13 Feb 2019 23:41:13 +0000
Message-ID: <DM6PR16MB266514008732CC2ECF6C5257B0660@DM6PR16MB2665.namprd16.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mschepers@telspandata.com; 
x-originating-ip: [96.69.169.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5774105c-bf2e-4201-738b-08d6920cbd4f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR16MB3036; 
x-ms-traffictypediagnostic: DM6PR16MB3036:
x-microsoft-antispam-prvs: <DM6PR16MB3036C0C546D0061D160DC89DB0660@DM6PR16MB3036.namprd16.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(39830400003)(136003)(376002)(149574003)(189003)(199004)(5024004)(14444005)(256004)(106356001)(14454004)(25786009)(105586002)(2351001)(68736007)(2906002)(33656002)(186003)(26005)(6506007)(316002)(102836004)(486006)(476003)(81156014)(71190400001)(81166006)(71200400001)(6916009)(8936002)(99286004)(7696005)(7736002)(8676002)(2501003)(55016002)(6436002)(53936002)(9686003)(3846002)(6116002)(5640700003)(66066001)(97736004)(74316002)(508600001)(86362001)(305945005)(554374003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR16MB3036;
 H:DM6PR16MB2665.namprd16.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: telspandata.com does not designate
 permitted sender hosts)
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR16MB3036;
 23:9e05z7ySj45QMKTQcAoVq3IzuoQb0ViDkaHbRM9?=
 =?iso-8859-1?Q?ghe34XTv+Y45dNl57hDB++wDGCH+YmiBfSn3gtp6zZlu3eW6f4rpUZKBp/?=
 =?iso-8859-1?Q?YQJ9YwihOYFVLAgZEyhlsn5CWrIaia9OEG4BYK9u88VqVNrc7wIOKIJ2bO?=
 =?iso-8859-1?Q?dHF9soh87oKT0xkFiINRSKzhmjZCOYcYCKna70FnMLAqlDTE21Mr6SRq6m?=
 =?iso-8859-1?Q?fo3KzqxNFLnRs/JR2AhKz17jkpmtIVZJWJIZnG7aFOVDZX/rq6KUMcXfvW?=
 =?iso-8859-1?Q?j3mcoM7bnAWFTaf3d9OT/i/IsHHAyLiRhV22ZkFvW8pKV2XZ3zhmCyNVax?=
 =?iso-8859-1?Q?l8Yf2ovTttgcRrm1tUEPLYEz1+QwFqx7bd9GcTONrwz68OiA4WmEAL42CM?=
 =?iso-8859-1?Q?xDCnA5paYKWP13UDZRONM2lwAfCrvbWu+AHQJi9dhz7unSZCE0curLwAau?=
 =?iso-8859-1?Q?VDjY5JcG51TiQunHMvASb7A3/OL3XdI4tfRbbfsqe3eCg5vmHfbjW10nSp?=
 =?iso-8859-1?Q?j4EzBB5Sqw+iUHEGK6AawfLhqoqTqlgAMpPcaOcgJgVGcmHimCbP5FK8/P?=
 =?iso-8859-1?Q?bBxT+uC455OU1A3D1J5389JhI0rS/mbte2Jljn+knhhCxy51qNL9+esgPR?=
 =?iso-8859-1?Q?osl2N5guVfewZ0hEOwWJGmt/oo/6mwNpjDjU2OQmj4VwHcba1hKMrrWm1n?=
 =?iso-8859-1?Q?X5c4TDGFett4KPh1xdKAL5TCLbqFgsskejUJFD8hJDRi+AmA2PSEUMUDpg?=
 =?iso-8859-1?Q?SSWg9krXjLgNsXz1imh8kQMkmInvYfjs8PHzhM7riKKIZNGB/akj/Ym18Y?=
 =?iso-8859-1?Q?F34LXpo+4yOiPEWO3nTgrGc8x7om8yZRmS/o6XO4WsxdikQfY0SkfBtAUz?=
 =?iso-8859-1?Q?K0JvM6c+M/AiWMqxaUi4JHlQzoin+b49+1WKf/7k94T9LRIzmRYrAONh4a?=
 =?iso-8859-1?Q?Vsjyi8F53XQ+3foJHofFM4L7t01CgLbzn1cHDw/VS8OkbR+t9RfH2o7Iba?=
 =?iso-8859-1?Q?4Ju/dLnXjw0LxxzFmYIhCDIZ2MZgSKMrKZ/h+e4jyAN0Gxhv9/LUGmd2t/?=
 =?iso-8859-1?Q?lpZBh3zO/qr2s3wIhy/KGUVv2S3YVZaC3oKS7kbfrMR7b8ULp3XdB5zRnb?=
 =?iso-8859-1?Q?KP1rOJx6iz1fPep8YHRpA+0rGmt3ocbdBX6vtZ1JPi7u0eXhtuAJ96pu+R?=
 =?iso-8859-1?Q?NlhC/XvdOw4LIgxirEETNIRLL4MaQplB2PNTn9A4+wd9Vh1IjZDlBw=3D?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qbiW+evvts4R8Z0C0+r8x6hgpVWvZXlooZ3Y0nMD0yV5bd3duXcmd8HiWDSvx9g0v7j4eTymhzPlXPPDk5NqOGLr/hnxIzdNXaVqKSVELXmsnXEuCllzsMy2Ye6nqoyBBZIW8q9Vo4c9NW5dzZ9StRqkezSxxT4W+63L4hsRP6aW5YGZaBHt/pmxAPkh28wkxPRlGg5ZzKC6QbjahJJ9VNNDrHSWexFCEDAOgj2Q9EwoHEBk7Ck2FTuGgdlEdPmvuFXU8fhce9iJ/pefKdLVksGLXWQ3O300Px3mDPHRZSsHdnmwrPTyUaXyUAQXyfTFXuYZBV5QkNfPY8cwN0a6M4EMIYc+0fKh3sDLAzrJNmHurTiCaG03AiFs6i2qQfWrpfJFnuO/9zZFhPLJeiW3UhYTGybm+GIEGp9lFMh0GRY=
MIME-Version: 1.0
X-OriginatorOrg: telspandata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5774105c-bf2e-4201-738b-08d6920cbd4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 23:41:13.1436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 980119cc-b60c-4c4d-84e8-5d25446e5dc3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB3036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_154119_387756_9B94CAD2 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hello,

I have a curious issue that I cannot explain: I am able to read and write to my NAND (MT29F8G08ABABAWP) with "flash_erase /dev/mtd7 0 2048" and "nandtest /dev/mtd7" but "ubiformat /dev/mtd7" and "ubiattach -p /dev/mtd7" do not work for me.

So my basic question is why would the mdt utilities work and the ubi utilities not?

Even though nandtest seems to work fine I have included its output. As you can see it even finds and corrects the occasional ECC error. What I find interesting however is that the there are several thousand ECC errors that occurred before nandtest was run(due to ubiformat and ubiattach), but not a single one was correctable.

Output of "nandtest /dev/mtd7":
ECC corrections: 0
ECC failures   : 4041
Bad blocks     : 0
BBT blocks     : 0
06100000: reading (1 of 1)...
 1 bit(s) ECC corrected at 06100000
0b900000: reading (1 of 1)...

Also here is the output of "mtdinfo /dev/mtd7":
mtd7
Name:                           rootfs_data
Type:                           nand
Eraseblock size:                524288 bytes, 512.0 KiB
Amount of eraseblocks:          2048 (1073741824 bytes, 1024.0 MiB)
Minimum input/output unit size: 4096 bytes
Sub-page size:                  1024 bytes
OOB size:                       224 bytes
Character device major/minor:   90:14
Bad blocks are allowed:         true
Device is writable:             true


Here is where the trouble begins...

When I "ubiformat /dev/mtd7" it works the first time with no errors, but the same command generates "[  276.517513] ecc unrecoverable erro" on dmesg for all subsequent runs of "ubiformat /dev/mtd7". Further when I try "ubiattach -p /dev/mtd7" I get the following error for every PEB in the device.

dmesg output of "ubiformat /dev/mtd7"(2nd, 3rd run etc):
[  276.517513] ecc unrecoverable erro

Output of "ubiattach -p /dev/mtd7":
Errors begin with first PEB.
...
...
...
[  419.917998] ubi0 warning: ubi_io_read: error -77 (ECC error) while reading 64 bytes from PEB 2047:0, read only 64 bytes, retry
[  419.919060] ecc unrecoverable error
[  419.922696] ubi0 warning: ubi_io_read: error -77 (ECC error) while reading 64 bytes from PEB 2047:1024, read only 64 bytes, retry
[  419.923107] ubi0: scanning is finished
[  419.954179] ubi0: attached mtd7 (name "rootfs_data", size 1024 MiB)
[  419.954205] ubi0: PEB size: 524288 bytes (512 KiB), LEB size: 520192 bytes
[  419.954217] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size 1024
[  419.954229] ubi0: VID header offset: 1024 (aligned 1024), data offset: 4096
[  419.954240] ubi0: good PEBs: 2048, bad PEBs: 0, corrupted PEBs: 0
[  419.954252] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
[  419.954268] ubi0: max/mean erase counter: 1/1, WL threshold: 4096, image sequence number: 1850455827
[  419.954282] ubi0: available PEBs: 2004, total reserved PEBs: 44, PEBs reserved for bad PEB handling: 40
[  419.958108] ubi0: background thread "ubi_bgt0d" started, PID 74

Why would the mtd utilities work and the UBI utilities not?

Respectfully,
Matt Schepers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
