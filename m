Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D2AC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 15:45:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267FA206CD
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 15:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l289le0D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZKfgqafo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="BA31+tj5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 267FA206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zgW5YBUrsaDJ1kh8mqhrtAhz0slJ+G9Z1TR/cA9+HIw=; b=l289le0DWCi6AUY50Nsee0LrC
	tvc55lSi54IFTlYRXrklYF2agvG/hNn3wZH7iX9RDsFLS4VsHbWzLIG9YsuoMkTwnUbYWu9NC/T1F
	6YbRLnSXQRl+e2MCX7O4S13msDaRNK7Uad5WG/0by3QYD7nNxShXQCFDb407/5GJ/vGis/w1A5eQS
	K4naOkHkV1PI6RQdcCkPMzl2ZRSR8A2skLh6huJbNZLkuMjgGP3GABEVMxpFVTzt6vvZQGmkcRcsP
	rWyQch6tpLjjFzytRX+RS8pL3Yc+3FDgXQtzDF5+TDduHgheWqiAIqUv5G/61oxk+P+1A76dGsmth
	lb3OxszwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNHmY-0004te-Qr; Tue, 29 Sep 2020 15:43:10 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNHmU-0004sh-TH; Tue, 29 Sep 2020 15:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601394186; x=1632930186;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bCcKCIayyj3VKTQEzTUgRLS1/AudlmK9IWXbtRB9kMg=;
 b=ZKfgqafojR7YmNb0PRsXcvVg1arVwy5Eo+taYVJgEq2GoCTUgb0onMWw
 X/nJ7xsP7NW87lJry0jdha/ZP3cW9V6nzczM9cSC8Pm5Y5Qxhwdg2r9NM
 PMzTuyxfL9TPnmk2JMtpOy0j40cbgJPZBzp0B5btyQ3Pgio9dpVQyk8hx
 XjorjeGleGrUB3vhFLicD1Nbzlx8YMpil1ebQor7QccMyfY3nHV99FM2g
 DahMsFKF8SUmTET3mDurvxonr/OGgn4s6OZX4rkkIaKNOxsl26PLbfNAF
 HMJL0uC0lp1nJJNTTUQccHNAOTTwbXAeLnfFjmVFD+63v5GmFrqvapvGC Q==;
