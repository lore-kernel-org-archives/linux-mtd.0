Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AE9C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1TrsCJ2Q805EyusyuXtNAsAkQFaT3bkja/JjjiIpVE=; b=UUqc1k5zz1f7BN
	HF5LXXWiS9C4I7D0/jYHsq9PP8xhrlPoeCp53E9BeWdJRK6zeB2Nq34r61ixzmRPgRqqitZVHUw1J
	1jAItvCwP3jkNZ4DobOcfV5s6zsM21Qx1RHDXPOpFDq5l9eU880ztNpLWn4CIHSicdUt1ivHK6ZEM
	3CQcJOBVDRnIYkIZJ45VQdwsLsD0qaKSshQyFSNNXECmcks4Tafnv4NqvWaE1q5SRBcS5fNPWUvXn
	ZCCSUFmuPonU4fKZoYM/R05nxvL9+0gpBjmvp09bjtG4+GQpcdz9EVE5d81IbyNSAyTAvt6OFxRfP
	XM4Nf/FIO7+KpmjMtoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDNJ9-001Ac2-3y; Fri, 28 Jan 2022 09:12:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDNJ5-001AZX-M7
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 09:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643361155; x=1674897155;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f6a5DpocNRatUtj77dsSGb2hH5sT+3i+SU3ByrbtS2A=;
 b=e8mPHeNkn2q3a/m0kdiArJ+QFpleZBzzChUEeCcp9fYHKu07nLcGO013
 28TAKnbjbFDqez3LTUqbl+eeuLIw2GQY+jNwZ68VUhyma2Sxr5YBYAs6c
 EgfsIARPxGp/0nuAP3XlBax/52f2uZhDe11gQvG8gOLg49cd6tqyNnNqn
 Ji+S3EBR7kO0w3MQ99j6PyHia3PhH88d4p3rVOdlPHxnCHtWh5ayOG9R8
 wvoZR5FKQLJgbyoj84foUlYwJobeVjsB3zwScdxWou6ybw71fuiry3BVr
 O+dNoR/Ixof6+LY75ddaMq682j1+wGoapG/wg+6wgAir3re7crR98I5+4 w==;
