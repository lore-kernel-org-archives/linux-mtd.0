Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4FCC5320E
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2024 03:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ag4F2kDS7wyVAq+Y+NGjj91NbKcyCJxlo1+4HKzvsgg=; b=v4a2+I25DYNQjn
	GEfVKG51AdMtwe9hn2POsbnpYY9JdLtO3v2yVYkzaPv2kH60WnD6DsBiNVX1004Qk3PFLpt3lQXcX
	x17wwq3si80UYEiVTU+csOyCyjWDpKdbdGACl137N8laXerjr8BFfmun/queu4Z7MZHF+TFFo6JfI
	ib4bb82ypvFK5RuQ/ghL9q5Y/OH72pr43aq6ar1SAljabNBrhcw8rJjpb3fpH89bAduM1fRPy9QKp
	wc7ZYnUGoLFVgtBXF2X9JhU/aj52lbxvyw6X4/ia2mwKANXBSJ7rTTBT8R9oPnMDOXa3M4vcbC+Zf
	dixTj8DV5wB494lnpIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sinGB-00000009e3O-26nc;
	Tue, 27 Aug 2024 03:52:47 +0000
Received: from mail-me3aus01olkn2081c.outbound.protection.outlook.com ([2a01:111:f403:2818::81c] helo=AUS01-ME3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sinG8-00000009e2I-285F
	for linux-mtd@lists.infradead.org;
	Tue, 27 Aug 2024 03:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuMbcOiPErocDFt2EyRba9APjIP2sh80snvEKYrrWMfTavXyWnCgfQeuUo29v1JLAcfD7oY1yOnXvzHOpcF6nN4em8lXt2kvuAf952BK0Wb2lXT7JWnKzJXuLN6lqW3o69H8T7byN3P1f52avIHK7ONzTRl62Cf5tei9Vlu7ZOs7/PaRH9c03VyBkS4DIi7iPLQSl5lU/Jp1LZ2badfH1/RxFFddeBekHfg4YJZotLlSTPy2YkKnNsyNFVLXrQNuo+W0KVUhBPHy6WHxhDRGdUPhoLr7AY7JcWJP7mc864+gYlCDPTJZG2jcEBTMu34qB6R7q00E51srQB3Gd8SgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qni5UXSAfOZ1gYPaMq2k51x7umGV19tsw8Y8t+0PKEY=;
 b=Y3lJjxftsD6g70jrymgZqO5VXc6//yuIieaoxVT9wBekbCCp65sjxhSSxnFjZbO8BZqoSNIrzcgvOgZxxWlBbTYDGs/eXwWlz06RxLnghNEkMrNnoSVIPkfF/Ref81pZMvk89uWPiAIkeBwygBpf5u4BNCf8ULCYsCpDpMxD2Vv/D1C6vEtJ2pg9OPwHgEsCJvIRXBTMoWYN2sNKDhHlr/fSbUdv4djiDyFVzW3X0WeG/27dM1AndqREHl5Bak/nWJ/g2ji9sKT8lXk/BCekPonvoGTgz2iYK8jrzmK5u3VZxTN0JOR/RgrQxMnORSOHs2Fv2yoqHH54wNHnEaLvpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qni5UXSAfOZ1gYPaMq2k51x7umGV19tsw8Y8t+0PKEY=;
 b=HRLZ6J+Kr+gj+gVv0a3IHaCI82qZQ0OCzWo7Zrs/AvDi6aLraqjHXGwKz8AYBvfkyfWNmlyN9U9KSXNduCaomDsPLoI+o8NFJuYDr+RCgupwq9wuKE9/tY0Khh6D3rv7qgbm3u4U4oLTSf+/7hA/aUt1eCz5W14REe8kRqK5oE5+fYKv8hiSI8g265xg7bLEWRr1MPQB3N66Q5zlsLj08v8o6XnmGKHX/g/m0WdVtOqLtmCH0iUvrIBCBhWvF/ZV93nYvNhAXwdj9IIXP4nFK7tB/I/EujT5SufZyacvZ4d3oJXE+NryH4Xl9xNKFxjgtLs3j4oBT5BO5a8Nnu9fuA==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:a4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 27 Aug
 2024 03:51:45 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 03:51:45 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "richard@nod.at" <richard@nod.at>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] ubi: wl: Put source PEB into correct list if trying
 locking LEB failed
Thread-Topic: [PATCH 1/2] ubi: wl: Put source PEB into correct list if trying
 locking LEB failed
Thread-Index: AQHa8ehbXNn7k+G2z0GDXSQiOejptrI6fQlM
Date: Tue, 27 Aug 2024 03:51:45 +0000
Message-ID: <MEYP282MB316452BB4702F6B48314C57BBF942@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
References: <20240819032622.2241165-1-chengzhihao1@huawei.com>
 <20240819032622.2241165-2-chengzhihao1@huawei.com>
