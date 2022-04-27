Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D287C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znK2g3S5WperulMG6f3/Xf7kcAHycFD/UrIY3NJlgxQ=; b=Kuw3feipottzwI
	O8sTNdHLcihyCDuiGVcd9PGIJEpSsOu06TAHrf6Xklv3e+hwbiyCjU2pKgqKiM9TGWgVCDdFzfmam
	s73sq5VKVeafJJbyBT1BjGM1A2EDk9RjId95Kb1M5WpyIqv4PS7EY3NmWqYXjEQVVXp1Vmng/3DH2
	epeVIw7UeZ+5UtVx56jCMJAwvtXVnxmd/el8bQeSeVZRbCf+yDSr2FtBxgDNbq6rdgOEAUT8+Y5w/
	aX6GoPn1JkiXZ8sgCFgjG8Y1ScRuReBOaSQWNupGCGKQneFgLHnDZVkfUW6QvklHDRHJRIvw6aVc8
	S97nuqn+9peucBZBqx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcgv-000UNC-L2; Wed, 27 Apr 2022 08:06:29 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcgp-000UHB-Ov
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 08:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046783; x=1682582783;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fZ+ipoxerXZoa9BPsTMQqvTQX9OQoeRBB5SOcaFDp7E=;
 b=Wk5/AIRcsFLs+JAwgYEDXTRHD6hb65IiYXKPM/DJm3AZeuqygndAe3fB
 t1JIS6dPvDPI1KlDBxs5x4xRDLUGElL+tfvH4dj+y4LerdSefGMESkjCT
 wTLSyfxEoWJSv0znd1nUCKpleP6QWh9dsplWg7Zo9TWLkY4ZqHA8JGkG7
 sxx8VUy7JY1zwM1dyaozxGI9hq/siEc2oomkvhfZa23kqMKEwlrTKiXdL
 VFj2hk7jrn22Z1e3ds2MDhHAKXlufhoiqWjSI+FefytDP/bVGdzaPi/dr
 aJC0i7BCcfLvC9AlFMgWhGwqNtVdvgWLGP2eyalJguM6m/PrOaaEXB8yr Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263445699"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="263445699"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="580456270"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 27 Apr 2022 01:06:18 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 01:06:17 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 01:06:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 01:06:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 01:06:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUSR7yNevZE0iOHc7OD7hCjxVDcuUd8hIPHdRDqKuPR/NthBlRmednO7xLON0Ixt2iZst0YrT63BhEh9Nik2kBSVHxcAim0DnYUYsZtwEGqC4pqcs1nALGX3+9oTpyomcvI/Ukwyp+uvqjHqWTaJ+31tQEKrsbW8EROht2dn/om1boLCxo7SGN+i3t0xVWmLDfEsAEbWb8K6z3M/lOLsKRsHzM/fNGqz6fnI/SysEhmGige+/VPfmZIwEditm/DSKQAdudV8u92D+8ekPzpcX4a6v025rVFVSkm9utB5CQKSzbl8cwxYx7BWpgzXmsZbVE3Gf4XyaKTFHlZ7uGLh8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ+ipoxerXZoa9BPsTMQqvTQX9OQoeRBB5SOcaFDp7E=;
 b=UMiNaNqVVrt+YcvbcatmLZ8qr55QRG+PeZWaGTA9kWu5VWnttUTKNgO1EyXRdH25tOU32qTexHtWu9SuZxQ5K5fQlwFzGnuMKqgyZA+hBY+Hna1qwk7CwY4sdqxaazH2DWhFyLNwdN/bPvHzAtjFdWIYe5W55+qoFSObrklLjDgdEvVYzkWxUqAKs6gTnjKkUu2g00GaHmtk7QhsAoO1PnpVdU+rACXAL9hTmMAHGEZlNrjJtyA9y5c21XXg+dydTYvNARSDMl50zzRuBaopMKOLCTAi0Dn7jpqyXkUeoSo0dHrt4Jw+utmT0dbFfA/pUlTuUgSyJJ8TAsQB2ZXs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3291.namprd11.prod.outlook.com (2603:10b6:5:d::10) by
 DM6PR11MB3564.namprd11.prod.outlook.com (2603:10b6:5:137::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12; Wed, 27 Apr 2022 08:06:15 +0000
Received: from DM6PR11MB3291.namprd11.prod.outlook.com
 ([fe80::2ce8:4515:c766:8eba]) by DM6PR11MB3291.namprd11.prod.outlook.com
 ([fe80::2ce8:4515:c766:8eba%6]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 08:06:15 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: issi: Add IS25WP512 device
Thread-Topic: [PATCH] mtd: spi-nor: issi: Add IS25WP512 device
Thread-Index: AQHYT7yewQusZ8YBzEu/ekDrAsbiZKzvL+4AgAVUDICADvahMA==
Date: Wed, 27 Apr 2022 08:06:15 +0000
Message-ID: <DM6PR11MB32917CE299A5295A437DE9D5A2FA9@DM6PR11MB3291.namprd11.prod.outlook.com>
References: <20220414130004.945924-1-niravkumar.l.rabara@intel.com>
 <d805708b94dc4a00b854f3769c5013b1@walle.cc>
 <24c324e4f57c896bd289c367bdd5f9a8@walle.cc>
In-Reply-To: <24c324e4f57c896bd289c367bdd5f9a8@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc44da7a-a7e6-46bf-6176-08da2824cd89
x-ms-traffictypediagnostic: DM6PR11MB3564:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3564EF3F8BEB725119BD69CDA2FA9@DM6PR11MB3564.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uyt1odbUgXm0/kFUKl7sKdMqStEU9o1e2pCHn+/VMvU8CmgF2iop/vAP0j6yfAS84ygRJXSQMVefJ3RzxPVUs6a2g3fW8UnMQQ2jafqT4F8jkBv4KU+XtaGV74WtkzX1l/5BVV4ebaDXwxStgHy2tA4EBoASpJ8SpDVCARAzI10K2r2TG2a+tmXscX/Uu39J8/aj6rFnr0N4znlWi4zb12uhK1iGqdzbuk55bWwgvVFzrvUDNJhdWyZrn0L/IbsdQco26yvMdPGEQHblosfSxjCvdaiaDSN10xdsO3lgUBh/BCb9OD5TZ/a38+lCTrqFibbLE9xiqzJre7e1lIJ1cug0NiPIuAxQCcGHYRIVun2IaP5CGszOQRZacJuT8MKQdV/v0PWo8AhLJ56dHmgOmcdHDh2GW1O7f3wpBHfa6AtK0JxX4pFTJDKRHv6N738BISoaRHd8cVkH3CLzHQhy8nxUvUVCFi2Q3U4Fhi9h1UPwj7m/w/yKU1uX5oHJjX0uKNFlBYD9jZ5tf2tzyuVTk3AgbbKYG5pu49KBmp8oR/ApVeuHN5av4g7ydtNatg3tq6CZwKX955ld50dRY1PcXu9caybTzE2oY2bkLq8xEnMCjuIwwf3Lo44KO9Zso/UZO4cva8MwUhN1ogwittB1+2s+nqPMSU3cUtkO5tcR3uOUFAL4Z2MNRF8xiv+BQFLnOu88R4ld1asgcvxQiYkyIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3291.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4744005)(55016003)(38100700002)(38070700005)(122000001)(6916009)(316002)(54906003)(82960400001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(71200400001)(83380400001)(8676002)(2906002)(186003)(26005)(7696005)(6506007)(508600001)(8936002)(52536014)(5660300002)(33656002)(9686003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0x8B4uicqxEDxZO0RxiCFowufbAqOcF+bedMVB/XMK0YKYSlnVhr8o6NksDA?=
 =?us-ascii?Q?8ne7mBSFAmIZALHSszbOZYrDGvX4SJj7ZAvyZ+MdU83zk/k3irbmsTd5ZtN1?=
 =?us-ascii?Q?OeefjS7C/uPVDwjyQs5QXQZcMO88unwyZPL2bUV9QoF9+DXVcuckDqtwk6T6?=
 =?us-ascii?Q?f5JQ1fakWnf08AKOUCgVUegq85Az2fe0/sBj9jzv9Y402m1XtclJ2xksucG1?=
 =?us-ascii?Q?P1VbTWN27y/B4Pkn8xcMR5OAd49mliSY/EkHKCTfdGaDKuWGLQ5U7qBKMdUa?=
 =?us-ascii?Q?Jh+UJ5bDQdf5594h6BHN2lCL2ay9alrGDT7cDRGm4fqGfyAu6efBUm8WlRZb?=
 =?us-ascii?Q?uRUPxaEGpEmG+kBlE8sjvEoVh9NhvyNyAeiqKEcbNTK72HDk2oKqYkg7+Aft?=
 =?us-ascii?Q?QfYZK28nRQplDefLnNN+xUt+0YGp1qbxxg9hpIfaDqxEBC76mwFP5k8LPC5H?=
 =?us-ascii?Q?4VrlF6nQ9Bx+PZJ+KQukAsy6Nu+3jIAK+HpMiq/Wz5lJEmq6U1ne+s+7hCY2?=
 =?us-ascii?Q?nV9m3/Lt11NHsFjGCbgaPgzljfu4mTydeYqiNFVuwdhvIrZTW0oxXgTMk3Zq?=
 =?us-ascii?Q?kMHeNgRIlaEs9JEng5YJdOrJwb4nuON9UJ8w8CU85TKQsPBYKXqxTbvbL9ok?=
 =?us-ascii?Q?PHKI0v1HQZ/cx66kENrAGwL45/iFG1zfZm4N4rxTwt9yTMwjBxl2dAxrlDQW?=
 =?us-ascii?Q?Umfv42bw8F5es8aJRGeBQEGIqVo0tvUKpGUNf8XZ6aKYfS6q4dCSxV+onFhx?=
 =?us-ascii?Q?xY8HkEzx/tI6fzEXwpmoI5CzHnBoaLEzhZmlAhUHOjiL9I+YeWM9dpXV4cU7?=
 =?us-ascii?Q?V0dJgWbK1kmXqxh3hTGlw1NejucKyHXyyidROSgiBOaeEB9P9scEnk3bmnX2?=
 =?us-ascii?Q?Kz8fVbR45IZlvjQnorbaT1ixSZiVyBlTTKZgSq8RPFb/QCS8j04E6AaIwZdl?=
 =?us-ascii?Q?StmSjmbDyGKc2O4q3Ok2Zjr+oP93gVeOHqJ/gzcqLvJWgJhNIy526MZztjJ5?=
 =?us-ascii?Q?HayOKHaHiZ02hqHe253gcpHNkR/6ahQFAF02n+lfAHBtigkTtXrQBkQaStFL?=
 =?us-ascii?Q?O23YZz/PBxskfzNGSkuuGgKLl88DVF/m3iYZH6nwfaoMpp+yHktQaw1T5+S1?=
 =?us-ascii?Q?ZaqZ3wDmG3IlqYNrON/7rS4gAD7PoLYz0fd6bR7F8UIiCV+MgdGt8jL3nmwk?=
 =?us-ascii?Q?BaPhgfgrY6aOjZajEqvPWl3Yw8v80RePZCc7VEzNkALApUrZrt9CDoqSJh+v?=
 =?us-ascii?Q?18HIxB1gAD4ey6Vga7JcNhAKKM/C1CR5YP+gt0USN29Fa629h1A9VqsgF+FB?=
 =?us-ascii?Q?lY3JMnQGZY3n1FN6gLnB5okiEXBCad70zKW21Zo7Nzx6X9WlJhfdqcjDV79A?=
 =?us-ascii?Q?i8QeRukD3XV8COCv+e2/JFD2ci9rxJgch7Ixf6QPimMurmrzeLzh8z4EHYNO?=
 =?us-ascii?Q?xNBKSe0MoiOgzU8F1GJJPnQCoykovOo1Z5AGF7XJL6FS4InlBRw8+Ezd9lqx?=
 =?us-ascii?Q?QbxUOw1sBoVZHx2lVBaQn68fDBUpXNolkP500EBt7PZaBifoT5LF323CfOsa?=
 =?us-ascii?Q?L9St4qCPM21E8ZMEPqSmihfvxUMevXfABPxPmZebu1HylX1SJCLzzJmza5CU?=
 =?us-ascii?Q?IVCMm8ZAreR6Pa5ym05ooPzgu5HmxDhKDtL8P7dBYkszy20pw8rW72cZbFax?=
 =?us-ascii?Q?8Xo2a2aazit6k3QtevjaKlyHMl8jkatApTnRWYjq/+lkhBecED/Z1MVZSS9E?=
 =?us-ascii?Q?3utWm364zhkJuwg1gKx4ME1p0s1UvAc=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3291.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc44da7a-a7e6-46bf-6176-08da2824cd89
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 08:06:15.8144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaTGw75oQ3vEBLedZTJ1iLM1+DuiJbhg+Q+sVxYisfOKtHblnPUV6Cpf2QJcRw+nNY+1sq84OGp9H5T1W6d1aYxpGjukY1e0LkDzCAxkeoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3564
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_010623_898963_28A55957 
X-CRM114-Status: UNSURE (   9.46  )
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



>-----Original Message-----
>From: Michael Walle <michael@walle.cc> 
>Sent: Monday, 18 April, 2022 3:31 AM
>To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>
>Cc: Tudor Ambarus <tudor.ambarus@microchip.com>; Pratyush Yadav <p.yadav@ti.com>; Miquel Raynal <miquel.raynal@bootlin.com>; Richard >Weinberger <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
>Subject: Re: [PATCH] mtd: spi-nor: issi: Add IS25WP512 device

>Am 2022-04-14 12:09, schrieb Michael Walle:
>>> +is25xx_post_bfpt_fixups(struct spi_nor *nor,
>> 
>> Please use is25_post_bfpt_fixups.

>Sorry, this should be is25_nor_post_bfpt_fixups.

I will change the function name to is25_nor_post_bfpt_fixups in the next patch and provide the SFDP dump of flash.

Thanks,
Nirav

>-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
