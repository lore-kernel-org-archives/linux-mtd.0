Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7CDC35249
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 08:12:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E9812082E
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 08:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PvqLSGms";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=niko.eu header.i=@niko.eu header.b="x9BjnilQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E9812082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=niko.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1GOiIziDaUhv1CSPIuxwn4CInyx4I772a6dmROTTmPs=; b=PvqLSGmsdO+BIsesHMtsQ9MbB
	I0B0ZmUH0/h9vlXlqkc8pncy6hUKkpVXE0V3ait1VO1sW5USr11KDN72whTC3rDTwC/2YIg4hYdP9
	+2J9irIdoGmdmWta0ILjc1qsLh42tfYmtkNqVHsc9+zePR9c5KFjU0VSDjSucEtnPxhMTQfyjUcR6
	8TtJiM0bKUEko/s8nLFAexjnPyxQP19nZoZb1PBTJ2V6YtLOSgzUtpBiy4ENKPI/zE1AFa7j2XVMX
	oEptM2fAKIgocSdtH2Sc4LW24e3tdNDDnfWcd4tQkYApXt9c5gRCO7DEp1RpHqTQv+agVEjAIsV9S
	cy3b7s1/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izFnQ-0006KS-Qq; Wed, 05 Feb 2020 08:12:28 +0000
Received: from mail-am6eur05on2089.outbound.protection.outlook.com
 ([40.107.22.89] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izFnN-0006K0-3k
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 08:12:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtvHn38gAg796IfAzKDX23SAvNX8CIJaqC39h5a/id3Omon44MKCMsAOVpQvqKdvk6C8USgMIyYuACHBbWHcdv2BAP6MnIsyQWK/SYFyPoYnmnmE6FHoa1i88GOQLZGTi8/iuRCH9YArz1ByugX4aV9db6vO9hjuujHzet9v4VYyEY2jX7THEv70Ux6cVs9U0KUocoXstmPQMcNcYqVVcpzk3nNd/MFF6vKt7vSVYGRed6uKxwTdEEghRMGFwCZoRlVwC6XbQDXtkMn7mGjiV+gR4AVmURKcIBslBuHW0HiKZForiSuBzX3Hb4AqUMGgZwnfxp/C94HIa8xO8S+/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5L9Du+dVOcznlHUcgXPpe3pgoro/TFLMZolUmwYj+M=;
 b=AqowDVfW4z5CpTflR3pPLJ0dAoBk5pbL7IUKZ3FF5JHizlCFkMeqQ/OgFrmolytOh8OWXd7R80+KlQcx6kVsC6lAsmlcco99iDRwPU6C98aDTCbCLQlobnSnzC1VPXzF0W4hBh9shzRYII1fJVJ0UiHtm2Yn/BkDYDeQp/sUfoeUOMNKOa+ur6WKF0/CoFkzhRc88lSodVGQLCnmtNHGq5kJjLLrCuUAU9ZOzBS2Zd/CheFEx1PbZ/+6tdL1EB1QkVf754AuWqXbedl1k2YwwXYbdfOQgCBCLsuDwZm2Cj1QpEOqH4OSBvdLGvdcQlNssaZsXs9l6BCdK835BkRm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=niko.eu; dmarc=pass action=none header.from=niko.eu; dkim=pass
 header.d=niko.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niko.eu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5L9Du+dVOcznlHUcgXPpe3pgoro/TFLMZolUmwYj+M=;
 b=x9BjnilQK4XDk2AjBL7fL4bSqHUcmYeAPUlvHrFdcUNQrVF3hGLNHtAiy24Q3SXa/hk+GkhMNbHkdr9ThoO6Wi5fcZzG2bBc/J1qyg5U3UHRfYhpfe2UyJS5hgT9FFpNfbEbw4rr9FpJsuw4mV7hiy5j8OZrF7by9PuLL/taGzc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jef.Driesen@niko.eu; 
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com (20.178.82.86) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Wed, 5 Feb 2020 08:12:19 +0000
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::2c29:d125:7cf8:8b4e]) by AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::2c29:d125:7cf8:8b4e%7]) with mapi id 15.20.2686.034; Wed, 5 Feb 2020
 08:12:19 +0000
Subject: Re: Corruped NAND booting for all devices
To: JH <jupiter.hce@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>
References: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
From: Jef Driesen <jef.driesen@niko.eu>
Message-ID: <09505ab3-a51f-e0aa-1610-1ea1f106eec7@niko.eu>
Date: Wed, 5 Feb 2020 09:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0074.eurprd05.prod.outlook.com
 (2603:10a6:208:136::14) To AM0PR08MB3874.eurprd08.prod.outlook.com
 (2603:10a6:208:108::22)
