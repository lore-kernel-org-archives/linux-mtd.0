Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3061EC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:57:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E26206B9
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 08:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2l25XPr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LZk3Iv/Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pq7MUyOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E26206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xeQpuhVozd0N21TybE2nFyQzPE35ciZ5OSgYrvgDKQ=; b=u2l25XPrUKO+CA
	WEq3RtEqqhQsQyOmLHxad6fYLOewr3tAAEnmQEriYDQGQIRjVNaboExWG96CABCU2nPOicCSDhKTu
	D4gefGhP4dUPPa52M9o7RIUr+dHauYuJk3vBH/CPFAmdGjt7Lcf7NaZyPTR9JRXbDPihm2P49814F
	m3kdxSc7RdKP85bqVv2lE0J6oAFjUz9Bb/28k7idSmMYAh7tbWMaxY65xwNhWmBr3B69oN4fuQYGe
	SAiMS+PuQPnmPAtFtP2rQStazrnLK4AVkkX9ndSNcpIGG+Zs60kY06aKndYPNKjDq7cImaClcjOKy
	w/vyR+EnjWHaCo5H/bTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTM32-0007pN-Vd; Tue, 28 Apr 2020 08:57:00 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTM2p-0007dq-4P
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 08:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588064207; x=1619600207;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Uvo0TLOKM0eGy4wYHS3LWrIG3fbycYRk/Hrt524Mi/s=;
 b=LZk3Iv/QklKOKrSbdp4omwvhOrNGNOf/a7+0zL6sH8R1RcmXVlMlxdWd
 8j2Pk7RRaN/pQa6hotvv1yBzwrr3bjyCQigBTTVEwCtOQUYsPRce8ue5o
 2Sgjg420L1YXs+05HKTkOjNCp6SLwffp2gLb5cPAy0GY9eMiEky6irWjm
 DM3Ew2NFE8wNDDzHKsrk2V80OS8TWx4Mmo2df0wSC9+euXp59TUpaTSrG
 EvHCRs5jLacjjoIk1fMPqqw225m2XeZzyPgDVS1RER/AfaP3dG9+2RI0P
 D3WxIdiPRVLwb1gCvlBscSqrr3CMJN499h4inH/bb2c8EKQIRjrghCAJc w==;
IronPort-SDR: R/EQBfX8TvSWjEDVcYiv+D1dSOCr8jb6ciZkGdUVCosWodrzK4TXbIIB2KEw2cBPMZFo3F3Xsl
 /gJujyBbR6dlalQ8YdtTgrNtWdIlAslrOBsEEP0rXy2bpWYG1TF5bgoTyk+UGwiOjwlSSqwJtz
 wxeorJtcxfmn8XsuT1xpGvRLdRuCOy6tQSmOgmvNluicDwcqQDZWhNQJtbVJhuIBcJf5QZOqR6
 mqZLCzXWXmQ91sSHhK005VJ1YzUvqYt/5nphiG1Yq8JDDbPVyZk+U42/ifSH3/mSXT12PKD46t
 1Zg=
