Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E74C282CB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 10:27:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A779206A3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 10:27:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k7EGo+0G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="yTxeSvjV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A779206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2QxdHv3OMEpknlBGKJ5HiKqBjnMRU7qHMjgjLmzdbE=; b=k7EGo+0G3o750i
	Jo7gsKDOjgIGPseDKAbCCUcv3Z37ugEhZ88AFhe/+lYBmhdnrNlfZFw9LguqlBqF6FpmO4B6O0YWb
	2wWh+V/s9Z9VTlVtGTsN5z28Gvlr9YQPYtYITks4PlcodFow9kxeJ7yy9pnA0jsqV+x0UQ9/zrbov
	NL0wTP4UKgw5W+pIQhaSdzad6QIp2URexotM60LNEAdJH3MSQz44aVM0O/Tr0h+buacMf5rSdSr+H
	PdjqlIIRdWj2Cwlz4h0fcFa+m2fY44o19gi+7LSP7vPU/AYgBk5bOR4/UNgbRbZ111g1nLFNbRG1V
	nKwtM3UnunqQSwZHyZeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs3N6-0004XX-Ku; Fri, 08 Feb 2019 10:27:00 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs3N2-0004Wg-1G
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 10:26:59 +0000
X-IronPort-AV: E=Sophos;i="5.56,564,1539673200"; d="scan'208";a="27426744"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES128-SHA;
 08 Feb 2019 03:26:54 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Fri, 8 Feb 2019 03:26:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0gppNkUUic/CHm4Jf5aDzQFGVrSiUa22TsiGG6GuLY=;
 b=yTxeSvjVAasjzsl6G1zC2YLNbMfQ1vIZmw4l0Dv2cu+eObS1JmjUnyexN9x7FFJIy0ooT6FX6x/CD/D5Kv4Llin8JbViegcEJirVvvqytgl8rswrUFiqpZFihCg25ie71URfdQLhM8aWGB8VRLaIl3LuR5/KymgUCscw6tRuU5s=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1825.namprd11.prod.outlook.com (10.175.100.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Fri, 8 Feb 2019 10:26:53 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Fri, 8 Feb 2019
 10:26:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <beanhuo@micron.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>
Subject: Re: [PATCH] include: mtd: spi-nor: change HWCPAS to HWCAPS
Thread-Topic: [PATCH] include: mtd: spi-nor: change HWCPAS to HWCAPS
Thread-Index: AdS+60iqy/bLyT9iSLSC+lMdoEdfvQArYGaA
Date: Fri, 8 Feb 2019 10:26:53 +0000
Message-ID: <f167ad30-2a15-e430-1a6e-d1e1ba455b67@microchip.com>
References: <BYAPR08MB45338B3B9FE13B8FB3070789DB680@BYAPR08MB4533.namprd08.prod.outlook.com>
In-Reply-To: <BYAPR08MB45338B3B9FE13B8FB3070789DB680@BYAPR08MB4533.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0902CA0041.eurprd09.prod.outlook.com
 (2603:10a6:802:1::30) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1825;
 6:oIoqu3IXxi3IcXAuYknrdMmSTlX7B0sV3RaJUDx23tS2wucN6uTPos/IZ3B6MoAg4ExrFRuYb9h5gVGm94h4RNEDl3NA74JACFkLVRaeXSzjPO6G9d/6LNl6sKSOLGofpP1GpS4oBZbhh2/RSVCfe1BqCzDEcoG5wzk/2HcaHqq1RAo+Ilz2H7Sg2vQfa4JsuWPWFfmcGFBYbXqFVVf/+12J5FBbw8KHc62R3BMZI76bgeNfEFV89A1VF/ursSwRi3w8PE904uY76f/A1kh+1hhnIG+ehKUywK6csEYFt6CuSEwsCg9QZmtvUSwIK102fuFFg4pnhfLo7cpkEBvtPXJbvvZvQACzt6oVvdZsJAYYm2sQ8IAaqhy90+lKTIdhE/FKs/E7tRIRmmALWZOvDVtFY+SNeaSGkd5Mzv5AWYAWJpGOBvJBLSUqEjKv4nMdbNsMaVtiCB54F6sSIi0Ycg==;
 5:q5uevCYoI9TypPiy2KgAQGyLn5BX5aP6f5R2W71Dw8kn3gniNROIEZjj9NyXFDbdMgPVLnQlVH9Z1hXBcUekO7evu+x20KUQI8JghDmRm3/6o0eOWoxI3hJl737pPQJHRrRduKgxn+0Jw/+riSHCnUELYamAT86DlUixRIoKY2HnT16lsbrgI1mjS6aDRfsmz3jIy50T4LYpdwWAbweH3Q==;
 7:PCbh33/1RiObphktPA7wMsGMnGjKxvOKAdV6nd1NPVW987mpgPEQ36SU8weSATWZ5Os4g6NtlVvR0uFiVnMOULHUGigCXYszBfXS0xm81ZbGQA6+zHtCR+EFnfefK5FN8oOX2TBLi7VUT65hwNiFZQ==
x-ms-office365-filtering-correlation-id: eec59f52-b432-407e-9a5e-08d68daff184
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1825; 
x-ms-traffictypediagnostic: BN6PR11MB1825:
x-microsoft-antispam-prvs: <BN6PR11MB18256D174A89DD86F71008E5F0690@BN6PR11MB1825.namprd11.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(376002)(39860400002)(346002)(199004)(189003)(8936002)(86362001)(2501003)(68736007)(6116002)(305945005)(7736002)(3846002)(256004)(81166006)(478600001)(14444005)(8676002)(53936002)(81156014)(476003)(31696002)(2906002)(25786009)(6512007)(76176011)(486006)(66066001)(97736004)(446003)(11346002)(52116002)(6246003)(36756003)(99286004)(2616005)(6506007)(386003)(229853002)(14454004)(4326008)(316002)(54906003)(71200400001)(6486002)(53546011)(106356001)(110136005)(6436002)(31686004)(26005)(71190400001)(186003)(105586002)(102836004)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1825;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SutvLkHgwzwpeb7N5Fc5yGA2ArwhMkOzTzsa2wn69oCVQrvb8jng6q1NbXwM3scTfYYYkYND4LmnzGZ+eh1FZTDGpT4OMuXeBvIwFVVFVypWYGH7ggn03fD4xn3Y7UVTw8oWkaVFsjCJHwpoyICD9J6VcGGwlrR7SqxT4QOEQw/IOPjqfjDoAcXxdlI2oM+gxJEe9l8628cgSq3hHw48CdWkDssAuc5kSH8PfHnOor1WrlAfWvmXwqomu9Ri9tm1/Qi9X318llYjGcrB3hKBZfsNjkdFpiUNmVRL7TV+eLOOFuJC+MqMtCLDg5G7BbLmF/f/P+tzD9+TRZ/hGv0DOLCJNMH8PmyhNRybAIgjXvDXpsWb+ELq1OpjDabmJaRavZ8eOWbfdHRsZTIdVzKhTyRqtsln06rWq8knh5azda8=
Content-ID: <9D309B3B340C2848BA8FC6EB9B253756@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eec59f52-b432-407e-9a5e-08d68daff184
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 10:26:51.4883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1825
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_022656_270797_394E1F15 
X-CRM114-Status: GOOD (  13.78  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Bean,

SNOR_HWCPAS_READ_OCTO was renamed to SNOR_HWCPAS_READ_OCTAL please update your
remote and send a new patch.

The patch prefix is wrong, it should be prefixed with "mtd: spi-nor:". When in
doubt, you can check how were prefixed previous patches on the same file by
running something like:

git log --oneline include/linux/mtd/spi-nor.h

On 02/07/2019 03:46 PM, Bean Huo (beanhuo) wrote:
> 

This looks like a blank line, it's not needed, remove it please.
> Maybe this is wrong abbreviation, change from HWCPAS to HWCAPS.

Indeed, it is, use imperative, something like: "Fix wrong abbreviation,
s/HWCPAS/HWCAPS"
> 
> Signed-off-by: Bean Huo <beanhuo@micron.com>

Your S-o-b tag doesn't match the author name, please fix this as well.

Cheers,
ta

> ---
>  include/linux/mtd/spi-nor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index fa2d89e..5e12bf9 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -479,7 +479,7 @@ struct spi_nor_hwcaps {
>  #define SNOR_HWCAPS_READ_4_4_4		BIT(9)
>  #define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
>  
> -#define SNOR_HWCPAS_READ_OCTO		GENMASK(14, 11)
> +#define SNOR_HWCAPS_READ_OCTO		GENMASK(14, 11)
>  #define SNOR_HWCAPS_READ_1_1_8		BIT(11)
>  #define SNOR_HWCAPS_READ_1_8_8		BIT(12)
>  #define SNOR_HWCAPS_READ_8_8_8		BIT(13)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
