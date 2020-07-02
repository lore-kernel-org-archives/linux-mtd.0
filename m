Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A0FC433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 11:05:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6750207CD
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 11:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZaQ+HZ/J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xRdFjpGo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="UUJOXcfM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6750207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6otD26ytOFTjw+EKHhrC4Bx05gzhKPEp0Tn7nIeL66A=; b=ZaQ+HZ/J9vequ+xb/Ac9edkor
	VNnn8HHlPowf9JjIQFo5XK6fi5I6DHjOtyVIuM2VrdCTV0BlRx2KFbrRdtzkc3QQv5NSm+Mt+uiPt
	n3qxRsRCwUuq6SSMoPdvN99KWqqILh5S2eBSABtj2zniCbHc3iEotJpxHbMU9nmzgBjwyz116nAAn
	HS4drd2tj1jSiBIvj1dkAZ6I2BriwxRRW/SGoR/3aSly/ZJUeEzvUCNRgFwFomJYfFskiJ6G5m+T5
	28DPbNBESmDZfwPY6H2ucGhz2ZUk+BrPYRRJu7ahAsTx5XlspJKzhkrtRLvGdOaqsU8+kDpqAHznT
	qDbibQVdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqwyt-0007EF-Pj; Thu, 02 Jul 2020 11:02:15 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqwym-0007De-8h
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 11:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593687728; x=1625223728;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rUp69e2zN3qFDki7Jg9XPg5Hc/jcbNuIr2G37NnkahM=;
 b=xRdFjpGoQTybXeux4/xmGbzuDnxKtOy8D1hQzNqFy5rakI0w7q+dpU9C
 +WS7iG9EnfXRUn0xMG+4myXjOxldh6tZCkJ4ynxY4m47+rlYDi+6vuu08
 SEAyGZo0RqqXQARw2+w6m8jll3Dto+AxF6hnyTU8hy4OLaW+oYksGTGeK
 fcP6aUSDj4kRQMzYC+/R8UJxL68u1C5v0mthz98nc/fmArq3DUJBBm/FH
 55iE+ErfMgjO8SwtPHhS+nQa9Em7DLdaeGvZkIpKnM+8PVI3aWCol8OiL
 yDWhbhRv0J/pUD00Xh4vZe6igd08t1q6Zp9pu8KOcc7sgPp/WW91lQLvx w==;
