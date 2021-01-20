Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2CAC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 14:53:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6779E2336D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 14:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6779E2336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l891ek4vCVBHxEwzezc3wpX+7ZbC8/q+gqgwplxCMRk=; b=b++Qmm1Q9BaHvzLSZDWndFEwS
	vt7hG3OuD+yN2ZwWZfBOyRdbRubYfcr7izULddCzhD41A5rHr/BIEiPzHi0xvm+bGREhTxHuUHA6F
	XEih63u0L8674OT0m3nJFYLx+3Oy18lNhUagDwIUNF4Beeah+UF5k6DILJ62pwwHp6kYc5hlOE8wW
	p8FASCIaLXIdA14tXji/05bjKHsNJeJS07AtUBh220i4Vz5BK0/Fvy0pHAvH+mIYRuYGeN4TPn7QY
	w+A9tFdV8LOm0PRYLHmxBHGA18DHtreLPeTp8otJxugVtgBQfaPFxVSJmqlzj1uV137JqYocJsl++
	tI/KJ1Skw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2EqO-0001H7-Nl; Wed, 20 Jan 2021 14:52:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2EqI-0001G2-PV
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 14:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611154338; x=1642690338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=grxZeZvpJkkVDuwinPQ/qAwNv7kmKECqpNZtJK+poYU=;
 b=OlkEKWhfz+KRBoVXcWwtizLDyGLMrnBy6hR6KD5MPjtc+ItGajgzlbX6
 HitVeP3CjTuqBY15IdzK0tB4EiE23MWNZ+PpN6VCQ8gwkuZUopOp5K0jN
 k3GbX0LMacdAz36PaXQEd1zkPAu9bDAQml6JK+O1JNd2+MOeYgGGyDDSG
 eIJZ/SzFSaw0JKqVEqe6ffn7ACJeZdVW0TCptc50tSAF2StSLfrQkGN0V
 1tpGCmcepczw8C8p+uNdD2obCJAueZJI5zgj8BQa6pL4dnWxj132G5A5Y
 kISbWN8m1JuBoCaQcS4QTOSSRJyJBH2fjMROUbu9C4HUjR5o5ECkIqvT8 A==;
IronPort-SDR: o64ZFKXB2Hdn0zF4U8/9Dak/+q/cXKO1fo7VquGmNMpG489kY+ogrRsv00YQU/N4CUSt3xbVQa
 A2QBcoES4bZytz+fPk2Rs8nrT2S+AqtAwfOVCWp7nZa3rWNFHfQRyaVPW48UeFpiJMYFKgO+t0
 38vjxLPAVeAtq7BkUX1blOl7JKzPuY45L7nT/yiUIkSGhxxOhgLpMZ0gEu1uIa+EcXsHPC67IK
 lbHNWPGzkNOLiYrfmsNHFofftkt00qtbkxs75b4D4P/f01yXqO+wV0uoe33WKpBm1Q+En2+rsJ
 VUg=
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; d="scan'208";a="106112521"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2021 07:52:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 20 Jan 2021 07:52:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 20 Jan 2021 07:52:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbLJxScUdkLi6XhehxBhck+IQmpzmrbvdHcZzq+YImvWb/hVOhlkP2N+0ffKwkO2TXSNgNtKR14WV2b+DPmnPl09RwSm4UYqOSZ+/eiw10/p//jJgaFAiLASd3I/iluFiDhQE2lMhquPs/Kv03J/BFyuTmB/9Uyu7b2dqeAzlkRJ68rCupdklKJ8f0ijYuLPYBAhfvbr2YLmdg6uuLYNiGoj3qtSYh+S+p7pnv/+EiGWQm5nvC6aE1vnKG/5u7oLCG3NW0oRo6Pc3STZQWMJmijP2IlEkex6+l6eD79Vx//jyP3wrMyvzV7ubkJbG2kj9I81LTc/lBTI6DSjy/oqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grxZeZvpJkkVDuwinPQ/qAwNv7kmKECqpNZtJK+poYU=;
 b=HrT2KciYczoFuG4oYsBmPDozRNdczju9DlCOItEnxtHyWiSptQ7Y8cnl7LrkS7TjKSPWLBoTXrqZDUD/aTze5F3gHUlsUv0dsANiQgYHnHKxduPRxRiulJOHdy3Q/XVNjwgPC79vdRwafSSCiBfEjpbkr8EgjaJn9cWdErbOxdW9uUPsrt5dtroRQW1ROGX9Ix4+uxKHtxJNlYfnOs9tRn/teY4d+7MAG7GEHYExgUOuulfloH0zlfRJ3LSUsOYctU1CGAXRfMLEId3vt9gG5+S9QcAnxWTlNbvdKq3jGbeI+KNOWyhhtBPDs+9LR1H8KQJfDxRW7pzuMSP/VGO95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grxZeZvpJkkVDuwinPQ/qAwNv7kmKECqpNZtJK+poYU=;
 b=pHx9IZf5qbBqypsgzamZIJ5ps//fhax9ta4BgfAcbVpbgWFelMrfVJdgnBi3bkXYTwemnPa+9gijTTxFsqBOWw8iFlOaQXM4qLT3IA/eVGujWxW1xo+vsloVHLjBN4Av6ah6nl9TaNCjLJVCfxknNFnC1xhyCHVNqNNeEb3FXQw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2958.namprd11.prod.outlook.com (2603:10b6:805:da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 14:52:13 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 14:52:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
