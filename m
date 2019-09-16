Return-Path: <SRS0=la4X=XL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE9EC49ED7
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 09:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06A520678
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 09:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EMy8qBNr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fortanix.onmicrosoft.com header.i=@fortanix.onmicrosoft.com header.b="Qiju+QN9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06A520678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fortanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hksnh/j54p9kN/Ll/D6vqelPArzS59KBfga/jVPTgnM=; b=EMy8qBNrbEKwwD
	ZQCr1iNpv4wnUuyVXjm8EM8zOq7Z/w2Kdv0N1kPQc6kznA18cZn67qhoqceULyr6yM6+ooEMY7DEG
	zckjahLthcO9Bz1Ik8mlrjb7KtdpQUpQ0ZzOnN6t8xyR6dncA/BX+kVAy3Fse6A8UnTqDipdmBt34
	teH+R19MA89aN2guatT3WpdQKpRoepNM4pyuYcZZFg4ZSZmmuKNp88Nnsdqbei0w6L2z75Fc/pURi
	znqT6yo7qsULG+Nb1rcCTX3OugnMH+Htzpn4CzllHQa9pmWtO3LKGhqnee2/l12OIbMCVqqK+Y9uJ
	T6BAGc5vlaAX4Fn1Rr6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9nD1-0002ae-0V; Mon, 16 Sep 2019 09:22:11 +0000
