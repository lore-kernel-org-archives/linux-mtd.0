Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C17C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 14:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXuIYGSwrrdD5+Yh0Nfowg6jEPCzdLaXDd27LYAPN44=; b=g7Xp74pgywK/7h
	M8H40EUYJCaUf1848Wt5OIuD2za/mPcXjK/AP0GIDYaUz+OAgWXnbaPtyA7ut4EUKW2wz+6r8g9pC
	IwtRVXKdZu3yKOgezYapf9BEal6tUaiBICySqE94QyQ8U7KXvq/Q6rLmsMWUPCzXGnc2cDg6UO6mU
	QsxH4HJoJqD3kkSaykB+H2ShpWSTK2xptI29l6mVGf7b6Z+2P1HxsRUV0h4dIZ6AI6HGzZ42fNsQ9
	R4PLidoV6Za9YpaaAMlgEC/7uWE4Z6ipndRmBJNiai9AH97bpucnFiCPbHSRFtRsUnjmqOPXDU60r
	4Tye8qd4QnOv2MIM/8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3ZJ-00FRt3-4L; Mon, 07 Nov 2022 14:57:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3Ky-00FJlr-6k
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 14:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667832175; x=1699368175;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f0vRH9d5fgc/JqiC4VzdgTBCE/yV/X3/uhWAw5iw6RY=;
  b=QezgpnMhhjGRUDhscxdoYbVVic+yD7rDQvu9V3nYXzKuR/LWvRMcu28o
   0y7mASKzBeAcXX4lCfsxMxbci7PPYZ231DXmZ8WImu4cT/i8hydHgfIBF
   yti5e4wq973hNcEvPtyysB89nEhr34jXtnE4x3kFOI2C6Jq/I1aTKs7Xl
   ySEdRtIMuzsFacTXyWfeRlwWIREkXd6bNPebRroTUp1q3xqAK0cZFav5C
   Oy17sS3zcbMbu3a8L3ixhZYLgXiht4CSWkCrPrymQMbPQYwp2sFW8Daty
   S0/Iy/AEEMm8AcRzBJkP/zjhfpyXrril4LUiJGwQvotDHUor0U94V9ZJl
   A==;
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="187991629"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Nov 2022 07:42:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 7 Nov 2022 07:42:52 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 7 Nov 2022 07:42:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPYgdA37cbiOQR9PI7hWksvaJUCn1PmkXT2YyfB5ps1AeEXJGmy21EUXchljBFbVDUEw89OSPXJ8PHwGrWjAyAnfAM8ozU2V+n0eqgRr/X4kVS22thKNvnyDLxDJ4+8klHqSIxW98FAp8scdpqNlAOWKnSBe9XIdlC1TuQnQI9GSo5tYyMQ24dOxN0WUkVafJaGcVGaoLuCS19OHen0A1BdW9gkHDHjgSa3r9Fc6xoI2XllXZ4T2f/OCmfmnucneCY3ZGgEFeVUPsiykM9iv025jS/rbVPQ5g7D9S2Tqzqok+mqNyEf/qVq1QRWx99DBFdl9J9VJAudQMiF/1C9NUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0vRH9d5fgc/JqiC4VzdgTBCE/yV/X3/uhWAw5iw6RY=;
 b=jS4KWkn9Ov43NwnEru/JANUpzVqqHQKPKLAQ4hsqZ5JkOPBSsUNKoC7fb/i8iGchBVGmxrmgDPfjdugR3H7srIQlRKY0IQgDlwueTt+865PsJakcU+mcJJFYFdvivGZLdEFJEcmD/WmHGvkbkY1YShCf0qTg0Ia3fMg5LJre1BJMWbJVqxqqhA4xjnQT8WA2OtljM0A6LFc/Xj808sXOetKiAroSQE+zE5pvmZIYhT7igNu1cBM1AsGWPIaC41PTSJvVNiUp2tZLjpqVYfEAPFUyC9k0X5pigHz08UEevgAkDpmwla0wdl+CcstMufyQUgbvdvx5QCS8J6r6cux2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0vRH9d5fgc/JqiC4VzdgTBCE/yV/X3/uhWAw5iw6RY=;
 b=UIeK/VfhuAgQUdNgSNMHOOrzN2eDpPV/H7j9hfenZ9NGLLKpsvIZAGAEXNVqIv+rSJ4WRRa106+ygfwsbbQhDaIXtFOqXBuFy4DlrCYz29gdOe61zFtqk/Wu8MN9QDgVx67iJb5KUpg4oOXzjkAqvpI63oBDyW6KFGEXmnCyeIg=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SJ0PR11MB4831.namprd11.prod.outlook.com (2603:10b6:a03:2d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 14:42:48 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 14:42:48 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <pratyush@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 6/7] mtd: spi-nor: add generic flash driver
