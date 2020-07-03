Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C966C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 11:53:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B5A206B6
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 11:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="el9t8nFv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xcUPxP2v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="vzR34xyI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B5A206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jXe6QUkASyR/u2vlxxRazeTLR64y3MfbMlg8AZl/Tfo=; b=el9t8nFvYWt9Iziy9ublXlrmF
	iG2N9Hru6DDmfexYFm+pVWt91QXvKRySz963u2gGTgZ60BXnOFdUv7Yb+IPweVvWN6PQ3/xBSLW4s
	WtCxRaaLF9KLKNEhFiAqCZKzIqKkko7uALt3eiiXyzK+VZqUPO6LRWeiJpoRzsa2ftRASY9BEbus2
	1bE9bsjt5dT4+S6Dc9zFpAbSo3p9GZnfQroX3CcvE6PikpanWiXAL4Nv2KDMXPNiRkjjOa7jUPU3l
	GvT9FLt8GiUPw6P+sWhRPmSS03oe5dV473cpBX6bLbGp3AtFsgmbqggfeAa87x3JSJvNJ9e3BVasP
	J9sq6qnsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrKEs-0007vD-NS; Fri, 03 Jul 2020 11:52:18 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrKEq-0007ue-3B
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 11:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593777136; x=1625313136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jJjF2pZfVy7mDUYMG2vsDaCkOP798OCQGl6rigGkFvU=;
 b=xcUPxP2vqbZ1/x3tfBseBN0QqXzXpvDJXeA5FPkV/TkbgVQtXwBdHE1X
 DCeZZeZneknZd4xWp2ItMPwz22Ffd+cq34NEbPf2bKpGJE6l6o0cZ38DI
 0UXojv4JjYW6uwMHgZKXeOg8Eo6znyAr575gB2MPpV4mIKGXr7LxyeoEq
 uG790CycLbabrgnY5cdLUx5Q77UWcnS0I9Za4iZHGIu5dOYC2XEh9GMvE
 6gYnr4FVm5twPNQff958V3goFVvEpcaSmGjJ1iR/q0XyKZVIRAQtbYInA
 dFlFMxj9vUY01FHy53FO2FRl1bl/Jg6pSCG5OMoEBKVwgbDEoNOrbpDKa Q==;