Received: from mail-eopbgr750111.outbound.protection.outlook.com
 ([40.107.75.111] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9nCy-0002Zq-67
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2019 09:22:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH1OcGdVTWSz0QL7Rk1RSyUS54bFexAVGHcIKXGnG4LdGx/+c1ADasmeto8lxJc1ATVikLFmui8L/5e876huImStrfS2h87O4jz4U2oHlnBcGYEueWMwx45VTVIVgMKItUj/bE91LuEE3NWS+4mtbZZVDdYnw8ZmJglKJN+h/GSJ9qMtlPMLhAD1I65LW6nRryj7v8MUOiDbnq8KRmgEl2he0bwAIdyZNLwI2dYjeYXToxMn6wCp8gnzeV3OSPX/X8QjpahulQAcbV8LNouIfsPgi+TbAO3i7ns6RkILJShG3A8Y84dYy8EqyOz0wkI87wL9GsEAKhPkHlGDKeBsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QB5bUqIXMPQJh2czb+k6rvzA+nYSm2iiBQ3/uCKpro=;
 b=kZm8uq4P6Orwl00q0d9/oLezxFYUiNfpukWiK1Uqu6cJ4/Hn3NSSWMvo3ptpWcmCo2+fN/DdGoxQ+lMa8Kj1Mj8Jf9Y0hGG74guE8a038P4Ni6SSbZfPvPlZcn4+pBCivYUEJxfTwEOmy4G2V19ygUzI/O+GzxA7kZDEcuKu0BvMX1oGEmXJWJ/0oMRcLj0SYJ7SHPZj/Qp0hJpuWtoz9SNxir0s7WDWVcJxxs6c9vt+i4D8HdWduYpzR2eWGUaAygXJZiZw8lq+m69B4rQNwN5ePcG/0U2PTm2cDo/IKmrt1k4/VuKidDVMF5VEctFiW9Nnp0IkT9br4pzw2IRliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fortanix.com; dmarc=pass action=none header.from=fortanix.com;
 dkim=pass header.d=fortanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fortanix.onmicrosoft.com; s=selector2-fortanix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QB5bUqIXMPQJh2czb+k6rvzA+nYSm2iiBQ3/uCKpro=;
 b=Qiju+QN9gwQUHp568ibF6RbYExARlENrMVOIF1GKl9o8q7sOw8tgFrYITgcjY0Umi516fEIjXcvwAW+FyzfjxTtWtPbpfQz7mAgi9kCGWOtuy6u0e9vYbv4HBpVXp7+zKr+sWtbb00Mh6DhhRpL0T7E1ur5bNdgIimBCATraYQc=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (10.173.174.144) by
 DM5PR1101MB2347.namprd11.prod.outlook.com (10.173.171.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Mon, 16 Sep 2019 09:22:04 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42%6]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 09:22:04 +0000
From: Jethro Beekman <jethro@fortanix.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Thread-Index: AQHVYr406/tKUl7vTUifobCqeM8uGactRn4AgADRmYCAAAA5gIAAAdcAgAAAvIA=
Date: Mon, 16 Sep 2019 09:22:04 +0000
Message-ID: <f7708f65-1450-ce5a-7dfb-70d7ca4b9df1@fortanix.com>
References: <69f4a8e8-7889-8b00-0adc-7faaef6b42e4@fortanix.com>
 <32ab6570-c3b7-4eec-7a0b-69bc2f7f76dc@fortanix.com>
 <20190916091157.GR28281@lahna.fi.intel.com>
 <e284a2a8-1d4c-2b57-642c-c91f39a5ee99@fortanix.com>
 <20190916091920.GS28281@lahna.fi.intel.com>
In-Reply-To: <20190916091920.GS28281@lahna.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:205:1::41) To DM5PR1101MB2348.namprd11.prod.outlook.com
 (2603:10b6:3:a8::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jethro@fortanix.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.15.248.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c176b43-a701-48e0-9cae-08d73a87568e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(2017052603328)(7193020);
 SRVR:DM5PR1101MB2347; 
x-ms-traffictypediagnostic: DM5PR1101MB2347:
x-microsoft-antispam-prvs: <DM5PR1101MB234791F429CFC390A192F384AA8C0@DM5PR1101MB2347.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(376002)(39830400003)(366004)(189003)(199004)(36756003)(8676002)(6436002)(6486002)(229853002)(53936002)(7736002)(305945005)(6116002)(486006)(2906002)(6246003)(256004)(81166006)(8936002)(3846002)(6916009)(446003)(11346002)(2616005)(476003)(25786009)(4326008)(186003)(316002)(6512007)(81156014)(71200400001)(54906003)(14454004)(71190400001)(66066001)(7416002)(31696002)(86362001)(52116002)(5660300002)(4744005)(66446008)(64756008)(66556008)(66476007)(508600001)(26005)(6506007)(386003)(76176011)(102836004)(99286004)(53546011)(31686004)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1101MB2347;
 H:DM5PR1101MB2348.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fortanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E6o2a8xkfzNVnOqjtsbqN7wQK29wWAA8PMo7l0EN9ouF/S4rR4UfJ/bVMmYZmuScPXuIcTMqv+IeuUmMqfazhFmZ3ItmHQ99SajRKEX1SrYahsCecCTWm2vcRTJfvCNBs/RmI0CI3WK8Vc6ghK9OBSTDfnAFwz6TRafkpBSb4eLd898bamVyUpeyLnhxxzXTpB85HXWH6hC9D2cXjTGzpa14X74q3gZ23TnUZD+oKPceWbUXDksPNFlPmC/hwRl+0eaa3xPjKhTnU+00ErYUFbFSMhi2N40T6njgJRMg70h5IK4JcVTPOrPboHRx7OLC7/Xm6S93WbblIoKZBGqKranFMmyuBttFC2zXFzbtzMRq2lI+cnZs4ZEIC1pZBg5xGozhzPCSzYIUVi1Qte3rJSqAl5wWIlLtaxEMQ7DZEvs=
x-ms-exchange-transport-forked: True
Content-ID: <15EB8697DD72234EA62D5D95C312CC80@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fortanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c176b43-a701-48e0-9cae-08d73a87568e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 09:22:04.5166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de7becae-4883-43e8-82c7-7dbdbb988ae6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MBpCXQoOyLa6sr+cztKinndMmzTE/vrdU0Giu2Bnfaa+RFMg06BOFOgZv7d0Elk/WVht8shsd9kC7zAOt2EduQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_022208_232860_DBB583AE 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2019-09-16 11:19, Mika Westerberg wrote:
> On Mon, Sep 16, 2019 at 09:12:50AM +0000, Jethro Beekman wrote:
>> On 2019-09-16 11:11, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Sun, Sep 15, 2019 at 08:41:55PM +0000, Jethro Beekman wrote:
>>>> Could someone please review this?
>>>>
>>>> On 2019-09-04 03:15, Jethro Beekman wrote:
>>>>> Some flash controllers don't have a software sequencer. Avoid
>>>>> configuring the register addresses for it, and double check
>>>>> everywhere that its not accidentally trying to be used.
>>>
>>> All the supported types in intel_spi_init() set ->sregs so I don't see
>>> how we could end up calling functions with that not set properly. Which
>>> controller we are talking about here? CNL?
>>>
>>
>> Yes, see 2/2.
> 
> OK, thanks. Please mention that in the commit log as well.

It seems obvious to me that the need for a patch may be further explained by the next patch in the patch set.

--
Jethro Beekman | Fortanix
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