IronPort-SDR: I1YRmBgLZ71//gP2A1n0z6pyTUbXiNNE5RoT/h4FsR1nvK0HwuaQbi4P+FBI5nPMQvdm+jiOJL
 /jn6X/Z9NBc3HX1nWNokxgS1mblD5Z68/3FCBgeMjpFhcjP/YOAVt/NGr4oSBxKeZTfNkOPeme
 gr5y/NEG+AB/6LOpnZ++Ff+NJCuLCE9+4cgFJ527B704rjU52ZQvn6DXBFYNz5BOtp8KMruaKN
 tSmrJ/LI02FfJcNrVsa2ma35qoJV/HpN3lRpzJaQQdpIVgmQ6FldOhHaXQIk/w0emo5Zhii1GR
 ngA=
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; d="scan'208";a="88558309"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 08:43:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 08:43:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 29 Sep 2020 08:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGd1QnxOYPextzJzUFQXaCI5V1x8WB4uooeMN7Md3vFRiYNnVhI/zllsxiojmp2L8nMcOcnZ0WwqVSg1/1qAAmy+dA+TzT+1MUq94ys3fI4+VBQz2oVyGqLnXOGYYzfAkfwhPZwO/s8wtNBi3MDNYMIF85Gj1CedlTies0VDs7pTqllIKg52hL+YO1gvREvREtAcUCwZqcoW1zRH5hz5JJU+WDTiai9kjxq25FMBiBFgxFQWCk6LKM9aND7fkhaLhJze7hCQYC+F/cFvbnqNEHGqtfRJrHZVHPNK0CWHXnyIetIWU3OpYoaWqJIq1RCpfg8A6PKY5JjckmlH+dc73Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCcKCIayyj3VKTQEzTUgRLS1/AudlmK9IWXbtRB9kMg=;
 b=njmvg47kCLkciboBZN5rMzbPjOvcrGgbdL0JqA1fVJI9Xt+7yx3wnRYix23xNEcOxhLI7yGuHV4QmNbjCj+GWiGD1bPi+8JCmgpG8om1F61QFcEKfIJztRXPYmKE0N9RqgGx8BKxZieZTsq3P9YkiUhmQSnT/wsi16sL6Sznam4nHz+C4pliwfeYQ9YaWRMszlecCJj9oFO+naIs9tqDbkh2o3LUGNljfALDEGnVJz8+jBZx2CDY7UUU0l3gOnIp180jRc52wZHMbRiWf5foNozop04GWNufrf6QO+OcsPWo+a+fUcSVAWcy8vmvTbUutK7zSbtfnsSNgSp7YyChBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCcKCIayyj3VKTQEzTUgRLS1/AudlmK9IWXbtRB9kMg=;
 b=BA31+tj5stG1pXOV0TSFZ5wTfJEAmrhbfmBCPoT2zS6vO+WiNHRBhex47HzaBO/sa2bmoqd2Hh9K2S4NIaJtBjGvZTF54mn+KSiVMMxwmt83PhT4L5B2jbt1Dk448hs9Cc5r/gcVNuB9cLHXn84tycZvGOhnB5LM9F9vhctP9go=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR1101MB2155.namprd11.prod.outlook.com (2603:10b6:4:5b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Tue, 29 Sep
 2020 15:42:59 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 15:42:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <me@yadavpratyush.com>
Subject: Re: [PATCH v10 05/17] mtd: spi-nor: add support for DTR protocol
Thread-Topic: [PATCH v10 05/17] mtd: spi-nor: add support for DTR protocol
Thread-Index: AQHWVIVGo10ftuQ9H0mpaQ4YA8PU1w==
Date: Tue, 29 Sep 2020 15:42:59 +0000
Message-ID: <f9a22bc5-35f6-9507-b0e7-dcbad51caea7@microchip.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-6-p.yadav@ti.com>
 <fbb3d7e7-75ed-dbf6-a975-2ae871bc9fbf@microchip.com>
 <20200721112951.rngfk7njubcsahzp@yadavpratyush.com>
In-Reply-To: <20200721112951.rngfk7njubcsahzp@yadavpratyush.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: yadavpratyush.com; dkim=none (message not signed)
 header.d=none;yadavpratyush.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [82.77.80.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6de43d3-6b70-4c09-11a0-08d8648e5801
x-ms-traffictypediagnostic: DM5PR1101MB2155:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB215500A44DF39FCB790F3DBEF0320@DM5PR1101MB2155.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BifaFk6gt1kQp0sDWXt7Eits2+R3kn61zlIk+4Msa2TZEmOyqLYqWyfphfCZ6rytHkc8SU6uUR9ZFF6dI/7khdbZXLTiCqKfcKUCFLtzCvKCbk8g5+4B1fnQayBde/v+8DcrLj0Fa4zVS+mTsdKqN8F7gZnY/RBlGnMVWFkrcnHSUxalfSN4WVNVa5TyukAhYZFVR/XYx2tO0dEYqEQXZ1TEgWwUqZyi0QM5yIf5RkzRVPD5cqLPtBxwpRkJVc4MXM/FijMPVrHz2jCrB4AbCGgnf1G1T761fKgeurm5gRIsBLzDozT8LDleZZ/NKRqs2AhAzTzZqG6Vt2Q6oit+aXYumQBXxxwNtQ5Cit6t8gqFbL0yFEGeVAfD0IF+vKbo3iVih8ObKYj38nOivd+mnGYPoQHdH9hiooR2fNf4dPwIIpOsxvQIWAsvSUW337PGQTKV+bb3e4NZCaFIoyH9xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(39850400004)(396003)(366004)(2906002)(2616005)(83380400001)(8676002)(4326008)(8936002)(478600001)(36756003)(5660300002)(86362001)(31686004)(66556008)(66476007)(316002)(54906003)(66446008)(64756008)(66946007)(76116006)(53546011)(7416002)(6916009)(91956017)(6486002)(186003)(31696002)(26005)(6512007)(71200400001)(6506007)(43740500002)(352734003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: wkrabcju/XEcPgVQNfHswTWAeT25lnQ3ueet41lAI43a69v+HQq3U5yka3Use3QUNo139d/w0MVtWLy6eCwKrXMzEYCm+qqWKXDLbXrcS3JbeF3FwvMKMaqz6tJvU3X6DsH5wygO249dR5uf+hEmSYUzz95gGsS1Q7/EHqxSK7xKcooPy341lGKj+FplRebgaVRYS5juxxg5jiIi6WZ2rtsX2lcbltCcbvCEwFKG0aHeY/YxwN3oJ//Dyc5GQ5cOfoP6yrxu1icauUUX0VDMx3zwWqpAjpTGtWX5w1q31vjTRxPybzpMTLTAF2lV/fIVG6HAQBCm6Zxw8Xb1HmaGiz6gzt8Ej5P2qoK2vYoOajHdVs61PVEodT8orsR9MbKEFiq/qxmFsvvvI7WFPGsEZj3bMOMcwsofJhFPS656AzNP/s6NBd59hntDYEX0u+ty6n+I22g1HUSQWe86rXups1AWxLvrN41Ckay6VKhV1CRKNFeycJw1A9sLN+0Mr4P0SzogUgD/oFYgeTLGYe+P/FACuX+TFb8cQKqzuVd72izAxt5yhk1GWnjVUrSniQt8P/4SES+Gn+I6gnLyma69NyeaachazwtR+27EOffpbKMpQ/onEGH0mQyNt6CGMIV3RBfs9xNy+3detcXnY8m5gQ==
Content-ID: <25D44FC3F1FA854D96FE5DF08AFA6DA7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6de43d3-6b70-4c09-11a0-08d8648e5801
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 15:42:59.6264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O0O5zVFWWmM22aEhDKuJiKCIqm7nuQwIiXwr8Dymd45jSr4GidnmDPlLMFUq7/1L+rxHDjfe/tYG04wyWk1gsh0sDL2/YpvZ2bHLO+FKDNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_114307_214407_2E501A9C 
X-CRM114-Status: GOOD (  29.45  )
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
 nsekhar@ti.com, Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 michal.simek@xilinx.com, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, p.yadav@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Pratyush,

I'm replying to v10 so that we continue the discussion, but this applies to v13 as well.

On 7/21/20 2:29 PM, Pratyush Yadav wrote:

>>> @@ -2368,12 +2517,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>>>         struct spi_nor_flash_parameter *params = nor->params;
>>>         unsigned int cap;
>>>
>>> -       /* DTR modes are not supported yet, mask them all. */
>>> -       *hwcaps &= ~SNOR_HWCAPS_DTR;
>>> -
>>>         /* X-X-X modes are not supported yet, mask them all. */
>>>         *hwcaps &= ~SNOR_HWCAPS_X_X_X;
>>>
>>> +       /*
>>> +        * If the reset line is broken, we do not want to enter a stateful
>>> +        * mode.
>>> +        */
>>> +       if (nor->flags & SNOR_F_BROKEN_RESET)
>>> +               *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
>>
>> A dedicated reset line is not enough for flashes that keep their state
>> in non-volatile bits. Since we can't protect from unexpected crashes in
>> the non volatile state case, we should enter these modes only with an
>> explicit request, i.e. an optional DT property: "update-nonvolatile-state",
>> or something similar.
> 
> I wrote this patch with the assumption that we won't be supporting> non-volatile configuration as of now. In the previous discussions we

I think we have to take care of the stateful flashes now, otherwise we'll risk
to end up with users that let their flashes in a mode from which they can't recover.
I made some small RFC patches in reply to your v13, let me know what you think.

> came to the conclusion that it is not easy to detect the flash if it
> boots in any mode other than 1S-1S-1S [0]. So if we update non-volatile
> state, the flash would be useless after a reboot because we won't be
> able to detect it in 8D mode. It doesn't matter if the reset line is
> connected or not because it will reset the flash to the non-volatile
> state, and we can't detect it from the non-volatile state.

correct, so a reset line for stateful modes doesn't help and the comment from the
code should be updated. s/stateful/stateless
> 
>> For the volatile state case, we can parse the SFDP SCCR map, save if we
>> can enter stateful modes in a volatile way, and if yes allow the entering.
> 
> If we are not support volatile configurations, the reset line is enough
> to take care of unexpected resets, no? I don't see any need to parse

the reset line is excellent for the stateless flashes, it guarantees that the
volatile bits will return to their default state. Disabling the clock, waiting
for a period and re-enabling it again should do the trick too, but probably
a dedicated reset line is safer.

> SCCR map just for this.

This fits the RFC that I sent to your v13. We need to parse as much as we can
from the SFDP tables so that we don't abuse the flash info flags.

> 
>> Do the flashes that you played with define the SFDP SCCR map?
> 
> FWIW, the Cypress S28HS512T flash does but the Micron MT35XU512ABA does
> not.
> 
>>> +
>>>         for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
>>>                 int rdidx, ppidx;
>>>
>>> @@ -2628,7 +2781,7 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>>                  * controller directly implements the spi_nor interface.
>>>                  * Yet another reason to switch to spi-mem.
>>>                  */
>>> -               ignored_mask = SNOR_HWCAPS_X_X_X;
>>> +               ignored_mask = SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR;
>>>                 if (shared_mask & ignored_mask) {
>>>                         dev_dbg(nor->dev,
>>>                                 "SPI n-n-n protocols are not supported.\n");
>>> @@ -2774,11 +2927,25 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>>>                                           SNOR_PROTO_1_1_8);
>>>         }
>>>
>>> +       if (info->flags & SPI_NOR_OCTAL_DTR_READ) {
>>
>> Why do we need this flag? Can't we determine if the flash supports
>> octal DTR by parsing SFDP?
> 
> For Cypress S28HS512T, we can since it is xSPI compliant. We can't do
> that for Micron MT35XU512ABA since it is not xSPI compliant.

Ok

> 
>>> +               params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
>>> +               spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
>>> +                                         0, 20, SPINOR_OP_READ_FAST,
>>> +                                         SNOR_PROTO_8_8_8_DTR);
>>> +       }
>>> +
>>>         /* Page Program settings. */
>>>         params->hwcaps.mask |= SNOR_HWCAPS_PP;
>>>         spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
>>>                                 SPINOR_OP_PP, SNOR_PROTO_1_1_1);
>>>
>>> +       /*
>>> +        * Since xSPI Page Program opcode is backward compatible with
>>> +        * Legacy SPI, use Legacy SPI opcode there as well.
>>> +        */
>>> +       spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
>>> +                               SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
>>> +
>>
>> This looks fishy. You haven't updated the hwcaps.mask, these pp settings never
>> get selected?
> 
> The problem here is that I don't see any field/table in SFDP that can
> tell us {if,which} 8D-8D-8D program commands are supported. The xSPI
> spec says that "The program commands provide SPI backward compatible
> commands for programming data...".
> 
> So we populate the 8D page program opcodes here (and in 4bait parsing)
> using the 1S opcodes. The flashes have to enable the hwcap in fixup
> hooks.

