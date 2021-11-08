Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF1AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 10:16:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB003610F8
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 10:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB003610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjVFTHhSX2XGuBO1wbOvkfYqi/AZI2WNJJ8sanjzIxA=; b=ckvs3Tcn/2GvSb
	8FTQFsVU5+4GDJazKt8jK3JrnMzwoPP9lv9zy6KoBVQ+He0s7iKXvoFHDWV2M1FTi5ZKxIgjVhyg1
	W0Uw1ksapdwroOTa+19JVIdRsAOsSLE8Ipdd0Ksr7dQrI+WRMnROVE/PLx/CgIckm/NuqclGcPy1y
	6d8v5ZX3Pz0qJxlIca9JdItrLc5UaQX4NqSfdHPwlZFcGGykaFuEoU9rjU94hR8M2jL+puY2mXqES
	C63mwxpznlUjkTVzvAlaceV7N0JCxxv5T5Y8qZr5aItP+0DHWS8qZE1ATN1QqsDV9pHRJA9t66S4T
	/6qGgQ7ySQ5LycnvYn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk1gV-00G06d-K3; Mon, 08 Nov 2021 10:15:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk1gR-00G03u-10; Mon, 08 Nov 2021 10:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636366522; x=1667902522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I1pOrLttUCbapZ87FjZ66+PwMcw50lTQmW15XTI1iZk=;
 b=yxf+RBX7eg7hKflF36/K87KedMj8/3tLwzZNYWJqWX8zW3kKPMUdNi/F
 uNfXEDjtaDpsICjigXd+1RZOC/NJJGGNzw4EmipmahM5MOLE71cMDAkBS
 q/SpvzYK/5con7It1XSPxTEkanEmF544RpWpD6T0ixqc53k2nF7QmT9vA
 kJLbMUOMZoiB6NHHgoOvHq0/ppSXh16a08ad3mQoeqL6hSPsHM5rXiaIw
 gMMgQj4eI5ubOz4TeNexT0Vp/pjBuL8pw022H0HN/ZVTGaql2KoXHq/62
 yKywHaXBfjY8zZ8ez2Xws5NruZ06qloliZHqkrItVHrD8GqrFUEzCf9we A==;
IronPort-SDR: GlycuiIfcG7ph0tQl4KE9/PjmUev2zMExUp/1MSpdLCA3KkYF6sdDZpZijIm3DHFZTLyCvzt/c
 zrQfBiRBN/NQDgLBvTba46C8G65RADebofFPXled34wfvTgEjUZfP2k5VoZyOp8K7pEN1ly2Fj
 NnfAG9t8pcjCYMF2umb39B4zXSLRxP+ssg/kL3/mU0dAiiVeOyV0tYvzYuzDJZz/Gw7vUJU66p
 RnNW5WtvfHAYi2Cvzb3S8gKL0/lVEPChVe8ffYgB/ORRbbnpUpkL8IPzR7qz+h01e/GCqF1Dh4
 UdV5A2A3gn1JdoU8WJ/oUAM+
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="135801580"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 03:15:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 03:15:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 8 Nov 2021 03:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=antK8rWqFBIznhT157wlHVXoXti35VFD58CJG/OY1Qk1RewthKvYwGmExzqeisIPhq5d/znZiwPRIPAXMOoNSwIRObw/h3mfdgBW7NABPwoRrccLxSxpxgN3xXtv5kj5wBHtf7EhzlA7TGSnMUeNL/YFhKOzDQoWMPYtNharF+l94hL+TXSVafGHe1+ChrTZMc/gMSGFG2dVWuZlXHnaruTCSEUVHtNEQ6ifMca2mctaqSjBDzqqT+j7STfejycuUDW2T4Qy0uCUamb41NcYGLG+8OJ5StrrV5OdGgcC/PDVxFPO/UUfnWji9gSgGPPwZfA/m71UCo0HpiFfb7fKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1pOrLttUCbapZ87FjZ66+PwMcw50lTQmW15XTI1iZk=;
 b=DwmiwVaChyA+efMFyrsRXXiPQYFwVsDRNebi1tlgXw63CzZIZg0W/Z1nQAtwQI8uTkF1tXgcS2Zs5WEtQ8v2SKnCESXVXGpczMvfoqwTlwe0JWC6F56Gdizw+GEBMh1f6Mlt/QaVNdf9EuCNPanevV5AYmm/d22RLTQmeaBT6h9MfMqpkVSFuBhvgv2yNXicqAp7FgtvuRQJYxTpsyUzcL2rY80y3MvTRX/07WB3StxWxlCPrfKu1wdoJ1NM6eS7PswZeM0ksPa/9VNlxv42YE/365np2fTplWvUb/FLz5qNfg4J8mIIw0QX2iXjJRwS6P3VD2fn9joo/r8Jm8N+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1pOrLttUCbapZ87FjZ66+PwMcw50lTQmW15XTI1iZk=;
 b=k+h2VhutSPDAaD0wS9a8elws0w9CKSOzYYE8EDAN/7JwPsV4BXFjkxuBAC8ARRMgtomOmYz+//64JWvy/EjN8k1+Sox2DO8FOpQUZfrWVsTlNARnh2Hx9twB9YJQ59YNyQ9mxhoj/lz1fkzvKicZWcPGFG1jMZJSwcP0KUvnmlU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 10:15:14 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 10:15:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 00/25] mtd: spi-nor: Clean params init