Thread-Index: AQHW7zvWbgOMYI+QzkWXPBRNkt6zcg==
Date: Wed, 20 Jan 2021 14:52:13 +0000
Message-ID: <ad0cc416-73b7-f626-115f-d192fac17957@microchip.com>
References: <20210120131914.277363-1-tudor.ambarus@microchip.com>
 <20210120131914.277363-2-tudor.ambarus@microchip.com>
 <b3a61abec8927c7229c27415d2c769a8@walle.cc>
In-Reply-To: <b3a61abec8927c7229c27415d2c769a8@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf9abfdd-2d48-4270-a5a6-08d8bd52f908
x-ms-traffictypediagnostic: SN6PR11MB2958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2958BF79B40FFE005D36C114F0A29@SN6PR11MB2958.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dor+Y+/vdNYYew5ksvnjxwq5AODGyks1N0/sJtDh5nRLhqufx2jyjuiauMloBv6L7DElVwcspVhPxPffJdf3t2fnCYgRnuuDZ/m6QaN971A8D1YR5CSVbVkcW8cFdBgFaX/2PhhaW+6zLrdXcw5gZLVYqyRlGpkLQbxnyPwPELQNFLp4mXk+YE1byW3IMgt2MjWSx23xbzwEPl7fMyoOUSXQvrY1mitHN2mGvdjjBehz984Cy2KTrzjxstQK7sp4w1GBZZNG7sMHj4savSqAJqHWkoZkqjeQSqCgI12ANvh7YWYUp+FOsc5hcuu06dgcnYTlAC3K+2/BPTUd4y4Iq+zyq6R0pJvfuqRzIJF920/oriuhjDin2UxN9Cx8RdszHTups8i3+DLVj7hvxoDo+GWpfeXZPwzqlKw6tJpllfAGPKrazuJxEqTLJ6KuCuVjmutM2QAUcDIFfcfAI26YemsL+APj94upOzyluFqk1qo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(366004)(6506007)(8936002)(53546011)(5660300002)(31686004)(31696002)(186003)(4744005)(6486002)(26005)(83380400001)(66556008)(36756003)(66446008)(66476007)(66946007)(2906002)(64756008)(86362001)(76116006)(6916009)(478600001)(316002)(91956017)(6512007)(107886003)(71200400001)(2616005)(8676002)(4326008)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?N1RhbmRpMEpXVVo4TW5CaVFrOU5Id2h3TDIrd1k0a01LWDNHR1JHOHJ0NkNH?=
 =?utf-8?B?c3A1UnlFM2xnWlk5UlFCN2xwb3RGb1FmcTdud2tiQU5zMXd1bXZvdU5mczZC?=
 =?utf-8?B?QU84MEVwRnAvbTVOWkczcGNWVEVsQ2pzL0MwYjlqSWtURnQrVWlIUzN6WFRw?=
 =?utf-8?B?MEc3KytnTGFPVG1wYkJtSmxFODkrQ3hhTFo2ZTlIYWg5eFNBTXk4eHQyTnp2?=
 =?utf-8?B?eDY4RXhEeDhoVkFMMk1TTmVjZ1pmeGxabm8yTjEycXlTL1laT3VJT1Jxc3du?=
 =?utf-8?B?MFVFc2ZIT0VzTVloaGx4VW5kcUROREhTTUxQYjhzQ2V2dmkydnFMRDBkck1v?=
 =?utf-8?B?U2x3V1BuYml0Y3BMYlkrSXZHVURtUXlFTXhKSVBJSXNhUkl4ZlZ4NFhUUXJC?=
 =?utf-8?B?UnUyRStXRU5CTnpSVVR2bXk3Sko1SFRKWjNsaXFBM0RzUXZuS0dXYlBSNnIy?=
 =?utf-8?B?dENUM2lSU3dqTTJDNkxsRkxZREV5am0yblh5NVJpa2tOUVM2dWlOQ3oreW5o?=
 =?utf-8?B?NWN0UVdZM3VKZVRGS085dEFTczFXZUtIQ2NxN0lNMkpWOGQ0am9TT2dMM25N?=
 =?utf-8?B?bEU1aSsvTVM0ZUtWYlVQVE52OWpTN3JYTDUxeTlZNXgxRUowb043Y25QMTBw?=
 =?utf-8?B?SS9rZUo3amMzMk9reUNGSDA1R3c4cTBCQ042YllCdDhvaE1sS1NrQWdkSWxV?=
 =?utf-8?B?OWViUGFkRThCZ0ZCMWtpeGtaSWJHYmhsUUlGdXZJbUlQeDlEMXNtbkV3L2Qv?=
 =?utf-8?B?ZWE2VkMyNnJVR3ZvK2tzM0ZZb0cxVGErdWsvMW9VMUxsOFVjMlc0b2x2UXRY?=
 =?utf-8?B?L2VwNG9qbFJ4WHovUlVlOEhLQ3daRGg1NjlmempnaHAyMDZKcDlZSnc1cG83?=
 =?utf-8?B?bmZQVmp4K0trUExVL0tjRXM4UzVBblErWmRtOEtmT0JnWVBNTExwK0JtSmxw?=
 =?utf-8?B?UzNIWFBucFp1Rm5uVUZlR0RkQ3NYYnQvd002R1YxOGM4SGEvQm1hQmM0VlhS?=
 =?utf-8?B?blFVRmp5V0JudlFsVlQvZzd2aWNSMnN2bU03dElRc3lDQ3RLKzhZaEFSSFdN?=
 =?utf-8?B?QzJlWXllRFlWbDRWbEl0a0tMUmhLUGlmRWtFUE5MUlVFcDRjYkJmalM2R2JV?=
 =?utf-8?B?dGtNNWFTK0kwK1lOWTU1YWNPQ0VySmpPZ3hMcm9MdWQ5Ym4zU0MvODhkQ1NX?=
 =?utf-8?B?aURXU1BhOUZtT2xsYmJvQ21hUURtRWVnbWZUM1RGYkRlNTFjR081bjdXdy81?=
 =?utf-8?B?RDlNSjJyYkU3L01YRVZSMTNUSEg4NS94bjZTUlZ4RWZmaGlkVU9NUGl6cEh5?=
 =?utf-8?B?aytFMHNTMVZUSFpvMDRWU211dkJaK0V2eUdzOTFHYkFUOHJVVUVtakV0Z2tG?=
 =?utf-8?Q?9LfQ7AgqDJWhVd7IDk1A6F/jl/cMy+G4=3D?=
