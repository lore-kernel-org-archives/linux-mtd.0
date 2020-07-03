Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160B3C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 12:21:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D687420737
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 12:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sG3KoBkU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ljX9dsir";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="P83Fdb5P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D687420737
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lQi9nN9zX38xfl8EbDX8zVH0D/I5CIjPHtOgdBFlfoQ=; b=sG3KoBkU5XDKBzCORVew03vHJ
	I8MkZjbzxQDsBOg4GlObipnpJL+a71tPKmcmjNSZYCGGIBYp6/jqtM1XIb3K7xgSYFdASvI3E6bhp
	zgEoLRYdljxDAd2FMxJRqvHclts0+WTUyMHRPBmOoIYJrbZ1CzCPtxj/nS54vxQxYWKFBgYm8Tx/T
	g8fP13Bob+OVzWG86j8s2vWGCYDgxrEMs/W0FpeFaNsEDi6TWd/le5aFF4fF4qJ+CvnwxWP/cL1nF
	PCp7EA9IGc0nHakyfXQBdFZ/ht8uMEAmxKwuEt+IB/IzVfhIlPEoVA+2WfKMGgOd9Tz2mQKM0J31H
	xwBto9wVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrKgB-0003Ng-6S; Fri, 03 Jul 2020 12:20:31 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrKg8-0003MX-H9
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 12:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593778828; x=1625314828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8tSo/EVDVe7hMi7tdmXvWWYwPg+pvv9PMBvIX8uz+Dw=;
 b=ljX9dsirnTOAjS0/rqAcKv1FjA28CLQRAsJU/jJquCAl4CHeRblB1WGF
 65J+MmByrWHaFu/3ezLMcI+eJeoebVszJH4eKNipv4V7zLaEt2i0qhAnw
 d/hfPNT4l1J8W8+YgOFiBF5vcAdUfjfNQchkADi/xcBAVP+OVbjCXqrEG
 db2Tr/pHz9gKQH4qJX0W4WDEqPZFTjbgTmythgZIXebBfRxzDhe+5vFth
 bhjH2NQWDaOI8OmNU4gF5NyqO+/zB5W9TaTp0Dze3cvE6DhwnqOrGkd6J
 9OEpWXeMz7pQmeD1I67qpJbHZL+qglWHV/AJ21yA9EywUr4qJ3HwL9ueU Q==;
