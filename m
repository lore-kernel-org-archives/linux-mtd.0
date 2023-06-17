Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD3EEB64D9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Jun 2023 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TPv10qvbVKGjfRCxJvueNGif8V3kMn0DExDVmDXaDFo=; b=F9Phq3+WGxbNlV
	vl/x/d2gX1Asr2GBeMbrIYRsHRiKSrZ6NjieQk29Hj1bgIrFjtLSGJQzRjH2jMu6K29P4QxderDaX
	DloyHRy2KSB7nhdnJGJoI0WFekCW8+tOkiniv2XIaQ0legMnQxHCL84KyD6E5sbASa2d3SHaEvgqf
	MX6Y13Zr5PsNK2gXspVZdh7MbgcrClr3cylCAm9hwYRSSBkJvYQJpmLuUuy+cOy9O/NDTnFJ4CyUx
	mq/9xTuuxELCWzb6cJElSRJb/lmtovGPXTqZjXuhEAFs+AoHFPbzl1C2q9vmjCzwuSdSm73zGLBoD
	7wLB9wVHZHoVdV0/HtlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAXBb-003lcX-2P;
	Sat, 17 Jun 2023 14:45:55 +0000
Received: from mail-dm6nam10on20715.outbound.protection.outlook.com ([2a01:111:f400:7e88::715] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAXBY-003lc7-2A
	for linux-mtd@lists.infradead.org;
	Sat, 17 Jun 2023 14:45:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrKgnr/ieVIntHYfsgoHLQ9I2oYTjnO19P29JFvTpHqjqGpdphjRX3xdWeIsBhVGvrTBAc8D2yDoOozrzupsmkSRMpaOnUEsq8KAAP+lnWKgSTheC5041pAnDttx95dZKuK8o/UiAukU/hmKZl/p9HOnisL0RA5NbbFvRhkVTbAKvCW3D7MoxfKG/yfO8D+LST+LLp0ptbV6oeCzX/KbtFbjmoTSKehiwh6d7eo6VypyzI3MpfJkmkUc+3pFIKBmx6W6H7c8acGdkzH0hp8WehH2uPq+VStfUTtSONgLcdmYtdfpGFKgyWWkCrCDhrQX1ILEDwnYplkEpH4lH0EH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4Xi7iA+9DbIb1xG8DwHYEeKdT1jlDgn+SU1bj/fnLI=;
 b=LE1IV6wTDpBsFonV6kzBHWUgo4eiWe9DS89kZgB87vQKrBVutNaZCy4QCeF1Y7Ce4uwXODODJz0pwsLzOJVirgyB+kECwntQXzAHmH3CoIJSh0l8J81pbJ41mY8brkEvznVtWpq3s1psJhcaqk/XFtrrMbHFQ6zMN8fZtDjYWTK/mkogRrAGhlbt7RI2d6TOXkJibNN+kYiGjcSoe0FgrnByeoho0qz/INYDtJvFsEybsyTOTvGgMDxbvzQ9aRTPWDgvsZC0gmnRsPQQhBTsU63ywCVm8mWn/zFAkDeDlVLUR2XFFJGBQA2hEOpsF2ZJbWbT4t1C7ijuuWOYnP6XfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4Xi7iA+9DbIb1xG8DwHYEeKdT1jlDgn+SU1bj/fnLI=;
 b=hddhAOFd/yqA+adnmDF8Jo/jXu/48tnZalcq3wX83Ttw9acaicw8EtqE98lqMSPgGFXJdTc6u1JqsEF+nWj0qAqCSLYBq00Y7r57FIQ1RcZVuWaX2D1m06YyCvNWhAsGLsOBnIuzhinpOUQzq0gDT7RTngXvpQ/gr9PvZgVIgt5QPfY2xg5KOTipXyq7NbkNpJwm/4eiTIHsAi1Qe+W/k1FylyPP/JZAaiX2FWmUC/OyGEygq/3I6gkGZrFofm+Db7Z7YLg0CoeDzZZfmBLs+/dijBvNOPhJdZ0KM90wFVn14Z/kHTsr1Yk0vjrUh5LcdlYQOb6D3hsCwMdeV8Dwlw==
Received: from BY3PR08MB7041.namprd08.prod.outlook.com (2603:10b6:a03:365::14)
 by SJ2PR08MB8478.namprd08.prod.outlook.com (2603:10b6:a03:4af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Sat, 17 Jun
 2023 14:45:41 +0000
Received: from BY3PR08MB7041.namprd08.prod.outlook.com
 ([fe80::a0eb:864d:ba8b:f772]) by BY3PR08MB7041.namprd08.prod.outlook.com
 ([fe80::a0eb:864d:ba8b:f772%4]) with mapi id 15.20.6500.031; Sat, 17 Jun 2023
 14:45:41 +0000
From: "Alexandra Lu (Nokia)" <alexandra.lu@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "Alexandra Lu (Nokia)" <alexandra.lu@nokia.com>
Subject: UBIFS assert failed: !list_empty(&sleb->nodes), in fs/ubifs/gc.c:516
 or UBIFS assert failed: dirty == LPROPS_NC || dirty >= 0, in
 fs/ubifs/lprops.c:557
Thread-Topic: UBIFS assert failed: !list_empty(&sleb->nodes), in
 fs/ubifs/gc.c:516 or UBIFS assert failed: dirty == LPROPS_NC || dirty >= 0,
 in fs/ubifs/lprops.c:557
Thread-Index: AdmhKiaFsDYHcZexQ66wtWxoyZ9sTg==
Date: Sat, 17 Jun 2023 14:45:41 +0000
Message-ID: <BY3PR08MB7041F1FD9D1027999E0D336D8859A@BY3PR08MB7041.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR08MB7041:EE_|SJ2PR08MB8478:EE_
x-ms-office365-filtering-correlation-id: 696494d9-c418-4d35-0156-08db6f4185c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O3Ykxq+4BQUytjkFQ2AgHzfg8THoPvBkofvvp1XTGuDZ8Nh8/Qx5fKlUQSMpyOaWQ8oXn11ikbxtbsbi5cXmOib7ySnqarnRu9MYKloZK5Og7nxpHuzgOoRf3fRyW5NVJQnP9jSG97FfjZtDroJuHJbJRpgWf9leuGmR3EpkgzsBl8TxKMfT7XP3tTe0UBugk3oQeXZEuO6GvFfpKssHA09FhnZxO0RBNBq+H9wW9bLiAvnTDWiBRCXie2y+OVNq121f6YSvrTIxCbYZm075wp59UgdR2OHfBYvc/Q3yyK+RMZ5cTW2pv9ikmwf/X7rZx3o3jvoWhob8J/TCH92Q85QJO2qSDnoi4FTID1YyCibNynw78kQU7n/bcvv2SjqQMCwz/jB85DpWhvEIiefm+PSsXTTYWpVC8lXxa2+d/glxLvyYwiHyV5lDyBG7gxt2g9kRAy+700HdIKWMQa+vM0qGlmR0Xb/kkhPZUcvQiphUvrs+WsHlGRJCgiO0SBDKCgT7LbGcaCDClnJcZIvLJYOESI7DhE+x5OM39HRq6rQT20vKF9STfZ5/DLzWE9qRAs3MCSWEN8B2AVXyLwBX0i0GEMgo0stJKJrdsEXodbVpRajYFdjLiti1Sgg4nFFc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR08MB7041.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199021)(86362001)(7696005)(66556008)(64756008)(4326008)(71200400001)(33656002)(66476007)(41300700001)(6916009)(66946007)(66446008)(76116006)(478600001)(316002)(26005)(107886003)(52536014)(55016003)(966005)(38070700005)(6506007)(8676002)(8936002)(9686003)(5660300002)(82960400001)(83380400001)(2906002)(122000001)(38100700002)(186003)(14143004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2FVyKV3/0mcg7ycfBduF9Qzt973PxZtESm2TQsXHoUeM8kO8IPDpD/O9jIQP?=
 =?us-ascii?Q?5eVLBrM61U614gX7T91opCC3mSYa5BPfy975SixxZ9BK8lLzYFXZx9+tvv4w?=
 =?us-ascii?Q?KM1LPGqSDZpukm2atzF+0nY7k0EF7c00KQh1jeC4xCqOdqCVqZx8iE8C7Yht?=
 =?us-ascii?Q?Cv6Vj6Q/RA6LxwPAG5PAIOsc+jMfbwPjb8uQVZ/9E6k78I6Q+xD+QAY8yI1h?=
 =?us-ascii?Q?/VYEVa2Qn13sbJscQFDjC/ajPVWMBNHxebDQtCfWE4+UHHfXzYpB/B+kImNv?=
 =?us-ascii?Q?UC3CZ3Kb2bK4Nb9QFtOIeN7n5/yiSe/nI2NUVfygXbIQDOBFmwmoJDd4Tod1?=
 =?us-ascii?Q?NmpZWJlzDhT2v4RVyKRMGsFqEe7qw8KUgSk8koEzt4DJ2Dg5vK7RJ+K/jv0l?=
 =?us-ascii?Q?QnPdMNGuEk+OgyZGmqnVmcpwo0BFT5c5c4pb2417T10G6qWjGgE7Ch8tgwet?=
 =?us-ascii?Q?i9JCq9VY2DInFlEq6/VqeFZ8lyYQGUFVsCBUv95G2mtYRNEjEiuwxXLxSXWj?=
 =?us-ascii?Q?Eyg0WRzkE6DIU0osdFbcPeWSIPoX2HFadx5sxaXa+PFfp73rUnV6GurUv3zs?=
 =?us-ascii?Q?F762oq5vVRiP9M+KYYB8ALmQbjFICwuMdlDr/arDcwKC0a8UJKwGZUjhEMvT?=
 =?us-ascii?Q?6hF68qiqFoSwmgVpdc3xFtQRcKTPlqEDInmcN0UOz51vdNSHQ9GgbL7g+gh0?=
 =?us-ascii?Q?6Js11J2iviD/9CQ8bavX/1Qlxpa6qI/eZ/GcuC2z3CN9DDBB3BK69hwqW7s7?=
 =?us-ascii?Q?fYQ147o4Pig6WH4UF+oOvswFw/Z/iCOvdyVjBuzNpqPbqcb4unrXnICc6+pT?=
 =?us-ascii?Q?NTzcDLbHKqVj9sR0JHf8eR3YvOqs8eMdQVbbAGGarMog7eN5YO8wwPGrzwwq?=
 =?us-ascii?Q?ZtR/GPUgMKo3ND2jLju1PiQ5sC3SZI+JD/+Uu+UaMRxSF6qfrVdd/P4VOaHR?=
 =?us-ascii?Q?Ah3VpUFARon1R5mCdAeg/+c9n6aJdioCMaqXlNgAff/T4MuqzObzukSHGeA6?=
 =?us-ascii?Q?mlD0w6ubSGMDwL58y/+NoNDi4RWd3vsYm0bi452PVs+7dJ8TiggA8M9c0Qyw?=
 =?us-ascii?Q?7Gm/pWLN9mpbs75CJUnVcW0ExSw43lYoUQtx3jiWjZ6wxEMhh248/rtvL8A2?=
 =?us-ascii?Q?75KKMgAO+zYgYSUd2gMJpl+MgKkcfHvj8+wIAoZVCuiUX/7Njs5lOE0b+3sj?=
 =?us-ascii?Q?srqRjIGSMFG2/c2S9AOfkoDpAPMO4jUMs7cjwGWcMbkrWCPBKRNTwqJqmPKM?=
 =?us-ascii?Q?XFvYjXxc94pp87gFTFafFIn4MDL3MQKVtn40Ifcpsziou7GpRJqBzylcXRWU?=
 =?us-ascii?Q?odQIfhHwzDS2eNYIWMCTL7TctedsK8/vDdPe1TPIAW9QaLJbmDqh7diBcjwH?=
 =?us-ascii?Q?X/AEV7b+k6T6ujcpUv+uIpG9X2ntjww6h2YEBNPveqACtpnxfHpMKQJ03xQ3?=
 =?us-ascii?Q?z7j6aXn9i86hX2ykC40zXSOTjJm/AaMFdz6Xn6G4q5yiGrOMMzWMJKlVX04+?=
 =?us-ascii?Q?AwpQAzqaJQppRcNs88+mqM6MC484txxrMTW0V/fyvZWso+MCiP1uMAxUXtij?=
 =?us-ascii?Q?BQsYVkrC3vk+IEPZe57WvW9HjKmkN0gGNBDs7XmE?=
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR08MB7041.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696494d9-c418-4d35-0156-08db6f4185c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2023 14:45:41.0632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sOH9dtE1rL2xeOx0sATaKNAC23jAIBJK8UJL1Hfd7vqLkHNA6QkH0GJ39sGZQloa7l23sJyF51jUJLsN75QdIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR08MB8478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_074552_718906_4698D230 
X-CRM114-Status: UNSURE (   8.79  )
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

Hi,

I'm having an issue with ubifs LEB property corruption, which causes 2 different flavors of ubi exceptions:

1) This happens when trying to copy a very large file to the file system, copying small file still works:
root@sar:~# dmesg 
[ 4590.237822] UBIFS error (ubi1:0 pid 2011): ubifs_assert_failed: UBIFS assert failed: !list_empty(&sleb->nodes), in fs/ubifs/gc.c:516
[ 4590.237850] UBIFS warning (ubi1:0 pid 2011): ubifs_ro_mode.part.0: switched to read-only mode, error -22
[ 4590.237865] CPU: 0 PID: 2011 Comm: loop0 Tainted: G           O      4.19.26 #1


2) This happens when mounting the file system after a graceful power cycle reboot (not power cut in the middle of user space file operation):
|gash: 06/16/23 09:10:07.681| UBI device number 1, total 3068 LEBs (389562368 bytes, 371.5 MiB), available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
|gash: 06/16/23 09:10:07.816| [   47.974899] UBIFS (ubi1:0): background thread "ubifs_bgt1_0" started, PID 1905
|gash: 06/16/23 09:10:07.917| [   48.005772] UBIFS (ubi1:0): recovery needed
|gash: 06/16/23 09:10:09.229| [   49.409644] UBIFS error (ubi1:0 pid 1904): ubifs_assert_failed: UBIFS assert failed: dirty == LPROPS_NC || dirty >= 0, in fs/ubifs/lprops.c:557
|gash: 06/16/23 09:10:09.240| [   49.422534] UBIFS warning (ubi1:0 pid 1904): ubifs_ro_mode.part.0: switched to read-only mode, error -22