Thread-Topic: [PATCH v3 00/25] mtd: spi-nor: Clean params init
Thread-Index: AQHX1ImFiX49y5rKPEyjdSEMCS01Dg==
Date: Mon, 8 Nov 2021 10:15:14 +0000
Message-ID: <7de434d9-0d40-1514-5a7f-5d179497d1c7@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09fc354b-5b5a-460d-8e6d-08d9a2a0a7ae
x-ms-traffictypediagnostic: SA0PR11MB4767:
x-microsoft-antispam-prvs: <SA0PR11MB4767A097E1CF543AE4DEB2A8F0919@SA0PR11MB4767.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8xe674SGT5e8iUJ3asoygzfzWjW8UUPqAWnLs4KYN3h/LptbNqtiAMVh7BU+1qcgdKSPvm4VbCFSiJ+DwLptAj4or0jh3OMsknqXp8RYxlvTrXmGd6BuFO34EhYkiDiqbi2ta2oMdhpEeLUebAQQDMzhwFUNz7zFDdyfDN98Zb6YsjppQfh/vuxMy8F4S6oKaekuveFPidOhfZiwhD84eWrLwTZrbm3y9dHf+lmBc/fG2W1PkKMxpCXFTdsv9EaHGDrlIt1HwkYr0yCcwatjVaLxy1+JId5HKvoZpll199QRU0pHE72Qyod5eXrdIlzrcQu6E1g2KyIx/MpykbJr6g1hZSn0IQKWyVwK9fA9ySMsPkobEssraFTDV/VMQepeMPbtC2vdb8XFyuHJc218k0Y+RG8K3xnwcyryR5Q/H6mrag67d+KsyTdHbUyNfDKbgtWvIaz9yqu6vVBsV0mI59WbPQ+7CiTq8kbomoZ6HRrRKmx1KxwruX5SVlhFHfbKwLwd/HG4idacsRerp/wWY6AIk1kq70feeif2F5htUrJfShIGWnrJ5JV/MQbrsPa2ixHfZBjT01moiSYFYQX4PGVIEr27uYq22ltsIDGVZDI3KwwPIgEBjoGr2JhM+irasWLP2KxLjcbk0i14GATu5BxsbdQoYwhIuHipbLGTupFGzuLtQQCwQ1jNutpxkNrcnpPEZqKp1ycw5hDyZrBe3LRN055dj2xO7Z68RbD2yZ+lkuLtRmUnNqiUETPwIZdubAiKmT4VL52ABc3zvNphvdoFq8os5Gm6sNsRkfeeadRhfaxk3kI98/suJmI195QfUkSfqRaqkIn0TTI3iK0uMCM1sOFgR0dTQWmxP1fT+ZE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(110136005)(6506007)(54906003)(76116006)(31696002)(91956017)(2616005)(7416002)(71200400001)(31686004)(66446008)(64756008)(66946007)(2906002)(66556008)(66476007)(508600001)(966005)(8676002)(8936002)(36756003)(6486002)(6512007)(86362001)(53546011)(122000001)(38100700002)(186003)(5660300002)(26005)(107886003)(4326008)(38070700005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mll4ZGJ3bk4yay9xcEdxclA2aXRYSlNrQkZiL0dHM2dpUGZ3ZTJpcUFaVjI0?=
 =?utf-8?B?c3EzNXlzTStFMzlpWFltR1B5c2E5cTJXbjJja1lrai9LKy9CdnU0L3lIMmJZ?=
 =?utf-8?B?K3JnNzhYMG9JeFJaTlhGSWs1eDd0WHZ6VngxZmdXZEVWN2tMYWF2eGVSZ3E2?=
 =?utf-8?B?ZU9DMUswVVJ5bXg4Q2gvSVVYTy83MHBaVy9odDc1TzhBYzF4ZUtxQ0g2cXps?=
 =?utf-8?B?QVR5bzFHSVJpcHlnSnNVdnZNZlQzYWN1akp3T0QvZHNyWXVMbnNYTUNJaVdM?=
 =?utf-8?B?QlE5dC9nbENnaVR6NWlnYmhPTWsxQ3RFWjdOKzE1QjA1TUw2dm9vMHJJOVV3?=
 =?utf-8?B?LytneU5iTnNDVjFYMDJ4dGFoU2lxVTh3U3JmZTlwRDdqdVFXS2gvRGwzWnIy?=
 =?utf-8?B?VTFiTDNYdW5zYVI4c1lPeU4xOUJmbittcFFLdE1aRjVnSDQwRXkyZ1ZSMlZu?=
 =?utf-8?B?QldNMWlpTC9jYVB0TVBPelUwUmNGU1hMTnJRejNHb1pOc0hhYkYrUXNWV0Qr?=
 =?utf-8?B?SXYzbStiVHVmQ21mcDErWFFYL1pXdUVndElPc2xvdW1xdnhvWDdnZnM2YWdC?=
 =?utf-8?B?b282QkJ4QWxFYlN5djRoa2w1SzMvR2NXL2xnUDZTSTZ6ckZRYWRua1k1d3lW?=
 =?utf-8?B?WGViYUJsaW80cGxNcS9yZWhMZGNtWXU1WVNzZVRGNEllUlJoakNHNjN0NzdO?=
 =?utf-8?B?YkxMV3AzV2pNamF0eXdiNkluK2ljT1BkYTluUDJrcU9aaVRrNmd3WTdpcDRY?=
 =?utf-8?B?a1VOVjh5QWpleVk4NzdTejU1dXMxcFlJZUJ2blUyVDlzUnFOdkhQQkJSbnls?=
 =?utf-8?B?YWZOYXdYeG9Xd2ptaFora3gvZVh4YzhqcmpSNW1ZanBLeUZlbGdrcFhSZzlq?=
 =?utf-8?B?ck44dG5UWEJVTTc5ekxmMWxvOUpjN0ZndHlPQXBQenR5RXYwZ1ZXS0QvTmNO?=
 =?utf-8?B?dm5mWXNqWFkwYk1KcVVqbU8yZDFEZGJuVVRKSUQ1Q01RV1BQdXhBSXhLZlRI?=
 =?utf-8?B?WVBydTdlQ29yK2NZTkpxRzJZSEQrVk5jN0VIdlFDZy9BekgzZFdGMWVxa2t0?=
 =?utf-8?B?S2FQaDVsUXpjSUZJSzhYK2luYjJRcHcvQVQ5VXJvd1lWcGFWcDM2WWVHM1Mr?=
 =?utf-8?B?WmFnNmtWVDl1WHIrN082Sm9zMDNES2xNK2xMRWpaUExmb0RONWdyNnZIdUlX?=
 =?utf-8?B?ZVhRcmhVYy9LY3kwbzlhWlVtV2YvYjBhVDVyTFl0cExKSmdRV0IxbDNSMU00?=
 =?utf-8?B?aVBiYytvZWs2TlVITDY0eXVBQkFmWDc4OGhIOTJtc1c5czdRSUFDeDdodFNw?=
 =?utf-8?B?UVJVbGx4WXYxK2tBRG1nOUdEQUFjOXNoK2Rnc2RQS1hzYzZVNG42dUdtT1hC?=
 =?utf-8?B?TE1OTE5Lcngxd2ZDRkRHR1JMY3NUcVRlcjc0OXYwTEFERmh4T3dGNEVpTEd1?=
 =?utf-8?B?eVZrQ0hVb3p2WGcvUEZtRkIvczl6a3FNdXRzRnlhTURESUtvVVdnUzg1cDRi?=
 =?utf-8?B?eksyaVRTSmQzeVpJNElwVFVFemtkOXBvSU84VGozb05laFZpTU5zcjU4aS8r?=
 =?utf-8?B?bHBac2w1WlE3Z0dycUpFclNFN1lSSEI3SitaSG1hNituU2cvTHJKMUFLY01C?=
 =?utf-8?B?UHMvc043MmZoaFhiSTVEZ00wdXNnemh1SU41eHg1RkI1bnlTOHMrYlhvdFZX?=
 =?utf-8?B?UkZvY2lBZytQcDh1Zmh2Uk9JeVFmcWo5Y0V2UDh6b0tWZUJ2MTFzMndnTDFq?=
 =?utf-8?B?dWtUZFJlYzdURlEyUVNHczNNSmIwSjNTSzJvQW5jZmJpUStmaDRvZHUwQzFw?=
 =?utf-8?B?YVhHVWxOeWFXcGlFZWhjb3AwSTZDaDU5dklnVTFwQzNFQWk0NTlsQ3ZVTTl3?=
 =?utf-8?B?STk4QWxvaS9DS1NwbEdINSs1S0lqVUxSMUFXSE15aDliZWQ1WExFSlQ0a05k?=
 =?utf-8?B?L0taQlRIQ2ZENVBuWnNmK3VhbzZIUXVXVHgxSTlzdnIrbkdTTTFIZXlIN3lX?=
 =?utf-8?B?aFQveFUxcVdxVHNBSUx0b1RjY0wyenBSVUhEYVNWRVVaRW90ZG1ERDBKU0l3?=
 =?utf-8?B?QzZuNG9JZ0MwaU81SEhiM0p0alpNcWpXZC85R2N6WEZQb2VFVmkyYWdSK0dt?=
 =?utf-8?B?Z1hDMHFrNVZHNDlWakJuY2xjL0k1aDlZTXhEVXpPdVNWdVJ0NXJNNTB5WXY0?=
 =?utf-8?B?QktzVjJJTU5RcUhRN2tnazU5STdBc1VkWVNTNWN0T29aR3M2MlMwNCtGNGZV?=
 =?utf-8?B?TkVTaTM0S0dvelp6YmovRmdGempBPT0=?=
Content-ID: <6F9F70E5D3626B48805E01A8E4A32383@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fc354b-5b5a-460d-8e6d-08d9a2a0a7ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2021 10:15:14.0182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnmLxiw3sGMGSTdtUfq3fSkbLORBvFvLL2Jw2f9R2WuKHmnC4/EOu77x0XWB9/bjCfi014pFez8JQgIImG3zPK96+E4L+RfdqM1T0IiG2QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_021523_294530_58105200 
X-CRM114-Status: GOOD (  23.82  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 10/29/21 8:26 PM, Tudor Ambarus wrote:
> Clean spi_nor_scan() and the flash parameters initialization code. 
> Tested all the flashes from patch set. If someone can test the
> locking ops on few flashes would be great. It seems that my flashes
> have the non volatile bits weared out.
> 
> This patch set is split from:
> https://lore.kernel.org/linux-mtd/20210727045222.905056-1-tudor.ambarus@microchip.com/
> The ID collision series will be set in a dedicated patch set that will
> depend on this one.
> 
> Changes in v3:
> - move late_init() in struct spi_nor_fixups and update patches accordingly.     
> R-b tags were dropped.
> - new patch "mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag"
> moves manufacturer specific flag out of the core.
> - update methods description to make it clear who sets when
> - introduce flash_info flag masks to make it clear when one should be set.
> - rework "parse SFDP first idea".
> 
> Tudor Ambarus (25):
>   mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
>   mtd: spi-nor: core: Use container_of to get the pointer to struct
>     spi_nor
>   mtd: spi-nor: Introduce spi_nor_set_mtd_info()
>   mtd: spi-nor: Get rid of nor->page_size
>   mtd: spi-nor: core: Introduce the late_init() hook
>   mtd: spi-nor: atmel: Use flash late_init() for locking
>   mtd: spi-nor: sst: Use flash late_init() for locking
>   mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
>   mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup method
>   mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
>   mtd: spi-nor: spansion: Use manufacturer late_init()
>   mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is
>     defined
>   mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag
>   mtd: spi-nor: Introduce flash_info flags masks
>   mtd: spi-nor: Introduce spi_nor_nonsfdp_init_flags()
>   mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
>   mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
>   mtd: spi-nor: core: Init flash params based on SFDP first for new
>     flash additions
>   mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
>   mtd: spi-nor: sst: sst26vf064b: Init flash based on SFDP
>   mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
>   mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
>   mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
>   mtd: spi-nor: issi: is25lp256: Init flash based on SFDP
>   mtd: spi-nor: macronix: mx25l25635e: Init flash based on SFDP
> 
>  drivers/mtd/spi-nor/atmel.c      |   8 +-
>  drivers/mtd/spi-nor/core.c       | 480 +++++++++++++++++--------------
>  drivers/mtd/spi-nor/core.h       | 106 ++++---
>  drivers/mtd/spi-nor/gigadevice.c |   7 +-
>  drivers/mtd/spi-nor/issi.c       |   6 +-
>  drivers/mtd/spi-nor/macronix.c   |  15 +-
>  drivers/mtd/spi-nor/micron-st.c  |  20 +-
>  drivers/mtd/spi-nor/otp.c        |   2 +-
>  drivers/mtd/spi-nor/spansion.c   |  15 +-
>  drivers/mtd/spi-nor/sst.c        | 105 ++++---
>  drivers/mtd/spi-nor/swp.c        |   2 +-
>  drivers/mtd/spi-nor/winbond.c    |   7 +-
>  drivers/mtd/spi-nor/xilinx.c     |  21 +-
>  include/linux/mtd/spi-nor.h      |   2 -
>  14 files changed, 460 insertions(+), 336 deletions(-)
> 

I would like to apply this when -rc1 is out. Can some of you run some tests
and check if everything is ok? I have done few tests on the flashes that I
mentioned in the cover letter, all should be ok. I'm particularly interested
in the locking support. I can test the unlock_all on sst26vf064b validating
the locking part, but it would be good if locking is tested on other flash
too.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
