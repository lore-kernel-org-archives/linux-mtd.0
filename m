Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6893EC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B91C6023F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 12:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B91C6023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/p0rDofRxDfGV1wA67HmmY+Po+GkOZk+A9ZWUqtMQM=; b=Q/Pi4Xz/EY+JR3
	LZ7NvEz+8zOVr0ilhx63QlNGW11K2P4eRBWUBuBoIm3gZkZXC08zIoQgRN8UMwmtjj85BBl07V2UO
	tzkceN5aIyX55I5lHpRcv4Z8rn2UPtAcoRvLB5tOsESJw+fpjptAzPeOSo3DyOsCdiU2LXBbb4HaU
	y9kKNrMT02m6/pVnmlcegH+tnlxFxgHd7XJIursV65IbISowwNMM0qjd52NjrI30cnsjt7UOakWh5
	+rz0X7LFcoJ9xPtoxHzMwt4LOMSFxtN2A53qYplFuadZcdy7NMlfI4aaKLfrIiTrLVnM7Fd20rK6o
	3R6ItmqtT2huhbUIoxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFy0k-002PFt-W1; Tue, 17 Aug 2021 12:16:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFy0f-002PDx-Pg; Tue, 17 Aug 2021 12:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1629202561; x=1660738561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/iA3s1t715VexsEdq8dE4p33N9YAxAPP2cmHLVin2Xo=;
 b=Jp4Ven4I28wOGDfDCh89GYbJGpPV+F6XUSDhQLJ73dalPwAUXGm5sdYB
 S4xyQRsQ8faXxlyAAVlhyteqLP7PcnpCjilXqi2szJQq7U2E2JVb2dPtG
 6BXOU1kgty/Ws/P9uYUALyWQERAkoFyxyqyT6giSLgXdzd//x/NVoteKk
 WAnnOZxkQ00QU1m3NYjwKqfi4JcqgSfOezhxTbqKysxz++w2UL3rs2JeS
 j5v66Z4CLybcEEGOMajf1/Q1aveNLrQz5z/k0OP9qq/9NYoaMsGz37N+R
 4PRz0HG7S1Jtn3NnSwmEy1okjY6tAivnpq37Lxwui3TI4GB8X6eRlyBTL A==;
IronPort-SDR: xZwSoTYjoCHlBn+8xx1vYeEDkJ4Lawp5PcMX3pMEaBwS5lJEvcmVqJoJ4cNDRgIrxNkigkKzGf
 1A4xbn+ZURKFcLDB70sOPzx0aZ1uS2/TbBHdOVwi4ffy2BB8cRbJ2MYDjSKovVYJtXwqOKlH+M
 UnSMG/rl/oOXtiPhMs3mEpjvYXmuV4ndlzT/JpUcnD0sHn4wqnwqsmzBlrpD5c/khe2ul+QI8o
 3OY+T+KYBUJUgYrskh1e8SaJfoUP9qQ3z8/0u47V0FD4eCXPzwnAJ6XI9cU5REjk7dBaaM9E41
 PTAYAVsWnHxPORIMhEC+0lRa
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="66116477"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Aug 2021 05:15:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 17 Aug 2021 05:15:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 17 Aug 2021 05:15:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbjcLzVJJ4iCBK1WCu8Zg7hxzPkE4Pa6EqdpvfgjxU4/atfqD52nCaQ+XTDQgrUC3arkpDOHJLQN7+sh5FUQX1Kv8FkzYrWfH3x0z253NduX3mJCwlanWU91CH8t+Msh5WJ1ZpYXVVD/E/TlVYepHoZ2vGuajZKoOLYt8alVqTUs2xLn5dgO6e62z8TwUXsflxs60yYmVirtMlksU+lXt9E+ItM68FUyPBj7PZPgSw1ZMpZTTxTy2mVgM/MUMAPc+ho7241G9Xfc39Rx+KWHjD3YJITzzazAEiAoINVjoqnhrLpKYYT0ALlX/07AE5vJinvceKkyH055ykmWt4Mg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iA3s1t715VexsEdq8dE4p33N9YAxAPP2cmHLVin2Xo=;
 b=fVWD++5pWVZ7LNlyev+wP/a76fE8Hyapyy0dx1yXBgai2EksBaeKuDjbJP1jxaKCfIWqXYXn13O03bnBmrUH8VDDV1Qz/Mftyt8OCGjGaNvBV78iMGt2kXzp0Vkmmh63D2LDQB/d6hlujVYxTFsjyCH6eLg0+Z58ySGhzTaKrrmiLgjQPD9yhfdvRDbvQ3p8AJTNst8WYPbTW4XAollioqtsNVG1MBW3XM+3Pbb10Pjar7RX9TMpQ1DHZuv4QB1WhEB0YUeD2lllCTVywu088QYGIu++EhwACyl/5qbczA9iC0qr/WnjmbXOqU4U493UOp+YJnfySWf49D7CqvQkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iA3s1t715VexsEdq8dE4p33N9YAxAPP2cmHLVin2Xo=;
 b=ZMl8TYO9ejeACIOaav2EOp5S05deutDKlLbsEQjPdQOckwhY3DRR4IvlWxjHBJnP70Scq0rNyQ60je9u8Rv5VyDjcmX7Jis9ouqnckix6ejYo+WaKg8bKQWfqd1qTreKNWVa4L4cid++5peTYdiGgMkRYX8z1+DUMdipMEK/mwc=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1552.namprd11.prod.outlook.com (2603:10b6:301:e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Tue, 17 Aug
 2021 12:15:57 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::c884:8fdc:abbf:161d]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::c884:8fdc:abbf:161d%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 12:15:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Topic: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Index: AQHXk2GhUHICDZIL9kqtt57ceHbdbw==
