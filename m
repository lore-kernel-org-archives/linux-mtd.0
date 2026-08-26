Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C0C5DF97
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Aug 2026 16:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HWrdmQC9vvUj0IuDhHwwp8XmKaob+Szsj6OW3x9hp8U=; b=VB8XsCd1Yl9AuJMA5kAWBW3GoV
	1izHNustMTEvWGOyVPXWIxlVj2cLvsjni0ED/voE+XjMVL+vbnq2h/WyjYeOjusMTSE4e1czXjyYu
	UsirQgJyLGuP0ufjyDvEni59Hfk5wIN6kZefgiU2uTiz8nhzV4q4EVIJaxF1oG+Q9fv0ARRaNAJpT
	DWy1x9NAdAT9qt9XR/PR1uaEyzpef61gsBCoqcHByWMBLSjvwXRHhiEt+ItAf6tT6dmNKQCdBONpu
	zhLFsPqspVIx43H5hoXdjI1Ukk0apGUpLt8hP7hWwidbHSD1LM6emOAjdLu8ixg59YHDvOB8aT6RO
	wsO9HiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGyU-00000002mgl-3WI1;
	Wed, 26 Aug 2026 16:59:42 +0000
Received: from mail-canadaeastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c104::] helo=YQZPR01CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzGyQ-00000002mgB-3OP1
	for linux-mtd@lists.infradead.org;
	Wed, 26 Aug 2026 16:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTw6j/3xwZ9SvS33hFsUPoAx3nke6v8Iz7hsjZ91wL1vQzOCvtUK6O1uhGXYN1l7VAzcERkUloLuKWbfC5smsTl6gCYKzgTsWvROKnQ3VYrnbTdomIeAeOkutd8ldKCN7CsD6wwhl2bPQAsqRMUVDkHFkrdtw6qBH921wZQV4ZumqPbgiuGSNNMKYe/SoxwLDbp78MDMKXLINfo2co7OLhROgUxYAKzCl08lQ6QVQMiRu1wtCfpWUGB9wpop7htguZTy2jMlmOQP0mTMljr/srLTjKqv2tm6BNB339SS8Cj+QWhg0VscD16BxbcSz/dHCEMVnNG2gSUF0rD/tfGiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV9Fg6r15tam2fqiV8j5Y8qYEwH7lRKCoyNz2uI2Qn0=;
 b=GBoJDv3r3+AtGl0fRjzZn44hYloQOWpMSddqHIFOecVhfaSHu0kT53Pc2/skBs1mA2UP55PzFuxM/BHlkW4Jd3AoOyrTDTGaFwO6MUahtlPNkZaTS3a0haurnncfCnaSoqfzzSUBj7+cctrXuCRgN75TncVR237+I+zWJhPGoXxT2OEHF/uKXRZcNV1Utn/sopOQfEGxzK9IwRvK1dPzfQbRk01ENpWyPRu7I0U6GjxK3Jt9g8t0Hh6rY3kJslMi7BbP15fCqWUTqaudGMswf/PBGEzD+j13Bqv7TTMOMwGfZiH7chqYoWxVbtdwUjOj91fls1BY9tAghgigJOrVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tantalus.com; dmarc=pass action=none header.from=tantalus.com;
 dkim=pass header.d=tantalus.com; arc=none
Received: from YT4P288MB1145.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01:16c::22)
 by YT5P288MB1283.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01:17f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 16:44:52 +0000
Received: from YT4P288MB1145.CANP288.PROD.OUTLOOK.COM
 ([fe80::76fb:67e5:79b2:e9ba]) by YT4P288MB1145.CANP288.PROD.OUTLOOK.COM
 ([fe80::76fb:67e5:79b2:e9ba%4]) with mapi id 15.21.0360.008; Wed, 26 Aug 2026
 16:44:52 +0000
From: Devin Armstrong <darmstrong@tantalus.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Junghum Park <jpark@tantalus.com>, Wolfgang Tolkien
	<wtolkien@tantalus.com>
Subject: mtd-utils: [BUG] fsck.ubifs backwards compatibility issue wipes ubi
 volume encryption information
Thread-Topic: mtd-utils: [BUG] fsck.ubifs backwards compatibility issue wipes
 ubi volume encryption information
