Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420EFC54E5D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 10:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nhmE0X9SX0C1gzWPqPipOYy4Bs9CzAMCBM6pENXFik=; b=d9jvRBP8BnvatS
	uOTlbTdMrPuXV2ctdvH4vfhTue/sSMFGAfJ6hlyt7gbBZ0X6RQqBmYRGWX80R4r7cHyxUzH9V2Zzw
	BCKTD3kzVYS2EBdYnnD39dNtIORmVyaGFjVJkGYVrZjVW/72kpVdz94lsx482Du1Gd2P/+mLitKB7
	ULYjJ2FJFeqVeu3kgzczlVNwb4rW3jRpoieW76pDqEIJtB4lEoWSL5bNhccYmt46eIvPnGgWMFPIx
	Cd1Qm4YMshw143vL5JVEvjV9HGtH5a4L37r3bi/M+B1guNCcw8i/anAuDacD9BBsvZAVwIH6iZ7+l
	RRA4CMCjoLsX6BKoXgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmWz0-0000000CLix-0JjO;
	Tue, 19 Mar 2024 10:46:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmWyt-0000000CLgd-0LJC;
	Tue, 19 Mar 2024 10:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1710845167; x=1742381167;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZX4vHHdGZDQlQoUzD2voqQ1gLQaRNcGlFJlvZKWUFB0=;
  b=SNyKDo6fp0nojwISlaHIqB/2hr6r4QDmHdOsBrJ+8pi70iuf6uaLDV3e
   pQTZcUebO/sUbOzKGAqMNTRrCgJgQH5oruQl32pIcdjaKqcgmAtv7eRXk
   KZ+wPDpuL+rPTEiTfGzM1vfVxngPJUsHNpuGXuua/lLhU33ZaUYOAxBJ3
   ZqNH/rG+jfsj/Po2aY00AktW+PPC9TVZw6yhgUQ35spbSUwvgXbXcZx1O
   zlI9FS1JkOXTmCkFsPD2ndGHqVdil1XczHFs0ch1YvibL/CP6Vp+MWRMO
   8x3VOFI+Dnihw/CV1Cjo+Yc/5VsdMtXxZXTCfKTZkn5lEV+t0iP/I+AFC
   A==;
X-CSE-ConnectionGUID: Gvfzvks/SJuqyehc92eZew==
X-CSE-MsgGUID: PfUofqoyR8K/XjrzZdadZw==
X-IronPort-AV: E=Sophos;i="6.07,136,1708412400"; 
   d="scan'208";a="18366491"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2024 03:46:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 03:45:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 03:45:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntzLigjXbeqsTqNGxLo2XTqiCxJ3GELcXTx/DRl3MMgVI64cncMZ+kYCf0r13Tc44wFvJ79m+ByOfx83lBH9EKJ3EQQgaSYBzHfNfG7XzmxYOUr+w5J/vL6a4sZjVTVtpgNIpYoKUWuhubghuq4r6y+GL0LVtz+9mHwwqLr2TS6dLO5nSuzETxX9kJUp9ML5HhSQ+HRRnUzWsL8VeUdeA0ubw0UJftgbZLiNCNtg7z0auUFKOrwL6KbxlWtMjZWxJd5ngGKcAckayAxz3WUuATN3Bcj0EvqeXcna1g9xSH7Pl4HOeE4kWRT3ik2Ll2qThbMyYsNgJ8h6ucZ9PZ7qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX4vHHdGZDQlQoUzD2voqQ1gLQaRNcGlFJlvZKWUFB0=;
 b=IGJhLlTeRYKS894Lsx8I14Ho9HbcjelQ0v4aWW9WoAQjCyNsCxGKLvNnzAIVyMVkOEVt+vfmM+lszvGRtu/oZ/y4KBjSjL+iR8gt9wqr7BKtHOb+yX26P7GQwsQGOciS59uRnpFAEhS2Wp0aXEHQRmN4UdtUAL7L1LbTv9Y1wSOueVCt7rlRYLMaClS5kODfET+n9uqepA8vCVhc6Y2cGqsVNDQH5kRuj028ALTpO5WrNt2oVyJww9WUBbqN2BjKqiAHS5PAz8Lx8RYZG+j/kVSL5WNHiVplgYk5E3aBcKZfvQvIZ/+i3ebFWN1hBRQwhzAD6gT7O5slFtaVCHPakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX4vHHdGZDQlQoUzD2voqQ1gLQaRNcGlFJlvZKWUFB0=;
 b=iV/rlQ+r2t94+SNU+EnFTx1Tfu2nD2js3R3CvvU3biK1xF7dqVwkuwhPGhofnMB8H8SIuCRIP2kh3JX99c1CTWVgxYqrzSXQOEFyhbQQPZ4ADP5TQ34nVThCao834Mo3RSJ6wHS3M3Dm47efrZmYM96kac2Ke78sxdTb0+cPqB9+WtPwDcA8qYi3RcJyjEH7OMVj7XpRngZDr85tX7N54x2uPDkp4WfhxhHo/xp/lN9JL84A9HNrFUTF9QtbTG2d09dQfp/mSzixnEFBTYCEStRrA1DCpAKHSqaMCXUkcDtQWehdL4h949Ziy+qXya/b7GTQ1MURiz6/kldCtWNs/A==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Tue, 19 Mar
 2024 10:45:44 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::6440:4b82:c32c:9eb7]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::6440:4b82:c32c:9eb7%5]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 10:45:43 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: update maintainer for microchip nand and
 pmecc drivers
