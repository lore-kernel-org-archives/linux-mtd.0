Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C9BC433EA
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 15:19:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FDCF20709
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 15:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OuXmJqwe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Meff83O/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fMt8p13J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FDCF20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FczLM3VmIoqYgBPledwUWLOvaitGn3+l+hMTawXtVgQ=; b=OuXmJqweYkXNdCFTNvckaEFJo
	YpLWIcTp6g9xvKP4nG5YmzAFJTeF9h/v7wpMXvOf0Vw8KW8UgxTb6uszFlezFolNpfXZwdfRTjNiF
	+XCNqoz3PyEJSOr6t7YIyY6h1gkoCnifXD6s1OKKew1vVLON532u2CJlxRlTY48Teb15fj7ff2gX+
	amQuF6nqxlEicsiVIBiQwZUIKxMhSt8M3OZ2GbtABpLSanC97V9WGAssYUsudkxn7rU6DCv2QEQAg
	wnM8Y2PXsKLMQTNhvemvQ0P4PM7wJF1FGjTQXtaVPULVTePVDa0zS/OWlX34zZsVwCPBbmOvKjW00
	RrcIen8IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGWY-0004tO-6I; Wed, 22 Jul 2020 15:19:14 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGWV-0004sG-6t
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595431151; x=1626967151;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ooqY3uGKQ/zgrFWYr14l/c7bm1A04x+u2YSAEJbXLQA=;
 b=Meff83O//ur2qJS8MHztbc4dMAYJ76CY7EBjP4TDHWcnJ8C/x557lJdc
 af6GftVFMA34HjuHezvI+u/iA7+aI3NnZvfXk/YFXWecwxYI2xAkdR3Lz
 XVRcuzhkuEQtDrxIfQ2RcFFU2sIYJchmZK84apA7wsHxYks3Wst0JRvuc
 Zk1yvM4+ONPA+Y6hV1RZA2nsK2lMgfajwBIYtn99dJ5AESVC7Do4QbIHE
 DG9fEvsW5J7KYicdTYfE0kSkrX+72j6KH/m7+U/VcDeIZEAG6yr3wSZHs
 /3zDPsFNmhi+KmI1t4chxXFHBO8ahKH0+a3GRHI/M6cDlHSRi2JsvnC2K w==;
IronPort-SDR: VqsjRegBCQFsrbN30qox5E2NF99kYPh6bVNox3uvII9TfGWLPdEzW9C0XKLdWH9uAjMSbQ064v
 kA7MI/30FrwCCYIu7PMIHzjASj4ZbrL/i0vKQGw+ykm7Um/4T31aKp4CGRKQO+bptjVh+q14qH
 4eUEYXv071GHgJWu15Ny0GdWRuF5dPRbD/3dHLZ/cw+HPHyvjwkflmtM4+kJE2b73JQysvtGDc
 mPib5Q/0tdq+FcYRS6l7HXUwm3elg6VO3x+ufpFFtyK+K7hkMK0JX681/vnRe16J/aveBnVndu
 pYA=
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="84211138"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jul 2020 08:18:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 22 Jul 2020 08:18:14 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 22 Jul 2020 08:18:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2+U8UAYL5LULdfXfWwo5Svdktic+IFEBI2jkc8FkiNc3cdyjAdSvK72brnZ7MaeO3Dnbw9BSjFgPqWJqEZ8/09qFhAciamtAZTw/zuW3rWcSvIpfdIEaqsht2eZMehdmi+BI1WVOLBUrKg7qDo4FqLFxge9zDAcTrv2cNikDLXOxMs5NQiQ9E0Kv3loep1qYM2bz8+nupEe2BIpJ0xkelMWWzCKY8xsPR4kZ4e2Mf13ZFZGAhqN2Vj1eZbB6JEeRBhJJ45R6zuEWrzkIqbyS0cKG5oQlLWZaYDxEz0woVQf+sAtJfsU+KQ1VYDkzD/CGllUJ7n3MofVXf0sVQe44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooqY3uGKQ/zgrFWYr14l/c7bm1A04x+u2YSAEJbXLQA=;
 b=MhnzProomCwRjTUZVOrEm5oyDDlbOiYx18u91VwcU6ynn1uFFQXWdr0C804qb4GxUNwb4PaxDZ1YE6tncnqMpx/WMywX0Uoo7WRo5aqGLTk09lvR6P2Zj3Jc+ibAMDb3qeOvAVpWRPu4gMC8AiPIKe9b74Ex1a1k2yw07JSIn1mB/8w5cFJZRtFVDAtsTMDBQ98HzE5863Hs+d6lNsTfLcOdQsg7RvuwM+mNhtC25KNwtQ9gREnZjWwt2EIgRdvMrynG9y+fxu0jHqmCIW/ssU44ZsiwdKMzcesdSxcFV4/Y5mdgg9u6+miadra8KbRqzdQJMKXAVYTvXe6Qxh5P2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooqY3uGKQ/zgrFWYr14l/c7bm1A04x+u2YSAEJbXLQA=;
 b=fMt8p13Jmdcwn0I/8aZV2jFdKVHM+K0xNwfenw2BobFlnlBYT1rKbdAp565UXwc6mZlHG9VYVz798FYemLnwc5ckk+zAqLhWQXIlz86XGqjpSNadIgftqzO9Zy1zQ7Rnr4Lvtegs+FAoqhxCkfqe6BCQK4L21uhtyT3ZJahVvK4=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3830.namprd11.prod.outlook.com (2603:10b6:a03:fc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 15:18:51 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181%7]) with mapi id 15.20.3216.022; Wed, 22 Jul 2020
 15:18:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Simulate WRDI command
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Simulate WRDI command
Thread-Index: AQHWYDReSXNx4qFwZkKE6j6AE/Ov3Q==
Date: Wed, 22 Jul 2020 15:18:50 +0000
Message-ID: <99e3f6c7-e9a6-584c-883a-0882f5137b7b@microchip.com>
References: <282e1305-fd08-e446-1a22-eb4dff78cfb4@nokia.com>
 <b5c17892-24ec-a690-96ca-d2238b8925d1@microchip.com>
 <20200722143604.GQ5180@lahna.fi.intel.com>