Thread-Index: AQHdNXmt/yhdS/7cJ0OAxrMRNzoS/w==
Date: Wed, 26 Aug 2026 16:44:51 +0000
Message-ID: <YT4P288MB114509D5F1B6B114BABB5E93B8AE2@YT4P288MB1145.CANP288.PROD.OUTLOOK.COM>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tantalus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT4P288MB1145:EE_|YT5P288MB1283:EE_
x-ms-office365-filtering-correlation-id: aa8e648a-c7c4-4c45-c516-08df039159a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|6049299003|366016|38070700021|4053099003|3023799007|10067099003|56012099006|5023799004|18002099003;
x-microsoft-antispam-message-info: jxt8xE+j0bvqu1fXRqpg8X1oH+JcScZipL6yKLdu3qSwGKSFhBkTCQEpIgxKBmYxvx5NJ04KzA347E3AaxOiFHluX5wAocYZLRT9cCgvbdWlIQxzlI9vMaEdtHmbe6Mr9g72S4yCinKBxrMn6lcQbcrZa9cRDYwzkCWR+isbIHw90oBSCC9QuPBKtqDiSze0O3NolRgWdSAan8cjEkcKpGfoNFLtLKVjL7WD/oj4sYrNpxd5FjlqANFO1n0B/fDL8OQxI9Zcb76s+Len6EIOUPmMW4T3tQxE9Hd2ZOFL/jlPfD6vf7dKs5qt8NtGC/iQ0sJ4DtoBzNSEaXYOgrTnlteSr5MbEOxmbuJsNTDJ48uh0yLRvUTv+2yn5PV3lDoYjMHgp2Bdt1Vm5xSAlJjFiwjdzcXz1AGiHtZ4jwmHfhGviajafEDXaw4Zp4CkM6yzZDd8swPitaYc1kGbJ/dqK+FP/i5Hbku7VLgczkHOcN3VdHWP8LesRJF1Zbwb+pFy96aZP3j7rVfN46EsRwAx/lYL71Q8iEJNXJjXxTcUkLl/jdpvGEQbCZmS/XLsFd3fP+NBUHZ894Xh0eJsd/D8O/SWjJ27mP8+UR3cnT1iyAjlQ61s7DJDJ/vUO4EZxlFA7lh12Xmx/DzsW/lv0jQZZID4x7VUesE8VSnPxh/lABw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4P288MB1145.CANP288.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(6049299003)(366016)(38070700021)(4053099003)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CrUFtdR+uAnLtPQeCsGv8nUcEZLKjQNkz44BxHIYQLuj3xURWkNbp1w9Q0?=
 =?iso-8859-1?Q?ICv4xkXgyuyO5esNNkslgM4jjFyUWCxlnVtR60VAHgjcHTJfbHSPkyUd1q?=
 =?iso-8859-1?Q?5r3BLtkYlzSr3P3xfPAUCKAR4LYaUqmpxwiphuhdYEiprwmJs6MZEVyP7n?=
 =?iso-8859-1?Q?0HYuS56CXbEjxj3IZGYDL7Ns5foEZafYfqnfUPpSlNKKUuRUqjHEn784oL?=
 =?iso-8859-1?Q?1aDPP/AX9B7poOwHqHUCqZOiELl0TzKjUUY5UVqbXqIz79ihEqsUiTsuMy?=
 =?iso-8859-1?Q?hWZENp7tfUFLdgt34Lt1hzWZ5Dp2SClcoMZGQR4ADnnIT4L8Y8FqS2P56f?=
 =?iso-8859-1?Q?A28n+UsDfoIcFiNBZzgFj6qZKteoAtxCsEoF8dstw4ai6PcHJSwcxc7tU/?=
 =?iso-8859-1?Q?LGIi9BCrqN4i3yypdnokkgZ30siyTlSY04T+Z6VmuIYmEm+rwFtwToucDv?=
 =?iso-8859-1?Q?WMWr8ecZFBEZ/CuDsHUEfp9bGvMupYk846Jse8DWlRp5ZO5s6V4hy74kz0?=
 =?iso-8859-1?Q?rmaEme2jx1oVFKWOP2n/T1KpLjbXBu5YtKx1VIwv0FVsObYSxYK4HBV8rz?=
 =?iso-8859-1?Q?B4Iyek9IzsmEljtBeF4mdUyHnt7fopXciAl9cTzh3sdpncss90DvjXGHDd?=
 =?iso-8859-1?Q?qBRykZWXm0nMCAbb/Fb42Lw4PAz8btbwCUT1icmMOJlR1qdqGdUdtesU0p?=
 =?iso-8859-1?Q?kWKQ1AYa68L3pZBFAQN7lvJELMPHAANd7lbsbj14E2gLQADa9GuEx609uX?=
 =?iso-8859-1?Q?2vaMruqgbbD0BBzk0PNBwuX8B0QdQWCda5wuXh46oR2WETeVP7f5Mhlz0d?=
 =?iso-8859-1?Q?D+Di4rV4PFjRTw6UP/pnnhmn/M3Ie005g13iTZkxACenjh/HHh6nKMXuJR?=
 =?iso-8859-1?Q?GG/c4MUTaag+9syKSGPnfP6f8unpa8dMqgdamXM7hoFFFtc1dbXZdTz7el?=
 =?iso-8859-1?Q?Au+nW3MuYNLWjgZRovI93+LC67LE4LKo8YfhCGBMsPs82kasZCh/oFTA7i?=
 =?iso-8859-1?Q?aHh+vBr9n5SWzGzMXirYgfTkio9msC3Jo0DPku6WxAyn35xaeFGjQXzaCO?=
 =?iso-8859-1?Q?AELgNU20Ke/4pd+UZE2uwACIpsY4cEDWIz8YijlYpanNW2fINOqlIHpbfN?=
 =?iso-8859-1?Q?SnPMK0zD2LX4BTO2u72MJJZuO5lA8vM8QjFYkP27m153cLyjZKUkbeRI1L?=
 =?iso-8859-1?Q?QdPMbDP0Vlb+SK1WFIhSzWNP3DNN38dVOoKTyvrFhm+Fp1kaqw7o+9Gnce?=
 =?iso-8859-1?Q?D74tIn9vlzOb37aJJukLCNLU3ZIkEUcH21BEwj4e9jOlSNae/hRNqeq7J2?=
 =?iso-8859-1?Q?qnWOyV2Es1cVNVT+H4ZV/ht/5dWAPScWgZtNS/F9ZZWJfRd3M6mAC2nZQs?=
 =?iso-8859-1?Q?qsIkttnN6n17JuQ6wB/gqMJO9wAwi9KbwRO6aj8nKrMC/wg8m8D7SV0fgg?=
 =?iso-8859-1?Q?TznlYcyja0JHhkHSD/WgTRUOx42j43Ur+eWHsBfKeOUCf+ItrkekDKxSJ9?=
 =?iso-8859-1?Q?2ZWA/Ceo96RVT3PuSov7ABiW4CmPP/XUKEOeo4wnAGblEIXwmxV61sBgNV?=
 =?iso-8859-1?Q?vOR7UFopi/h/Yb18A9VqNZGDQ8BUz676uGC4BW5PnHbmYM4sAcgM/ua3Kb?=
 =?iso-8859-1?Q?FqeHdkKjflckBi6r0Zgg4+uyOD66swQmgtEAyhQ14DCdO6trVQPtOJQsv2?=
 =?iso-8859-1?Q?HzXtevY4/61mGAawsi8OQUYU2uJAvAFO4KjXXGReM1JzMX1YtbCt5qgyQI?=
 =?iso-8859-1?Q?RcfjORPCL2grCRzGw22GIHILZGUCmbt8SQTEwkgXUuNONgVMhN51ng//L8?=
 =?iso-8859-1?Q?PFJdGQvxtw=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_003_YT4P288MB114509D5F1B6B114BABB5E93B8AE2YT4P288MB1145CANP_"
