Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5F9C282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 09:25:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A41720989
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 09:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dtkBqFgo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="CWFpzNbJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A41720989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ou2WnZhP3HpOF99fEa+SIGb46BXsAQdWrPJ4FDCqEEo=; b=dtkBqFgoYdVhMt
	4VNuFaDudwc0U8aGD7cyqN9U8PPMmlySQ7gZXfE+5mgxbNwNWVvGElk2lxLH/jIman+Qsvm+YTThO
	eBu3/QY3+H4iXmFVDRfyiN4zOc8nefDwYzNF55JqDKqUotxlUKFueGuukyiUAoj9FwSjby3m8jNIn
	mPP3iXmFMJrqERrmebrreEkUktmD5RSHJJUBB2vtmCdz2tJNefhsJtU+n3opg6LJo9QKdyRYPQ5Ut
	rvLgWTWRQQPa+yx4nbNuJDJaU8GgLSK/2aQvNYtNx8iQjtyX38B1OzPGjAQGFZ+AiKT5BvcYYa7pk
	i47kOcZ33NUtH10QpsBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glVpy-0002yS-UJ; Mon, 21 Jan 2019 09:25:47 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glVpu-0002xs-Uh
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 09:25:44 +0000
Received: from mail.micron.com (bowex17c.micron.com [137.201.21.211])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0L9PSqM024105;
 Mon, 21 Jan 2019 02:25:28 -0700
