Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBE8C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:45:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB8960238
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAB8960238
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jQv+jUZwrkMbNvlIA3FDDnMcahsqnQrZ7exu7VMWI/w=; b=iWbki8wLr1AwPdneVYP18OwpQ
	4Z5ztPbz8FId5f4VdQL2PzJvfXhDWLxk+k7ZrQYxuKPx86zy5NM/K8DS0gdQTQx0i2zJZG3UKD0NZ
	brai9rqYNrAvPBBDw/3zaBRhpeyJ2JNcYxYnSRoHwqT4LOHf7laydmJnSCjtki3m/SJuWEU49DzBx
	oJ5x2928LMHKVpX/W4Fic4CzcUGaqmFM49QxdQ4RU5o+K191k2dIb4oUQHpnaWbtCxnk1EdbCgF/d
	Z80QDLrup3E6iPjYixl/FpF4+iIPuxDfREXONIykPKa809zx4fi7M1zOQXlNJCfdnZgQrjE3srgq+
	1Jz9e+p8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLiq6-00FH2V-IJ; Mon, 15 Mar 2021 08:44:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLio6-00FGVt-ME
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 08:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615797754; x=1647333754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PSMzeZhkBdqizMeXtIRXZ5f+Yr581cQES3Ds0Ug+YIA=;
 b=wlD8bT2pHa3CPNWNcoKodW8p6rcZ96t4SCnxUoAhvTYmUzUeEZ8w/pGX
 JMb+qDgwz0aSJa42ape2MyMiW26zXlX3qnfMQjWNzbLi7NRIfyP0zNFc/
 j4UVuKoxAcbQJoUHLTfiLE5E4V1SSNnLtdfnMymNiB4fHWd5pzJEbvzD5
 LxV4QHpnuxnFZ5G5KWYTMjBM/sL//OiBVpqX4KxxGKqF/5fwi2D/QyZIa
 9/rFDCUFHPYEeQDZ3//QuAfoEo6DcPVcs8zLoG5/kXBgDJHUCjwX1TDKl
 lZQ/Yfm5ALsgTtrlITvbnuoeeKzQ5ZbFYPbvGgevAu8Tv8eZ+LXs9RT69 A==;
IronPort-SDR: KRxJ+vHUyrERbRLoY5w7AvUlFD6OMJE26oj71c2HWNxZ1rLdh0I3w1rIlLUDHOlPtPf9PsLLgW
 C9FZxGZY/E5WXffkBrSHbc1xNccF7utyyhep3qEkaP9IeM4odH7ouCZlvs2Zr/ZW/VOhV/KP2X
 yuR60YbOzNyrv3HrbzejQRi+DZT4fCJ6/zYFxYGiBDVuZdSUxEJT0bMRXHmWHT12AcbgNcehtj
 WarSFX+vBiDh0LzfGWO5vPsbq7Q9vMWxC1qiy9+nW4x66sT8Rcv9gl17kkmtUBa+LhfYeWZhHj
 Y44=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="47525297"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 01:42:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 01:42:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 01:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMe31YANUYXgk4Do9ZbKZznPrwuaYLmEJL2fHdaRTjsQlYFvP2t15U4r+CgkmYTok8R88z2DSQQqBg4noRyrAgNUl+wHSawgT4OWAvhgHuPOn3xF+cI/RHt9EUV7qRjzvb+bMMm3A4rW6dtGoeR2xJV/qTXzsyImBWeKtHj5CNfK/RgA+hNBSt+fSfO8lxZ3LBfjzfOFDsQVMnj60bjoWBsJxHszIXSawoPCgSkgIOqgAqHKJ1xng2YWCK5PApmf01oc3zN83opb0EeUQEuDcCBGJ+OhNwHmz0yc8qdMYzqXfC/9KfDrY04FNZYD2i7ZoSSwR9+lJVDnhZHEOQrV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSMzeZhkBdqizMeXtIRXZ5f+Yr581cQES3Ds0Ug+YIA=;
 b=W23PDkHzhyPBaBvLaGkng2/AcUc4qxovYPMwywbjHVhR5HJrP/SXepENtBD95sKBff8BtHoy/D7pKkIDOu3OYmSGoW2GALgYikqAjZ5/ZRGF4QIZ0asB4LxfalY0eDc+Emt5DHt+Sw5473LG0zD7qDOyE+990dmjtaFzsCpwTNH0LJdtdfVQoVsVIfXmeoWqbAkt3y721BrQQkez/OReo04t3OVWaRn7bEAdVALbTQsVKJX9BsX6ieFzpc0/KshSz1MepulhJNPnXsa1iips3Wn0QDrUL7JjlYbTTTaXIeFTdkHTqK/HNhq+WeMHVPJaCL1srXc2SXxxKNKZA1tLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSMzeZhkBdqizMeXtIRXZ5f+Yr581cQES3Ds0Ug+YIA=;
 b=SpUDC9DSpeYpuFyViUVhnyazQDuyyvfmZh+vG8JRHQlULwSOzcMMmEGn/FZnar4QZQvGMWn9U/W7Bf+Dc499jxlXLA8BrEG/CkF4a39rEM2KiEmw1OSQCbpIZsqDUKWYJkKtiq+hLftbBuEWzI2z8qHI6IQtcu6ulrI3EXsBe18=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3245.namprd11.prod.outlook.com (2603:10b6:805:be::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 08:42:30 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 08:42:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v4 4/4] mtd: spi-nor: implement OTP erase for Winbond and
 similar flashes
