Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4598AC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 728AA2468A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 10:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gBo9e2eO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HcdfeJ6S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Gfaq5Vxw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 728AA2468A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3OOUK/nBXfuk8JWerfptxAXAF9VWX3AU04orTvISwWY=; b=gBo9e2eOXVrETRKFLhBJmErWd
	abuBulQZ8IXZhO5XpAoO0EdBdDo1o1gg/l4RbtPm5cF9zpTM7JtZBQGfNrnKu9Ik8k8Ypozmu250e
	jOZ7e+iOR56DBDKk/paOq67wHRij8sClI+zF39pgfoV4gkTv1UA5uvRQmQDGbK6xoPkYxRdofBUP1
	YKY4S2F8dkdwKFUwdWtp87NtMKqcSjgIzadB6zrOZ+1HiG9AhdrfjuDnGG9KHEHDyYIE9b0q+PP70
	9TBtrNC42Xp+L8kq7S7cmsDLIiOvp2fNiiVNd78o8yytBgm4qFbtRUGYjFss+jsYp/6qtdwDhc3Y6
	+S/ZYYBUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXiuS-0001FZ-VS; Wed, 28 Oct 2020 10:42:29 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXiuQ-0001FA-Px
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 10:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603881748; x=1635417748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=MKbYPUFbTw6xyZYVYKjh/PwVLDT7R3BXJae55AVowug=;
 b=HcdfeJ6Sz+o+e1H4+uaHB6jpzqcwnHQwOrkmUWeRy1EbqteUp28YI8MU
 7dTA3oAMPdyk/vRJtnyXW/CwIESqlbLkByHIeIuWXSw1nIqV9mgNEYUCt
 Hhlq4VyVnykJeVMDWSAbewJOmmmU47GE5NaMPVKQ4gTkv/pE4AOnEgu9P
 P/5hRz7zxXsdXnBR0n4b+PFpenebOCK4ENwaX71ZMo/cYtq8D5hcKKc0H
 UL26QimQaYHBdV3lyFe23Zfy2XiD7mCDzKPh6alE37rfoz+OIGUZIhPsK
 M0qxpzTcJWnz+woUsTKzBwhIMR/OPFbsNXrhOi0rOSZF/p4Y9t6MlYiG4 g==;