MIME-Version: 1.0
X-OriginatorOrg: tantalus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT4P288MB1145.CANP288.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8e648a-c7c4-4c45-c516-08df039159a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 16:44:51.9319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84e23124-053c-4a39-bff4-5dbaf09fc80e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hdPuxtRU4vRk4IqItNIN1Srkow7oeAw7CTss19W9oj0z/zPD+dGN5HT/Axyev0HhbbVHSOuGvc2xOkp4PfPOiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT5P288MB1283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_095938_934398_D44DEF5F 
X-CRM114-Status: GOOD (  12.45  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--_003_YT4P288MB114509D5F1B6B114BABB5E93B8AE2YT4P288MB1145CANP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Description:
fsck.ubifs v2.3.1 will always detect fatal corruptions in a mkfs.ubifs v2.1=
.1 encrypted ubi volume. When fsck.ubifs is run with the -y option, it dele=
tes the volume's encryption information and leaves the volume damaged.

Steps to Reproduce:
I have attached a bash script to this email that can reproduce this issue r=
eliably. Essentially, it:
1. Builds mtd-utils v2.1.1 and v2.3.1
2. uses mtdram to emulate an mtd device and attaches an ubi volume to it
3. format and encrypt the ubi volume with mkfs.ubifs v2.1.1
4. Run fsck.ubifs v2.3.1 against the encrypted ubi volume
The script also allows you to test an unencrypted ubi volume for comparison

To run the script:
sudo ./fsck_ubifs_reproduce_bug.sh --encrypted /path/to/staging/dir --no-pa=
tch

fsck.ubifs will output something like this:
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Read superblock
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Read master & init lpt
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Replay journal
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Handle orphan nodes
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Traverse TNC and construct fil=
es
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and handle invalid files
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: File has inconsistent=
 type, ino 65, inode type file(xattr), dentry c has type dir(xattr)
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Remove dentry? y

fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: File has no dentries,=
 ino 65 type file(xattr)
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Delete it? y

fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: Encrypted file has no=
 encryption information, ino 1 type dir
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Delete it? y

fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and handle unreachable f=
iles
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and correct files
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check whether the TNC is empty
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: TNC is empty
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): inconsistent problem must be f=
ixed
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): ********** Filesystem was modi=
fied **********
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): ********** WARNING: Filesystem=
 still has errors **********
fsck.ubifs[21612] (/dev/ubi0_0,danger mode): FSCK failed, exit code 5

The steps to reproduce should be agnostic to the linux kernel version, howe=
ver for reference I am running this on an Ubuntu 24.04 with linux kernel ve=
rsion 7.0.0-30-generic

I have done some digging and I believe this issue stems from the fsck.ubifs=
 tool is doing a strict type check in the "file_is_valid" function of the e=
xtract_files.c source code file. A fix in v2.2.1 (git hash: d17b14d953b2ab5=
6c938d6c7829b70b91c736efe) changed xent->type  from  "UBIFS_ITYPE_DIR"  to =
"UBIFS_ITYPE_REG". The fsck.ubifs tool does not account for this change.

I have made and tested a patch which I have also attached to this email.

With the patch applied fsck.ubifs outputs:
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Read superblock
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Read master & init lpt
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Replay journal
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Handle orphan nodes
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Traverse TNC and construct fil=
es
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and handle invalid files
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and handle unreachable f=
iles
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct files
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check whether the TNC is empty
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct the space st=
atistics
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct the index si=
ze
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and create root dir
fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Final committing
fsck.ubifs[24723] (-): FSCK success!

Best,
Devin Armstrong


Email: darmstrong@tantalus.com
www.tantalus.com

CONFIDENTIALITY NOTICE.&nbsp; This documentation, including any attachments=
, transmitted by electronic mail is intended for the use of the individual =
to whom or the entity to which it is addressed, and may contain information=
 which is proprietary, confidential, privileged and/or protected from discl=
osure by applicable laws. Confidentiality and privilege are not lost by thi=
s documentation having been sent to the wrong electronic mail address. If y=
ou are not the intended recipient (or the person responsible for delivering=
 thereto) please immediately notify the sender and destroy this documentati=
on and all copies (in any form and media); and note that any distribution, =
reproduction or other use of this documentation is strictly prohibited and =
may violate public and intellectual property laws.&nbsp; Thank you.

-
CONFIDENTIALITY NOTICE. This documentation, including any attachments, tran=
smitted by electronic mail is intended for the use of the individual to who=
m or the entity to which it is addressed, and may contain information which=
 is proprietary, confidential, privileged and/or protected from disclosure =
