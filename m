Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EC7C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 13:03:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 999DD23D4E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 13:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lltolZNd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="SBriEAhv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="FD4/tS/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 999DD23D4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VjSKeecVGlJbyx+bh29WtDdHlV164LZ5C0wBb2r2gn0=; b=lltolZNd8gJU/jRAMjgbjHzIA
	ekig+sDxJ5oPedw1jz+I6/wXKeqFq1kxqlWNc4LfDgcr3uCojlpkiq+KrVBdBfhhMhfEdGppOJUFG
	zn+32kB13LNAasubpZAs/CYspoSljEK5yxe5f/lMtIalusrhwY6qf4KbFB4cW3rUxWmOqmdV1y7yV
	3615FYhvqlazpGLF5of906CgOK2krVEK5rvy8ao3suird7r3/T21gQdIeuVl+nm9soNN8D3Guqmj5
	AsuyP2EwGwhmrzYSrsX0+97oLI1z2+KWShKvO9f1uV9GiXhFr5ugd0jvatlXYbLU9hua6R0QM+Mre
	w/BRsjrWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jptQx-0004r9-9K; Mon, 29 Jun 2020 13:02:51 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jptQv-0004qU-HF
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 13:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593435769; x=1624971769;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mnj2hL5IAQgcOmZjMgZT9uwI/jwguseT9v1nNSZQmbo=;
 b=SBriEAhvuVn8kffLx0dv1SWwrxbDHiCTALls74GCoBkGz3dnPq4X8JKV
 U7KfgOWGRdOWS1RfBg9u9idUT+WPmCvBukFjiTPJkZZQWhCwgg5kh+2+y
 LbSR25WtTYmoORlYY/Vf7ERT5aAIWdk9OQT8pjlQ5bvCUzkWqaCxrsI80
 8pwGlSv7xCLBlbHLeXsz6swldR6Q6BHkd6LyRVg+UCVtscPynmeHF12vY
 a14LfBpTzMW+fleERmGwoNxFQ/3kkdePR/tJv8yuZ+6LDslodPUTSujUc
 whtykQ4JOln9t692ADb40smngid8BzNKjo3XP2mX1tq+Ob1ucQndsZgNY w==;
