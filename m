Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FD8C4BA2D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 13:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD44B246A8
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 13:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jJOP1WRp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ExertusOy.onmicrosoft.com header.i=@ExertusOy.onmicrosoft.com header.b="PueHN7WC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD44B246A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=exertus.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=omWk/OCW0Zf4mIhl6hfwl9tZScP8hcHH0BDgHbjg2Ss=; b=jJOP1WRpfs8y53
	1wBlBjXTjKhhVLV+sAHhvCwJgKsv6GmG0I2zyKkWJhM6saPBZ5XICzbnn7yRQKEBzqrOZ3VeKWt3+
	LBalkXPk+z1ymRDM+4xHkRsEP2hq8havotAo3U2aJtOBskKzjN8cl9NQdOo9anXfENcBtAswBZ+4J
	Y/o/FXoK1cz3QY2l9ZFdCS2pFOvAp6za0OZnssA5UJUQeXNwzwiFoviZKaeyOzissQqyJKR3DEe5m
	fm+k/FopEICCJzC5P25rHxrF1EnnzA+uzY7x/d7xn4CSX/W2dqngxNTE+O1fuOj0KwbFYCIiF1+UT
	12yfkVcIuHPfb93jCjXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Iq9-0000MV-Lr; Thu, 27 Feb 2020 13:04:33 +0000
Received: from mail-he1eur04on072a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::72a]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Iq5-0000LU-Ox
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 13:04:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9C9Z5QLb9e49twRTsAyb/FzOz3peoPzghlycI3eA1VG+0gD0+u8lB9Q/4CFtW3EhbLfEDc2vLyBN/MCDU3/wKQONh7tluX6ku8yjsvB9j6SBhy6xkNxSWK3fqD6qgKgQJzzLAewJVpsUXNAVaNEWhSDb8cpmMiyoMtyZPFYqLTLLg5M1KJ+4I3lPViNHT60KXtCM290U6X+oe0HoMDgcrYGyaILAAuM/C8o7zy5Gtk4BhYgEzNXuDhWBqUKbggZYJOfDjTTF4BJttGlO8ye3Co0mZP8MRTFkX6JkX8uQGjOK2E9aSP9sQOofKigOyAQMUNm0nvYuIoYeW84EXmyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJt8hi3aMmasxe4i0Z3UHMBRN8yZIYtoNP3AFXizLiw=;
 b=NJPCLSgYY1dOck6+okQpuLIsbV2LVG5B3palkZG0w77k2J3hhVmqjR+qJZCdaEMvMkGxcJ2PK5AuyLJX7NlQMYZ929744Wd0gdckY70sRh12zRbW8ah8eKYOlvnHl9CpKGN35GuOZqamyokKkN9bhywrwyfnVSEF6W/YDLuDnj0J3Uh28SAsrvDBBqrA+ejrTKAYjXV0hZx9kZ2vsGXFfawq0SVwUrg644riZKUkvQ7I6wpV2AfwArTEnAkGwQ8psRANqT8oHUJaRvmzHLWeke9OCidsHLlGXJxXHIYmZK6QDxoZk4eUBbJ/cPm7ARbHAygoHGDWAeTevtL6ogyGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exertus.fi; dmarc=pass action=none header.from=exertus.fi;
 dkim=pass header.d=exertus.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ExertusOy.onmicrosoft.com; s=selector2-ExertusOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJt8hi3aMmasxe4i0Z3UHMBRN8yZIYtoNP3AFXizLiw=;
 b=PueHN7WCGZTw0T9DHU4Bo+vcyZfdF8NBeTYly2lL8XGX6BAmS3OSF6j3PPmebjJZ5yXfbOYEokeFODNNUhVNJhoQN0yzHc06LSnag6QcZWZmnNlvAdf5u8ABgo6h0+WIvQ96h+E9p8s6DreMsAmUbQRqT6MTy1qwiG7HNDWnc/s=
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com (10.173.254.160) by
 AM5PR0902MB2018.eurprd09.prod.outlook.com (10.175.229.158) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Thu, 27 Feb 2020 13:04:26 +0000
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca]) by AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca%4]) with mapi id 15.20.2750.024; Thu, 27 Feb 2020
 13:04:26 +0000
