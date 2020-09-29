Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCBAC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 18:35:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6C62074A
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 18:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dDUhMjAo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RXwMxL66";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZFEOrjIN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6C62074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgXA+Qe7n2cGzCidZvzQpMVcEDHvmBkAYrz9Yay022c=; b=dDUhMjAo1HOvt7BevCOqdF6+X
	qyia1xha8I/hw9ZTodPlS1R1TVqkHheLPgFozRj723iYIzCmCeinAQEwfYa0sJOe5Qis6cq5gHU4G
	DK9+2JeWM1sPlJ7rFNGYhiAngeSoKZDlxBg7PVYVTKTY6fk+zaIbw5Lc/bDLLfMs/bw1kh1DufA0d
	W/UQWIMQB2DP2pLPz9psMjeX+qRGO9lkBOXmpTehOQUJkSxmU+D3824lHKncp0dz1TgA3hKyIL/rz
	AbjYwQAt+GjJ1UyeoYMXMXbYC2OZudThDEunjclRJlh5zs8ZbRj2cURmZ9fMlXGr0sO9afimBknKE
	I5pyh1XYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNKSu-00054W-9f; Tue, 29 Sep 2020 18:35:04 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNKSp-00052n-Au; Tue, 29 Sep 2020 18:35:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601404500; x=1632940500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UGkMVf664zrLR9iFUz4G3kQ2Emh/TkSyP14QzOeZeL0=;
 b=RXwMxL66n9zvjKXBnKWJ5NKGjK+HP6BjDW9wrO3exkagkX2/fTAk5rBH
 AXXy4Z280vraQyYmtZ7XnkrC2Sv3in+cD85UWK+h102Cy1IyqptntVoPY
 JaiBhkvG7cu2yL4lTK3CcObiE3af8yUI8TG8+EjRdwd9N9pvnNfL2tsqZ
 oSGbWCaJI7jm77RhjkWJ8XheGJkuobtH/ijZAY6wZWbz/A/SGmcHwqgSX
 Fgw+mWM8aYbRY5Wz8S/IQ5salJW+iV8ycz2zB9Z7lFhtyYGCy1/QymsJI
 tVFkFTesk6uz2wW21HKrhYIgkrZacccpQSIj/INwNkDUNdzagFpA7tIam w==;
IronPort-SDR: gAIVvBWUnEqy+fmO8tPBxgvKz6axVOhAI4KeFRCty+2dTXKBQJ4BjORaSb3Z2hgZQIfJZesdD2
 rZ2LYnqLX8h0Yj58HrPn6daM7/Z35KZX5Rn9VdubnFMrLFY8dUX6G4uRbid0ILUXmySWMlrg51
 kr7nkEJslbcxDpYlvlKTqqb+asqE34+Gi8yhT54lYBnGUe+RIdOcqJlD2fSwSUJ9wfDxWEU3EC
 IwTNv6ndMuFpL0B8MGySOelWPrGC1CgWNsFnhAd8VmrDD+dcSJoWaeYos05PXSP99npuvPL6yy
 ks8=
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="92836405"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 11:34:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 11:34:56 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 29 Sep 2020 11:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULRXLvj2QjB7nEs4EGYcmv8p+wJTDgXXx8u9ev4O5f3w31+L30RlJPpDuKMhT7KXS5mJhHNBcISRYIuS7HNGejvyJZT56SG7PXrYOnFHdUfFj37zya+zhQggkQlmkENqVXpr29AfC0x0znKAGI+YnBHy1Evj4lbyHKN4mRkAW1GiwYe4XFJ1vjMvgNZvgT8AygabK2t/hJDx8LUYmlMB/cq7BNLZsf9W9bP02JWMCwaYgJW9B2iyr73dzpKjCz46SBprb6ocddmMrT3EY1fvI7MtIG1ipbIsVl4TxTT2T8UrYe9iVHg1eO1GKPNxO2s9o6CaoGG0QnqNacV3JmQCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGkMVf664zrLR9iFUz4G3kQ2Emh/TkSyP14QzOeZeL0=;
 b=ih0bqCOgpgg7Q73SsARznACDC2iPIBLgN9OnKVYkKpNAKfXkmodEt1r6+lRIbg/W5eYG7T7uqepsmaH81sAAfi5nwloZm4uU/SxV5dQ8YYIMcNptLSvWPGKZumbjpnq/sG22Ax4B8awbxqgjRHxi5mbtsaoK6dfXgb1PT1SAstBJp2I53oEpMy+3kMRP1eSk0LduMqlDNNp0wTyVco7jR7/DOSzKZfLH4FHYSQFlNlWE8scje22MSwZtfbAlm21B+NhVkrP60qu+IjkD0vC0WINrzMRlO1DWMfA6gmY/m8FoPYqCzzrTaBk94BJsdyWtHHF0LMSY2TZdpC29EleZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGkMVf664zrLR9iFUz4G3kQ2Emh/TkSyP14QzOeZeL0=;
 b=ZFEOrjINsm6yIQfBS7bCP83w/+ueMJH3shKhoVFHjfh5n7Y8GyjDyVpguROl2/FCFAve+wsJwlygAh5hDTYC1A+//6ciVIen2gNUJJKHg/u7jIRS2/6BA0+qLNow9Y2bdO4Va9vaxrXerbTUPNZKdiVryh5x9YzMeLGYEm+hHoI=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 29 Sep
 2020 18:34:52 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 18:34:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v10 05/17] mtd: spi-nor: add support for DTR protocol