In-Reply-To: <20240819032622.2241165-2-chengzhihao1@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [uYVo4ezSVSpSerm+oGN0JeI5ul7i4Ztr]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|ME3P282MB1826:EE_
x-ms-office365-filtering-correlation-id: 9b3d5faa-b653-433e-7e9b-08dcc64b9204
x-microsoft-antispam: BCL:0;ARA:14566002|19110799003|15030799003|8060799006|15080799006|461199028|1602099012|102099032|4302099013|440099028|3412199025;
x-microsoft-antispam-message-info: 7y+I1vC8tvhj+zm3fVBdmQjbZ/rdd4N2tmfOIjDaMFCW0XGEWxpR/RUptQmtPKWlY/2resSzkWoVp5FwrG91vepMZ8R2T0q+E4KVmLGvjDn9gISJhkBIoiv5eswcnXtrzG+rGPcO+QBdzvRayYlJnkOW0tfbBzfgKOsh1Yt7+MXI+r9Bd3pyGz0ta2OUNp7lodKHaH26FLw4aFhnh1gUFhEyNPRxVNUpYYksLkIvXapZSfixHcJKF2w8m+taYxXBSjAsJHgRwlDWCq9rZNxYAtX8DZrDXyQJZe0xdeiEOHLSdNdWLvwb0ZX8el6xP3FYrK4IC/OfRU11GQKHMQa4jQUZRqBfXKSEd/CNI0KwMh6sXJHdNqwTNis93ldGCm3qif6bxXd5c3PfHHXPUvwhNOsoWAzJsQyMN8Qo7AESBWTibcY4pG4/J1SaaWPqoW0b7E9ZLprp3JUd3qLDefw9CKun2SZV+nbXCey9EaU+w+X6QvvObl/DZGkfMzOW8eN2TfXR8HM0Yvyd07TpFzIYPHmGrrbqTRjdUrRr9yR5AvvaDiohUz3iFeULfoHoejSAMr1PvIEsWFLqQcrFL65wyBcKNv7uuknsZsHkjKvUdCXCW8SgVLvDSLp/I9UjRf4pED79p/b/4EjKRu1+QfvEp2LxsIGWOuTt40oBJTxh1pDT8KhAFiHAPBqVs6486+ZGrnC4hhvoFntsCUIqkxAbNZ+H9gDCYauO5BAuAiCVKQqdvZLRyVtYvbWS3kIuEWp1iYGCluQB7Y3vZkJLfwvS8unIGeQj47+qvv8xp+QUWYkG4Rj2Av2bHMT4MM7ri9d4
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SPqdoWK11khiiXFLn7QHdGJpbeLizKgOqB3v9FriY/2BEHaQSVjaZkJtwU?=
 =?iso-8859-1?Q?dxB+cZvtYmB6H+XaDGs0vpEYO9yDHzStcRTjI7PzeHRspLYDfPxAxVT7Ij?=
 =?iso-8859-1?Q?5TD1BEUq/Cb/EHeDRTIMpJLUd5HIv6kozc0AMayx/ZGeQ/oy0KH3KVodZi?=
 =?iso-8859-1?Q?kqI/xR/Ek8hxPdPeSXOLuPKlrqox9uJXe8n40BUZIB8OcCmjCWqybl86pG?=
 =?iso-8859-1?Q?/5k1lcm/7+wipKdrUi0rzZS/KU136kE07yuAH3Rnoz9VdtOaDPGIlfix+t?=
 =?iso-8859-1?Q?JAM0rWT6NwW8kegc1HElMFinXBd58djjJr6vqP3xGNjilk+OpZK3erjlpu?=
 =?iso-8859-1?Q?sFS6I8v1b0OOlBz3bJY6WexEndumBVOTbN8Nvzk04dbNqBdvJtXzM2/sDX?=
 =?iso-8859-1?Q?HpnVTvg4n2PDjMcANQZzhXN3U/Fcn/37eRMseZhm3ezioHzT4gNnydsFZ0?=
 =?iso-8859-1?Q?esbVJo5i00WRRepd/l8DExamAjg8cfMV4Tz38RXToqauY4jyRqHIszUO2B?=
 =?iso-8859-1?Q?Lon7bu0ZFLn8sHAjOyKyxDv4ZlOdjwbz4W0LJ3kFvrTJfYX4cxgNegq4K0?=
 =?iso-8859-1?Q?2J1ZkjVn1uOag+VExIRvr+2fhrbBPxuqPwhS9XFM169PKK5uWCm6u0XoEH?=
 =?iso-8859-1?Q?9nPBRn78oqwZnsn9IwNb35bRy1wEb0t0gH8Z+UQO7kpAzEHpKiuEhnonkZ?=
 =?iso-8859-1?Q?EZo6awAn28Rb1MAtc4lOuWETGsEBCj38BPhxGsci7no7R+t2HZOMN8sOOT?=
 =?iso-8859-1?Q?dzJl0f/FPF9lqRxIZqN3I4+xODszxOrHF+CrfpVKSondhcfW1rxATOzRlC?=
 =?iso-8859-1?Q?zRM747vVQEL6n/1BxZvMRNc2Yv1fRSRMQOirtE6LK/nOeOF+ggLm4mIDG6?=
 =?iso-8859-1?Q?P57WxEr6cGnL8k07vAzKxNnSS92AWBz4ednuHpK3K1jxn8IF9SJV8M9OF4?=
 =?iso-8859-1?Q?l6l2JAjDArndFlkYQpOHd3yGtodIwn5yw5Z5/NfbWN+0scknNarZGqOWS4?=
 =?iso-8859-1?Q?7waYf2V1PBWtW/IXTpXWvTMdbJZA6780yGzGsHzNO8uNySR31yj/UvJ4VS?=
 =?iso-8859-1?Q?9PmPJlBxKWHfllf7kiPp2YmQhtc/XWeBTWRuIYmKy8NqWQLqx9gO1au3os?=
 =?iso-8859-1?Q?FjbW7TUMuZ+k688UMlKTJ6DjBHPRgj0XCB3vzv7dkqkLITkjcJui+Me6RB?=
 =?iso-8859-1?Q?+wHMV5fpi9X0Jd+ARu0FJ4HcbQBT67FvrY/pJFeyKgEYa5uCs3OXrNfuRa?=
 =?iso-8859-1?Q?1oPm4BFi3kyjTuo7G64VvdzGLKH2HMvs7EDIvlpdM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-722bc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3d5faa-b653-433e-7e9b-08dcc64b9204
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 03:51:45.3855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB1826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_205244_586480_8B76DA63 
X-CRM114-Status: GOOD (  16.59  )
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