In-Reply-To: <20200722143604.GQ5180@lahna.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bfc29cb-d35a-4103-0c10-08d82e5289ff
x-ms-traffictypediagnostic: BYAPR11MB3830:
x-microsoft-antispam-prvs: <BYAPR11MB3830138B30E9D67AB6B8D969F0790@BYAPR11MB3830.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DiGoKIeTuv2MCHCpBaA8Uq00GsWLBjXI/6xqvene1ZMSyzS6FKxRwinpk/FQo6M6SnLNp/xgPScS6Mdx52W2GFQwBIiittg5z6y7beTXN2OiDpfy8fGVnX3Jr9DclzmuUV4avb8Op4Vrkp5v2DXD/pQd8nLi0BpTfz+MrrOSDRp7cpXF9aFf6a8BbgIg56ishMLHZLsEE5kWzhuM9SgT6N6IVupJI6eNiUbWoi4HXICHV591xG4guOGj/11FB+cCKlRU5y+ggQ645Qz2wbQNjhesfj+aHI1xiWxlZUX6bImz8+6yuuieIJT2VHXQ67U/WCH/tSU5FjmApJ0AXeb/uIbbUCuqtRvrKxziF7Tcl2nA5gZsTHrhWLJVBpvZRCGj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(4326008)(6512007)(53546011)(31686004)(86362001)(6506007)(6486002)(26005)(478600001)(5660300002)(6916009)(186003)(54906003)(66946007)(2906002)(76116006)(8936002)(91956017)(31696002)(66556008)(66476007)(36756003)(64756008)(66446008)(71200400001)(316002)(8676002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: TBFvLdwd7wvyujqGidNSwtKmADVPbzrsAWgRYNGjv+mIlwlFM7vabhKa3ndztMmDSnchY8m/UhJtOIuELt4OSxDIGu0/4a1d3tBO6nEzZ0KVoNi3haQL+DrBzdMIhRdIpjqkou3ni+7psl99cFmSKGMysyK0STXpx0sy/5E+dTBEfwwfiwxrtg18mHTdDlkulK93fMCRfIEdendglj9rKlWIkIBcji+OZLXp6X1AvduUgtPbSomDesie7nrO04FWkeF/cFkzjBKpnfRs1gi1sgPTxKEJl8lYTYV53LDsB54euNTXhbrw1cw5GksjRhF8sHuE4FN54W0nojrx2ZbD5JatlOsyyQeDINlaK+1s5sfFTEMYAd25ZyXRyZnzOj8bzFEeLA6AyDFGdghF9mG2TqlyXPrZjqoC8DLU5ReAeFCPiNaP9kNnKWLKZ1+J2osvoJiL5gl6A1Jzvr8/5YLYGSYT1QdRo24kzEslkXUgmamNzYFVlu3ad5tgpLWLx/zI
x-ms-exchange-transport-forked: True
Content-ID: <1C58886E6C4FFB4C9BC373984F80B070@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfc29cb-d35a-4103-0c10-08d82e5289ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 15:18:50.9045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hi1YpRg0f0vRMBUhbNzwVyw9CImGlmNSfOBOeGmyrDUaD8ynVLWF3gZWsHtymvkjihhCvHVHZPSBUH3yeaUQjopxHWdeejVzKWLvlChjPSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_111911_506852_6C169183 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: ibr@ilbers.de, linux-mtd@lists.infradead.org, alexander.sverdlin@nokia.com,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/22/20 5:36 PM, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> On Wed, Jul 22, 2020 at 02:28:30PM +0000, Tudor.Ambarus@microchip.com wrote:
>> + Mika
>>
>> Hi, Mika,
>>
>> Would you please review the patch from below?
> 
> Sure, there is minor comment below.
> 
>>
>> Thanks!
>>
>> On 7/22/20 5:01 PM, Alexander Sverdlin wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>>>
>>> After spi_nor_write_disable() return code checks were introduced in the
>>> spi-nor front end intel-spi backend stopped to work because WRDI was never
>>> supported and always failed.
>>>
>>> Just pretend it was sucessful and ignore the command itself. HW sequencer
>>> shall do the right thing automatically, while with SW sequencer we cannot
>>> do it anyway, because the only tool we had was preopcode and it makes no
>>> sense for WRDI.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: bce679e5ae3a ("mtd: spi-nor: Check for errors after each Register Operation")
>>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>>> ---
>>>  drivers/mtd/spi-nor/controllers/intel-spi.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
>>> index 61d2a0a..134b356 100644
>>> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
>>> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
>>> @@ -612,6 +612,14 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
>>>                 return 0;
>>>         }
>>>
>>> +       /*
>>> +        * We hope that HW sequencer will do the right thing automatically and
>>> +        * with the SW seuencer we cannot use preopcode any way, so just ignore
>                            ^^^^^^^^
> Typo, should be sequencer.
> 
> Otherwise looks good to me.
> 

It looks good to me too. Should I add your R-b tag when applying?
I can fix the typo.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
