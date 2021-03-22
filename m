Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920B1C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 20:09:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BF86196C
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 20:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BF86196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z2ZfrFVDxQ2N3TTjPESOx1J0NG7KsjwLLTsSpaPRP24=; b=nn0yhstX+U8V9m/aZNcfXYt4I
	67+FXpOjS9AEqyM1Y6Wl/Pp03YGO2VpDxOwJRdCJ0Sz3Zcc8EmbQdDaVl1NwKYggtyB/PqBRN1ipK
	H8UG2OATHgQVNlzvw8VTdSjw2w3BQPUlqbmfb/Gl0H91u+MbXK5PyFKJ+3PYBoNn4SdGzuJ8ilc+1
	MBKK6SvJClYh3pnvjXnmW2us29EgMXbXvRtGnbgC81H63yI4ZM9mKK2xlrK10QaE25f+a5quAYt85
	e35PUI+7JK33TenApV+WUNkOvGyrEMQuSwjwDEzSnXnszm3gFNRe6ULy48dBjYZcwHUzfFey9gFrF
	kxsJZlpdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOQqE-00CU7t-7N; Mon, 22 Mar 2021 20:07:58 +0000
Received: from mail-bn7nam10on2080.outbound.protection.outlook.com
 ([40.107.92.80] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOQq6-00CU6X-1Y
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 20:07:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKWVaIg2UnxJQUN5V8Wv+XEx8ZXj9CIAR3kFNe8N2oge3xNWC5iOb8fWhjbsUckKeT2FvWEPLYa77j87UT/7tVMoeTwrdq4JVtymqXuP0y6wy98LS19qiE5Luxpw2Pxstw1IWlgE/0D/GMMdtIAnQSI1nkbrHCnGuzZBN6Lll/+8Hqp1K237BxwGFNETGu8AFJe3v11/aK98R4Y4pYJdpW6Bis0I+Gx2Ie/sdnq+Hnrx6pohFvdYgiYue92ON4czShOf3WqRe34xCwDn0oSDFvQ1xMKOk/iUgPLYyxbUYFigQA7WqRpi7dLMeDfSx23riLAR+I4acGRTKozbjnC6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKXJhiaAvXQNW8Hh9HWq2aiTSMjnM2dhqGNg0B/7di8=;
 b=AZkZXn9iNYYwDG3YC6fZ134wfogFuY7uDrgxPcP5F0nUrnHEOyvq+67SFETd5cZCBbA8lLGz1msz5GE1jHuum6izOdUSho0pF5ijMSAFtnPlvPrbLQaRyxUuvciXxhAVghWST6eM3kkGI8P5xoUDLRfbzCfYofDcmJNbzifTSBogzcpYo1vEcqilHHyjtO5DdEFCusn6NbkIoebCIQrPLWvZQmKamsQ7a0KE+f4iZSE/zxfW12nLqTTutnSMiwQ48oObefzMBUeDzUmLJRo1yvOpBz/y4QwTJrGeAh/kaGa01VWGu7DTZWEEQazN40T6s+YsqZPszhBKpn283kF8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKXJhiaAvXQNW8Hh9HWq2aiTSMjnM2dhqGNg0B/7di8=;
 b=UbqAywfWN/py5y3f1TRe8UwezswkLIC8od0AGoNyNM6axY99JPE9Lsoyx6zGQCeudMyKcbn/60mQn7pvNMB4vJpJIphMJ/bwwEX4Tc3UtbvMzWWpFoHBcklpMhPR9Vu36JNq+d35ki5FtfXLyDemsrHbS+99hnYrE7XcmN9kmXs=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB1398.namprd10.prod.outlook.com
 (2603:10b6:903:30::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 20:07:37 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::fcfe:f4e4:1d73:6d79%5]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 20:07:37 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: Zhe Li <lizhe67@huawei.com>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "wangfangpeng1@huawei.com" <wangfangpeng1@huawei.com>,
 "xukunkun1@huawei.com" <xukunkun1@huawei.com>, "zhongjubin@huawei.com"
 <zhongjubin@huawei.com>, "chenjie6@huawei.com" <chenjie6@huawei.com>
Subject: Re: [PATCH] jffs2: fix kasan slab-out-of-bounds problem
Thread-Topic: [PATCH] jffs2: fix kasan slab-out-of-bounds problem
Thread-Index: AQHXG6TtC8xnwV9O+02ylI57ffrSdKqQdg+D
Date: Mon, 22 Mar 2021 20:07:37 +0000
Message-ID: <CY4PR1001MB2389E99ECB5B04A65BE35E22F4659@CY4PR1001MB2389.namprd10.prod.outlook.com>
References: <20210318030657.22840-1-lizhe67@huawei.com>
In-Reply-To: <20210318030657.22840-1-lizhe67@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [178.174.231.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e640d3bb-50c6-4c30-2844-08d8ed6e23b2
x-ms-traffictypediagnostic: CY4PR10MB1398:
x-microsoft-antispam-prvs: <CY4PR10MB139884BA2C47C95530079748F4659@CY4PR10MB1398.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kElvTonxKE+2mU9tTutchHKQwsG9AxRKgCuJkjmvvDjC5Az6lsasvQHstHcHCLFTzWThCIvOzN+Q+k+Td8pRF4p+9ehz4J3qYthjEDiQ0wzdWT/voguEYWVnih4dGrlNubU18XtFb0yPgrC+cdX/Bw8RyrWrCMe3qU7E70SKlyFIZIkc/juHpytFXnFsL7+5/7IEHBfazegbwh1aEO72ipE7XlyUIDi+VXRJbZ2qAFFoctv/j+GdUIwSRHjkah7SEh1kRQMnqGSrfE/mqnxcYSoc7SW5heErrwhim9ccgTnlUwvh2EIDMw74yE+MJ8Kb1+XKP9wuOkVZkZEUvzKZM1z4d2JHkWQZbZrFrCPr4UxPpAclR4mwJqszA6GzbEzSVSsUyDz87SaQRX0XxLBNWeD8HRfORepJtKfc0k2m0eWC9fq1I6Gf2Hm5vd8nHXFndqBdWNtYt87pH9ZpiS714rqZqfpzCeRzp1nuCZUO7w++/Sw4GnHovhOHR3DsLh1kFUYspawZp05zSUavd3be7DU1+w+75UXY6+L79yU+C4q/EwHY97dyvORoE1BRDgPil9SvfZ3OSviZG2ca4xMLyn7vKpSnnmyIeZcsgAa+mna4QFxXrh7bg5iFkSgA5pmhWVpdI/c+CWE9wo3fqN+cUiMhHpTQd8haR1NKv4bPW7vsGZzUbxQP1xYp+PHdb+wyJRtE530nZAZhm0vkgBkV0lYvRDT5iJ/pMFYAeIC9l9/iu9CPGvcYnr5TA0Rgw+9S
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(110136005)(186003)(9686003)(52536014)(5660300002)(86362001)(7696005)(966005)(54906003)(316002)(53546011)(45080400002)(6506007)(76116006)(66476007)(478600001)(26005)(55016002)(91956017)(8936002)(66946007)(66556008)(64756008)(66446008)(33656002)(83380400001)(4326008)(8676002)(2906002)(38100700001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?GabfbNWLr3WsvGghYU/R2RGBryJbCdYFcu35PyF/wuPs7fwj9BZLTQr4Ub?=
 =?iso-8859-1?Q?aijRxOQjZjP4/Thri8+EWRe9FMAzWGtITOCYMu4wbzm/+UeBxUMdFnqaYO?=
 =?iso-8859-1?Q?YQodGAaAqkq+CY2oquyFm1XSXokyvNe9L5wcdJIETAU+i2O3XP6QKpPmmQ?=
 =?iso-8859-1?Q?zwKJ92hOu/9tn0Do/xfbWP8lXLiuIrt+w0XFbrSnbJxFp7Y6O4zs6HMB+O?=
 =?iso-8859-1?Q?tmKNlFpvu03gkQCmQmKcJv8iJOBzvkv8ESircN4lqchwYSLXb214cnIwfH?=
 =?iso-8859-1?Q?y4UesW2JuQQwF5Tdx20QzY2gxeuQFQEXeiDeKPLvqcYqlnhOP5PDFdORaM?=
 =?iso-8859-1?Q?aUv117bXwLWdH6A2G9hFGsQPQBn2NeCjEa/q4028kKfLB6lZm35gd6yZw5?=
 =?iso-8859-1?Q?5SMlj7MRNSs0rQlJjEHST1begSQfys9LNGJkSwqYy8q4HRuRHv8AW13jI3?=
 =?iso-8859-1?Q?FtimUsB2HOnSnlH6p0fXl+RQ8rUjhkNgLZ+AVePVe1aRGrijT+3O9d3t2c?=
 =?iso-8859-1?Q?3yXvc69rEXmOZ0i82FhiO6ZQ9+m/0rxzXzX+FE+1ulaWHqxO8Fn6s5Mjrg?=
 =?iso-8859-1?Q?wo9BkVbcpsFO6BShWeMUDg52mBnPT9KSFoO8bIphkJhzWUZWD+VMQcJsgN?=
 =?iso-8859-1?Q?HU4EQdaQXkkQnZS7qup8n+2l8I7767s9uQRtganKFSwtkzhUM+wGdHrGDU?=
 =?iso-8859-1?Q?GjPnoim8pXjhYxCFXjEHorSHl1MiWziC8lGhOWKLamgHWayvCz9o4h9Gjz?=
 =?iso-8859-1?Q?VSa3FbI3DaC9XwzyX5NAnlmBqOtCPwYih/LimWylBrArSX1Ukad9azkqOi?=
 =?iso-8859-1?Q?inVh/ptaNEmJPVa3/lP9EUusbaKemgYaNz6fD3Brw/CY8MSYbMVN7WmPKQ?=
 =?iso-8859-1?Q?LQW/NKj5We7cfN6r7eEvvqqD+Y5yd5TsbmoWfaViHwdY5KWC5N0PxYyFAE?=
 =?iso-8859-1?Q?2WKPYgQDQKj53yf785wb/cvaou+Gf439TWxQBiIQsx0EMpK/QakL8dvneV?=
 =?iso-8859-1?Q?4BX/OHQTFEZT+5eq7MeYc442UDvO1VJpDHnWtPEG2mIQx2cseLLHK0GxfT?=
 =?iso-8859-1?Q?tMfRtKRyyVjsMBv0ctQ+4g1iqGfnrOdIuP6bBPDCpJPb0oBKEpNTEyFsTh?=
 =?iso-8859-1?Q?nKC8FuEWEo1VWc+B9ZUhEHLxigBsvgbYERRSnUkqwm1/j8cOEFICNITQde?=
 =?iso-8859-1?Q?CLDfA8yWdPIutClPyO9SaIRBXOBTS1BidsVmUicczG5UAGrU7gpDRFDV8n?=
 =?iso-8859-1?Q?U8o9jkUIU1Kexpxotw500Kl37nF1pV6EysXmCybbKGuFSS5BE9snydwOXP?=
 =?iso-8859-1?Q?ze9NKNz+FugM8AtaKDcUcHActvIPk37ZpivWxes/OttB60HCJ1zanRICDq?=
 =?iso-8859-1?Q?1/ScMB5tU1?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e640d3bb-50c6-4c30-2844-08d8ed6e23b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 20:07:37.2267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r280XigVAZDxPnBgFjzBy0c0+cTvNYJ8K+rfbXkwKJFVPzkk7D2HJb2W3n9Cmy7rSofCyvc3r+7CCjtAxAdT5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_200753_171211_2378EABA 
X-CRM114-Status: GOOD (  14.75  )
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

Reviewe-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>

It would be interesting to known how you managed to create such a dir entry as that is a bug too.
________________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Zhe Li <lizhe67@huawei.com>
Sent: 18 March 2021 04:06
To: richard@nod.at; dwmw2@infradead.org; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
Cc: lizhe67@huawei.com; wangfangpeng1@huawei.com; xukunkun1@huawei.com; zhongjubin@huawei.com; chenjie6@huawei.com
Subject: [PATCH] jffs2: fix kasan slab-out-of-bounds problem

From: lizhe <lizhe67@huawei.com>

KASAN report a slab-out-of-bounds problem. The logs are listed below.
It is because in function jffs2_scan_dirent_node, we alloc "checkedlen+1"
bytes for fd->name and we check crc with length rd->nsize. If checkedlen
is less than rd->nsize, it will cause the slab-out-of-bounds problem.

jffs2: Dirent at *** has zeroes in name. Truncating to %d char
==================================================================
BUG: KASAN: slab-out-of-bounds in crc32_le+0x1ce/0x260 at addr ffff8800842cf2d1
Read of size 1 by task test_JFFS2/915
=============================================================================
BUG kmalloc-64 (Tainted: G    B      O   ): kasan: bad access detected
-----------------------------------------------------------------------------
INFO: Allocated in jffs2_alloc_full_dirent+0x2a/0x40 age=0 cpu=1 pid=915
        ___slab_alloc+0x580/0x5f0
        __slab_alloc.isra.24+0x4e/0x64
        __kmalloc+0x170/0x300
        jffs2_alloc_full_dirent+0x2a/0x40
        jffs2_scan_eraseblock+0x1ca4/0x3b64
        jffs2_scan_medium+0x285/0xfe0
        jffs2_do_mount_fs+0x5fb/0x1bbc
        jffs2_do_fill_super+0x245/0x6f0
        jffs2_fill_super+0x287/0x2e0
        mount_mtd_aux.isra.0+0x9a/0x144
        mount_mtd+0x222/0x2f0
        jffs2_mount+0x41/0x60
        mount_fs+0x63/0x230
        vfs_kern_mount.part.6+0x6c/0x1f4
        do_mount+0xae8/0x1940
        SyS_mount+0x105/0x1d0
INFO: Freed in jffs2_free_full_dirent+0x22/0x40 age=27 cpu=1 pid=915
        __slab_free+0x372/0x4e4
        kfree+0x1d4/0x20c
        jffs2_free_full_dirent+0x22/0x40
        jffs2_build_remove_unlinked_inode+0x17a/0x1e4
        jffs2_do_mount_fs+0x1646/0x1bbc
        jffs2_do_fill_super+0x245/0x6f0
        jffs2_fill_super+0x287/0x2e0
        mount_mtd_aux.isra.0+0x9a/0x144
        mount_mtd+0x222/0x2f0
        jffs2_mount+0x41/0x60
        mount_fs+0x63/0x230
        vfs_kern_mount.part.6+0x6c/0x1f4
        do_mount+0xae8/0x1940
        SyS_mount+0x105/0x1d0
        entry_SYSCALL_64_fastpath+0x1e/0x97
Call Trace:
 [<ffffffff815befef>] dump_stack+0x59/0x7e
 [<ffffffff812d1d65>] print_trailer+0x125/0x1b0
 [<ffffffff812d82c8>] object_err+0x34/0x40
 [<ffffffff812dadef>] kasan_report.part.1+0x21f/0x534
 [<ffffffff81132401>] ? vprintk+0x2d/0x40
 [<ffffffff815f1ee2>] ? crc32_le+0x1ce/0x260
 [<ffffffff812db41a>] kasan_report+0x26/0x30
 [<ffffffff812d9fc1>] __asan_load1+0x3d/0x50
 [<ffffffff815f1ee2>] crc32_le+0x1ce/0x260
 [<ffffffff814764ae>] ? jffs2_alloc_full_dirent+0x2a/0x40
 [<ffffffff81485cec>] jffs2_scan_eraseblock+0x1d0c/0x3b64
 [<ffffffff81488813>] ? jffs2_scan_medium+0xccf/0xfe0
 [<ffffffff81483fe0>] ? jffs2_scan_make_ino_cache+0x14c/0x14c
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff812d5d90>] ? kmem_cache_alloc_trace+0x10c/0x2cc
 [<ffffffff818169fb>] ? mtd_point+0xf7/0x130
 [<ffffffff81487dc9>] jffs2_scan_medium+0x285/0xfe0
 [<ffffffff81487b44>] ? jffs2_scan_eraseblock+0x3b64/0x3b64
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da3e9>] ? kasan_unpoison_shadow+0x35/0x50
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff812d57df>] ? __kmalloc+0x12b/0x300
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff814a2753>] ? jffs2_sum_init+0x9f/0x240
 [<ffffffff8148b2ff>] jffs2_do_mount_fs+0x5fb/0x1bbc
 [<ffffffff8148ad04>] ? jffs2_del_noinode_dirent+0x640/0x640
 [<ffffffff812da462>] ? kasan_kmalloc+0x5e/0x70
 [<ffffffff81127c5b>] ? __init_rwsem+0x97/0xac
 [<ffffffff81492349>] jffs2_do_fill_super+0x245/0x6f0
 [<ffffffff81493c5b>] jffs2_fill_super+0x287/0x2e0
 [<ffffffff814939d4>] ? jffs2_parse_options+0x594/0x594
 [<ffffffff81819bea>] mount_mtd_aux.isra.0+0x9a/0x144
 [<ffffffff81819eb6>] mount_mtd+0x222/0x2f0
 [<ffffffff814939d4>] ? jffs2_parse_options+0x594/0x594
 [<ffffffff81819c94>] ? mount_mtd_aux.isra.0+0x144/0x144
 [<ffffffff81258757>] ? free_pages+0x13/0x1c
 [<ffffffff814fa0ac>] ? selinux_sb_copy_data+0x278/0x2e0
 [<ffffffff81492b35>] jffs2_mount+0x41/0x60
 [<ffffffff81302fb7>] mount_fs+0x63/0x230
 [<ffffffff8133755f>] ? alloc_vfsmnt+0x32f/0x3b0
 [<ffffffff81337f2c>] vfs_kern_mount.part.6+0x6c/0x1f4
 [<ffffffff8133ceec>] do_mount+0xae8/0x1940
 [<ffffffff811b94e0>] ? audit_filter_rules.constprop.6+0x1d10/0x1d10
 [<ffffffff8133c404>] ? copy_mount_string+0x40/0x40
 [<ffffffff812cbf78>] ? alloc_pages_current+0xa4/0x1bc
 [<ffffffff81253a89>] ? __get_free_pages+0x25/0x50
 [<ffffffff81338993>] ? copy_mount_options.part.17+0x183/0x264
 [<ffffffff8133e3a9>] SyS_mount+0x105/0x1d0
 [<ffffffff8133e2a4>] ? copy_mnt_ns+0x560/0x560
 [<ffffffff810e8391>] ? msa_space_switch_handler+0x13d/0x190
 [<ffffffff81be184a>] entry_SYSCALL_64_fastpath+0x1e/0x97
 [<ffffffff810e9274>] ? msa_space_switch+0xb0/0xe0
