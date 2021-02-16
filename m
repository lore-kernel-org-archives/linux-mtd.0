Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92A0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 11:16:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D80264DA1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 11:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D80264DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EK9tMysX9qslUhehKwXBIudUXsB/kdbTanr9vEc6KPw=; b=E0p4Clk0ivemflIiSRgdYWTwy
	aioO5kiGe9lV7lkQ7XVZV0P8UBTL0c7GuZfAqvZdGU7tK7w/uzgJ7OKFm0Tht+NEAAXBvNaJOMnt6
	BAU77aoCBpotGVPZ1sSet8CjxdFLD724qu9lKlD/IjrDx9N9SLiYXOyqrpx0Bav+Otxe/5YmKKCS1
	/ufvS556LjATDpclkZpLLO/qRfV1HjhLrQ0Bu6uoKICwVXGQpdgWYxtXYQKg/Ubp+meTRlDMIv3X+
	3Lj7MtNeofXlBpO648Ai+X7qobaAr/3INqdGlSabacWEvZ9Kzczs7X1RFz18Xag+7qQU/z+Kl3e+3
	rPFVY44rQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lByKY-0004pP-7M; Tue, 16 Feb 2021 11:15:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lByKS-0004oB-9k
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 11:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1613474140; x=1645010140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cl8g13edecJa4NpEpWJshmuTF6HbiSMyk0OThcOhHHA=;
 b=vSzvBc1KXvR42ksJk1e1ac93HdL8ekuESxG9w9ACvDt86U/Wio9YEO4i
 4zJUl0KcOk/E2wv3hH/13ok85uKrFEA4PSsznGKFwjSHE8qp6CBzMXFvw
 wMoVE0bkTnOvRlHEOEwRphHI128arBLoNIqXklOujbnLZnfUF8XxuToFn
 yQ3pfLCUZI0XrOdggFUx7+19+7peYdJDRwViytMLpjX3Gx2NAZ/NeT2eW
 OM+g+ggY5wVhVrf7fbY3VGR2oV+95FQp9UQ6NsFMz6XyBBm9/tMj78fyp
 i4FIPU7TdBhsF3xJeGInjipaA+16BULJwQl4p0B1JeNGHmURkb7PBtsgU g==;
IronPort-SDR: CxWSJLIRB/UpedIp8AjCuTanOgJHe2MTaMncRmsUMYWHq9zRoIVuTq1H90+X00sncwozRYDVM0
 CO0eqlTpLixeEaeGrkuS1h4gwK5zOns2Ct8lnkjea0v2ZBKFoC2AynTcqeQi1UXtBOB1DMwDzl
 rPhJCJJHFEeeG0qI92Mc6prgv76q1K/sJ1KjfrEGgFSxdEo0I2/HEyEaGImlp3jNImCnS9R10a
 7gsKoHhNI2E/E35TJxIQwj/ENDIHFAjLmC9ziOvVP0nab+EZKpCmyHce+HCNu1R5cGirjY7+sw
 lk4=
