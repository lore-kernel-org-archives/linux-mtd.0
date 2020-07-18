Return-Path: <SRS0=UfuN=A5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83005C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jul 2020 05:36:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE272076A
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jul 2020 05:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJ0NCIpb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="n+MBcMw2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="oWyHkcxD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE272076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kwhf9IYJUGHXcqr0q0TsJOPDYLm+5ZXBdiUFRPPt6jM=; b=cJ0NCIpbbnfXoSmf7a9mcleSh
	Im9mRa0H5DO68zAtYNuXJ9DPPlJBcHrlj31hCYrNj8V79fjHZy0neKKKbUkNuHHGzgybu4k4CncGs
	fXSMlNyFreIMK47lBqBnBMnppEVYugGbSI99WvX6MkW/FETJr9JXpGGRhOb7/AZ8zmSgVwrLMJQT6
	n3ctRLLFGbhGMeTY+67WHLdCHYqGmdEOEFPV719CZJREpq4+iGiZrSt90jk3SplQa+EBzUYRmiVcz
	6rAe+ehvWGbmmxNZjZgf6LiSe8qAUXV64b8GsknCFMRBXgWe0IoW5EaflexQBnRAr8yo92RPSnf19
	Fvlpe/ZkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfVG-0003be-Bz; Sat, 18 Jul 2020 05:35:18 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfVC-0003bB-9A
 for linux-mtd@lists.infradead.org; Sat, 18 Jul 2020 05:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595050514; x=1626586514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QsTlbvP0mq+7lAC23bzHJSXVsO/VmDcR5HFPtqlAk4c=;
 b=n+MBcMw2wazpQ5kxPOZcE43S4IKEZyXpNo5dmMk0Tvk2Alvu0Y6pcbCR
 23lgfki5tuwhb+gqcZu8u1bsLyb/zAcP/YOKuZalUtHMOs/ec15zlXuvW
 dnYznYBjU2U7cIr6fAjoNladAESPxYLNAacleWqQz9KN3i6zmrXID+LTp
 N2NRNx/bf9lGGtDKRb4gB7wOy7DZ2QX/RC+BeE0b+nUOUJKPL1MIQ5bVe
 Sg7oU1dtTBnUwUWTzKJgA9LF2zl4L3MRpADbrx1/wUPbHVvcC78ItYlts
 PfgtfAxldkAsY8q5Iwx8AzuZX1a0P0pWE5fHVCSOCvEzwegeSxiD1wm2I Q==;
IronPort-SDR: n+LeWOOD+OB9FP7dxfMeByH+1TcyBgVVwl6PmI4RZ/wGDxIsjchguqyxYh83Y43NO3+8pPeV6o
 xMqSG/SrKHsyrGYeGM0y/5IUhHZFrp7PAuYmTmWSmL2hP2ovAHWaAN1Q/HiV0LCjljyqHm5UZe
 EaA8yO08aXr1TrzABA4B83Blyi3scF9176bcNd2quazHpYxMb+UQ3bSeFaeyA8f177N8gBDdjL
 yNgjO4uL8KNeRkYrY3KO4XbbYU5xvTvhw2c41hgJgtHt6D4xFE1Ab9OY8VgIqoTGW0U1gIWEbV
 8eo=
X-IronPort-AV: E=Sophos;i="5.75,365,1589266800"; d="scan'208";a="82325550"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2020 22:35:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 17 Jul 2020 22:35:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 17 Jul 2020 22:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WksM8UqR/1RedJjokGLYJkVdMI1ZzMuARGkCiQuFQVxrNDeyea3NIJk1uZZVpd9uyDujnmxz6qEvF2nCncuKy0xqGqkVM7FBWsIRYU2AJyISEKkhK6Z5/tdsCC+klsOb04hBJNXXdpa8QBIDakmVW6OUua49sJkbGtaoD28OhqGIDpbNXtY7BXxg5kXUNNoNdT3rUnUhv4oDJDuLxFmd+Wwr4nDseDzP95gT369cAS+3DSkApGD6rS6D/seswVbqFcHH7jzNQcJ/F/+SkveoA60pEUHAD6l+3A1DPogdfdQZns4UnPe9bjupSt0VPP+X7f4+CEzbjgPa2qvsRFFcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsTlbvP0mq+7lAC23bzHJSXVsO/VmDcR5HFPtqlAk4c=;
 b=idpuE3MchadfCCa9+nFkFIXr8TTJ0Uxy7NXT26wA3SJfIAyW8KpBqWmRvbux6tQBg+QCiVWKOJIITizn8cicxnQpRXL9KWTxlmofBbrGkRdK7KRXuoqLNqDS0Lb7JyX/z2MbPEVKLuIOJIgYbCdfQjlVtJ4AsOCHI0kfCc0RIMAd2qHG5147duzKQ3bu3hmb8kfk4N5NzXKMPKVPZ1OQ0/ijUu1mGbVuoG8KJ9iLMh/LpR5gsXWp/iSjdCz30exxJ7cFHYf909l4bNp2HVWx0Zza8EwM7heUypmgngGoiUZLtCDzziSvWFx3g7QHlgzYpklIFX0oiu0KHzbTEdjKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsTlbvP0mq+7lAC23bzHJSXVsO/VmDcR5HFPtqlAk4c=;
 b=oWyHkcxDgd1cHxhnwghmnZbkmL7uX61ISWdfeMQCy3jpLVxFGDdAjc0yIKyaefwZGvIsLBRiP2JdWdy7omOikupSm+PsU0mZWq9LosB+Z61DBTqCkTTn3RWRLz7kA1jyA/Wv4adUgIxiD3ghLCfmSAAU7Z6673yFKOnhwscr+R4=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3575.namprd11.prod.outlook.com (2603:10b6:a03:b3::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Sat, 18 Jul
 2020 05:35:06 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181%7]) with mapi id 15.20.3174.029; Sat, 18 Jul 2020
 05:35:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dac2@pensando.io>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
