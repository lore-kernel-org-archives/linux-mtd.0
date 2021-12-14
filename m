Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C1DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qOQ6GCxiJ6SgnoBHww2fCyBYUGyXSFkHw2mzsFIr1I=; b=Z94D235Ancw6c5
	T+Po6ro/dnICBdPyPHC4g0i6YUnJZ0Ag7m9mzDKJbldcCqbDGx69SsnFwlcrrvSxzud9SBC2U3B6A
	MB6ilqBqiEXn08bSW4WWvkX7U9FWlfpgM5iFZt/BrcRA0mhBEfSe5l9c6FXA42IgAuW03KTwwm8WA
	CoRN3XtVT7y4PtWcqbqILyGujMtEB9q4P0Cz3JlgWrN9HlmfU0Xzr1z4ErRKH4yyaWJoyT4nUG0os
	zW+ebmPhz7Z1cH8D5RMdYAUfwTQmadQ6P+TdJfEvgYrl59B0ZV6NyHpUnPQJkM55/RBjAePvNauXP
	qvzVzK9Jw+/EgeP50WMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx5nK-00DfVH-UC; Tue, 14 Dec 2021 11:16:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx5nH-00DfUm-86
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 11:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639480587; x=1671016587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QKFPRnfLdzNjK8s80x2tYXSEdvby8IBTt/zaFSFdyro=;
 b=JnEsOZ3CMrbVz4gJ4Hm0Nj4XcDUHr+huWVOMlU/lYzpnUAUT6oZ5xuXU
 wwnzkWsC/gEtBvdHETK/8VFgXyDVTjvSz/TU2u4xW/PzorOVjdb071G/h
 piP2p3CuvVttObi+MplfabTqntwwfdGbrKXyvXUSweNtD4zuVR4fxe3lh
 FFEKkDiz9+Jtol8U1crDXK9oqIBK9x820huODSjJV5y0XNvz0F7KZJTcR
 YfH6GNGbXJTc+TG+QfcSteZQpdp5KDoUzJKbDMLLOYfPquZ3mUho0q4Ai
 CyTdTVE0qsQzddcH08Byghp6fmn4Y+lpznLoeFTKJ/ucwpppXA3dHukgC A==;
IronPort-SDR: bgjBZH6kBFD1ory8Vrs0+flJ86V7rlWW1T0jQUa2RB+Un7CMjtclDFwz3g71bN99pqB8IVW9Xc
 TG3foPQ/qsZE7ykPW/QTSWuHJFo3Td87FB9Ln4NxA4L4f60UAa/x193opp6hxhCDNp9ToSHfEB
 c3i5Q2pDaQfTPw+ZspA5kW47999xlz9nvFPk28XcCLop4kLjLyQG8C+sG48/dzzORMDfwofR7P
 WwYgj5J36yRg5AEjXTOialAJJrmIZHKcQCLJIfxNLfQg+Ixge3pKaC0V8hSiPMokW5qQcEx7Nr
 8hza4MV1V2JO/AWXAEoMBvVc
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="147167653"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Dec 2021 04:16:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Dec 2021 04:16:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 14 Dec 2021 04:16:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWX1uaJ1eOVAyv1KqE+rvteP/DvvXErPpjd17oOz7X9K4R5GFw3hnsjAcV9Pc2vCt0p28WWMjP4a2Q4aMt/Mf5fQ2w1xXgJe1sE2xhUIf4UWpw0A30NfczNYrXaxAbxxlGDT43PxURVz2H7vCbLdM7KJZEfIBB1ASmGW6uPO411JOBDYz7LN9G2gtbtscqygRAm7rfCWUjgAHi5HzRwMAc3DFJzjG1fEftfX4P2B8NgA2+nY4QkK0phiVFPlC3YNS4G5dY2dk8IUhiY/JfNCyGZslo2V1MPHr2tSDoPLK7+1nZdenn2L8sbjWz1CWNTqVBN5RIIIpbCk4JGhoFJqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKFPRnfLdzNjK8s80x2tYXSEdvby8IBTt/zaFSFdyro=;
 b=NFrTlbEw16mZA2ZE/vXV5nMDuPN+ozbayUDkrtkr26apqj5Cq5bEEDXRdgWFGTqjMe7wzmMJ9vCkWfM79MOEY/Q7sdMxGlUMvYi7cJaYOwy1OlUCy9QBk1qRqt44yZGkv2LwVlNjYoP0/U37uo6Urn3hkmFlq7LC9JJ3YV+Nrn8e6RgnEC0RR1M/wLq2XZgUc3MCoJu+882dOtQNml7GgiSe6JVDJmV0tWjsCc98YrrA4xli128kYrV62zzh4tCwy7HQsYQzTps1FvEQHH8yJGGBSblC7NQaH9yA+/h+tyegGXS/FmUDD9NLskt7dFiZxxLZRB4HgVGMfFEnaUsr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKFPRnfLdzNjK8s80x2tYXSEdvby8IBTt/zaFSFdyro=;
 b=po5p9v4Bm40RkHpab22tJeU2yJx4u/3EwgKrnbC4NCV0Cr1g107PzLNPH4usDvRJgebNIhbZ5ES2Hv2a5kWAka1UDXOjKyQ9AlX1v3QVe2tBxxTQ7GIClAKsidhDsiWbk+GGNwqd3tYALi4lO9h6//g6TbzJB8AgsXUCbsEjJPQ=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1613.namprd11.prod.outlook.com (2603:10b6:301:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 11:16:19 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::b450:2587:13c8:e52d]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::b450:2587:13c8:e52d%7]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 11:16:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <quic_c_sbhanu@quicinc.com>, <dianders@chromium.org>, <michael@walle.cc>, 
 <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <stummala@codeaurora.org>, <vbadigan@codeaurora.org>,
 <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
 <sartgarg@codeaurora.org>