Thread-Topic: [PATCH v10 05/17] mtd: spi-nor: add support for DTR protocol
Thread-Index: AQHWVIVGo10ftuQ9H0mpaQ4YA8PU1w==
Date: Tue, 29 Sep 2020 18:34:52 +0000
Message-ID: <184f757b-dadc-0fd9-67f2-4c5903ec9c5c@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-6-p.yadav@ti.com>
 <fbb3d7e7-75ed-dbf6-a975-2ae871bc9fbf@microchip.com>
 <20200721112951.rngfk7njubcsahzp@yadavpratyush.com>
 <f9a22bc5-35f6-9507-b0e7-dcbad51caea7@microchip.com>
 <20200929162943.qbnzmzgxb75wdpyo@ti.com>
In-Reply-To: <20200929162943.qbnzmzgxb75wdpyo@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [82.77.80.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1ce27db-24b7-49c7-1817-08d864a65af1
x-ms-traffictypediagnostic: DM5PR11MB1914:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB191487AA9494804759AAEEFBF0320@DM5PR11MB1914.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XpZV9oFdt+qxQee67T9xxEHDWU5F+QPdWweMI7xo8a0dtCAzvCCLqzBrXfn45unqukOwjpFAJnBp0jd5vsl558z+EKN3252A5yCIz/lakvvanwX5oK7GaKGVTXNsVGakIH5bBGG0Ak5dq7p8RKi+d3iEH28CuiTRiBjDBTkW4IAAShwDKJ8Jm5H1i3DhJ9rpiEW5YB+D5Ouc//k1VvDuj2RpFLUCBSEUH1QT5wuW5Iu1SBYbP67EAm48GoXAYEqIG1viSM+SnlrO0R7+aUERefYD9CdxJobVfnOiTQILMEbeAxk5mZ8Lp4vlkTFt9lomSzmZJsrpKvalXiJm4BKlJjvi2rRM0/BInGvIrQUWyre7kKd+nyUv3hhq6Tw9NkHoxzeUTej8tWBBU1VrNm20aNFPLBlnAFgrY1iCKrVsWk8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(396003)(376002)(136003)(31686004)(86362001)(478600001)(26005)(6916009)(186003)(31696002)(7416002)(66946007)(316002)(54906003)(4326008)(83380400001)(66446008)(66476007)(66556008)(64756008)(8676002)(2616005)(8936002)(6486002)(36756003)(91956017)(76116006)(5660300002)(2906002)(6512007)(6506007)(53546011)(71200400001)(43740500002)(352734003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IXfOl62T3cw+HPKB0rUTI+hoTrAWmFmc7IpBsGU5+vZwFLUc9cQqYqcGA6wB9Gny9zGkO+w0ukB8qSEXBEcTA3jf/Rb82caNnpo7mnCO2Io8Tqlbda74okBe+HpkP7Ju1JCcITYW2X4eOEb2urRJAGWtDZIlcj/zcQj3ksPzKZDKsLgAlnHbXKkFaBQ4Po8OpB6FLJtsHMuCrNqxyVEWCDr99QtWaqUzo0gfKYwy6SL/AQzurO0Jwr7YlCV8vFwiUkkFIxN9zjBvCJUe8jaEoB1OJNWxH8Uyo5wJyR6PSgIBP0v6Wo0WzIV1fVrg9B1XeBGZKduSLnz6oQobl3H+ViprWsYdeM8sc8WEo4wdAb6GEAxEJQaQ1B/tXL9L2sWEbO4kNoChkLWYVjbunIbtpVYgvjzA/3TzlFkTDhQUumMVZOdYl1fIkXIADcnLY7/1vHwMkiHxd1TSS5GDhqZeXjgi05jv7+HqPxfbBqNcU3/Eb2O8tr13G3tUYB32WRLMIUye2Q2tarnvFgnxb5d47az6emx6fHJEvV3Gm+iE7H2mMtbSJcTeHaiaRUFs3eimwSaiTBvI859ZrgS6RlGzSBEFDXSO6OvubkKolS2fySSU2qLcYgzCkjHSGaAtJYV4Q2hfJAFClMHJbQ2zWt/zNQ==
Content-ID: <4DA2A9213EBB004492088D5506B3737A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ce27db-24b7-49c7-1817-08d864a65af1
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 18:34:52.4154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6ayO7/Vk+p9Si3TeRSka2L5z++hHupR8pCWDU7nno2hfgcW3nI2ebg27gdIwX294EJrEXdMIv9kFSFnpmhIj2RFUXfMMf+sn2w77lAF1uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_143459_956781_D569AE5D 
X-CRM114-Status: GOOD (  29.63  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 me@yadavpratyush.com, nsekhar@ti.com, Nicolas.Ferre@microchip.com,
 boris.brezillon@collabora.com, michal.simek@xilinx.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/29/20 7:29 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 29/09/20 03:42PM, Tudor.Ambarus@microchip.com wrote:
>> Hi, Pratyush,
>>
>> I'm replying to v10 so that we continue the discussion, but this applies to v13 as well.
>>
>> On 7/21/20 2:29 PM, Pratyush Yadav wrote:
>>
>>>>> @@ -2368,12 +2517,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>>>>>         struct spi_nor_flash_parameter *params = nor->params;
>>>>>         unsigned int cap;
>>>>>
>>>>> -       /* DTR modes are not supported yet, mask them all. */
>>>>> -       *hwcaps &= ~SNOR_HWCAPS_DTR;
>>>>> -
>>>>>         /* X-X-X modes are not supported yet, mask them all. */
>>>>>         *hwcaps &= ~SNOR_HWCAPS_X_X_X;
>>>>>
>>>>> +       /*
>>>>> +        * If the reset line is broken, we do not want to enter a stateful
>>>>> +        * mode.
>>>>> +        */
>>>>> +       if (nor->flags & SNOR_F_BROKEN_RESET)
>>>>> +               *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
>>>>
>>>> A dedicated reset line is not enough for flashes that keep their state
>>>> in non-volatile bits. Since we can't protect from unexpected crashes in
>>>> the non volatile state case, we should enter these modes only with an
>>>> explicit request, i.e. an optional DT property: "update-nonvolatile-state",
>>>> or something similar.
>>>
>>> I wrote this patch with the assumption that we won't be supporting> non-volatile configuration as of now. In the previous discussions we
>>
>> I think we have to take care of the stateful flashes now, otherwise we'll risk
>> to end up with users that let their flashes in a mode from which they can't recover.
>> I made some small RFC patches in reply to your v13, let me know what you think.
> 
> I haven't gone through them yet. Will check tomorrow.
> 
>>> came to the conclusion that it is not easy to detect the flash if it
>>> boots in any mode other than 1S-1S-1S [0]. So if we update non-volatile
>>> state, the flash would be useless after a reboot because we won't be
>>> able to detect it in 8D mode. It doesn't matter if the reset line is
>>> connected or not because it will reset the flash to the non-volatile
>>> state, and we can't detect it from the non-volatile state.
>>
>> correct, so a reset line for stateful modes doesn't help and the comment from the
>> code should be updated. s/stateful/stateless
> 
> We are talking about two different kinds of "state" here. The state you

Right, I used 'stateful' for flashes that enter in a X-X-X mode by setting a
non-volatile bit and 'stateless' for those that enter in a X-X-X mode
via volatile bits.

> are talking about is the persistent state of the flash configured via
> non-volatile registers. Yes, a reset line doesn't help in that case at
> all.
> > The other state is the non-persistent state we set on the flash. Using
> 1S-1S-8D mode is stateless in the sense that we didn't change any state
> on the flash to be able to use this mode, and only had to use the
> correct opcode. If we execute a 1S-1S-1S command next it will also work
> because the flash is still interpreting opcodes in 1S mode. Using
> 8D-8D-8D or 4S-4S-4S mode is stateful because we did have to configure
> some state on the flash (which can very well be volatile). Once 8D-8D-8D
> or 4S-4S-4S mode is entered, we cannot execute 1S-1S-1S commands until
> we reset the flash because now the flash is interpreting commands in 4S
> or 8D mode. This means we introduced some state on the flash.
> 
> Having a reset line will not help against the former but will help
> against the latter. If the flash is in a stateful mode like 8D-8D-8D
> without a reset line, an unexpected reset could leave bootloader unable
> to boot because it issues the commands in 1S-1S-1S mode that the flash
> cannot interpret. So even if the state we set is volatile, we still want
> to avoid doing it if there is no reset line.
> 
> So I think the code and comment should stay as they are.

Ok. Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