Received: from bowex17e.micron.com (137.201.21.213) by bowex17c.micron.com
 (137.201.21.211) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 21 Jan
 2019 02:25:28 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (137.201.20.7) by
 bowex17e.micron.com (137.201.21.213) with Microsoft SMTP Server
 (TLS) id
 15.0.1365.1 via Frontend Transport; Mon, 21 Jan 2019 02:25:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvxNppWv6wAl3TLJDn/duxmp8b5sEq+rzZ/5vntPZxY=;
 b=CWFpzNbJ0Ka6RvHjcU1sfhd/D5opNJ6sBUya0rNOSEK5o/BIsvv523w3xvJhQ2JCshp1831h9RLHlqLHS8v4Z0vgXt8nIF7zZCvu/GiMtPf0ycdboDA5jv9j+gbPqzjmrr1RJeL4FCokneSeed4NoR9aplW/oaH5cv/X3V6yIB4=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB5334.namprd08.prod.outlook.com (52.135.241.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.24; Mon, 21 Jan 2019 09:25:26 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 09:25:26 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Topic: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation
 hook function pointer
Thread-Index: AdSvehBLGVr5lZ4nR3eqL0un6737JAABRJ8AAHqmBDA=
Date: Mon, 21 Jan 2019 09:25:26 +0000
Message-ID: <BYAPR08MB453351FB4AF6F99B24865822DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB453384AEAB702223F460039EDB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118234236.0d296130@bbrezillon>
In-Reply-To: <20190118234236.0d296130@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB5334;
 6:s4l4QZoftrv72WLzxY0GyZ9VQqggCJrFvY3R1NNVVvEQ0Be5fhl5buKGt0BF5OROS9Lr4J3p5HVNc5MDVr9hU8oggjD9GVso4BVZFWEnV5WHlpoXOciy+JkpkmZ64vmXIeys77t+T4MQDt2qX9qWx+KqNXmXIzA28Ln9/MUTe43lUoptwli9tit51eznGfsVTcVw5Amq62ByqanEU26/vRwk3i3gevY1NWn7omXedoI5lC5//sNoCF/y37Uu7d8Y5Bm45oEo2ACyB2Kb0zOOjV18RiDp1zP5xljpJLuiSuewmS2SCW8GDiQNEt3Vy27QSZfO8+rP6ejQM0XK+YZlqqe/sBmGm2L1Jb38UrA3qHsqtTyHWM5sa4v2BkEORe+x5/IC/r/cbsHlAOs66RhRZm7itw5svemyddZP0dQlr8yPGm2rNTK1YaNHUdADWY+dKFeMED8TwViKCqQgd22nbg==;
 5:0MayvsjTO6qi7x5K3fsQ9wifGb1wExyNJHYc66oOk8zoLWAnPYeevS8hstMj6W+TOrfYL+XKcDDRFTCc+eSyBmoQQuf0yjVeUrF/3w+xo6ypDSY7+KTJJMh1mVItG2BJqekiEHW4CNuG2fmPyg6szBxdafzS9lyR6+O9WbySmz+ZtCUzuj+zBL8vfiBv1WqrZPtmKu1oxstp62QtWWaA0g==;
 7:GpkPWvJMZg6pcbFqYalios4kwSZxQk/xeDNYOeqm4f5iwGO3wwvae0Ft9S7dFS8quDco8TAPyIkNJRDp1KBoo2aCtWS9D0iXK0VamJbJtEKU1eWFYZIq7fJEfyBcBBVVE4eRmDn2TtBjaI5+5oL0Zg==
x-ms-office365-filtering-correlation-id: 1d1d58d1-0afa-42d0-0db6-08d67f8260b8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB5334; 
x-ms-traffictypediagnostic: BYAPR08MB5334:|BYAPR08MB5334:
x-microsoft-antispam-prvs: <BYAPR08MB5334ADB5A3896880EB0490D9DB9F0@BYAPR08MB5334.namprd08.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(396003)(376002)(39860400002)(199004)(189003)(446003)(76176011)(74316002)(106356001)(105586002)(11346002)(97736004)(26005)(14454004)(7696005)(305945005)(7736002)(6436002)(486006)(2906002)(8676002)(81156014)(81166006)(186003)(6506007)(6916009)(55236004)(66066001)(102836004)(476003)(3846002)(256004)(217873002)(14444005)(316002)(86362001)(478600001)(68736007)(71190400001)(229853002)(25786009)(6246003)(71200400001)(33656002)(8936002)(53936002)(99286004)(9686003)(55016002)(107886003)(4326008)(6116002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB5334;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0GbxyKEg02IbhV+OsCMEijuKQT0tazJ/T9S0JlCDuRuju8bNy2/pQtwv2ie7ei6PdvI2RC8fdpPemRY9XvI81B+xMDJqVQZnglnOuIuzZ+iRIWFW4hkfbbS4ceXAjn+7yM7viPBnzxwzhp3b/tj8s/JXafxqZYefj++ZAX6IzjJsM+OkCg4GHhb5Tb0mmSPW1tTMZ4l84at1/nvcdKoZYdxz/7c2MP/D6/Y1j8uUKvj0A2I3P1XvXEIrn48c1n/qJWQFqYcKiHQTZNzCH/HVXmNIMNLvKSXjPYFtou0eWPwvz+qFY2PD3ECF/uSYVbEUeP8IRbOpnCruPPly6F67Xd9XR7a7DRiO761Aos/1osddtlq6H7aqAZwaQL04Q0EkriTdViR4ZnUd2gUwsI1VcOwTBZ1OkJzuVCTLUdb/5Y0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1d58d1-0afa-42d0-0db6-08d67f8260b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 09:25:26.2467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5334
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24378.005
X-TM-AS-Result: No--0.144200-0.000000-31
X-TM-AS-MatchedID: 150567-700107-139010-105700-701698-701604-704501-704980-7
 00251-707476-701099-704421-708797-851106-148004-148007-148020-148050-42000-
 42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.130.65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_012543_463935_056DBCB5 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Boris
Thanks for reviewing this patch.

>>   *	     is here to let vendor specific code release those resources.
>>   * @fixup_onfi_param_page: apply vendor specific fixups to the ONFI
>parameter
>>   *			   page. This is called after the checksum is verified.
>> + * @erase_pre: preparation before actually erase a physical block.
>>   */
>>  struct nand_manufacturer_ops {
>>  	void (*detect)(struct nand_chip *chip); @@ -49,6 +50,7 @@ struct
>> nand_manufacturer_ops {
>>  	void (*cleanup)(struct nand_chip *chip);
>>  	void (*fixup_onfi_param_page)(struct nand_chip *chip,
>>  				      struct nand_onfi_params *p);
>> +	int (*erase_pre)(struct nand_chip *chip, int page);
>
>Let's move this hook to nand_chip and name it ->pre_erase() or
>->erase_preparation().
>

Can you tell us more reasons why moves this hook to nand_chip?
In my opinion, it is better to add this hook in nand_manufacturer_ops, since nand_manufacturer_ops
Already exists in nand_chip, also this function is related to specific NAND manufacturer.

//Bean Huo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