X-IronPort-AV: E=Sophos;i="5.73,327,1583218800"; d="scan'208";a="10608897"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 01:56:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 01:56:37 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 28 Apr 2020 01:56:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3uSOpE+VvU0vRFkY5Lb4IfxUEJrI8ouC4gnTKCk7JtJXKyTkztY9YQg2Zk7CRN+qmOMTGCqAgQ3XqtAxsOe4oQKz23XKRGVrKK9iVg+7yFbWPr4d6eVHw4QYK65N72bL8ud2PIuFADn0oMoYTxcPgnsKu5aLfW73RwlsE5ezvD5/n/+4tQxmuSwTeufHnjog7yKp3rv1wdLJb5IBh1HCvuEejXvMffh/E6Agv5F2ylL3HoP4avL7r7mxFXmJBJOfLqbFsL3MuKxSC05ZFuq0Oi1IwEjs0GjLVaZ4P17OAMLvtErFG973vzSd4Zz1AYanxN0G6C8l0dktlwOGk4T3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Cqopdrgt0dOiUtLvhaEJUqfi7/Pzx/pVVFKJevCLE0=;
 b=eReALn/PrOp9ZdNQF60m7ccV811WYJOIy2Uu5l2heerVuFLG5fCXqqbWJdA/Jzd/lCUCWFmj4H32ArIsd46OhardFRiSSToIzbb+JJnF2k4vUpI8f5SoD6qB9s736lPzRz45JMXZGb0gxOqnOpkEOeZaFmLAp2hzUJHCr0kKpWm8lfZv+04g+JOcOV4Y/xwJjhIUfxYHz0Ci2ZFqJDeJ2pagEfMtgrRzEYnejtUi1Fp9J+AbBst9dM7cLmyRf/wZ86X/q4XkWntgL3mRpOfpkvFV21CskAdhscfwqlCpcq/AlnpuF1HJ5Jp6u/HIFT8cYjVgGCeJ1mOD3ztPCia+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Cqopdrgt0dOiUtLvhaEJUqfi7/Pzx/pVVFKJevCLE0=;
 b=pq7MUyOcSJloG5zF0PI1sC81h8DBsBsBfraLKCYECVdeskhOY4J7H864wu1ORMYdeyXUbzxGG8a/nMhxcc+NYMhtBj1jt2TBh2AaLZDi6xAKqVn/CWjiT3DiaP3cTeamwo3AkY393SBBYXw0dTMQE/Ny69AUWmsi8M+eCPAr0Lc=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3989.namprd11.prod.outlook.com (2603:10b6:a03:191::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Tue, 28 Apr
 2020 08:56:35 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 08:56:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH trivial] mtd: spi-nor: Fix SPI NOR acronym
Thread-Topic: [PATCH trivial] mtd: spi-nor: Fix SPI NOR acronym
Thread-Index: AQHWHTmu4YIGhT4FWUWxDhX9JtN6IqiOO2AA
Date: Tue, 28 Apr 2020 08:56:34 +0000
Message-ID: <3161822.O8gYPG7Wh4@192.168.0.120>
References: <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
 <20200428084739.799468-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200428084739.799468-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aa34eba-6166-44c3-9753-08d7eb520df5