Thread-Topic: [PATCH] MAINTAINERS: update maintainer for microchip nand and
 pmecc drivers
Thread-Index: AQHaediUUJ5azV0iCEGZ+AASReGbVLE+4XuA
Date: Tue, 19 Mar 2024 10:45:43 +0000
Message-ID: <bc2930e6-f599-41f4-9df5-2583910a1d9c@microchip.com>
References: <20240319083620.88181-1-balamanikandan.gunasundar@microchip.com>
In-Reply-To: <20240319083620.88181-1-balamanikandan.gunasundar@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|DM6PR11MB4753:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XmBRmsXbodR5VJLgV6V8ZxBOkBLhYPssw/soakxOqUY3xzNvHBxWl1jxvlGa4KVSIfInWzwBWbI9yKHrSkiMjGRdSjqzneeJ44pHv7nRZHmgBEKQDank4YY6BloSkdHxmrB8v6ZI4fwpunGDDZC6GY9vfotfBTKD3/DmqSehm7CFi5/xJuhHE+BSd1pgPUEVWXuJt0xrknyyz5697t98FXAGcalAXAqsxT4MDR+tKOuCDgupEZDsHV1O1ShxbsXlGfBYCxXRAImF6qjMzBx+cZU6/w7HvnBSf1WV3QwaD+zH7HvOwYYRgJ6GzFzhKss1GYSyMK0evI1e/iFSr8PVeRigS21swxhVOknv1s2wgY2zNab3Oo4wp7/KFpgsB9spcji5HopLV49TPKTSq307fXttsW1/Gd2hIVHCXE7LYG/7nikzNBKgdFcwB5hrmKO9kw3jqcdKUjbw0WgDHevscCyWN2KaAfBYAKO27wk3umQOhDkppWMdzvgCtqBL2vJTH6yLzwsH08iUFbVTTdA3tnSnydMJtYOytAy4423PgyQ7tlor1p/ZtQsmLfslr2es7cqIGInVF3vXsgOwUE/LsRIUkYhUoVNw8Z3G48uGgXvkn0zYxjyL6y5CcRVnFFYe/FQ3CPiR0xuqx/JzoqnoCcPL44joxHZaxqeG2Fe2NEE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTc5NEQ0dzRhRVJhMTZsZ245UHFhb1V1K1h6Mm9HNkxqQUY5WW9UWGZmTDBj?=
 =?utf-8?B?QmFlTEQrYVRZbFM5Ym9ZbWpMY0NnTHFoYzFnaTd1Rnp6SXg2RkVtS3h6ZDFT?=
 =?utf-8?B?YmpONC9BVXlHRC8rcEpvYU9nRlEwdTNZUVhZOHNFQXlXdkdkNWxJMjlYNmJ2?=
 =?utf-8?B?bGcyb1lYMko4ZGo5QUs0S29odjBNUG8ybUNNdDhoVEZDNjRwb1o2UE1KSDhH?=
 =?utf-8?B?S3N0bDBRZGJZb0hrQS8zZkdJaGpSeHZUN3BXY1E1YkJCZXRpSnFlWkhTSGJ4?=
 =?utf-8?B?eHdhcFc4RlplM21JL3lDYmJrRlRFWjl1Ym1namxSalJUSFlmYXQxS2Y4bitX?=
 =?utf-8?B?cU5rWVFNajZMTlBNUzhYZ3oxQk5yYnBFdllKa0x6ZlU1RkIwdlNDVU5aVC93?=
 =?utf-8?B?cmphZGdGbSswb3JpRnlHTUhvdHN4eFNlY3VyRmNyT2krOXcrdDl6OFhNN0tu?=
 =?utf-8?B?QzNTTTluNG52M1Ara2lrRHV6UVlnQzNkQS9xYkRqNGZZZVM1SHIwdUlNQjNK?=
 =?utf-8?B?c1JRVTkxeDFWaEZxUXlKeFdzb2R1N1FNZnkzV3FaNEN4R3gwclNuUkc2Q3ZI?=
 =?utf-8?B?dnBBNWFNN3BOOHBDZTdsK0VWTzR1U3RocHlNbGNIQVdOeUJjOTRiVEVTVWUr?=
 =?utf-8?B?d1JXcElEeWtIYUFxdG11RXRpL3BwRmYrVXMycmlYS3ZSaUdzNnN5WmFiVEZV?=
 =?utf-8?B?azd1ZzR5NENTRGNBNDY4R0ZJL0w2T1JUdHhSd0JTL0xQT2ZoOGEvSENSM05I?=
 =?utf-8?B?ZWRMSFFqSmJsN1VPZFM1V3J2eTZ4cDhJMjJqdzBYVW1UQzFZbHFDeUJaWi9u?=
 =?utf-8?B?ZnBPcFM3RysyT2lMVnJRdXArQlR2V3BVZTNaRmNoOERlT2tVbFBIU0RtRFhq?=
 =?utf-8?B?a01RMDNNTnBaVTVuZDcyR1lBcVEyK3p0alpTWE1mT3p5T1BWbENFNDJIQnFs?=
 =?utf-8?B?RFN1dzdUL0FaWlg4ZHdYWEJkbWVYaTBRQWIzNXU4R2J1TFZLTW42dVQ0enlj?=
 =?utf-8?B?Q0lmazRod2s5UW5Pdm9XaUNabVBJZkMzcEJHdDlSS3JnZC9maUxRUGFGU0VD?=
 =?utf-8?B?blR4NUhSRTVYRUJ2b3gvRlFPSnFJQm1QVHc3eVJaMTY2byt0K1FTTnFaMnQw?=
 =?utf-8?B?RXV6RjhaR3lzOFE5MmZTNVV5UGlwenVCRUJ3djhVaXpURVhhdUh3LzgvcmJY?=
 =?utf-8?B?NldYbEJoaTdXZEZwZnJmRWNKK0U4bUJnYUFCdHBCaUtLMktUZUVHVUx3M3pJ?=
 =?utf-8?B?d2tWazFmV09hTjBhVHpSTjZCS0VwaTI1SjNjWDNqYkx2UlFtdU5pY09mM1RM?=
 =?utf-8?B?UllZRVlMUXpmWjJ5d0ptU01mV0gzZ00zcDR1TmdLQmhMY2xYQkxPNGZ1Y09r?=
 =?utf-8?B?RkV0NzBXcXhKK3lvSUdQcGl5OE51ZjM5MWpWMzJWU3NiU2VBMW9JY20rYkRG?=
 =?utf-8?B?cDU2ellHSjZ5NENzdkdNQmdUQ05vd21ReXc0MXBqcEZUNFRjRUhlWlg2Tk9y?=
 =?utf-8?B?cFFKak9lMjF0b3hYUERNQWJZeHFDTnFTMmppaWlTL05ReHJlWkRGcGJwS3ZU?=
 =?utf-8?B?Z2k2Z1p2SkNyUnFCVDgxbFBYL3VxOGk2ZWhvMHdpSHBOUFZBL2hOdC9nR2JJ?=
 =?utf-8?B?TmxMKy9ORnc5VnJMVnJMMG5RU3Rvc3U2RnA2cmtBajRIQkZhLzNMbFpoTElT?=
 =?utf-8?B?RnFMVStWcmNYUkhBamw4MVJtekRsSXV4THhsVWJpTHhxZlR2S1RYSytZbnBX?=
 =?utf-8?B?d0pMckFoOFl0dDNoNzVFVFVmNXFxWkUrRTJ5djEzQ0pNVTZPUDRVTGJmQlJB?=
 =?utf-8?B?cTJYTnIvSkM2aEpKS3lqUlVhNk41RjliUExzQ1FkeUVZOE5IU2UwYzBTTnNP?=
 =?utf-8?B?ZEpxa2pEK213OUNLVFVtUGEvZUNSNG82NVpZMGR6YWloaVhwbWpFck9ISDl0?=
 =?utf-8?B?bVUzK0FKQjVqVFdab2xWYm9wNXBTZU5YZ2xEcFR6SUVyenVPYUFqemozTzVR?=
 =?utf-8?B?d3BlMFdwcWdjWmFXbUcyZlJUYUk1RXNkR0VUZE1sZytSZmN4OE9lRldib082?=
 =?utf-8?B?aTBYbnhzdzE3RDdJSUdzcER1ZnVTcHdjYmwwZ2ZhZEwvc0FHSXlSdmhUdUc5?=
 =?utf-8?B?dW1VM2tLV3RBN3BzN0JySnc1TkkrUW5SSlgzWjR1RmtaWHZLeDVFTWNRbVlC?=
 =?utf-8?Q?oiDkSmXwCQQ7IU1+/ftpRqg=3D?=
