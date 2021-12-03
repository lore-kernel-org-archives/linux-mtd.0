Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D52C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9mbgt8LEpfKGKGXD5H5+fCF4w43iyjU+VEBoa2rCds=; b=DA506LHSvtC8db
	JQlbBw4LwaYprzOlC9u+8Q3dnIf/9HqDqTW5xBSdVAqpYOMe0cESeiSZxev0NpTFc2rTo0qnJiWfS
	V3L3n0opPpFVZRPbOeLhkzX8krSF5D4SuKrLf6GCC9bJStSFuTJ8q26fD69Jk5nYQVJxaIAz3m7OP
	RdNl9X1FI13cIhFamBewnW5o2M21WggmDhRjuK6my094s8QbbjJtCtk9Uz2/3CAn9EBhB70P7+B+g
	gPlxhDOfJLJSZG/PnF/wOU1mh8kCvD0etJM3VJAOF0Gy5/Zq5MW/20WLy8p008KjyO+HPlfoDzqrl
	r6ZNbADR8ldxfx6U7slQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt7IP-00FbZv-Q0; Fri, 03 Dec 2021 12:04:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt7IL-00FbXw-Fc; Fri, 03 Dec 2021 12:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638533045; x=1670069045;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tU4SSjudBnzyQro9+aHDtez0bpCZUViRI48CkIzUa7Q=;
 b=TBr6Ud2KPXOoLbbOO60m9DomZS7CI9MjdOpCFhG3RKRmAKiGvEA5b3fj
 KAVqw7YPqrSkiIaIbZ6FM7YxCtJANhVgD66Up78DIja3oNxyWLwsFGl4s
 cFSeptKvKhtX8SPuYz1IQgWUrFYMol7SZROpj1hrAbmmsre/MO/G8Fxqp
 a6cRtSAMY4q42b6OhUKbr5v8lwNUlV19tX5BCP+uioqrOK1ui7qKQLAcH
 s61srihZ2qcBZ3s++An32EZj7p4mbil/9wr3yivWqmdBRvXaUENZHrI8Q
 rKWUGKqW+sTY5N44IRdjLU7x5xWVCX3UaaIDQo8wPRPaJRPpnd6pF1ix+ Q==;
IronPort-SDR: nCvVpe9AApxxYdLf2PfUk9F4hkhRZYgN2W9W1DZuc4zfE9Ur2+p92/s5iRm8l4DrsXwPFQbGjf
 LVMEDDJM0TLUzY+olXEF84OOmyFLhOMHg7uttZqwTOE74EP4fvSVzMQAZnKkCzbZjs7j9deAQq
 dIkMD1m900i2f96Ps+IxwisQP4yQADQ2UEaUOc/z+NM/KGH4IJ7IaPI0MpSd1H/69A39G01i7R
 XVscJuLbY379+3pawk/YPoP12DUiVyHJyNqQduPO93bvnEwsONywdLjM8iwTDQZyxxAbGKTLWI
 ucHB+In/6UE+feh9XK1n0ue1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="154158905"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 05:04:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 05:04:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 3 Dec 2021 05:04:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=go5HBVK6vywJJXv0ekr060fM9xCpMBN9XkE52DuHYf7qcIIf3AYNTtHbNYS9f5Bd4rfKG0r2DKEI+M0MWGkjLBUJk7KxXmPSEEoaWxlZlo5kC+75hhB+9IbchT5AHIrNCsfZwwwVNgvfg+ZCbnMhqRW4tluy5gOgQSFqz6scb2yPIHoifPqA6HAck/TcZRzORc5YxGP0rWm3F1qij3ZsndJbhbER+60uwciQYkEJbQaFJIK3m7hPc5Fs7fNZ8FtGmwZHSvE2tEfVLYwTlM2VYim6/1IXfL4rZRB9wBc/Cc0zZdtiA1w4QV+rq+/FQVMSQ1Cjvt/0eYMmLh+Hn7uOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU4SSjudBnzyQro9+aHDtez0bpCZUViRI48CkIzUa7Q=;
 b=RVreL5S1rWtgbuUY6J7yXsw+/qdTPwQcr1pZWTPvdweW36oWVsol2RCPzWBHW8byQRfaUrmfyh+gB9DUbCxoDJ/P4yTzMqcTWOe/NBvqoO8kRf0omTlNogpVkGxTsMgoAkQfEzbtsk3lI5wDIDJyjzLbevQ/A9EuIJEMulVKJfv1pgSDROlmRT61BtORMNjWnO+yAId5Cint+jGlMdabJ60X+J3Ng/ucu+KPZazczwaMWknwZymdXaWDcLiW9Jt+3cvMtERWr7cynpXTqDXAoh/09uMsnIlXjufK+HObKT9p1eGcmQTmbo+gW6q5PygIzRN+lqSSW7bzlFZjYHVctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU4SSjudBnzyQro9+aHDtez0bpCZUViRI48CkIzUa7Q=;
 b=ZKgJaqXuh89IeBi4Ft5I4lYSEoGKaPF5MwBXa1f7XV3XKGjbNH/F9XRtMKRI8LDVtZ9Nm6ez5f/gGXA/VgMsAkX45B0PtIZZ4EANJKxLQYU40MIEz59uDktCO5OnaUYlhm7bldQTK562qmPS/mtQqqglvL+vilxggldVzkV9K5Q=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 12:03:52 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:03:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v4 02/13] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Topic: [PATCH v4 02/13] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Thread-Index: AQHX6D3XN9iGKzEeT02qrkLcNr+LQA==