I see. Would be good if you write this description as a comment, or in the commit
message.

> 
> As an alternative, maybe we can introduce the SPI_NOR_OCTAL_DTR_PP flag
> that can enable the hwcap here? Thoughts?

Should be fine the way that you did. We can change this later on if needed.

> 
>>>         /*
>>>          * Sector Erase settings. Sort Erase Types in ascending order, with the
>>>          * smallest erase size starting at BIT(0).
>>> @@ -2886,7 +3053,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>>
>>>         spi_nor_manufacturer_init_params(nor);
>>>
>>> -       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
>>> +       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>> +                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>>>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>>>                 spi_nor_sfdp_init_params(nor);
>>>
>>> @@ -2948,7 +3116,9 @@ static int spi_nor_init(struct spi_nor *nor)
>>>                 return err;
>>>         }
>>>
>>> -       if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
>>> +       if (nor->addr_width == 4 &&
>>> +           !(nor->info->flags & SPI_NOR_OCTAL_DTR_READ) &&
>>
>> Why is the Octal DTR read exempted?
> 
> It is based on the assumption explained below that 8D mode will always
> use 4-byte addresses so we don't need to explicitly enable 8D mode.
> Although I think maybe we should exempt all flashes that support DTR
> mode?

4-4-4-dtr can work with 3-byte addresses, check MX25L25673G. 2-2-2-dtr should work too.


> 
>>> +           !(nor->flags & SNOR_F_4B_OPCODES)) {
>>>                 /*
>>>                  * If the RESET# pin isn't hooked up properly, or the system
>>>                  * otherwise doesn't perform a reset command in the boot
>>> @@ -3007,6 +3177,9 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>>>  {
>>>         if (nor->addr_width) {
>>>                 /* already configured from SFDP */
>>> +       } else if (spi_nor_protocol_is_dtr(nor->read_proto)) {
>>> +                /* Always use 4-byte addresses in DTR mode. */
>>> +               nor->addr_width = 4;
>>
>> Why? DTR with 3 byte addr width should be possible too.
> 
> Should it be? What would happen to the half cycle left over? Do we then
> start the dummy phase in the middle of the cycle? We would also have to
> start the data phase in the middle of a cycle as well and end the
> transaction with half a cycle left over.
> 
> AFAIK, the controller I tested with (Cadence QSPI) does not support
> this. Similarly, the two flashes this series adds support for, Cypress
> S28HS512T and Micron MT35XU512ABA, don't support 3-byte address in 8D
> mode. I'm not sure if there are any flashes or controllers that do.

how about conditioning this only for 8-8-8-dtr?

I'll now jump to v13 and continue the review there.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