Received: from [10.3.1.192] (193.210.47.3) by
 HE1PR0401CA0049.eurprd04.prod.outlook.com (2603:10a6:3:19::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Thu, 27 Feb 2020 13:04:25 +0000
From: Timo Ketola <Timo.Ketola@exertus.fi>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Power cut leads to "corrupt empty space"
Thread-Topic: Power cut leads to "corrupt empty space"
Thread-Index: AQHV7W5w0ROHw32Dgk6RN8346II1lA==
Date: Thu, 27 Feb 2020 13:04:25 +0000
Message-ID: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0401CA0049.eurprd04.prod.outlook.com
 (2603:10a6:3:19::17) To AM5PR0902MB2129.eurprd09.prod.outlook.com
 (2603:10a6:206:b::32)
x-originating-ip: [193.210.47.3]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Timo.Ketola@exertus.fi; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e4d3121-cfb8-41a6-08df-08d7bb85927b
x-ms-traffictypediagnostic: AM5PR0902MB2018:
x-microsoft-antispam-prvs: <AM5PR0902MB201833D941FE281B92CA4BBD8AEB0@AM5PR0902MB2018.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(39830400003)(396003)(376002)(189003)(199004)(16526019)(186003)(16576012)(26005)(8676002)(5660300002)(66556008)(66446008)(81166006)(81156014)(8936002)(31686004)(6486002)(316002)(2906002)(52116002)(71200400001)(508600001)(31696002)(66476007)(66946007)(956004)(36756003)(64756008)(6916009)(44832011)(2616005)(86362001)(505234006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0902MB2018;
 H:AM5PR0902MB2129.eurprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exertus.fi does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X5De7XFU0Kjo2kABhuYR0k99/uMGoePkXryc3XBHh1wLZEj4PlQMNUEKTe7FvKyLe01aPHeXb0LvVoPysW/ajVz0xrrn616iiXexJxi/KMYWbfQkKhB+8D5p8e6cwrrtK33XVCYsL1jXByVj2vzrIYfD3ShZkxSjtU9SsukU1Im+cnkqppn0jLxRdZMP37HvLr4NsI2FacD2yRPXN73C+7BCfCv/gkGUJNKffuOAVgTXkHOtdqgA4m0xGA9/CK+sCQxQll/4WU63FIOx4DOXT6DcN6MhzKwJuza6yI6uh0OtuQIQd+lqc8otRGzW2npME//wPjpKdktMty1PhgW+Jv9ng2moyGz3nWE0VK+6wL8yhprgYyTYm2P8xDwpQdRGbyoC23O4S6Nke/y7gIrqTmMzcL9rGiY7pbpRNIsqE0wzC6MGg0K3exQhj5rjse/6leI8jOWnhp5y7KCY6YrCFEHjSe65Q409LTXhGFttdtH2ajHPUoy88Gmyn/PUt+xE
x-ms-exchange-antispam-messagedata: OHFe3sreYbQfkCJzL5UBFqf5xshG5Z9iIIjnAPs3y7tA1IMLzCxn18pgpnJ8Sj+dg6Kc7bu8xihlHOoCeE8qxpbFSpqkvKA3ZhZ/n6gZluDqkPiX4lbIDZJph/f7LSB7HJejjLDMNe8F6aXhvky5Zg==
x-ms-exchange-transport-forked: True
Content-ID: <6359CBA8829D614693AE7BB8B3356DC5@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: exertus.fi
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4d3121-cfb8-41a6-08df-08d7bb85927b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 13:04:25.9875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ff5ff20-bcb9-4615-b2a6-3bbeefd7b8e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wsJH9tbAekGYRHx1GW/Gh3fI0iwlhy9Nx6G/szwhdWYdL7CaQr/OBUHG1akqFI50
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0902MB2018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_050429_815046_2F030953 
X-CRM114-Status: UNSURE (   8.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

We have a few i.MX6D devices which have corrupted their UBIFS filesystem
on power cut and refuse to mount them any more.

The log says:

> [   10.382580] UBIFS (ubi1:0): background thread "ubifs_bgt1_0" started, PID 158
> [   10.408838] UBIFS (ubi1:0): recovery needed
> [   10.802070] UBIFS error (ubi1:0 pid 157): ubifs_scan: corrupt empty space at 
> LEB 99:114688
> [   10.809054] UBIFS error (ubi1:0 pid 157): ubifs_scanned_corruption: corruptio
> n at LEB 99:114688
> [   10.816471] UBIFS error (ubi1:0 pid 157): ubifs_scanned_corruption: first 819
> 2 bytes from LEB 99:114688
> [   10.824585] 00000000: 06101831 713b7e1b 002e0640 00000000 000000a0 00000200 0
> 0000554 00000000  1....~;q@...............T.......
> [   10.824601] 00000020: 00000000 00000000 0001585b 00000000 0008c48d 00000000 5
> d512897 00000000  ........[X...............(Q]....

...

> [   10.827751] UBIFS error (ubi1:0 pid 157): ubifs_scan: LEB 99 scanning failed
> [   10.834615] UBIFS (ubi1:0): background thread "ubifs_bgt1_0" stops

I think I found the culprit from the mtdblock contents. Fragment from
hexdump:

> 3ca20000  55 42 49 23 01 00 00 00  00 00 00 00 00 00 00 04  |UBI#............|
> 3ca20010  00 00 08 00 00 00 10 00  0c 4d 7c ed 00 00 00 00  |.........M|.....|
> 3ca20020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca20030  00 00 00 00 00 00 00 00  00 00 00 00 cb 5d 1f 01  |.............]..|
> 3ca20040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 3ca20800  55 42 49 21 01 01 00 00  00 00 00 00 00 00 00 63  |UBI!...........c|
> 3ca20810  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca20820  00 00 00 00 00 00 00 00  00 00 00 00 00 00 8d 07  |................|
> 3ca20830  00 00 00 00 00 00 00 00  00 00 00 00 91 2b 87 87  |.............+..|
> 3ca20840  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 3ca21000  31 18 10 06 30 3c 6d 96  cd 05 2e 00 00 00 00 00  |1...0<m.........|
> 3ca21010  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|

...

> 3ca3b8c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 3ca3c000  31 18 10 06 7b 71 87 8f  3c 06 2e 00 00 00 00 00  |1...{q..<.......|
> 3ca3c010  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|
> 3ca3c020  00 00 00 00 00 00 00 00  5b 58 01 00 00 00 00 00  |........[X......|
> 3ca3c030  79 c3 08 00 00 00 00 00  97 28 51 5d 00 00 00 00  |y........(Q]....|
> 3ca3c040  19 58 6d 38 00 00 00 00  19 58 6d 38 00 00 00 00  |.Xm8.....Xm8....|
> 3ca3c050  00 00 00 00 00 00 00 00  00 00 00 00 01 00 00 00  |................|
> 3ca3c060  eb 03 00 00 eb 03 00 00  a4 81 00 00 01 00 00 00  |................|
> 3ca3c070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3c080  00 00 00 00 01 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3c090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3c0a0  31 18 10 06 84 13 e1 a0  00 00 00 00 00 00 00 00  |1...............|
> 3ca3c0b0  1c 00 00 00 05 00 00 00  44 07 00 00 00 00 00 00  |........D.......|
> 3ca3c0c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 3ca3c800  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> *
> 3ca3d000  31 18 10 06 1b 7e 3b 71  40 06 2e 00 00 00 00 00  |1....~;q@.......|
> 3ca3d010  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|
> 3ca3d020  00 00 00 00 00 00 00 00  5b 58 01 00 00 00 00 00  |........[X......|
> 3ca3d030  8d c4 08 00 00 00 00 00  97 28 51 5d 00 00 00 00  |.........(Q]....|
> 3ca3d040  19 58 6d 38 00 00 00 00  19 58 6d 38 00 00 00 00  |.Xm8.....Xm8....|
> 3ca3d050  00 00 00 00 00 00 00 00  00 00 00 00 01 00 00 00  |................|
> 3ca3d060  eb 03 00 00 eb 03 00 00  a4 81 00 00 01 00 00 00  |................|
> 3ca3d070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3d080  00 00 00 00 01 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3d090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3d0a0  31 18 10 06 84 13 e1 a0  00 00 00 00 00 00 00 00  |1...............|
> 3ca3d0b0  1c 00 00 00 05 00 00 00  44 07 00 00 00 00 00 00  |........D.......|
> 3ca3d0c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 3ca3d800  31 18 10 06 c1 6b e6 57  42 06 2e 00 00 00 00 00  |1....k.WB.......|
> 3ca3d810  a0 00 00 00 00 02 00 00  54 05 00 00 00 00 00 00  |........T.......|
> 3ca3d820  00 00 00 00 00 00 00 00  5b 58 01 00 00 00 00 00  |........[X......|
> 3ca3d830  0d c5 08 00 00 00 00 00  97 28 51 5d 00 00 00 00  |.........(Q]....|
> 3ca3d840  19 58 6d 38 00 00 00 00  19 58 6d 38 00 00 00 00  |.Xm8.....Xm8....|
> 3ca3d850  00 00 00 00 00 00 00 00  00 00 00 00 01 00 00 00  |................|
> 3ca3d860  eb 03 00 00 eb 03 00 00  a4 81 00 00 01 00 00 00  |................|
> 3ca3d870  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3d880  00 00 00 00 01 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3d890  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 3ca3d8a0  31 18 10 06 84 13 e1 a0  00 00 00 00 00 00 00 00  |1...............|
> 3ca3d8b0  1c 00 00 00 05 00 00 00  44 07 00 00 00 00 00 00  |........D.......|
> 3ca3d8c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 3ca3e000  31 18 10 06 0b 75 3d 9e  44 06 2e 00 00 00 00 00  |1....u=.D.......|

IIUC, ubifs_scan finds empty space at 3ca3c800, stops scanning and
checks the rest of the LEB for being empty but finds something else at
3ca3d000. Then recovery aborts and mounting fails.

Do I understand correctly that empty space should always be continuous
at the end of the LEB?

How could this kind of corruption happen?

Is there any way to recover from this?

Storage is NAND with 0x20000 erase block size and the kernel is 4.9.88.

--

Timo
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
