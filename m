Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868DCC33CB1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 11:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 534C620730
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 11:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhIa/Knl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ayHn3LxC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 534C620730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKOuJKKixKF5K1i49dCWzODxcnTThY205Wy+I//naok=; b=hhIa/KnlC8ix7t
	IrXMpKKY9w7ZG4SVsMPgboa8zr69jbAz+zq5cV0z9fNdDIN8nI+dNQH38uXrsU5JitjD1lGxBfpAP
	g1FwQd2tGqO9QDED3BU/ob/OybOwC/mFKZVxeIKm9BHk2umUUPiv1ZPuvJGTJUMqlGTdCSt8Ym33H
	1e9fg81QrbE7g/aAI3qgn7waM5C29Vr7JAAKW0crQcRUhMtwKm+RazMhlEhFvM/Dsli0ZLx2AFSwg
	Nb+Do+iGAYS3XnoO0feGajqJDwlOsQ1VP7g4PlyKz5DOO/mYNBpe8O83gTkL8P3SBNJHp55DcSQpY
	TS/LBJdFtziL0RuPy3cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is2th-0001I4-Pq; Thu, 16 Jan 2020 11:01:09 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is2tc-0001Gl-Mh
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2020 11:01:08 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: HH1z0VSAR09YqAKgXdUgUhWl2SNUcdFWy0FqcR3/K7qrxNEeGUFArXZPvstSHtBfoNi07y5tgJ
 9d+DPJ11dWQrdRQkgIrK5t76pGJZnULEKTia+NqrXHJLgioFKvqxtokf5AlmNyJlbApvGRw9y3
 Q08p68aA4uk8DeoJT08NqIN0IADWaurkij0QgLq48QCjmVTDnjNLMRlZlbER9QbjX2lDZzvzDR
 986fmgCOWHUhjy9SpN4HIFjWP3hi6yHQjZuIJVn/MabuWBzxzdUbcav6JN2FJUy5OSQXYGFxMA
 waM=
