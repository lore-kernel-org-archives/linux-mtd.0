Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3BCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8EA56120D
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8EA56120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PoiZ7xWD1UHfAyco0Zc7aZhuRmZ9+FJCVlf6GW5gj4=; b=DGTMrALMH/pGrr
	0p54kxEj38nnfQ5qqCG3EwcBt0S8D7VypshPDF9uOwlkMbpSb0PWCxhueXPEe10a+WB+Wmlsfj0X8
	ZSf61+VsQkPCo44kpU3BvKiURNCQ41EX8ntfZ0/ffHTIQ8+u6pek3qGZT2oOeaTvKA63vDN6iy92o
	BYXLnGlL042tcZeq+YZGAMQ2Nmh8E4trRfwRpalYVG+cVlm8CCSN4P9p8EyKZXKAmODHTKKZD+gyF
	XdjvfCsL2rIjquWeAeez88pDHaBRNSUKCz+5f27sKb2fQ98EemSbR4Z/Sqth2VhOT6G71IVlIPHLy
	GzWoEQnETSoSOGh7AsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtvm-00AwHd-IP; Fri, 22 Oct 2021 12:45:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtte-00Avdm-N2; Fri, 22 Oct 2021 12:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634906622; x=1666442622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PbgCF//IOThDGp4cEg0TZeKcbT9xLw08BTMDsrpO74M=;
 b=tVoFHO+uaUxD4v8amn4Dk7OKQni6d1ellzABLzToe/fZRACbPhJUnfwx
 /G4jqoRTF7gOCzXpQ9jwxIwhzO3awfDth1A49EGOgWqPLoRBz0/m2XrVI
 8qiEsHLSENmZ4xWyp2kJHlDDcnM+sgD4YwtmXk8E+oQfVK/Vs0Bin+N1G
 ZSIBjySElOaz5YEXzpYPOyrwNuegYagp8OMvXnzz0+KxQPHdyrc4cKlOG
 RJLBBqp9yCavRBAtPK3VJawh7kY7ZAAgbj6GR5zgWRQvlNPicw8HcyL8C
 v8gHWMXiAcs5FydpFNdXsFKaRP7SPzM487azPtf1NeZNRvbeQAODhjQhj Q==;
