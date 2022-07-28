Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D767FC04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 04:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTxR9a7yo6LqUJbLYQ1m8p8H2gEzMaORdPki7yKM2Rc=; b=4T8d/C854w53OG
	NZPprsHtR0fLlEBAYXPYKOhCLT66SH6cXrhu8268tIqFKwgyUe04ZPfa2wFX6OrjrtcqeG5troO3e
	1nNH3ryRNDPDDs4UxIfPXnfG61gjyoMXmjOg4ph6MhTFSRXmRZLa8ZF5AhzDMLKHMjEo54chq/usC
	EIec5TCZhKVuM24GPgUUeb3Y70WQ5jGTUy62oiY+/zopwhedfugwspDItNw5UlMWVa1+Xgmx+hF/B
	rhuoIbuV2Mcmm4DyTl0m9zcn0RCMZILUHYpEa4uTONmeHoIQoJ8V4167Z/mfs21ghxgNYkZLu3KIF
	EZU5zd0rpo9DLgPP2S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGv7X-0047zZ-9t; Thu, 28 Jul 2022 04:27:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGv7T-0047xN-RE
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 04:27:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658982452; x=1690518452;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=acAvl7LJJS6182NrwkVdz5WLkVx7Yujvl3xVtuM69Uc=;
  b=YZAYvtsGUbx3cqDlAJ2ztQbzU+CGKec6iIzLjLRUzIscV7eLSoep2kPQ
   zIFusO7smHVeeGklUvwtFoJz3jWl+nqsyV6fMR9bzfze3yGqbUGufgtY6
   lzjVlMI6LOX6CaUc1yEAr9VDOFIX2YupEQ2HGcCrUzV2Qpcw98JOjJpyy
   KOOtMpLs3XGodnwdSuIWPhQPJxvgjJZoC+XtQxFReMxf5EKEHfLMdUC7o
   AluKONjdfbwzJTutTyHi7Fgx5qit7QLkPA9jcNKfEClA3+HPfKlT0J/KU
   4sxf15FiMsJB14F8WVPqw1PmzvA7qlM/uHo502+jvQwX59Vxwr8K2/3dM
   g==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="173929664"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 21:27:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 21:27:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 21:27:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/aBRmwTN/xVn4c2rSEC99M3j5M12P0Bc5+T0Avez17f/PcLh7hE4+BO7/kaIY06GIXGMdkaitMwocEG9XuPRK8OH8l3lrygGqKn12OSxnPr7fgMxUBFrjKc5v2ZhJHY1AT6YL19V8c4hhy3Uqag9k3Mg9ZhshIietR2ixxLrT30KG40a22p22ck3JKZfyjrvwI/Vuvd28pM/Smk5w6uhDv2Pdn5WSMgH9Jj7dMtOKOmZN/w06CMp0PBvMiusttt4hnaBFionPHJ6EKJBgunpjtg1gTeHjs9sRQaoKA+lzcSNPsZmPppOWHoB80Rkf3Tc4EF/tvjp37jLBvQZzgYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acAvl7LJJS6182NrwkVdz5WLkVx7Yujvl3xVtuM69Uc=;
 b=mBGlWstXbrnLBqrIMcrfoxpmZwqF+jljq5vA2K6joZcvPsVM55xHnt4mnpTgfVKRhg5NqdkuH5XX1C43zet6MIBOfkqW2lExnA8bprV5G1IhauR7DQ5CdjN60fKft635RdNWBIoikLbHvf5uGUhq39ejzA+NI+Xl9bTm0nakXEZ5I0cAIoNsE7kD71dgg19Uq8kQmBkUwX29nxcaYlo3NbECITd1xL93tS4gPcde46qmsyghXltgmsKrIYJ+8ZOUD+l+x4U3QFDwCJ8skAGy5FiLJRImncvjtOYBBcUwv6tvvfNCsEbmUXhCwNteQZsf515TQnYb3l0re4ccQrKyBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acAvl7LJJS6182NrwkVdz5WLkVx7Yujvl3xVtuM69Uc=;
 b=UewrW2D7SvyTDNO/WxojfsYAD1sgPEaD21RJXEYwF03drcIpuy3L9LMFkFm4c3FeEy9C9vTU7Ljvtr+u93nmphcm6TpiOIz+8GMS3ptO+l4qhPSVMqDe0FjrlzjEdG/y5vHAQ4QMD3OfE1nk7yVIEeSV2G9bhUs2RMK+Vr7EXg0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MWHPR11MB1823.namprd11.prod.outlook.com (2603:10b6:300:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 04:27:23 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Thu, 28 Jul 2022
 04:27:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
	<tkuw584924@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Replace hardcoded values for
 addr_nbytes/addr_mode_nbytes
Thread-Topic: [PATCH 1/2] mtd: spi-nor: spansion: Replace hardcoded values for
 addr_nbytes/addr_mode_nbytes
Thread-Index: AQHYojpVJR1vNMR4l0imlC4GBfCU4Q==
Date: Thu, 28 Jul 2022 04:27:23 +0000
Message-ID: <3e6bc7e6-678c-176d-d289-0e9e394fbb2d@microchip.com>
References: <20220728041451.85559-1-tudor.ambarus@microchip.com>
 <20220728041451.85559-2-tudor.ambarus@microchip.com>
In-Reply-To: <20220728041451.85559-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4efdfc36-bfdc-4ea4-9205-08da70517832
x-ms-traffictypediagnostic: MWHPR11MB1823:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: okZWFGDEOOK9c0WePNI2fV+9pdI/e111Fm26OhXtE+tEKVM/W9s0POwbR19JsH+gh2b9P+L7nx8PM0m+AHiw5UWOjDgP/61x2+aw5nlJyyUGqueChAc3uz5Spcn18JhHqAz7xcbCdRZUZcXFf/jcoKZm5+Cqa8ucInhoCjXxrz8xCkLlLTNgOER33dKlWVRWnB+ICcMG1jnuTObjSg1ecPnhYttMjnwI3GmvsNrOxmVDMzN7xWAggM+0L63MZQ7EDzGB8Hu6w9PA8lBmYrFfNIR7xNnDFjwWwLM41cMlnBigYWnmgUYVmM1vVOfH/8FuoHpfFbk60pSclj+UM1WzXkpnto2UKmpC/4UTa6AVl/gmLbcqNpxjiO1vbTzJfOJncijgaZ7bRDdrVxhblpZrCJV7xqNaj26yeaUbfIXJO9ck0RJRAtv8AnS8Gj/R9WUl3oCIoeAp7Uj8BRKo4Bixw6wq8siv2zaZvAWJ4TCr5rNeClWHr0F0jkBt7ImBEjlfaDn9M4MaXDF/FzXmW7aMfgF3msD8LPfRTKVqanMDJG75jwn/QLxDBH6XOQeDgtLDSUnRzzC3aHEYlRDSpyQyQEVmrtPiBN9IQmMhpZG2h0xyjhyFeChKsP8Q6aYosrJmGgSv8nDkXcumigUwpU3Ju9efYTjC1mZYBliunXoZcWiUzwgUFvdAhOb4tprReKc8j2oXsCY4X7riSDaiOJXSf/b8uwqquYf6LPAH0TjVDP4Pizxahvtad1wijxLJhDzpY76s1IWPFX+5S7bSjxoT6PfjJHoYfEymzzAfndbXmhsm59XuoN8bYcqSwVrizyfEbhyrjmh5VZIn7cgAN9VI7zJOnwSRnK+xBkDrrJHgZgA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(376002)(346002)(39860400002)(4744005)(5660300002)(2616005)(36756003)(8936002)(122000001)(6512007)(186003)(6486002)(41300700001)(53546011)(26005)(38100700002)(31686004)(31696002)(4326008)(38070700005)(110136005)(2906002)(86362001)(83380400001)(76116006)(478600001)(8676002)(316002)(54906003)(66446008)(71200400001)(66946007)(6506007)(66476007)(66556008)(64756008)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2dXR0J2MnM1c0ZSSHk3YUpEUlkyWjJ6SXdnU3VIdnhhVlFHTS8zYVFkbTVn?=
 =?utf-8?B?dHR3aFhpdFFxREFHNFFSQ2Q4WEUwZW5zcHlvNW90SXJnY21kWG4zQWoycmhC?=
 =?utf-8?B?czNBV1hBZm5Rc3k1NFFWSVF3TUxKVGs5WCtyUG9Qdmw3dk4rZG10VjJNNUg0?=
 =?utf-8?B?VHhmSW9nUEVtaFh2dnNTQkpuVmttc0MwYlBQQ0ZmSU85QjU5cnl4eFZ6SGJh?=
 =?utf-8?B?N05YV1ppQ2RRbU9XTTViQW5kcFZUbTZkWSt4TzNidnJ6ZXU1b3VlZ0NtUE9W?=
 =?utf-8?B?NDNnbzJaMGx1MnIrTm1ZUGVOemVDVmZWM04ydFZyanh4NHY4WXFjRzJ1RVkv?=
 =?utf-8?B?L3RUZHhrVzNIR1c5UFJDZzR6Tmpld3JjaG8yU2V6WjJMUGx2Mnpzekgvd2hS?=
 =?utf-8?B?NVFGdHJVUjh5c2IxVlRQYjY2ZzVid1pwTjhxdmpWblQrdmxUcGYvVnppcWNx?=
 =?utf-8?B?R09DK0Q2b1BFOGZaTndzTFFLT2dRWHJCQTAwYlNXeHZCdURDamhqYnh3dXow?=
 =?utf-8?B?T010NGh5eVhwd3VIN2Y3WmV2L1lobmIrckVBWm5WM01aOTFINlVrb0VBVkRJ?=
 =?utf-8?B?dWRPTmNGYXBtVDFaYTFadk9PcjlKTERtYlhxQjBxYXIzTnoyVDhmRktxaXQ2?=
 =?utf-8?B?M1QwUkc1akpOYkZOSFMyQlRjWmJuMUI3SENkNWhzY2d4MzB0TzhNNmx5UnRl?=
 =?utf-8?B?Y3B4U01jdTF3QjhWb3VHQjZjcU92Ry9jU1lpaGIrQ0I2S25ZeFdpOWlzeUtJ?=
 =?utf-8?B?NmVWOVRNSzBoaktIVHhheXVmSStacExUZk56bE92a2VLOWdTa0w2VFltaDBa?=
 =?utf-8?B?aEZ3czNzRUtEQmM3ZFovUlJ0VjBpbG1SeVpHN1FOTkhicGkremNhWTNabzli?=
 =?utf-8?B?M0VSRksrbWNSVU03bitxKzJUUk03UlNZa20vbmRzQnJkUTlmNnVyNWNSdElh?=
 =?utf-8?B?Wjd1eDVTdXpHa1JTTXRadElCMWxVelIwNFZpa0FEbEJRR3ZkdmcyL2hxMFNK?=
 =?utf-8?B?UThXd3ROTVVTS0lPaW9GZnArMmtmeUxRWjhHM1RyRzZlNldpTmRab3Ryd2Mx?=
 =?utf-8?B?YU5OQnRheUVodDV6NWtZRndvTklNQVRxby93dWhqR1lCM1NtVjFHaEtRRW5P?=
 =?utf-8?B?UnVqMFlxcFBLWXVTc3F2NlRyS3ZZd2dCQjB2VnNJN0R2WjdFRXpwY1l2Wi8r?=
 =?utf-8?B?ZzlEMHhaNG16OE5wQWIyT2o1dWFIbW1RUTlOakEzVkVPMHBNMUNISWdjVC9K?=
 =?utf-8?B?aVd1NnR5eTZUMmtJQ1p5SXBZRlJWTWlVNkdYUmFLbHJPcFh3RFRVTDVFQlRE?=
 =?utf-8?B?ZmpXMUlYZ0RWbXUrUDBCLzdWd1JuTDBTeEYvWnNCS1dvYyt2and0bEl1RzNn?=
 =?utf-8?B?VGFyemw0QStKQzAzZEtQcEgxd1BEdnJ5Q1ArRTJaQ1g5VkcwalViaHZRM0VF?=
 =?utf-8?B?dVMxNkJGdlRMb0Z0RXBXYUJmMHhyWWhPNTRSdTV3NkN4bC9aWGFEZUNWSUwy?=
 =?utf-8?B?R01NM3lHeHRxS2V5ZUxTSXV4cnMrNzVqajJHb2R5QzZGT094K0dVWkM0dWdt?=
 =?utf-8?B?bmNOdUU4MmR5dmp6TWJOVyt3dWZOOEJtelA0aGhUZ0VnYjVRWXZLNTdzZkZ4?=
 =?utf-8?B?TlAyV2pDcDlkcm5YZnJKZElUTzBzNHJnd1Y2OGpWUEUwZklHcXBmcTBHN0Zx?=
 =?utf-8?B?a3pZa1VITmQwaTdueVhuVGJJeDBJRllONEp4MThKaUNSUTFFUkxlVVNWQk9n?=
 =?utf-8?B?emF5VXdNWHh1Z3VITGt6WTVUUERGYVN2aHphZThkcXdqMnJLcGVpRG5vYzZ2?=
 =?utf-8?B?SDFybWExZk51Si95Q1dqaklzQ0JqSVRGN3U2V01DVmFJdkk0Rk5aVkNuZWds?=
 =?utf-8?B?OXJPUS9jS3dKL2trZldPdVVOQ1hFc1czNUt5QVN0SUVzQ0wyaUFENS9Qd05q?=
 =?utf-8?B?NEk0REdxbGR4NVpkSVhYU285Rk9mbzRxSkRpQldBTXZWZG4vRk5PdU55TnVW?=
 =?utf-8?B?dzVOSFQ0ZE5lU0tING9ma3lmVHkxbmtXUTJBMFAzSWgyb3E4WWhrdFF0empP?=
 =?utf-8?B?WEt0N0NRNG81bGk2cDZZNzV5dUFXWGE1blRKMk1qcFZhTXJSemNlQ0hYcndj?=
 =?utf-8?Q?qmlgq/wUr9xTinxgk1DjPZQlW?=
Content-ID: <9D8C02FA433E1E44AA3265CB557079DF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efdfc36-bfdc-4ea4-9205-08da70517832
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 04:27:23.6338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hc5HHxlRhn55w8YcwaVsbDnvgiE1MeRde5fWp9U1zeNvJuFJmx5d0HqqEWxkuv0Y8pzqwWkobafligi78CZyV3vjl8mdL74PyJkGZXPsm9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1823
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_212732_171397_18F019FC 
X-CRM114-Status: GOOD (  11.90  )
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

Hi, Takahiro,

On 7/28/22 07:14, Tudor Ambarus wrote:
> We track in the core the internal address mode of the flash. Stop using
> hardcoded values for the number of bytes of address and use
> nor->addr_nbytes and nor->params->addr_mode_nbytes instead.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Would you please test this patch. You'll need an s25hx
and an s28hs512t flash. Thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