by applicable laws. Confidentiality and privilege are not lost by this docu=
mentation having been sent to the wrong electronic mail address. If you are=
 not the intended recipient (or the person responsible for delivering there=
to) please immediately notify the sender and destroy this documentation and=
 all copies (in any form and media); and note that any distribution, reprod=
uction or other use of this documentation is strictly prohibited and may vi=
olate public and intellectual property laws. Thank you.

--_003_YT4P288MB114509D5F1B6B114BABB5E93B8AE2YT4P288MB1145CANP_
Content-Type: application/x-shellscript; name="fsck_ubifs_reproduce_bug.sh"
Content-Description: fsck_ubifs_reproduce_bug.sh
Content-Disposition: attachment; filename="fsck_ubifs_reproduce_bug.sh";
	size=7442; creation-date="Wed, 26 Aug 2026 16:43:37 GMT";
	modification-date="Wed, 26 Aug 2026 16:43:37 GMT"
Content-Transfer-Encoding: base64

IyEvdXNyL2Jpbi9iYXNoCiMKIyBEZXNjcmlwdGlvbjogZnNjay51YmlmcyAobXRkLXV0aWxzIDIu
My4xKSBpZGVudGlmaWVzIGNvcnJ1cHRpb25zIGluIGEgbmV3bHkgZW5jcnlwdGVkIFVCSUZTCiMg
dm9sdW1lIGNyZWF0ZWQgd2l0aCBta2ZzLnViaWZzIChtdGQtdXRpbHMgMi4xLjEpLgojCiMgU2Ny
aXB0IEZ1bmN0aW9uYWxpdHk6CiMgICAxLiBCdWlsZHMgbWtmcy51Ymlmcy91Ymlmb3JtYXQvdWJp
YXR0YWNoIGV0Yy5mcm9tIG10ZC11dGlscyB2Mi4xLjEgCiMgICAgICBhbmQgbXRkLXV0aWxzIHYy
LjMuMSBwbHVzIGZzY2sudWJpZnMgZnJvbSBtdGQtdXRpbHMgdjIuMy4xLgojICAgMi4gQ3JlYXRl
cyBhbiBlbXVsYXRlZCBNVEQgZGV2aWNlIChtdGRyYW0pIGFuZCBhbiBVQkkgdm9sdW1lIG9uIHRv
cCBvZiBpdC4KIyAgIDMuIGZvcm1hdCBhbmQgZW5jcnlwdCB0aGUgVUJJIHZvbHVtZSBkaXJlY3Rs
eSBmcm9tIHRoYXQgZGlyZWN0b3J5IHdpdGggdGhlIE9MRCBta2ZzLnViaWZzLiAKIyAgIDQuIE1v
dW50cyBpdCByZWFkLW9ubHkgYXMgYSBzYW5pdHkgY2hlY2ssIHRoZW4gdW5tb3VudHMuCiMgICA1
LiBSdW5zIHRoZSBORVcgZnNjay51YmlmcyBhZ2FpbnN0IHRoZSB2b2x1bWUsIGNhcHR1cmluZyB3
aGV0aGVyIGl0CiMgICAgICBmbGFncyBjb3JydXB0aW9uIC8gYXR0ZW1wdHMgYSByZWJ1aWxkLgoj
CiMgVXNhZ2U6IGZzY2tfdWJpZnNfcmVwcm9kdWNlX2J1Zy5zaCBbLS1lbmNyeXB0ZWR8LS11bmVu
Y3J5cHRlZF0gWy0tYXBwbHktcGF0Y2h8LS1uby1wYXRjaF0gW3BhdGhdCgpzZXQgLWV1byBwaXBl
ZmFpbAoKU0NSSVBUX0RJUj0iJChjZCAiJChkaXJuYW1lICIke0JBU0hfU09VUkNFWzBdfSIpIiAm
JiBwd2QpIgpQQVRDSF9GSUxFPSIkU0NSSVBUX0RJUi8wMDAxLWZzY2sudWJpZnMtZml4LWZvci1w
cmUtbWtmcy51Ymlmcy0yLjIuMS14YXR0ci1kZW50cnktdHlwZS5wYXRjaCIKCiMgQ29tbWFuZC1s
aW5lOiB3aGV0aGVyIHRvIGVuY3J5cHQgdGhlIHViaSB2b2x1bWUgKGRlZmF1bHQpIG9yIGxlYXZl
IGl0IHVuZW5jcnlwdGVkIChmb3IgY29tcGFyaXNvbikuCkRPX0VOQ1JZUFQ9MQojIENvbW1hbmQt
bGluZTogd2hldGhlciB0byBhcHBseSB0aGUgZnNjay51YmlmcyBwYXRjaCB0byB0aGUgTkVXICgy
LjMuMSkgYnVpbGQgYmVmb3JlIGJ1aWxkaW5nIGl0LgpBUFBMWV9QQVRDSD0wCldPUktESVI9IiIK
dXNhZ2UoKSB7CiAgICBlY2hvICJVc2FnZTogJDAgWy0tZW5jcnlwdGVkfC0tdW5lbmNyeXB0ZWRd
IFstLWFwcGx5LXBhdGNofC0tbm8tcGF0Y2hdIFtwYXRoXSIKICAgIGVjaG8gIiAgLS1lbmNyeXB0
ZWQgICAgZm9ybWF0IHRoZSB2b2x1bWUgd2l0aCBta2ZzLnViaWZzIGVuY3J5cHRpb24gKGRlZmF1
bHQpIgogICAgZWNobyAiICAtLXVuZW5jcnlwdGVkICBmb3JtYXQgdGhlIHZvbHVtZSB3aXRoIG5v
IGVuY3J5cHRpb24gYXQgYWxsIgogICAgZWNobyAiICAtLWFwcGx5LXBhdGNoICBhcHBseSAkKGJh
c2VuYW1lICIkUEFUQ0hfRklMRSIpIHRvIG10ZC11dGlscyB2Mi4zLjEgYmVmb3JlIGJ1aWxkaW5n
IGl0IgogICAgZWNobyAiICAtLW5vLXBhdGNoICAgICBidWlsZCBtdGQtdXRpbHMgdjIuMy4xIHVu
cGF0Y2hlZCAoZGVmYXVsdCkiCiAgICBlY2hvICIgIHBhdGggICAgICAgICAgIFRoZSBhYnNvbHV0
ZSBwYXRoIHRvIHRoZSBkaXJlY3Rvcnkgd2hlcmUgdGhlIHRlc3Qgd2lsbCBiZSBzdGFnZWQiCn0K
CndoaWxlIFtbICQjIC1ndCAwIF1dOyBkbwogICAgY2FzZSAiJDEiIGluCiAgICAgICAgLS1lbmNy
eXB0ZWQpCiAgICAgICAgICAgIERPX0VOQ1JZUFQ9MQogICAgICAgICAgICBzaGlmdCA7OwogICAg
ICAgIC0tdW5lbmNyeXB0ZWQpCiAgICAgICAgICAgIERPX0VOQ1JZUFQ9MAogICAgICAgICAgICBz
aGlmdCA7OwogICAgICAgIC0tYXBwbHktcGF0Y2gpCiAgICAgICAgICAgIEFQUExZX1BBVENIPTEK
ICAgICAgICAgICAgc2hpZnQgOzsKICAgICAgICAtLW5vLXBhdGNoKQogICAgICAgICAgICBBUFBM
WV9QQVRDSD0wCiAgICAgICAgICAgIHNoaWZ0IDs7CiAgICAgICAgLWh8LS1oZWxwKQogICAgICAg
ICAgICB1c2FnZTsgZXhpdCAwIDs7CiAgICAgICAgLSopCiAgICAgICAgICAgIGVjaG8gIlVua25v
d24gb3B0aW9uOiAkMSIgPiYyOyB1c2FnZTsgZXhpdCAxIDs7CiAgICAgICAgKikKICAgICAgICAg
ICAgV09SS0RJUj0iJDEiCiAgICAgICAgICAgIHNoaWZ0IDs7CiAgICBlc2FjCmRvbmUKCmlmIFtb
IC16ICIkV09SS0RJUiIgXV07IHRoZW4KICAgIGVjaG8gIkVycm9yOiBwYXRoIGlzIHJlcXVpcmVk
IiA+JjIKICAgIHVzYWdlCiAgICBleGl0IDEKZmkKCmlmIFtbICIkQVBQTFlfUEFUQ0giIC1lcSAx
ICYmICEgLWYgIiRQQVRDSF9GSUxFIiBdXTsgdGhlbgogICAgZWNobyAiRXJyb3I6IHBhdGNoIGZp
bGUgbm90IGZvdW5kIGF0ICRQQVRDSF9GSUxFIiA+JjIKICAgIGV4aXQgMQpmaQoKIyBQYXJhbWV0
ZXJzIGZvciB0aGUgdGVzdCwgdGhlc2UgYXJlIG1vc3RseSBhcmJpdHJhcnkgYXNpZGUgZnJvbSB0
aGUgbXRkLXV0aWxzIHZlcnNpb25zIApNVERfVVRJTFNfR0lUPSIke01URF9VVElMU19HSVQ6LWdp
dDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGlscy5naXR9IgpNVERfVVRJTFNfT0xEX1RBRz0i
djIuMS4xIgpNVERfVVRJTFNfTkVXX1RBRz0idjIuMy4xIgpNVERfU0laRV9LSUI9JCgoMzIgKiAx
MDI0KSkgICAKRVJBU0VfU0laRV9LSUI9NjQgICAgICAgICAgICAgCk1PVU5UUE9JTlQ9IiRXT1JL
RElSL21udCIKCk1URF9VVElMU19PTERfUFJFRklYPSIkV09SS0RJUi9tdGQtdXRpbHMtb2xkIgpp
ZiBbWyAiJEFQUExZX1BBVENIIiAtZXEgMSBdXTsgdGhlbgogICAgTVREX1VUSUxTX05FV19QUkVG
SVg9IiRXT1JLRElSL210ZC11dGlscy1uZXctcGF0Y2hlZCIKZWxzZQogICAgTVREX1VUSUxTX05F
V19QUkVGSVg9IiRXT1JLRElSL210ZC11dGlscy1uZXctdW5wYXRjaGVkIgpmaQoKbWtkaXIgLXAg
IiRXT1JLRElSIiAiJE1PVU5UUE9JTlQiCgojIENsZWFuIHRoZSBydW50aW1lIGVudmlyb25tZW50
IG9uIGV4aXQKY2xlYW51cCgpCnsKICAgIGVjaG8gImNsZWFuaW5nIHVwIgogICAgc2V0ICtlCgog
ICAgdW1vdW50ICIkTU9VTlRQT0lOVCIgMj4vZGV2L251bGwKICAgIHJtZGlyICIkTU9VTlRQT0lO
VCIgMj4vZGV2L251bGwKCiAgICBpZiBbWyAtbiAiJHtVQklfTlVNOi19IiBdXTsgdGhlbgogICAg
ICAgIGVjaG8gImRldGFjaGluZyBVQkkgZGV2aWNlIHViaSRVQklfTlVNIgogICAgICAgICIkVUJJ
REVUQUNIIiAtZCAiJFVCSV9OVU0iCiAgICBmaQoKICAgIGVjaG8gInJlbW92aW5nIHViaSBtb2R1
bGUiCiAgICBtb2Rwcm9iZSAtciB1YmkgCiAgICBlY2hvICJyZW1vdmluZyBtdGRyYW0gbW9kdWxl
IgogICAgbW9kcHJvYmUgLXIgbXRkcmFtCn0KdHJhcCBjbGVhbnVwIEVYSVQKCiMgQnVpbGQgT0xE
ICgyLjEuMSkgYW5kIE5FVyAoMi4zLjEpIG10ZC11dGlscwpidWlsZF9tdGRfdXRpbHMoKQp7CiAg
ICBsb2NhbCB0YWc9IiQxIiBwcmVmaXg9IiQyIiBwYXRjaD0iJHszOi19IgogICAgbG9jYWwgc3Jj
RGlyPSIkV09SS0RJUi9zcmMtJChiYXNlbmFtZSAiJHByZWZpeCIpIgogICAgaWYgW1sgLXggIiRw
cmVmaXgvc2Jpbi9ta2ZzLnViaWZzIiAmJiAteCAiJHByZWZpeC9zYmluL2ZzY2sudWJpZnMiIF1d
OyB0aGVuCiAgICAgICAgZWNobyAibXRkLXV0aWxzICR0YWcgYWxyZWFkeSBidWlsdCBhdCAkcHJl
Zml4LCBza2lwcGluZyIKICAgICAgICByZXR1cm4KICAgIGZpCiAgICBlY2hvICJjbG9uaW5nL2J1
aWxkaW5nIG10ZC11dGlscyAkdGFnIGludG8gJHByZWZpeCIKICAgIGlmIFtbICEgLWQgIiRzcmNE
aXIiIF1dOyB0aGVuCiAgICAgICAgZ2l0IGNsb25lIC0tYnJhbmNoICIkdGFnIiAtLWRlcHRoIDEg
IiRNVERfVVRJTFNfR0lUIiAiJHNyY0RpciIKICAgICAgICBpZiBbWyAtbiAiJHBhdGNoIiBdXTsg
dGhlbgogICAgICAgICAgICBlY2hvICJhcHBseWluZyBwYXRjaCAkKGJhc2VuYW1lICIkcGF0Y2gi
KSB0byAkc3JjRGlyIgogICAgICAgICAgICAoIGNkICIkc3JjRGlyIiAmJiBwYXRjaCAtcDEgPCAi
JHBhdGNoIiApCiAgICAgICAgZmkKICAgICAgICAoIGNkICIkc3JjRGlyIiAmJiBcCiAgICAgICAg
Li9hdXRvZ2VuLnNoICYmIFwKICAgICAgICAuL2NvbmZpZ3VyZSAtLXByZWZpeD0iJHByZWZpeCIg
LS13aXRob3V0LXhhdHRyICYmIFwKICAgICAgICBtYWtlIC1qIiQobnByb2MpIiAgJiYgXAogICAg
ICAgIG1ha2UgaW5zdGFsbCAgKQogICAgZmkKICAgIGVjaG8gImJ1aWx0IG10ZC11dGlscyAkdGFn
IC0+ICRwcmVmaXgiCn0KCmJ1aWxkX210ZF91dGlscyAiJE1URF9VVElMU19PTERfVEFHIiAiJE1U
RF9VVElMU19PTERfUFJFRklYIgppZiBbWyAiJEFQUExZX1BBVENIIiAtZXEgMSBdXTsgdGhlbgog
ICAgYnVpbGRfbXRkX3V0aWxzICIkTVREX1VUSUxTX05FV19UQUciICIkTVREX1VUSUxTX05FV19Q
UkVGSVgiICIkUEFUQ0hfRklMRSIKZWxzZQogICAgYnVpbGRfbXRkX3V0aWxzICIkTVREX1VUSUxT
X05FV19UQUciICIkTVREX1VUSUxTX05FV19QUkVGSVgiCmZpCgpNS0ZTX09MRD0iJE1URF9VVElM
U19PTERfUFJFRklYL3NiaW4vbWtmcy51YmlmcyIKVUJJQVRUQUNIPSIkTVREX1VUSUxTX05FV19Q
UkVGSVgvc2Jpbi91YmlhdHRhY2giICAgICAgIApVQklERVRBQ0g9IiRNVERfVVRJTFNfTkVXX1BS
RUZJWC9zYmluL3ViaWRldGFjaCIKVUJJTUtWT0w9IiRNVERfVVRJTFNfTkVXX1BSRUZJWC9zYmlu
L3ViaW1rdm9sIgpGU0NLX05FVz0iJE1URF9VVElMU19ORVdfUFJFRklYL3NiaW4vZnNjay51Ymlm
cyIKCmVjaG8gIk9MRCBta2ZzLnViaWZzOiAkKCRNS0ZTX09MRCAtLXZlcnNpb24gMj4mMSB8IGhl
YWQgLTEpIgplY2hvICJORVcgZnNjay51YmlmczogJCgkRlNDS19ORVcgLS12ZXJzaW9uIDI+JjEg
fCBoZWFkIC0xKSIKCiMgc2V0dXAgbXRkcmFtIGFuZCB0aGUgdWJpIHZvbHVtZQpzZXR1cF9tdGQo
KSB7CiAgICBpZiBtb2Rwcm9iZSBtdGRyYW0gdG90YWxfc2l6ZT0iJE1URF9TSVpFX0tJQiIgZXJh
c2Vfc2l6ZT0iJEVSQVNFX1NJWkVfS0lCIjsgdGhlbgogICAgICAgIGVjaG8gIm10ZHJhbSBsb2Fk
ZWQiCiAgICBmaQoKICAgIHNsZWVwIDEKICAgIE1URD0kKGNhdCAvcHJvYy9tdGQgfCBncmVwICJt
dGRyYW0iIHwgdHIgIjoiICIgIiB8IGF3ayAneyBwcmludCAkMSB9JykKICAgIE1URF9OVU09JChl
Y2hvICIkTVREIiB8IHRyIC1kYyAnMC05JykKICAgIAogICAgaWYgW1sgLXogIiR7TVREX05VTTot
fSIgXV07IHRoZW4KICAgICAgICBlY2hvICJjb3VsZCBub3QgZmluZCBlbXVsYXRlZCBtdGQgZGV2
aWNlIiA+JjIKICAgICAgICBleGl0IDEKICAgIGZpCgogICAgTVREX05PREU9Ii9kZXYvJE1URCIK
ICAgIGVjaG8gInVzaW5nICRNVERfTk9ERSIKfQoKc2V0dXBfdWJpKCkgewogICAgbG9jYWwgYXR0
YWNoX291dAogICAgaWYgbW9kcHJvYmUgdWJpOyB0aGVuCiAgICAgICAgZWNobyAidWJpIG1vZHVs
ZSBsb2FkZWQiCiAgICBmaQoKICAgIHNsZWVwIDEKICAgIGF0dGFjaF9vdXQ9JCgiJFVCSUFUVEFD
SCIgLXAgIiRNVERfTk9ERSIpIHx8IHRydWUKICAgIGVjaG8gIiRhdHRhY2hfb3V0IgogICAgVUJJ
X05VTT0kKGVjaG8gIiRhdHRhY2hfb3V0IiB8IHRyICIsIiAiICIgfCBhd2sgJ3sgcHJpbnQgJDQg
fScpCiAgICAKICAgIGlmIFtbIC16ICIke1VCSV9OVU06LX0iIF1dOyB0aGVuCiAgICAgICAgZWNo
byAiY291bGQgbm90IGF0dGFjaCAkTVREX05PREUgdG8gVUJJIiA+JjIKICAgICAgICBleGl0IDEK
ICAgIGZpCgogICAgc2xlZXAgMQogICAgIiRVQklNS1ZPTCIgIi9kZXYvdWJpJFVCSV9OVU0iIC1O
IHRlc3Rfdm9sIC1tIAogICAgc2xlZXAgMQogICAgVk9MX0RFVj0kKGxzIC9kZXYvdWJpJHtVQklf
TlVNfV8qIHwgaGVhZCAtMSkKICAgIGVjaG8gIlVCSSB2b2x1bWUgZGV2aWNlOiAkVk9MX0RFViIK
fQoKc2V0dXBfbXRkCnNldHVwX3ViaQoKIyBTdGFnZSB0ZXN0IGZpbGVzLCB0aGVuIGZvcm1hdCtw
b3B1bGF0ZSB0aGUgVUJJIHZvbHVtZSwgYW5kIGVuY3J5cHQgaXQgd2l0aCB0aGUgT0xEIG1rZnMu
dWJpZnMKU1RBR0lOR19ESVI9IiRXT1JLRElSL3ViaWZzX3Jvb3QiCnJtIC1yZiAiJFNUQUdJTkdf
RElSIgpta2RpciAtcCAiJFNUQUdJTkdfRElSIgoKTUtGU19VQklGU19QQVJBTVM9Ii1tIDIwNDgg
LWUgMTI5MDI0IC14IHpsaWIiCk1BWF9MRUI9MjA0NwoKRU5DUllQVF9BUkdTPSgpCmlmIFtbICIk
RE9fRU5DUllQVCIgLWVxIDEgXV07IHRoZW4KICAgICMgRHVtbXkgcmF3IGtleSBmaWxlIGZvciB0
ZXN0IHB1cnBvc2VzLiBVc2UgcmFuZG9tIGJ5dGVzIHRvIGZlZWQgbWtmcy51YmlmcydzIC1LIG9w
dGlvbi4gbWtmcy51YmlmcyByZXF1aXJlcyBhdCBsZWFzdCA2NCBieXRlcy4KICAgIEtFWUZJTEU9
IiRXT1JLRElSL3Jhdy5rZXkiCiAgICBoZWFkIC1jIDY0IC9kZXYvdXJhbmRvbSA+ICIkS0VZRklM
RSIKICAgIGNobW9kIDYwMCAiJEtFWUZJTEUiCiAgICBFTkNSWVBUX0FSR1M9KC1LICIkS0VZRklM
RSIgLUMgQUVTLTI1Ni1YVFMpCiAgICBlY2hvICJmb3JtYXR0aW5nK2VuY3J5cHRpbmcgJFZPTF9E
RVYgd2l0aCBPTEQgbWtmcy51YmlmcyAoJE1URF9VVElMU19PTERfVEFHKSBmcm9tICRTVEFHSU5H
X0RJUiIKZWxzZQogICAgZWNobyAiZm9ybWF0dGluZyAodW5lbmNyeXB0ZWQpICRWT0xfREVWIHdp
dGggT0xEIG1rZnMudWJpZnMgKCRNVERfVVRJTFNfT0xEX1RBRykgZnJvbSAkU1RBR0lOR19ESVIi
CmZpCgoiJE1LRlNfT0xEIiAkTUtGU19VQklGU19QQVJBTVMgLXIgIiRTVEFHSU5HX0RJUiIgIiR7
RU5DUllQVF9BUkdTW0BdfSIgLW8gIiRWT0xfREVWIiAtYyAiJE1BWF9MRUIiCgojIE1vdW50IHJl
YWQtb25seSBhcyBhIHNhbml0eSBjaGVjawplY2hvICJtb3VudGluZyAkVk9MX0RFViBhdCAkTU9V
TlRQT0lOVCAocmVhZC1vbmx5IHNhbml0eSBjaGVjaykiCm1vdW50IC10IHViaWZzIC1vIHJvICIk
Vk9MX0RFViIgIiRNT1VOVFBPSU5UIgoKZWNobyAiZGlyZWN0b3J5IGxpc3RpbmcgdW5kZXIgZW5j
cnlwdGlvbiAoa2VybmVsLWRlY3J5cHRlZCB2aWV3KToiCmxzIC1sYSAiJE1PVU5UUE9JTlQiIAoK
IyBDbGVhbiB1bm1vdW50LCB0aGVuIHJ1biB0aGUgTkVXIGZzY2sudWJpZnMKZWNobyAidW5tb3Vu
dGluZyBjbGVhbmx5Igp1bW91bnQgIiRNT1VOVFBPSU5UIgoKZWNobyAicnVubmluZyBORVcgZnNj
ay51YmlmcyAoJE1URF9VVElMU19ORVdfVEFHKSBhZ2FpbnN0ICRWT0xfREVWIgpzZXQgK2UKIiRG
U0NLX05FVyIgLXkgIiRWT0xfREVWIiA+ICIkV09SS0RJUi9mc2NrX291dHB1dC50eHQiIDI+JjEK
RlNDS19SQz0kPwpzZXQgLWUKZWNobyAiZnNjay51YmlmcyBleGl0IGNvZGU6ICRGU0NLX1JDIgpl
Y2hvICJmc2NrLnViaWZzIG91dHB1dCBzYXZlZCB0byAkV09SS0RJUi9mc2NrX291dHB1dC50eHQi
CmNhdCAiJFdPUktESVIvZnNja19vdXRwdXQudHh0Igo=