IronPort-SDR: cK5fvSB/X7zxcusb74m1XM79Bab/nkzTsbFM38RjKQ8Ffw8oOGqmArTA3kcovc6Wk2eb1FUyYM
 b6g9Q0iGVuOk6CpErnOsUycwObqtNqOo14bAm+ua5pEc96S8tV2+epvJO/W8ZAJ5YF+sO4XYLc
 nGhhEbwpUMnx43O/h4eiH9rtThVSiPZjjivXnrkxtu1TIwZ0gA9gAjuAHX4PRf8J2S0Pp8Kxtr
 rYUK+UgnMlvVY0MwSm1J06R9SsTCLT+A5+sQvudHDHVT7NoREkKaC4NHMiP+5D6cut08iWMVLs
 EYVfNJBH/Gn4l6BAfxefrFv4
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="149167425"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 05:43:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 05:43:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 05:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJKh9sVPurltpQvQFB/fSYwN9JiCw5ddcPE0cXPiI+UTwjYf+5Q1SH67IE355weqSXttuMaLmiKzVq0JZug8LVfdROFiDKLZ+zY8DAYpufSaSd+++xO8pSKW2jDroRQbZuPJruSEkx8U7Tc7gnPWbh/AtbY+cw3o2bETeG1EHDLJANcusQgiN03+c0yX9BnvgEEosw1EA28MmEpiLEDgZMa6umkh1bvNSJThht5sOPxp+MZsghkdacTxGZ8lU4XRRfRYrHQoT4TaJM31Nop56G8/DrU4RVhXk7NI+cJ2RsgJSihYbrMN+HzxCbLjCMlGyVU6xr02iHrmOujkd50GUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbgCF//IOThDGp4cEg0TZeKcbT9xLw08BTMDsrpO74M=;
 b=ZGR/+uOmzrutAmwO2YWCXvepfyAZcbLGiYVJlna4ngco3kuF2fcYJ1psdjHMcWGLXSbj9GYOK2jVTO6E5UJsB+XRwYGDDkvxhmFZvPgKC2ThN5u0Lt4jedkLiu0HT2g00dy3h4llAby8OUnPzZQrLbEZDpTBlcVFHI8/mhKsBEDGrKYyQ4D3RTzMCk5zUsJGemFCk8HhVESVMLzrG/RhMUg1DC4jA1QuXff+gSEs2npQG0pfqIpaA1r1YDgwF0kYGUd/Gd2YP0UVHoy2+GSYWnP0huZyVt5yJ3h3E85b3hTLJNdyjRj2roCBUvmVbJV52uvlyaDpx0QxlGqvFw/FpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PbgCF//IOThDGp4cEg0TZeKcbT9xLw08BTMDsrpO74M=;
 b=kkdwKOgiywTbywPxYc9UuMZKzT+KZeMsnz1SlljbiMZv/VXN1AY2O7m9cmUAaLWNoYKfKyuQHJ0MU/Nj9Tgh5SL3Fwrpd3MGHMdgtcQKc5g+8BGeIWyxyYXycIwO73B8++4FhoAZCT0DJACfM8+fvhCygsRh+9qzg3URW95EOls=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3391.namprd11.prod.outlook.com (2603:10b6:805:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 12:43:36 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 12:43:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: Re: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Topic: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Index: AQHXuM5x3Sn1HTf2W0qinCbUxi2img==
Date: Fri, 22 Oct 2021 12:43:36 +0000
Message-ID: <6989d2e0-8397-f512-2019-79e4f0895c13@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-19-tudor.ambarus@microchip.com>
 <20210817121626.5vcwuluheqfqrqc3@ti.com>
 <d7d7b602-0c42-dc14-71f5-9b89303a0941@microchip.com>
 <20211019172623.hi5c4i274bv3lnqw@ti.com>
 <e3e5c59e-08c0-07c7-e77a-5edfc3502388@microchip.com>
 <208ed4a3-fd89-9efb-6dd6-6bddc5c1d818@microchip.com>
 <20211021093010.fjqriexdvsjgihkr@ti.com>
 <cdee860e7208267eacae884899fc6d36@walle.cc>
In-Reply-To: <cdee860e7208267eacae884899fc6d36@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 863c1b08-a269-49bc-710b-08d9955990ea
x-ms-traffictypediagnostic: SN6PR11MB3391:
x-microsoft-antispam-prvs: <SN6PR11MB33919A074FE425BAC62616AFF0809@SN6PR11MB3391.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SN89h1+6aMKT3pethKtsBs+NIIOJibiAYw9kULqYjMwhy7K64vhvMuzSk1yl/fnrCLAC2PdkClmge3oBIM51UlJh9wI4zEjmZtXLSPN/UKELrc/jdbm6hNFvfeLWNs2HL9an3E3ow2WMMkmEgAIvvZZ7uzLnmYEXegf+mxQYhWQ2Kjn6vbMdmUSZr2ZYuAZohTCLqof8NlZ50HrJ80McLpEwRM+EVzggsaoLDdB3/wJs5hJ9uokbnL9kB9SAvHU953h6pkF0DWygHJrtHlWfsGjFnnTO3+6T3TXV4dlrR4yMF7EaSBExenY1RYA36x6Xi6uNk3vEtsyYvYHXOoeco4bF9jk5gXx5wPMNg1gW/XxIdcfzzB5NforVtxNasASzeIIyHG/aK1zue/hOerwyYRjhgiH4Y3yWnJpt+GehlvEBrTWn4VKPYAyfN+tZ7++06KU4vOY26KrF4DimIm9sc8gg/UOX+vZJGJnCbe6pR9SIcz6tNlCKr1P6AlXfTh0YXVygkuYF+HlcIKeM0r3jCI/Ryx6iXc2KIHQ9nl1BX9Tm7GABSKE+A5TUPevn6cGk3O2auUVGhor2S0YHHXbr+W9bqSpyRW4QmCTOtUpsnY1+RVYPdyVo5loE+5DN8O+vsxerdJsTzhI/gon4CunkJr9qDQT6JQwFDiebrAqftBS7fL89nqsHjew7LsVbdGmg3DnQsUwRCDRNCw4zRfXmL2t0Hg4JvhGd6zgfm0Ug62lmAUHHho2N6wFI88ZHqd9iPiBdKwn59vamfrwi2ZGobiQdeONzJQyYQPC9NRL12sE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(2906002)(36756003)(76116006)(4326008)(186003)(508600001)(83380400001)(2616005)(31686004)(54906003)(71200400001)(8936002)(6512007)(6486002)(316002)(53546011)(66556008)(26005)(38070700005)(4001150100001)(5660300002)(66476007)(7416002)(8676002)(66446008)(122000001)(64756008)(91956017)(38100700002)(6506007)(66946007)(86362001)(31696002)(26583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDBkZHpBR1dmdi9zbC9tZk1RczBoc2EvK2VhZGQyZlJWckRKeE4ycEJUc002?=
 =?utf-8?B?ZCtHbWczaWRwSlJ0RjhWK1RiYVo2ZUR6aWZhdlNiSXkzMmtyaG1tYnozczFJ?=
 =?utf-8?B?VlhxTDhVSEltU2dHcmRUL2FIaU55TXVGL1VPcFNDNEZYb2FmK1I5TzBIN2t2?=
 =?utf-8?B?aTlCSXRML0RiSk0zcXNkS0xIdUFnSytNVXNRK1BQbUxNRWpKeEVEaUViSWhj?=
 =?utf-8?B?ZjMrUnhVenhRejJFVGNEQ05mUUNhMGtkNXJoNFJmell0aHVHWDVIYmxsVWJl?=
 =?utf-8?B?bGZTcGRESlZxQWZQaG5iZzRvalZaZ3Jid3N6NWFyeVM2dE5EajZSZ0oyK0Nl?=
 =?utf-8?B?R1krejFlMkpiNk9ra1RRUTd5QXZvVkdWRS94UWRsN2tiTnowOHNrSi9NRTBR?=
 =?utf-8?B?RFNqMHBYZEJqYUhrTklBUVpmZUlaYVVyWHl5cDE4K1dnY1g1YUZ5UE1Gbk1h?=
 =?utf-8?B?b0pjWGl0eE1UaFVyK0ttdDlxMzhkWTh4Z1JPbkJFN0E2MUx0SHNERHNBRFkz?=
 =?utf-8?B?cGZKRDFrSUlLNlhtRUZ5cm9mcXNvWGd6VS9LbTBacXN4aHpTVTBBK3JEYVVs?=
 =?utf-8?B?VFJJMVJjeW43VGExSjZQM1JJRGE5MkJrSTBnRllEMlBNK05FZUE0UXplTUUy?=
 =?utf-8?B?NlpXU1pQa29lN1BRY1R3QjlqdHRHelMwTThTakFvMStnWWNqdXNqOFM0UjFF?=
 =?utf-8?B?OVBHWERHWkNoRzhMR1c0Q2lKdjFjZlRsMDMwZnBGcjV4blRVZVl2OUZvK3Y1?=
 =?utf-8?B?NWFIMzRpYURSSko0VnAxZzBEZ25kNEhjbkZMc0hPaE9LcVJPQ3l4OG5SVlRw?=
 =?utf-8?B?QVVwRGlvaEkzUzNSNHhTc2xzbktMc0g4akgwWEJjRXQ0NFpITWVPWkk5WEhQ?=
 =?utf-8?B?cXhwOWJ0dFJ6Mmk5akNLN0g1RHUweWJiOVFxWHQ4QnhZbDV1elZCeGxRVFFE?=
 =?utf-8?B?cEhpTkN1SkZTNTgxQW95MU1wV0JMZSttbmRCSXJyOUJ0QUUyR3NiY3pyendJ?=
 =?utf-8?B?QmZaMm5nbzJ3dkpoT3JtblhUOFJoREFCZzV6dWlTZVc1WHgydHFpKzdmUWNF?=
 =?utf-8?B?U1d1Q2VFbllIZXVlK2JBRjNSbEVBVlBKY0xoN3dQaEpsSFNVRkd3WklCMlJi?=
 =?utf-8?B?SGkzVFB4a0luOW9VVlFVNVluV2pCVmF2aXZ6RVVwSXdUaWpLUFl5akpQZnJX?=
 =?utf-8?B?NGwrOHNBU3M4NEtOdXY5RE9FZThSejRuYXpzekdOcWZZTTdUVUljS3lraEJI?=
 =?utf-8?B?RkN3eXZBdlBKZEwra2dGQ0E1ZXVkVWZLUjVlQlhMRGRGUVdWcFZQSWltWjdC?=
 =?utf-8?B?UG1oNDZxM1N3bTJ3NDZ5c0Q3M0VtMDVmemtSbjh3TlJMRThSQlZ0OC9MdDJv?=
 =?utf-8?B?UHZVSFpKcEdRU3NtbFJjYjc3VGZsRTVYR0lZaWwzNUo5TXpOcHRiNlBCc2dj?=
 =?utf-8?B?dzExMjRsejhiV05RTjg3dnFyUFFkQXUzMDUyakJCbU85aTBRRHpDNkJDeWwv?=
 =?utf-8?B?eklrMEV5YllheFF2MEhIM2NEQzJvYVVkdzRia0k2RmJqcWEvdUkrL1JRbEk1?=
 =?utf-8?B?TGhQSm1LMi9DSXlMSUFVY1kyTGFEQ0RqeHVKdHlRVFVQYlplNG15M3ZOekFG?=
 =?utf-8?B?em1KdWN2UDZQVHM3V0YvS2JmclpST2NNbFB6Sy9LeEttTWMwWXBQUUVVT2xh?=
 =?utf-8?B?aHkwMVdHZlRoZEFsdGJ5TFF6Q2svMHJJdzJBZXRWY29iRUFnTDQ3UGVJM1NY?=
 =?utf-8?B?R2lLSWJhc01lNVI2dGt6aUFCcWUzNEhZZXlhQVQzcUUya0M5Wit1REcxM1ZH?=
 =?utf-8?B?ZzJYTnZyTEJmcGJpUCtFcFkwODQrUzQwMk8yU1RiMFVVbm9NRVhUQUJBTjhv?=
 =?utf-8?B?aVJldlRWdkp6WGxianhKQmlGL2dzTWxjZGZEYVRsM3VvK3NwWEdVRVB0Q3JP?=
 =?utf-8?Q?dPNonc1TiIG9gLlkhc2LWc82Mm5NYww0?=
Content-ID: <406D617C6D98AB459DC2E56DDFDABCFC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863c1b08-a269-49bc-710b-08d9955990ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 12:43:36.5248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3391
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_054342_892327_35007F57 
X-CRM114-Status: GOOD (  23.37  )
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
Cc: code@reto-schneider.ch, vigneshr@ti.com, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, zhengxunli@mxic.com.tw,
 linux-mtd@lists.infradead.org, mail@david-bauer.net, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 linux-arm-kernel@lists.infradead.org, jaimeliao@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTAvMjIvMjEgMjozNyBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTEwLTIxIDExOjMwLCBzY2hyaWVi
IFByYXR5dXNoIFlhZGF2Og0KPj4gT24gMjEvMTAvMjEgMDg6NDRBTSwgVHVkb3IuQW1iYXJ1c0Bt
aWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+IE9uIDEwLzIwLzIxIDEyOjU1IFBNLCBUdWRvci5BbWJh
cnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUNCj4+PiA+DQo+Pj4gPiBPbiAxMC8xOS8yMSA4OjI2IFBNLCBQcmF0eXVzaCBZYWRh
diB3cm90ZToNCj4+PiA+Pj4+IFdoaWxlIHdlIGFyZSBvbiB0aGlzIHRvcGljLCBJIGZpbmQgdGhp
cyBhIGJpdCAidWdseSIuIEhhdmluZyB0byBzZXQNCj4+PiA+Pj4+IGxhdGVfaW5pdCgpIGZvciBz
ZXR0aW5nIHRoZXNlIGZsYWdzIGZvciBlYWNoIGZsYXNoIGlzIG5vdCBleGFjdGx5IHZlcnkNCj4+
PiA+Pj4+IGNsZWFuIG9yIHJlYWRhYmxlLiBJIGRvbid0IGtub3cgaG93IHRoZSBmdXR1cmUgd2ls
bCBsb29rIGxpa2UsIGJ1dCBpZg0KPj4+ID4+Pj4gZWFjaCBmbGFzaC9mYW1pbHkgbmVlZHMgaXRz
IG93biBsYXRlX2luaXQoKSB0byBzZXQgc29tZSBmbGFncywgaXQgd29uJ3QNCj4+PiA+Pj4+IGJl
IHZlcnkgcmVhZGFibGUuIFdlIHNlZW0gdG8gYmUgdHJhZGluZyBvbmUgdHlwZSBvZiBjb21wbGV4
aXR5IGZvcg0KPj4+ID4+Pj4gYW5vdGhlci4gSSBkdW5ubyB3aGljaCBpcyB0aGUgbGVzc2VyIGV2
aWwgdGhvdWdoLi4uDQo+Pj4gPj4+IFlvdXIgcG9pbnQgaXMgdmFsaWQuIFRoaXMgcGF0Y2ggcmVt
b3ZlcyBTUElfTk9SXzRCX09QQ09ERVMgYW5kIHNldHMNCj4+PiA+Pj4gU05PUl9GXzRCX09QQ09E
RVMgaW4gYSBsYXRlX2luaXQoKSBob29rLCBmb3JjaW5nIHRoZSByZWFkZXIgdG8gZ28gdGhyb3Vn
aA0KPj4+ID4+PiB0aGUgbGF0ZV9pbml0KCkgZnVuY3Rpb24gdG8gc2VlIHdoYXQncyB0aGVyZS4g
QXMgeW91IHNhdywgbGF0ZV9pbml0KCkgY2FuIGJlDQo+Pj4gPj4+IHVzZWQgZm9yIHR3ZWFraW5n
IGZsYXNoJ3MgcGFyYW1ldGVycywgc2V0dGluZ3MgYW5kIG1ldGhvZHMsIG5vdCBqdXN0IE5PUiBm
bGFncywNCj4+PiA+Pj4gc28gSSB3b3VsZCBleHBlY3QgdGhhdCB0aGlzIGhvb2sgdG8gYmUgcHJl
c2VudCBhbW9uZyBmbGFzaGVzIHRoYXQgZG9uJ3QgZGVmaW5lDQo+Pj4gPj4+IHRoZSBTRkRQIHRh
YmxlcyBvciBmb3IgZmxhc2hlcyB0aGF0IGhhdmUgcGFyYW1ldGVycyB0aGF0IGFyZSBub3QgU0ZE
UCBkaXNjb3ZlcmFibGUsDQo+Pj4gPj4+IHRoZSBob29rIHdpbGwgYmUgdGhlcmUgYW55d2F5Lg0K
Pj4+ID4+Pg0KPj4+ID4+PiBUaGlzIHBhdGNoIG9wZW5zIHRoZSBkb29yIG9uIGhvdyB3ZSBjb3Vs
ZCBoYW5kbGUgdGhlIGZsYXNoX2luZm8gZmxhZ3MuIEFsbCBmbGFzaF9pbmZvDQo+Pj4gPj4+IGZs
YWdzIHRoYXQgY2FuIGJlIGRldGVybWluZWQgd2hlbiBwYXJzaW5nIFNGRFAgY2FuIGJlIHJlbW92
ZWQgYW5kIHVzZSBmb3IgZmxhc2hlcyB0aGF0DQo+Pj4gPj4+IHNraXAgU0ZEUCwgU05PUl9GIGVx
dWl2YWxlbnRzIGluIGxhdGVfaW5pdCgpIG1ldGhvZHMuIHNwaV9ub3JfaW5mb19pbml0X3BhcmFt
cygpDQo+Pj4gPj4+IHNob3VsZCBOT1QgYmUgY2FsbGVkIGZvciBTRkRQIGNhcGFibGUgZmxhc2hl
cyBhbnl3YXksIGJlY2F1c2UgaW4gY2FzZSBvZiBTRkRQIGZsYXNoZXMsDQo+Pj4gPj4+IGFsbCB0
aGUgc2V0dGluZ3MgZG9uZSBpbiBzcGlfbm9yX2luZm9faW5pdF9wYXJhbXMoKSBhcmUgb3Zlcndy
aXR0ZW4gd2hlbiBwYXJzaW5nIFNGRFAuDQo+Pj4gPj4+IDEvIGZsYXNoZXMgd2l0aCBTRkRQIHdp
bGwgc2V0IHRoZSBmbGFncyBhczoNCj4+PiA+Pj4gU1BJX05PUl9QQVJTRV9TRkRQIHwgbm9uLXNm
ZHAtZGlzY292ZXJhYmxlLWZsYWdzDQo+Pj4gPj4+IDIvIGZsYXNoZXMgd2l0aG91dCBTRkRQOg0K
Pj4+ID4+PiBTUElfTk9SX1NLSVBfU0ZEUCB8IG5vbi1zZmRwLWRpc2NvdmVyYWJsZS1mbGFncw0K
Pj4+ID4+PiBhbmQgYSBsYXRlX2luaXQoKSBmb3IgU05PUl9GIGVxdWl2YWxlbnRzIG9mIGZsYXNo
X2luZm8gZmxhZ3MgZnJvbQ0KPj4+ID4+PiBzcGlfbm9yX2luZm9faW5pdF9wYXJhbXMoKQ0KPj4+
ID4+PiAzLyBmbGFzaGVzIHRoYXQgY29sbGlkZSwgb25lIHdpdGggU0ZEUCBhbmQgdGhlIG90aGVy
IHdpdGhvdXQ6DQo+Pj4gPj4+IFNQSV9OT1JfUEFSU0VfU0ZEUCB8IG5vbi1zZmRwLWRpc2NvdmVy
YWJsZS1mbGFncw0KPj4+ID4+PiBhbmQgYSBsYXRlX2luaXQoKSBmb3IgU05PUl9GIGVxdWl2YWxl
bnRzIG9mIGZsYXNoX2luZm8gZmxhZ3MgZnJvbQ0KPj4+ID4+PiBzcGlfbm9yX2luZm9faW5pdF9w
YXJhbXMoKSwgdGhhdCB3aWxsIGJlIHVzZWQgZm9yIHRoZSBmbGFzaCB3aXRob3V0IFNGRFAuDQo+
Pj4gPj4+IDQvIGluZGl2aWR1YWwgZmxhc2gsIG5vIGNvbGxpc2lvbnMsIGEgZmxhdm9yIHN1cHBv
cnRzIFNGRFAsIHRoZSBvdGhlciBub3Q6DQo+Pj4gPj4+IFNQSV9OT1JfUEFSU0VfU0ZEUCB8IG5v
bi1zZmRwLWRpc2NvdmVyYWJsZS1mbGFncw0KPj4+ID4+PiBhbmQgYSBsYXRlX2luaXQoKSBmb3Ig
U05PUl9GIGVxdWl2YWxlbnRzIG9mIGZsYXNoX2luZm8gZmxhZ3MgZnJvbQ0KPj4+ID4+PiBzcGlf
bm9yX2luZm9faW5pdF9wYXJhbXMoKSwgdGhhdCB3aWxsIGJlIHVzZWQgZm9yIHRoZSBmbGFzaCB3
aXRob3V0IFNGRFAuDQo+Pj4gPj4gVG8gbWUgaXQgbG9va3MgbGlrZSB5b3UgY2FuIHNlcGFyYXRl
IHRoZXNlIGZsYWdzIGludG8gdGhyZWUgY2xhc3NlczoNCj4+PiA+Pg0KPj4+ID4+wqDCoCAxLiBX
aGV0aGVyIHRvIHBhcnNlIFNGRFAgb3Igbm90Lg0KPj4+ID4+wqDCoCAyLiBGbGFncyB0aGF0IGNh
bid0IGJlIGRpc2NvdmVyZWQgdmlhIFNGRFAuDQo+Pj4gPj7CoMKgIDMuIEZsYWdzIHRoYXQgY2Fu
IGJlIGRpc2NvdmVyZWQgYnkgU0ZEUCBpZGVhbGx5IGJ1dCBjYW4ndCBiZQ0KPj4+ID4+wqDCoMKg
wqDCoCBkaXNjb3ZlcmVkIGZvciB0aGlzIHBhcnRpY3VsYXIgZmxhc2ggYmVjYXVzZSBlaXRoZXIg
U0ZEUCBpcyBtaXNzaW5nDQo+Pj4gPj7CoMKgwqDCoMKgIG9yIHRoZSB0YWJsZSBmb3IgdGhpcyBm
bGFnIGlzIG1pc3NpbmcuDQo+Pj4gPg0KPj4+ID4gVGhlc2UgYXJlIHRoZSBmbGFzaF9pbmZvIGZs
YWdzLCBpbmRlZWQuIEFwYXJ0IG9mIHRoZXNlIHRoZXJlIGFyZSB0aGUgU05PUl9GIGZsYWdzDQo+
Pj4gPiB3aGljaCBhcmUgc2V0IGVpdGhlciBzdGF0aWNhbGx5IChvbmUgc2V0cyBhIGZsYXNoX2lu
Zm8gZmxhZyBlcXVpdmFsZW50IHdoZW4NCj4+PiA+IGRlY2xhcmluZyB0aGUgZmxhc2gpLCBvciBk
eW5hbWljYWxseSB3aGVuIHBhcnNpbmcgU0ZEUC4gQ2hlY2sNCj4+PiA+IFNQSV9OT1JfNEJfT1BD
T0RFUyBhbmQgU05PUl9GXzRCX09QQ09ERVMgZm9yIGV4YW1wbGUuDQo+Pj4gPg0KPj4+ID4+DQo+
Pj4gPj4gV2l0aCB5b3VyIHNlcmllcywgZmxhZ3MgZnJvbSAxIGFuZCAyIGFyZSBwb3B1bGF0ZWQg
dmlhIC5mbGFncyBpbg0KPj4+ID4+IGZsYXNoX2luZm8gYW5kIHRoZSBvbmVzIGZyb20gMyBhcmUg
cG9wdWxhdGVkIHZpYSBsYXRlX2luaXQoKS4NCj4+PiA+DQo+Pj4gPiBNeSBwcm9wb3NhbCB3YXMg
dG8gZ2V0IHJpZCBvZiB0aGUgZmxhc2hfaW5mbyBmbGFncyBmcm9tIHRoZSAzcmQgY2F0ZWdvcnkg
dGhhdCB5b3UNCj4+PiA+IGRlc2NyaWJlZCwgYW5kIHNldCB0aGUgU05PUl9GIGVxdWl2YWxlbnRz
IGluIGEgbGF0ZV9pbml0KCkgaG9vay4gVGhpcyB3YXkgd2UgYWxzbw0KPj4+ID4gY29udHJvbCB3
aGVuIHRoZSBTTk9SX0YgZXF1aXZhbGVudHMgYXJlIHNldCwgbGF0ZSBpbiB0aGUgaW5pdCBjYWxs
LiBCdXQgdGhpcyBjYW4NCj4+PiA+IGJlIGFjaGlldmVkIHdpdGggeW91ciBwcm9wb3NhbCBhcyB3
ZWxsLCBsZXQncyBzZWUuDQo+Pj4gPg0KPj4+ID4+DQo+Pj4gPj4gV2h5IGNhbid0IHdlIGhhdmUg
MyBkaWZmZXJlbnQgZmllbGRzIGZvciB0aGVzZSAzIGRpZmZlcmVudCBmbGFncz8gSW4NCj4+PiA+
PiBmbGFzaF9pbmZvLCB3ZSBjYW4gc2V0IC5wYXJzZV9zZmRwIHRvIHRydWUvZmFsc2UgdG8gaW5k
aWNhdGUgU0ZEUA0KPj4+ID4+IHN1cHBvcnQuIFdlIGNhbiBzZXQgLm5vbnNmZHBfZmxhZ3MgPSBY
IHwgWSB8IFogZm9yIG5vbi1zZmRwLWRpc2NvdmVyYWJsZQ0KPj4+ID4+IGZsYWdzLiBBbmQgd2Ug
Y2FuIHNldCAuZml4dXBfZmxhZ3MgPSBBIHwgQiB8IEMgKGNhbiBwcm9iYWJseSBwaWNrIGENCj4+
PiA+PiBiZXR0ZXIgbmFtZSkgZm9yIHRoZSBmbGFncyB0aGF0IHlvdXIgc2VyaWVzIHNldHMgdGhy
b3VnaCBsYXRlX2luaXQoKS4NCj4+PiA+Pg0KPj4+ID4+IFRoaXMgd2F5LCB5b3UgaGF2ZSBhIGNs
ZWFyIHNlcGFyYXRpb24gYmV0d2VlbiB0aGUgdGhyZWUgYW5kIHRoZXkgYXJlIGFsbA0KPj4+ID4+
IGNsZWFybHkgdmlzaWJsZSBpbiB0aGUgZmxhc2ggZW50cnkgaXRzZWxmLg0KPj4+ID4NCj4+PiA+
IFRoZSBkb3duc2lkZSB0aGF0IEkgc2VlIHdpdGggdGhpcyBpcyB0aGF0IHdlIGV4dGVuZCB0aGUg
Zmxhc2hfaW5mbyBzdHJ1Y3Qgd2l0aCBuZXcNCj4+PiA+IGZpZWxkcyBhbmQgdGhlIHNwaS1ub3Iu
bydzIHNpemUgd2lsbCBpbmNyZWFzZSB3aGV0aGVyIHRoZSBmaWVsZHMgYXJlIHVzZWQgb3Igbm90
LA0KPj4+ID4gYXMgd2UgaGF2ZSBsb3RzIG9mIGZsYXNoX2luZm8gZW50cmllcy4gVGhpcyByZW1p
bmRzIG1lIHRoYXQgcHJvYmFibHkgSSBzaG91bGQgaGF2ZQ0KPj4+ID4gcHV0IHRoZSBsYXRlX2lu
aXQoKSBob29rIGluc2lkZSBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMuIEFueXdheSwgd2Ug
Y2FuIGF2b2lkDQo+Pj4gPiBpbmNyZWFzaW5nIHRoZSBzaXplIHdpdGggc29tZSBmbGFzaF9pbmZv
IGZsYWdzIG1hc2tzLiBXZSB1c2UgdGhlIHNhbWUgZmxhc2hfaW5mbyBmbGFncw0KPj4+ID4gZW50
cnksIGJ1dCB3ZSBpbnRyb2R1Y2Ugc29tZSBtYXNrcywgdG8gc2VwYXJhdGUgdGhlIHR5cGUgb2Yg
ZmxhZ3MuIFNvbWV0aGluZyBsaWtlOg0KPj4+ID4gU1BJX05PUl9QQVJTRV9TRkRQIHwNCj4+PiA+
wqDCoMKgwqDCoMKgwqDCoCBOT05fU0ZEUF9GTEFHUyhTUElfTk9SX1RCX1NSX0JJVDYgfCBTUElf
Tk9SXzRCSVRfQlAgfCBTUElfTk9SX1NXUF9JU19WT0xBVElMRSkNCj4+PiA+IHRoZXNlIGFyZSBm
b3IgY2F0ZWdvcnkgMSBhbmQgMiBpbiB5b3VyIGRlc2NyaXB0aW9uDQo+Pj4gPg0KPj4+ID4gb3IN
Cj4+PiA+IFNQSV9OT1JfU0tJUF9TRkRQIHwgU0ZEUF9GTEFHUyhTUElfTk9SX09DVEFMX0RUUl9S
RUFEIHwgU1BJX05PUl9PQ1RBTF9EVFJfUFApDQo+Pj4gPiBmb3IgY2F0ZWdvcmllcyAxIGFuZCAz
IGluIHlvdXIgZGVzY3JpcHRpb24NCj4+PiA+DQo+Pj4gPiBidXQgeW91IGNhbiBlbmQgdXAgd2l0
aCBmbGFncyBsaWtlOg0KPj4+ID4gU1BJX05PUl9TS0lQX1NGRFAgfCBTRkRQX0ZMQUdTKCkgfCBO
T05fU0ZEUF9GTEFHUygpDQo+Pj4gPg0KPj4+ID4NCj4+PiA+Pg0KPj4+ID4+IFRoZSBvbmx5IGNh
c2Ugd2hlcmUgdGhpcyBtaWdodCBydW4gaW50byB0cm91YmxlIGlzIHdoZW4gYSBTRkRQIGZsYXNo
IGhhcw0KPj4+ID4+IGEgY29sbGlzaW9uIHdpdGggYSBub24tU0ZEUCBmbGFzaCBhbmQgdGhleSBi
b3RoIG5lZWQgZGlmZmVyZW50DQo+Pj4gPj4gZml4dXBfZmxhZ3MuIEJ1dCBJIHN1cHBvc2VkIHRo
YXQgaXMgYSBwcm9ibGVtIGV2ZW4gaWYgeW91IHVzZQ0KPj4+ID4NCj4+PiA+IHdlIGNhbiBwcm9i
YWJseSBzb2x2ZSB0aGlzIGJ5IHB1dHRpbmcgdGhlIG1pbmltdW0gc3VwcG9ydGVkIGZsYWdzIGJ5
IGJvdGgNCj4+PiA+IGFuZCBmaWxsIHRoZSByZXN0IGluIGZpeHVwIGhvb2tzIGFmdGVyIHdlIGRl
dGVybWluZSB3aGljaCBmbGFzaCBpcyB3aGljaC4NCj4+PiA+DQo+Pj4gPj4gbGF0ZV9pbml0KCkg
c28gaXQgY2VydGFpbmx5IGRvZXNuJ3QgbWFrZSBhbnl0aGluZyB3b3JzZS4NCj4+PiA+DQo+Pj4g
PiB5ZXMsIHRoaXMgaXMgYSBkaWZmZXJlbnQgdG9waWMuDQo+Pj4gPg0KPj4+ID4+DQo+Pj4gPj4g
SSBoYXZlIG5vdCBnaXZlbiB0aGlzIGV4dGVuc2l2ZSB0aG91Z2h0LCBidXQgaXQgc2VlbXMgdG8g
bWFrZSBzZW5zZSB0bw0KPj4+ID4+IG1lLCBhbmQgSSBmZWVsIHRoYXQgaXQgd291bGQgbWFrZSB0
aGUgZmxvdyBlYXNpZXIgdG8gZm9sbG93LiBUaG91Z2h0cz8NCj4+PiA+DQo+Pj4gPiBCb3RoIGFw
cHJvYWNoZXMgYXJlIGZpbmUuIFlvdXIgbWV0aG9kIGtlZXBzIGFsbCBmbGFncyBpbiBvbmUgcGxh
Y2UgYnV0IGR1cGxpY2F0ZXMNCj4+PiA+IHRoZSBzZXR0aW5nIG9mIGZsYWdzLCB5b3UnbGwgaGF2
ZSAiaWYgZmxhc2hfaW5mbyBmbGFnLCBzZXQgU05PUl9GIGZsYWciLg0KPj4+ID4gTWluZSBnZXRz
IHJpZCBvZiB0aGUgU0ZEUCBmbGFzaF9pbmZvIGZsYWdzIGFuZCBkaXJlY3RseSBzZXRzIFNOT1Jf
RiBlcXVpdmFsZW50cw0KPj4+ID4gd2l0aCB0aGUgZGV0cmltZW50IG9mIGludHJvZHVjaW5nIGZp
eHVwIGhvb2tzIGF0IGZsYXNoIGRlY2xhcmF0aW9uLiBDYW4gd2UgaW52b2x2ZQ0KPj4+ID4gTWlj
aGFlbCBhbmQgVmlnbmVzaCB0byBnZXQgdGhlaXIgcHJlZmVyZW5jZSBzbyB0aGF0IHdlIGNvbWUg
dG8gYW4gYWdyZWVtZW50IGFuZCBtb3ZlDQo+Pj4gPiBmb3J3YXJkPw0KPj4+ID4NCj4+Pg0KPj4+
IEknbGwgZ28gd2l0aCB0aGUgZmxhZ3MgbWFzayBpZGVhLg0KPj4NCj4+IEZpbmUgYnkgbWUuIEkg
YW0gd29ycmllZCBhYm91dCBydW5uaW5nIG91dCBvZiBmbGFnIGJpdHMgYnV0IHdlIHNob3VsZA0K
Pj4gYmUNCj4+IGFibGUgdG8gYnVtcCB1cCB0aGUgZmxhZ3MgZmllbGQgdG8gNjQgYml0cyB3aXRo
b3V0IG11Y2ggdHJvdWJsZSB3aGVuDQo+PiB0aGF0IGhhcHBlbnMuDQo+IA0KPiBJJ20gc29ycnks
IEknbSBsYXRlIHRvIHRoaXMuIEJ1dCBJJ2QgcHJlZmVyIHRoZSBmbGFncywgc2ltcGx5IGJlY2F1
c2UNCj4gdGhlDQo+ICJzZXQgZmxhZ3Mgd2l0aCBhIGZ1bmN0aW9uIiBkb2Vzbid0IHNjYWxlIHZl
cnkgd2VsbDsgeW91IGNhbid0IE9SaW5nDQo+IGZ1bmN0aW9ucyB0b2dldGhlci4gU28gd2UnbGwg
ZXZlbnR1YWxseSBoYXZlIG1hbnkgZnVuY3Rpb25zIGZvcg0KPiBkaWZmZXJlbnQNCj4gY29tYmlu
YXRpb25zIG9mIHRoZSBmbGFncy4NCj4gDQo+IElzIHJ1bm5pbmcgb3V0IG9mIGJpdHMgcmVhbGx5
IGEgcHJvYmxlbT8gRXZlbiBpZiB3ZSBuZWVkIG1vcmUgdGhhbiAzMg0KPiBiaXRzLA0KPiB3ZSBj
YW4ganVzdCB1c2Ugc2V0X2JpdCgpIHdpdGggYW4gYXJyYXkgb2YgdWxvbmdzLg0KDQpyaWdodC4g
QW55d2F5LCB3ZSBzaG91bGQgYWltIHRvIGhhdmUgbGVzcyBhbmQgbGVzcyBmbGFncy4gSSdsbCB0
cnkgdG8gZ2V0IHJpZA0Kb2YgZmV3Lg0KDQpDaGVlcnMsDQp0YQ0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
