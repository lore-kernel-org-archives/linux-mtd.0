Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA058C3DA5D
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 03:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qJLFRW6zY7J8B5RG4rbqA/Ma6wHQqacZpBrV6SyXAs=; b=I6aIfMzBYfk3F2
	XD7KycwdtQEuvudcLC4Y5N4JQGY4rReI8CowtTao0h9CrsVDwAwBiLbsWMlv/mx7r9AvUVEWkZsAO
	XEVriVZB7eFCYAIsaOlWCopyU33gn0ZSsFLCrBrDoZw5mIcLpGfM/shDDKLAN1eposnliqGZ+ZfxF
	D1JaonB+01uiQVhxlEwV+C31Ao8dgDnENf7Btxszz+2ddG0uBZczXG+txSNOfkh5j5HwIG3lvktOJ
	xMRWaVgklYbExsnlSgsNwv+1X3CfanRS/TtiLFa4g0T0etbspiwyINvhxIiTUjucDHpJwGHUyW+aD
	xdI+IKQMVaDzs3cC8Csw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUHSF-0000000FaaY-1aIg;
	Thu, 18 Jul 2024 03:05:15 +0000
Received: from mail-sy4aus01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2819::801] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUHSB-0000000FaYC-2W1y
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 03:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLW8oXY/Fy1JaTOyMr2bTiOYJG5zlx5kQdTEAu9jBPJjt6tPKnqz6PMDkLCy3zk2RVG3gPWc1aAH3xeZRli3JI8weyfKXEKkg/Sc9ZZYs1kIH6Hg3DZgFSLyclcvIrlXHz4QGGnusGxMj6B3j7XWeiLtpm2WT4baQnrbv9mlNiw1c2/aJlFMFnAJt2UXJVuycAWjDdtHBl8m5h4WyYJ75EAY0htbfGbfJYcXmHkGAsVRrFXnGT2wXRu8xABtDuOIvvadbt4L8q58UI9GSY/hzE84V9P9/jIIifJDmsmlNJKF/hfiLZq26SANkBVU3Cye2d92/IphxHQTUxGLxilO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLzBeUv7uEyatawNZn4TXVt661GeDzmP6Lg6H1TaZCY=;
 b=CTRjdT69OshQWI/gJScyDcdzXAxomRcTXQVHKOvz1tTfW4Kdt9gJuxh+eTRV7pithOo1MYJJEozvzF56kC7p82H9s8fmUZnjedthPWSz7VuWJ+McqWEmil8NeE//XXkNafrEFTmjxTSd34QqBkADXBt7LqiGa+JuUiPy0BHgxXcvAOthDNbf7UFL/UtyV37mv53s35bZ5b1FeJZ3MU5DelUNQq/e2jZQx0Grd+hWPpr1zIHQP56wf4PqGc0hztnIJZ/ehIecmu+Zz4f2CoszMq6QVA9lYmYzDhIkGy2PraoD/LYafbe/1D98ih1ppcodSWzi4MGJAxIPU/rQN6Ocpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLzBeUv7uEyatawNZn4TXVt661GeDzmP6Lg6H1TaZCY=;
 b=N8CX28Rd5jGYT0SF2qilAXhEtdeM5ZyYbQpX9By5d3M2U4qYx7l+5GnPGpglnHnOLBZR602YkNmGLotQ/cteRXeMw5FQqU1sUSRcDABCBF66yzR2KNf7skEtR1u3RvOxLGc3Gpa+kVn3B+DoDBTzYU6+ODEXXLvYNuaKGn34Wxr/IDzq3GRhbj8aIabkJzytJMxoGh/mJ1Al88HiRlN99dbR2l91xkgrAfL4EAwuk7mqovLpsUXp1rNxN3C7BfLEXeL4Bz1ovipnKpYd+MGQe7WderHLbE/qAAq40QxKHk64G+63E97i1g8jif9NDqRTBuQ8AkBBYpiXACfFMITNTw==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SY4P282MB3661.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 03:04:50 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 03:04:50 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: Theodore Ts'o <tytso@mit.edu>, Zhihao Cheng <chengzhihao@huaweicloud.com>
