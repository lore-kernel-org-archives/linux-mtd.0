Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1990AC47247
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 07:19:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE53D206B8
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 07:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SsYyR1Pv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="SYT1PFtf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE53D206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jF/gw/cA6YZ0eaqLQstczsXViDoslSic9UMaCrbABXk=; b=SsYyR1Pv7E4zOU
	B6zXLgAKXGJlalAn255lezkuaaSE8LaMAYqSePnzB4hGvZ4hs/D1BG5jBPeAiUOhm/Z8Jiwf15V0r
	rG9V8ehCecYXEJk0MoYsVCzh4kigRQRl4ZC6kmJD218I3gU1MJqLaLCFpUezZy3IPxG2We1TS0GYV
	hqjRaQu3pjpDZgcrVW5BlztNkaSJEKht4h+xOVN+fiuvl3OxPdBjsCIEEl3U/sGWENxbKaB2OIx9q
	OpEgPuqJ+CMZJMnmbhjNYH+gdvWhrw/dGvihI1HmJedagArjZlp9bPs+4477pdyi99ReYcbOS1DNT
	oNSlOk35phCEVQbalhWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVrqx-0001A3-Qt; Tue, 05 May 2020 07:18:55 +0000
Received: from mail-mw2nam12on2085.outbound.protection.outlook.com
 ([40.107.244.85] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVrqt-00017j-03; Tue, 05 May 2020 07:18:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnpaoj0d7n3TE/REzU5qqxiG3D+v/ryzcRqZs7dXBF6ad7Vb3kWhE/fXc6GmlenQVe4vdvvWkUGQFaewfZQOPMfYCgODYOAf+HBC/fJOY85wTbLK6zY9bBvUObKyg3ImB8h2dJ0H5voZxHxoaLu8QtOMK0KxmkQPwANXCXzSXXLyRFwmeb1ZrzJ0yPm+UKoAgDTEP96g0W2MvMaSRrlPAeVFsT8tCpUVcSBfS6XMDfoguLnrv27lgjcLzP1EZjm6DlnmsOcvYZRFakto9h1DPYOJQp3131mmlUwv+sttZLLxnYGjYjTbxrkgCH3r8Cld164YoVyKP8Agj9o4aSQFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/QFNF3T5wQNGasslckKe/KavHRLP8gOWWei1IDodUY=;
 b=eKpKyUep86a6SK6kGmJVB/oU2wsGjMteLNY93NQgM3rxg8YjQYMGD4tcRY5KETuk1yqDk/tkwQGV8C1kr7PRiGbn6YFKNu++FkH0wgEsVPOzPLPriMbScpGQQdHcChYPjNzHb6TnKGeE1pQBVxvtAG6pgFfywHmujPY9qjlu7V4v25sAsZl0+vzDTadNsengE5cDdPj6VL4dkRIIyPteWWuviQNr5u1h1pNFybE7Wa6b+ddf1+xrAJoLHUWeBrNIo7nuN07LIO63TxuV+15zsmIJDtK5kDcAHDLsYKCs1/KwHQrYSizLzuEsqZ1kHR/HHOEdNqxlKPx/rXvezCI8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/QFNF3T5wQNGasslckKe/KavHRLP8gOWWei1IDodUY=;
 b=SYT1PFtf+IfV4MUjnRObBRgKJnWckOSTjSal6KIaZJ0XPrbsoFsUNbeW+vF5x76q2vGn9ws9WTpvBNuw1geBevd9ohCaX2xQd2TVfySXvDJ0jf9ewGIryOfEzQlm/Wx5V12KmmGXWxr9BLkTZOlh4LXdkZbCpAswZ1SRk+Z9Ri8=
Received: from BN8PR13MB2611.namprd13.prod.outlook.com (2603:10b6:408:81::17)
 by BN8PR13MB2900.namprd13.prod.outlook.com (2603:10b6:408:91::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.18; Tue, 5 May
 2020 07:18:46 +0000
Received: from BN8PR13MB2611.namprd13.prod.outlook.com
 ([fe80::c129:8fca:5ed:8929]) by BN8PR13MB2611.namprd13.prod.outlook.com
 ([fe80::c129:8fca:5ed:8929%6]) with mapi id 15.20.2979.024; Tue, 5 May 2020
 07:18:46 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: RE: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
 A00 board.
Thread-Topic: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
 A00 board.
Thread-Index: AQHWHtYDB/cpTmsjKkuAl+bHjseykqiYg+KAgABe/XA=
Date: Tue, 5 May 2020 07:18:45 +0000
Message-ID: <BN8PR13MB2611968A7252308925FF18B399A70@BN8PR13MB2611.namprd13.prod.outlook.com>
References: <1588240732-13905-2-git-send-email-sagar.kadam@sifive.com>
 <mhng-ccfe9c83-41d6-47a0-b7bc-347573973fec@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-ccfe9c83-41d6-47a0-b7bc-347573973fec@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=sifive.com;
x-originating-ip: [116.74.144.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e97f01f1-c2e9-462b-5d2a-08d7f0c48cc9
x-ms-traffictypediagnostic: BN8PR13MB2900:
x-ld-processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR13MB2900900A939FFA2A3409DB2A99A70@BN8PR13MB2900.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0394259C80
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RZEd6Mw1zvJA9Fo24kkBXoN1TMQlGyhcOZ41lfSAizcLfCFDdYtZTKEfkLPZo3UlN2p3xgeDCl87R6IMgWMFAtUh9vlJIPR7uivr2SVMRjfAWm8jTU2AL43mhuwG4vjaGefhfrV1wcKrumOoEsPHDnzOVRJAVwhbrEna5ppf77SiXSRZg2Z9a/NeKKBvdYKV8hipX0XmVg4FylgElW/xIE0ggL6u0V7L2XnRJMpF1yHb1BH4EsqO/BMPuLSKN3DcipNYw597XVm9oQ/WMHAmAAg1Yy/KqAPbDCMNIE9GOFQs/d9gBpLWpjS2LO3vOLzMmC2bMpkv3+dSam6DYWwdActO5X2HvKX26TrH1xyL3ZT9f1p+eHofll5qUpOKo+SMdaIpnt0BmYDCSanHZCuv3N9iKUwNBzGFJZ9TkaF96e2UJK50KKN1Q48TyExVuMLgRL2+T5loen/44fLLoKbsuwkA3GmsP0dco9XYnfmqEEoYCaRqxqKAS5tr3kA4TJHlhSPWWX2DZagBEJc4QjEvIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR13MB2611.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(39850400004)(366004)(396003)(346002)(33430700001)(26005)(8676002)(66946007)(9686003)(76116006)(33656002)(6506007)(55236004)(55016002)(316002)(7696005)(53546011)(33440700001)(66476007)(66556008)(66446008)(186003)(64756008)(5660300002)(8936002)(52536014)(478600001)(4326008)(6916009)(71200400001)(54906003)(2906002)(44832011)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: PVZ89RCxLDNc26znQyR49wBjqHomIWlZTJ1qthsEmVPPW2t8yzB6yHthPK3z9ERV282wExFE0tPBrbXuyxJLmyE0mdadcNk4TBHSF+DucdoS6nph7PgSfNzhpXHCeWZyr2OGbTcdIHxxXYBu1zQSXxQlc8ZPqnlJTrnMFDNN+m6jUpcqCGskaKRydJ21NBBoMAjeGinSvXqLl7aVzRulnLRQxACemUwLT8zKFprPwLVFPs1sRArRLiimjVAYBxpXDSN45FNz1Db5Np7QsLjkZTSyRd8y+28T2POIsiW6RSBiDGsVuNeoAGiPjpfBYauT+A4J1RXC0Ru0G1lGCSFgthZNpi6MvQbFCblYGb8oNnWqemHCxQH/M/kKQ1Eeyq8O/+uWhR/7c7+vf3IJGWa3BGoxpWPqQ3NP14eBBXpyld4ePxrjlOoPQ4tpT568FpHUfw494cZd+2k0PqANllmG+hkQncooIMqLQbmiKs+mRjz4oJ52Tk6hKZWaHQ72CE7oZY3cRRYp/lKylWtfydl3s9y+nafj9T/f6VGTIzlxfKbkKIOuqygaC0LSy0ExCqufbMJioewPJkDMADhLsLmbvKJ/OgAwjClDjkqHLXaPljMzAn9R94wbmXqeIOj1T17Hss/YnyGHiKbvGh3GRVUC8dJWaIY2Ekr1+XJuj2e+lGGW1LgM5FEPADYacln92JkrRhMUvslHQa3a+9o7IRpQFtxKDq5uDTol9I/KWK1qnSixP+My/Lnqh/q2bmk98LsKDnaQX8kEr+Uyj1wm0REOCUNy7K1cVewLGKqJ9WM5cqo=
MIME-Version: 1.0
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97f01f1-c2e9-462b-5d2a-08d7f0c48cc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2020 07:18:46.1268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGFmdleT8bebgLO90su8Y+EsPPc0P3Z3XpnWCQcPhLgOrhqjs0cdCPrVJ8ac1lmuYKAMxXP5w9fxgvtU5OXt6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR13MB2900
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_001851_103650_6876AB67 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Palmer,

> -----Original Message-----
> From: Palmer Dabbelt <palmer@dabbelt.com>
> Sent: Tuesday, May 5, 2020 3:40 AM
> To: Sagar Kadam <sagar.kadam@sifive.com>
> Cc: tudor.ambarus@microchip.com; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; Paul Walmsley
> <paul.walmsley@sifive.com>; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org; Sagar Kadam
> <sagar.kadam@sifive.com>
> Subject: Re: [PATCH 1/2] riscv: defconfig: enable spi nor on Hifive Unleashed
> A00 board.
> 
> [External Email] Do not click links or attachments unless you recognize the
> sender and know the content is safe
> 
> On Thu, 30 Apr 2020 02:58:51 PDT (-0700), sagar.kadam@sifive.com wrote:
> > Enable MTD based SPI-NOR framework in order to use spi flash available
> > on HiFive Unleashed A00 board.
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig
> > b/arch/riscv/configs/defconfig index 4da4886..970580b 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -80,6 +80,8 @@ CONFIG_USB_STORAGE=y  CONFIG_USB_UAS=y
> CONFIG_MMC=y
> > CONFIG_MMC_SPI=y
> > +CONFIG_MTD=y
> > +CONFIG_MTD_SPI_NOR=y
> >  CONFIG_RTC_CLASS=y
> >  CONFIG_VIRTIO_PCI=y
> >  CONFIG_VIRTIO_BALLOON=y
> 
> From the second patch's description I'm assuming that MTD still functions
> correctly without that change?

Yes Palmer, the second patch is to enable QUAD write to nor flash..
MTD  function's correctly without second patch.

Using the character interface (/dev/mtd0) mtd_utils (mtd_debug : erase/read/write) work fine.
We might require CONFIG_MTD_BLOCK, CONFIG_MTD_CMDLINE_PARTS  in order to use MTD partitioning.
IMHO it can be at user's choice weather to use flash partitions or not, so I have not enabled. Please let me 
know if I should enable these features as well.

To demonstrate a bit more with linux 5.7-rc3 

Specify on U-boot prompt:
# setenv bootargs "root=/dev/ram rw console=ttySIF0 mtdparts=spi0.0:1024k(loader1),4096K(loader2),26M(rootfs)"

After booting linux will enumerate mtd partitions:
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00100000 00001000 "loader1"
mtd1: 00400000 00001000 "loader2"
mtd2: 01a00000 00001000 "rootfs"

# cat /proc/partitions
major minor  #blocks  name
  31        0       1024 mtdblock0
  31        1       4096 mtdblock1
  31        2      26624 mtdblock2

#Format mtdblock2 with mkfs.ext3/4 and mount results in
# mkfs.ext3 /dev/mtdblock2
mke2fs 1.44.5 (15-Dec-2018)
/dev/mtdblock2 contains a ext3 file system
        last mounted on /mnt on Thu Jan  1 00:00:14 1970
Proceed anyway? (y,N) y
Creating filesystem with 26624 1k blocks and 6656 inodes
Filesystem UUID: 1b09252d-e313-430c-9ecb-79b0cef003ca
Superblock backups stored on blocks:
        8193, 24577

Allocating group tables: done
Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done

# mount
none on / type rootfs (rw)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=666)
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
tmpfs on /tmp type tmpfs (rw,relatime)
tmpfs on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)
sysfs on /sys type sysfs (rw,relatime)
/dev/mtdblock2 on /mnt type ext3 (rw,relatime)

Thanks & BR,
Sagar Kadam
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
