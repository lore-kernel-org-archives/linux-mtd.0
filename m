Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6624C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 18:11:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C343218A2
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 18:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTcfwZ1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="E/IqbNgy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C343218A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Och5wi8WuJd3eXCLyiI8dQTNdCfPA/E80YLFTXdDNs=; b=jTcfwZ1aBxnsaZ
	6+AlXp7LKhr5LRbrU330Tpxrzr6M0dhE13gbfMXlV6XMgCZwPA4KMuUCiiz1ThGtFaQCROHnt66UE
	k5xbadVlVJKAuk6nGDqlqmvA1jSRsj8SBhulirjcZGC8O/FbBu4nwhXj49rsvmTvQ0pGfFXaFQGXy
	LQCDlxZkoDjtY6PE41h+TzNYrMYI5rycpoZCzQ/PA/pjeN5uLnzoCo51iD9lmJbYB2IS5Gc3pmY2Z
	ESOdOGMdKeDWIs3SkaUU3ts2AUwB2yr2cIHY98zyhGE6If/yu+MS05TiBv9GoqRoYYYb3xmG4SkIS
	iwphqLOhdRrTYq4BDhwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h729n-0004NF-S9; Thu, 21 Mar 2019 18:11:11 +0000
Received: from mail-co1nam04on0614.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::614]
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h729j-0004MP-J8; Thu, 21 Mar 2019 18:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT3fjJRkJXKU9CRsZaIvhv6cloJxWtqO16jwPLK+OP4=;
 b=E/IqbNgy/u8FPa2zCrMnW2KBkKZ8WeHAIHO6MMeRVIS5UMSLjfWJD3JftSBAxhjp81Nzw2jfYYH5ayrvC00kv+IolpoYhkMJSo8P5mm36eoOp4VrPXooRkPHbcNZxlmuo4KR9BAz8BW/VY30HnvLsnDsK1VtOxKRnamGH5ZGWNg=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3105.namprd10.prod.outlook.com (20.179.136.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.16; Thu, 21 Mar 2019 18:11:04 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::18aa:cf18:b8d3:d77f]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::18aa:cf18:b8d3:d77f%5]) with mapi id 15.20.1709.015; Thu, 21 Mar 2019
 18:11:04 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "richard@nod.at" <richard@nod.at>
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Thread-Topic: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Thread-Index: AQHU4A390EDhLD8/jkyjBXiay9/acKYWYsWA
Date: Thu, 21 Mar 2019 18:11:04 +0000
Message-ID: <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-2-vigneshr@ti.com>
In-Reply-To: <20190321174548.9288-2-vigneshr@ti.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ac5cbd8-fa3a-4198-3b4c-08d6ae28950f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN8PR10MB3105; 
x-ms-traffictypediagnostic: BN8PR10MB3105:
x-microsoft-antispam-prvs: <BN8PR10MB31054D7C477CDE4E5A5091F2F4420@BN8PR10MB3105.namprd10.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(366004)(39860400002)(396003)(346002)(199004)(189003)(4326008)(25786009)(36756003)(99286004)(6512007)(2501003)(76176011)(186003)(102836004)(26005)(6506007)(2616005)(2201001)(476003)(11346002)(5660300002)(486006)(71190400001)(71200400001)(446003)(66066001)(14454004)(86362001)(256004)(7416002)(54906003)(81156014)(305945005)(3846002)(81166006)(8936002)(2906002)(72206003)(68736007)(6116002)(7736002)(8676002)(478600001)(316002)(110136005)(6436002)(106356001)(229853002)(53936002)(6486002)(6246003)(118296001)(97736004)(105586002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3105;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ygGuIjdEisGKx4CzonjOmdNZAJvYWpE6W3tvar1czxyaXGXgKCplaXy4xcdpjk1VwdkOtZOBELZ8K0dDPqkBe7MHA4Sz1DGAJWFSAoZ4A//Sumzj/qijTy3/tZcJDPgfIy7g3LJo//LmzJnESDPkvywU3XHcsaOxkJIAXlFMLgz9bl4aC5QftlYg3R5ekcQt6N5K0XZKQ1pwJVXQErGNm65+5Xh8lHSzXJeo/BfDDFtPKgTZKB6ctaDQ4oG3AcC/OvIdOowkRj86wrQ6FgkHTC48Xfl6Tw+oPhDIbV//ckI7IRX6jh1WRDlXs7/YnQzHbekfqLRtNQP212PVouAotUpp9jxHwIUObq+3hOLzRlKAYkzEIUbFiXg8pFhR18GqBHgKbqjOV20CUpBPeG9oZ13oVyJcK3a0VEKgtlh5t9w=
Content-ID: <58BC4D51F4B1384CB30D55481DDC2F6C@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac5cbd8-fa3a-4198-3b4c-08d6ae28950f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 18:11:04.0731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_111108_052745_400D435D 
X-CRM114-Status: GOOD (  12.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "nsekhar@ti.com" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "masonccyang@mxic.com.tw" <masonccyang@mxic.com.tw>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-03-21 at 23:15 +0530, Vignesh Raghavendra wrote:
> 
> HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
> Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
> can be use as is. But these devices do not support DQ polling method of
> determining chip ready/good status. These flashes provide Status
> Register whose bits can be polled to know status of flash operation.
> 
> Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
> Extended Query version 1.5. Bit 0 of "Software Features supported" field
> of CFI Primary Vendor-Specific Extended Query table indicates
> presence/absence of status register and Bit 1 indicates whether or not
> DQ polling is supported. Using these bits, its possible to determine
> whether flash supports DQ polling or need to use Status Register.
> 
> Add support for polling status register to know device ready/status of
> erase/write operations when DQ polling is not supported.

Isn't this new Status scheme just a copy of Intels(cmdset_0001)?
If so I think the new status impl. in 0002 should borrow from 0001 as this is a
hardened and battle tested impl.

I know other modern 0002 chips supports both old and new impl. of Status and I world
guess that we will see more chips with new Status only.

 Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