IronPort-SDR: eogV34OawBpN61AdiuYrvLS/E5rlTIxuDZJWgrdbyUBIU+qxaeVpzPYZbG+UCD2QKHjiQkHKA0
 CgqdCPTFfYhlYPa957CHVrkbK5+BszokS0w8Qfde8NrlaCFymk4cVBR5wlMjjZDAUhH7fgL/vs
 gA2+8J+1RqEIHi57OtitBG9xOY3PU1XaEGkhOMXCKUHM/2fGBcNugeigLOVwAKMcYo2faWUzKj
 j5MlgbNQZhOTTYfJrObFGqDCrAjaTdibnh4ls+hq+20HQ2vBtt5Lj0X3D+4byQgdg/vbdLEvqi
 X4A=
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="80075688"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Jun 2020 06:02:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 29 Jun 2020 06:02:45 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 29 Jun 2020 06:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBWy0JadhhC9k24naL46nFE5DQyZbE2jHnauXQCjoNHlDEk/ypIbOXommZMG7R9RKyT8jOInvtnlXSIeAzdxFuCdE07T2VS8m4g7FuHuFUQAjkNRzV8qtUnQg42TjZSk9CkFsajd6ZSlf9I1iO18NdkmKD2qGG7bc6lv5gqR49t4woiV+3CtLoflF0m4swIHu/sWfPExjlgGPLxlKnyf/2EChucTH6I6r2ToeUiW09JQWjeD4M/Ym7YY1XOtozI6xwJt3NZW9kDFKDzqTxQK19SLSL3FGyKj9PXxLy1LbxVM7dsi2XJgiqrAq9XvUfiaSuewEkfRsArQBQxJSV8dZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnj2hL5IAQgcOmZjMgZT9uwI/jwguseT9v1nNSZQmbo=;
 b=UMfyA1pAPJ/ajmbzsRinzae5oGOaaz9mLEA80qFi4cO0u6pjPrTXD3R0/kD5lNrPfyRFeY01HSWHKQCdIPSpkzL9UnOI7iZFEgStJeZ2VBGRlLnM9HlKqeNlzRJYO9wI9u1WeMq4FOcZeALfjrQNT1lbrtHpV2NX0brxeJc6enL6ceYrBHiImZiJSPD4peD5vkehGoTTvpjjW4wtlCZcrPpIAWdSFkq3DuQMp/vMZhEtqEnvCpZxzISAHKPzhwYGUXHIdzS3E8T84RaxlQ45li2vg5BcLXZmEuseXXPRlhdpjaP50+Z60q6Xer4T+Cwc4UMZrIfL2orFgEbCx9w3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnj2hL5IAQgcOmZjMgZT9uwI/jwguseT9v1nNSZQmbo=;
 b=FD4/tS/HMUakRjVhC+/A8b0zuMFcG/HL6zDTOa8gP3IVJ6pfrueHKXnjch1JXvK8xVZY74jZEEzMIl9uCHBFufQNgx2R2qaO9mC8YruqiMcmyQS8FJgu3WC3h907W7m1DP8Go5b9/X+fNvw4B7KMFXbiMceFEXV5h7+ebR9rjK4=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3461.namprd11.prod.outlook.com (2603:10b6:a03:7b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Mon, 29 Jun
 2020 13:02:42 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 13:02:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <matthias.schiffer@ew.tq-group.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: enable 4-byte opcodes for
 n25q512a
Thread-Topic: [PATCH] mtd: spi-nor: micron-st: enable 4-byte opcodes for
 n25q512a
Thread-Index: AQHWThWS5ExvpZr+p0W12MH0ZAuyBw==
Date: Mon, 29 Jun 2020 13:02:42 +0000
Message-ID: <e94d42be-5e40-e2bb-4683-cc7af59e801a@microchip.com>
References: <20200610091616.29555-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20200610091616.29555-1-matthias.schiffer@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: ew.tq-group.com; dkim=none (message not signed)
 header.d=none;ew.tq-group.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8de0de00-368b-4fb6-a0de-08d81c2cb57f
x-ms-traffictypediagnostic: BYAPR11MB3461:
x-microsoft-antispam-prvs: <BYAPR11MB3461C0EC29D6192F2991EC2DF06E0@BYAPR11MB3461.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ilRl4AmpQjW2LuOVMncBlb23SkmmnX+qfNUdPmA5QUAWRjcmwk1PmxZa7+QDGzBraQJyi0xUuGDU5Dl82jMpXdLnaZvqUWYa833Naukpc3v0pMl/yE22bGRHjJLHfZ1ZcJvWuMi3mmkksvXsE19oh7MozF13FkLX75mgzjeI7R7agI90SrFS7Nb9WorQHsI1UNn+8sCqE/vbXsJaXG+C8Utx7T4atvKs6InqD9aDgQcqViTFxQZG2KH68OL4Y0WeU90rxM2qbl023s1cpFlzlev1wP74YE2Rdr2tHu4D+ewlZHyxfJI9PyuxB/dxU2J+Q3owgl80T04Fiisl0rPhnviwfcdqlyjuvXrU+84luUZ/v2PLhH6/iDzrp1D7FlfM1ZdWtLibp937naH6zQcp9wnXbDkhi9mpRFjMhPY2d6gk2qCPAEi7p/oMCXlp0IQn17TCqMWcoSbm2j81q3qHcCc9jZQeg644ghM+EnK4QE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(396003)(346002)(136003)(376002)(6506007)(86362001)(53546011)(2616005)(6512007)(31696002)(4744005)(54906003)(478600001)(71200400001)(2906002)(6486002)(4326008)(966005)(31686004)(186003)(26005)(8676002)(66556008)(66476007)(66446008)(5660300002)(76116006)(36756003)(316002)(8936002)(110136005)(66946007)(91956017)(64756008)(138113003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: iUwc5h1OeoxPtyEQGi/CLpWDHmG5pvqPbQz8pGHO1WmvefuddL59buVxb9d3cyJ9McuymQ7pzAZT6gioKfI2ZJcgMlajBayo7NW6c4TMlcprw0Bi6ubAUNoS4mtS/pgTFyRNIFTiGE6FVgwWK//cgAeH9ASPuK4gF3o2ndgEV0iZdPRyxEDTfBw915CaknCMhsUjWqiRlB8orqpV6pZOpnbm0fz+xMaOQEtwZRJ4hsmeMDA0acveFlfpvouXkNLguuikrOdtneUudwFPEJM5UPeDC7roGGdvLAfPTkTqSThidCPZPdyOilHsgkezdjZK9plw6+arzFTDXcoOOeYZEqhMEBiGVaTZ5Xd6erVeou6xwlkLG2qgTvkJqhRYZ3Z+HQV1yCN64qxBMVoCR4hQHaBeSwqtF8yRcP0H39mNJqsxJHPeLATXWWSbj721S6GCGw7kwMwXHCrutGvyiVHH+gWrE8rA2rzlFhj4BybE4I8=
x-ms-exchange-transport-forked: True
Content-ID: <A6BE7C8F11FB304DB2A71B884387B2E2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de0de00-368b-4fb6-a0de-08d81c2cb57f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 13:02:42.1004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBGWMFdv1x5OJbHIWeFI+kcfxo8ej1vGjV65u+GZXxHuLYJuKde14Fk9pUaHIe65n8/DNfjvj9abdS8fO6TiQ6KjyoWNh6su+CyLPuqb2Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3461
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 michael.krummsdorf@tq-group.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Matthias,

On 6/10/20 12:16 PM, Matthias Schiffer wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Michael Krummsdorf <michael.krummsdorf@tq-group.com>
> 
> Set SPI_NOR_4B_OPCODES, as the flash supports 4-byte opcodes.

I remember that we stripped SPI_NOR_4B_OPCODES intentionally for the n25q
flashes, check  https://lkml.org/lkml/2019/12/5/50.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