IronPort-SDR: ZMD1i/mgAS/hGIbVI++bOzr1mPax6LvXAWSoUGr4hjClzVgPeloCJIKSCEuwdA2sL8PF977czI
 7IoThwCVNnH6oeWQEB/dL4pbnzmPL11kDOy3ALGdWB9eo2/W1AAySAxS6yXPSb/vO9i48SP+rN
 eKJtfuklbit1G4GMrFwHHizvSM1OUw0W3YCsBsc/ojkDVKw86f/x+95PmJqA1IEpwbQHwjm++V
 ZMVEfyDLfQLckkaIkrmzDvg0UmgCPUET4QPoP9GWy4EttvO7d9rsdMNry35dafowIFgf1EDNUn
 QXFSt5JIoCQP0bXu2OfmMYrF
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="160322660"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jan 2022 02:12:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 28 Jan 2022 02:12:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 28 Jan 2022 02:12:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3g5PEwTv3LZwcSmsH7uH4grnAlUV56XzhyQwsWR5GEJa32NWNvVG5tTnI03HyWja0lVFL6zP9j2o5bdufP9ne6XV8fLuZ9vtkEMr2/M6TZi398x1OA70lEmxk40hBIXBSRPQkvBWpqsyBgqah6KA2Z/gsQCVqWdeZO3tCBQhPJrlFqjMOo4jbXSCqWzLquQiRiIRDAu+VyFsKjbXSybYZnwBCKsEupeVPhvK4BsYIxO66swPdIXj2VMs1b4Y9i8RaQmNfSqzVjBjPglnVCRbQqaGhO00Vv4LJnR5JumWDTdLXuJU5aihBUXFOVMe012QxgVYby8EAKZAG2FglK6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6a5DpocNRatUtj77dsSGb2hH5sT+3i+SU3ByrbtS2A=;
 b=KbYGn+Ixzm+XwCDX0yKKK4W20F6etH/KB3nvqjOBwFHjqNMI+et8q3G7SQxb+s5NmYj6BZ6ps9VILv0xCQjPS6M+WX/3+NywoBbUuSgEentdImfkEppYdYXMWfYRRN2jdQIXmmpxhhsND6sUqk7zPwAvuNieTou5lvnBZ5A5iSTmdVK4JThJkjXHA9qNModKCwnQ6qVYuGbQFrtghOefRYf3ft9zTNCctiMKjdCjveOc885VOMqZcLOlU4nq7GsOrYL6td28PDM0YK5U4ZZd36YEihuyhf/9FAwkmxW93JxV946pjGB27pFpOcGK9kIo70drXV78Sfp/uthMChheBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6a5DpocNRatUtj77dsSGb2hH5sT+3i+SU3ByrbtS2A=;
 b=dqBgL+hZa2SJAUcLcmPqztDkiHDEYjH3NyddKZzO/klsnqrJ1F+mWo4FDNbhArpwnddDTSgtu2GK624Ab18HmtT1NqGvwZV6k0DvP0W0snihwsvfkzTnRhWKNO52EdEJ0GNH2gz/4JDUngzCqYQk7TqfEtgWWn6biESvY2+JBLQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Fri, 28 Jan
 2022 09:12:29 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 09:12:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Topic: [PATCH v7 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Index: AQHX3SUdg+zJC0HPb0COlJ/0d4objA==
Date: Fri, 28 Jan 2022 09:12:28 +0000
Message-ID: <311656e8-6382-3ce7-ad93-16368543d172@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <d2503b2f-3190-7c0a-47dc-6ebf2f6e74ba@gmail.com>
 <ed5395d0-3e39-de69-527f-a33e6de3d278@microchip.com>
 <f2312dec-ff76-8097-996c-29291090b7f4@gmail.com>
In-Reply-To: <f2312dec-ff76-8097-996c-29291090b7f4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17f3e700-040a-42e4-685d-08d9e23e4ee7
x-ms-traffictypediagnostic: BL1PR11MB5271:EE_
x-microsoft-antispam-prvs: <BL1PR11MB527139D7F3407750650BB9A8F0229@BL1PR11MB5271.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XqDrhDaFy5lNzD2fvRXXHvDEI4Y0OChx+CsnPczwfmlY4Tq73kCm2K2zLNA8BMFscSU2OcWNWp1H9RVyzl2ca4L5AiqtUrB07gaBlK+8BmhIGDRT0gYht7cSx/cHj10ieb9xjmzbmhPeW/MtEUZ/0HmgSCbpVZxi43EjpUlwFZhJmA47AyJ1DeLNDP5BtXvM4SdDPMC3s2HrqboP9cjrusRb4NcQFRXwmaWfIXC0tUYp9Z4HCy6a1WNdr2wUPK8OMA7B9V3uuMsSQHzpfU33DJYDpLspEOGcb327GdRUKYhDyLPhr3R+ZOE8sN130d/+CI0soSHc4YAo86KPc606kLsHkDRptfay89F68e4n6rc+ojyz+BRuqP0kZ1QYXnsLAeqjoUSbjDiCw5Hm2By6LMBtKUG+Hz7rPb6d1MlajIoHAiU8HTVV13/bz1C2LZxuVk9y/bkZ9skPAdWqd4vD2GwdkkWHgbXZpO/fl/i6Zdk+PWokoxJPV0EwYahW73boSfLxc7M264AY08VnVA+jgmSUncRrJOilZYmaDSiMZ86Ir3pMjUFZARktvGEeXH75RDhNocJRrFyH0KEzdX6XTNmuyBJDIPjSm/ePvmyrQHUXAH6WLtjADAOt3uKAL6/VE5L3tduXlCR0eMhGKazP3lOZDn4Y1XkOEwxlNaGgVvG/5ebPAAvTWZMbHfSwCdOv4S+4HNwduMDtZAqb383zJGpiy6NTujmpAV43jFBhWVxEKYR4KnK2CMW5TjNwQl7rnyZau9JyRnNajCRgAHH03QBgM9EsJNB+F/FOCNLJNL6pXdLQYEUUs8yT5+LDEnPOL4Q/fYgg6cNJm0EOdt+2MhaMlNz5bRpSEx7VQBZW8bM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(91956017)(64756008)(66446008)(66476007)(8676002)(66556008)(76116006)(66946007)(31696002)(186003)(26005)(2616005)(86362001)(6486002)(966005)(508600001)(36756003)(6512007)(6506007)(122000001)(5660300002)(38100700002)(53546011)(38070700005)(31686004)(54906003)(8936002)(316002)(110136005)(2906002)(71200400001)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHpyeE9UWURMb2ltRzdpaXlkSVlYanhUcUFuelpzcGtud3U1T2VhOVJFd3Qz?=
 =?utf-8?B?OWRONlFsb1pNM0hJaEUvbC9NSTdxSC9Da09lbmllNmxoQkFzQ2xwS3pDVlVG?=
 =?utf-8?B?M2ZwZWEzNWxtRFRaQko3NW9MVGZXdHpIaERRbUxzWWRuWEtUWVpGb0NuMFNz?=
 =?utf-8?B?bXdhN3phTG1RSndiYzR0aE5NTzIvMksxZ08wMDhsWnBIMlV4S3p5SkwwTndI?=
 =?utf-8?B?Q1JnY0Q4bTVwWkZoZjUralFTQVZKcTFzaW5JUnpISjl4RytNUWQzdXdwUTZK?=
 =?utf-8?B?cnhwZ1NHNVRxV2ZoZ0cxR1I3N3dBL3hLYko1S0ZNOTNIZC9VL0dGWVJwUWdR?=
 =?utf-8?B?ZDd3TGRBa1QxNFdSQWhNazNnaFluYVpiRmlBbVd1OGhJOGo5azBlQU9sSXRl?=
 =?utf-8?B?V0J2cEFXQ3RtSm5VdU1kcmsvVC9LY29lSlZMOHZndFdKam5uNXBOWm9vdEZn?=
 =?utf-8?B?VkFzQWRkTW9DZ01lV3BvVlo4TS9YMUcrQU9FM3d1cEtjVmRlV3c5UEVEVlNI?=
 =?utf-8?B?dE1vbHcyRTF4NUZvYk1acERTdm5oMVh2dHpyRStZV0VmK1ZCaVBLdUJCNmFr?=
 =?utf-8?B?eW96Ui95WHNteDcwbDlDT2xqaTVGbFZXU2ptb1pNZlBIYVltaWkxTDZlc3ZQ?=
 =?utf-8?B?VFV5NGt6d1VYdEtBVWFVRjg1eFdSbzhtRXkxSlFSdDI3TVZpSHFYbUZQdTl2?=
 =?utf-8?B?Z1BxM05iRGJ1THRVUG5iOVZwTmhtY2Y4T1MrN2hYL1BTVUdnS1pLdHZ3a3I1?=
 =?utf-8?B?OEVsY3lXdUIyN1k0a0Fqa1RkR2NTbDZ5MGN4N3NqNEt6aDZoVmpYYzdDU3FU?=
 =?utf-8?B?ZnlVS1YxUFRiWlhUQW5va3RCMWhkMHlpcmp3ZWRweXhZVlJERkxLTzJEK1RR?=
 =?utf-8?B?MWRYYU9rOEVPNTBFMEZxdTRKR3h6dmJwU09jTE5weEhDMW01YTlkVFhoOWVU?=
 =?utf-8?B?U1pSTnVHSUozOWlYRVh1bVZyRS9JNXhDMFR4aittNFJMT1BqSHJ5S1R3eU1R?=
 =?utf-8?B?ZTVxMzRiMnpqRlpkNDQ2S1RqN3k0T2trbTZaaDdzWDA5UU1jTHRYcUY5bVlB?=
 =?utf-8?B?ckF2NlVZK2hNZDlzNHdiMGxHWG91Y0Q3clV2bTZwUWk1N2FacFJXV1V6cHZ3?=
 =?utf-8?B?MEhmMzdxQ3ZPNGpqbW5VVElSNkQ4NmFVMEpDaXJFT211VFRBOVlEVGQ4Mmww?=
 =?utf-8?B?RW1DNXZmVS8raXB1OTh1VHovb1lJWDFQN1liTktvSC85MXF5VERQcVZ5ZHVr?=
 =?utf-8?B?UnBHZlZSYkp0Q1dZeHlCRDNXRGNpZUtFMm9oNTJPT3I5dW1IWmIzRTNCU1dw?=
 =?utf-8?B?VkpMU1NxNU1EWUU3emFGcWtHcTQzNis5QUk0eHZRNEVoejFPVXEvZ0JCdUFq?=
 =?utf-8?B?U2FobmYxWWJjRzZUODR2anpoY205bGp3UER2Ri9raGx3MVZUenhqZmZUZHNp?=
 =?utf-8?B?Wi9SK045S3VzMXRHZ29UaURyaEphcmFiM2EvUWRVVVFSZlNvSktOQVlxN25y?=
 =?utf-8?B?cldPK2ZaeXZyeTVFTFZJejgvSWx2SGtCTmFucWIwZjY0OXhuKy9EN2dkNjVW?=
 =?utf-8?B?S0xpL0t1RmtPOWdLcXdZOWFMV1FxZnhkT2duNEVrTTB2b2NzM2UydUxtb2Zx?=
 =?utf-8?B?Ni85YTFETFdYQ3I2YzdRUUljcjU1cjZMNkYxdnY2S2dFYzY4OFdiU1BnWm5v?=
 =?utf-8?B?WjVCQWUxZU42UTZ3NEtCcHhEL2plOXcxZFBSOUxML0Z0SHFGbmFHTWhEMjFD?=
 =?utf-8?B?QjVoS2FkRFFXVDdiZU9GYVFTQjRsQVQrUmJ0aUFiNEVJamhDKzRlRmpPUFgv?=
 =?utf-8?B?cmtYcHZnaXI4OFh2MGUxV0E4bWxRc1lMS2xJcCtLeUMwU3U1WXF5ZElJTi9m?=
 =?utf-8?B?MkJpa1Y5Y0FXSWk2alprMzFNaHVoQWtSdkJDanM3Q3h1TG5QRzRkTDY5YzEw?=
 =?utf-8?B?YVluRUIrRFpyelFBQ3IwUDJxZzJIOW82d1pWMXViR3hyaDQwYVpOQ1M4cjg2?=
 =?utf-8?B?b3FWek5XY0tocG5QK2RVS1JDbWlhdUdYWVdJYXBRWWwvOTFsa1lpMDdURWox?=
 =?utf-8?B?NDNSMkpnclJmRkVBa05oV0MyU1NCM0xvREZxZzhXY0JRdy9UaUY5bldxQ0Mr?=
 =?utf-8?B?c25jaG5WZHE5eEtpZG9rb3N2eFpieUIvUk9iTzZENkMydUtvT3lTbDBreXNR?=
 =?utf-8?B?VjNHejgxYUYwdEFybG1INnAwS1JnT2FaMXRlSnI2QXBoUHl0cjlLenlVdTZM?=
 =?utf-8?B?dHR3ZEwyejArK1Q2cTlzS2NZUWZnPT0=?=
Content-ID: <6B38593CC3973C488F68B674C3E8DB72@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f3e700-040a-42e4-685d-08d9e23e4ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 09:12:28.7399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+R4nXHDmaPAQjSg7S0WXy7e2fDYIWgA6nx48fVTTVMptE+3QWS1aq4E5h9HiCY3HEUD8XgCJtLvzmHb2gaMkWwPUln0BjOxesYaCky1eEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_011235_823156_92A0E0AC 
X-CRM114-Status: GOOD (  16.06  )
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

On 1/26/22 11:41, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,

Hi!

> 
> On 11/19/2021 6:09 PM, Tudor.Ambarus@microchip.com wrote:
>> On 11/17/21 11:23 AM, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hello,
>>>
>>> Any feedback on this series of patches?
>>
>> Hi, Takahiro,
>>
>> We're in the process of fixing how the flash_info flags are used.
>> We already have an agreement on how things are going to look like,
>> I just need a bit of time to submit a new version of
>> https://lore.kernel.org/linux-mtd/20211029172633.886453-1-tudor.ambarus@microchip.com/
>>
>> Until we pave the way on how to handle the flags, we don't accept
>> new flash additions, otherwise the flash_info entries will soon
>> become a maintenance burden. I'll soon finish the work, I won't
>> stall you much longer.
>>
>> Cheers,
>> ta
>>
> I saw the changes about flash_info were accepted and pulled.
> Please let me know if it would be better to rebase this series with v5.17-rc1 in advance.
> 

I've quickly skimmed through this series and it seems fine. Please rebase, yes,
meanwhile I'll take a second look.

ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
