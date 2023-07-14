Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA670C001B0
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 16:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=On5SI9/BqmYPVygda8G8ZJ/MJnRdF4uE4Rp5WSRX7io=; b=H82dU6XU1sahiS
	SLlUYIDOJ6ZVxmeeelQ2QPnJgN+Iy5pZHexgkfssizcdKsvqLb4YFrffXq6jlTjYKDKwskr15rjJa
	uD2SZ95SdOH62rGOGkVptw4G7KQdxTjy/7ShYOrhEOdH3PT7SG88To1EAbrugVQPq+SIzqR7L9SjF
	sKS4A8+zn990ITd+T7l7L+H2Gze191ZkzvCkdpCbJOkiMLuaHZ42fuvyu46cFkt5Ixt5O8LX41zSB
	xnWJlraBD1iizBZmYaxSz8gfsUfMTlDB9xgUiejkB2XsNy1/S/yvU6ZCu8UQBda1W9L1t/IPWtRPo
	AUQvzCZEc2BGYBnN5d7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLNn-006c5l-2D;
	Fri, 14 Jul 2023 16:11:03 +0000
Received: from mail-os0jpn01on20715.outbound.protection.outlook.com ([2a01:111:f403:700c::715] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKLNi-006c4A-2j
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jul 2023 16:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmzqNFRXuTnYYwmC6yE9OY0W8rGqNksYgMlB1rpL95iTsB1Szipc6i3R04spZp/UFbEgYUj3rCelP7WOKbzcB/+DEniH8q2zo8xGaU4znEzq+ffxtOeqFQyb90bpGk+5yoA3tfgyID3LhfZKEkAiFcJpVpgxfFXQPBn9FE5epocMzpSifE/wsGk5b/dJiZ4CUN2vA3vbHmZZOGKh35n+1bHzzMkIM0UeqXx95Txu8BDxhCr9arpN+dQBtMmSjWPbqfhPH/HtNvGoOiXFQyxigmXuinJDZrfBzB6pdHZpOgWZjxwUlBsMfxBgOWVMjI8alAMEOvunmC8rDZ3BJIrxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UB+EbE2sTSGuDG2OXcE2SGe1/UmO5ZgDe0gvT9OxjQA=;
 b=TbnLtpmeUij2fn9hTRGzeaOAF5OcrZy4+Jeg8kbKUDN0jnm1WpTAzj1QFWHzbC+wlVTJ+yPPmPgcs276Q+Ffq+vLkJMoFTwtK2qstp/6goajXTuauDWIJjt+pKT2ZmXvfiCdR102ruBk41h3yNRqF9oa1Z4DzKjEAWXeYvcBtcYO5vuXD/CynZHS36lj0z60sRZ/59QCoC9+DF9VNFcEtNFzw/avjViAQchV8LvvJ/axZB65+2bBU7LfzZAzgBoTV/AQDGiOGL+3RpExgHmdOaEdyTwJCemLVzjVtdfjYwbkOKNsOo+EAPU13SlOqfT2Z0S8qXovLZHmkFo9TgHdpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB+EbE2sTSGuDG2OXcE2SGe1/UmO5ZgDe0gvT9OxjQA=;
 b=isAwXWZ7Tx2PFfFpVvpZxxiBlpVPuFPNe4tTAB2MMs2fW7gTfdy4qgfDNxbao7bCU0kAjJKFxu7Jnpdqhfwadc5+jM2/9JvXbsMHU8cjFnDL/23aYablNBers2M9X3Sjw42arr/gHtwH2EkYkzdHps+d642Yw2EB+2jO2/J2qxs=
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11)
 by OS0PR01MB5361.jpnprd01.prod.outlook.com (2603:1096:604:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Fri, 14 Jul
 2023 16:10:45 +0000
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::97db:c5f3:bb48:c03b]) by TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::97db:c5f3:bb48:c03b%2]) with mapi id 15.20.6588.028; Fri, 14 Jul 2023
 16:10:45 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Tomas Winkler <tomas.winkler@intel.com>, Vitaly Lubart
	<vitaly.lubart@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 1/2] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH 1/2] mtd: use refcount to prevent corruption
