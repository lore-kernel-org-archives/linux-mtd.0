Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F406C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jelEeMWsAggw380Y1tk29ySNgvZSXxCtUll32rKiR5I=; b=VEB4b4te9EWs6H
	WcU9EzNqbARNsb9miEcZAI/daQ0lZf96Z8eGpS49O43c7IMwRjuiRdhfNFeWvKyFtLGXU7JKzjwZj
	9pGb2I85Sc7lZc6fli5Ybp3GkpJ2sv1m45gQUr6absppXPK8inaZx+VY6DfwmSIm6h6MoOHZp/vKO
	C8vFR1kCwIaApzNJS6QALdcomTbdIaaGDc5ScvNljl4r9CyKmuAMwK2/3UbAt0/aYC7Lf96fSzcCL
	Pzcq7DAwOe7S19qARW7brv084Ue8ssZ5I/THuAkLJtZbTyvc0qE7db9j4uVfOk4jSivq4RQqZpKHE
	05JmZeMAiEXXn2T+/04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnwN-0071db-Ci; Thu, 03 Mar 2022 16:04:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnvH-0071BE-9g; Thu, 03 Mar 2022 16:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646323403; x=1677859403;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=W+xmJ1BY/WVOa1Lb8IqvFLDnHn2bskAgBP0rZKBhGdo=;
 b=mbDAsRN8EIlNzVgGMsEv9gC1pIxZElJ3oI5MdMnwhTCWbmbnAoWRG/Oa
 uOwd1+JesVmo4FAQ3S3nJ7K26Sf/4+TEUWgd1lYF7gSeZnReqXkDXjH+f
 2MnmT4DpkxVEWCISs4x7gOCNmphvtxZwt0TCMBw9AagJUbjjBFcv7ncmx
 TyoB00x5iyRUkdWrjuH3Ed0rbJUc4XniZsIUtVITpiCvOSwEbAkArnLjB
 NZw+fy/I2DsjGAWLcNF7NadjXSGt8v7chpWH7a9i24qqXQVW7tYWEE339
 EkkM/8uVRQlb4B1Wm1ckyERKUmH4jQ51Navo0B/dZ1bhDWpUbCbFemIgv g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643698800"; d="scan'208";a="150741653"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Mar 2022 09:03:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 09:03:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 3 Mar 2022 09:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWa/hN6EQIGZhf1d9mhdrtE305eBp5zTuFt2nxpE2fObyWT+HBDaTAMTvnxF6Ux2ERYmNaXKa7nU28Vrw8YU6y/tOunCykSjL7bEMlYQ/r0h2XYhDLTez4zB2bgL4UUru/vmxObojpAjjG+w2hiuzg0EfMbf1lWUW3KrhZb7NPcmurGODzu6jhT5WOmxfeisVY6yG+doaeUPEOgcMEustI0LHPwzAy395z4eHx+OcpX9Sy8g1KmvFcoygnyPZK0aiukrd7c4cXf3uBRC6xOYfCQ1R63Be5emLGxpn5SjGqh60okzs5vSbwSGKx49kznwuYmyZP8hltvOaDywUYFFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+xmJ1BY/WVOa1Lb8IqvFLDnHn2bskAgBP0rZKBhGdo=;
 b=fBi3C1mLHHu3tZyD3XhudEvg41uPnaiYPDLWWfOWuJMhxDcKrYTXgVgN5Lq60b32XAF1t+vTt+fP5V6naP7kiMvFiWr2bGpg82ZMrhcA6JMs6WGa6KsD2G28Iw5lNa66AAhxtp1+/LwTzo06P5pCQ7uWdOn4hIv3mxHE06tHvmkvLxTl0CE6D1Fo2adupbcR16Io4Z+eyxcAyhS5lkhkFx4IePyYKPuqhG+88+rSJgCzv1qoamJ4Euckv4zl0dLjqPwncF9eou4pCqSoYl66R0JdVZiK6XiUBiZ7SJDReRHuXqT4VtHP4dhj2LxtcYKKXaOcx6Hktfw3HWSbB/v4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+xmJ1BY/WVOa1Lb8IqvFLDnHn2bskAgBP0rZKBhGdo=;
 b=hyn/h80o4kmie7fQafzkyoDLIhIKzgHN8WTJ6WbIjOvwDgOAbEIouhZ/Ul0lAYq9f6wiTgexHR+fttHcnPOSG+ipJUCLfzmbrFEJPo6AR+5exnkQOVZCxdxLdR9+SHasoIf5y8AQmMyQiBXsmBHJwywsit/GWuNDNBMyAG6UeYg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:95::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:03:16 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 16:03:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