Memory state around the buggy address:
 ffff8800842cf180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8800842cf200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8800842cf280: fc fc fc fc fc fc 00 00 00 00 01 fc fc fc fc fc
                                                 ^
 ffff8800842cf300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8800842cf380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================

Reported-by: Kunkun Xu <xukunkun1@huawei.com>
Signed-off-by: lizhe <lizhe67@huawei.com>
---
 fs/jffs2/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index db72a9d..b676056 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -1079,7 +1079,7 @@ static int jffs2_scan_dirent_node(struct jffs2_sb_info *c, struct jffs2_eraseblo
        memcpy(&fd->name, rd->name, checkedlen);
        fd->name[checkedlen] = 0;

-       crc = crc32(0, fd->name, rd->nsize);
+       crc = crc32(0, fd->name, checkedlen);
        if (crc != je32_to_cpu(rd->name_crc)) {
                pr_notice("%s(): Name CRC failed on node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
                          __func__, ofs, je32_to_cpu(rd->name_crc), crc);
--
2.7.4


______________________________________________________
Linux MTD discussion mailing list
https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Flists.infradead.org%2Fmailman%2Flistinfo%2Flinux-mtd%2F&amp;data=04%7C01%7Cjoakim.tjernlund%40infinera.com%7C7ec1d950724f4995dc9c08d8e9bc0e35%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C1%7C637516341206870320%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=V0RwumJqxPlGWG6qBjSfu%2FDk5lon3vjB23S2h4w0DDg%3D&amp;reserved=0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