Content-ID: <69ECC6F5F15B194CBC3E79BAEFFEDAB5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9abfdd-2d48-4270-a5a6-08d8bd52f908
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 14:52:13.4761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70UfqxwM7zHnVr3i5dLeIz38nue/7MpMm+I8YOEV4Q7RLNagFwD0ZxeOyMzv7e2V1SA/hVNTZT6/j3FZvLjtXRlxadenHI8BnImR6kfGZ4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_095219_128215_9CDFF00D 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kavyasree.Kotagiri@microchip.com,
 miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8yMC8yMSA0OjA1IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NzdC5jDQo+
PiBpbmRleCAwMGU0OGRhMDc0NGEuLmQ2ZTEzOTZhYmI5NiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3Ivc3N0LmMNCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMN
Cj4+IEBAIC04LDYgKzgsMzkgQEANCj4+DQo+PiDCoCNpbmNsdWRlICJjb3JlLmgiDQo+Pg0KPj4g
K3N0YXRpYyBpbnQgc3N0MjZ2Zl9sb2NrKHN0cnVjdCBzcGlfbm9yICpub3IsIGxvZmZfdCBvZnMs
IHVpbnQ2NF90IGxlbikNCj4+ICt7DQo+PiArwqDCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOw0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IHNzdDI2dmZfdW5sb2NrKHN0cnVjdCBzcGlfbm9y
ICpub3IsIGxvZmZfdCBvZnMsIHVpbnQ2NF90DQo+PiBsZW4pDQo+PiArew0KPj4gK8KgwqDCoMKg
IGlmIChvZnMgPT0gMCAmJiBsZW4gPT0gbm9yLT5wYXJhbXMtPnNpemUpDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBzcGlfbm9yX2dsb2JhbF9ibG9ja191bmxvY2sobm9yKTsN
Cj4gDQo+IA0KPiBTb21lIGJsb2NrcyBtaWdodCBub3QgYmUgdW5sb2NrZWQgYmVjYXVzZSB0aGV5
IGFyZSBwZXJtYW5lbnRseQ0KPiBsb2NrZWQuIERvZXMgaXQgbWFrZSBzZW5zZSB0byByZWFkIEJQ
TlYgb2YgdGhlIGNvbnRyb2wgcmVnaXN0ZXINCj4gYW5kIGFkZCBhIGRlYnVnIG1lc3NhZ2UgaGVy
ZT8NCg0KSXQgd291bGQsIHllcy4gSWYgYW55IGJsb2NrIGlzIHBlcm1hbmVudGx5IGxvY2tlZCBp
biB0aGUgdW5sb2NrX2FsbCBjYXNlLA0KSSdsbCBqdXN0IHByaW50IGEgZGJnIG1lc3NhZ2UgYW5k
IHJldHVybiAtRUlOVkFMLiBTb3VuZHMgZ29vZD8NCg0KQ2hlZXJzLA0KdGENCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
