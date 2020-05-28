Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E83FC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:27:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF322208DB
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SskrR91c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VBWsJX9k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="bcd120Ee"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF322208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=vrKfeX498FsySQU290AiPhVi2ABwXYKsQSUeHmZyg6Q=; b=SskrR91casXouP
	kOxs4j8f2BkPIIBh12t3JBwIhnMNnOLwiJ5cP7PtMeFq9U3nkkI+egOpRBjMWePhtDIWk+Bm/WjXS
	++w1TlrnYMDXZRaRPl+WAFdk23rjUZvl0xCjdLbBbfo65ZniGIJvRHTp4JahizYskYQP9pQ2L+cVU
	AmvblNU9iS8ucofmumVWBUiEMzIJVd86b9XHLBg34d37kwTXUS43AwHjBq7PqXjeMUaJQeeFJ0L9G
	z+FO4TjYSxmjSlHyejfwaEGU5/X8sbynvxfEF8nHQGo954etC5OZXbdJIURSGuhmVe2sBQbJerp1F
	aOaj/zt1ueh2EbAuXMdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDsM-0000fz-9v; Thu, 28 May 2020 08:26:54 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDsI-0000cY-IE
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1590654410; x=1622190410;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=E6YuUXbH+1eh0qCrp7GYmUjVHYfZSBHsgNZtuNW7PXc=;
 b=VBWsJX9km1Yqu9TA6QDUgfVFwjtqKHRiZL5p91NurtaysTdmhFjQfHtH
 R6Ki5wtNQZ7hVO0ALIcZ/j792pcRX5YSkeH0R1GWznS1JKIcTOPwNhg/9
 YUy8hD7u7Fq5Vvn+PUSNV65cdxLGfgw/rQSbFv/eqntmqQdaHeoc324yu
 IWHHfTv7GYmayxwHdYpXuv+oPuzUDd5/nyeTmJ8l0g4Q9WBW5PqhEqQZs
 sz7u9HnEnVMrjfe1/vaMlPpOt+srHQYE7JT9bCAHBCTbdZvraN44UCyNO
 abdkCc6w9qMVo6YiXNQsAnSOtmwtSTe7wbSQCqil8JuVxTvDDDrKmr8Sx A==;
IronPort-SDR: YctvxTecx+QLNfUq2bJ4A/vX7ge9B86JaQkYS5tNJld/VySeJ95zxOdbrqwM7stSpsTnpzsvB9
 UF+a3ADMHPAki8ZVRBoOAjLjZWV/11u1lL7JEOSO4zUQ9q/MnzWNGBmLz/twug2MjTxQasU6Vk
 V7V1XFIZiMXRxnNt9vrCdaIuSRrGssUBRqtZbe5pORXeVRMgOTtlCZql7yuS0uZBqqlfxDqvC/
 M9pxb2AM/iFFcfn3kVUSOW8ARPrK0QGD5qQHqJnCHa8t9cZ8iPRuWswyq4BX8Kiu8YSQS6hWlV
 cQs=
X-IronPort-AV: E=Sophos;i="5.73,444,1583164800"; d="scan'208";a="138687082"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 16:26:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YadCABcx1sRPvPOQ+iWvs8l1t0Fj7YWAngttwkTj1DKw9XtFYsxM7McPomRydFZE7BDwL4pNg0p2kiyv116VMS814QZRa6CO8RBwXMM2r2fopZPXIfd5QUNHU3X3iKf7AO2tDoB51tfIrvCAA5vK6Jw2jYhsvJMLOB+YIcqCGY/NxDb1lUp3tWEo5BEdQAumWMbqTwZb8IOgD4+mzLpgzTg5ju17kKnz6ZvQcHrQJ3GMcxj9bhKLIuoaLTddZvGIXbpi2KHExkRqEAJBinTI5IkTZwHfEuFH1wsSaZYiYHyt4gsryFs4nwxILhYMRPan5e2y5M0jfzdtc/Qpw2nz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2lkjChe3EYmR9HYCWU6oJauhDhaaRkjmpxxMnv+irE=;
 b=H3j7Dbnjt2LlTdYtTTboXGId5Y301ooVsascixFzH8UpnHe9TBL5KbukqBi4rrFpLBP2fb0N2JYSXcv9ofjfAprnA9yar4oRKmq5pFhTbWjb3ajEjdLORAkfIyKdNRzWLDND4PfRjkeIW0XoHinQNr0NLTisENv8e84/bkbug5HT5GqMEmM5iCnD8aEmo3Qo+7J/zRcjLfq8kMFU2haZKMxGE7P5QeOC6I3gHkegGuc8eAK0l3CWv3E95+TKfnYr1tH4zjlakZD8dicDx0GGCVR+8FmIr8KWt2GzMfU0V2MUl0pfNrhSdJmIC5BWSADdrWZj9W/4rM6SLTYBEvNsxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2lkjChe3EYmR9HYCWU6oJauhDhaaRkjmpxxMnv+irE=;
 b=bcd120Ee0i9Fphdd2Fb3OJ51K7xO21oUtHEiVRE8jAmjgOcoC2vjdjeGOw2xc16g30Vuo6DMvRPmsvzJRLt8mhTzm83HkA7Bk90KBhWey02WNVc4JexpX7k2MvaKt21DqRSfM+lA0imaF/nfHeTjPtlisE9Gfkfeqi+lh9jF7t0=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SN4PR0401MB3536.namprd04.prod.outlook.com
 (2603:10b6:803:47::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 08:26:45 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3021.030; Thu, 28 May 2020
 08:26:45 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Linus Walleij <linus.walleij@linaro.org>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] block: Flag elevators suitable for single queue