X-IronPort-AV: E=Sophos;i="5.81,183,1610434800"; d="scan'208";a="44246355"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Feb 2021 04:15:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 16 Feb 2021 04:15:35 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 16 Feb 2021 04:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC7o2rHERQ28FwXPvAMUa1V0goKK+V+wiUuDZ/S5WQtMEjwcNLHOBqI3FHYaGf8xkzI7B7jyEaCsMRrVYQmjXTIg94pH+r4c0d3PiPOfkpyIiWko/RAyYWCfA2zhOjcisnPTrzINPkOZvwAmKHWz0XVzH9x8QPqn9F6aEK9sHCzYTD86UqDjpf5kza/WvcR8z8k01YGiYlCblrMSCrRzZgMfb8brL9Nh/9q7jaQIbQh9a5/gRXU77ydkxvJo7hUTvBeCqZJAddE2okBx/ym4KrfoBYfw1PMw4YyV7QLVjk09cM9ZyJ9d66ofh7kO3XrxOgN3WoC3CxyeYf4cito4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl8g13edecJa4NpEpWJshmuTF6HbiSMyk0OThcOhHHA=;
 b=U3DhYE+adn+mfcjN0ylPTTxSyRz8AhHEmHav5tyzspmzU27rSPT2rIq/gJ9SYVPHWp+U0oWliXk7lCEPuTH7Mv7DCcO8uZyKUkyUt+TUkg9FVDooN+C2jKTxRmdqdlwmBf3XLb7jJj7YSOXH9pJYOqBm95fVtBuwq/GET6GPK8OkGxMJXz3AJcCwha3JbZjVQG3KPjQS+Ho5TVF0IRdsrU2CDEsYwRrXU0vZvXjQu3R32YYfQMEc6wkbw+8r2jLHVjvDYCb6XNDOzC68lI8kbX1tLd565LE4T4ffSGoAgsnNCwBGvbPzQxQb9h22YUilPh1lyTirGfeUJfdx4dYqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl8g13edecJa4NpEpWJshmuTF6HbiSMyk0OThcOhHHA=;
 b=slbDpcCSdAp6fEyyYONIM5lc1RI3V9foHfAWqHg02sfWMuNEv2m69r+qzox3tl6Rde2neW8Rq0UL/mMr8SWrX4tR2j0WxMZaj/ftWqS7fhN8cs7Z8PM28OPZY3c79AYJxqRL2p8HiXvsnXpidGsvQDq5UORCqGwYCq4XoH1/4ec=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (20.182.128.87) by
 SA2PR11MB5033.namprd11.prod.outlook.com (20.182.117.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27; Tue, 16 Feb 2021 11:15:34 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 11:15:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <ycllin@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, <juliensu@mxic.com.tw>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXBFUKEDYf95dZGkCecCm8j19FKg==
Date: Tue, 16 Feb 2021 11:15:33 +0000
Message-ID: <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
In-Reply-To: <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b0da30a-01ee-4418-8658-08d8d26c2ddb
x-ms-traffictypediagnostic: SA2PR11MB5033:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50338B164FE718D8B6F0D1E1F0879@SA2PR11MB5033.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +uFEokWoOVty1tngkOk3RJImNF/guYhPl3kKC7M6VrB3ETudFYmJ+Lo9u36xUu8MeFoLpPF5VB1L+r+/pD7CNK+XV+14gFtq1+VYyzxckYsXzIle69AZ9sEqifPbr2BzkA7PQCVlboHX8hGT8Hr+unkydgTYxjexYTpQtNs187/o4ZN6GDxtFN8EVPst05TPWNqDh2spTgETv2cXEEjQ6RIWVQ41HIhBrjB7u122ciqlRETryYWj9e8egEC1qBKZvI5JngPgqezzOzy1DGjgDm73iKmRjZ/NBxzutyQew4svQvJC+RPd/UPq9T4QeAFgXAnJ8h3NOU3YLENf9hcpT+zaA2lEIUrHd4W2W1OylEEY56ZaUMYKlJXv5QdozH9zS/gENktgCb0Vlaf6QavA6Mdzd5hAeBO5iF5ZVAS6trrX9cTWGPpoUaNk8iieQv4h/cc3vMSaHSlDMEWwRFRFKu1R+d7oBfW+k5LgvtQdoewqVcFMyX2Acy+wQGweg/LbjwkcMMLqvbtvQ1BEjFHF8rMww9xVstRjIuT7vILHO/YbU8xmmLQ2bO4jO6/wA6Vpbs5EK68UretYwSPMoEVeV1D/GLIim15BcDeXfs4tasJyzFujQw3ZWC8VfMRj4yXI0Aq3DrZlNSGnyjvF42EWJlIesaJ42l74E2yWBN+NhLUSiKO0xEN8lSz5UVW4QJvi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(39860400002)(346002)(136003)(66946007)(6512007)(64756008)(91956017)(66556008)(66476007)(110136005)(54906003)(76116006)(2906002)(966005)(31686004)(316002)(66446008)(31696002)(36756003)(6486002)(8936002)(186003)(4326008)(26005)(53546011)(6506007)(478600001)(5660300002)(2616005)(86362001)(8676002)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dXp6REptVUUrVUVCWXVaSU44cXIzdHFKd3hLdW9oWFhMOXBmbjk2cVl6dlVQ?=
 =?utf-8?B?THE3dWRYOEV0R09ybkVFTmorRnV6R2dtWXR3S2VoemxmeUtBVERMcmY3NFJM?=
 =?utf-8?B?d01UTEVyZGlucXVxVXAzMmdvZi9CTE12TTdTMk5qb0Q5ZVpZdzZ3Tk5ybWFP?=
 =?utf-8?B?RWo1N0dUZ3hlME5QNW1DeDUwYXFuNnNvbmJTdnFKSGRjVC9Sd1BIRDYyeVlW?=
 =?utf-8?B?Y1p3WjJpa1NvWkhhTmJoTFZsWms5Rzd4VHVqQUdYN09wMU5zbXJwckRMb0dJ?=
 =?utf-8?B?YXdocFJ2TkJod0tNbUpnR3MxYVljaHVkcU16THdBVmVZZURBc1dpanVPM2VW?=
 =?utf-8?B?THQ5dHFkOUJmT1BGei9XR3p1S0NxZU1ERnVhSmZ4ejlZUlZZRjc2UWoxKzZ1?=
 =?utf-8?B?RXg4Y29BNHpvV2VSTUVQeXd3YnNLVWt2UXUzQ213L3kvS0MrUzErMjBZWVZt?=
 =?utf-8?B?eWNqeDg5RXIxdmR3cHZhaEFpVnArNk1PazdYZWRpMkl2dEdNcmdQL0VRK0NT?=
 =?utf-8?B?RkMyb0NMUTVWd3NIdExtcnRDMFZMVmppSDk3TUVKWWhHTkVmNjhOdnAzTUJ3?=
 =?utf-8?B?d3BwWi9WdjBVb2VzZXJBR3BvY004M3BlS3c2T3RFc2JKVVNCeVUxajJobGhF?=
 =?utf-8?B?N01YbkJxdmt3VHZkSFJGNDlyakFlckxWcG5yMWFsN1QveDUzOVY3YWJZZjcr?=
 =?utf-8?B?SmhVVDdnRlcxY0h3ck8wbFMycVF2T1dVeThDc3d1L0N5ZFlNUHNFWDlxWmtH?=
 =?utf-8?B?eVI4Szk4WGl4Qm01T1dNd3hma0dUemtaOVZLanV3Y3ROUzVBNTFSa0QzY1ZS?=
 =?utf-8?B?UXhYdC8wREtnRDFJaFh3Z0VZdHA1UXdZeUlOd0RaL3JZNitYOGpWdkpEbkho?=
 =?utf-8?B?UWt3Z2sxNFJsOUltQkd6cHpXOXh0NXU3UzN6OXhsMnJtSGIzTnBTejN0VmVx?=
 =?utf-8?B?bVl6R1NTRzU3RllyOUZEQ04zanplUm5IUllsTVZlT1RHVkltQmkveGhjN1E2?=
 =?utf-8?B?Mlo3TUExQi82Zi9sVVhucGU5STNFQWY0WlR0bGl6SGdTak11UVZucE96blAv?=
 =?utf-8?B?Z1ZTUmU5RlltaHk3ekR2K0U5L0libCtaVHM3OVo5eUM3dmQ2TVVsa0UvdzNI?=
 =?utf-8?B?eTFGaTQ1dzRsMTlQWDk3YTdHR09Nd3lpZmpSM2ZsVGVYZGo0cysrMStUWFZ1?=
 =?utf-8?B?QlhPRnY3VXhiM0cwQVIvNlRwUEEyQnlEZGFwaWxCajUrYjlIbXI5anRKSEl4?=
 =?utf-8?B?NmJBZHFjNzZIMmROTzFDQUdvN3ZrNitRaHdFaVlQNU9kdFpCYVFLUUwxUkFF?=
 =?utf-8?B?ZS9HZFJ6T2hsYkM1RUcvS3k1YXorUnlCMHFUekE0YitNWUVFNlUveG5pREpZ?=
 =?utf-8?B?ZXJHRHkxRjJLa3l3bkIwN0lIaUF3VmVMb2NRZmQ0ckttbCtnb2paUS9jdmFC?=
 =?utf-8?B?SWdKUnN4akJmaDNaSEQweUVrY3RtNWdGZTNLR0p0Vjlmb3ZJMzNjdkYxZjlr?=
 =?utf-8?B?R1c2bForK2NIdkRwVDBoazcrcHJraXM4T0ZWTThRSER5cnJFM3hpdFdHempE?=
 =?utf-8?B?b2NDZy9GYjRKMDNQaDJ3aUJBQ241NWUxcWxseG9PaFRSVkhVVDRhZEswWHRa?=
 =?utf-8?B?ZXh6a0lMbFFlLzc4d0ZkQzB5RldoeklPYUtSNlFDZGU3VGJIT0RqVlk3SnZl?=
 =?utf-8?B?RTFSKzhielBUNHIxV0Y5RitqNEhSUjV6aWdVenkvM3JJZjNCSUhhMnpjL2E1?=
 =?utf-8?Q?Ru1rf+GzVYslYPAG9Q=3D?=
Content-ID: <9C59A952EB052B4A8ADB3A2BB535B1CB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0da30a-01ee-4418-8658-08d8d26c2ddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2021 11:15:33.8855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3EY8oq8ywNvGiFdTib0yX6WzFfG7VySnReJGSJj0B668dPDRPXpvxj6+B60Ye815qq3hKNAWX6dy+QAKecAT+p2L+Ow5K6fS+MltiFOhFvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_061540_679301_E8A32E67 
X-CRM114-Status: GOOD (  24.52  )
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
Cc: heiko.thiery@gmail.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, all,

+zhengxunli, juliensu & ycllin

On 2/16/21 11:48 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-02-16 10:27, schrieb Pratyush Yadav:
>> On 15/02/21 10:53PM, Heiko Thiery wrote:
>>> Hi all,
>>>
>>> I faced an issue with a SPI flash on our board. We use a macronix
>>> MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
>>> the MX25L12805D [2].
>>>
>>> The newer MX25L12835F has support for dual/quad read mode and RDSFDP
>>> while the older doesn't.
>>>
>>> I thought that I could do a fixup with a device specific
>>> post_bfpt_fixups() call but by now this seems not possible. The older
>>> MX25L12805D has no flags set that allows a call to
>>> spi_nor_sfdp_init_params() and implements the fixup.
>>>
>>> Has anyone an idea how to solve this?

Maybe macronix can help with some suggestions on how to differentiate
between flashes at runtime.

My first thought is to introduce a SPI_NOR_HAS_SFDP flag. For the flash
that doesn't support SFDP tables, there should be no functional change,
for the one that support SFDP it should fill the properties from the
SFDP tables.

>>
>> The post_sfdp fixup is always run regardless of whether the flash has
>> SFDP or not. You can try putting your flash-specific fixups there.
> 
> Well the problem here is, that the SFDP setup is skipped though the
> flash would support SFDP. If the jedec id wasn't already in the table,
> there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
> parsed. But because there is already the legacy device (which likely
> doesn't support SFDP) it really doesn't fit.
> 
> Its unclear to me, why the SFDP is only parsed if one of the
> SPI_NOR_*_READ flags are set.

My guess is that a new SFDP flag was not necessary. SFDP defines multiple
tables, but there is just one that is mandatory, BFPT. BFPT defines DUAL
and QUAD parameters. From the spi-nor code, a BFPT without DUAL or QUAD
support doesn't make sense, even though DUAL or QUAD are not mandatory
in BFPT as I see in the standard. So probably it was just a way to avoid
adding a extra flag. We have to check the git history for a more accurate
description, this was just a guess.

Thinking loud, now we do a static initialization of flash params, that
can be overwritten dynamically by SFDP. How about doing the params init
the other way around. Try first to dynamically discover the params via
SFDP, and if SFDP fails or if it is not defined, do the static init via
flags. That would spare some code. And new flash IDs will have less flags
declared, and we'll better track faulty SFDP flashes.

Cheers,
ta

> 
>>> [1]
>>> https://www.macronix.com/Lists/Datasheet/Attachments/7397/MX25L12835F,%203V,%20128Mb,%20v1.6.pdf
>>> [2]
>>> https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf
>>
>> Both these links are broken.
> 
> mh, they work for me.
> 
> -michael
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