Thread-Topic: [PATCH v4 4/4] mtd: spi-nor: implement OTP erase for Winbond and
 similar flashes
Thread-Index: AQHXGXci34BddsMS80unOz7XQJyzCg==
Date: Mon, 15 Mar 2021 08:42:30 +0000
Message-ID: <37327381-00a9-b400-ef1f-317bb3d299de@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-5-michael@walle.cc>
In-Reply-To: <20210306000535.9890-5-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 836c101f-ef11-4ba3-96da-08d8e78e4519
x-ms-traffictypediagnostic: SN6PR11MB3245:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3245AA9B6F16523636FF1A8EF06C9@SN6PR11MB3245.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zz3EOOrlfTPJ0XRc5vCDZCEOazMO+M7iFUfJAE7WuoyufC3Jf3QLOrd85d1yk7hscamZJSF/ZuuFRa2J0Q6nVL+rXOy3r0bSht1MI91BbMvvfleoSA9FqJ5IvF0XEb/vvrLsncRO/VJwz3tQDMnuONRv4otAQOhO68eWox8Ee7rQ/Zhbx0bzXQYWJMqCBTXTS+WonahSqAAJmzfZJpJCh/E5TVNXBx+Qt3HAi+b2Zh01VCfbXIro5hsOhK3Br7LPPAZWWoUiYF/SGWmD1Q/YQjoXiBsDkFOWx8E4MH3+KjkjYn0mfCrPhuRLW7T59D7P6dgLCOrl4LMVRrfthRGs8pnErOXOWVHHjfa6SmhgnL/11AJjVMJiJZ+jqpSu9HbCMmE5YfnazOcNZ+aHeFyjZn7colll5YXQlLz4aleZ4vilm8GpE/qbIxykv0EyGMw7BLN1Eq92NRCMJMvjweZ/qVK8TXkDI/ZbacGWB6zQXKiVK/qmdxy0RHLvtCrLVM5U6ByUAQKh14/72c2Kq25B6jiLwKnaOFUv/++hFn+2xC8SXOfRh5HSAzpC3SW7NBgWXk6WMmmts+58PSoX9fvcOEIEaToSZH9ZINIpRXK5Wy/5PF/xVh47nHeZXKd6kv9ugRbZiP8Y7Uxq+E9IlOACfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(366004)(346002)(396003)(6486002)(53546011)(8676002)(76116006)(64756008)(26005)(110136005)(316002)(8936002)(186003)(2616005)(6506007)(66476007)(5660300002)(36756003)(66446008)(478600001)(2906002)(54906003)(71200400001)(31686004)(4326008)(86362001)(31696002)(83380400001)(66946007)(91956017)(66556008)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VkhDaEQwZXgzanE4cU4rM0FFVWdjcEpBNWdyQTRDcHBZbmhmUTg3bS9sNVAx?=
 =?utf-8?B?VmdiUi8vNU5rMGt5UGI4bit3ZXNUL1ErVEJlVFFNQkpBL2xOdElkdjZkNTlG?=
 =?utf-8?B?cmNtOVZtdWh2TzJvc3IyWit5U1dsYnVXV3ZFM1JRUDQ3WnZHUnpmeEtVZ3Za?=
 =?utf-8?B?MHRJSysxWmE2VXhmbG9WQytvVmhndWFSRXd5bEk5MDRMVlBuWCtYVVF0S1FV?=
 =?utf-8?B?V0RlOXhQMFlmSXEreWZGalF5NzdhMGR2bW9zb1NsaEZkeFJvUnFRSWh3blFJ?=
 =?utf-8?B?S3ZTK1lEZTdTU1RRWDhtRDNWVXRZbWpkV0FJRzZRcUhsUEZ3RXNPa3ZtUml3?=
 =?utf-8?B?ZStOU1M3dWNkS1BEcDBJWmw5Z2JKTm9VTFBPU3BaSFpWNW9YZzhCSkpmaytE?=
 =?utf-8?B?NjNxbDVYUXFTUzlpc2JIclBoYlJtQ1JVWUU2N2RuKzdEaGJqZ3VrN1prTVo0?=
 =?utf-8?B?a0pSazVCM3dBV1RqU1FYaC9RWlpqcE8yRGRHVUdQaTE4UXY3dlZxZ2ZaQ3Bp?=
 =?utf-8?B?b3JiVWt4UG5Dd2s3WUhPa2JSMVZYYlA1ZkR5VExra00yY1k3aVRYdFJUQ0sv?=
 =?utf-8?B?c0xKdGxhRG56dUZXdWpmTzRpYlEzRjI3N1B2L0xTZEwwT01zT3YrV0psOHZz?=
 =?utf-8?B?aEpLU1Vtdy9Sby9QamlrbXhhN0ttQVIxUE41U1JpRDJURS9tWVlYQ2xibkpR?=
 =?utf-8?B?SzJrcXdxRUhTZnBVR3B2TkJaSUtVUXgrdndPbU1FbjJaLzlZc2lJcWtiN2ly?=
 =?utf-8?B?T2Q2U3VsYUlHajBCRmNvazNmUlA5d2JPOWxTK3FoOFhBZDYzQlRjdkFRYnhY?=
 =?utf-8?B?a21oeHQ1NUs2b2tFSzFucXBBT3dmVURmRmxiOTl1MzR0d085QTBWRVEyS2xz?=
 =?utf-8?B?RnVzOGZzZlZTWldlUWlFa3VsU211dEJydm9oejgxcGZTL2JPRlNmMWtoa0Ur?=
 =?utf-8?B?VjRnRDVobWhnSVVjQmZ1NGg0bC81SFYwemhuRE9iM0FYL0xUOUM4bmF1YTFz?=
 =?utf-8?B?bzdMd1gvRkVreDYxd2w2em9PbDE5R0pzQlJ3OTh2Y01DRE9vUjVhRSs5WldP?=
 =?utf-8?B?VG82RHFTc3R0SytJYk16dXFSUHphRWlOWldiQmxFL3g1OEZucXZDeU90dzBI?=
 =?utf-8?B?S3h6ZGFiSHlKejhmYXp3UHYwZmNXVjNwM01GZ3lVSjRLZDdYd2xHV2U3LzlO?=
 =?utf-8?B?VzZOM09uSkR3MHNJTFFTODRZRWVKcW1tSEhKQ1J2eE9VV2VycjJtSllpNllP?=
 =?utf-8?B?TUgxU2ZRTDR6ajFGWVhUY1VkanFIZnBtc0V5OHZreW5uMHFVN0NvR1NxREIz?=
 =?utf-8?B?TWcxZm5Yamt3TTJuWjlJZFJ2NUVHdnJCQ25HR1AxM2xBdXBEaUhaK0E4VWlp?=
 =?utf-8?B?eFNJZVB3b0wyK0VuNFcwVGZaZXRQVkdoeG0zQXEwYWFEaTMxSTRaemZFY3Bj?=
 =?utf-8?B?dlFzQUFHRVVNbmxlWjF4SStaL213NEVkQ1d5dGNpRHpZcHJnODRKWXZpYmcx?=
 =?utf-8?B?NFFaOUFScWc0YU5PRGFsUUFEZmpMVVRCanJaazg3TTJ1NEcwRXlRallvajlO?=
 =?utf-8?B?Z3NBb1RVRC9EK0s4VTh0MFVyc3gvUUxWMndldEpuR0Mxcm1sU3QvZFdMcjM3?=
 =?utf-8?B?THZWY05CemVOM1VlM0ZpT1Y2QS8yS2o2SVBNSnNYKytocTQ5N0wxMk9YazZx?=
 =?utf-8?B?UkpPcCtUVkZmckhIOUcvRW1Wb1NVWFNIMTdZMncrSldXSm9TcEQ0QWUybnNy?=
 =?utf-8?Q?l/mLW/7wBYxvKVxmwA=3D?=
