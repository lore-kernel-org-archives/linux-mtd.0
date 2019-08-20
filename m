Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE96C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 23:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142EF22DD6
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 23:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8nf2cT9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fb.com header.i=@fb.com header.b="HlOYVoSx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com header.b="lMpV4ZtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142EF22DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fb.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HLdCdsTLua+K/Pux3PpbZRFXXYXhZZuiJYOwCYP1NKc=; b=g8nf2cT9iswLkG
	uPj9HCWGvIGTH2t6YB+A9+EETcmiMYkHwYtJVI53IgNfG/N98S1pBLX8FcibAnFx8XWpixu2BteGU
	nEG3coFpE1tjdxl4d2R1B1MLX0G5SrInLEQVoxDK7/8/0UjHOV/sKBxWUTJZqSt4E3rAOl83ReRSK
	4zSOu2a/SmXctRF0b+FR7SfZAB2U5PPRDJ1hMgQrNjMiChdI7Mk1agvwwLwtiREm5XPQO3iv6UzVL
	KK1lG1pGRCXwJXOAshiPLOzYp6QUsrRy7goQ3vPVPc9TytsTejdeX1NqSyoZGzxL6q7gPb/L/2wgm
	oK+eC3JXSy/ZZMk7xdcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0DFZ-0003Fz-2p; Tue, 20 Aug 2019 23:09:13 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0DFW-0003FY-NR
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 23:09:12 +0000
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KMxrCd019685; Tue, 20 Aug 2019 16:09:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=FK6afvOlIKQ4BOaoaoa3WtfBXIl2FrgaxP2dR3OLL2s=;
 b=HlOYVoSxZ/BQrOwy4lkhGNVgfGb7OLMDo5Hp2wfHTXwEWShJHwmDlHKjq655uKYUQtHX
 Q2RVbpjVwgEbfg9BwDPjkFOXmgCDzuyw+X38q7pS0d7gH/INBJpSl+rOUjHdC/PJNNIf
 S0g9ZQ9RH6067/HZcPUk/+q0eXke74b/5x8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ugsns056h-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Aug 2019 16:09:09 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 16:09:05 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 16:09:05 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 16:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ayv5+FGz3HsQjo/yOMZo7JoFyOP1ZS3zkN1vd/NHAOG5N9/ys0KIMZuSwaDlcYtblfTNPpdDcAsmxIsL3x3oxld6FH/zLyyPhIo39GBfD4ouOVVCFLsZEmnvqKn1SYUMyKWKwjuGE0yZtNLPJoJl7QfyN5+BeowUILWtGMDRImZSjeIyfVziTTXKNJfYnOjnZqtgSaACagpKlfNvizuYdagABBYFrqw/Qr+2v6Z86VB8GYCA8n4XvC4GtQOhU6s+HuNLLwj71lv1PAbnGnEJCl2+yWHk/QTTa++sleC6NslAgaMQ1FC70XOcHDPgD8duVaHdQ3DqVCIb/D9hk4GQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK6afvOlIKQ4BOaoaoa3WtfBXIl2FrgaxP2dR3OLL2s=;
 b=Tc4jt6dAiG09u9jywQw0lUOrnzdWe3XrTGUFWVMCiDxy0XJuVGud6nhmk+r+HfieopOvxrZZWLU1BvU79DQkXY7K77yV/0ST1lR1nfEe1iE3m/nVlHI12EfBlNlfqTJfijcynsYFQAOunWwLvDPrlprLfjwEIxsO+FXveBPtZFyDzSVzqyjI1wAJVxaRrqMA+mOXy+l+4ADkHiWh4xIg5+mKRq2BCXJK9cWyXzHVavLuGNEr+EbhUfC9zLUClOwJ1Wjvq0vQwYW/8cFVPpgMzNbmY76P8r6SX6qNa/wNBhpZXCQbPbgAXwSfa7EHDZ6+Mscb+v7AVALxG1LHx79/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK6afvOlIKQ4BOaoaoa3WtfBXIl2FrgaxP2dR3OLL2s=;
 b=lMpV4ZtXaUB6/Q0i5dJOB7qCtdaHa4iiHLtCwMapXCdDrjUFG5H1CutQiFOJjn+WtmYb7wCsuas7JfWV+CfcAzgmWVTLkXZxoIgLkZBx/sdidLOXsHrUFC0j3ti3VnRE96VYDTuXniyTOaYSxAmt+p3jvF69Pf385rlT39QflzE=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1933.namprd15.prod.outlook.com (10.174.100.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 23:09:04 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 23:09:04 +0000
From: Tao Ren <taoren@fb.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>
Subject: kernel BUG at fs/jffs2/gc.c:395!
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCJO1RYYOHHUGizk0YT2Pfyg==
Date: Tue, 20 Aug 2019 23:09:04 +0000
Message-ID: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR2201CA0010.namprd22.prod.outlook.com
 (2603:10b6:301:28::23) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:7d53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c24a933-2212-4d39-2620-08d725c36517
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1933; 
x-ms-traffictypediagnostic: MWHPR15MB1933:
x-microsoft-antispam-prvs: <MWHPR15MB1933003698CA1AF36DFCA074B2AB0@MWHPR15MB1933.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(476003)(31696002)(45080400002)(46003)(2501003)(81156014)(14454004)(8936002)(52116002)(14444005)(81166006)(478600001)(99286004)(31686004)(7736002)(316002)(58126008)(2906002)(6116002)(110136005)(305945005)(71200400001)(71190400001)(66446008)(66476007)(66556008)(66946007)(86362001)(64756008)(65956001)(6436002)(486006)(25786009)(5660300002)(53936002)(6512007)(6486002)(102836004)(256004)(36756003)(186003)(6506007)(65806001)(2616005)(386003)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1933;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jASrRqZRlfFjLbyKXp5nc3cVXmcOA1Dnl2nl/DnFw/OqP9CWvc/pFc2yV/ouMMOIJJF5nSELLmsjz5FsOECt/50ks3TJou6jtmgqWYXr2dqX5wep1ZEQz2zF7eLZt9Wg4hgFZE+YUP/sUIKyIeQiLf1n26r37CifN+3gG32m6n2Uoq5yVDg5pQxJaySqnHpQoBdefzfgNPfO0jeEkz1hBhh3yEhuBAl5Sut6y7YJ3HcelN9Mt4i8BNLOr6xPzkTrrjmcPdlLn20pe6cDsfrT1a38MkkeBm/vjaiAPeBI1FqEYAaGpUi8UCRIwfyZnPNkYRspfugDjhoEYE2STHrleybIT0GxA8/GvEMCsB6v+XbrBl83Fq85oxvLI8dqsdiGinSKbra796WH+DBAQUtSSfOBWoMEYj/sKHuHCsIyjxw=
x-ms-exchange-transport-forked: True
Content-ID: <B0CBFD6F0110694481A859593DCDA044@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c24a933-2212-4d39-2620-08d725c36517
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 23:09:04.2550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qFz1/UYEnoSGB3PWAg5WdW9gRyss/bk49yOJtil1TTakSQJ4kr2Esv30FodEla1+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1933
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=777 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200209
X-FB-Internal: deliver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_160910_833887_75242716 
X-CRM114-Status: GOOD (  12.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

I hit following jffs2 bug while running Linux 5.0.3 on CMM (ASPEED2500) BMC platform. Has anyone seen the issue before? Any suggestions? 

[   46.024017] ------------[ cut here ]------------
[   46.079178] kernel BUG at /data/users/taoren/openbmc/build-cmm/tmp/work-shared/cmm/kernel-source/fs/jffs2/gc.c:395!
[   46.204076] Internal error: Oops - BUG: 0 [#1] ARM
[   46.261378] Modules linked in: ext4 mbcache jbd2 crypto_hash
[   46.329093] CPU: 0 PID: 1181 Comm: jffs2_gcd_mtd3 Not tainted 5.0.3-cmm #1
[   46.411343] Hardware name: Generic DT based system
[   46.468685] PC is at jffs2_garbage_collect_pass+0x6f4/0x734
[   46.535322] LR is at jffs2_garbage_collect_pass+0x6f4/0x734
[   46.601977] pc : [<802c292c>]    lr : [<802c292c>]    psr: 60000013
[   46.676959] sp : af3cded0  ip : b56a75c0  fp : af3cdf24
[   46.739463] r10: b4061140  r9 : b57a3900  r8 : b555d4ac
[   46.801968] r7 : b555d4ac  r6 : b403502c  r5 : 00000000  r4 : b4035000
[   46.880073] r3 : b56a75c0  r2 : 00000000  r1 : 00000000  r0 : b403502c
[   46.958177] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   47.043561] Control: 00c5387d  Table: b5774008  DAC: 00000051
[   47.112319] Process jffs2_gcd_mtd3 (pid: 1181, stack limit = 0x54372ffe)
[   47.192490] Stack: (0xaf3cded0 to 0xaf3ce000)
[   47.244601] dec0:                                     00000000 80a07028 800ad6c9 0000ff2c
[   47.342468] dee0: af3cdefc af3cdef0 80125cd4 8012313c af3cdf24 800ad6c9 8012614c b4035000 
[   47.440331] df00: ffffe000 af3cc000 af3cc000 b4035000 802c509c b419dd18 af3cdf74 af3cdf28
[   47.538196] df20: 802c5174 802c2244 ffffe000 00000001 00000000 ffffe000 b57b0940 00000000
[   47.636058] df40: ffffe000 b4035000 802c509c b419dd18 af3cdf74 800ad6c9 b5753980 b5753980
[   47.733923] df60: b57b0940 00000000 af3cdfac af3cdf78 80134d58 802c50a8 b5753998 b5753998
[   47.831787] df80: af3cdfac b57b0940 80134c0c 00000000 00000000 00000000 00000000 00000000
[   47.929648] dfa0: 00000000 af3cdfb0 801010e8 80134c18 00000000 00000000 00000000 00000000
[   48.027512] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   48.125376] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[   48.223230] Backtrace:  
[   48.252489] [<802c2238>] (jffs2_garbage_collect_pass) from [<802c5174>] (jffs2_garbage_collect_thread+0xd8/0x1ac)
[   48.375294]  r10:b419dd18 r9:802c509c r8:b4035000 r7:af3cc000 r6:af3cc000 r5:ffffe000
[   48.468985]  r4:b4035000
[   48.499281] [<802c509c>] (jffs2_garbage_collect_thread) from [<80134d58>] (kthread+0x14c/0x164)
[   48.603358]  r6:00000000 r5:b57b0940 r4:b5753980
[   48.658590] [<80134c0c>] (kthread) from [<801010e8>] (ret_from_fork+0x14/0x2c)
[   48.745001] Exception stack(0xaf3cdfb0 to 0xaf3cdff8)
[   48.805428] dfa0:                                     00000000 00000000 00000000 00000000
[   48.903296] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   49.001157] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   49.080305]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80134c0c
[   49.174000]  r4:b57b0940
[   49.204275] Code: e59f0044 ebfa25cb e1a00006 eb0e888d (e7f001f2)
[   49.277188] ---[ end trace 6baa7af0a90d15ab ]---
[   49.332395] Kernel panic - not syncing: Fatal exception


Thanks,

Tao
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