X-IronPort-AV: E=Sophos;i="5.70,326,1574146800"; d="scan'208";a="63462447"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Jan 2020 04:00:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 16 Jan 2020 04:00:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 16 Jan 2020 04:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3VMZiK20F03U5YgSJCptjPfZMii7hcm6lxnIKdVYlJOlvkGVZPJXkYFrbu6iEfOrlAh2CaKApG1xDivr276+wFXU/Cjj1xku/Sn8XVNfXCWa/SkAI0QWEZBggxcg/6s/+ZTh63Y2+SIs30E5VRxzv5c+nm2l2PFrb70jbGNcm8rwBvywzUakNjI2BQCgRD70W+qxUvdFjumha6Lkav1A8PE7vUMquluKxrhbuBpdfs6VVIGYW3BExYJ+NQSho1YtbtNozcfTLkQ2CGesv2/qvhqd7cjEU5xR/Cd5csm5EOsLfNx6aqH5kYDkDGKQH5Wiz0nzD1DbHLgDsy4fJsxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsFvP8IzwdEO0LftCsRT4F/KMIbwpUKecchib+NNZFQ=;
 b=mViJtTde221DUXe116E3ZTNZ7fypFQq0v2Zq7y2y9ZJ3uBTA1+xu78R6+lRMpl6yOOtf00DywzPvNPkFkIMbHPkkGry4jdtfCBQteY/Aut/l93sffScd7dJdjgb49trNqv7Qd3KXzsLpGpZKRTkd4rnn0nDxZPfmFUXDUpEn6ihzfa3M3e2BzydPdJLpiI//BfM5OjOQE/D60S3ULnQFNqXAYO3G1C60tEIGPmjlSBu4rNczvi43UifIOOPWr9AU3zR52c2o7NXQ0v2ovJMAGFjqaX1uJxvwxZ4YSUiHqCkoijel7Va3Osn8/l+YZtvmjKSq3e7mfCOdNHXxomuLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsFvP8IzwdEO0LftCsRT4F/KMIbwpUKecchib+NNZFQ=;
 b=ayHn3LxCaUtg9NloI9Jl270QJvBCLSU0y2Ws4YKKPxZS+2rwaEazkX13BwdR7n6orHv+dI/NP/jmdL6ha1kR2rysLiPplEHZLQ5a1di3w+4Lv7BrvCovStjf66aWAWwH29anlWFEkIrQeaKWJELIao4DkhAzqWvjRztMCqncobg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3808.namprd11.prod.outlook.com (20.178.254.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.11; Thu, 16 Jan 2020 11:00:46 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 11:00:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [External] Re: [PATCH] mtd: spi-nor: Add support for sst26vf016b
Thread-Topic: [External] Re: [PATCH] mtd: spi-nor: Add support for sst26vf016b
Thread-Index: AQHVnZHVQnUd3S3MikaMOTXcv3k0Ng==
Date: Thu, 16 Jan 2020 11:00:45 +0000
Message-ID: <3599565.bYKpljohcL@localhost.localdomain>
References: <20191117215547.163120-1-brandon.maier@rockwellcollins.com>
 <7d97c9a2-ada5-be2e-fad8-40e26f1be65a@microchip.com>
 <CAJzBf2b7rOYPLr_GfpGx0P7oFy_3gEbf0mOPdYSVAt97Y3bafg@mail.gmail.com>
In-Reply-To: <CAJzBf2b7rOYPLr_GfpGx0P7oFy_3gEbf0mOPdYSVAt97Y3bafg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62787c36-8d85-4683-aa14-08d79a73568d
x-ms-traffictypediagnostic: MN2PR11MB3808:
x-microsoft-antispam-prvs: <MN2PR11MB380880BC5822F5DA9D06D2FDF0360@MN2PR11MB3808.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(91956017)(76116006)(6916009)(478600001)(66946007)(53546011)(66556008)(6506007)(64756008)(66476007)(66446008)(4326008)(26005)(2906002)(966005)(186003)(8936002)(9686003)(6512007)(316002)(86362001)(71200400001)(54906003)(5660300002)(8676002)(81166006)(81156014)(6486002)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3808;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y0bxvCv1vc66l4hr7EO71/lRHGCiTzGHdroKUeSc1JZkUn1EAaIwKKUQGc4cwVBHW8jyVezLKzSwTgPuhTeYy89wTv3wMEIx5ywYJSorF/3cJUbaL+zEHK9RVW+4GuwKJDTWfZ9m//ev4BnO/QDDZehnozGrOWgo/eTQZbe1JcKdaeE8/X4kEVaED3+CUFWXPi46WFCpvr6IuXqcwC4vaJwFt9fQ8AvXVVtWTdFExklw9XfT9ujNxA5rrgB8lReWFVyfC6vxx6Vg9d7x+tzoQUQd3+1i0fEB29xjoFOhUcUqaJ8u4w0B1C9SRNRuy8V7jV4ySAB+FpyymQOhczyqnVQLXVVBXbU1fJ2wPt6orN+HMqmvEScu7LdQ+8iWdGalot69E7vsOEo8TzcWfrxb8ME7iNjcNUtwXDQ8GMod9aVCdIocyYLdv3XE58peoUKQyCyILXFfBw7JrGPfgw5YgFWp3iiHpNwcqiY9jIsG2rVWbbUtkXhNUk0pbTbh42lodTnmbrnIJZFduWipPCH9Kcf0FS4z6Iy//aAl9T5CG+tm7LZ4VTZx1XJQRpoyu/Ri
x-ms-exchange-transport-forked: True
Content-ID: <F11EF97A3ED0E549BB448FB5CBD527D1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 62787c36-8d85-4683-aa14-08d79a73568d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 11:00:45.9646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mVVXpU9ZN37bK7xiPY92JRUG3K7zoLTRyzdgp46CAoE/oFQZCbCtVdCwx4xcmperTlWNq7A08JYjjybTb4e8YR/oaBV90L1qTnS35aVWIho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_030104_747820_38BDB375 
X-CRM114-Status: GOOD (  23.88  )
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
Cc: joseph.kust@rockwellcollins.com, brandon.maier@rockwellcollins.com,
 marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, January 6, 2020 6:33:13 PM EET Joseph Kust wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Tudor,
> 
> On Mon, Dec 23, 2019 at 9:34 AM <Tudor.Ambarus@microchip.com> wrote:
> > Hi, Joseph,
> > 
> > On 12/10/19 9:49 PM, Joseph Kust wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > > the content is safe
> > > 
> > > Hi Tudor,
> > > 
> > > On Tue, Dec 10, 2019 at 11:10 AM <Tudor.Ambarus@microchip.com> wrote:
> > >> Hi, Brandon,
> > >> 
> > >> On 11/17/19 11:55 PM, Brandon Maier wrote:
> > >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > >>> the content is safe
> > >>> 
> > >>> From: Joseph Kust <joseph.kust@rockwellcollins.com>
> > >>> 
> > >>> Adds support for sst26vf016b, a smaller variant of the sst26vf064b.
> > >> 
> > >> How was this tested, what controller did you use? Did you test the quad
> > >> read?> > 
> > > This was tested on a sama5d3 SOC using the atmel,at91rm9200-spi
> > > controller.  The quad read was not tested.
> > > Kernel versions tested were branched from mainline 4.14.115 and 3.14.79
> > 
> > Thanks. The commit message should specify what modes were tested and
> > on which controller.
> > 
> > >>> Signed-off-by: Joseph Kust <joseph.kust@rockwellcollins.com>
> > >>> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> > >>> ---
> > >>> 
> > >>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>> 
> > >>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
> > >>> b/drivers/mtd/spi-nor/spi-nor.c
> > >>> index f4afe123e9dc..500929903f61 100644
> > >>> --- a/drivers/mtd/spi-nor/spi-nor.c
> > >>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> > >>> @@ -2538,6 +2538,7 @@ static const struct flash_info spi_nor_ids[] = {
> > >>> 
> > >>>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K |
> > >>>         SST_WRITE) },
> > >>>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K |
> > >>>         
> > >>>                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > >>>                               },
> > >>> 
> > >>> +       { "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32, SECT_4K |
> > >>> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },> 
> > The dual and quad reads will probably not work because they require
> > that the IOC bit from the Configuration Register to be set to 1,
> > which is not the case: the default value at power-up is 0 and we
> > don't set it to one in spi-nor either.
> > 
> > I can drop the SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ flags and apply
> > your patch without these if you want.
> > 
> > Cheers,
> > ta
> 
> Yes those flags should be dropped.  We likely copied them from the
> other sst26 flags and thought they were the same.  You are welcome to
> drop the flags and apply the patch.  Otherwise let us know if you'd
> prefer us to re-send.
> Thanks,
> Joseph

Actually just the Quad Read requires the IOC bit set. I dropped 
SPI_NOR_QUAD_READ, and amended the commit description.
Applied to spi-nor/next.

Thanks,
ta
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
