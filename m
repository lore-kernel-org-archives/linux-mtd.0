Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041E2C432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 12:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C477320684
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 12:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p9XfMmG2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="NzmtILGm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C477320684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l/w2njRZg0RvrJLdULTyPOP+IERWXxEnaTczdzwyTI=; b=p9XfMmG2q2dAYd
	tr0fK7FXLGfuOWHOgdxUFkp+oLKfYaxH11vGmxVUu2t23cTqH36/Ag73qTUCkinegwceFDrY6nxuY
	F2P/hD8s3mKfNbSurASUZ2QOwLQT/Aoj3vK3csdGKYJFzglYaTy5Wom8ZB8A24AbKISuHLr2b7luH
	JZznzFq3M9+ns4ZXTcjLsmHzWlWVW7HaOY7CGy8oZWwr5upS9KaECppNEM6Sd5UcEgqCijbE8EIdg
	e1GgDUzL/bkuwkGWnGlvn/T11pI+7Pv7R2alRTB6AaB2qt826n3Hjncoy9Cs5SkRpwmLPCF6r3eMb
	34PBXdQup+GBHeFyW+Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic7HA-0007Px-8R; Tue, 03 Dec 2019 12:27:32 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic7H7-0007PS-8Y
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 12:27:30 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: L3x9rX26Qj+xpOQJ2Ofgse7nPZv4Vcupvp1oDoRB2XbNsyCDZe6nSK8atMpwN3xBd1UxXrNohY
 f9KCzHNEfnpCkeY/IqobftivwBeZNOQcbkkBFPMF48lW4TiNlsw7o4vUDMAcz/a6CnvHrjne2y
 bWMDEGV+8VYc+04Wnk/a1pgKX3UjduxrmWotsmVvntmRcmOvUDe9hz8ML9fo5vIgQ8V/C8LitS
 MgOQpv3XtnOddX0cBwCSDJ/d86zP5HdpRVzyKzbesrt66JpvBN83LpkZDlxLtAQUIFEtK4zHSV
 9Ws=
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="60426909"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2019 05:27:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Dec 2019 05:27:26 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 05:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyhNFE/vQw4HmtM2DcEQQkNjGPNW6m3uGcuMQOktmL/3ra1Jqi5XRXVKkC42s4bpgCW9n/rHdOsgCymmvQg49PiTI8OPpqCw8vWzSSSxdWV/U1oA7ZdqJyYj98gAe/Sz+BQireJFfdgY+90vmMD3rcmAngc0e2SKMEPsEEwuhFHIyVrA6MrQwx3r7zApMkAP9Q8+OMRB7DVEJ2lyZVj2chpK5liJODyMMpb27TnM9uXP2+kE46cEdb0N7V1K8J2bial6C3hGhfRag4ND+n/VK5Yl1DpWviWxUUYzs6ZUcbVdNG6mKm/WtE2qyY7OI+RwZD3bJx3imNDMs1dpwZRSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iXVfqrtJz7xHR0vjqYKd0nZ1kA7nSgHI8S8dryIoh0=;
 b=BXjiixqbTCJxGxcPM3XyXc9IiFeB1DLttOoqtEZut2ukRwIIGAdo4jgbeNpVSPOxhJNY/Cps9yZctIQjcY1Z+OARYP8C8EBgYLbc2pfaEjjTpCgNU4MmOHDrKAzMNv/D1g7n1mStCo4xMp5s4oh/rM56lWRM/xiJR6cUtSb7M/aes6Gsj1XankYOAkD85CX3607EUuTMFkdkY1dUY5X1fot2uVmV/b7XpwXO9ABi5eXmzXd97fzBfj3yo/rPdxefNYPOocxap60lZiEZWN/pGQ5J1bp8Pzt7Ft3A0/ZmeZx9o5BVS+3lwoB7KJWrXtU9ykdU+dcfufiDJNq7mBJd9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iXVfqrtJz7xHR0vjqYKd0nZ1kA7nSgHI8S8dryIoh0=;
 b=NzmtILGmhi9wAM8yJnwbx86ubb70KlemobQXrsuMDghV/UHSYQ/mnReNnLF9hU1jczKAesW53z07WlPW+UWOhR5Vb1HN6WO/APEWq+PbvKo0VRfqKyMvqy3Te1ly8Tv9FsdJC0px8fTcsYSRXZRikopqXmUHEAXXOJLE4V+Rvzo=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4285.namprd11.prod.outlook.com (52.135.39.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Tue, 3 Dec 2019 12:27:23 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 12:27:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: Re: flash_lock issue for n25q 128mb spi nor part
Thread-Topic: flash_lock issue for n25q 128mb spi nor part
Thread-Index: AQHVqTXrLRyxgk/NSUmXYMf/6XpoyKeoKnuAgAAMpoCAAAo/gIAACjsAgAAFwICAAAY6AA==
Date: Tue, 3 Dec 2019 12:27:23 +0000
Message-ID: <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
In-Reply-To: <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26)
 To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191203142717942
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca1d7c98-66e1-47ef-4d27-08d777ec2624
x-ms-traffictypediagnostic: MN2PR11MB4285:
x-microsoft-antispam-prvs: <MN2PR11MB4285A95B627A234EE0D9048CF0420@MN2PR11MB4285.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(136003)(396003)(39860400002)(346002)(189003)(199004)(66556008)(316002)(76176011)(11346002)(8676002)(71190400001)(7736002)(66476007)(6116002)(4326008)(86362001)(64756008)(229853002)(66946007)(66446008)(2501003)(14454004)(305945005)(31686004)(36756003)(256004)(31696002)(2616005)(6486002)(14444005)(5660300002)(6506007)(478600001)(8936002)(81166006)(81156014)(71200400001)(6436002)(25786009)(3846002)(54906003)(6246003)(102836004)(110136005)(53546011)(6512007)(386003)(26005)(52116002)(186003)(2906002)(99286004)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4285;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EuZ0PBzH4OSsZPKMv4q2M0wupED0zJCcfHxovxdzfcb5Hv3J4EdnKdS3RVrlJa+W7sWHVh6Vzti6gAYVBVW8OCjkQvR0nI4STEdEpGii1uFf4JSVum9RR+JolKqElk7duLXWRAMISxzDEVv/aDHmKvLPsZ31Z+YInemoMIP8FLHbR1/oJa+ph4Fdt+umZF6llXQCWVU+A3yULOJ/+hJQxD95o3b2tVT3mMQd2LPHg8PxsienJJexT83n7TXwC9/SGW2Ob8CaDMgFS0JQuxu9merZ1cQTIp5izNCExWLpcqFkhtTA5T3vSyS/AJIsWtZ5upc0UnaxJRmljcnTlhaUC6JvmgN2KoJWxcZBgKwnH49pNnPeOeIyI4o2kjt/VYzkEuKfOq4QsOozW34RCxCYpu+uxqH0vsAYRH2rRkOoY8gDEwNUjI3bGfY1lZSOH+bG
x-ms-exchange-transport-forked: True
Content-ID: <4DFFC68719E1CD45A881F7EC5DC96B92@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1d7c98-66e1-47ef-4d27-08d777ec2624
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 12:27:23.4583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2l/b1sbTryyGXGs/CvKHcb/wMU9S2nM3hVSjKm7yb5u1STgjwSAObwGOZCZRvjHW/yYCci1bnUP2S5DvxLb6Ph+Mxwj42+JH2PUcWCoSBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_042729_311640_2951762F 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: broonie@kernel.org, chenxiang66@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 12/3/19 2:05 PM, Tudor.Ambarus@microchip.com wrote:
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f4afe123e9dc..f1490c7b5cb9 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1033,10 +1033,19 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
> 
>         sr_cr[0] = sr1;
> 
> +       dev_err(nor->dev, "before write: sr_cr[0] = %02x, sr_cr[1] = %02x\n",
> +               sr_cr[0], sr_cr[1]);
> +
>         ret = spi_nor_write_sr(nor, sr_cr, 2);
>         if (ret)
>                 return ret;
> 
> +       ret = spi_nor_read_sr(nor, &sr_cr[0]);
> +       if (ret)
> +               return ret;
> +
> +       dev_err(nor->dev, "read back sr1: sr_cr[0] = %02x\n", sr_cr[0]);
> +
>         if (nor->flags & SNOR_F_NO_READ_CR)
>                 return 0;
> 
> @@ -1046,6 +1055,8 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
>         if (ret)
>                 return ret;
> 
> +       dev_err(nor->dev, "read back sr2: sr_cr[1] = %02x\n", sr_cr[1]);
> +
>         if (cr_written != sr_cr[1]) {
>                 dev_dbg(nor->dev, "CR: read back test failed\

On n25q256a I obtain:

root@sama5d2-xplained-sd:~# flash_lock -l /dev/mtd1
spi-nor spi1.0: before write: sr_cr[0] = 9e, sr_cr[1] = ff
spi-nor spi1.0: read back sr1: sr_cr[0] = 02
spi-nor spi1.0: read back sr2: sr_cr[1] = ff

the 16 bit write SR does not execute correctly and the WE remains set. If
neither of the micron flashes do not support the 16 bit write SR, we can add a
condition based on MFR. Let me check few datasheets.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