Thread-Index: AQHWXCW58IWRpdQGEEW5x0rkX33S3A==
Date: Sat, 18 Jul 2020 05:35:06 +0000
Message-ID: <6c29b0f3-65d3-1e69-58ce-cbb84c88910a@microchip.com>
References: <20200716211631.38949-1-dac2@pensando.io>
 <20200716211631.38949-3-dac2@pensando.io>
 <1724beec-aceb-b6e9-1288-da340d3fd43c@microchip.com>
 <CA+nMikFFaxZxNP_d24+YGWfWG1yAV41FRyxQn=gweY0-T3aV_A@mail.gmail.com>
In-Reply-To: <CA+nMikFFaxZxNP_d24+YGWfWG1yAV41FRyxQn=gweY0-T3aV_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: pensando.io; dkim=none (message not signed)
 header.d=none;pensando.io; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.122.210.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d1ebaae-c21d-4b50-3399-08d82adc5431
x-ms-traffictypediagnostic: BYAPR11MB3575:
x-microsoft-antispam-prvs: <BYAPR11MB3575840664791C05316D7645F07D0@BYAPR11MB3575.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IPwnmQdiFuqF5+DyGJu613C16RSF/BucM5YlAgc8FQ/HmSXisfB6fjplbD+6mD2l2LzqqKSLqfpiun/UVKG6aC/v4W/hnIZcNQTcjIz7qfYcbleZkXIFwJwUTea0gqSKfFPH/uzEfq0qggr+2yf7RGS2ud04F2NwVoMlX5LzaH83pHZQGh20cVKuT5PRinwZE0Q4inCKew6/Zq2A4Awd087kNP/1oVgpE9wklI82Rr6FC3whj1dcwLWOFTMwNdJG6mwxKVSJoSypacOOTHxEg1PQOD+yK0SxGN27lghcu39bnM2B2RQwQzFc0fPml0lARu6dG4jrFSSjhyH10DSx3Q84mcMAL57uf7Zi3fKcsY4o/fVT1oZJARR/48AnDg7u
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(478600001)(4326008)(2616005)(8676002)(91956017)(5660300002)(76116006)(66946007)(66476007)(66556008)(66446008)(64756008)(8936002)(31696002)(6512007)(186003)(26005)(6916009)(71200400001)(36756003)(2906002)(54906003)(6506007)(31686004)(53546011)(86362001)(6486002)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: qZQfX1/T1E5witdNm9ve8TFqtmHYVXfKVmRQG0YmOlkqqCnDG5kcvIWVEScdMrLMpRx8d/uMcOiio3ahc6GB6r1lQUJz5jqBGBcZbNVvSPk/lWA1FeTurJ6FyJVWhYcubfHUTDq9MSGjKr28H4ubxu2uLm+aRH2nrSvhb8J8CUNnod4MkCOwaMplcH9/x2DRGFdIXDJsshiqXnGP+ie/dd9XcJfj+YhNOeYvkIdd7dMCrZN7SRnDT/TeebkPWt2dwFEHemUbKr27XqlTlhOPgn7eENWldfqrEdiZJkT+RPEwT5FuzfdlK56g6lM63+26uPjmiUhwibT8hezM/eQnhR/M06f/K9AL+YbBWvbyll0D7WHwtk/2UWnbYcLUIZnh4riODJ+vXdWKGvyfZTG+MxTKD2hXa6cTqzMbBmgwTfZTji6HfUHq5rhct1iKWJE7fr8jdK4tIdG5A+9djHF3rwXRK/FEmgE4z10K7C5S0/hFt2MYqC2alYyemPi0Iptp
x-ms-exchange-transport-forked: True
Content-ID: <5C3A39E3AFA56B4E8784AD63F0BCBBBE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1ebaae-c21d-4b50-3399-08d82adc5431
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2020 05:35:06.5568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XS/R/8Ngvl4VBj+DORn30stYEj55AUuDQpxJmLH9TcIVQzXBx5NnLZ4WQQvUy7/S83rDEG8bA8QZpsufHJL3tm27PPlQRR4lgRvrB1Z0LWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_013514_632199_5A0C01B7 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: snelson@pensando.io, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, David,

On 7/17/20 9:00 PM, David Clear wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Jul 17, 2020 at 3:33 AM <Tudor.Ambarus@microchip.com> wrote:
>> On 7/17/20 12:16 AM, David Clear wrote:
>>> The Micron mt25qu02g supports both x2 and x4 transactions.  Add the
>>> SPI_NOR_DUAL_READ to its spi_nor_ids[] table entry.
>>
>> In spi_nor_select_read() we select the fastest read. Since this flash
>> supports Quad Read, the Dual Read will never get selected. As of now,
>> there is no benefit in adding SPI_NOR_DUAL_READ when SPI_NOR_QUAD_READ
>> is specified.
> 
> Ok, I've got this now:  I went back and did some more testing with different
> spi-rx-bus-width properties and I see it's redundant to specify both DUAL and
> QUAD in the flash description.  Thanks for pointing out my error. I learned
> something new.
> 
> I withdraw this patch and will work on getting the Macronix patch cleaned up and
> tests documented.

No, please keep this patch as well. You were right. If we remove the
SPI_NOR_DUAL_READ flag, the dual read will work only because the SPI_NOR_QUAD_READ
flag triggers the parsing of SFDP, which will fill the dual read caps. It is
better to statically fill the 1-1-2 read, so that we can still use the dual read
if SFDP parsing fails and will not fill the dual read caps. Let's keep it.

Thanks, David.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