Date: Tue, 17 Aug 2021 12:15:57 +0000
Message-ID: <93dc6aa7-fd6d-0659-2484-16bfd4bff402@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
In-Reply-To: <20210817102429.kmhuef5hxumllxjj@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694f0f66-de41-4369-eac4-08d96178c4f7
x-ms-traffictypediagnostic: MWHPR11MB1552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB15522C37284102A503A4E1FEF0FE9@MWHPR11MB1552.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 43CiwcuLeNqSy3g7C4Qb3VD5wWf/ZP6CvWkx0j3UVpJoH9KGvu5+wiiAIyZgxgtbwXYTfXn/ZNq/Gz73ukt6biSwre7d50JeA9cBv0QcmDfKevQX0vj0/q6ZiXMRYZzwQ6Jq6CTZRNl7IShUGxyFlV+W/Jh0W6ojhT/NL+d1XTcnaJAGomoccq15uUCy8giDf416nG4t2KqT4x503hA9qIKLlNeB4NCxKg8KZAk10Xd7bJX1UA99zSkqVs/dfcWltybTwkLQX9XaBsfZDn5OVwRXRiVo5olf6WBBo5GVnSc8m9hXIdi0fvBaRN5NA1NAXsUKJu3h+FPRC1KCRZHaieZbZeFw83LE7LrHGw6ca+FszM6U6GYFd+9gv2yGrtvZsXZVfmGS/KBZTvNU03klfACyDyy5H21hm5vM7CMEjh3gZ86sR2WM9I8jXV4RtfbDnOIPWRNxZumB9eXDScTWmwSuegyq9F/+uJXreORActO2W4PJgboqzkEyyjjCzg6whLh4dRyq2y0lxUrwZACDyDVqqQsBfjt/fbmatFcvUUeleV3SeVyB88d8q/COX9LpAIXkY+scPXlmQvX8tpqmJa2ctidIfZsL+zog4qE015Fv9Zqb+L1TFkiGCrV5O5ZYncWHtVyEq26EH3wY6/P1Xd2kSdWJ3XSCGcqiXuuo18ZFeU2+umoNZ8bZupZLl85jQV/i5pWf6K5oN2Kap+8vp5LubtM+R4hGFDf0lIriaHRVUYib0yxFs9OGlaZEVIkpBucYfNWT6+9/mQwKaNTW5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(376002)(346002)(136003)(366004)(71200400001)(83380400001)(316002)(54906003)(7416002)(38100700002)(478600001)(6916009)(86362001)(31696002)(36756003)(186003)(107886003)(31686004)(8676002)(91956017)(64756008)(76116006)(38070700005)(66556008)(66446008)(66476007)(26005)(6512007)(2616005)(66946007)(53546011)(6486002)(6506007)(2906002)(4326008)(5660300002)(8936002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2l6elJzbjVZMmswVjhrVzRQcjU4UkxXOUNkd2hYaENaMk9ueE9FTWNqcUk2?=
 =?utf-8?B?c0VraDA0MTRxN09YVkVNZXNKdFBEUWhKZVJIZTFSblFJdnZwUytBSTRoYzhI?=
 =?utf-8?B?djBIcnB1UVFqdHUxRnVGTXYramVCVzM0Zk5OaTI1MmZBOHJxMHZvV3RyOTV0?=
 =?utf-8?B?aDlyQU04ZDdsSXVYNUJDQ0I0ZDU2OWsrSnh1bE1wbk1lRkNWWnY2RXJWVkIw?=
 =?utf-8?B?dk11NkdrOFh4Vk5vMXdSVW1xNmN3Q2lVL3E2N2FqejdDQ1M1b0E2dkQ2NDUy?=
 =?utf-8?B?U0g4VUtKQTRuNzBmTzU3YkpFNFRPN3pyQ1ZOeWhUYVlNZHdxZVFjay93Qmhn?=
 =?utf-8?B?bXdkNTcvOXhNMGRIVjJZakpDcUR2czdhcStmRXBJRDZYRGVaTDRDYjBaa2lL?=
 =?utf-8?B?MXZyM0Nmc0RHVHN0K3BOZzVmR1JKRFhrcThqR1JlMGhwVFN3QTgvOHQ0TWx4?=
 =?utf-8?B?d09zMWZpK3JsZ2xpaEJoR2Nqdk9NR1p0TFZwcis5UnU3RXQ2b21VTE9iNnVy?=
 =?utf-8?B?bjNtdU03NHppYi83eHZEOTdtVDFCNU1uSDkzaDNiWTJTWmpWSlQzczFLZnpK?=
 =?utf-8?B?eElmY3NHcDd6VHJyV3ZqaFdlaW1nNytEK3ZFMzZMRnN2Z1d3dmVLMkluamlC?=
 =?utf-8?B?TzN1SytEamxWaGZDMFpKSHEyQVJ5YzJXdE8xRGR1c284aVhkMEJEZmZTeXlJ?=
 =?utf-8?B?NEFhSUx5ZFBaK1MzVDhSdFUyaDd3S29QbGlVUWJsUklwMmppdWUxWlNqMk9r?=
 =?utf-8?B?RHlGYTd3amdSVEFqYk9oOUJWQWFyZHM2TTY4dmdybWk2TjRiOFpMUC82RjY5?=
 =?utf-8?B?N2pwTkhENFNiVXlvUEtLL1ZXS01qdE9oUStpSlNZckF3cXNjSFFUa043bjRE?=
 =?utf-8?B?WklGYklna1pQdXEvQzU5OE80VTRZVVhRU1Z2dWJETUkrUXQ0ZFltWkJ5aW8z?=
 =?utf-8?B?QkorMld5YW0rR3M0M2FIV3JrWjRyVHNDU3J6UDRpbG9HTEw0OEVtWlZ6cFp5?=
 =?utf-8?B?TjRHMzJTay9QRnNjY0l1dkpHTmFLS05TdjBOYSt0ZGxUT0ZwaHB3VXNFZ21m?=
 =?utf-8?B?eERGV0phWUkyTlJYUExlU2VJWUhRN3FaYzVWWXVWdS9hUjV1SGFaZ3JYNFl6?=
 =?utf-8?B?NktoRnphdXZyL3pldkw2TlFtYStLTk1pYkpCRUxsLzNBOUJUTTRtL0VtNEhz?=
 =?utf-8?B?UGxObTRDKzM5NFVaWnVpeDd6ZmZXSCt4TVQwZlorRHhRdWdUQmtOQkVzZDZ4?=
 =?utf-8?B?KzBPak5laW5BMnNqQXdxNENBbDJJTTdaVWY2TEN2ME0xT2kyU0s3UVFLczFt?=
 =?utf-8?B?WU9GV3ZNWnE4bEc0RW5oekJSOTN3THF1WTVZVkpsNVlOdzA3VDFvb3VmM0tL?=
 =?utf-8?B?TDZFZVk5NkhDYzZrNlYxZWczOG5GMit0dVVVU0pISnB4bVl4dTMrMldnbEVo?=
 =?utf-8?B?V3l3KzZ3NEFJYjdpQ0JKbWQra2x3a28weXNDK0tjVXZOS0YzcmtHTkwyMWh0?=
 =?utf-8?B?TjhkL1hFMGF6UHVHekMxeEYxNDVtNytsYmN6Ync3YjdsRjdlaTkyVWEya2xV?=
 =?utf-8?B?b3BlVzJTOThpRVd3Qlh2djV5M2ZLNnZ2cEEwUTdHQS83ZitHb0hOcXhPQWJI?=
 =?utf-8?B?T3Nxc1hIR0tYVVNDSEVXQjZjc1paYUJwMm1YaU9tRkNNakNWL0lmZXdJVjFj?=
 =?utf-8?B?bDQ5YUErOGlkQzZ2Mk9vMzk4U0kxWGdFQUFQRU85UEpqeUcxcmgzNmNVTmNS?=
 =?utf-8?Q?QPiFKuzbkxO4H0Z3QY=3D?=
Content-ID: <7CE9ECC34820F74EB9CF8E40E2DD6CD5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694f0f66-de41-4369-eac4-08d96178c4f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 12:15:57.7609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: go0Nszavhj9CwQa769WMdygcRhTQfUGKJtKUFG7FQPvzTgN8xa9n6a21ygGPXz0uuyo68F8nbymJRrPW2gmYPTZdUa6qeWZdJXVKi2UUkeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_051602_048309_9EA77294 
X-CRM114-Status: GOOD (  29.32  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/17/21 1:24 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> Used to initialize the NOR flags for settings that are not defined
>> in the JESD216 SFDP standard, thus can not be retrieved when parsing
>> SFDP. No functional change.
> 
> I am worried if the order in which these flags are set can cause some
> subtle bugs.
> 
> I can see one instance of it with SNOR_F_HAS_LOCK.
> spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there are
> no locking ops specified, it sets the default locking ops. This works
> fine before this patch because the flag is set before the function is
> called. But now, the flag will be set _after_ the function is called,
> and so you will never be able to set the default flags.
> 
> This is one bug I can spot but I fear some others might be hiding
> somewhere as well. SPI NOR has accumulated a lot of spaghetti code over
> the years and I certainly felt it when working on my Octal DTR series.
> It caused an address width selection bug that was not obvious at all,
> and was not even caught during the rc cycles.
> 
> I think this series does clean up that spaghetti a lot. But you need to
> be careful of such bugs. I think you should definitely let this series
> cook in next for some time so it gets some exposure and hopefully some
> testing.
> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 88 ++++++++++++++++++++++----------------
>>  1 file changed, 52 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 1f38fa8ab2fa..6a8617346764 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2687,6 +2687,56 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>               spi_nor_init_default_locking_ops(nor);
>>  }
>>
>> +/**
>> + * spi_nor_nonsfdp_flags_init() - Initialize NOR flags for settings that are not
>> + * defined in the JESD216 SFDP standard, thus can not be retrieved when parsing
>> + * SFDP.
>> + * @nor:     pointer to a 'struct spi_nor'
>> + */
>> +static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
>> +{
>> +     const struct flash_info *info = nor->info;
>> +     struct device_node *np = spi_nor_get_flash_node(nor);
>> +
>> +     if (of_property_read_bool(np, "broken-flash-reset"))
>> +             nor->flags |= SNOR_F_BROKEN_RESET;
>> +
>> +     if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
>> +             nor->flags |= SNOR_F_SWP_IS_VOLATILE;
>> +
>> +     if (info->flags & SPI_NOR_HAS_LOCK)
>> +             nor->flags |= SNOR_F_HAS_LOCK;
> 
> As mentioned above, this would cause a bug.

Good catch!

> 
>> +
>> +     if (info->flags & SPI_NOR_HAS_TB) {
>> +             nor->flags |= SNOR_F_HAS_SR_TB;
>> +             if (info->flags & SPI_NOR_TB_SR_BIT6)
>> +                     nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
>> +     }
>> +
>> +     if (info->flags & SPI_NOR_4BIT_BP) {
>> +             nor->flags |= SNOR_F_HAS_4BIT_BP;
>> +             if (info->flags & SPI_NOR_BP3_SR_BIT6)
>> +                     nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
>> +     }
>> +
>> +     if (info->flags & NO_CHIP_ERASE)
>> +             nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>> +
>> +     if (info->flags & USE_FSR)
>> +             nor->flags |= SNOR_F_USE_FSR;
>> +
>> +     if (info->flags & USE_CLSR)
>> +             nor->flags |= SNOR_F_USE_CLSR;
>> +
>> +     /*
>> +      * Make sure the XSR_RDY flag is set before calling
>> +      * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
>> +      * with Atmel SPI NOR.
>> +      */
>> +     if (info->flags & SPI_NOR_XSR_RDY)
>> +             nor->flags |=  SNOR_F_READY_XSR_RDY;
>> +}
>> +
>>  /**
>>   * spi_nor_init_params() - Initialize the flash's parameters and settings.
>>   * @nor:     pointer to a 'struct spi_nor'.
>> @@ -2736,6 +2786,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>
>>       spi_nor_late_init_params(nor);
>>
>> +     spi_nor_nonsfdp_flags_init(nor);
>> +
>>       return 0;
>>  }
>>
>> @@ -3078,7 +3130,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>       const struct flash_info *info;
>>       struct device *dev = nor->dev;
>>       struct mtd_info *mtd = &nor->mtd;
>> -     struct device_node *np = spi_nor_get_flash_node(nor);
>>       int ret;
>>       int i;
>>
>> @@ -3115,17 +3166,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>
>>       mutex_init(&nor->lock);
>>
>> -     /*
>> -      * Make sure the XSR_RDY flag is set before calling
>> -      * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
>> -      * with Atmel SPI NOR.
>> -      */
>> -     if (info->flags & SPI_NOR_XSR_RDY)
>> -             nor->flags |=  SNOR_F_READY_XSR_RDY;
>> -
>> -     if (info->flags & SPI_NOR_HAS_LOCK)
>> -             nor->flags |= SNOR_F_HAS_LOCK;
>> -
>>       mtd->_write = spi_nor_write;
>>
>>       /* Init flash parameters based on flash_info struct and SFDP */
>> @@ -3147,27 +3187,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>       mtd->_get_device = spi_nor_get_device;
>>       mtd->_put_device = spi_nor_put_device;
>>
>> -     if (info->flags & USE_FSR)
>> -             nor->flags |= SNOR_F_USE_FSR;
>> -     if (info->flags & SPI_NOR_HAS_TB) {
>> -             nor->flags |= SNOR_F_HAS_SR_TB;
>> -             if (info->flags & SPI_NOR_TB_SR_BIT6)
>> -                     nor->flags |= SNOR_F_HAS_SR_TB_BIT6;
>> -     }
>> -
>> -     if (info->flags & NO_CHIP_ERASE)
>> -             nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
>> -     if (info->flags & USE_CLSR)
>> -             nor->flags |= SNOR_F_USE_CLSR;
>> -     if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
>> -             nor->flags |= SNOR_F_SWP_IS_VOLATILE;
>> -
>> -     if (info->flags & SPI_NOR_4BIT_BP) {
>> -             nor->flags |= SNOR_F_HAS_4BIT_BP;
>> -             if (info->flags & SPI_NOR_BP3_SR_BIT6)
>> -                     nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
>> -     }
>> -
>>       if (info->flags & SPI_NOR_NO_ERASE)
>>               mtd->flags |= MTD_NO_ERASE;
>>
>> @@ -3175,9 +3194,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>       nor->page_size = nor->params->page_size;
>>       mtd->writebufsize = nor->page_size;
>>
>> -     if (of_property_read_bool(np, "broken-flash-reset"))
>> -             nor->flags |= SNOR_F_BROKEN_RESET;
>> -
> 
> As I pointed out above, I think this patch is certainly going in the
> right direction. We just need to be careful of the bugs that slip
> through.

Right, I'll self review all once I'll prepare v3. And I'll redo the testing,
this time trying to cover all the flash info flags. Would be great if Michael,
Vignesh and others can have a look on the series too. With 2 or 3 persons reviewing
and better test coverage, we should be fine. Would be great if we can have
these cleaning patches without introducing regressions, but if we introduce it's not
a tragedy, we will fix all once reported.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