Thread-Topic: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
Thread-Index: AQHYLwzDoxYnBZmIwk+F+eeBkmeouA==
Date: Thu, 3 Mar 2022 16:03:16 +0000
Message-ID: <239af41b-6f60-f7c6-3523-40f9e333c9db@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-3-tudor.ambarus@microchip.com>
 <328762851786f1158505f9159ba3e5bc@walle.cc>
 <72679fc7-42e4-d7b8-1fb9-463f225217fc@microchip.com>
 <9ef79f480651777e0da4309a039070d0@walle.cc>
 <8c1b9274-ea45-6a79-b7a0-7674ef60ab80@microchip.com>
 <2df0febdcda22a1cfa13c091238c2e2c@walle.cc>
In-Reply-To: <2df0febdcda22a1cfa13c091238c2e2c@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46f14bc3-3e9e-4bcb-2609-08d9fd2f5404
x-ms-traffictypediagnostic: CO1PR11MB5185:EE_
x-microsoft-antispam-prvs: <CO1PR11MB518561976B413EE2BDA45595F0049@CO1PR11MB5185.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fedzNRkfRtZkjyOkznfzUNOHSnazcXN7T3PWqYOgscMo2bqsnts8EIbn3UPneW5YgSiUVgyCPsFr2voaCIAeHosqks6D0EI7XMdlhIEUyigpC+uL2PJZiZGbGY9XXHmLybN5FIh3Q1D8lYnjf+/Nk16b3yyLRq0MESIUjACGO5e8fq9tIBmU2VH6EhZ7xtN3nerr7d3sHV+LkcA57QmdM0BPiauoVMmeEzrhzEB1wZJ3227HtHfSr/chjiZ36OVfhP1Tv0Q0xrrOhUfu+AKqKrr9iLt9oOnKtrSaNK9wAvU+a7u7Gn5UQuZNKVYueo8+XR/2fzkxehkNra13Wuy6zu3ytY1X5oDUHGIr69SmE4CVfS3Z4a5m2rzMvhwPrIVC0AtHv7caWx2UaLj2wVLtJXPNS6JhtcbJOXJYhII7caS0ydJBAHatWANT0Ok/9yaniTWhDktJVm9QBFCXs1lt+8Gmpjdg1EYLB0Q9qd/hNEhFRhOWcECVY1hhKQC0u4YDqzblYXNLdVkRxJ2LuOPpcgVaf3BfPgerG2XG5IKB/Vw1cgb1NwVotnOac2A3WDikZN9dVifLmW2131UKPHqZ+c3Tg26z0euachRMl56t20/h1673PBZ3ReQi9ZuNUISnehU/Y1APITijJpag8sc1lU4q3iJJzJ6zIPhJ91a4rjiocsD/X6C7nNXlbicM21m/kIqj+RfN8oCqjWyykw4O0DetTORsn/oJmlVzGFYHLn4vO9IQOiRoaPFUtc/gNTiUGHG028X2ilkhf1GXRWz6eA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(86362001)(6916009)(54906003)(8936002)(26005)(186003)(6506007)(6486002)(31696002)(53546011)(91956017)(316002)(36756003)(83380400001)(2616005)(5660300002)(76116006)(2906002)(66556008)(66946007)(107886003)(64756008)(7416002)(66446008)(66476007)(8676002)(4326008)(508600001)(38070700005)(38100700002)(71200400001)(122000001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0h3QTNQVlNGZFcxbnNGcjAyRjRhQUg0Q3RBUmd0eHM4SDl4TUl1ZE8rNDBF?=
 =?utf-8?B?WldCM3RFaDRMdkhVZWNNRDlPN3RiSXBrNitKT0VmK1VoSnJmdFh5NEx3QkY4?=
 =?utf-8?B?ZEFWSW1yKy82TUJNN3JoMzh5Yllyd0ZpeVdFQndZS1RnRERkRjRsYVFNSG9N?=
 =?utf-8?B?YlNDK0FNeXJ0Njl6Rzd6Z0FnR0VEUXNoK2RkRlZtellJUG9ULzY1QWswVVZP?=
 =?utf-8?B?d1lSNzBWa3NRTkU3eTFnVkRQdDE1ZnBpdjJ3bXB0R2sxY3VtK0t1bW1va0tt?=
 =?utf-8?B?TDFGcU5kenRjVEZmZHpjTDdmUXhYRk5NRER4MWt6dVhwdG10d1g0ckRWbGt1?=
 =?utf-8?B?c1IrR1NrRGM3R2NFaE9sZ05xcGJ3QTZHUWpmVkxPb3R5R0VGRXBOcHVXL2JJ?=
 =?utf-8?B?M0dGN3RUV0kvUit3YW5Kczk4YnduNjMyOWNqbkxhY3pNZ1hTVThzckRmK3BO?=
 =?utf-8?B?TTQ3ZnNONVkwY0h5bVJDTDdCWTZhMHQ0dTRIeGQ1UXB0Ni9UNUp1K3JXcnpF?=
 =?utf-8?B?RDMxK0lRSkE5amE5dldydHF4V1ArbDhRa1pubWFrL0RqS0N1dWZHWkVIdlZj?=
 =?utf-8?B?bWJBSWNJY2pjTE5acnRET1VEV1hsRTR0ZkJLT2FZM1k3NnpYSDhpOG52M0Jp?=
 =?utf-8?B?SXlhZTNQbllTTUxFTDlHVStzUVNySUJTeC9ZVnk2T1lFVU03V0JPMEY1elFD?=
 =?utf-8?B?Z0IwN2lyK2poMGwwK2k1dXprNWp5dG1FdXlRMndPVkVad2VBVG94ZU03OUZH?=
 =?utf-8?B?b3V3cWxXZmZUYkpCeHd5YkxZSTBRaGUvQTdlS1RrZE5Na1R4UFBJN1pydXRw?=
 =?utf-8?B?eWhOM0JyS1MvV0lVbk9mMHRIRmdlclkwZGl5UzdWQnIzMGZCQlRvYytjZldJ?=
 =?utf-8?B?VTc5WVlmTEowbzJOT0p0N1J6Wi8wMDlFSjJybW9YTnlUM1hyUFNxNWRraXB2?=
 =?utf-8?B?NWE2dXYxWDZjWWtPR3ExcTZLR0YyYlJRUEx2bURPNy8zNHN2QkVoS3BtTG9H?=
 =?utf-8?B?Sk5YSzBwMWV1RXMxUFY3d00yTjArRkJCMnc4RitNQ2FrSERES2dkV2JiaEZE?=
 =?utf-8?B?Z2UwSmY1eVM2ZWxiNnN1ZEY4QXg3YTFFRzhVVXVCYW10Uy8xS3VGMG0yKys4?=
 =?utf-8?B?SXNucEVUNFB3STZPUzlGeXVVZjc3cTFKall6ZVhBS0pXMElEK1lJaTNmcG9p?=
 =?utf-8?B?ZkdjTzVrK1FsWG40NUkvMXBuZzAxZVJRV3VkTklDUGFVM1ZwQ1lmNm1ralY3?=
 =?utf-8?B?UVpLdkwwcEQvVnJyNHg1ZnZXQVV2ZkRVR05JYW8yS2N1RlZyY1llNzh2WUFI?=
 =?utf-8?B?U2VveW9wWEFXV1BkL0ttN3JjSWJUK0dOVy9KYkRQR25UK3ZOclFQenFKV1FY?=
 =?utf-8?B?SW9wZ1I3VzA3NEd4V3B4aWpNaFEzZjlTMXM1MmNJTWo0dUVkNHFKTUpjM3ZH?=
 =?utf-8?B?WGVQKzlwVXVWUGpSc3J1RVYzeStUd1Via2hyR3dReFAwVG55eGxEZFphNnd4?=
 =?utf-8?B?MkZ1Q0h1aFJkUE9pTEVlZHNIbFhhZnV0RWtYNDlNY2UyQ3N3QWJhd0ljbmwv?=
 =?utf-8?B?Q0lWRGVQeXVSMXNxU0Q5a21yNjc1VVNuS3p4eWtNeVVTVXpONTNlak15WW1a?=
 =?utf-8?B?dDZnZ3kvMGk4d0ZFRXdJVEU1L3A4RDZqbkRYUTk2WFNKd1drbHNrU045dW5H?=
 =?utf-8?B?OFpNa3pqYWE2QjkxT1NpRnV0ckNBTEhRYkx5N1pRMzlNVEN0czBpd1BHbDBx?=
 =?utf-8?B?WDIxUkFTMGxRVEhrZkYycEpUS1ZuM2FnV2I0TVZSMVFVcGtGa21UaU4rVFpv?=
 =?utf-8?B?UVNldm5aZGQ5bWpGenJrYk1zQWpLZnNEQ0g3Kyt3VzdoRUJ3UTVzZXhvV29x?=
 =?utf-8?B?UW1pU2Q2S3pWNkpzNGI0UkNGS09kTHdLaXBzeSs0SlhkRk5jNUlvVUdZV1Rn?=
 =?utf-8?B?WWxBRGxIVm8wNlNrSGVWdFdqbzZTaC9WcTV4VUxiMHZCaE9tRmNvMDlycHVY?=
 =?utf-8?B?a2ZKYy81d1NvYkJ0cGNHcFVxT3ZidjBCK3VkUktDZUFReDhZWWdDZkNXY2Fl?=
 =?utf-8?B?cENnR0NPZ08wcllTVzhpcWZodFRZUEI3bndyQkRDdTRCRXc5UDQwcjRCSkZB?=
 =?utf-8?B?VTU2emM5WmI1NGxVbnFTMnI3WXZFSUw3Skt5UW1QVDVPNFpwZTY5RjdtYVRt?=
 =?utf-8?B?R1ZwRUN4dExaTXlWZFBUMXZ5RmpoYk9CNTNXU1R3NjA1eGM3dFJLT0pyMHdl?=
 =?utf-8?B?aTRiM3VtQWFkTFVLc3gwTktwNG9nPT0=?=
Content-ID: <1557D06F4E355A4280B91052AE1FDBA2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f14bc3-3e9e-4bcb-2609-08d9fd2f5404
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 16:03:16.3234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/TlD8adKA2N1hA6xg3cPI80jCEXtRS0FxwmPvFsL/bsiALwzL/8yrpzcWptJEDxVAGTE2XKM/9Ho6j/0EiLBIdLzXHNiLfQ720jV2JOEqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_080323_497722_35F51C95 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8zLzIyIDE3OjQyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDMtMDMgMTY6MjUsIHNjaHJpZWIgVHVk
b3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOg0KPj4gT24gMy8zLzIyIDE2OjUxLCBNaWNoYWVsIFdh
bGxlIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cNCj4+PiB0aGUgY29udGVudCBpcyBzYWZlDQo+
Pj4NCj4+PiBBbSAyMDIyLTAzLTAzIDE1OjQxLCBzY2hyaWViIFR1ZG9yLkFtYmFydXNAbWljcm9j
aGlwLmNvbToNCj4+Pj4gT24gMy8xLzIyIDIzOjUyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPj4+
Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3UNCj4+Pj4+IGtub3cNCj4+Pj4+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pj4+
DQo+Pj4+PiBBbSAyMDIyLTAyLTI4IDE0OjQ1LCBzY2hyaWViIFR1ZG9yIEFtYmFydXM6DQo+Pj4+
Pj4gQSB0eXBpY2FsIGRpZmZlcmVudGlhdG9yIGJldHdlZW4gZmxhc2hlcyB3aG9zZSBJRCBjb2xs
aWRlIGlzDQo+Pj4+Pj4gd2hldGhlcg0KPj4+Pj4+IHRoZXkNCj4+Pj4+PiBzdXBwb3J0IFNGRFAg
b3Igbm90LiBGb3Igc3VjaCBhIGNvbGxpc2lvbiB0aGVyZSB3aWxsIGJlIGEgc2luZ2xlDQo+Pj4+
Pj4gZmxhc2hfaW5mbyBlbnRyeSB3aGVyZSB0aGUgZGV2ZWxvcGVyIHNob3VsZCBzcGVjaWZ5Og0K
Pj4+Pj4+IDEvIFBBUlNFX1NGRFAgLSBzbyB0aGF0IHRoZSBmbGFzaCB0aGF0IHN1cHBvcnRzIFNG
RFAgdG8gaW5pdGlhbGl6ZQ0KPj4+Pj4+IGl0cw0KPj4+Pj4+IMKgwqAgcGFyYW1ldGVycyBieSBw
YXJzaW5nIHRoZSBTRkRQIHRhYmxlcw0KPj4+Pj4+IDIvIGFueSBvZiB0aGUgbm9fc2ZkcF9mbGFn
cyBsZXNzIFNQSV9OT1JfU0tJUF9TRkRQLCB0byBpbml0aWFsaXplDQo+Pj4+Pj4gdGhlDQo+Pj4+
Pj4gwqDCoCBmbGFzaCBwYXJhbWV0ZXJzIHZpYSB0aGUgc3RhdGljIG5vX3NmZHBfZmxhZ3MgZm9y
IHRoZSBmbGFzaCB0aGF0DQo+Pj4+Pj4gwqDCoCBkb2Vzbid0IHN1cHBvcnQgU0ZEUC4NCj4+Pj4+
PiBVc2UgdGhlIGxvZ2ljIHRoZSBhYm92ZSB0byBoYW5kbGUgSUQgY29sbGlzaW9ucyBiZXR3ZWVu
IFNGRFAgJg0KPj4+Pj4+IG5vbi1TRkRQDQo+Pj4+Pj4gZmxhc2hlcy4NCj4+Pj4+Pg0KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNv
bT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgMTMg
KysrKysrKysrKystLQ0KPj4+Pj4+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMNCj4+Pj4+PiBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+Pj4+
Pj4gaW5kZXggZmJmMzI3OGJhMjlhLi5hZWYwMDE1MWMxMTYgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYw0KPj4+Pj4+IEBAIC0yNjM5LDggKzI2MzksMTcgQEAgc3RhdGljIGludCBzcGlf
bm9yX2luaXRfcGFyYW1zKHN0cnVjdA0KPj4+Pj4+IHNwaV9ub3INCj4+Pj4+PiAqbm9yKQ0KPj4+
Pj4+IMKgwqDCoMKgwqAgaWYgKG5vci0+aW5mby0+cGFyc2Vfc2ZkcCkgew0KPj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHNwaV9ub3JfcGFyc2Vfc2ZkcChub3IpOw0KPj4+
Pj4NCj4+Pj4+IENhbiB3ZSByZXR1cm4gLUVOT0VOVCBoZXJlIGlmIHNmZHAgaXNuJ3Qgc3VwcG9y
dGVkLCBzbyB3ZQ0KPj4+Pj4gY2FuIGRpZmZlcmVudGlhdGUgYmV0d2VlbiAibm8gc2ZkcCBwcmVz
ZW50IiBhbmQgb3RoZXIgZXJyb3JzPw0KPj4+Pg0KPj4+PiBJJ2xsIHRha2UgYSBsb29rLg0KPj4+
Pg0KPj4+Pj4NCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KSB7DQo+
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihu
b3ItPmRldiwgIkJGUFQgcGFyc2luZyBmYWlsZWQuDQo+Pj4+Pj4gUGxlYXNlDQo+Pj4+Pj4gY29u
c2lkZXIgdXNpbmcNCj4+Pj4+PiBTUElfTk9SX1NLSVBfU0ZEUCB3aGVuIGRlY2xhcmluZyB0aGUg
Zmxhc2hcbiIpOw0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLyoNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogSGFuZGxlIElEIGNvbGxpc2lvbnMgYmV0d2VlbiBmbGFzaGVzIHRoYXQNCj4+Pj4+
PiBzdXBwb3J0DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIFNGRFAgYW5kIGZsYXNoZXMgdGhhdCBkb24ndC4gSW5pdGlhbGl6ZQ0KPj4+Pj4+IHBh
cmFtZXRlcnMNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogZm9yIHRoZSBmbGFzaCB0aGF0IGRvZXNuJ3Qgc3VwcG9ydCBTRkRQLg0KPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobm9yLT5pbmZvLT5ub19z
ZmRwX2ZsYWdzICYNCj4+Pj4+PiB+U1BJX05PUl9TS0lQX1NGRFApIHsNCj4+Pj4+DQo+Pj4+PiBT
aG91bGRuJ3QgdGhpcyBiZQ0KPj4+Pj4gaWYgKCEobm9yLT5pbmZvLT5ub19zZmRwX2ZsYWdzICYg
U1BJX05PUl9TS0lQX1NGRFApKQ0KPj4+DQo+Pj4gQWhoIEkgbWlzcmVhZCB0aGF0IGZvciB0aGUg
InNraXAgbm8gc2Z0cCBoYW5kbGluZyIuIEJ1dCBkb2Vzbid0IHJlbmRlcg0KPj4+IG15IHBvaW50
IGJlbG93IGludmFsaWQuDQo+Pj4NCj4+Pj4gTm8sIGJlY2F1c2UgdGhpcyB3aWxsIGJlIHRydWUg
d2hlbiBub19zZmRwX2ZsYWdzIGlzIHplcm8sIGFuZCB0aGUNCj4+Pj4gbWV0aG9kDQo+Pj4+IGZy
b20gYmVsb3cgd2lsbCBiZSBjYWxsZWQuIEkgd291bGQgbGlrZSB0byBjYWxsIGl0IHdoZW4gYW55
IG9mIHRoZQ0KPj4+PiBub19zZmRwX2ZsYWdzIGFyZSBkZWZpbmVkLCBsZXNzIHRoZSBTUElfTk9S
X1NLSVBfU0ZEUCBmbGFnLg0KPj4+DQo+Pj4gWW91IHNob3VsZCBhZGQgYSBjb21tZW50IHRoZW4u
DQo+Pj4NCj4+Pj4gU28gd2hlbiBvbmUNCj4+Pj4gZGVjbGFyZXMgYSBmbGFzaCBsaWtlOg0KPj4+
PiArwqDCoMKgwqDCoCB7ICJteDI1bDMyMDVkIizCoCBJTkZPKDB4YzIyMDE2LCAwLCA2NCAqIDEw
MjQswqAgNjQpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSUQgY29sbGlzaW9u
IHdpdGggbXgyNWwzMjMzZi4gKi8NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQVJT
RV9TRkRQDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTk9fU0ZEUF9GTEFHUyhTRUNU
XzRLKQ0KPj4+DQo+Pj4gQnV0IHdoYXQgYWJvdXQNCj4+PiArwqDCoMKgwqDCoCB7ICJkaWZmZXJl
bnRmbGFzaCIswqAgSU5GTygweGMyMjAxNiwgMCwgNjQgKiAxMDI0LMKgIDY0KQ0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSUQgY29sbGlzaW9uIHdpdGggbXgyNWwzMjMzZi4gKi8N
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBBUlNFX1NGRFANCj4+Pg0KPj4+IFRoYXRz
IGFsc28gdmFsaWQsIG5vPyBXaHkgaXMgaGF2aW5nIDRrIHNlY3RvcnMgc3BlY2lhbD8gRldJVywg
dGhlDQo+Pg0KPj4gbm8sIGJlY2F1c2UganVzdCB0aGUgZmlyc3QgZW50cnkgd2l0aCB0aGUgMHhj
MjIwMTYgSUQgd2lsbCBiZSBoaXQsIHRoZQ0KPj4gc2Vjb25kIG9uZSB3aWxsIGJlIGlnbm9yZWQu
IFdlIHVzZSBhIHNpbmdsZSBmbGFzaCBlbnRyeSBmb3IgYWxsIHRoZQ0KPj4gZmxhc2hlcyB0aGF0
IGNvbGxpZGUuDQo+IA0KPiBOb3QgaW4gYWRkaXRpb24gYnV0IGluc3RlYWQgb2YgeW91cnMsIG9m
IGNvdXJzZS4NCj4gDQo+PiBQQVJTRV9TRkRQIHRvZ2V0aGVyIHdpdGggYW55IG9mIHRoZToNCj4+
ICNkZWZpbmUgU0VDVF80S8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBCSVQoMSkNCj4+ICNkZWZpbmUgU0VDVF80S19QTUPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJJVCgyKQ0KPj4gI2RlZmluZSBTUElfTk9SX0RVQUxfUkVB
RMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDMpDQo+PiAjZGVmaW5lIFNQSV9OT1Jf
UVVBRF9SRUFEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoNCkNCj4+ICNkZWZpbmUg
U1BJX05PUl9PQ1RBTF9SRUFEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDUpDQo+PiAj
ZGVmaW5lIFNQSV9OT1JfT0NUQUxfRFRSX1JFQUTCoMKgwqDCoMKgwqDCoMKgwqAgQklUKDYpDQo+
PiAjZGVmaW5lIFNQSV9OT1JfT0NUQUxfRFRSX1BQwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCSVQo
NykNCj4+DQo+PiBzdWdnZXN0cyB0aGF0IHdlJ2QgbGlrZSB0byBkaWZmZXJlbnRpYXRlIGJldHdl
ZW4gYSBmbGFzaCB0aGF0IHN1cHBvcnRzDQo+PiBTRkRQIGFuZCBjYW4gZGlzY292ZXIgaXRzIHBh
cmFtcyB2aWEgU0ZEUCAobm9fc2ZkcF9mbGFncyB3aWxsIGJlDQo+PiBpZ25vcmVkKSwNCj4+IGFu
ZCBhIGZsYXNoIHRoYXQgZG9lc24ndCBzdXBwb3J0IFNGRFAgYW5kIGl0J3MgZm9yY2VkIHRvIGlu
aXRpYWxpemUgdGhlDQo+PiBwYXJhbXMgdmlhIHRoZSBub19zZmRwX2ZsYWdzLg0KPiANCj4gSSBn
ZXQgdGhhdCwgYnV0IHdoYXQgaWYgSSBoYXZlIGEgZmxhc2gsIHdoaWNoIGRvZXNuJ3QgaGF2ZSA0
aw0KPiBzZWN0b3JzIGJ1dCBvcmRpbmFyeSA2NGsgc2VjdG9ycyAodG8gc3RpY2sgdG8geW91ciBl
eGFtcGxlKS4gSW4NCj4gZ2VuZXJhbCwgd2hhdCBpZiBJIGhhdmUgYSBmbGFzaCB3aGVyZSBub25l
IG9mIHRoZSBhYm92ZSBmbGFncw0KPiBhcmUgc2V0LiBZb3Ugb25seSBjYWxsIHRoYXQgZnVuY3Rp
b24gaWYgdGhlcmUgYXJlIGFueSBub19zZmRwIGZsYWdzDQo+IHNldCwgYnV0IHRoZXkgYXJlIGFs
bCBvcHRpb25hbCwgbm8/IFdobyBpcyBzZXR0aW5nIHRoZSBlcmFzZSBvcGNvZGUNCj4gZm9yIGZs
YXNoZXMgd2l0aCB0aGF0IElEIGJ1dCB3aXRob3V0IFNGRFAsIHRoZW4/DQoNCnRoaXMgdXNlIGNh
c2UgaXMgbm90IGhhbmRsZWQgaW4gdGhpcyBwcm9wb3NhbCwgaW5kZWVkLiBJJ20gbm90IHN1cmUN
CmlmIHRoZXJlIGFyZSBzdWNoIGZsYXNoZXMgdGhvdWdoLiBDYW4ndCB0aGluayBvZiBhbiBleGFt
cGxlLiBXZSBzZWFyY2gNCmZvciBhIGZsYXNoIHRoYXQgb3BlcmF0ZXMgb25seSBpbiAxLTEtMSBh
bmQgY2FuJ3QgZG8gNGsgZXJhc2UuDQpJcyB0aGF0IGEgTk9SPyBCdXQgaWYgeW91IGZlZWwgd2Ug
c2hvdWxkIGNhcmUgYWJvdXQgdGhpcyBjYXNlIHRvbywNCkknbGwgYWRkcmVzcyBpdCwgcHJvYmFi
bHkgSSB3aWxsIGJlIGZvcmNlZCB0byBpbnRyb2R1Y2UgYSBuZXcgZmxhZyBvcg0KYSBib29sLCBt
ZWguDQoNCj4gDQo+Pj4gZnVuY3Rpb24gbm90IG9ubHkgaGFuZGxlcyBub19zZmRwX2ZsYWdzIGJ1
dCBhbHNvIGVyYXNlIHJlbGF0ZWQNCj4+PiB0aGluZ3MuDQo+Pj4NCj4+PiBTbyBpbiBzdW1tYXJ5
LCB0aGUgbm9zZmRwIGhhbmRsaW5nIGlzIGFsd2F5cyBjYWxsZWQgd2hlbiBwYXJzaW5nDQo+Pj4g
ZmFpbHMgKHRoYXQgaXMgd2hlbiB0aGVyZSBpcyBubyBTRkRQLCBub3QgZHVlIHRvIHJlYWQgZXJy
b3JzIG9yDQo+Pj4gc2ltaWxhcikuIEkgZG9uJ3Qgc2VlIHdoeSB0aGF0IHNob3VsZG4ndCBiZSB0
aGUgY2FzZS4NCj4+Pg0KPj4+IC1taWNoYWVsDQo+Pj4NCj4+Pj4gRmlyc3Qgd2Ugd2lsbCB0cnkg
dG8gcmV0cmlldmUgdGhlIGZsYXNoIHBhcmFtcyBmcm9tIFNGRFAuIElmIFNGRFANCj4+Pj4gZmFp
bHMsDQo+Pj4+IHRoZW4gd2UnbGwgaW5pdCB0aGUgZmxhc2ggYmFzZWQgb24gdGhlIG5vX3NmZHBf
ZmxhZ3MuIElmIFNGRFANCj4+Pj4gc3VjY2VlZHMNCj4+Pj4gdGhlIG5vX3NmZHBfZmxhZ3MgaXMg
aWdub3JlZC4NCj4gDQo+IC0tIA0KPiAtbWljaGFlbA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
