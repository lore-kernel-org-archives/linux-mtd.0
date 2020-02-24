Return-Path: <SRS0=aChT=4M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD72C35679
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 09:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F62A20838
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 09:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bd48rm4g";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=silabs.onmicrosoft.com header.i=@silabs.onmicrosoft.com header.b="fdqd95SO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F62A20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=silabs.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kN4WHqyYtoqEpVIapC1oB6EAVIvlaKnIy2emy09WLM=; b=Bd48rm4gsSZIOn
	OnFTsoEgW2vOYH/+GiGvr2J5K8E9efbwPg5/5Y6pOAzPPzy92tr75+sVjqlRhoFVnspXxa08+tJ4R
	ZM9uwKWmujmFS7Lq80fL6GTe+L4R0OmCg+91Tt9YylsIM5Y8ZIo0oPm8fgi5egyRXprdMDL+7pldS
	wk4fH49xfZL+aeI4Zh8/4mUcezYwWxoLidnGRtKP1kkfDaHX5AOxxPIlZAmsXCK636sP8d+J3wboz
	VKg2/TIYBMTOdLb7Blo+YlMaJshywJcDKcWMVCiKAjJWIFiIYcrSUt7pAatWWG1YiG4AqznFC0ZPo
	9yWTUsmdzlG5vqYzPrzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6ANP-0004u6-0c; Mon, 24 Feb 2020 09:50:11 +0000