IronPort-SDR: q2uPi3LXxMoCeOn3xceHHuCbZW1PKZm23YdfFUVKoq7jWw9erimqXrNrKD6CVau0toGl26NIU0
 BUDyVj5owO9bBANNDBOi+2uZh+aQxmuSbv0YgcQpk6BWkeTZnvquEphnDmMLQREZl0NYVg1rJi
 lSZXkQEJ1rQe1OJiHdL0txt8mY5q3Q8Qxx0kJR9CWpBSXKwz7NMsBLHmE9sszacORLpU+78Cz8
 uY80u68nMXK5s2af0oDPiHlfKTRiML6TROwliTji3lm66d/LSfWl3nPoWPkPcakaAwrSIIsKPs
 p9U=
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="96278522"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Oct 2020 03:42:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 03:42:24 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 28 Oct 2020 03:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa4y09Qo/SFrKSTSPWhHqzOBPy3htg/v0gBLxITdYhQfl0K0e/4GKyTe+yszpgx9caAiTKc0uPV3VA5BdNgzmz8vN2deD9VB70Aj+z2B5BpBcyxa49GjrEsfbP91ijlh2KELXGh7tmzzGweg+c1iOKugL9YlLzyzOaK2oBdYMrC0M+Gz9VBbiFWnVjmZ7LYVWSRZxOTyvmt1BUkzjsBsHrfsoDMwVMGfWUYtV9Ac0XVMUP28t5keJ4VPRo37XKM1bX5pkY0dioWoVc5UeT0hJV9UJGeNqw4CGauprfu1TdBLvU3qVsRDZLRZkLVd4mArO/zjMsE/g0oSsX4hON7o0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKbYPUFbTw6xyZYVYKjh/PwVLDT7R3BXJae55AVowug=;
 b=RWm+9UdPBnOHXvfNHNe2Q0kXxllY8fuTb6KLCUHv/PZyl7jh2ZpHvymufHWFtGyrB0pMPyfbWaskm/lZ2c29f3DxQBDxyBzc/yInowsaicHH895FSNy9BTsoxB2G333PUqyN85q/JHgey+/HBKkyAEk5nYv4J4tbWggTM3Te5wCZpKSATcsNwgIlcVKJqlicx6CpUiQ7axtB+dVywEXkiLfddK2o4BeDhYyZtNdpuO5g3NAiQiaPKrGgu4sft8ZsZcwfw9wzbweNzHYGg/D2OvcG/9/LZxocMQ04/BDtamLzfls7Lq3gm6a3cVvhyf4X0J3r5l6/SsicYxiioAqypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKbYPUFbTw6xyZYVYKjh/PwVLDT7R3BXJae55AVowug=;
 b=Gfaq5Vxwwr9ZBXpFgVynhqMltQy4D9kvNzhYVs9mG9i6yC5vsM1ToFBaPgSa8IOt9yg8Uz2cLwxzVEX7AWyPJETe12MLZKEJToIoAXoW6vQjh4E55w9nOwP+abOafgtV2MnV/MzZJLN9kMi+yyX9rdYJr8KraCoB8z9X0tteuSs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2733.namprd11.prod.outlook.com (2603:10b6:805:58::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 28 Oct
 2020 10:42:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3499.027; Wed, 28 Oct 2020
 10:42:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <masonccyang@mxic.com.tw>, <broonie@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <matthias.bgg@gmail.com>,
 <ycllin@mxic.com.tw>
Subject: Re: [PATCH v4 0/7] mtd: spi-nor: add xSPI Octal DTR support
Thread-Topic: [PATCH v4 0/7] mtd: spi-nor: add xSPI Octal DTR support
Thread-Index: AQHWrRcCKnFyq1Y2Y0WUT+dK88VCIg==
Date: Wed, 28 Oct 2020 10:42:20 +0000
Message-ID: <7fdd757c-5762-aa68-cb44-8f12e529fa59@microchip.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.107.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d09a50c-6cdc-4d94-62e0-08d87b2e261b
x-ms-traffictypediagnostic: SN6PR11MB2733:
x-microsoft-antispam-prvs: <SN6PR11MB2733D5CCEF4CB6E4E6527111F0170@SN6PR11MB2733.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OKmA9bM69ugU7pIrtkvYOZTqoBMrwbuvaG1Znb94zMEKpExO1bAI76U7JYsG+jUKwlnzGaeUaSCXpmsGA6Xy7QYskE35Y/k5NGAZY1BtZpOwf2ZH8NOwvd/o4NYgDTGj88eEbxQ02SoRpwz8OLdmhSEh175G2g5ZuOVRdFTzFldD0a3IQVF/xijWhmOY4ioJwU9bmDo5lm6xgDTMVyWognbKwMY2SnI/FGm/UwwfIjIzSmiP2G8Tv43+urC8v+Jn0zPYSD/11P8GxJ1k5E6fQd6eLqoQogC127QVuyugPwwclakeeaI0ckRqT1B3SJgA7CQgJMZdc6boG0YJ9sb32fTRj8WrR2u19I7i7oFFXi3hZgPsRA/VYnmEshq26PTpU7J8LmAOcpBEQwAhm2JEfZfYTVf41XRJTZ/GjtLL4iNm06BCEtjWbOjfA1kqXwnillW+tbaKpqorY1cMNRpyqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(39860400002)(396003)(376002)(4744005)(186003)(2906002)(4326008)(6506007)(64756008)(31696002)(26005)(2616005)(8936002)(31686004)(110136005)(478600001)(54906003)(6486002)(86362001)(316002)(966005)(66946007)(66476007)(8676002)(5660300002)(36756003)(66556008)(71200400001)(76116006)(7416002)(66446008)(6512007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: x8vcexemvtoY78+YjQjrFGrjNiguEU5koPJbX9L+TpfjaIM4XYkm8RrIb1TvRgxNxq1wR4wr04yQkfuGns4Fgel/VFT8F2e+JWVsbvYdrFDnQMZaFXXx57apGov7+rraECsnAg/2WMDlM4u4bjMmrNNapUVQcPGyvveG6a4aJzfWGwtwSiQw+dF1QezFAADsanMXjANL7SgyhZNuSGeGTsWYE9IjZQ/gKBjctgPQbd472p2QnS39jCL/8Mlhvb/S+yFbw2G92HgyvCnGU8BQfOZvKLU26BmaAY5Ruh819cjAeeWFn6FM4t4U4VQezKiQmHGFA9/Wkn3zVgyzOSyIKurBH0GNWQ8KMVVseB0CsPzgBKIuhQg4Ji7Mn0HbLYD3P56TZG9nfZ8gskWOhRM/fL3x9XJV24oMkM/Rp5fd/PTYoSx5PAnw1xPUtt+dCJXSoWpJqgJFWA0hH6I64ACDRX+SSchQUS4/rv/CJQkCBwxQPpCPYDVyWMUr8AlbpCOpD93VkDK7wJUxutIheohJSqbq8TRwhSjuNDgQcDJ1adBUkSwn4XyBfgXYFy5/C8rbXUzExpRMc7XxHujt4tw+wpA7SSCrZ45w1I+ffsW/lnfyZKIsYaC4LO5b/wxQ23BKxDqBwQNw7aSL+lUgOsyJuw==
x-ms-exchange-transport-forked: True
Content-ID: <619B1C5254360C4BADB34C2BB47CBDBD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d09a50c-6cdc-4d94-62e0-08d87b2e261b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 10:42:20.7879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0RB6xrJG0bTb+IBHoq2MqFi0WI3Bt0qZI8rbAmZR3yh9qkXybz4N8RlL5uSd/26HT09JrxEWh+Lxl4gTwlVwsII28yE1iMi4m8EcKr+aA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_064227_048478_88EABA60 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.yadav@ti.com, linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Mason, YC Lin,

We'll have to figure out how we can best use the "Command Sequences
to Change to Octal DDR" table.

Would be great if you continue to work on this. One has to
rebase this series on top of v5.10-rc1 with Pratyush's series [1]
applied in advance. Please let me know about your plans with this
series.

Cheers,
ta

[1] https://patchwork.ozlabs.org/project/linux-mtd/cover/20201005153138.6437-1-p.yadav@ti.com/
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