Subject: Re: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Topic: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Index: AQHX8NwEXGjGR1ABx0itnLmUtO+AEQ==
Date: Tue, 14 Dec 2021 11:16:19 +0000
Message-ID: <488aafc3-2fa9-198b-c448-d1ca7ef52f35@microchip.com>
References: <1639476991-25676-1-git-send-email-quic_c_sbhanu@quicinc.com>
In-Reply-To: <1639476991-25676-1-git-send-email-quic_c_sbhanu@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a29ee60b-3526-46a5-0afb-08d9bef32781
x-ms-traffictypediagnostic: MWHPR11MB1613:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1613D1A4A107E9B305B8AEDAF0759@MWHPR11MB1613.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zve0q9bO7XApvbjaZ0B5FEZmt6g31L3g6MBofw1IIY9kd9ilyikZZy1XZfytKektw9kV+qCriER3HSfpkelw3pMaG9UXAdlPfYt1pQLr2Pgjy03VA9tzBwvKQnVq3JU2CFhBj4LKyj1nIFKQSqlbmfxdjky2OPY/QztKosAmGSkYr2EvtK4bYB/XSCFllhe9f1Up6DEaTZ43eCY5ZbiPQBNDW8k5r6uS526T9Tp2RCJYE4Ds//y37CMeXwxw6Iwa2qK/nJ0XI3M6JLj3fqpwHdguKNyn4BTnP65nxJ9Pw0nb7ib4TLaRktwTDoqtKBnBmIa8p5zJwL9nTowVP3YEYKpv2+xaMcum/GadijsidQk9Tkkk+ofuyDNUkTQpF7V6OR52gkcuRFEqGrbbp89YhvjKnU1j5YGanNEgbTlGdyPF1A84buD0xtYqtBq5YiCaEPFJMj4kv+DoYkClPvTFCCDpjEkF727PUqK4evbN68aCg/SIQatwsR1e9egFXl0OuLhFxTwcuxIRwOR/kgI9MC6Vknm8tvkUM+7Nw+nJKjV4rXkvMBh0cik8tX9Yf7CJ7DhEZ202zfTyY+dNp7i0YVzaNcN0zrwRSitSdW5Fyz4kCwksG6q3ZTR9SVuhPr63sDLNlpRqlZj5VX9k6+kLIJi/EB5vPI1W8JZfII8p2xSX4v+c/Eazp6nSWRL08jIX+IQLBMLo2Fqd1k58wVxsJ097D+rUJ2vRNI5oIWrxvEYzWHlmlCMFGywRv1F+QHIP8C+Q2qHFQnEasxa5nQu0fQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(64756008)(38070700005)(8676002)(508600001)(31696002)(66476007)(76116006)(186003)(8936002)(71200400001)(7416002)(66446008)(66556008)(91956017)(4326008)(66946007)(122000001)(86362001)(31686004)(38100700002)(83380400001)(316002)(54906003)(110136005)(6506007)(2906002)(2616005)(6512007)(26005)(53546011)(36756003)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkIvNVYzU3BGZWxzOS9wQjlhM2FWOXVDSStDOTRUSXB3NmVrYlp4NkVld2dR?=
 =?utf-8?B?VW5CdlRHUWVvazZ2V2JjV0MwY0lodVdXZ1VxVlJTQmwzakNRUEFUTVk5WjZS?=
 =?utf-8?B?QXJHZ0J6RFhleDRNZXVJYlIzaTM2S0d2SlRObU5IQkM3S2Z5ODdLSTE2TGdF?=
 =?utf-8?B?MFA0NW5idEtoTURqYmR0N3NSbGthQXBWeGRzUTk3ZVc3bjdyN3I1L0x3M3RV?=
 =?utf-8?B?UVBmK0lNQVBpR0VuZ3BpZjBIaXZYZkd6Q2ovMmh5Vk4vM1pURFdqODR6bDZ6?=
 =?utf-8?B?M2RZcUN1THVCeVBFdVhiS1lML2FoaitxaWpEWkFBbm8wWnBlVzJiZ2JiczA2?=
 =?utf-8?B?SzdCT2tKcmlQdlJsTmpCYyt4Ry9ad05EYXJoMnE4UmlUQ0J3N0NTWmRQOHhv?=
 =?utf-8?B?NG5lSVZicWlpRXYvdDB2NnI4TWNPc0VTYmdQWjRJZVIzUjJ6OXVkWGN5Z3Fw?=
 =?utf-8?B?N1NHeFN4YWgxQ2ErdlB2N3E2L1B1eUd2NDBMb05CSnFmRVRITHU5Uk9kMUQx?=
 =?utf-8?B?TE54dGgrS1R5WVlYRU8xYkpVeGk4aHp2bE0zR0VPaS9uQjNGTGcrVk5RZjBj?=
 =?utf-8?B?akdUSXZuUG1DRTdRMkp3TFR6eXpETE0yYVhrZGFUMzZWL3RhR3dXOVZIdm5z?=
 =?utf-8?B?dGI2d0dtQTZudTM1T3ErU25VenNLTk13bVNzUFprM1QrNTd5ZEwvd0xCSnJj?=
 =?utf-8?B?OFVpelNRcE9oaGFvVi9qOVBLeDFjTC9YWkdJT0U2dzJleTlNL0k3VDBwelVm?=
 =?utf-8?B?UGh4V1ViazFyVDVnSzl5Q2Q0em1DQXFETnBnWnRVUDh4VEdpOW12MEMzSUU4?=
 =?utf-8?B?MzdkSGVPV1pLREQ4RDJzc1lvaEw2ZWNFOENJeTUzaWd4Y20zVVZpb2cwWVNk?=
 =?utf-8?B?NVdsQnNHZ0RnbTVhcEVyVlg1QmVjcWZDdVJRT1htYUdwa3VlSnRmUVBrcVB5?=
 =?utf-8?B?d0ZxOThUbXVWN1lEaE01VjNZMVVkYUpVU29ZTlZMS2hpQmJBVDlKNEppTWsz?=
 =?utf-8?B?MGNQckpINU04Y05YRWNZaGNwcVY2ZXFQZUxGSFFTZkQzU2MwNURwWm9DUDBp?=
 =?utf-8?B?ajlLblk2ckhJTmZRMFVNbjFLbGR4Y05FUmpadlI5WVVHN3I3RVF0Q0QyakNz?=
 =?utf-8?B?TU1yTVJjUWpFVlM5Q0dOMWhSSTFreEJHeEFmLy8wQXJNMjV3QmltMEFwS3ND?=
 =?utf-8?B?MXRaMkhycDlpZVZqSGRUN3FjL2JSMHFMSUxJQU5mWjhWTWZWUEwrbGdKbmpT?=
 =?utf-8?B?dVp5R1ExdVlyaDlQc0JiejVnNC9tOHo0MnBJTjUrUzRDMEtvYkNZbDVlYWh0?=
 =?utf-8?B?WDFoSy9TL3kxcXpBbytja3h3QlljeGc1a21XVEhmaHgvVDZ5RzZzdFpPNW5r?=
 =?utf-8?B?U0pkN2U2N21KUG9vNko3Z0N4WmFOUy9ZdDR4SFNld0pBZkpuZjkrbmNrWVJk?=
 =?utf-8?B?WlZ4dzIrK0o0dVBzMGN3RTFoNFBKTk0xam9MZnUwSUY0VFp3ekR6N3NkbDJw?=
 =?utf-8?B?ZFVDOEwzMmRoVm43cGJldGNwYWlHWGFOWGRiZTBnZmJIL0FaRTM2M0dSWi9R?=
 =?utf-8?B?bThmcy84eTNRZmpDeVpyNlhxdkZBK2VncjVQUHU4TXg2TXhiZThEL1M0eGdp?=
 =?utf-8?B?TGhrT3NYSzVLUlpsR3BpWUhzdzIzOXp4QlJPRmZGWlg3ajQwcTB2aS9Bb2Q0?=
 =?utf-8?B?R0tJS1hMVUMwVzFjZ0RLeFhkMVRTZWE0K2NrSGlnRkw0NDYva05iQ1kyWVdW?=
 =?utf-8?B?WHVWWjZjWmpVcjhmQlRGQ2ExNVZid3M0ZGRDYnBSdENZUmRydEx1VS9JeUo4?=
 =?utf-8?B?TjNkTFRIMDRtZFZlTHZwT1F2azR1Q3V6Mm1yZFp4dGN1ZjMwU3ZxTmFSN2ho?=
 =?utf-8?B?V0p3RS9WZExYKzVNcG8xQmlJNGQyTVh3VnFYU2YzZG9ocVZuUTN2R3FLZWk4?=
 =?utf-8?B?bEN4b1JvMEpRRUh3My83b1daSVI0OW1ESFZCcXZVTWdlTzFLTEFEcDhweTRU?=
 =?utf-8?B?TmU5SWpDbU0zNkJCRlFrWlNGUTBkamhZdWgxRjhXMlk0MHJ1eG1xUjBiT0Mx?=
 =?utf-8?B?eGR5aGpYYlhLV0xiTkVYTkxwelRXaDl4clZrVnlRUCtPSExYZjNFZ1ROYXRz?=
 =?utf-8?B?SXN3dm1STXZ4enFEUkVwKzZndnVKREd5bUZrMlJ5MEJLRFk0VnZnUGNuS0FH?=
 =?utf-8?B?WXNNUW55ZXEzdnFtajlZL1d6Tnk1d1E2RldMcWxscndFYWU2aCtFYUtIVTdN?=
 =?utf-8?B?Rzc5aDFOVm9YQ0E4TFd5VnBwUVJ3PT0=?=
Content-ID: <929DC52726931F43A06C48B31F361B1B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a29ee60b-3526-46a5-0afb-08d9bef32781
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 11:16:19.7797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s/Ez+PvPyODQnrL61vjihyIToQ3n85tSzkcBIDB6g+u3P44ThFouhysTqODtsnDRvvcPP/HSzZIqig8UN5WnYLvLk3VrzR0LN/+QUu1YxWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_031627_398178_3688CC8F 
X-CRM114-Status: GOOD (  17.88  )
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

On 12/14/21 12:16 PM, Shaik Sajida Bhanu wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for winbond W25Q512NW-IM chip.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> Changes since V1:
>         Added space before name of the flash part as suggested by Doug.
> 
> Changes since V2:
>         Updated chip name as w25q512nwm as suggested by Doug.
> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 96573f6..42d5800 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },

This does not apply on current spi-nor/next. We've changed how the
flash_info flags are handled. We also require to dump the SPI NOR
sysfs entries under the comment section ---. I'll update the
documentation to add some guidelines on how new flash additions or
flash updates should be proposed. Sometime this week, or maybe
next.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
