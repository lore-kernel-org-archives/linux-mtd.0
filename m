Return-Path: <SRS0=PxVx=PH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A843C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 10:18:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 004AC6137D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 10:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 004AC6137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Lj27G2aDo77gExCimhQ8gmJeF4e6SgN4W7xhnuk1FU=; b=gOtnV9hJJLTgU6
	QGj2ZomfQKm/vJT47h8MPHl0/ka1sSJWIBrMY3+Oc2GQPkEG1sqV+YAcxYU1N9w8tWNxU23ozi86a
	r4qgyub8bjSoYgoTdp3wuOCbgpVJ2txXkCRqvmeZsq/lWy8CKk9fiLm3aWrdPHLVm6TcCYGu5wAzr
	f14jRnAqfdRY+wp339j7nDx7bFkJwilqvKh3W6W5WwLEpq/As5wf1bImWvy128m70799b2ze6WiqN
	7tDy59ljfH6BMb5N6/xIcTbMZcMd9PUV6lrUGFW4cfT2tSiz36kgoP3gNqstuSWomN4GIdfx+1S0d
	opzha//b+n/pRo4xTq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcmBq-000myJ-1U; Tue, 19 Oct 2021 10:17:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcmBT-000mru-Ho; Tue, 19 Oct 2021 10:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634638647; x=1666174647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JSnjyzrf+ZE90YrL5vtm7KRM1eOYGdjI46dXZsBeZmY=;
 b=uLpSGxZcudMMmQUiXTmPEX3oElmZJezO0/IZbLOI7pqifiVDUS/SduQY
 SEBqPJU5bmWhWnGSc15NKS4TzoLL+tJhVlj4AgWDcFues08hCg+Mbhu8h
 bkg5oXvr02k8fgIZH0lx/10gkw/vyrrxy3MCuztzDsHxtcznJG8/y0jD6
 9EO5bIQw+V5W71PHBhw7vY0qwV3IfTacyIDOaDDPzRMWVPAEilZmVD+XF
 R19FyU96XsBmPt2GKnagprUAdARaMkIi+VAh80kc9KPNBZQN4PMVIBC6r
 2ZlUCGAg5Jij6V8cDnJJr2h2DTF2zSO5hE6LxFTqcgAnvDqq5VyHn2/Eo A==;
IronPort-SDR: KPWX18vhSZRhQ2xZhWy1wQZd8IWTJf8DzVyNkQSBN68fRUoBdNPJyaUbJX8amtd9jD35ogs4vi
 rb83VJDrbRzXKQOdKg6+1tLkKcf0HLXChOJ0iM13I1m4TOflHrkhmJWsKxdudwbcHjzOpvrm8w
 sYPbMRUBaZUB14R++Z8FllFnUCGVqrAfO12XuX0VetjNHitIepBwQbdA+0EfBjSQZDhRAGGXf0
 W+A2wWK1h38b4qFwQsVwsa5Q7JEnoHP68hyFMWtxAnHmuNuMAjhXc2P/xX6cbbrkgelT9vioBe
 UT5ljplJHfWdneeXeQLrhLw5
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="140855663"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Oct 2021 03:17:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 19 Oct 2021 03:17:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 19 Oct 2021 03:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9R/+zuHQAa2/ZtaLBesZhGIXpS0ojd6NTBX9cXpYMYcsPzEw6hVDwAHYpmkkQXCLXS3bfHeYUlOB2ChR8FhoN+4xjHpSikjU1ai+YaOub3MpPPKaf/N2h5CeGSBmHL66NFuFN8kSOPJC+pb/V3Sxdz6YWsIUT9luLgn2XBod3NoaxIiflYLzqEzWZpb8y5ynIizvyWrfjLOrpnpCTy1/uRrpn4pYsSsR7+NHmrWAFcxN3bBEoEe8nfMUZseOuvFzwnCmJQCNlYxL3KUeSYZPxVIyY36xJxfZsdPvfHNc99+h0mrkiB+26CdzieKTSCtMaQhFb6r7cTHL5DMpXoyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSnjyzrf+ZE90YrL5vtm7KRM1eOYGdjI46dXZsBeZmY=;
 b=hSr2U+68wg4rn+7983SgjFPPCEKikpRDsfC7UMHK7r0jzMmXHhVcctgeqJPsUrDVoFBZZCrw1CjRZLBXLdYeTu6uhKsQ+TdAfsih6qRVy4epSZI/FdlQvx+YptEDLrbxuL5rUTiKjJKrKL8aJ9XCtcJLqKJ7f1ogA/Sw90BMa/B2dsA97iNHz5qm0C59ca8tPPqkY3+LaSmWyz9F43hLCfkCJipdrsgCUuVyDSScFQgeZInSwwfA7M7z8yiKXCq+lA7LAbkeqHpVP6SQfsC1BZyuQNVRSyZE9Yz95AhPgXcnExQraNObgTejtTrRMHg4DnsPx0M9XPwWgM5JmwVT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSnjyzrf+ZE90YrL5vtm7KRM1eOYGdjI46dXZsBeZmY=;
 b=iaEa+RIswsN8B1E2us4Ov6HdnMVeSkYT7NkJ9lUkkTkprzJM3PcspUmO+qPZcw4CT2/o0R1Hqg9+mNXfbe4Ud7D7GP5yIn4oGotYPCzGAGkT7pDnaZ9uYnvoUTs5QhvFyORySfchUfXVTMg9AcBH9vWjN9RWNmla+CAsnLL7PwQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 10:17:25 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 10:17:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <caihuoqing@baidu.com>
