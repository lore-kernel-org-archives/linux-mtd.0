Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD53C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BA820888
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iKYYA3K8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="s9tqnLEL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="iLHhQKjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BA820888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGhUWO2jAY8lhEYOpb/TcnCS0VOfIT51LTB8iRYqHr0=; b=iKYYA3K80NHDuT
	jZrLkamJcnwl27WBG7tiszEqig+LBQyDLdkObuONREb43PfNnjTTIXoKOBtY2O1XeqZMb24ULK715
	XllYyppi1j9yxX6a6BdHx2YOK1W2Y1114yhsLJ1bAMNmTR5e2k0HMrV1Lh5Y8g2ZLLtdn0imA6GBn
	twy+G6EwMTFpsrg/0r1TVPB1QYk154vZsoTKabHkPXii74QekDhhgvwMlMUbPwmWc7gl10bRTkp8a
	UWR+Jo5iMdpTaY1trvKEvdw+9KE5f8gBWExr1v17IyZ2Iuv2K4QV1iMzfTPJYQeFOz4FsA/Esb04x
	n2HwdCyulJRUfdUGZcgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeGxf-0000zV-S3; Thu, 28 May 2020 11:44:35 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeGv8-0007D4-N8
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 11:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590666118; x=1622202118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JUbfJ/grhJxrmxMI/oPm120rZDkN7Hmpw01cYXHJ9dY=;
 b=s9tqnLELUHvTQ9T+ti1xFtb2WtFnOvxKH1wu5EKxrhIlqp6tWdtAju6P
 J3GCIuS0wF6cz48bSbyNBx4geSXjGf2h6YTQOyZ/jhX67Rc8kNztVsBM8
 YHMglla6YnksH2Ifd4kPNlvnW06i4P8uKMQHJ9bHX3n8kALcPSO4ct3MZ
 +1SwOdw2IfhxqkkWgfr1cZkwG3v41vvyW3fkfoDwujmiztnhyRfFAgsxu
 zYiJLq25946HPCe2iF4bdl120JQy9bcH14b491+95Z+csXZLnpzsdAUx9
 fR5xtVcvJrgR1hz+XYN0sMNlFQBcxtR2RONFa+AonZRPpMLupCytZWc40 A==;
IronPort-SDR: a7pGp6+oj069KOC7r5VWT1Htpwy8sY0tMJV6RYrQoWE1/BjWXs++i3N2cMbUndK9A9eay6XVMU
 L/54xWWPEs655iKicgb2+d3bT8RcAH5uBnDFVq/dST40szQBHzbllKaoYcj6ct0vCJhRnlQL1U
 2xwYvg/o3MsknkyluVGzL8s1j4ouunefDBIfuVJdfygBG+oJpditYWpNEuqZmfucw3y6qUFFjy
 FrGqMydsvE8yFaWPjb6rqXdKx/sC57OLSdixCYOzIclJPobtNMhJE20oZ82fUe5n6GYD1jBoy0
 z3w=
X-IronPort-AV: E=Sophos;i="5.73,444,1583218800"; d="scan'208";a="76630723"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 04:41:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 04:41:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 28 May 2020 04:41:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oftR6w/RzFrsGudlG2dnkuTW1NHPfHwa0tvNSfuJuFrpV9lQvU6uviIZJBmrwidSBk0jZvR04bQZkLpkKZdg0vTAJFJYL5pwqjWP7YZss1VHM3IcywbtH6ZHA/nocjmparBJXqSWscGVUSyUcKrOYEc8bh3maIG2ImDRgBb2IaHSsihQFDbvV8v0VIhBYboidlSAHEdpTdpUB8CRxNk9RZ56FIkJk/Elts2vdkmAYJ5G0E6FgubS/Xs8TZyqJoETqxhscABlMVc18FxQPl1CNYFUyy1FvsVFfibgeZmWDsW1wZ0uIK7JnbBwjuZMFeh05u0HvZQMCxTyDfEY2/Qq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeTYXWsxjySzl0PIFbR/C1JOTy3mq7Z/MvfNUykkXco=;
 b=gwrTB7I4C6JqfG7/g8e8GL91JJANBEzxJj4ud0x13BZC8xFO/9LsyeavZG/8RYp0AmiOO/bxLnpcx0PnOSfVwUVMn2skcGwCb/EBt08th1PP1PpreZ763YkLOiJrIdJNOcQEwZnLgGF48lgRMumA0RhZ5OAYt50svgzKPcyLKKcS3nHgQaPisXjJ5reNSbD8bb6Rfr7XjNEOfcnS6qkRDrQ3z5nuktEQSbzLnJN1IqtxqTKwxlsBs7JejvfRdRDdQj5KCRNlKlFyb4URpttWvaQmWP/n0gLf39MLg1l5jXdlI4pQsWpiSnA8cCs+IvemNSspXpN725A12j4uGrM0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeTYXWsxjySzl0PIFbR/C1JOTy3mq7Z/MvfNUykkXco=;
 b=iLHhQKjsmQLo83MhYUDwPtsl7Q9mDQWa1SReGHKBZDB7tLY0VNdq7TAkBbG0z9y1jOH1HrlhhA4oHekLLwbbeBmfsCb7rFtF5kOfBIjnXNiiuWX5ffMmABUvZm9gMvoYd/JOL+ohR5E+IYdTnwQcRgYHmGGOijlyqHnmWL15iiM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3991.namprd11.prod.outlook.com (2603:10b6:a03:186::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 11:41:52 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 11:41:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/6] mtd: spi-nor: cadence-quadspi: Make driver
 independent of flash geometry