Date: Fri, 3 Dec 2021 12:03:52 +0000
Message-ID: <4c28b895-76d4-d358-4685-9a8010d638b0@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-3-tudor.ambarus@microchip.com>
 <20211202091946.ysjwdneo5x2pin6x@ti.com>
In-Reply-To: <20211202091946.ysjwdneo5x2pin6x@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52a31fc0-02a2-4e14-8987-08d9b654f98d
x-ms-traffictypediagnostic: SA2PR11MB5211:
x-microsoft-antispam-prvs: <SA2PR11MB521139735348C2A545611869F06A9@SA2PR11MB5211.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: guq2yfCXr8faJd4e+SLs7CTZlBV1ezqqSxLNsn8ZX9tpfnc0ZjHUyt1j6k4tUCmOvIZ8TxxPMfhjHFrGgvj843qB0Vqb97Mls/ZFpJkyD4Hi2M4UqaKqg4ddgiUD/bIcc6nWbQPbGeUgceBAKAFTLIkQLOkI+7h1OeLOrA0zJEhWXh83KTfTKnwyMs6joBqE+d2LZOM5gBVPprEK5NzX0ZToe46O3btDQgnkl9czTLbPDSM+as9B+26xWY7Q7eqLV1ao5/12kffA9ndycSduRakzCyr/UpjNatKzzRvuFm34QQ+Q9YWqBO5swNYPYnBn5bPCi6iWsr/RJx+W+1KrodJ+0Z22FnLNXtsSZYwz5AOra8cdaUycZYwUrXEmfUlOXlZCl27a7ZZQKXJ40AEI4YmutopCK45990T3jf8L8wi+SXa0Ftlc9eh6nKrl6ARxKuvUnydVo11YQKDF7xgPOMIl+CUtD0BGpAyfsjNw2SuuHPqjZ+rKoA2i3q1b8Iu6dUQ5kYDj1MDP0AsE7rqIOPt0hwdHoXSuVPSoAhaQjj4t95yGw7xmtGRrcoYs3SmrlLCUVvklE03VumlRprnl2RTlF+vX03MFjGD/9NkSkdJen3MYuiTc+VofiC6jGPOsk0IX3pyZoJCmgDV6GPJwTNJ1z1xeCgvun/+S5SAtzi3IVAlI1v7Mfcm6yix+mrzIhft0BZvGbfnsrzFFzs3+UU1mURlhyMxIQUQC9lUq8pbW2AYsgRlqzhsDgzlNAwl7bqb8L9gwn7SiIlPptqcg8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(53546011)(5660300002)(4326008)(8936002)(76116006)(6506007)(316002)(36756003)(71200400001)(122000001)(91956017)(38100700002)(7416002)(86362001)(26005)(6486002)(31696002)(54906003)(31686004)(83380400001)(66476007)(107886003)(66446008)(2906002)(8676002)(2616005)(508600001)(38070700005)(66556008)(64756008)(6512007)(186003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?US82YXdDdTBrUTZ6WEdkSzlwNXNQMzhHU2UxWC9pNG1TaTdJUHZ5Y3FuSnV5?=
 =?utf-8?B?eVJiVDJEaUJ1YnFoUG9IZU1KVTVZWTVtNmZHaDJheXhFSmwrVlo5T0VNMTN2?=
 =?utf-8?B?MUxuUjh0d0lHRVJ2ZE84by9HeGJ6SW83Vm51dGE0N0Z4cDNJSTZiQjRBbXhC?=
 =?utf-8?B?QnM3U1MrSmxDK2FLR3Y3TUNpZjc2eFUwSUpaU1d5a2VoR09oRnhMMzFwbnQx?=
 =?utf-8?B?OERTMXhrNEJUdjdXcTRFejNqcTJzN051OG1ydVRrdG5CT3ZzSTNwVnNwcnVu?=
 =?utf-8?B?V1NJcDBhUXJFeFYxL3JEZjFFamRlRVVDMUtXeGFXcmNmNE9EcTcyQmxaYlFV?=
 =?utf-8?B?eHlGSWIxVjhidnZMSi94LzBxVVpPTm8rR2RmdWlqMlBmSFJzT3E5OUtBRjZP?=
 =?utf-8?B?SEhsZ0EyUDRma29hWE04R1NWNk9jSkFpNTNiYmRPVEFRWWVCdGVKYlpEa0ky?=
 =?utf-8?B?RFNnTEMrY0tvVU5qRXViaTlvVVY4eHJTeXFIdURSaHY3dDNPN211cFlyc0NQ?=
 =?utf-8?B?cEZITWpwNys0N2dNUDZaQ3pZNTR3R3JxZTQ3cWFMNHJyQ1lvUFdSdjFrK0w3?=
 =?utf-8?B?ZVRDUU9yR1p6a0dPOEY2RTNIU2p5QVBNR01FQ1VBY2padWducE9JZHNFRjU5?=
 =?utf-8?B?aHU2elMrVTZtN2U1K0E1NU80azlSa1FPMDRtWXNadnBUWG9IdU5oWEc2MmY3?=
 =?utf-8?B?eXN1MmlNdFJsbFc0MS9iL0t1VTJMVisxR1JkcCtVU2lGL0ROYk5MVUtTUDhm?=
 =?utf-8?B?SnUyM2E4aTJUMzZzNndIMlVENXdqNGtkZ1MzbE9PeURlRXArOVYrTWZFNlBj?=
 =?utf-8?B?V1NHWFdUZ2x3bUNYQVl6R0xob3lCalRGNmliKy8vc3Z1RXpZU0ZQZDNvQTBi?=
 =?utf-8?B?S2FYbnI5ekZmRktWOGlOTHNxd1dLK1B2dktROUJrTVhHazIyd1BzTXBJK2RW?=
 =?utf-8?B?WEsvVkF0bGtjdXRTaXBrNXlXZW4wTi91czREWTBNSG82V09DYVI5b2xPaUN6?=
 =?utf-8?B?aExBZ0FmSzF4MnlpdFhyUEpiaHphY2pZSTAzSGxZYk5OandGSC9vZmFiYWNL?=
 =?utf-8?B?U0tNMG5lOHhnYmtPWW13ZlZvMEJuNG1rZjhWa2tFNHBtSEhTRit6MnlCUVk2?=
 =?utf-8?B?OFVvSU80Q1A0RmFZVDNWcFZuc01GdmJCcUxUZzF4VjZHek9QVXBuR3ltdCtW?=
 =?utf-8?B?RXdUVmQyN0xmeDJZNmZFcDE0OEJKUXdrM2pHV3l0YXVnZGprNUEvQ2p6YkxF?=
 =?utf-8?B?andYQWpEN2RMMzZrNVIrYmkxTWt3VVE2VWZzcXBXT1YvOWUyRngzS0ZWcWFs?=
 =?utf-8?B?Skt0N2RFMXgwekc2ZkhZelU1RFl3SWVJbFJXeW1wbWJaWmFkOU81QmJtS0Mw?=
 =?utf-8?B?bURtWmVmMkh0SEkyVHVjZ05YR3R3ZjFUZ0JVR3VNTHNBTDN5OGxyVkwrb29T?=
 =?utf-8?B?cTdBUXkyTVR5YUZ0S1gzcnlvalFGM2RQSXZXNHRUbkVPbU1YMkVFK3dGNnVZ?=
 =?utf-8?B?TC82V0cvMmhNcUxOM2hsL2tUczcyUmJPdGxUd0JYTVpMZHpTZGhLekk4RFBB?=
 =?utf-8?B?ODBNRitkQjV1Rm9VYnZUT0VCUm9ubkV3ZHZ3cXVockdNdnY2VGg1LytsNitY?=
 =?utf-8?B?Y0xuNFFFK3FJY0gxZjdpaTZiM3ZBL0wvODQvWG5vVk12amVjbUlYQWxXdWRB?=
 =?utf-8?B?a2ZmcUpyV1VQYVc3MjRKM2hwdlFEYWk0WVloc0tzSVFhZEdlNmx5QjFybXJU?=
 =?utf-8?B?NjJVcjEwdGpLb2h1b1Z4ejM1L2JGUmlUcHg2dksvWllEaE5yNmtvK01vc0o4?=
 =?utf-8?B?MWRsNDQxeVNlZHd2UUtzSDBPd0ZpODF2c1BvMVJFYllZMlFrd1FEczZ1ejBU?=
 =?utf-8?B?c3k1aEFWOW1xRFh1WVhrQVlOVDBvd2Y4VnBZOXgzaFk3aFdsUVBPTlVodi8z?=
 =?utf-8?B?UTI2eGtCU3N3VzdlQ29iZ3MrbjBLY1pKcTJoZjRSYitmbDF5dnpHemF5VCtr?=
 =?utf-8?B?WkVFOWU1NnNBM3MvTmlFZ2FMdzg4SWpHcmZMc3ZQenJyQVk5NmsxSDRWWnkw?=
 =?utf-8?B?Y3g3c0pRb1pCSlMvYlZ3ZnV1d3pCNHp6dEozTVlpT3JvbGZrTWo3bGppbDJP?=
 =?utf-8?B?elBvNTNmYUEwTkRTYkZGL0VPTVBLMzF4amc0MU9SWWZESGJBLzB2eFFBUm5U?=
 =?utf-8?B?VXhLc1RuT2FKemJ5djI4RU9xVlBvVWhIL3o1cUN1djR1aG94dEFmOWljdkp4?=
 =?utf-8?B?UjhqcnRPZE5HdG9mNmhhUms1ZlZnPT0=?=
Content-ID: <7E734E2F6A419F43B1709FB6A93E7457@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a31fc0-02a2-4e14-8987-08d9b654f98d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 12:03:52.8891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQr0ZFFb5HjU248ht6Uys0TTq7lRO4bB18uTpbNnBaO/Xa/ESCOQm/HYC3uOah02rPK3N7vwWBdhL+Kx+a7Hlbsk2qnhSxo8H9Ii5R61iFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_040405_587084_44D2ED61 
X-CRM114-Status: GOOD (  16.84  )
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

On 12/2/21 11:19 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 22/11/21 11:50AM, Tudor Ambarus wrote:
>> Used to init all the mtd_info fields. Move the mtd_info init
>> the last thing in the spi_nor_scan(), so that we avoid superfluous
>> initialization of the mtd_info fields in case of errors.
>>
>> While here use common naming scheme for functions that are setting
>> mtd_info fields:
>> s/spi_nor_register_locking_ops/spi_nor_set_mtd_locking_ops
>> s/spi_nor_otp_init/spi_nor_set_mtd_otp_ops
>> The functions names are self explanatory, get rid of the comment
>> for the OTP function.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Reviewed-by: Michael Walle <michael@walle.cc>
> 
> I am not particularly happy with spi_nor_try_unlock_all() using
> nor->mtd, but I can live with it.
> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
> One small nitpick below.
> 
>>
>> -     /* Configure OTP parameters and ops */
>> -     spi_nor_otp_init(nor);
>> +     /* No mtd_info fields are used up to this point. */
> 
> How about "No mtd_info fields should be used up to this point" so we
> give the programmer a command to not use mtd_info fields rather than
> just stating a fact.

ok, will do.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