CC: <vz@mleia.com>, <michael@walle.cc>, <p.yadav@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: nxp-spifi: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Thread-Topic: [PATCH] mtd: spi-nor: nxp-spifi: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Thread-Index: AQHXxNKDayCUSXexSU2aOIAUDkf9kw==
Date: Tue, 19 Oct 2021 10:17:25 +0000
Message-ID: <79991ede-709b-9897-094c-4ac8eea39054@microchip.com>
References: <20210901074307.9733-1-caihuoqing@baidu.com>
In-Reply-To: <20210901074307.9733-1-caihuoqing@baidu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: baidu.com; dkim=none (message not signed)
 header.d=none;baidu.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 794ebbf2-adaa-4f62-e324-08d992e9a5af
x-ms-traffictypediagnostic: SA0PR11MB4687:
x-microsoft-antispam-prvs: <SA0PR11MB4687A63EBB7333F8A19F90CDF0BD9@SA0PR11MB4687.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:309;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NhKwZ9fuWxDuckgn1pn6BOkqboA3ALzhsemrMLucV9P1O2H1r17EvgdgNV2PHMoE/DtNKOwbCCkNG0sdGod8ObPjqtfwlj9N3PdpWqMcYyqmepN3sLMiwAP1673BmVtTnWrjKxDnzTvIJAClLF/WjCZK0OuVOyDDko11jxsHQ23+Xr7sYnHCGRBZpM3fcY83UbF8ZWJunaEvuYz0Tjp6mOQkHbUPlkvL8F5NlfSzXFqM6rLTMKZGbzRviiXHBVBdl5TCvD2cKKRelw7WzqHG27kRMemKi7iPeMRKDRF3zr2jmrL30eRXJBC26f4914fz+jdj3MAnnH3Li19qcP2Vgaz+RIqcNbXi2TDS8EJx/C8ZR40UIgVDUzDdCfxhtSb48XPKkeEjqK7t8y05KVmleivOitSHC//Hk6lsJPXMtZxN5e3G4tz9A6wFzZG57wZ7gHO5J/FE31kOpY5Yb6jFaO+1mNP3IS9HvVpAT1OjAf775lHx7Wn8hXj1Yg7PDWKK9QxyCIAurHX/IC//JOE9c1L+khjHFvveBee6Bumx4XQWN+OO7yP+D0y4UXD47lYBloHrheMvIPppBNVOSjYNBVdF4rYzNMuuFaVrJ8IvXzUwBRveBDTO1uNocNEx7yzaJz3lAuzxufd/omDOGeMu6snLgvibF8cPrjZPs/d1Suh6ic2UYpn1Q2dbly5r9eCxQBGUQR3HYrbZS5TREBWKEnyArJh3I4BnMg5sGfAFASfD8JzTlh9RsiYncu4nXEl0kiiZoBfe7Aa9Duo/G5MnIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(38070700005)(71200400001)(4326008)(2616005)(66946007)(8676002)(66556008)(66446008)(6486002)(31696002)(54906003)(122000001)(186003)(31686004)(6512007)(86362001)(66476007)(8936002)(76116006)(91956017)(5660300002)(7416002)(36756003)(6506007)(53546011)(6916009)(26005)(64756008)(4744005)(508600001)(83380400001)(316002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDUrMUhudUJObWlLZHJSclQraUxDbm5nVXQ5WWNCYUtQanVQNC9IWlhOTkx2?=
 =?utf-8?B?cG42TXpCMDFIejNPTGdkRE9Ub3ZnUG5QVHJPYlZmU3ViaXVKam04SUNJaTBt?=
 =?utf-8?B?TG5OR0wvSEdCZDVUelJYZlpCY3lwOU5lZW0vYW9oUHowKzl6dkJ3blhBRXBR?=
 =?utf-8?B?Rll0WW14UEh2U1dsRGc0V2h4ek9LVndieE9SM3ZmcXUzMnhiY0NrQnBLQ1do?=
 =?utf-8?B?U3JlT0hhSFFScldWZUZER0R3UlBGTG5tb0Y5bWVwUmZvSUlxQ3FBa2lhVnBP?=
 =?utf-8?B?UFBkSGRKSTBSMkxidHI3NGFjT2NuYWloRS9EblRyamdRZ29FYnZYTXFvVmp6?=
 =?utf-8?B?WC9BVmFUcWQvWktnZkU4ZDhBRmdOd0J5c29aVnRldmVrZGczdGNMRm15empm?=
 =?utf-8?B?bWU5V1NDRHVCRUVFbmdVZVlLUCtLSnVlWStCY1lENW1teU5kVlo5SDNBVmxT?=
 =?utf-8?B?UDdMQnZ5dEM5MTcrZURhL29LdzYzbC9Wc01rNUl6clpQZUJCT3cveTNmQTJP?=
 =?utf-8?B?T0ZnSEhCM0NrNnZJbjYxa052TUUvT3RFUTZsT2NjSkxhSkxRQmRWMzE2Mlhn?=
 =?utf-8?B?ZjF3NE4xRnlvN3NWbG90UGN6NHFXT0tmclE3S3p2NUJFUHYyeHR4cG85K3BO?=
 =?utf-8?B?U2ZEK1lOQnN2a1J5czBsT2s4emVBaE41V0ZWQXdjVGNQaStPcWRucE44Zllw?=
 =?utf-8?B?cWhiV0hkVzlVZTFWUm9wdHpWNy9CZTEvUnFSTlhrMEQ1VGFxYUhYZmwxdDBZ?=
 =?utf-8?B?aUVwd1UyKzU4dVovZ3U5Y1RSNEVta0tmMkpzREFGc2xkYmMramluOFlvbEd3?=
 =?utf-8?B?ZzZKN1BRUm0zK3lMQ0ZzVHQreGgxT21EcjVOeG9XNTh4c0cva2NJZ2JkdWZY?=
 =?utf-8?B?RHA3Y2c4TXY2c2JtQ3F0cjB3R0d0cVV4dFJVWmtJNWFvaUZabGJsLzlteisr?=
 =?utf-8?B?NzZOL2xFa2VkTGxHNTgxK0R6RmxYYXFOSUQyWnJEYjJiNElYYVlGQm51MmNB?=
 =?utf-8?B?YWJHVjk5TTlBZzhselBZenplMGsxOVFEQ2tyL3VDc3VhRXpMOVRLUGw2UW92?=
 =?utf-8?B?ZUNTSW9FbVhxblN2Ym5OSzBiOGc3SDNSKzZBUGlTR01KUEdtN0Z3VUpiSThk?=
 =?utf-8?B?NUNhQkRBN0FlQWU5MzlOSGUzWGptNGNkeUxZS0tDN0ZQUzlKMDBnbFc5VWY4?=
 =?utf-8?B?TnAvS3VETkl1L2t6OUMxaVNjaEk5WU05VVY1c0VYSGRaMkRtb2FGRmxBb1Qv?=
 =?utf-8?B?UFpuZVZvUnhqUndodDNjOHk5MVVOWThlaUxYNFJTbTlGVEZUZzdhT0ZnNTVl?=
 =?utf-8?B?OXk3OWFCMEJIMG5leXloMlFVa0ZOVW1pZjBtM3hMR20vV0FoaXFwU2VneWd5?=
 =?utf-8?B?ZmcyclVKWFk4MmlTSitqUWZZRzAzMTRhdDc3OTcrTzN1b3VacGF6UWtUbC9P?=
 =?utf-8?B?b3BqUmJwdXBvbDU0dFNqcW54OWlVdjB2T1IyY1QzSE1CZG5Nbk1UQlhsQ3Bv?=
 =?utf-8?B?MThKdFZUSW1LL3BQSDRtckJSbWNMaWh0ZmYwaGdXNmltZ2drZ1I4Qk1DZlU2?=
 =?utf-8?B?ZkhWYnRTaVZhai9BUXREZnEwY1hmL0VPeGN6a3pnRUhDTXgvR0oyVVEySHVP?=
 =?utf-8?B?eUJrR25BdjJtM0tNaVcwVitPSTRpSXM2bUczSXlpMStSWGZiM25sbXBYZHo0?=
 =?utf-8?B?MjZ5RzBMeUZYMHBMb3BjQmFWcDNoQkhUQ3IyVFoyOHRjdWdQTUFXM3MxMGxC?=
 =?utf-8?Q?YtvpavF7KtTNHliUEM=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <5DB3219E6FC6FA48A20D1347B66C704C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794ebbf2-adaa-4f62-e324-08d992e9a5af
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 10:17:25.3194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0XOL65w1TvV2VcZn+EmmujSXIW89YiBVPLsQSvUKY5B4v2BUA8JWXZTCNmYIxlwnsXbnk7T8XgyIh/0UzvhVA9QC9nxHUhXMPjvicMnDhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_031727_628878_A8B0349C 
X-CRM114-Status: GOOD (  11.31  )
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

On 9/1/21 10:43 AM, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Applied, thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