MIME-Version: 1.0
Received: from [10.47.50.82] (81.83.24.121) by
 AM0PR05CA0074.eurprd05.prod.outlook.com (2603:10a6:208:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Wed, 5 Feb 2020 08:12:18 +0000
X-Originating-IP: [81.83.24.121]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bf04dc6-214e-4298-d467-08d7aa131e5c
X-MS-TrafficTypeDiagnostic: AM0PR08MB3650:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3650B0111B60DE14FFFF4582E2020@AM0PR08MB3650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(376002)(136003)(39850400004)(396003)(346002)(366004)(199004)(189003)(81156014)(8676002)(81166006)(8936002)(66476007)(66556008)(66946007)(5660300002)(2906002)(36756003)(966005)(956004)(2616005)(16576012)(110136005)(44832011)(52116002)(6486002)(478600001)(31696002)(86362001)(31686004)(55236004)(16526019)(186003)(53546011)(26005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3650;
 H:AM0PR08MB3874.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: niko.eu does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RPpHwoYwBEz5+qsRNFO0v8MMaQN0popDNCHivGEF8EnHHDKb2CjWnoS0AIlNC8w0Kehs5FbsNfJvZF7TMvUFQ7PSTj/59r1ZySDl7d0txRL6//j/8xzy5UgQ7hkgOUQ0bZqFsP2qPWxaIV/PLplzloswgZkQmnwACYvY+sUjsIPtyPEJcK7i+QKIhIe2WG4/rgwWlqzygMHQdM1hGSe1+RpkAAY7Ltj6JEg1LzL/hkeMYzOHqU4TX7usMMW+XugJMImxkan2wQJwQCq7Lsw6TNgGxJMl0sjy4F2hjeY/Hq5ThY/C4BVu3w5ia6V4DCeyE5F13Qi05J8F4dGWY2uCwyQ4MucsvlTR+RQqI7PTrITh2yWiq8ERDyy9qFUp1Npe0FV20+poczYPxdY7qTtquUzjn+Jx+HMuQ2dW1mv8EBf9iEv1cSktfULXeHpLFBSP79C1YSMjYn3Px0BczK3luoi+3GvhHhweG4LtzpvTKoRLV5YKRm35RDBnh57j7SC3xeAvtQaUvP0GEIjnDVOAblq6BogWANJOM+hsjQbq88iKAuRCLNxH82iTbglaBxqF7YBvZyVRvmoq95ZZpJEC7wP8OO59qPDOC3O3JfL55ifUh0Gd5bE4PagasWGimT8YStBFXqrePjRDrnPC9EA16OqkqRWcgnUMmIkPGLFtymT10q812h6V07+k0jmlW+oDqqcMY4xsJHy9SUKxWNaHAK7nLSSjA7hsvWxS1A9Mlbo=
X-MS-Exchange-AntiSpam-MessageData: BhlQBOkEXfKHlf07EK4DWqKEZMjliU4B7k6hn9NZBYBexNGUg8QxPYcowBPqzODAb39dTYh9m4T38yAaFQCbRwjcTm1eqod1jCPIjat6v0fuVgoVsEgq8J37wlQIodOieXOVI0WMhmPnP/e7LwYDyg==
X-OriginatorOrg: niko.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf04dc6-214e-4298-d467-08d7aa131e5c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 08:12:18.8764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4faf0fe-ff3f-4912-b675-3cfe1470e385
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS5tNipQMmsmpV/HV1cmxCjjIJqiBiq6JjRkllKeEb4VOl6+QmxSu9JWeUFXZMr4uk7BnEdPQ9guGQkQHfrjgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_001225_364433_FCA8AEB3 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/5/20 2:43 AM, JH wrote:
> It is a bad day we have 5 devices failed NAND booting all of certain
> today. The 5 devices running kernel 4.19.75 on iMX6ULL customized
> board, the devices had been running for weeks, the device DC power is
> supplied from AC via ADC and regulator, we turned power on and off
> several times when installing those test devices to test boxes in the
> last couple of days without problems, then they all failed together
> mysteriously today. It could not complete the booting to Linux user
> space, so I am not able to log into the user space to check and to
> debug it.
> 
> ...
> [    5.915558] UBIFS (ubi0:0): recovery needed
> [    6.777033] UBIFS (ubi0:0): recovery deferred
> [    6.782640] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
> name "rootfs_data", R/O mode
> 
> ...
> 
> [FAILED] Failed to mount /var/volatile.
> See 'systemctl status var-volatile.mount' for details.
> [DEPEND] Dependency failed for Bind mount volatile /var/cache.
> [DEPEND] Dependency failed for Bind mount volatile /srv.
> [DEPEND] Dependency failed for Bind mount volatile /var/spool.
> [DEPEND] Dependency failed for Bind mount volatile /var/lib.

At first sight, it looks you have a read-only ubifs filesystem, with an 
overlay filesystem backed by another read-write ubifs filesystem? And 
that read-write filesystem fails to mount after a power failure?

In that case, this sounds very similar to the problem I reported last week:

http://lists.infradead.org/pipermail/linux-mtd/2020-January/093542.html

Jef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