|gash: 06/16/23 09:10:14.541| [   54.721605] LEB 362     free 0        dirty 44096    used 82880    free + dirty 44096    dark 6144 dead 0    nodes fit 10  flags 0x1  (dirty)
|gash: 06/16/23 09:10:14.556| [   54.734285] LEB 363     free 2048     dirty -248     used 125176   free + dirty 1800     dark 0    dead 1800 nodes fit 0   flags 0x10 (taken, bud of jhead 0 (GC))
|gash: 06/16/23 09:10:14.571| [   54.748783] LEB 364     free 0        dirty 44096    used 82880    free + dirty 44096    dark 6144 dead 0    nodes fit 10  flags 0x1  (dirty)


In the 2nd case, I could see what the corruption is, but how it got into that state is a mystery. We suspect the issue might be related to switching back and forth the same file system between a native ubifs mount and a coipfs+xattr mount, but it is very hard to reproduce in order to isolate xattr as the cause. I came across the following email thread online which is of interest, and am reaching out to this mailing list to see if I could get some pointers with the trouble shooting. For example, under what circumstances could the dirty bit turn negative?

https://linux-mtd.infradead.narkive.com/sYWUjXnZ/ubifs-question-power-cuts-after-ubifs-leb-unmap

Thanks,

Alexandra


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