Content-ID: <3B88E906DC8130449CC68FF7CA689420@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836c101f-ef11-4ba3-96da-08d8e78e4519
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 08:42:30.2417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qdfvy+iwwKJjMN7hgUPhi7M+/na6Y0muLU5feEiE0bW/UsoEAyX1uyogQVoueDQctNS5Uxx9j208S5UfsoQkOpB4NBPsdI6bY/8JDP6U18M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_084236_845474_2368F266 
X-CRM114-Status: GOOD (  23.11  )
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

On 3/6/21 2:05 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Winbond flashes with OTP support provide a command to erase the OTP
> data. This might come in handy during development.
> 
> This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
> NXP FSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

I skimmed through this, seems ok. Send 4/4 with the new ioctl addition
in a dedicated patch set, ideally both will go through the spi-nor/next
branch. For the new ioctl we'll need ACKs from all the mtd maintainers
and at least a Tested-by tag. Please send the mtd-utils changes too.

Cheers,
ta
> ---
>  drivers/mtd/spi-nor/core.c    |  4 +-
>  drivers/mtd/spi-nor/core.h    |  4 ++
>  drivers/mtd/spi-nor/otp.c     | 74 ++++++++++++++++++++++++++++++++++-
>  drivers/mtd/spi-nor/winbond.c |  1 +
>  4 files changed, 79 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ef7df26896f1..21a737804576 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -166,8 +166,8 @@ static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
>         return nor->controller_ops->read_reg(nor, opcode, buf, len);
>  }
> 
> -static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> -                                           const u8 *buf, size_t len)
> +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> +                                    const u8 *buf, size_t len)
>  {
>         if (spi_nor_protocol_is_dtr(nor->reg_proto))
>                 return -EOPNOTSUPP;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index dfbf6ba42b57..ef62ec4625a1 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -213,6 +213,7 @@ struct spi_nor_otp_ops {
>         int (*read)(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
>         int (*write)(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
>         int (*lock)(struct spi_nor *nor, unsigned int region);
> +       int (*erase)(struct spi_nor *nor, loff_t addr);
>         int (*is_locked)(struct spi_nor *nor, unsigned int region);
>  };
> 
> @@ -481,6 +482,8 @@ extern const struct spi_nor_manufacturer spi_nor_xmc;
>  void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>                              struct spi_mem_op *op,
>                              const enum spi_nor_protocol proto);
> +int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
> +                                    const u8 *buf, size_t len);
>  int spi_nor_write_enable(struct spi_nor *nor);
>  int spi_nor_write_disable(struct spi_nor *nor);
>  int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
> @@ -506,6 +509,7 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
> 
>  int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
>  int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
> +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr);
>  int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
>  int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 4e8da9108c77..78ec79368c29 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -8,6 +8,7 @@
>  #include <linux/log2.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/spi-nor.h>
> +#include <linux/spi/spi-mem.h>
> 
>  #include "core.h"
> 
> @@ -111,6 +112,50 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf
>         return ret ?: written;
>  }
> 
> +/**
> + * spi_nor_otp_erase_secr() - erase one OTP region
> + * @nor:        pointer to 'struct spi_nor'
> + * @to:         offset to write to
> + * @len:        number of bytes to write
> + * @buf:        pointer to src buffer
> + *
> + * Erase one OTP region by using the SPINOR_OP_ESECR commands. This method is
> + * used on GigaDevice and Winbond flashes.
> + *
> + * Return: 0 on success, -errno otherwise
> + */
> +int spi_nor_otp_erase_secr(struct spi_nor *nor, loff_t addr)
> +{
> +       int ret;
> +
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->spimem) {
> +               struct spi_mem_op op =
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_ESECR, 0),
> +                                  SPI_MEM_OP_ADDR(3, addr, 0),
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_NO_DATA);
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +
> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +       } else {
> +               nor->bouncebuf[2] = addr & 0xff;
> +               nor->bouncebuf[1] = (addr >> 8) & 0xff;
> +               nor->bouncebuf[0] = (addr >> 16) & 0xff;
> +
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_ESECR,
> +                                                      nor->bouncebuf, 3);
> +       }
> +       if (ret)
> +               return ret;
> +
> +       return spi_nor_wait_till_ready(nor);
> +}
> +
>  static int spi_nor_otp_lock_bit_cr(unsigned int region)
>  {
>         static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
> @@ -319,11 +364,13 @@ static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
>         return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
>  }
> 
> -static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
> +static int spi_nor_mtd_otp_lock_erase(struct mtd_info *mtd, loff_t from,
> +                                     size_t len, bool is_erase)
>  {
>         struct spi_nor *nor = mtd_to_spi_nor(mtd);
>         const struct spi_nor_otp_ops *ops = spi_nor_otp_ops(nor);
>         unsigned int region;
> +       loff_t start;
>         int ret;
> 
>         if (from < 0 || (from + len) > spi_nor_otp_size(nor))
> @@ -342,7 +389,12 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
> 
>         while (len) {
>                 region = spi_nor_otp_offset_to_region(nor, from);
> -               ret = ops->lock(nor, region);
> +               start = spi_nor_otp_region_start(nor, region);
> +
> +               if (is_erase)
> +                       ret = ops->erase(nor, start);
> +               else
> +                       ret = ops->lock(nor, region);
>                 if (ret)
>                         goto out;
> 
> @@ -356,6 +408,23 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
>         return ret;
>  }
> 
> +static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +       return spi_nor_mtd_otp_lock_erase(mtd, from, len, false);
> +}
> +
> +static int spi_nor_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +       const struct spi_nor_otp_ops *ops = spi_nor_otp_ops(nor);
> +
> +       /* OTP erase is optional */
> +       if (!ops->erase)
> +               return -EOPNOTSUPP;
> +
> +       return spi_nor_mtd_otp_lock_erase(mtd, from, len, true);
> +}
> +
>  void spi_nor_otp_init(struct spi_nor *nor)
>  {
>         struct mtd_info *mtd = &nor->mtd;
> @@ -379,4 +448,5 @@ void spi_nor_otp_init(struct spi_nor *nor)
>         mtd->_read_user_prot_reg = spi_nor_mtd_otp_read;
>         mtd->_write_user_prot_reg = spi_nor_mtd_otp_write;
>         mtd->_lock_user_prot_reg = spi_nor_mtd_otp_lock;
> +       mtd->_erase_user_prot_reg = spi_nor_mtd_otp_erase;
>  }
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 9a3f8ff007fd..e04219ac11fd 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -138,6 +138,7 @@ static int winbond_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  static const struct spi_nor_otp_ops winbond_otp_ops = {
>         .read = spi_nor_otp_read_secr,
>         .write = spi_nor_otp_write_secr,
> +       .erase = spi_nor_otp_erase_secr,
>         .lock = spi_nor_otp_lock_sr2,
>         .is_locked = spi_nor_otp_is_locked_sr2,
>  };
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