--_003_YT4P288MB114509D5F1B6B114BABB5E93B8AE2YT4P288MB1145CANP_
Content-Type: text/x-patch;
	name="0001-fsck.ubifs-fix-for-pre-mkfs.ubifs-2.2.1-xattr-dentry-type.patch"
Content-Description:  0001-fsck.ubifs-fix-for-pre-mkfs.ubifs-2.2.1-xattr-dentry-type.patch
Content-Disposition: attachment;
	filename="0001-fsck.ubifs-fix-for-pre-mkfs.ubifs-2.2.1-xattr-dentry-type.patch";
	size=778; creation-date="Wed, 26 Aug 2026 16:43:38 GMT";
	modification-date="Wed, 26 Aug 2026 16:43:38 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3ViaWZzLXV0aWxzL2ZzY2sudWJpZnMvZXh0cmFjdF9maWxlcy5jIGIvdWJp
ZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmMKaW5kZXggMmU0N2I0Mi4uN2FlYWI2
NyAxMDA2NDQKLS0tIGEvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmMKKysr
IGIvdWJpZnMtdXRpbHMvZnNjay51Ymlmcy9leHRyYWN0X2ZpbGVzLmMKQEAgLTEwMzAsNyArMTAz
MCwxMSBAQCBpbnQgZmlsZV9pc192YWxpZChzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHNj
YW5uZWRfZmlsZSAqZmlsZSwKIAogCQlpZiAoa2V5X3R5cGUoYywgJmRlbnRfbm9kZS0+a2V5KSA9
PSBVQklGU19YRU5UX0tFWSkKIAkJCWlzX3hhdHRyID0gMTsKLQkJaWYgKGlzX3hhdHRyICE9IGZp
bGUtPmluby5pc194YXR0ciB8fCB0eXBlICE9IGRlbnRfbm9kZS0+dHlwZSkKKwkJaWYgKGlzX3hh
dHRyICE9IGZpbGUtPmluby5pc194YXR0cikKKwkJCWxpc3RfYWRkKCZkZW50X25vZGUtPmxpc3Qs
ICZkcm9wX2xpc3QpOworCQllbHNlIGlmICh0eXBlICE9IGRlbnRfbm9kZS0+dHlwZSAmJgorCQkJ
ICEoaXNfeGF0dHIgJiYgZGVudF9ub2RlLT50eXBlID09IFVCSUZTX0lUWVBFX0RJUikpCisJCQkv
KiBFbnN1cmUgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgZm9yIHViaWZzIHBhcnRpdGlvbnMgcHJl
LXYyLjIuMSB3aGVyZSB0eXBlIHdhcyAiVUJJRlNfSVRZUEVfRElSIiAqLwogCQkJbGlzdF9hZGQo
JmRlbnRfbm9kZS0+bGlzdCwgJmRyb3BfbGlzdCk7CiAJfQogCg==

--_003_YT4P288MB114509D5F1B6B114BABB5E93B8AE2YT4P288MB1145CANP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--_003_YT4P288MB114509D5F1B6B114BABB5E93B8AE2YT4P288MB1145CANP_--