Thread-Topic: [PATCH v2 1/6] mtd: spi-nor: cadence-quadspi: Make driver
 independent of flash geometry
Thread-Index: AQHWM0FZFb5dBCwkWUGeiULRbnlz0Ki9Y2+A
Date: Thu, 28 May 2020 11:41:52 +0000
Message-ID: <1873244.LXWL5g5pfh@192.168.0.120>
References: <20200526093604.11846-1-vigneshr@ti.com>
 <20200526093604.11846-2-vigneshr@ti.com>
In-Reply-To: <20200526093604.11846-2-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af228cdd-6b87-4a99-beac-08d802fc1d6c
x-ms-traffictypediagnostic: BY5PR11MB3991:
x-microsoft-antispam-prvs: <BY5PR11MB3991AD97A483D63F91E9A6A2F08E0@BY5PR11MB3991.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jZR1qZS2xvDLpofo0BT8Wd6U24hLeeVt2O5Lh2cgFr5RsPslq2uAhgQOXrDFP7pZTJYnSm2Hz31hN8b+FjXD7mFNcJS6+nSq8zd8OLcoUvTjf6dqRJBNtVyB8p1xelS/LeT7qMq7mO7R1a6vJzvem9t19EakNhlPr0XYpZDlIrXPEp9LOYzy3NBV+ntdC+CdLg1kyrpTwfmyE1cnmoXcEzfc4FXPdD769SyDteHh1DryxXC7cW1lbGktedW+TpwMddLwi8EItQJB2SufhxU0d2qTihKVyKoLEHDN3q0loKKWUFD2pxWxU7xpAjXU4DpHxJE+QW53kZWGfEO2lpQMz6/8IBQVlHsk9tuRXncqIyIk014MhIsknw3lruhuWtWh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(136003)(39860400002)(346002)(366004)(376002)(6486002)(86362001)(4744005)(14286002)(8676002)(316002)(2906002)(9686003)(6512007)(54906003)(478600001)(26005)(66446008)(71200400001)(83380400001)(64756008)(66946007)(76116006)(66556008)(6916009)(53546011)(6506007)(66476007)(8936002)(5660300002)(186003)(4326008)(7416002)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZMyCWGbfSI2PhMmllIabsxWuaAodLIsWULrXHLgCDqEjFn3iovKqFtrZ/46oW/jtTKDb5V91FeKXkI2pIGzOp9+5AfYcfKv227iaF9bKvj+hC6FSbrMu1o3qu1iDZ6yVSdLQkdMBnZYOzMhVD/MjIIsicxKe7gbJqJKZDNahkxR6QxlEEYqYupI7llFqUNj7q/k70RQJkoslbsnLt5FNp6EDr0Tu/xciPuhyqx1UdUGoi+oyZoGmJ95T+U0PmOI+pA8AOnzJr4t8WUGQV7WAXZAq0ikJnDQ2JdfnEtzlRtlIZYr6Q7j1MqMCtw+SoQ+ykrJOb1e5ww0Ypfo5MlM8LJFQrrdmbdA5RasGHLrlBq3rRptM9MxiRn9qw1s+pxwEM9KEXIqc78wskQJV+tVkXUP80RTiQs0R8QSnh4Z9RIjt4Qp07ts0Sp4t1OdiWzXv4LoOJlplZBFuuCDKFEsRuw4b0FrTR4aKjx7GcEA/oSY=
x-ms-exchange-transport-forked: True
Content-ID: <107AB70B0512164CAB04DCFA413C114A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af228cdd-6b87-4a99-beac-08d802fc1d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 11:41:52.0186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3AGHmC4EdhSFHRJyacN3NRT1uGk4BQTn5eyg1onQAar6Vtnr3nesLGCpICdvnbi71S4U8R74g4cD5p+KU71ImM3rwmTimFkrAGQwVdFIuAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_044158_890853_EE9BDEE8 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: marex@denx.de, bbrezillon@kernel.org, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vadivel.muruganx.ramuthevar@linux.intel.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, May 26, 2020 12:35:59 PM EEST Vignesh Raghavendra wrote:
> Drop configuration of Flash size, erase size and page size
> configuration. Flash size is needed only if using AHB decoder (BIT 23 of
> CONFIG_REG) which is not used by the driver.
> Erase size and page size are needed if IP is configured to send WREN
> automatically. But since SPI NOR layer takes care of sending WREN, there
> is no need to configure these fields either.
> 
> Therefore drop these in preparation to move the driver to spi-mem
> framework where flash geometry is not visible to controller driver.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../mtd/spi-nor/controllers/cadence-quadspi.c | 36 +------------------
>  1 file changed, 1 insertion(+), 35 deletions(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