CC: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Christoph Hellwig
	<hch@infradead.org>, linux-mtd <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, "zhangyi (F)" <yi.zhang@huawei.com>, yangerkun
	<yangerkun@huawei.com>, "wangzhaolong (A)" <wangzhaolong1@huawei.com>
Subject: Re: [BUG REPORT] potential deadlock in inode evicting under the inode
 lru traversing context on ext4 and ubifs
Thread-Topic: [BUG REPORT] potential deadlock in inode evicting under the
 inode lru traversing context on ext4 and ubifs
Thread-Index: AQHa1CTInbJ5495Kk0Oyw9CF3kyldLHzKagAgAiorN0=
Date: Thu, 18 Jul 2024 03:04:50 +0000
Message-ID: <MEYP282MB3164B39D532251DC6C36B652BFAC2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
References: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
 <20240712143708.GA151742@mit.edu>
In-Reply-To: <20240712143708.GA151742@mit.edu>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [JV5QR5IXsnChSSdq0+cS3AJvHdP1OA03]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SY4P282MB3661:EE_
x-ms-office365-filtering-correlation-id: c7cfac0f-5a47-4335-7f5e-08dca6d66379
x-microsoft-antispam: BCL:0;ARA:14566002|19110799003|461199028|8060799006|3412199025|102099032|440099028;
x-microsoft-antispam-message-info: J9LaPZ5lds60YiEF5umOrG1UmOo5Imp33idt7iBE7WGnkNGBF35v9i4d0q/dbPZwctLI/9/F253gi95x8gn0w5VTnoWmQTY4IcGL4FTvYCVZ5Qbmlb1LMKogK6tG/lhcmhGtUZesS/WBYd+jy92V3LuSrmkPlrB/tso/Tj2FnDYZj/83asGgyan6n2/WfSREiM4Eur9Gb1iZ2eyn7y6jXEK4LjWdIpKZOJjU0RVwDp7rwT7ksQP9Tn2w36DZ86rEJ4KaRoSioPcTHSp5gRj6dUfQQPnYaslDS0lP9Jr2NAH0KeaUrWPIx1DyXpsZy5DyKtJUCKVWICm86tDtQlbCWLjtzGZqFjg2SQxLgTgRwpHEGtx6lVHBtEhzbbu+uKhLqxfeYfHwRtYhRvAKu2FmKrzosJkkVAEzdB7hhISQHWHp+C/UHj/dZ1MPe8TB/wn3guyeP39iG5hri+d40O0RmJ/U+a3YL8kkiFXfVfa/mRHlsLLg/wgRHEkuz6h8N+YFL/A3GEk5EweKMZNffePfk6kgOc0xgM0KDRhEn7htO7SyPqLRSbDDzuHnOTO8zDAE35jRFaIP9Gm72TVO81anE8q653AyRv8rdwVR9LICxgHiYnlGdPFW753JNzWDPg5sdMHjM7f/lxRa+o1ZTP2S+Q==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?+ailHlAzLLI3Pmbdph/b8iovr3EOB5E4cTBGw9bdxGmXocT62+p/a1z43R?=
 =?iso-8859-1?Q?w/Z8FBDXxFtXvC6I1ijw3dmeG7fSlmk77cMsDnFsFWDMeh8XLI2HgVgWkP?=
 =?iso-8859-1?Q?brDxdI2dT5VIhWukVkpL3m4kncjdL2Vqq+PkvuVQWXYtU2jPwgO1Hion40?=
 =?iso-8859-1?Q?hA5bn0kINK9YnWbLvXge4YNZV/hsc+LsTihktKCEEyUEVtBboXY/G09I9h?=
 =?iso-8859-1?Q?g2XbSY/He1GAyITuTkJgL52mmtNxgKBLqQGQ63QekwY9mNEcwY0wCaNpAK?=
 =?iso-8859-1?Q?wmTFTKM6MJPlQYrH3U4NaGO8Q1kBuwVnz6KjhV/5DRIFOCuAKQlg2bU9ol?=
 =?iso-8859-1?Q?e2lYZSAEY/AaidqKYTO3JsOvX5OGJD7ZThwPGpsPLnFnIq7X0mJl6RUX1j?=
 =?iso-8859-1?Q?kI6/Hyu5QFDAR27AG/iNvzEJXqGzT01wH6hISyxkW7RpWyTxizTFGA5++E?=
 =?iso-8859-1?Q?EeadmPGcuK4PBYFR7iU0JJANin6U4dR/vJLXYrQEgIAxBCLvACjBTVopZO?=
 =?iso-8859-1?Q?jGK4doMohNKK0Kad21Ja/+FOwTUISpRTJO7HLTM7TiJGBrCKEJXoU2aA55?=
 =?iso-8859-1?Q?oGB94yhpAZbXzjJtD5Js25Vjf2efDaRLR8imJcdJ0QcECrUT4NNhO0vEr6?=
 =?iso-8859-1?Q?E3heju6ajObz2XzQv1GN7/vovIXVpA97WwPPi/XT10DzsaWM9kD8EwVo12?=
 =?iso-8859-1?Q?KTJ/NlHsITNwq7zncpJpboCP3g+eK/dm2ALMMhgjyayDYwzeYqgJO71m84?=
 =?iso-8859-1?Q?nPL7TqjRfIKZVhv6EM5QQOrFcpLB6p0LuE/aGc/FoTrNm3o0o5+0DtzWaQ?=
 =?iso-8859-1?Q?sx7NbukCaIg5QShNefk0S64auiqzrZ2ljBHphqqkI1GjjZS/OQHvWacIjX?=
 =?iso-8859-1?Q?GLtAd+jnko6Dgz8uwYQACGLu+gBBdrprjVZnQurJOvxVwzSUVPy7SA3vvs?=
 =?iso-8859-1?Q?KacC1S42cuB/WrJ9vqoB6cfKgK3lmu89j2VQj0GMW2z6N89xTaxPNCh9a3?=
 =?iso-8859-1?Q?P46kCSjnQL/vFI5OQ5fD5o24rAibrmOohcYOb/fHDF5WjkUV/vsig9CM5N?=
 =?iso-8859-1?Q?kkBlDtgNfEJ7kMZxrOHpuU2Cm2D4Ib2fvopog71zKNcGTcxzLAwLgXcKlw?=
 =?iso-8859-1?Q?mtmQiEt9FIiDb5TdhXubipPEXIIhTCgIOHUVedSB+t4ACI4i/Lzd/n2cm1?=
 =?iso-8859-1?Q?RJrwuK3C1QzSXi/BFnMHBHBSMOw9StN6qflc0Ahxbo4OzBQFMbgFEMuiKv?=
 =?iso-8859-1?Q?Ek2K0UnlHsTubTHKB/m56mF1eIgPC6j5mGvuHb3+I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-722bc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cfac0f-5a47-4335-7f5e-08dca6d66379
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 03:04:50.1493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB3661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_200511_648406_61FE7B48 
X-CRM114-Status: UNSURE (   9.90  )
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

> Um, I don't see how this can happen.  If the ea_inode is in use,
> i_count will be greater than zero, and hence the inode will never be
> go down the rest of the path in inode_lru_inode():
> 
>         if (atomic_read(&inode->i_count) ||
>             ...) {
>                 list_lru_isolate(lru, &inode->i_lru);
>                 spin_unlock(&inode->i_lock);
>                 this_cpu_dec(nr_unused);
>                 return LRU_REMOVED;
>         }

Yes, in the function inode_lru_inode (in case of clearing cache), there has been such inode->i_state check mechanism to avoid double-removing the inode which is being removed by another process. Unluckily, no such similar inode->i_state check mechanism in the function iput_final (in case of removing file), so double-removing inode can still appear.

It looks we need to add some inode->i_state check in iput_final() , if we want to fix this race condition bug.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
