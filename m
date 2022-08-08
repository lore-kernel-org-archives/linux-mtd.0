Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64F1C25B06
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJkDLBCw2mnkwtuDNHge3UhfzOYBqLyOpnYnAN1NrNc=; b=oCxjF8Ta7YBoHa
	ReP86sn9nfhMBAQAYv+Nvapi5zS8xf0VQfX7kAGpmdjgB0P6DPlzCR6VOU+faUvaGyWa5Yf2gHmwQ
	hSpEenAwLPwMvBUKRjjiY16YGV1mKda9lphVqNPLjp+pM5aGmfoD35smfbs2mSw2/EZ8vKGubjJgu
	/jM1GZhGfayXnIx5oSd9gOqPwsJ/U+p1VYaP7b3a8U1+/hJTE648VubXTYG4N+Oj1/JmZuUG+Es7x
	2f31FHAAvBXhW0jycNM41iVqUSZpW97dXFG+VP0fJe08uaL9j6sUj2S/+5+VKBCkN41XXAvZwmH1L
	3sEWeIGmU5BWetHv+Ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxHm-00C9JH-2m; Mon, 08 Aug 2022 07:34:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKxHh-00C9GF-Q6
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 07:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659944086; x=1691480086;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3rk9u0cK0RyyHCZ5CIANqRS5PmHzYB2I2/+/JHp7LIs=;
  b=FKQNKzdoD6CoS74CiPn/Lzlk6nH6FY3AhJbF8N+R4DqPRUHyBpdkN50a
   SfFAQK/JKEvMfeuBUVwskZmhVha2lN2BumhcosUnAj5eJC0NbiJRhrPbs
   l9WpXmcXq0rPUFyuAV9Gch4IK/t+RVMN6u24sxA5TIpPRXMYmCqUx+LEy
   5ilRj6iZ3B7cVUR2YkSpOF/xcXCn1O4zZS/y0jGLst7QJi45x72e7fdK1
   KLMHlS3e+uSMz+gg6PDTTC779sm2Z3gYJH4IXhKtW5oYENxeuPt5i8qvp
   tkQM64ZElcQp8n2mTEXUiGqrNFuwiKEl0eXbJDCUt2AmL6b0jmW4rcJVx
   g==;
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="168242942"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Aug 2022 00:34:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 00:34:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 8 Aug 2022 00:34:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A73cLNSHWaUMy9OgK4wcyQjK3DP7Kuhnvq7PLk3PwfuFRDQX2Vfzwz4LC0NOqitOdTxzSG7gwCDY3I3DdtvY+LRfEiWosy6/k3nIjY96CnGKZSBWgmFY8NaI8X1IBufaY6PFCNeboPOEDaCQPgkIxQpFMJuf/j27Sd213NALYAfJX3yFHYlTwm26tRB+rXk1DYA3qqILYcS/3w28YXwKPhT08ts0Rq5dia4yvy+RBpLYNNFFs5dze9vGPe90LFB3ZOUwqqT9I8r318HO814J0HcsSKPxyyw3NiHaC0e4JFlJLEHMCrkix/sgyq4AYIdlj4mSJHdFOO5hA19frRBa8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rk9u0cK0RyyHCZ5CIANqRS5PmHzYB2I2/+/JHp7LIs=;
 b=VQ4rxne6e/s6EidMwjtPoYUDbz+Kt/ISqp8dQ543DMUrZqG46aX1L2uS+fMpzbcQKKTRBR9kxewIrNDdNdqloXm8XW0dtjWW7eNWrvMu8fDaZmZMnGMxbTSvd2+6NDWGnZ2RNqU6T4c6V0P+lIFvMRdJrW/QH4mBn1cL0JYu1v0n6NQ4kJiH0cuv3IOQ7QjTtAn9eZcp7XJWitBt1R1ghHzfMUaTIIxh0ZHRtKLtn5g5nbf3AyhTULVGgrHTXpZwweDpUD10mCyAH8dTlUKrnTvm7eayENf35KlJPDYoDIXilbB4wYOjP5jisgZlCsz+bLol4ZX+cgktQLdeN8uvZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rk9u0cK0RyyHCZ5CIANqRS5PmHzYB2I2/+/JHp7LIs=;
 b=poD7hKs5+s7v3CzSk6GY+Tt2X+S7Xp0Va2p0T6045h6x1tvRegPJE+pP6bkGoHEMFZUTKKYBFIb1bES2fT3pJbricnqMTBxvF31ugzU8S7EUAWTXnbhjiiB5G3HZ8clS74oOcqdsEHMjZSZlo/ClIdYTIjURvsEzJHb9rCRIJJ4=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DS7PR11MB6223.namprd11.prod.outlook.com (2603:10b6:8:98::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.18; Mon, 8 Aug 2022 07:34:28 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 07:34:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Topic: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Index: AQHYquH3IGrZFUfrHU+ZRSwPyGM66g==
Date: Mon, 8 Aug 2022 07:34:28 +0000
Message-ID: <43b898eb-cb2a-d905-fba5-cdf707978af7@microchip.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
 <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
 <ecf3906e-a3c4-328e-09b8-1e801896ce81@gmail.com>
 <80b5e707-23b3-e357-c7ae-f78b6c75f2f6@microchip.com>
 <4a182200-cff3-94e7-12a3-379638a52560@gmail.com>
In-Reply-To: <4a182200-cff3-94e7-12a3-379638a52560@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 561935dc-da37-48a5-b7cc-08da79106d2f
x-ms-traffictypediagnostic: DS7PR11MB6223:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5t2Q/PM+dYVj+zMf4sQ+lE9GqLI+DtNaH6f20bojyMsb0nL8s3lnkJMpc3MT3BB7y3gzwV5PbCkiVyLy1LWZ0/0CUvsvaIrOtGNR+TPRAg5ORgNbVGGM2tMKh+zup7QKoeEunDtaTq43IRlzjLd+gHrNRAn0kOQDql+aUKTeBhjZHf6bxqc58EgzL6eSKL1249/l3r3AH9khn4oW9uIHxWzJ097OjrqLWz0GLuKPpuYXFKDnNhvOntBaM17ayj46ydVZuVZuqodb8/XKzUIjSmpyaCHKPz4DgbjYPoUg9r/3da3N2LwxdV83T9wAkLKCjQNSt1EsStmUPgL74uNWd0G04c2JejWVHd/qMrPRJoxSDD6Q+tNJIoTUZWRqYofGY6EA03VwEFRTS/O6LaRq8fmo9XvSL/mjhXiN7nAuJMhAYlU0Bi8hbR01gMowq6Ll328VXHXT/7BXVLBK5wuMb9c1NLlzhblnIsSEqSFbmaXzHgZgUFryuRfeUZYMDr0zQirQXdAEuSu6+Oihbjc35vkhZSDREnu0sIcIffO+qHZcx99tVYZau1RWuDU8SSjndEBklVKu/+vfOlYxnv2ZCLV00Kx0gDhfein4g0sxilTU23WvMPJyuOwPsgKGU+XmcN++AvL8aenShTsfYngRsk4u+0rzOGEItkpVYVqIK/3L1NXLB+h+KXzcxcUME2RrOOAiR3g8EflIcJ167QpC8I+T4s5UTMory/VCbsRiAwz5x/KngRm/+dYoMNWVKEM5MWUtwEfftDO8o0hgzUsL+4epmpcnJwttZDieSnjmggvUfUyGhK2sQHkcMmUqdTrsPMeqfeXu3EqMaMVcE9wzJpjiZ34K+XWRvXxEmdhRe1tsJPywDx7fkIJ7BeLwA8xdtDpFYA+zLxQZ3I+uSbOFjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(136003)(346002)(376002)(4326008)(5660300002)(36756003)(66946007)(71200400001)(91956017)(64756008)(66446008)(66476007)(66556008)(76116006)(8676002)(38100700002)(31686004)(316002)(8936002)(478600001)(122000001)(110136005)(41300700001)(54906003)(6486002)(966005)(26005)(186003)(6512007)(6506007)(83380400001)(2906002)(53546011)(2616005)(38070700005)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFkyazRwUXhMZzRVWStFdittdEVjb3BZTkZzYzdRQzBaRmcxSmtlWGYrNVFl?=
 =?utf-8?B?M01kR3NiNUk4ZURmWkd1MUhlWkpaTEwxbmUwUFFnZkd1TDUwcWFSZEFRWThU?=
 =?utf-8?B?S3dpOExTWmtlNXdHSFI3ZHVUbHQ3bXpjU0lmWXN4cm41SE5qSWlwSlhRL3Bj?=
 =?utf-8?B?Vkc1Qi9rdXptZEN1K29FMmErRG83cmhxc1JPa3VlWWlKeDVwekRBMG84aWo5?=
 =?utf-8?B?OXRrOGpMZmJ4ZU92TXlWZmtxd0NjOFhSdHA2bEcvSnRXWlhkVDkwWjhNS2Zl?=
 =?utf-8?B?aExXRTdRbVFPcFMvZGp6RFg4RnNtNzdtT242aDdMRkkvTkN1c016MThQSXpK?=
 =?utf-8?B?OHhjUlIvQXpwcUdueVJpd3FwMlU5RW1zZkJkVXUxUVU1emhEU1ZYT3dtNHVv?=
 =?utf-8?B?V0d0U01abEZPMkZ2dGc2K3Q5TDJOMld4UGFCcktMQlJaVjdPV2RHa1djblRs?=
 =?utf-8?B?cnpscmlhWDc0UCs5Y1Q0S1kxVmZybzRJdW5WNWRYWC83TzRzZFE2MnZxQTJ2?=
 =?utf-8?B?dlRlTUVHdEI2RXFVWFo4WC9kZHBKR3gzQ2dYZDVyK2E2UWllUC9xNUlCUzJo?=
 =?utf-8?B?ZTN5MzVGWUZoZy9UY085ZFRIZEhIU2tKeU5RdHV2d2l5TEtOcVN0UzBadGY4?=
 =?utf-8?B?VHhXTGgzcDZPY2QzTkpobU5ocDdMOXNKd0FIakJJN04vMkxoQlZHbFlBUDdW?=
 =?utf-8?B?VE1NSVVvbkxYQVFiQlNYWkNIeE5MZk13b1RLVXYwMFFsckp5NFo5eVhqaGtL?=
 =?utf-8?B?a0FtRzd3UDAzOXRRNW5SRnlaNFZKSUlNcHJzZXd1MWpnRHlqUFVEbjU1N0Rt?=
 =?utf-8?B?Rk9YeC9vcWtXWlFLci9JbmVHdVBmVmEwZUtxOHlFamVuSHhKaThOZ1BNU2h2?=
 =?utf-8?B?QStKRzhMMXZaMkVodzlJTTJwckdXVVBDUXRxQ1lqYWhDNWlDUDQzcER0a2FE?=
 =?utf-8?B?OTZHUEFTdWZCK3k2dXA5ODRDWW0zOUJMRFNnK3lsbXdJeVc2VlZab05LOHpF?=
 =?utf-8?B?a1hqTmZTMGtNdDRpMTA1Q1ZWWUpjcHVvWVZyZmZ2MWQ4dVFObkx4OGtNZGR6?=
 =?utf-8?B?cGtvcGxia2thc0h5MkZjZERCa25EN0J6SjRMUXBEZlVTdE0xeDdDS2R3dzVQ?=
 =?utf-8?B?Z29xQUVHK0poMStlZUxDWFlaNUkyWVQvWjFDT3AvaTFkOG1MTEpUQzh3Sjl0?=
 =?utf-8?B?TVhQNGdpajh5NkF6QlJOcDZUeVVsMkMrTUl0YVVSbDlwK1ErdEkxdnNUYnhC?=
 =?utf-8?B?cE5ES1MxMVBrdkpZaXIrWm1kQ2JhblJiVVQ5V2w0cHMyNjBNOEwzSVhzNXB3?=
 =?utf-8?B?OFRkczBUSlRISHBuTXRxWU5QSGt4MmMxMlZIa1p1azkyMjRCR1hxZ2RtcFhx?=
 =?utf-8?B?K3o2c3Q1SEJpYTVwT3B3K1ZaQ2VVN0RoZkVVcitIRHZsekZ6NjRqakVKOXo0?=
 =?utf-8?B?bjFJRGhGV3dmOUlWTW9wOVRxZFBkYUFvZzZOUExUQlV5WVJUaitkN0F3Sm5Z?=
 =?utf-8?B?cnRFaG1PdVd2T2VWVFhDcmlpeWtDdmxHR3VZR3c2T21Fa3JjZGhBMjZXMitO?=
 =?utf-8?B?RzRWSEQ4UW40ZThFN05hL2podTFadWRYeDhXSTJ1dTJmVmltRXBlOFBhdXdN?=
 =?utf-8?B?TEZHRWJHdU5zbzAyd05EdE5Gd3ZOcm1uVWhyR2kvZktGNG1aK2piUHVaczR6?=
 =?utf-8?B?TGxiV0J0STNlRFJWTnpqVzg5cGxYQllpUDhjV2Z6RDFkcmFlaXBrY3lpeVBV?=
 =?utf-8?B?MHBMMEtWc2ZEVDBBSjhRMHhIbERzak4rUno4MElsNmdwQnRnSExsYXVBaE9o?=
 =?utf-8?B?UGw5V1FBVU1mVUt0RVo5OExvbWg1T0FzUjZHMlhGdEpOT3VkdnRLdzBJUk5a?=
 =?utf-8?B?Q0ticGRSbVNuQXFnVFhNWkRqYnl6bVlIcmRlRk1tbkY2Sm5JaGhHeTUvaENz?=
 =?utf-8?B?dm83cytZb3dUdlg3NXc5cTF1aksvd1hDb1hVVHljQ2JZV2VydWxTZ2xZcmZU?=
 =?utf-8?B?WTcrUEJxTmhNOHVnaWdPQ1BPZDl0YlNETGpJQmVBdFptcmJzVEIxQlNETmpL?=
 =?utf-8?B?akYyMzRxVHpjaHgrWjAwc3JUQktHL3U0VW82OVJPdHBWWUtrK29xL3RnU1o0?=
 =?utf-8?B?MURUaVBJWEJFNGMzOEdLVVpmOWpWY0M3bTNERExCcmJ2VEJrSTlqbTRPcnUx?=
 =?utf-8?B?cFE9PQ==?=
Content-ID: <95930AE25156D84C9DE8402C19836EB1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561935dc-da37-48a5-b7cc-08da79106d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 07:34:28.4158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiXCiEg/ONOeLQe3QlE5WokoFb5DCR4CjUGDKYiMKw/5hybYBDzTI2Zxz22CXf6bdGtQTcjFKk/Zcvw13zW1lu/XkC4++zYuvwryzxP7IQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_003446_149412_3C60BBE0 
X-CRM114-Status: GOOD (  26.38  )
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

On 8/8/22 09:41, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 8/8/2022 3:08 PM, Tudor.Ambarus@microchip.com wrote:
>> On 8/8/22 08:42, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 8/8/2022 1:47 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 8/6/22 09:34, tkuw584924@gmail.com wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>
>>>> Hi!
>>>>
>>>>>
>>>>> s25hl02gt and s25hs02gt
>>>>>
>>>>> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
>>>>> These parts are
>>>>>   - Dual-die package parts
>>>>>   - Not support chip erase
>>>>>   - 4-byte addressing mode by default
>>>>
>>>> CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
>>>> only the first 128 Mb of die 1 can be accessed."
>>>> So there are flashes of the same family that are by default in 3 byte address
>>>> mode. You added support just for a subset of them and used a generic name,
>>>> which is not accurate, right?
>>>>
>>> We added model #15 (3-byte address mode by default) to address special
>>> requirement from a customer who needs to use bootrom with 3-byte addressing.
>>> Anyway, I overlooked model # difference. Thanks for pointing out this.
>>>
>>>> Can we instead make an algorithm to determine the current address mode?
>>>>
>>> I have just found that we can distinguish model # via BFPT DWORD16.
>>> If Hardware reset, Software reset, or Power cycle can exit 4-byte address
>>> mode, that means the device is 3-byte address mode by default.
>>
>> I don't think this will help us. It doesn't matter the default mode if you
>> have a non volatile register that can be updated and changes the default
>> mode.
>>
>> Are there any registers/data that can be read successively in 3 byte addr mode
>> and then in 4 byte addr mode? We'll then compare what we receive from the flash
>> with a known value and determine the mode.
>>
> As we discussed before [0], if address mode in the controller and device are

I remember, yes, but without determining the mode, the driver will work only
with flashes that come with the factory settings. The driver will be unusable
if someone changes the address mode in a non volatile way, right?

> different, the read data will be undetermined.
> 
> But if we really want...
> Compare SR1 data read by RDSR1(05h - No Addr) and RDAR(65h - Addr 0).
> In most cases (without block protection), SR1=00h. The value of 00h would be
> awkward to determine if this is 'real' output from Flash or not. So, use> WREN(06h) and WRDI(04h) that flips BIT(1) in SR1.

Would be good to have more fixed/OPT-like bits, or if we could change more bits
to increase the chances to not hit just some undetermined data.
> 
> Therefore, something like:
> 1) RDSR1
> 2) RDAR with 3-byte addr (000000h)
> 3) If #1 == #2
>         4) WREN
>         5) RDAR with 3-byte addr (000000h)
>         6) BIT(1) is SR1==1?
>         ...
> 
> Or simply WREN -> RDAR -> WRDI -> RDAR then check if only BIT(1) is toggled.

Both may work, yes, but making the assumption on only one bit is fragile.
Can we use the Read Any Register Command with 3 and 4 byte address modes and
compare the values? Are there any registers with fixed values?

> 
> [0] https://lore.kernel.org/all/070bfe6a-00e8-1c59-c9db-52d249dfbcfe@microchip.com/
> 
> Thanks,
> Takahiro


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