Thread-Index: AQHZo3pflC/eHH4JUkWIk6RRgCUn+q+5ioTQ
Date: Fri, 14 Jul 2023 16:10:45 +0000
Message-ID: <TYWPR01MB87756794A30EB389AB017EB1C234A@TYWPR01MB8775.jpnprd01.prod.outlook.com>
References: <20230620131905.648089-1-alexander.usyskin@intel.com>
 <20230620131905.648089-2-alexander.usyskin@intel.com>
In-Reply-To: <20230620131905.648089-2-alexander.usyskin@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB8775:EE_|OS0PR01MB5361:EE_
x-ms-office365-filtering-correlation-id: d5aafc7b-3b6b-46ac-a55a-08db8484e135
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /3rvGtsqUU7U+ixZQVu/zGJGgSaJQb+iwvvzAaZ66Hv9xAzLTC97auo1ywCrXR/FvgwFXyv61Cv9G36mMZ1PY5uuPTEy3pNX2FA2kuUJHakRjtRp7F/S3XVduZIFSQdVBPY5dhPQh6FcJIMZ6FkIlrZ9KaF5ZzG2HlJDA42GD27QVHjN+Qo3tVeVpF690yjU+lD0wAVFahAgUX/En1T1JiKDwPoWD1gvSzN6dht73+rTFt4MTt0qK1q/RbSI0ln2EPGerTmU+4aoDWVyTkip6PTKToYVU5KGDTX9J8n4lrhuXqJPepb4k/Hv2Y+DFhB9wViHX2WwOnbcDqA0ISn2lTWqL1E42XvBrIDZT7ZLnYVNi6RlWrJ0GNNqmOliqPkXlwsNb08qUsVSLDKUSYTMlBvqa72E2Xx8fjTAE16GS7oMTuEhkwY4D/oKCC3RGKkvefx4lfBzavTZj14KTVI+LbXwkBUL4v+tcilsLucbKTPh9QZrt3KfJQah8y3R58a37yAW3LCKl5l1I+jVVYtKOZnxLlpyFUYTN6tUSVxhGNGmoiWMYcGPAz/FkpnZ9YXVpjUwSttumXseqBrEnE5KImMq8GH0JaaIzsY8JD29HBbDO8r0lYGvKPQa9JsJj/Xs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB8775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(8676002)(8936002)(122000001)(7416002)(52536014)(38100700002)(478600001)(5660300002)(41300700001)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(316002)(4326008)(55016003)(54906003)(110136005)(107886003)(38070700005)(86362001)(2906002)(33656002)(186003)(9686003)(6506007)(26005)(71200400001)(7696005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k4rnnL5PpyHsGavSwyDcLU6pc25wzE0sBTRIbIV5tzvxHvFMYc/2+PtYluyj?=
 =?us-ascii?Q?gKp1R6zIiMgc7j1G1dQV/f58h9XWVLlTn9j9WrHnLdsVf52FSvH5Gmm8tLqe?=
 =?us-ascii?Q?5AoFkfLK7Ks741Byc6hLy1dc49om82BEH0vSaLdhcLO8sU5DghCcNQ7HA4b0?=
 =?us-ascii?Q?VRDYTbhBKt+H700oFonIDahYFA+7jYB2sYW2D49fLkPtreedNlsvMunb//d5?=
 =?us-ascii?Q?ef2LBK6BGJ8YuutOQkBItbNpPVESSFa0/FCMVORNIRnKlkPOQtVjQQCM5FI1?=
 =?us-ascii?Q?yiguWT3IR8mqrNBq9BFVJYktQVJREsMFKCHy2KpTXyeT5Y4PPmZWiTDveKnZ?=
 =?us-ascii?Q?a+tDuqDQG769kRFJEWWNTZngs+4JOykUod4f4YU7Ky0bR80zmDfK78skqbST?=
 =?us-ascii?Q?T0NJoJXvYd37vdlZ6nfGD7+siMoDyE5vh7tj61pUWB9zt+Ihz8Kz/0pHPEgq?=
 =?us-ascii?Q?Pg+zKlvKQ1kAsvnm17uCY142G3YMa+CdocpghypLFhdl/O5F1vXTV80TM19M?=
 =?us-ascii?Q?qwdhke5djrr/7Csx/gIkrrWG9IDY6RjeOzw8kcp1Lj08nr3gtsbUKHHdewjl?=
 =?us-ascii?Q?ZA/nJXr9Hpfu6mQWZsCvLC1g5kErzRJInqV9WCOBI3Z14OWq3emMtaV559Df?=
 =?us-ascii?Q?/MraL68ZDgBck+E0eZ2HUAsrrF91TeSo+9qEfa62ZFewl4t2hFfO2a8BP5fh?=
 =?us-ascii?Q?8JrGZfNA36MjE2eZJFuqpWSWZkA/Jb4CzlgXLSYjRqN7WjK2iXiDTpQYdFGi?=
 =?us-ascii?Q?KMPlZFFzJBCxzzZDss+SvrxqZfN5niCmU+TXahv6GMIYBvyT9uW5/fCsmtd9?=
 =?us-ascii?Q?s9uDxEYCZG6QCNDF43V1VpEf5+Oq0gFPiP+L+ph0PkG90GUH66SqCTnzO92P?=
 =?us-ascii?Q?odXRpYhKVTPTaYKw/BX92hvZvksxtC+aPfFcbgChvSdVRJ8x7U240wQMfiw3?=
 =?us-ascii?Q?wmU9xd0DgD6bGvokGW94Zp6qsROPpVDBTx6s7Y00pcld0wDRUxHkwHzk5MyW?=
 =?us-ascii?Q?gZ84katd5qTXBkpvRoqWiOcNTtnnwVrLGXpqNqn7Jfl/TmoChZLIMz67Oo4o?=
 =?us-ascii?Q?7/yEoZor+j9H66vPlR2vKCT+qsogrcgpMRcBgWDt0yncbK8evJrim4ItDRAF?=
 =?us-ascii?Q?4IwdFKixmXcUpupPQh+iASfz0eDcBqDpjF3d2/0I9z6pbnEu4+y6VWO+01Ym?=
 =?us-ascii?Q?V3c/WNzei5Fj/+E652M0nl+ei9jG2WlzsbwuayxlmudzYl/h2LbLBe4B9sTW?=
 =?us-ascii?Q?TuY2TkpZ9Uh6A1FjItwVK4wA+U0Hd+8BGfZTugjxPVdkkCzKNZPR8Lj2R1z0?=
 =?us-ascii?Q?UJghU+BPAkx8HfEcEkifllq9gHQZdmJEqcsNzWmavQBPlQzcYx6Hthc2aens?=
 =?us-ascii?Q?6/9SD2hhxyDvyTHbYuhmIsjkI6q8nOKT1SU9DlIgZ0AcveTgq9iWWC89/8zq?=
 =?us-ascii?Q?yFp2bO3kbi03Lvne7ecv2ek/lVW2JNbWcfhCiyvpkQ9htX1KFbAlFlZ2TR0J?=
 =?us-ascii?Q?awsBlqWmbk35K7IVULzMEju3v8fuAuRLzfkIa6mSc0+m//unLUp7uBWPISQw?=
 =?us-ascii?Q?z/Pvm5MSIQejjRrwoIMTeOsDNGgXlIGclhhDBaFauoWqkA+l3rU9O0r9Ad7j?=
 =?us-ascii?Q?kQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5aafc7b-3b6b-46ac-a55a-08db8484e135
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 16:10:45.1742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W4ZW4x8zhAGdY757jFIBLscHZ4m/wbPFHT8EogvO9M+dwbx9GpbEMSnRnDSBdKSMaMxCdHdRqvLtCChCL5NGu+6bsrh6CsmWpZul0Y0N+Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_091059_028999_FF8DA562 
X-CRM114-Status: GOOD (  32.84  )
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

Dear All,

I am sorry for reopening this topic, but as it turns out (after bisecting
linux-next/master) this patch is interfering with a use case I am working
on.

I am using a Renesas RZ/V2M EVK v2.0 platform, I have an SPI NOR memory
("micron,mt25ql256a") wired up to a connector on the platform, the SPI
master is using driver (built as module):
drivers/spi/spi-rzv2m-csi.c

Although the board device tree in mainline does not reflect the connection
of CSI4 (which is the SPI master) from the SoC to the "micron,mt25ql256a"
(SPI slave device), my local device tree comes with the necessary definitions.

Without this patch, when I load up the module, I get the below 3 devices:
/dev/mtd0
/dev/mtd0ro
/dev/mtdblock0

They get cleaned up correctly upon module removal.
I can reload the same module, and everything works just fine.

With this patch applied, when I load up the module, I get the same 3
devices:
/dev/mtd0
/dev/mtd0ro
/dev/mtdblock0

Upon removal, the below 2 devices still hang around:
/dev/mtd0
/dev/mtd0ro

Preventing the module from being (re)loaded correctly:
rzv2m_csi a4020200.spi: error -EBUSY: register controller failed
rzv2m_csi: probe of a4020200.spi failed with error -16

Are you guys aware of this sort of side effect?

Thanks,
Fab

> From: Alexander Usyskin <alexander.usyskin@intel.com>
> Subject: [PATCH 1/2] mtd: use refcount to prevent corruption
> 
> From: Tomas Winkler <tomas.winkler@intel.com>
> 
> When underlying device is removed mtd core will crash
> in case user space is holding open handle.
> Need to use proper refcounting so device is release
> only when has no users.
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/mtdcore.c   | 72 ++++++++++++++++++++++------------------
> -
>  drivers/mtd/mtdcore.h   |  1 +
>  drivers/mtd/mtdpart.c   | 14 ++++----
>  include/linux/mtd/mtd.h |  2 +-
>  4 files changed, 49 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index abf4cb58a8ab..84bd1878367d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -93,10 +93,33 @@ static void mtd_release(struct device *dev)
>  	struct mtd_info *mtd = dev_get_drvdata(dev);
>  	dev_t index = MTD_DEVT(mtd->index);
> 
> +	if (mtd_is_partition(mtd))
> +		release_mtd_partition(mtd);
> +
>  	/* remove /dev/mtdXro node */
>  	device_destroy(&mtd_class, index + 1);
>  }
> 
> +static void mtd_device_release(struct kref *kref)
> +{
> +	struct mtd_info *mtd = container_of(kref, struct mtd_info,
> refcnt);
> +
> +	debugfs_remove_recursive(mtd->dbg.dfs_dir);
> +
> +	/* Try to remove the NVMEM provider */
> +	nvmem_unregister(mtd->nvmem);
> +
> +	device_unregister(&mtd->dev);
> +
> +	/* Clear dev so mtd can be safely re-registered later if desired
> */
> +	memset(&mtd->dev, 0, sizeof(mtd->dev));
> +
> +	idr_remove(&mtd_idr, mtd->index);
> +	of_node_put(mtd_get_of_node(mtd));
> +
> +	module_put(THIS_MODULE);
> +}
> +
>  #define MTD_DEVICE_ATTR_RO(name) \
>  static DEVICE_ATTR(name, 0444, mtd_##name##_show, NULL)
> 
> @@ -666,7 +689,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	}
> 
>  	mtd->index = i;
> -	mtd->usecount = 0;
> +	kref_init(&mtd->refcnt);
> 
>  	/* default value if not set by driver */
>  	if (mtd->bitflip_threshold == 0)
> @@ -779,7 +802,6 @@ int del_mtd_device(struct mtd_info *mtd)
>  {
>  	int ret;
>  	struct mtd_notifier *not;
> -	struct device_node *mtd_of_node;
> 
>  	mutex_lock(&mtd_table_mutex);
> 
> @@ -793,28 +815,8 @@ int del_mtd_device(struct mtd_info *mtd)
>  	list_for_each_entry(not, &mtd_notifiers, list)
>  		not->remove(mtd);
> 
> -	if (mtd->usecount) {
> -		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use
> count %d\n",
> -		       mtd->index, mtd->name, mtd->usecount);
> -		ret = -EBUSY;
> -	} else {
> -		mtd_of_node = mtd_get_of_node(mtd);
> -		debugfs_remove_recursive(mtd->dbg.dfs_dir);
> -
> -		/* Try to remove the NVMEM provider */
> -		nvmem_unregister(mtd->nvmem);
> -
> -		device_unregister(&mtd->dev);
> -
> -		/* Clear dev so mtd can be safely re-registered later if
> desired */
> -		memset(&mtd->dev, 0, sizeof(mtd->dev));
> -
> -		idr_remove(&mtd_idr, mtd->index);
> -		of_node_put(mtd_of_node);
> -
> -		module_put(THIS_MODULE);
> -		ret = 0;
> -	}
> +	kref_put(&mtd->refcnt, mtd_device_release);
> +	ret = 0;
> 
>  out_error:
>  	mutex_unlock(&mtd_table_mutex);
> @@ -1228,19 +1230,21 @@ int __get_mtd_device(struct mtd_info *mtd)
>  	if (!try_module_get(master->owner))
>  		return -ENODEV;
> 
> +	kref_get(&mtd->refcnt);
> +
>  	if (master->_get_device) {
>  		err = master->_get_device(mtd);
> 
>  		if (err) {
> +			kref_put(&mtd->refcnt, mtd_device_release);
>  			module_put(master->owner);
>  			return err;
>  		}
>  	}
> 
> -	master->usecount++;
> -
>  	while (mtd->parent) {
> -		mtd->usecount++;
> +		if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd-
> >parent != master)
> +			kref_get(&mtd->parent->refcnt);
>  		mtd = mtd->parent;
>  	}
> 
> @@ -1327,18 +1331,20 @@ void __put_mtd_device(struct mtd_info *mtd)
>  {
>  	struct mtd_info *master = mtd_get_master(mtd);
> 
> -	while (mtd->parent) {
> -		--mtd->usecount;
> -		BUG_ON(mtd->usecount < 0);
> -		mtd = mtd->parent;
> -	}
> +	while (mtd != master) {
> +		struct mtd_info *parent = mtd->parent;
> 
> -	master->usecount--;
> +		kref_put(&mtd->refcnt, mtd_device_release);
> +		mtd = parent;
> +	}
> 
>  	if (master->_put_device)
>  		master->_put_device(master);
> 
>  	module_put(master->owner);
> +
> +	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +		kref_put(&master->refcnt, mtd_device_release);
>  }
>  EXPORT_SYMBOL_GPL(__put_mtd_device);
> 
> diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
> index b5eefeabf310..b014861a06a6 100644
> --- a/drivers/mtd/mtdcore.h
> +++ b/drivers/mtd/mtdcore.h
> @@ -12,6 +12,7 @@ int __must_check add_mtd_device(struct mtd_info
> *mtd);
>  int del_mtd_device(struct mtd_info *mtd);
>  int add_mtd_partitions(struct mtd_info *, const struct mtd_partition
> *, int);
>  int del_mtd_partitions(struct mtd_info *);
> +void release_mtd_partition(struct mtd_info *mtd);
> 
>  struct mtd_partitions;
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index a46affbb037d..23483db8f30c 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -32,6 +32,12 @@ static inline void free_partition(struct mtd_info
> *mtd)
>  	kfree(mtd);
>  }
> 
> +void release_mtd_partition(struct mtd_info *mtd)
> +{
> +	WARN_ON(!list_empty(&mtd->part.node));
> +	free_partition(mtd);
> +}
> +
>  static struct mtd_info *allocate_partition(struct mtd_info *parent,
>  					   const struct mtd_partition *part,
>  					   int partno, uint64_t cur_offset)
> @@ -309,13 +315,11 @@ static int __mtd_del_partition(struct mtd_info
> *mtd)
> 
>  	sysfs_remove_files(&mtd->dev.kobj, mtd_partition_attrs);
> 
> +	list_del_init(&mtd->part.node);
>  	err = del_mtd_device(mtd);
>  	if (err)
>  		return err;
> 
> -	list_del(&mtd->part.node);
> -	free_partition(mtd);
> -
>  	return 0;
>  }
> 
> @@ -333,6 +337,7 @@ static int __del_mtd_partitions(struct mtd_info
> *mtd)
>  			__del_mtd_partitions(child);
> 
>  		pr_info("Deleting %s MTD partition\n", child->name);
> +		list_del_init(&child->part.node);
>  		ret = del_mtd_device(child);
>  		if (ret < 0) {
>  			pr_err("Error when deleting partition \"%s\" (%d)\n",
> @@ -340,9 +345,6 @@ static int __del_mtd_partitions(struct mtd_info
> *mtd)
>  			err = ret;
>  			continue;
>  		}
> -
> -		list_del(&child->part.node);
> -		free_partition(child);
>  	}
> 
>  	return err;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 7c58c44662b8..914a9f974baa 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -379,7 +379,7 @@ struct mtd_info {
> 
>  	struct module *owner;
>  	struct device dev;
> -	int usecount;
> +	struct kref refcnt;
>  	struct mtd_debug_info dbg;
>  	struct nvmem_device *nvmem;
>  	struct nvmem_device *otp_user_nvmem;
> --
> 2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
