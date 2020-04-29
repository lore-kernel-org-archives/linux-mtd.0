Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B3FC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D55206F0
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LD7N7gtR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XpdOPqOu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cr8sNwT5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D55206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBV6CQLlsGfPX/mPZkUSsVgwJeJG3FjMfVCnLsTr6J0=; b=LD7N7gtRAe6mia
	0ZUS+d25VB4U/svi8wxPKg2eB/nYR3VqP1WZuBvBth0fQTNU8y+KqB7g73wxs/Vs7vdDYhQb+Olau
	dU5SWTID/T5YiLkNDvazOkrq8i+bYJS4HYGOtbv2cjp+ltgo//V6Vz3fgKy/bcPd5HP8S+9DfkwqB
	sVNzN1yKcYmS6UbTEB+n1j2y0mHVOgSLZ9E+WdOJG455cJGj/ya70z79xVsBXdgYJxHVsRmpUOghy
	vCz3pNtVFOXo2gz6i8aICraDJG56eXOUnQAK5bkGcvaQSUi1uA4oXHPbm0LSudz/YsodGZu9enAJc
	DWD4HhACKxvL7vFVSi9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTgNQ-0008Tk-If; Wed, 29 Apr 2020 06:39:24 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTgNN-0008S9-IV
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 06:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588142361; x=1619678361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vxtXkWz0FtRjFtD2YFm0KRJeZvltPaDMX9Pp0g0j5iw=;
 b=XpdOPqOuSrJA4xbLYP4oBEENTUGev8QsHzx6vnblo0cLtYg34pbQ4wuV
 TjC9ZT87YHMpBF2Ed14v4NWDokxL8u0lP0A593GGvnQcUx3nHJCMZ9qxU
 yrQBC6hR6yp/MzQZP9FV8vrRUyQEDW3bOik6uS89x2UqLE4yMtVPzXUUV
 dg+92QmVEtkSFnZRfUPekQnE5LAfowHqaBwvE11sBVXbBEuCWsLwchi9i
 ZpMcVIWYbZ9z7OXVIWwz+a1kWvmVLKxmKm9hXSU3Il8XfIzXDdAiuSXvW
 Eg8kLK2qCJQxyHA07qgVWbKAlMml8GI+EJP3a1hjmDiQFmvj7QVWSrG4q A==;
IronPort-SDR: LuKOuPadwbSto9U2BGbN5nGSjwXd3Cwc/jQiG4fkgAdnBn7DDVzvDXkDfTt2QX2eaXKCkm7eaQ
 UlCnLfL4HG0cQ9XnVeGtFZsTEowERTMSPjaBn+Ic76fTRYrOaF+F1U+ANhZ9fxga37cb8qsyqQ
 mVsqWmnbF8LrA4piuUmUS8w7fQgx88m+vnhycef+bznrPS4Ekkw1l+Lp1fuMlfprMCco0q6Eev
 Qbfm652E0puw9b5cw4Aac1XTEx09clnh1dC0U16GRkHuEBKxwWzsutdgolcxxoJOsVO3GLnV56
 Mns=