Thread-Topic: [PATCH] block: Flag elevators suitable for single queue
Thread-Index: AQHWNMezYzSAX16QAkK9TfQQ6T/8FQ==
Date: Thu, 28 May 2020 08:26:44 +0000
Message-ID: <SN4PR0401MB359826C471B9D331DC79E4EE9B8E0@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200528081003.238804-1-linus.walleij@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8ffc368-cb8c-45f2-6f03-08d802e0db6c
x-ms-traffictypediagnostic: SN4PR0401MB3536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN4PR0401MB3536930AB4E426F3EB4DD3F89B8E0@SN4PR0401MB3536.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kfi9lnl9KxkT0uCT2X6YdSZrGK//23CIA1fFxTIOVgA9Ue9zXZIYuYC4SyGThbKE0AngYCV0bQIr2FprRPaCwvQaVbf7+e1KOnhz13z9xwSsSdCJqEdV9ZpFRjquJOt4j4+lhnhpoyYYm2p6eqAcvf096qHTRZSICZHKSCRpdonTcXPqDoCWLW6EXdfOWR0u7ORSgPAs3H1uolx5LYaUZa9xJrO5fCUXt5rAq9E14XlosLZchJknbXe8LtQaUCGKwNl93i1Nf/w/g/2DydSYxDOhW9bJ5kkf9GILCuqdiYrXcAhWTegtIesuvQM5cn3yh7Q0YYmxFLpwg11pq3Fg1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(91956017)(55016002)(7696005)(478600001)(83380400001)(186003)(86362001)(71200400001)(8936002)(26005)(53546011)(6506007)(8676002)(66446008)(66476007)(64756008)(66556008)(66946007)(52536014)(9686003)(4326008)(316002)(54906003)(76116006)(33656002)(4744005)(2906002)(110136005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xR83zqY2gmdKa+eyio2UcHyp2ljq0a03lgZCGPfdr84Fq3vPAoZ1O1AP13HUBhogcuxIXnYG1HmDQPzy6kAWTIrqq6jZhrg1w65fUNd11BJrBvOhAo81wgeGbinx6RgHjNZAeLUNXHyELU4MNNSW9qqEVmadSttBOnG/a29R4VmxjzYNYc9+ZANr2HVfq0e8uHDblxLabw6TInGGEiaRJhbNvJmevKZV4SWucMA9nzlfmwh6koGzvf29VYxq54JEBQ2joXnZ0lGh8XkUgcLvcIJSje7TbAB8T8mlORir/iUHvJ/SqkTy6gipDAlbVD/v4361+iCF06b990+RkUwo86aP3tEgQSxp9X0fMfYJD+NlAqjV4TwiJ/Begv9y2oNaHktBrLEEJQyWI/i5QWfcQfM+xwTq18ZTX3Ys3MDn6LTtkUqa+N9O6iHznkOy22W3pj8OEl4xCPMjsFDdpxgykHv9+PA9jjk/jhWz4Vu1zHe0bJYeefimcapvWofkpXvH
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ffc368-cb8c-45f2-6f03-08d802e0db6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 08:26:44.8242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jkuZdUfIhco7k8r4YNQWju11SUkOI6eKadltjJIoDnaXIj5MHkQ3NT6uIAxe9+gmlfW4RojLcgxFC9CuBbl6+E6uaTageA16iphz5NuqUuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3536
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_012650_722860_02EF2938 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Paolo Valente <paolo.valente@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Ming Lei <ming.lei@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Johannes Thumshirn <jthumshirn@suse.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28/05/2020 10:12, Linus Walleij wrote:
> diff --git a/block/mq-deadline.c b/block/mq-deadline.c
> index b490f47fd553..324047add271 100644
> --- a/block/mq-deadline.c
> +++ b/block/mq-deadline.c
> @@ -794,7 +794,8 @@ static struct elevator_type mq_deadline = {
>  	.elevator_attrs = deadline_attrs,
>  	.elevator_name = "mq-deadline",
>  	.elevator_alias = "deadline",
> -	.elevator_features = ELEVATOR_F_ZBD_SEQ_WRITE,
> +	.elevator_features = ELEVATOR_F_ZBD_SEQ_WRITE |
> +	ELEVATOR_F_SINGLE_HW_QUEUE,

That indentation looks a bit odd to me but for the general concept

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