Received: from mail-bn8nam12on2075.outbound.protection.outlook.com
 ([40.107.237.75] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j69s8-000123-EI; Mon, 24 Feb 2020 09:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npZnFCs63m88AEhgyI4D0uZUymm84RbhJSG26A9Rrdugag/CCd0gbBDKKQfqvn1XgtkzMLPthmFuUYUQ07SMLu/QnerS6TDW8KPdy49dS7USDf9Ldw5EhVLAfIto3EnBHefe2yWF9B0pBHHfE0/zA4zSPPH3Smqj5r8fr6gOl+uoS2rWsjHDVSBPO7Ms9flWiqVA0lHYADBOEOS9Fr0pnzecQ0kwFkQpYKFXLSxc4/A4ZPmeVa2bMgfDeuQRBQx5+7rCrr0o1goU/m229UJj3ypQC3lACtFC1yqYD8Qt+YPmNZWzP+QcXSwU731T2SXjvFDX3lvobKpL7zBVTLI++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk2iaH+Vpc6pWopY2Wx/vFvzXcFnBYjy5WSegRObBkU=;
 b=GqoKf9d+odX2t7pz2VnTA8EJpKOeYg1MBAT20f+W4J97LQJRzrHbYVGHu5GKSHr7z9Q+k0PzeqGKSqRyOp8h6gbeSrITWSrfxwb/DDWcCDlFvJWvVrmbdSzYnhUr7meJCQJ1EQxQhF6Uuh07zb1iJkCYBtqSxCUeQ+zDF435qF6v3hfkXTXwR/87SY6AhmMTxbqxw0rRvQl46w9xmw6auqHUfBF91xq/U1C0BfmOQlSi17Ud/27IOBHzU/+fvwxyN+MIAaG2ws/oKbNJVT2pQiXoHTaofBZE3KSBcZYsYaLsaxhWPA7n8lyYB6jAdWl3NvnlWuXOhurrg01QiqJDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk2iaH+Vpc6pWopY2Wx/vFvzXcFnBYjy5WSegRObBkU=;
 b=fdqd95SO+jo2qFcQ06aTjhczLTyUVwxYrkgNGWWcjTI966zMWvUvhqjZU4g1oVEVCXAc9t4pYQJ61/Npfmafgnwl32NTfXQ5T9mCP8rsg4D0+QYRsbzN+1A0H/ytoHtXct7bq5uQKo6Yb08dN6QShcM/7RW9b1eZ63Iu181nLvY=
Received: from MN2PR11MB4063.namprd11.prod.outlook.com (2603:10b6:208:13f::22)
 by MN2PR11MB3726.namprd11.prod.outlook.com (2603:10b6:208:ef::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Mon, 24 Feb
 2020 09:17:48 +0000
Received: from MN2PR11MB4063.namprd11.prod.outlook.com
 ([fe80::ade4:5702:1c8b:a2b3]) by MN2PR11MB4063.namprd11.prod.outlook.com
 ([fe80::ade4:5702:1c8b:a2b3%7]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 09:17:48 +0000
From: =?iso-8859-1?Q?J=E9r=F4me_Pouiller?= <Jerome.Pouiller@silabs.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] docs: dt: fix several broken doc references
Thread-Topic: [PATCH] docs: dt: fix several broken doc references
Thread-Index: AQHV6ietodQMow/ON0qYMI30cMvXMagqEj+A
Date: Mon, 24 Feb 2020 09:17:48 +0000
Message-ID: <2091904.E9UJrs0rOF@pc-42>
References: <0e530494349b37eb2eab4a8eccf56626e0b18e6d.1582448388.git.mchehab+huawei@kernel.org>
In-Reply-To: <0e530494349b37eb2eab4a8eccf56626e0b18e6d.1582448388.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jerome.Pouiller@silabs.com; 
x-originating-ip: [37.71.187.125]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c216210-b0e0-4f03-71de-08d7b90a6a8e
x-ms-traffictypediagnostic: MN2PR11MB3726:
x-microsoft-antispam-prvs: <MN2PR11MB3726D310E3AE89F7BD62ABB893EC0@MN2PR11MB3726.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(346002)(136003)(376002)(39850400004)(366004)(396003)(199004)(189003)(478600001)(91956017)(66446008)(76116006)(64756008)(66556008)(66476007)(66946007)(33716001)(71200400001)(86362001)(6512007)(9686003)(2906002)(5660300002)(6486002)(316002)(8936002)(54906003)(26005)(4326008)(6506007)(8676002)(81166006)(81156014)(7416002)(186003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3726;
 H:MN2PR11MB4063.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: silabs.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tW26OkY59CNnY0uV4PGmD9XS4pbuQLM1pt4GQwiWWWTjwahJZptDgOqh6gEcUJRRUKnEesFW63AQ+nHlmwLL6ujNeNhsjhmmjCWQ46yFZw5E02yBSEb4fT317AxYu1Q2Q8KOsFadzCMUE3s3CEUNeZ+OMns8tRv8Xa0CHukBXBgrVCsIILH2aUoAl7wQl67J9LZHTDCB3/JuS7kmOZwaSe66pPrFgevejKjIYTBuZaPvIdPS6DzQlrbH4G425hyAK84yu5bQCGNqm/GU+rS5pSFBlspjnZoso63etQGlyjlP2smClxd8ON0HazuSFgvv9fc3G5Oi+TuwdT7/eUITINwhL4ZCuWO7NGRABq2lFRe7Fj9JF/GL+jO1uWuyeIpTKrYwlABrrT/F0DJcq06TykDW52G3Qoo8SmztbqH2+4rG8pB4LiFwShz1kpQa2HWacV6RACvegASwLAKxzGKaAR5OX2/Yxn7CpqrNwkp2PwU7j8D+dM2ltDToonuQJFVa
x-ms-exchange-antispam-messagedata: AF0yrNqSJydrbDobr5+HTtfQccuCrmtFMqub6qCDUO+6bGqompj9fTm7j/3EHIz96Am9d2n3Y6oufwUu5SqccPbmSIQoDEGkPrk6ZECdmPwKgIRVBZEiuC4Wfk0BZ8jWv76rno3xBiwaCXdz7aAvOA==
x-ms-exchange-transport-forked: True
Content-ID: <A4AF2F212668DE49B684D505CA997FC5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c216210-b0e0-4f03-71de-08d7b90a6a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 09:17:48.1208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2xQe5PXq5tYfLbiYko/qpVR7veZp92Wqc1rmW2c0HugRWr2C1F3wLQZdz5vAfsMHRGVfsqAf8K3AZnp+my/ATQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_011752_584881_E3C90AA5 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Olivier Moysan <olivier.moysan@st.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Piotr Sroka <piotrs@cadence.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Mark Brown <broonie@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "David S.
 Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sunday 23 February 2020 09:59:53 CET Mauro Carvalho Chehab wrote:
> There are several DT doc references that require manual fixes.
> I found 3 cases fixed on this patch:
> =

>         - directory named "binding/" instead of "bindings/";
>         - .txt to .yaml renames;
>         - file renames (still on txt format);
> =

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/mtd/cadence-nand-controller.txt       | 2 +-
>  .../devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt      | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-sai.txt      | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt  | 2 +-
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  .../devicetree/bindings/net/wireless/siliabs,wfx.txt          | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
[...]
> diff --git a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wi=
reless/siliabs,wfx.txt b/drivers/staging/wfx/Documentation/devicetree/bindi=
ngs/net/wireless/siliabs,wfx.txt
> index ffec79c14786..17db67559f5e 100644
> --- a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/=
siliabs,wfx.txt
> +++ b/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/=
siliabs,wfx.txt
> @@ -94,5 +94,5 @@ Some properties are recognized either by SPI and SDIO v=
ersions:
>     Must contains 64 hexadecimal digits. Not supported in current version.
> =

>  WFx driver also supports `mac-address` and `local-mac-address` as descri=
bed in
> -Documentation/devicetree/binding/net/ethernet.txt
> +Documentation/devicetree/bindings/net/ethernet.txt

For siliabs,wfx.txt:

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

-- =

J=E9r=F4me Pouiller


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
