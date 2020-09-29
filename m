Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A1AC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 13:06:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32B020848
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 13:06:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gAcXplK1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="o3TqEdum";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cyeqYXeO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32B020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LR5Fbf6adbvhYKH6D6PavHEq3N9zX0YIo0SDK6RO1dY=; b=gAcXplK1yeC6Ohr3XLmtXXp+H
	qDLRMHBAPvByyy6Mhy6T6V/GpoHjF+2EdFilEitHgtPpvMC2cMF3ifbVlONYf+RuydPS0jcHhRn5m
	DquJ4a8QesCXfVM600jQJN2l229exFIYES5HpzqNUcWOnnWFpD6vYhnjl9MkZzWVrAjlMtCM1hxHV
	VuOvN3kMP7DnkX22A6D7BTQVs95qrSKFgmqszstRDNC25M1NsNtQRaQefdU1yhDwHXQPuCJgU2GYO
	bNX6dRCYjvo9yUHMjDJ8fjM6CxVfBV/cloVCGG6h+gozXdRw2BzDr53ZQQLcP9gUUn4cdQr2GaNJw
	KftGTtrUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFKm-0003G4-U7; Tue, 29 Sep 2020 13:06:21 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFKg-0003DP-Pe
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 13:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601384774; x=1632920774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WlK/2+GPKSvMcfe/7qJAzWkTg9/8RPkmElDCuJXePrc=;
 b=o3TqEdum+dHvJSpLkfC3Nn9PlbXia35ZANEisMkAc0TQX7Feoe2g/Hp6
 Flrtotp+QcBYsS+q8P4smfuF+DjNgi4IkdGqHmRLZHHeFd2fX5N04AVuJ
 qiWgSGIR140Llvd9YoVlTHUQkAlJg4Q6Af0Jg2+hJDhvblM13FLHKFAAh
 u2VJ3w7ZXzBrW8bX2w5Etj/x9HUqA31K8YnLG/5VkWjb7kjwJ1DcbfIXh
 fOpxkj1tByOP5dyXGT3CT6Yo9M2O+h8mNEfIN0G1x96jjvbtR1auUqxOy
 ffQII01RLffpf4mWffJVEIXjbqznEYL5ehiUhIWub7lHarmIpDgsysBVo w==;