Hi Zhihao,

> During wear-leveing work, the source PEB will be moved into scrub list
> when source LEB cannot be locked in ubi_eba_copy_leb(), which is wrong
> for non-scrub type source PEB.

My understanding it's just the expected design of UBI wear leveling. When ubi_eba_copy_leb() is called for non-scrub type source PEB, it also indicates that this non-scrub PEB's ease counter has be over UBI_WL_THRESHOLD, so the WL should be performed on it. If ubi_eba_copy_leb() fails with MOVE_RETRY, this PEB is moved to scrub tree for further WL operation. This should also be sane, right? Or you have any statistical data or evidence where the current design behavior has any real bad effect to the life time of flash?

________________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Zhihao Cheng <chengzhihao1@huawei.com>
Sent: Monday, August 19, 2024 11:26
To: richard@nod.at; miquel.raynal@bootlin.com; daniel@makrotopia.org
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] ubi: wl: Put source PEB into correct list if trying locking LEB failed

During wear-leveing work, the source PEB will be moved into scrub list
when source LEB cannot be locked in ubi_eba_copy_leb(), which is wrong
for non-scrub type source PEB. The problem could bring extra and
ineffective wear-leveing jobs, which makes more or less negative effects
for the life time of flash. Specifically, the process is divided 2 steps:
1. wear_leveling_worker // generate false scrub type PEB
     ubi_eba_copy_leb // MOVE_RETRY is returned
       leb_write_trylock // trylock failed
     scrubbing = 1;
     e1 is put into ubi->scrub
2. wear_leveling_worker // schedule false scrub type PEB for wl
     scrubbing = 1
     e1 = rb_entry(rb_first(&ubi->scrub))

The problem can be reproduced easily by running fsstress on a small
UBIFS partition(<64M, simulated by nandsim) for 5~10mins
(CONFIG_MTD_UBI_FASTMAP=y,CONFIG_MTD_UBI_WL_THRESHOLD=50). Following
message is shown:
 ubi0: scrubbed PEB 66 (LEB 0:10), data moved to PEB 165

Since scrub type source PEB has set variable scrubbing as '1', and
variable scrubbing is checked before variable keep, so the problem can
be fixed by setting keep variable as 1 directly if the source LEB cannot
be locked.

Fixes: e801e128b220 ("UBI: fix missing scrub when there is a bit-flip")
CC: stable@vger.kernel.org
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/wl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index a357f3d27f2f..8a26968aba11 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -846,7 +846,14 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
                        goto out_not_moved;
                }
                if (err == MOVE_RETRY) {
-                       scrubbing = 1;
+                       /*
+                        * For source PEB:
+                        * 1. The scrubbing is set for scrub type PEB, it will
+                        *    be put back into ubi->scrub list.
+                        * 2. Non-scrub type PEB will be put back into ubi->used
+                        *    list.
+                        */
+                       keep = 1;
                        dst_leb_clean = 1;
                        goto out_not_moved;
                }
--
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
