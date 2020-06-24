Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AB8C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 19:01:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B2A22082F
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 19:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtYXowNi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="CQMztYP4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B2A22082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4hH7udmm8c3zdEBeaJySENMXjLMUO+yOniCTJChZ2O4=; b=rtYXowNiHd+dacDTKJN7IPM/G
	GVd1LfKygI7IvuBwfdwqIE35Z0aCMu57ZWIcqQWS1pUe9YX2esCmSg4viKssnBPdBu9yB4Hv0VKRX
	mbmLMmuw6blkKYaLhYwMxfz/4otYEaumgrnbC6MI3gV9IuFwGPGuxAmfKRGUOC8DfLsJwOMGnhbym
	twSZDTlmJsyABOu41/OVYL4mQLO3MPkEJKhMi8k3ixcTtSLgBWfL45Cjh7aHKF5DChwgmotuyq6/l
	lSfkHBD2TGso3bBeadp2aP8TsNZYvGJHsh6yJMNricLIOXrdkDK+a/6sqKXDO1JD8n5k80kHTdhQf
	vje78YCLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joAcq-0008Ag-G8; Wed, 24 Jun 2020 19:00:00 +0000
Received: from mail-bn8nam12on2060.outbound.protection.outlook.com
 ([40.107.237.60] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joAcm-00087o-7E
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 18:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdxPKB4OWvDU4AOTYs1w1/xmu3shfznXel78WykeuaILpGftu/8PmVmwkbVcpIqkq7HdePCEtQStHBFM1ZxeueVUCn3yjDthAYXVoIQSWC6JIaIfMP0Hew8aPicmPhSDG7gGyO1kYPvjDBWfCBchR0gl+TaxcdbGTbVzinrnhMpCkOUa7cNokMsZQOWpOSYesy5u29F/6P1qzh+IVzbExWaFUayV3gW7wHVxwhApXX5Sr+Y3gDlpAbU4UbLdkJzy8zKM71aFmJy8qZQZUsJsJomQjC6zncYcKVUZ1F3NEvk53C+SyGxUDY4vcXM78mnTLl/QMUJd0mTpsFf/AN46ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhgzuVucgavlCVQ5FLNtm/UDZ+1a6gSilUbYMAKGFrM=;
 b=YedB5xcZcIhhTxvgZ5kyjq/nm6kuyU/IRw1NmVFWG3nhf5xb9AcqT2EWxlq32V2KFh+dotOG5iHzUVQNSpNlK3f/CfiKghki1ELbRocQGMCfrbw40wC0/0uYbcDN6WozTMZANwv9hkq0JtCbwWBgWeEx3A2FZA6kP+WS9o+SKBOpI0CdI4rpdHHZtGagNAu54YhgAdQpwUHq2IysFO3COBGmZQJX5qws480e46z8QIcwz9RYHXaR3HmsHwXB/7LhNwsrciQrBve2ppcpAEtXCGrpSm/mOnxctUlPTI/VxAVj5GvAp4UzmP/u1j/uEAs4OAnSObumc3oWlWsUvVB39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhgzuVucgavlCVQ5FLNtm/UDZ+1a6gSilUbYMAKGFrM=;
 b=CQMztYP4Sw72VVE8NZi4sW38mnUutvn0ZKsGmysIZwyrq4SLpZz4LajeQk0Q61aSK2ivHH3uj+sbUs94ck1klnTcK16OdR88MgVOieKoVCq95YYmzuMv8IwIaRI4rkULluRurRBWOjqJdVcYomaR4+SsbHXai/kaS5aluDtukx8=
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 (2603:10b6:301:2e::20) by MWHPR10MB1680.namprd10.prod.outlook.com
 (2603:10b6:301:7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Wed, 24 Jun
 2020 18:59:52 +0000
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1]) by MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1%5]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 18:59:52 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "lizhe67@huawei.com" <lizhe67@huawei.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH] jffs2: fix UAF problem
Thread-Topic: [PATCH] jffs2: fix UAF problem
Thread-Index: AQHWRhkioXhOUXpJp0C2OVljdhi7G6joJxSA
Date: Wed, 24 Jun 2020 18:59:52 +0000
Message-ID: <e0d04d70ce674584a71af1a5a00984dd26729891.camel@infinera.com>
References: <20200619090635.58548-1-lizhe67@huawei.com>
In-Reply-To: <20200619090635.58548-1-lizhe67@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c29c404-aacb-41e1-3c83-08d81870c71c
x-ms-traffictypediagnostic: MWHPR10MB1680:
x-microsoft-antispam-prvs: <MWHPR10MB1680CD16C45F9AC7D2838888F4950@MWHPR10MB1680.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vIMxxT0offJiK7I67jzVEGsQi6fNxbd1ighlrqgxGputR9RI6jQXEnT46jwGS0yvXYWmmLud1GXwueW74M+Pm/MGYU5kaWjvh+xio+2ZaUBZt7NGkFij0kAI5fV4JIrDc3MhO6FhC26fs6toMVnW4/0ABuxHB93PvEtFTMzcKbR2rl51KHxYlF+zAVfRlek1RmJTsvfxHa0icUeo7WFoxnD3nOET7n39zsnF9a7VUWzmu5yDy3+WaN0W7umRTH1ZvhVl7j78FJq+5+vDEGTng/u/0bW46JD1IXSj961O9pGqwO6bu16t+lDDOkNawgo+FbyuZ5STkCedxG55HAi9tPllhWDg2njGYeoZ7Zqk/z6v/+qM5TCsPf7ce/KOkFzw59fAiRxybYZdutP0CjuBZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2190.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(83380400001)(5660300002)(76116006)(54906003)(91956017)(478600001)(86362001)(6512007)(36756003)(66446008)(2906002)(66556008)(66476007)(71200400001)(316002)(110136005)(6486002)(64756008)(45080400002)(66946007)(186003)(26005)(8676002)(966005)(8936002)(6506007)(2616005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zEIytsR7K/A/UHBz6tOgaHVrMmXz2Kzjg8uH2krmWIg43goXGA47F43+VwKPrLAn/2MKeKaZ0pqswr4Lrnu+fJ4U3bDLGbglnAm3xWV8+A+p8owP2PtWhUgDKexi9MF+iqfK+bINRxeOiYN3AcTvx/YaeVIiqWTq30GBCp7MFH2hl1cuWShcLJOVXu9fQSTsCsRVRRClZhs3m7mR/WBhp9y9rEWC3BGMFusBPtPQEhmgCbr7HcaDtKmVytB3ZZlyWaYlzqub05CpJj8gnpfn/F22aKYJxFIfqE3JmbHCxMeaAZuN4J9fRLdyao86W4LBFhobLW4pTb6HaQwUU/UkFod8AZDrhgT4iNLVHHAdGTMsbvvlr+j9+Jn9erB1npz6PrspVUCxQJevNU3bRG18e1jen+4d0OhKA+T3kiRPgJdo9qZ8N4luhI/L5CMV7rvi7MCs1qbVHpPapG4IY5FMhHzjNdgbYZfawJha+wUGZSs=
x-ms-exchange-transport-forked: True
Content-ID: <C2BF9CA22F8C4B46BC745821FFF3A7AE@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c29c404-aacb-41e1-3c83-08d81870c71c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 18:59:52.7466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+vdIIgcMGmBCSsAwVkPW2CBYXLAAdphvrrVevu/nlgIQSA++Fe/p7mEiNYUIY9W779AUxMJ7dOWdkX2SgxGNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1680
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
Cc: "zhongjubin@huawei.com" <zhongjubin@huawei.com>,
 "qiuxi1@huawei.com" <qiuxi1@huawei.com>,
 "wangfangpeng1@huawei.com" <wangfangpeng1@huawei.com>,
 "chenjie6@huawei.com" <chenjie6@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Nice find, I just came across a deadlock wrt GC and rmdir,
hopefully this is he fix.

This needs to go to stable too, sooner rather than later.

 Jocke

On Fri, 2020-06-19 at 17:06 +0800, Zhe Li wrote:
> 
> The log of UAF problem is listed below.
> BUG: KASAN: use-after-free in jffs2_rmdir+0xa4/0x1cc [jffs2] at addr c1f165fc
> Read of size 4 by task rm/8283
> =============================================================================
> BUG kmalloc-32 (Tainted: P    B      O   ): kasan: bad access detected
> -----------------------------------------------------------------------------
> 
> INFO: Allocated in 0xbbbbbbbb age=3054364 cpu=0 pid=0
>         0xb0bba6ef
>         jffs2_write_dirent+0x11c/0x9c8 [jffs2]
>         __slab_alloc.isra.21.constprop.25+0x2c/0x44
>         __kmalloc+0x1dc/0x370
>         jffs2_write_dirent+0x11c/0x9c8 [jffs2]
>         jffs2_do_unlink+0x328/0x5fc [jffs2]
>         jffs2_rmdir+0x110/0x1cc [jffs2]
>         vfs_rmdir+0x180/0x268
>         do_rmdir+0x2cc/0x300
>         ret_from_syscall+0x0/0x3c
> INFO: Freed in 0x205b age=3054364 cpu=0 pid=0
>         0x2e9173
>         jffs2_add_fd_to_list+0x138/0x1dc [jffs2]
>         jffs2_add_fd_to_list+0x138/0x1dc [jffs2]
>         jffs2_garbage_collect_dirent.isra.3+0x21c/0x288 [jffs2]
>         jffs2_garbage_collect_live+0x16bc/0x1800 [jffs2]
>         jffs2_garbage_collect_pass+0x678/0x11d4 [jffs2]
>         jffs2_garbage_collect_thread+0x1e8/0x3b0 [jffs2]
>         kthread+0x1a8/0x1b0
>         ret_from_kernel_thread+0x5c/0x64
> Call Trace:
> [c17ddd20] [c02452d4] kasan_report.part.0+0x298/0x72c (unreliable)
> [c17ddda0] [d2509680] jffs2_rmdir+0xa4/0x1cc [jffs2]
> [c17dddd0] [c026da04] vfs_rmdir+0x180/0x268
> [c17dde00] [c026f4e4] do_rmdir+0x2cc/0x300
> [c17ddf40] [c001a658] ret_from_syscall+0x0/0x3c
> 
> The root cause is that we don't get "jffs2_inode_info.sem" before
> we scan list "jffs2_inode_info.dents" in function jffs2_rmdir.
> This patch add codes to get "jffs2_inode_info.sem" before we scan
> "jffs2_inode_info.dents" to slove the UAF problem.
> 
> Signed-off-by: Zhe Li <lizhe67@huawei.com>
> ---
>  fs/jffs2/dir.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
> index f20cff1..7764937 100644
> --- a/fs/jffs2/dir.c
> +++ b/fs/jffs2/dir.c
> @@ -590,10 +590,14 @@ static int jffs2_rmdir (struct inode *dir_i, struct dentry *dentry)
>         int ret;
>         uint32_t now = JFFS2_NOW();
> 
> +       mutex_lock(&f->sem);
>         for (fd = f->dents ; fd; fd = fd->next) {
> -               if (fd->ino)
> +               if (fd->ino) {
> +                       mutex_unlock(&f->sem);
>                         return -ENOTEMPTY;
> +               }
>         }
> +       mutex_unlock(&f->sem);
> 
>         ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name,
>                               dentry->d_name.len, f, now);
> --
> 2.7.4
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> https://nam03.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-mtd%2F&amp;data=02%7C01%7Cjoakim.tjernlund%40infinera.com%7C339a1184745b4c76bdf908d8143043b2%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C637281544815697582&amp;sdata=jKo97fc3j6jVcjVpS2exm0sDL%2BWr6DqkTe6jqe8G9t8%3D&amp;reserved=0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