Content-ID: <07032E11F474514CA311794CEBF07E08@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e3fb80-ef9e-49aa-5e74-08dc4801ba68
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2024 10:45:43.8820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgzO/vnKto+LAMtftShkgnWa2utXE8WOjEQx/M/jI8ZNNtEtSHzW2oVFVTasIr/cci3CgxiD2Vr+NklogFP1e8pgNnNf9GFgUxBvV8IFyU6q5HQwWMUFOAbWyiHQyXEh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_034607_429338_C2366F44 
X-CRM114-Status: GOOD (  13.97  )
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

Hi,

Kindly ignore this patch. Have made a mistake. I will send a v2. Sorry 
for the noise.

Thanks,
Bala

On 19/03/24 2:06 pm, Balamanikandan Gunasundar wrote:
> Update myself as maintainer for microchip nand and pmecc drivers.
> 
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> ---
>   MAINTAINERS | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 82896c3e0559..46c177aa2b60 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14394,8 +14394,9 @@ F:	Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
>   F:	drivers/media/platform/microchip/microchip-csi2dc.c
>   
>   MICROCHIP ECC DRIVER
> +M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
>   L:	linux-crypto@vger.kernel.org
> -S:	Orphan
> +S:	Supported
>   F:	drivers/crypto/atmel-ecc.*
>   
>   MICROCHIP EIC DRIVER
> @@ -14500,8 +14501,9 @@ S:	Maintained
>   F:	drivers/mmc/host/atmel-mci.c
>   
>   MICROCHIP NAND DRIVER
> +M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
>   L:	linux-mtd@lists.infradead.org
> -S:	Orphan
> +S:	Supported
>   F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
>   F:	drivers/mtd/nand/raw/atmel/*
>   

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