x-ms-traffictypediagnostic: BY5PR11MB3989:
x-microsoft-antispam-prvs: <BY5PR11MB3989A04285D91D5438B72E41F0AC0@BY5PR11MB3989.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:124;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(39860400002)(136003)(376002)(346002)(76116006)(5660300002)(316002)(54906003)(4744005)(66946007)(66476007)(66556008)(66446008)(64756008)(2906002)(6486002)(186003)(26005)(8676002)(8936002)(6506007)(81156014)(9686003)(4326008)(6512007)(86362001)(71200400001)(53546011)(966005)(14286002)(6916009)(478600001)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QgGJGZq3xwREhnBfVmMC4FezfJfqxjcTqpEfgmpRTNkVqcpojwuxEC2pBTlLG8WgyvvamIc8PniX0N4ZzhEBgLIZ42pVdrANSk1K6ysrCEvl987S9K6Zls0be41rpMi+/YFPSKyZYTRU6AiBLCJwxXQ4+mBCSu7P5NGZsFXiTixwCNIPFwVBVAt5ARE1RrOowTQ4Mf9U/Li2AchhilwhVdsN5OvRoqQaDq9jKrCThb4G+mtz+Vu3NoiW8dJ5nyROATe9GVaM4+XEjzt8rptVdQhX0Wc55nxz/gV+4g6ttYRWz7JOQqsF2iwGV8TAjLWC3nooyajcsLFNHm7Hu7NA4h5UAMEzKmHmLUY8qm8rjz1avfLzQmcFtFLtXuRGi1UdNxI/JyB9vheQyvtp8V/PfnhXaf+uyb0mfIDHZEzNemgr241rPJV2u9y0UDBDjie1s5eDJfYpb7Vidk9Tkq6+7KE3EzC9WNoq/lZ0RzJPIELL54gqUwvdUKPC7GgtgQcI+IR6gLosS+mterzNkEGpebdoRT/r/L4ZXTxXDXSTnaaYQkrX6Gn/8hYdXBMNTTx5RwTRRvQ7xs2feqqkgIjKlQ==
x-ms-exchange-antispam-messagedata: JIB731/ZRRldU0agJHFqOQRhjvjfNwoY9WwbDTuWkV7yy4g3HZvPHtIs+Q31TU2YxTqMo+8oPz/LPK0MUPFtkTHRvb3NNJJEf5Q6CXsZDrTXlKwrFenftaTnnLwuRACjsfeWOI6sG98l92BfmjtXALuyRp450JJgmdpAp7RM7Nyg9PiaNmMluAHh8R1XX4lcV0L3ogqeb6zMyZwLsFn7WB0w++udgz7EQjZBsfrnU6mplzb4Ki5iJYbtTXR5JSFTQMkxEyNwhDOBLpGs8Ea6R8qSWyt8mWs9MRwzWcLqYRJjKjlH+ypL5HkgF0XP3uiazpi5I6V52+TqAfaYt3rEJk3l/49sfUnq10GytWxQUdp+/B/vAyzQ8PPp+WCre4rhBA+4hEje65oa3G97hGr6EGKqlzi6zidlLNPAC2ss9AoBQhfwMOryrfUn+gqQ8z51D4u+rv0XJpGiXTeZG+jB1lyUEjW0w8CAf6YUdize23FfX0ufeUxm551wSdQHHhJ8pJuevo0x+fvA7o7JeLYM1LMFkP3JqrTGawIlYZudOlIsXYZxZ/xcM1stM9Nys5V/jwQhhnrvOt1+xDznoj4flRVtDep5myjM4fNiGRc2nYhySShx1KLzsBDtgPNUJzcF22O3e2qb2BqE5+jYLOgn9vSc77xExCkB26oN71otzgnE8Z+lkORunFKWABy7h2sxOQzClWCcIejl6k0U0n8IzqBeH8AMuot3e/sCVHUJuAkRCy2genU5OepBuiO+80AybfguFb5Xn60woZuB3Tpp0lWf8S4rAjU0g1GJ1hPmBdw=
x-ms-exchange-transport-forked: True
Content-ID: <48B7AC26EF46CE4194A9291B458DB0F1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa34eba-6166-44c3-9753-08d7eb520df5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 08:56:34.7830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xs18ex7baFPu87s0YBp135WOvolFvGzrTubX10mBVpC+B7gbsWABtx7mv/UFBECOYS4e3E00+vcGTEIBF6ThALp5bqtQ8HLs0iVk0h8BS+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_015647_289837_4778F8CA 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Sergei,

On Tuesday, April 28, 2020 11:47:43 AM EEST Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The correct terminology is serial NOR flash or SPI NOR.
> s/SPI-NOR/SPI NOR and s/spi-nor/SPI NOR across the subsystem.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/Kconfig                  | 4 ++--
>  drivers/mtd/spi-nor/controllers/Kconfig      | 4 ++--
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c | 2 +-
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c   | 2 +-
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c  | 2 +-
>  drivers/mtd/spi-nor/core.c                   | 4 ++--
>  include/linux/mtd/spi-nor.h                  | 8 ++++----
>  7 files changed, 13 insertions(+), 13 deletions(-)

Would you please review this patch? Can you take a look also on the following 
trivial patches?
https://patchwork.ozlabs.org/project/linux-mtd/patch/20200421063129.244466-1-tudor.ambarus@microchip.com/
https://patchwork.ozlabs.org/project/linux-mtd/patch/20200421063129.244466-2-tudor.ambarus@microchip.com/

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