IronPort-SDR: 1bi92jJ19iUe0Ssa6cF6BrBQ/XJiGyfQksriN3Aod9gKlOFRlRJItlxt3lTI22Lkt+DgnL4VN0
 A+pn0HOcjq2CCHE6GLXd9IFfmjA1UqcE1zZTg82sC2cAaENvXZRQI9mAxQkztVP74noTSgdijD
 ihUJbTSwkbNaAz9sI31JKFqgrihVrk0s3AqniYXUF7oB3cCBbpc11BVWxXq2NKx7gV17MoHHO5
 5YZHusiI8kxsViBaPmjgEDywGUBoaKusI1daF9KLrhRIHBC6TaXQrffhZMEleu5IoIja6UWSf0
 1qw=
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="80628863"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Jul 2020 05:20:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 3 Jul 2020 05:20:26 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 3 Jul 2020 05:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVVFBeJ7dUKdoiglBABasZaUgezE+5IHJVdx4IRaUvTGCvD3HDu6S/sK/bUkT+Kj6ClvSR/iAWptXHMz2HBm3kMPp4knwRFwF8+Iu5xAa4nvE1RR47NsxjBVy7MRiwtQrA8q9nHT+RUYBZoxDEZwyaMdME5oGiPAQnUStPl+eBcFhIIZ2Eo2f4+27EEEindmAK5cpQ39kwNCFlIEap1CoMJXcbBCzNfnXKzTXnx107DjVm7Rd/Hg2/q5ug1SSC/Ara5rv9jafJIYkAeJcVoKkOZMLiwozICXJRexzVLMtMMEFeMgE1Mka1aM+vmCrAlFvoPSuKyrszE78a8yRoziSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tSo/EVDVe7hMi7tdmXvWWYwPg+pvv9PMBvIX8uz+Dw=;
 b=aiW3xEXFvO5oOgjwjhvZ+HRgzdsMkNeNGGzBqsg+7dw3nm1dKBCJMuu9K9FQ3OB0LQxYEi9HcUmrhNV9yZmO2ViYtHEkqSnSS3Yq5Ptqag2ZmF7QwciFCOcQ92KEHtq9x5ZnNTzwq56dCBp1FlOZrgVa9norrIX98Jv8gwWW+9FvJfNPtMZOyoQQo3TH+8S0CuQZOS7KSvYFVC+KX4igKe8FLlRDSDxpMPHW/y/ddJl4aX9fddVWjM2FyqZBLb8eX/e9vuhhfvo9BSoUuGUaGfdLDNSgUcSLLgglo7NFh5Qlcp4EtMZ6hdsQQX5QiPbf0bQT6R8IazDbVuF5NXe/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tSo/EVDVe7hMi7tdmXvWWYwPg+pvv9PMBvIX8uz+Dw=;
 b=P83Fdb5PlzqX+oyDJgUQhw1JOO+Ct7ZbKjxCAvvFQvQJiANiupVy7bY6jIDK1H3FrVBj7OpxExiPU5kKG6BTb1znMT/ErhYhcI4nNMubpE3jz2mR9jFkI7kGGXVRX36k8tou1XMOs13hYaq5TZXX7gaP08kIS87oO5i8kbuFpJU=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BY5PR11MB4070.namprd11.prod.outlook.com (2603:10b6:a03:181::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 12:20:24 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3153.027; Fri, 3 Jul 2020
 12:20:24 +0000
From: <Tudor.Ambarus@microchip.com>
To: <kuwano.takahiro@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Remove s70fl01gs from flash_info
Thread-Topic: [PATCH] mtd: spi-nor: spansion: Remove s70fl01gs from flash_info
Thread-Index: AQHWUTRS5lOAlsNPg0icRv7kM8FkZQ==
Date: Fri, 3 Jul 2020 12:20:24 +0000
Message-ID: <48516fcf-70fd-dffe-96b4-39a7772eaabc@microchip.com>
References: <20200626051650.495-1-Takahiro.Kuwano@cypress.com>
In-Reply-To: <20200626051650.495-1-Takahiro.Kuwano@cypress.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e47d4d6b-2e78-45d9-04da-08d81f4b767b
x-ms-traffictypediagnostic: BY5PR11MB4070:
x-microsoft-antispam-prvs: <BY5PR11MB4070EC4ADE6F9671AE49357EF06A0@BY5PR11MB4070.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tJYJXHGWjxoUw9xLuZmvk8Wuq8iFAcbSttKbxi3ithDhvy6aU1xXHjPqfYsZ5aUbEJ6GtLTe9ZX0ouZuWPdSoyz/cIgy/ZZpsRB3H5VqR99S3kD6HjOm/dze0ztczLLwOTZbHew/xMHeTRtrqtYwwkoPZf5EI0Na5on2h1BQSchR9ZobM6aEpORyw4DyqzlAL3cXxnJJgscF+PnnpfXsNvPjnb0ttgyCABa0FyAJQfpnrCYOITQrzZBS/sHu9KoplMqNncMLrrBCSR0MEC7dZ0R1Yi7FPRNAotC5Dq8YfdCEkyqNew3rYnHcQdUMJh5wVcsvS87CYBvqTTrca9O7luh166LJ495Hoh88ZEMRIUXu3tAkBLb8Pnx9Mvk+r8lA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(366004)(396003)(136003)(39860400002)(376002)(83380400001)(8676002)(5660300002)(4744005)(6506007)(71200400001)(8936002)(53546011)(54906003)(66476007)(31686004)(36756003)(66446008)(64756008)(478600001)(66556008)(26005)(76116006)(2906002)(6486002)(110136005)(91956017)(6512007)(2616005)(316002)(4326008)(186003)(66946007)(31696002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: MlND5agk3bgzVtFTMZqrcMLvpMec/hT+OPIfC859NSSgPGZSGTDbHIFnRcvZqel8NtLSxGQR0+i7x7sSbEU98B4x6sv4HPqFk4m1GyaRCbkKhDT1dq3SUNOf2gooOC1R5gyjA22h46VqKAz9JaTLUIloPq9SwgQMWq3vaOsGLX1Boz8agKmfAjz1+DPIwVxFoRwi4T+weQekOTa9NCZ09dedDitn0m5IC7IMxfieNMUP8+9Oyhf/Ajr031SpXha0omiXd/sXp4jXMTSIK3jWJ8MzwQaJaSuL5zCQXqKFqvCn19IBsT2AXVa16IlnlETuhFS16sTwMOsvPY9QX+x7NwAH6ZJXukQl1xvFWvqUvszd+dXK1ysufRaQmRDFYTxoE8yS9MyAWchNptSYGHgVLn2Bxh+HaZvuzMH7A7uPhaRTKjg20gZxfMGUPfBqWvbdV82NfT+n2wwo5iGLQ8cPte9ReA/UdOOPp3oSuRcpVpA=
x-ms-exchange-transport-forked: True
Content-ID: <5396ADF9EA8D3A408788EA95635A3C79@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e47d4d6b-2e78-45d9-04da-08d81f4b767b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 12:20:24.2447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Win//mkBJage8n4pG5uC2hYYG1w7d+OByJrKfTT7AhQoLiQMXjC/xx441Dp8w3OmKqwpu9Vpvl+vT7WakrUJEEe47jNJ2/A0lpSJ/y3tjpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_082028_773427_B60E3515 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, Takahiro.Kuwano@cypress.com, Bacem.Daassi@cypress.com,
 vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/26/20 8:16 AM, kuwano.takahiro@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
> 
> The s70fl01gs is a dual die stack of two s25fl512s die with dedicated chip
> select pins to each. Tested with the device and confirmed that is working
> as two s25fl512s devices. The current device ID in the flash_info table

Right, the datasheet specifies too that the S70FS01GS device is a dual die
stack of two FS512S die.

> matches with s70fs01gs which does not work with current MTD.

s70fs01gs is not correctly supported indeed, but the lower half of it
(first s25fl512s die) should work. Can't you correctly read/erase/write
on the lower half of the s70fs01gs flash with the current code?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