IronPort-SDR: TT1Gsnk+IS1n8Vty80+4Y1qXcCer7VTXTWhX4Ie2hto/4c5ieIQgDU1rmFVctLiIwUwcYM3MTE
 4mmFBjOJYH+xdaknJbEBUDcRp809pLVcgWj/UmYsOsdsqjbsH9k4mJlB8keOMoQxNAdb7I0nxU
 vXrTIfZvfonrZFELSdssEZ3lfpGFg8pnv5e3j39V79XB4jWtvDyeQkWvqtbnE7YFrEjOMaMQeY
 tA9ObepkRHwKdp/YU6fIPMlDa9E5ENXRu+eNfcXSeNBOF6k5OxTRV/J8OKqSpo+6H0z3iUwDh+
 cy0=
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="80626698"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Jul 2020 04:52:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 3 Jul 2020 04:52:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 3 Jul 2020 04:51:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyGnzTQMEYzHXm+DCCtaMkmybOew24pqZ5HWAkHNNF6qpwp7UZnw50tcGj87eFA8WXagw2mTl1EWPF02AhP/VM97HBfpilaZ7X6XTn46A9UzAsvdiPIl1YP+4eYyrm8uV/VDDoxVw+IYrVD6qIivfDFMHs89D6bsZ7WFzurAIV6/ihFLD+gH/MMaxHOQdoeuU4kkh3uoxZnhUIIihM2KEI19FECgOos5gMPMRKuQnkeD5gfXeF7oQZU0lNK1uu85fwB4NeC9dJY2TOXtfkoyGWXayRy2Ker0rq/YwiZVvchGNP+8STiJDGHoAQprxVIbePdWH9OdE12insZCbwrPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJjF2pZfVy7mDUYMG2vsDaCkOP798OCQGl6rigGkFvU=;
 b=aD2SQt9JUSapC5/E939G/H+xoUsFHoHnu+4YVD0+9xgLwVyNNGKMGDqYHKTdkwnVIEpHx1uOlZAW1Rwa+kTmQ7NCt3z6lvJ/ttrCgHqBqC3MpP62fUWv/tHonmMPBlO6XOzU8M0G+cQEZZ9q1620GxUPIVvblgZBYqUVw8Pzn22cpD/aBhHYfjvGOSd/msFe34sLrEI2Qf4f1iM1curCpISTXkY0o8KboJBjeucPGRfQVkbwVcSRgCOIiYSb4UEXjLjCDRn0JuAyh8BGPwBH9OzEXh/rmRUDhPcPOTjVW4xxL1aexaKoSenVWbxwEkq1PoEuTyTr7D95L4jmaHQ/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJjF2pZfVy7mDUYMG2vsDaCkOP798OCQGl6rigGkFvU=;
 b=vzR34xyIuBrvGcBKIi0/r/u+PCiz0d8znkGh500E6pUkMtWSEsWYWQxZsq0DzPIQg5xQbRlf415mhzKDtddotHzWj3BrJJbb7QO+a5kY3BMG/PIWOFkXG9IjO0eXYHSwzbJJLxg6c8L9SgiUbFc83uPOa/qCvMpcDJXgNikRyD4=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3797.namprd11.prod.outlook.com (2603:10b6:a03:fe::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Fri, 3 Jul
 2020 11:52:09 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.027; Fri, 3 Jul 2020
 11:52:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Thread-Index: AQHWUGA2nJZCuA2l+kGOvQNaYhxZWA==
Date: Fri, 3 Jul 2020 11:52:09 +0000
Message-ID: <157c20a4-2a7e-601a-34ef-66baaa17eb7b@microchip.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <193b32f7-f56d-4f78-5353-b5d47cbf71d6@microchip.com>
 <20200703111924.tyrvzbbgd7ak53qf@ti.com>
In-Reply-To: <20200703111924.tyrvzbbgd7ak53qf@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 719e9678-3197-4095-b023-08d81f478445
x-ms-traffictypediagnostic: BYAPR11MB3797:
x-microsoft-antispam-prvs: <BYAPR11MB379722B934153E086287F896F06A0@BYAPR11MB3797.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gelHUiZZGXCuHl2AmkKXWmQBd92S3OkllfbNcuhj4rmJXfKt3n9VlMys/ccstwPdXa6Zp5Omx/kbHA9k1Eq1UU+LGC5X/wmr8jRCWuSzDFYrmdxNnRNdS2gyj5WQLA9QIu+EcuFuBYi92qVOYvP3O3MWkVqVmSVg31jdtq9zll7ft72MfY5245ts7K4XMhJcH4qMy8Mq/NWyxxZzeNWTFBYYgQqldLMlywp8/bU4zwxYMQC4T5vaNYIsqAx+ZNR3LvKWDhSBEc+ahy6NUO+p388wFhhRXnX2F+clB5lpxyObuNIQgHTFefI4ovfqIAnRW9WPX9VoTUCwdchud4/nObDfMqs5ijORzZYsWL4LJxsUmhEh2GeviJ9CUuDwH4X
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(376002)(346002)(396003)(39860400002)(8676002)(6512007)(2906002)(31686004)(54906003)(478600001)(6486002)(186003)(71200400001)(7416002)(53546011)(26005)(6506007)(4326008)(83380400001)(8936002)(5660300002)(6916009)(31696002)(36756003)(66476007)(66556008)(316002)(2616005)(66946007)(76116006)(64756008)(66446008)(91956017)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: j23iYNT7iHqjet+MVs9nN9V4OHt1PoXK5RTkjxR2iygHc7Ux+fAz811TBfLUdK07XagAGUtkCuoIsIS99dcCG/6vZIdsFtlKjZ8I8xJnwApZFssegMKxK7ttrf+VB++AO/55f+bzuw5YT0mBl/WIu9UcBNZwh0KBL655id6gGvS7igQaACoRuNiUYkaNGBWLNt20EtaucCGEkUDJagfYI7oLF5QMh7OJR3uKl4g8U4ayl8qwM1H8GA0A+lWVhZWy39yctVHbzhitf1yLVdiq2fjUEPVQiJ0lUOyNDoLGx2mJeLkLBnMjWGhXdXiQ3Jn6GQaDqnafi99ozlp/Bin7bdiY5UgG3tih1rq9l8VCGta94TJP6NqQDB20XrLtojj/2PJOzOlHtC9B41pFQyhopkqTRD9mpC5kWQenO1v/mjCnBFODymACPpFJOYueeGdKu/qMEw+A239oPoVBnh2e+Is7R3kMYK10GzQrp3iZpSk=
x-ms-exchange-transport-forked: True
Content-ID: <2D39A31FA847B14A882287692B7525FA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719e9678-3197-4095-b023-08d81f478445
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 11:52:09.3834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THG9n7NB5bQe6kjpWU4FuEAUAuiBUGOTQ4xhA88U5SrTCZIDsCa4CY2sJ3RhPlXKtfiw5d3/Mq+e8ePEJvWN5CLjsCZKVsi/qFQgSu9loKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3797
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_075216_393774_6B332BAC 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, alexander.sverdlin@nokia.com,
 miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/3/20 2:19 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 02/07/20 11:02AM, Tudor.Ambarus@microchip.com wrote:
>> On 6/16/20 4:02 PM, Yicong Yang wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> If the flash's quad mode is enabled, it'll remain in the quad mode when
>>> it's removed. If we drive the flash next time in SPI/Dual mode, then
>>> problem occurs as the flash's quad enable bit is not cleared.
>>
>> Please describe the problems that occur. When QE bit is one the flash
>> operates in Standard/Dual/Quad SPI modes. WP# and RESET#/HOLD# are
>> affected as they change their functionality to IO2 and IO3 when QE
>> is 1. Is there anything else?
> 
> IIUC if we do anything that introduces a state on the flash, we want to
> clear that state up on restore. That's what we (will) do for 8D mode and

correct

> for 4-byte addressing mode. Does that not apply here?

yes, it does. I've just asked Yicong to describe in the commit message
the problems that he encounters, for better understanding. Standard and
Dual modes should still work with QE = 1. The only problem that I see
is that WP# and RESET#/HOLD# are changing their functionality to IO2
and IO3 when QE is 1. Is there anything else that I miss?
> 
>> While I find the intention good, there might be some problems here:
>> 1/ w25q jvm variants come with QE "fixed" to 1. This probably means
>> that QE is not writable, and a writing of QE to zero will be ignored,
>> but we have to check.
> 
> In that case they shouldn't have a quad_enable() hook, no?

Right. Although this scenario should be a false positive, probably the
write of QE bit is ignored. There is a superfluous write of QE indeed,
but maybe we can live with it.

> 
>> 2/S25FS128S: CR1NV[1] can set the default power-on state for the
>> CR1V[1] to 1, i.e. QE to be set to 1 at power-on by default. The
>> logic here complicates a bit, and maybe we'll have to amend the
>> patch.
>>

We can come with a patch on top of these for 2/. Yicong, please address
the minor comments and resubmit.

Cheers.

>>>
>>> Disable the quad mode in spi_nor_restore(), the flash will leave
>>> quad mode when remove. This will make sure the flash always enter the
>>> correct mode when loaded.
>> s/correct/ Standard/Dual SPI
>>
>> Cheers,
>> ta
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments India
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