IronPort-SDR: xhxtxwT45RlkqwzT4nmdNU/U4FwuZ08mpoYFD7DSk/fewFNpG7Na2zElRUottmDsIUnQKnJDUA
 fBdOxdGFG6Nq7ogzHX5kt8GPWpsfvCVwP36IsfoqbyjO0EhzUzkn0NxGATy2RTkvC/8ZHxTLPj
 7YNRdNJaboAHrzmEm20rIxtnhTGd6nPnjtTBqlXMTcVpyEE3zBREugbj5uF4b/Y2ReCSo36Fkj
 pkIcN9hILAMwdH7GsDD1SIfor79SiuDfUtxmGWLVZCTiTPIUSpEYgUXAPpWolqHHtCB/FPM9GY
 uys=
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="97579282"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 06:05:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 06:05:06 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 29 Sep 2020 06:05:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBabwzarqNrTpTL0YcBPWfeUOcwSCEBAqBBGR05uUrnrAk3QHvI5xY8DQg/i1asFhs5l/rXlb2uIX1etnx0kEMxOi2PFph9HUge72yjVR9T7t1O7hibwlxAiIzS/3lyuNNPb3ES31zVIsjHrkx8QZNiatkL/+LN0D+eOQrPryE9MwK303hDiAJ+Z4ILxrtjz+IrFii1tDGU5yT/md0ywBX+95SoCie96kJW+NNv1FBnCfhE4cZp1f3XisH3zi5Yc6Jdhddn04Xuk+0XdlZm7SZ/abpYwAOSsKgrZUuGN7fdNQoCNuvvbNCM5NkJJOapBBEMEmrtYtYmaDeVKkDYf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlK/2+GPKSvMcfe/7qJAzWkTg9/8RPkmElDCuJXePrc=;
 b=VkfNlAdJsUXrVAz6T3X1sO/qgqJTLqP5lEWUOSYF2HShw3jMIbRim2CRRjX866wlDMTBzW/f7kXmZE7ZNzZIZhkG8e+FmMjKQ+c5SWo/sf+xvLGXDWZnDb6gz9ULdFmJ9rFGrNzqdQ/gXpNNc5bwpXeHYZsGBho/LjYI0qClvEISWR7TLVPFQbSkfsNTEr/gOowbFh7xoM2cezStMs0V8OKSmJk20RY++prEQNRvxiaPvw1PQjIcbugemqVCeqXRAi9V09AR6DL11PplqbdAq2Ip4pYk8hfALT8NztlQivKUB6jTJXDeayuMmhE3P2ENBQTajEPcf1iexGD8kdfJMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlK/2+GPKSvMcfe/7qJAzWkTg9/8RPkmElDCuJXePrc=;
 b=cyeqYXeOJy0JWtHwZBd5EB+tu287A00t2V2A45kMcpUwyi38uyO7YdkCH/xHoY3yaa35T4YlXyWEXTdPth27X+MRIeGUVXFag3a2gmBnB25CtW/m2PCMtlyatMxywz7lcfm4del1aJBCsuZIWB4NC9fMtYSrJ+4og8pe+4DXINA=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4396.namprd11.prod.outlook.com (2603:10b6:5:203::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.23; Tue, 29 Sep
 2020 13:05:14 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 13:05:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v13 09/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Topic: [PATCH v13 09/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Index: AQHWllNcSEOJ06dulUeHo292BYv/qQ==
Date: Tue, 29 Sep 2020 13:05:14 +0000
Message-ID: <dc0fd8d2-f639-0752-2a4e-8adaaeec5c7a@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-10-p.yadav@ti.com>
 <feb046fd-a9ea-9ea3-55f7-bf823ed1e61f@microchip.com>
 <20200929125131.fmztz4rr2iuj6uof@ti.com>
In-Reply-To: <20200929125131.fmztz4rr2iuj6uof@ti.com>
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
x-ms-office365-filtering-correlation-id: b40686bd-be19-4ba7-2a06-08d864784e4d
x-ms-traffictypediagnostic: DM6PR11MB4396:
x-microsoft-antispam-prvs: <DM6PR11MB43969FE0E80D7C8B199A47B4F0320@DM6PR11MB4396.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vdw8ah9TnjWjy32L+3zZP4Oh/YT435tHKZpmwkMRt/9ydixwIdu5wEhHoMtDUplCh7+XwpmBJakwuh7cy+YE6nstzoffbflUBYLOdnYxHGH/ElP+UQgvnNKnW6YtsemOlJXVkP60Nvkj5Juq+PalzKVBaxvW7QHz+BaDFGjlg/qYScx91dGDZV2dgQ9FBhr2kZE4FYRcIEHZ0VQ9YQ2bHzLuVAdPvl4nV/lnpVgRM6OMzYA2HPZHY0NWjMkctBlZdnsklhhyLCnY4wBEVXXunLJ3v2hnWDAIqPv4QquLqH5eBFW2+l9NrH8OIvw/MDtPhXJe20asQXjSSVWTj6fRmHAWUDyyFKRyJIf8GnphBrqFPmLUvAoo7qINlw/Cy3cJ+bMTNn8eYhvMVP4d8PG+3OPrafeqVAfPYj7Rr55a41sXu9QqFg4nAKopXaM6JRtL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(36756003)(53546011)(6506007)(186003)(8936002)(6512007)(8676002)(26005)(31696002)(86362001)(4326008)(2616005)(2906002)(54906003)(498600001)(31686004)(6916009)(76116006)(6486002)(66446008)(64756008)(66476007)(66946007)(91956017)(66556008)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 5Mv3+6OYWGOjpQI7xmypMOnvP5dEGuZ9UVsmG6gkHCZ3ZXjExaISOZT0zVUXFndhmVwaZI2NBbPsEViNoDKIzJ340kqcLseph6+odzvknSBfc08DFQS8inUHzFjV5EnPa8KWU8tTAzFqPe5uMpV/Bto696EGK1tbJvtl/ZMsUuhkLeIXv/kryEuqbBo/sHpeJiDJByCLPgQwj/mDpS0tHcFMNo6jOEBLP8K4zBW5P9m+qKqM01J7p4wHTB37jOXxUHs8H5CAT8giRbJJbCScPO07FkVfEuK4HBnQzdPuEV7KDo8D5Kb6sciMrR0V5x8TEc9Emlb8W8RfKi73JBlwAvV3FgOCz3U31Kb/YWLYHMibfh4591UBbwiBNrzsZRhEYGvZk9KKZs8HLXrBnIFXftEfldPsEl5GkkJ3LSKDRQE+tE4FeJZFHdvA48GT2f+Vos1vhQ9OYcy/PtzcQpUCWhMtKE87HXiXbmTLGo9Ifo4Slo0KIzKBssUvM8AtnPs6ZCqpx0gvpZN4GsELQqKu6rxJM+DrZqsKxTRRF+ssdUQhU05kwRTlywLkWvcQ5A5u+0xWaw7nm4RtZIdcNBTna7cXJy11uaqhbag+YbDwmGZMiwdrvViP1cDN6Vtm9sLzuKf6ZzVHsX1h4K6Huean/Q==
x-ms-exchange-transport-forked: True
Content-ID: <161DCC45109BBC4589D8EE26101C78CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b40686bd-be19-4ba7-2a06-08d864784e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 13:05:14.3908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZPmAi0X2OzxoaifksquDtTptRzcneU+8uxDrMiRXitVLlsY6NCLz5rmRyNA7j6WBiTU3ClDFWW6RxVFzkIRG0crKuCzoIAHFxBDFYn0yGXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4396
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_090614_990626_1021D2F5 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 9/29/20 3:51 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 29/09/20 11:26AM, Tudor.Ambarus@microchip.com wrote:
>> Hi,
>>
>> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Allow flashes to specify a hook to enable octal DTR mode. Use this hook
>>> whenever possible to get optimal transfer speeds.
>>>
>>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 35 +++++++++++++++++++++++++++++++++++
>>>  drivers/mtd/spi-nor/core.h |  2 ++
>>>  2 files changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 87c568debf14..6ee93544d72f 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -3069,6 +3069,35 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>>         return 0;
>>>  }
>>>
>>> +/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
>>> + * @nor:                 pointer to a 'struct spi_nor'
>>> + * @enable:              whether to enable or disable Octal DTR
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>> +{
>>> +       int ret;
>>> +
>>> +       if (!nor->params->octal_dtr_enable)
>>> +               return 0;
>>> +
>>> +       if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
>>> +             nor->write_proto == SNOR_PROTO_8_8_8_DTR))
>>> +               return 0;
>>> +
>>> +       ret = nor->params->octal_dtr_enable(nor, enable);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       if (enable)
>>> +               nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
>>> +       else
>>> +               nor->reg_proto = SNOR_PROTO_1_1_1;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>  /**
>>>   * spi_nor_quad_enable() - enable/disable Quad I/O if needed.
>>>   * @nor:                pointer to a 'struct spi_nor'
>>> @@ -3109,6 +3138,12 @@ static int spi_nor_init(struct spi_nor *nor)
>>>  {
>>>         int err;
>>>
>>> +       err = spi_nor_octal_dtr_enable(nor, true);
>>> +       if (err) {
>>> +               dev_dbg(nor->dev, "octal mode not supported\n");
>>> +               return err;
>>> +       }
>>> +
>>>         err = spi_nor_quad_enable(nor, true);
>>
>> Is it possible to enable octal dtr and quad at the same time?
>> Maybe an 'if/else if' here depending on the values of nor->read_proto and
>> nor->write_proto
> 
> No it is not. If you look inside spi_nor_octal_dtr_enable() and
> spi_nor_quad_enable(), they both are a no-op if the protocol does not
> match. spi_nor_quad_enable() was already doing it this way so I made
> spi_nor_octal_dtr_enable() follow suit. So this is effectively an
> if-else on the value of nor->read_proto. I don't think an explicit one
> is needed.

you're right! thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