Thread-Topic: [PATCH v2 6/7] mtd: spi-nor: add generic flash driver
Thread-Index: AQHY7c56iDTi1a3iJE2+xt2R4rtYtq4zkskA
Date: Mon, 7 Nov 2022 14:42:47 +0000
Message-ID: <62da3373-c8c9-1dc1-5938-d6bdc9fb2d84@microchip.com>
References: <20220810220654.1297699-1-michael@walle.cc>
 <20220810220654.1297699-7-michael@walle.cc>
 <848f22da-7f1b-ae93-99d3-65a5f31cb122@microchip.com>
In-Reply-To: <848f22da-7f1b-ae93-99d3-65a5f31cb122@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|SJ0PR11MB4831:EE_
x-ms-office365-filtering-correlation-id: b9eb95dd-712f-4583-3299-08dac0ce56e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HYmdkiSTIX2N3GZQXsY8EQ8Ri7VBSSYA2RZ09UeajQ4HhdtUQKDNTBk3vWugypEb+DqvsxOb9xt6UED/g3KMPG+16DaGfm7fipuyS/X6uscB+G+NDUCPRQ/t3mIs4uiSLyYFp3Z9JokHgENI2P4pX50OMirMN/difx6oKrhEw+D2Sx0BULh7wtul8yejG0RzMawa4F8f5ltemzsJ4Ul/5v+uX/ZCkKruVSTRcKOPo8TY7HEbm8P5FOyAPAaJqtRltN0+GZzru9ps0sLSGfD9LzKoaHbAIZ1FDYNLEYfN+GMtrZe3QQSADPG37hpTekCJnxu3vrA6nzYmNh+qNWTwt1hwpGOB1LK0Dl13HINb9+SmJFXNFujtei+WhlfZ38tAj92Uzc7iKdBia/FNR/tRmw540yTFD0FxkDPYrqp1puHPfH1eMqzEq52Bln63XaV9TvcCt+nbWLKw2L6/uh8cOLfphVfB+I2UaC5zsg6QmHSZydO04roKeBDQzKRTfC27+fWzAFSTpuOpy0SzRPI2IvchWQXLNKXGJqnGOE4jF0gKc3cgy4//aDIVpsq6dkSUv6eQePfDr1WkuJe9ZKmZ1yEYd7uR/UM/9XDT5VEVPnVowMx/CCLm2Yssiw03GwP825yqwlKE4Gn5S4tGAcJEcGJLXGJQSKTUKZswytiwzfDFY99hJ79+cI3jPoY4Bz3ZzmEiw114CxqWOJCGoKQ5Nsac1yaXuGipHc3/pLpaM362W2vIY+qxlue/lYy7Fv47/WqFF/X/JHYcoH0p7Trz1BSFeuBifIa77RvBpNXrsUaVhyP0ltsdB/Y+zmOLu2QOplAZ2dHw9WKOO+8g6JV7ouUN3A4/a9dtopal8jIoROM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(31686004)(71200400001)(6486002)(54906003)(110136005)(316002)(6506007)(86362001)(31696002)(53546011)(76116006)(66946007)(66476007)(64756008)(8676002)(66556008)(66446008)(4326008)(478600001)(91956017)(38100700002)(122000001)(26005)(6512007)(41300700001)(186003)(2906002)(36756003)(38070700005)(8936002)(5660300002)(4744005)(2616005)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm1RTDhFMmo2S2F3QWdOT3pSUDVnVWdRVnFBd3FBWFFHM2pTMHYwTzVGNXRl?=
 =?utf-8?B?T1ZraUNhOXU1Mmk0aFJydzdVdUFtUWdKRUpKYWs5UTZnRVd6Zzk4YXdSMk44?=
 =?utf-8?B?bDRuQVlob2ZFNDROYzZ0M1YzTUpNK0htUHZqNis1VDBpZzgveWpsLy9mNTNT?=
 =?utf-8?B?bjdKV0xORW1PanRqOWpNdExQK1hVWmVwYk9wWnFXWDRnYVoxb1VOZjdTNmpz?=
 =?utf-8?B?SVd4VWgxdmRPMFRqMzFPZWxHbXhlY1VUazROcFZnK1M2WnE4N1RmNks4Y25t?=
 =?utf-8?B?bmt2UTVtZWRUSC9WampsZHBCd1pnTS9sM254UjgvcDNPSzJCQzVmanhDQ3VP?=
 =?utf-8?B?ZVNrangvVGM1Z0Z4R2RROUtzZVNZeFU5OHpoSGV0a200THRlS3Vzb2lVUklL?=
 =?utf-8?B?bm1jMEVjWk9OSlF4ckk1a3JhcGR3dENweG5HVElKN3VvTHBnR1NTL0VvK0pT?=
 =?utf-8?B?ZkNES1plMUo0Qlh6aGlIUTBDdUxOSXk1OUpLWTF5eGc5RTZIaE5nUDZjNXg1?=
 =?utf-8?B?dkhlcVFXaHFKWTJwUTJ4OXpGeThGdzdwUkR3MzJTengwNVZkbHVJUzZ6ajZN?=
 =?utf-8?B?WlExcGRMdmFQNlpyeXMwVVB6VWUwT0wxZEVjd2dMLzNOU2kzOVN3aE1hd2N1?=
 =?utf-8?B?YWhSYW1qcXB4VnJxOWM4QVhoaWgvbzFkTm1QMG9vWWwzaisvbUxlampxRHBX?=
 =?utf-8?B?MTg5U3NocFN3SG1NOWo5T0xWdGM3UUdNT1VKWXVWTTZaN3JhTHZFcXFranEr?=
 =?utf-8?B?MTgzemFwWnhEQ25qTU9FK08wcXNrZFVvK2VhMml0VzlHQmpjckRrdm52WFhz?=
 =?utf-8?B?NTdVMFo4V2lvakczcEJZaDFtQkVhcTZhWHNuMnNabjZTOFpCSHF5YzREWms3?=
 =?utf-8?B?Y3Y2blc2MXdqTk55T3JEQ3V3WG1Edlh5bkZzZmlIZmNmaG1CODR6MkQzVVE5?=
 =?utf-8?B?VEkyNmM1K3p6QlI4N1pUL1c4c2MzbzVmV1lLdUZOMExDbUo4Y2lPQVo2cWRG?=
 =?utf-8?B?VytrRkZMU3dHY2pNbjVVK1Z5Zk5Lb1FNQjB0VlRQeE1jTU8wUTNNa0hxNkNl?=
 =?utf-8?B?akowYWI2MndraGZzaGFWSDVnT2hhZEQveVk0bTJnTDRybWhybDZiYnZEK0RD?=
 =?utf-8?B?YTVsUWppa3paSWYveWl4cVJ0djdHeEJ3MGdFTGQwRjRLdllZTFF3TkxYdGtx?=
 =?utf-8?B?b3BEREZ4b2pyZ3NVd2VzNFljdHhFYmxmR3ZBMnZKWHljc3crN1M4ME9zK1kx?=
 =?utf-8?B?YVFUWVl3MXlzNFNaMGV3cndkQUIydyt1R1Y1UkRiMG5neVpQc3FhSDJ5SkJM?=
 =?utf-8?B?eEVWNlVDMFpGQWNLUEJKTWk4c3BXcHVvc21GcFJpRFljamt1aXB6V0ZyVENC?=
 =?utf-8?B?aDZaVXpwR3RlWVh6SDBXRWJPZWpCVk1pU0pwMFkvL3NIRmNwTWptT0RWVVl5?=
 =?utf-8?B?enFPNitkSEx3OE1Ick80MTlpTktFZjhLRVRHNVFkQ3MwcUNVbThzNUx5aGdq?=
 =?utf-8?B?bjFWRk1SSXkzTDE5cmNHMzN2Q0dZcjVaYXEzR0wvNUZIRlNpWGhpOHNobFFY?=
 =?utf-8?B?aDc2S2NQUGpkNTZMQjRjSlphTkdKTFFnc0krbkt4UEVCSFZtVW1XNGtIZ0px?=
 =?utf-8?B?blFQd2kvdzZKbnBaQVlMMHRwU01MSUhtLzc2dmdCZTRFTy91eE9jMFd6NFY1?=
 =?utf-8?B?aThCd085cFIyQXozR2tZeHh1dExEaFE4blJhQWdFcmJJZStjY3FwTHYrbUJN?=
 =?utf-8?B?MWM0clVOQWNRNldIUkwxdkUzSk11QTVwOHAxMU9kYmN6Uis1TG9kRWpHQ1BP?=
 =?utf-8?B?SHFHZ1hLWmdHQ0tBdlRkcE01Ui82YXJSMlF4SUN0cktjQnRTT3pjQkRVblFC?=
 =?utf-8?B?VE4vRk9seFhIYXRmNXNsUXdxMnorcTAycGY5VzNLYVRtWE9qTCtBNS9ycUV6?=
 =?utf-8?B?VlJCREZtRmc4NXpUOEhGM3QxL1FZcFAydjRvdHQxWk1kN0NBYUE1VU1OQzJv?=
 =?utf-8?B?TmVpcWtmNndiNyt1Rk5MdzJsNTRVU0tYRVV0VVRJZmdlWGVTaHR4dEVTUmJa?=
 =?utf-8?B?a2UwbU1sNjQvd2x1bDNDMzdWeExtN01hbEhFZENCOU9lSmZuNUdSSzJKR3ht?=
 =?utf-8?B?NkxMaE9uZ0VQZk5qcUV5YWQvb3FrREFkc1RIam1BcktuUDJYNXEyYXBDdW14?=
 =?utf-8?B?a0E9PQ==?=
Content-ID: <7BEFD8A87C9A494B85F9591E9BA029C0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9eb95dd-712f-4583-3299-08dac0ce56e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 14:42:47.9953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zurSUFAlNOH5GDC1MUW6ut50nWCiwercSVPnXQhaCFXOHzGDU1G3NMVuZ3RP+nyRrRFcTXJGKpohsxSg1bM2yx3zVGCddW1sEIsNuLcrPXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_064256_490522_4D7C7E6B 
X-CRM114-Status: GOOD (  12.77  )
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

On 11/1/22 10:46, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 8/11/22 01:06, Michael Walle wrote:
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1632,6 +1632,16 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>>         &spi_nor_xmc,
>>  };
>>
>> +static const struct flash_info spi_nor_generic_flash = {
>> +       .name = "spi-nor-generic",
> 
> How about "jedec,spi-nor" instead? The series looks good, I intend to test it
> and apply it soon.
> 

Pratyush, do you agree with the change proposed, s/spi-nor-generic/jedec,spi-nor.
Michael seems busy and I'd like to progress with this.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