IronPort-SDR: QaiD+f802eKzNG7kKWjpyPhmyBYAYWR0uII6h8vCu/kmEa0Hr2LLjRkmx8curVrAaGu9jN5a3j
 Hq7rR1PjwilmVvsaizmSzWe8JaX538EHGvpICK/xB4T/Baw8GFAZonrzbYhjZfzioES+TFeQu+
 GLR93Uy6Cj3zH/Pnj7W7p5mdTIr3itixTIwvyuwyIifZZmQ+pa8uyjXOwLuPY7FADwsPrpsZ05
 Txqfa+H37mDqsfu0XJgcaZJQmWldPVHXkSiUSsqr8jIGY7Usxv8S2C3/FlFujsxQ7qdN/ZesEH
 oNE=
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="80487336"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Jul 2020 04:02:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 04:02:05 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 2 Jul 2020 04:01:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQOn4BsQo+uviElqXW0EDUFVv9qzzX3KxEfyDWOMW06nWomhwa4M2hBiTPOa/VaTnnXkHm4Z5BCSl+7XOy+NI5aV7a7kFWDasg5GeC74nWYUXIevG25AnxafR9T9q33yhII3sXq69bm7FJzZOI8L9S3j8FXjag8lHHiKn9COy8gBe+KtyM6eEh3BCsZiPYH+967IxufGcvgCp2vjpZV0x8nZ7/KToOmUVLi2oZH3jZikYWfdCdBTzfQYq3S0FfEHMTaYBkHsr375vN2CpAkNPnbKkMn5S3oWyhZycAITXacaWQ50EypgpOV+dL2ePpJdIsS+2aX8YO20+UDplB8UMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUp69e2zN3qFDki7Jg9XPg5Hc/jcbNuIr2G37NnkahM=;
 b=lfxDSFYplZ7M2yRpNqRWSoout35AC73RrgREimSJ7ZI5F3AbonUSWqC6Jwn8H9QWbJfJ9hamDVFBlLXBWp3zuQ+iMONnXVtL28xQ/Qk9Ej53so+NtflknXzMbdBfHg/kS2LDosnziP25eQFogYK9vRMH6mtcnnRGyi3m+GVUlbDnSuZoo37WCZad9pQeWyu02MvtNORyG/miIqyZqM+EPvEMUvkFAXkYxQwCTPfRW7KVSrxd17clBFK9C+tCYC2pGeCy0C5K7a6F48+7AqrsL5914nS5i9iyGpJbhPVR7SXPAmGyjLHPlaWBQvYMAUzxnCMkI7oEQHWu9HBzLTLJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUp69e2zN3qFDki7Jg9XPg5Hc/jcbNuIr2G37NnkahM=;
 b=UUJOXcfMJs1t+0D7FU/ArZi63V25mr7VyWo4VCOUEdoBH324dqlcA7vx8+YHS7b7hjwdjruO2QtXeOMvKvIQYqX9pdce00oBg3z5Ng/7aDpJfV6B9GxgQFl3rFEWfJc/WCvkKq7Cz5Tj3rKDE1nYwGhcuL8GjJofgr4R1agMd9Y=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3511.namprd11.prod.outlook.com (2603:10b6:a03:84::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Thu, 2 Jul
 2020 11:02:03 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.027; Thu, 2 Jul 2020
 11:02:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yangyicong@hisilicon.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
Thread-Index: AQHWUGA2nJZCuA2l+kGOvQNaYhxZWA==
Date: Thu, 2 Jul 2020 11:02:02 +0000
Message-ID: <193b32f7-f56d-4f78-5353-b5d47cbf71d6@microchip.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf717e31-0424-4bfa-60d8-08d81e7759cd
x-ms-traffictypediagnostic: BYAPR11MB3511:
x-microsoft-antispam-prvs: <BYAPR11MB35119F980DBA28D096ED8926F06D0@BYAPR11MB3511.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nl4OsaKF/4xBzsPozGlNmay2rpQbksC9kkdMdVwGrqcGahSmKqQflljeI2xbsV79LCPWawjySd2zvukiywKeaxQQyWOaDCfjmNfwZC60uBM4g0coBqgAZRkD8F4CGNxYRfjomJ7Umq5gemFeG95oxf9q57TLsSearhSHExqQTETFsu9XicoYmiAQtvhrJWYHcRWJNMM1gv6s5XPGQwYo8pDGUhs4Ds9lKubovyg12uJjUHB324mtVV6e0U5TLpZVSr9tFFoTzMKMlt1zycHrEKnA/0EGFFd2kV8mg5ECo9cO8ZYbbzSjmf4MqktBydtYH2bnGZx+NDWrdeieJUhjSF51Q52ow3sHLklIhiQ/kNOySFvVihiSF0o1YKi8/q4w
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(346002)(136003)(396003)(376002)(6506007)(8936002)(26005)(110136005)(91956017)(186003)(54906003)(478600001)(2616005)(76116006)(6486002)(4326008)(71200400001)(2906002)(316002)(66556008)(7416002)(36756003)(66476007)(8676002)(6512007)(5660300002)(31686004)(86362001)(83380400001)(64756008)(66446008)(31696002)(53546011)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: GDlXz/9Z5sS064pN4SFXwA3I5LAZmSdmXwVcY3ux+TMEM9m9GI2ReeYbY2fHHu1Q2YS63y4aWZURXmd32dbp7vEPlJuolg7CU8cCXdw/esH34aFOwnmmOdFmN/9qj19aGg9KWP+RCDL5YD7tmqDmrghJxD43TpTedLHdy+j+2zNRvDECP5pPu3/28PhLsJKU49yr/9yTmDfA8JSS+yjDDjryNtG/DxtZMEOjdArsQaK5A5gT1/s43kGoDM8C/Is7sdb8IWB39uukLte72NDC7TfpvNgJVYH0BP1hlOz9Mm/Hg/qv+LySPrXwKGS8JFeF/sXnk+M+ZQNZMewfhr9HKhCmwQ3U+SorWsEBqZTrpCjgmq5cPwo/FjWVy3KrmkzzEamg1cQ9in9YO1Im4xPoHPSVaqF8SrxizgbHjO+yHFSivRQgTnEq1XSiEKWAyHVISkZVjjepr30IbOwy0beuLNyse3rjax+iZM4vnp41gV0=
x-ms-exchange-transport-forked: True
Content-ID: <A679868114C0814387659A9259E37CFC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf717e31-0424-4bfa-60d8-08d81e7759cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 11:02:02.8579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5uxUvIKZUapFadsFQbQ64dkdPq9xlXAEXoI+XAdll2i0OJqMlAyrDVeP4OOieO/Lf/q2X5WXR2Mb5Jm53At7gOaMTHClf4xbZ3rxeO8+xSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_070208_531959_52F27496 
X-CRM114-Status: GOOD (  12.66  )
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
 alexander.sverdlin@nokia.com, miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/16/20 4:02 PM, Yicong Yang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> If the flash's quad mode is enabled, it'll remain in the quad mode when
> it's removed. If we drive the flash next time in SPI/Dual mode, then
> problem occurs as the flash's quad enable bit is not cleared.

Please describe the problems that occur. When QE bit is one the flash
operates in Standard/Dual/Quad SPI modes. WP# and RESET#/HOLD# are
affected as they change their functionality to IO2 and IO3 when QE
is 1. Is there anything else?

While I find the intention good, there might be some problems here:
1/ w25q jvm variants come with QE "fixed" to 1. This probably means
that QE is not writable, and a writing of QE to zero will be ignored,
but we have to check.
2/S25FS128S: CR1NV[1] can set the default power-on state for the
CR1V[1] to 1, i.e. QE to be set to 1 at power-on by default. The
logic here complicates a bit, and maybe we'll have to amend the
patch.

> 
> Disable the quad mode in spi_nor_restore(), the flash will leave
> quad mode when remove. This will make sure the flash always enter the
> correct mode when loaded.
s/correct/ Standard/Dual SPI

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