X-IronPort-AV: E=Sophos;i="5.73,330,1583218800"; d="scan'208";a="74896253"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 23:39:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 23:39:06 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 28 Apr 2020 23:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kquvVSQZCZSg/IzJkFh7cSXd+4IEmVdUy4BLC2O8TxqoznfdC2yOmyyKFzlHfRd/CtvTxyuy0EUzCPZyBtGSeJmt1fKRzwftRZdNXZCYHEMstHvLeOnAIm3Zo3pDTgX795qL7/FN66f/f1DDywNxja9UUshRUguaaonjKTx8buZ2hZz4kVbl2y97dqgPdGuyiMVSWBjw+uYy0Kd3n+pFORs9auQzVcY5oxUSdkY3+TqVHpeodtJ8ASGjZ5YoEhS+2PZxS20S80C0y7DXvpSTJD7Lxu2hJo/mZ6HgKy3k9WG+ZTam/hCDYkBFgTbdcnDxeiQGKdSFkVnmeR84Zu75Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxtXkWz0FtRjFtD2YFm0KRJeZvltPaDMX9Pp0g0j5iw=;
 b=hH0dPTmxeZlosJraspGSA9Ddqphv6tTB44djckH/15J43oHz8ZdREWRCG3b4OPXgyFTl5o2x+SMU+s1d1SlKNK54zyXVBWRAWkcmP3L3IXIUryqpyjz6WKYWUZuj2qibMR9qNA+Vb4hm/6Z6jqX+D1rjnE0z6p9HX0FD+QfhAcLRWgNSj3iSjB5p6k+qKBBr61z5Iqw9tAGXCwjj/7KodiM0guBRvRhjz+f3W21A7dhAIJanMzz3KXgFKb4NJx/SuvSUUOZ5q5FzX5cgi7g+F9C3u1f4gyyO4sex43ZIfKnQqfOJz45WNsmUP1inUaHv3eACLqiKufjk+lNngNWvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxtXkWz0FtRjFtD2YFm0KRJeZvltPaDMX9Pp0g0j5iw=;
 b=cr8sNwT5BU6YMaKkYcItObFXO8m547NYOVWYl9UGwf8SVbXTZ2osDR32RFStqa18VU2+q7ItgNGrBxXZk3Hy0Lkb6ZD3UrDLI8coK0vD4kSVUQAJjsRYmSXlK6r9562adix4BxX6wFS+QvnBbe2vDVBJBeDn2+DJ6iL84OV5jps=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3863.namprd11.prod.outlook.com (2603:10b6:a03:18a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 06:39:09 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.028; Wed, 29 Apr 2020
 06:39:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
Thread-Topic: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
Thread-Index: AQHWG+EDIWpaopvk8EurQ9gTxEc0wA==
Date: Wed, 29 Apr 2020 06:39:08 +0000
Message-ID: <1796337.6gi5k0bXAV@192.168.0.120>
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
 <2670775.TqFIqkCU4V@192.168.0.120>
 <97ac42d6-29b5-c5a6-a32d-2214f5f5b047@nokia.com>
In-Reply-To: <97ac42d6-29b5-c5a6-a32d-2214f5f5b047@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0701ae86-d9ba-4951-8e00-08d7ec08053e
x-ms-traffictypediagnostic: BY5PR11MB3863:
x-microsoft-antispam-prvs: <BY5PR11MB38636089F6A484129D3AC067F0AD0@BY5PR11MB3863.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:421;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(136003)(396003)(346002)(39860400002)(6512007)(9686003)(53546011)(6506007)(186003)(54906003)(296002)(316002)(2906002)(6486002)(8676002)(66556008)(8936002)(86362001)(66476007)(4744005)(64756008)(66446008)(66946007)(26005)(5660300002)(76116006)(6916009)(91956017)(966005)(14286002)(71200400001)(478600001)(4326008)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ipIhjEGoY4CfN1fGMSH4EfZ/qKjbDN8JMpOTxfKXu25RVwsShSXI4ObSTzXdy2XpKzW9K9wAhuIabETWWXWZ87wPO7lHt50aHUovBfUY0BOVQfKIg5DS9+O0sBpcMcekpsL64Hy29cC00l0hljB1Jf9ZLeGnEb71vIatp2IR0NZ5e4cUx0MTvZj0y08mPVles4pOM7S8gqOM1Z1XKtgoMnTXOXCSJckBggGIoMJzBwvkvXFnRoFLoQr6QASyutTxRT8pJG5XSxliIx7wUPCaCpn0D5t5XONkcb9QVDgKqCKhqJ7J0YyW/YspDx9LCkIJdN4u+xrUWDQM0492ODihDzl6b5jJQyh/UOZ4mUj7rkB2jct+toGR3O0+E1K4wgpRuNHc3MayxNKrEoXVsuD57bC3912xTpR6Yo6a7uDJm+uLhwhk7y8K+dagOKcfBbejBeR1/ZK4rglmdfXrfzKFUiL84bkxumWUKCDCtVTFW+FFU4VsSJNKaGBXTratAaUq+NB80PDwJycO4xMLsY0I5JKFEUX8T7Sk+L8wsCTDnWHphl/OJfs+wX4ACRXeRQkaRd5IkpqePK8DtAQATeBr8w==
x-ms-exchange-antispam-messagedata: 5fTCOHlvQIhiJhjakFH+0IHZzOjY8ILr37IprOSF7jWYU3vt4SAwDFaLtREugf+YIaL5Mn7DC/iN1891NwcAU7B9RtAjDpi61e3sPXGW0UqfcyZzl2qp99lu9ZVpPYN3MZxZ6qw9CZ3/h7ohmNSFdYN8zByltSisW0FzlVKXBztLC8F/q2+e9wOjGF9VzlyMQtWZHtmq3BRDS2GzpF2oCGQ9O+l5KNtbM2sdxhUx4mGkVe5sMfdZf1Va3MiyykSnQRGlB5xN1ceXKNaQF3C5cyUDOUNg8rRZSD5jUAV+s1ZY4k/xVDKqkVKnRloIJMGJ6G7FjCQBhgy18it4NJZR6/q1NzdsTuwyRGZKrUhUWmZ1dtJLYr6v4ApI23P8AjPKuhBFxzE20n6AGjKxq8+H5W2Q7M0Z9aXiPmUmgaH+m96DmSlgxXKVL9sxkglO60pdiUyY0Lh4tz31vYVwUYpl7V6LbBwbxkLVlYGGIn5CTgo77S0E9Vvooi/tQ89Ccg5MkeHaOglfGOZDGSxI9SvKDSGC8rNEal8FE0INq9WmgH8e6i3DfcBnmZlsbyu5p/zvHJoo7Ve7HT/3PrBwR7F4uK01PHiRZsUzzWkg3c99OWNKKsaylywvn430ZrRAGap74Ku8+0ok2pR4JZMkIJ+OroZWH3FyQ3+TUTk6QxOxg8Q5ThR9RtQrwyyp072f0EPije9kSxFni94Tjb4aYw2d2FKy8e2r6EM3dZ2x5NmR1d6u36lfUzqHiTk3JVUHePIH/vmFn4m4/qARvlv4pZradTDMtQj9SKi0zB2tQ+xke2E=
x-ms-exchange-transport-forked: True
Content-ID: <3E0C28CBA2E80A4698EA56CA36573740@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0701ae86-d9ba-4951-8e00-08d7ec08053e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 06:39:08.6504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: If6ZOJJOsX9bfKlQT2Od5UvS/oC0ngAL0pNeTY8eGIGpz2I9fKsSUKX5sq4YFYEwEAvC8P/9y26Ix/gNCx8a3m4XQOr5g5gtmeeL6vAnPCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_233921_705633_EB221914 
X-CRM114-Status: UNSURE (   7.81  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, john.garry@huawei.com,
 stable@vger.kernel.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On Monday, April 27, 2020 11:23:40 AM EEST Alexander Sverdlin wrote:
> > Fixes: c4b3eacc1dfe ("spi-nor: Recover from Spansion/Cypress errors")
> 
> The patch itself looks fine to me except the "Fixes:" tag above, which has
> a potential for improvement. The mentioned commit is not related to FL-FS
> aliasing.

Oh, right, the flash was added with the addition of the SPI NOR framework, 
will use the following instead:
Fixes: b199489d37b ("mtd: spi-nor: add the framework for SPI NOR")

Have you seen my other reply? https://www.spinics.net/lists/stable/
msg382714.html

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
