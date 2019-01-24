Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51837C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E5F218AF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y2ZcIJyd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="oE4itDGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E5F218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmOmcnVtuMD24cFj2fdGuCHN22pSA4tj3D/BeqfVcHM=; b=Y2ZcIJydBNO3rx
	TU2v3TCBaGtx8dtbVl1ToC5v2DNOOrIMjtBtPPTLk7r6bcEFDHOUpzeSwbg/IVWSSsHs+1FJ/GkTf
	bs3rkSsTiJvSb9hp2iZTVAhmU7CIgebgAsVcmf2ZO3kz4+ABv/yskpxNVoevMwawSHXCcuw2/LOMX
	i9wk1uBpNmRLpATNVJB3cJFu96N3PZVw0OhUhjJ7VijIwa04QuPaRMFxAcFiGs8E4eg+UTKjovoMA
	t6RpYoE3k4EVWR2OwEB1ou1J8GUi11JE3DgqeJzo0P/Egi/x/D4kXK+0h6mCybWHU17D55k59hSsz
	NdYKUXlSEQOsJBeWVuTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhEJ-0001LG-S0; Thu, 24 Jan 2019 15:47:47 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhEG-0001Kn-KS
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:47:46 +0000
Received: from mail.micron.com (bowex17a.micron.com [137.201.21.209])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0OFlTvJ018682;
 Thu, 24 Jan 2019 08:47:30 -0700
Received: from BOWEX17F.micron.com (137.201.21.111) by bowex17a.micron.com
 (137.201.21.209) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Thu, 24 Jan
 2019 08:47:29 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (137.201.20.7) by
 BOWEX17F.micron.com (137.201.21.111) with Microsoft SMTP Server
 (TLS) id
 15.0.1365.1 via Frontend Transport; Thu, 24 Jan 2019 08:47:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVjEtALvINLBiyBwW9iPvCK6aT+VrZ/Tc9qp2La+HX4=;
 b=oE4itDGtI/eVHNfZVLuJLt1km7HzilIJT4oB1Efh2Bo/ZU9qDSYe2j5aAqvGdY0DtMLOQoBn8GcGP/M0ug8McjJI08BqPNau0jP+N6TD9OWpCuqnIfrm7/j2aQuZ4ZbD8NgD+WpTNKdtGcK+kNfSN5G7e81b+a7YTMP740SaQ7g=
Received: from BYASPR01MB0031.namprd08.prod.outlook.com (20.177.126.204) by
 BYAPR08MB5317.namprd08.prod.outlook.com (52.135.241.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Thu, 24 Jan 2019 15:47:25 +0000
Received: from BYASPR01MB0031.namprd08.prod.outlook.com
 ([fe80::d419:6aa:fd87:333d]) by BYASPR01MB0031.namprd08.prod.outlook.com
 ([fe80::d419:6aa:fd87:333d%2]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 15:47:25 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: RE: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Topic: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Index: AdSvejlpF3Q6HUqcQlOcRwI7zje2QQBXtvCAAMYyvIA=
Date: Thu, 24 Jan 2019 15:47:25 +0000
Message-ID: <BYASPR01MB003174C6FE221EE7CD5EA51BDB9A0@BYASPR01MB0031.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190120165911.2e42b1b5@xps13>
In-Reply-To: <20190120165911.2e42b1b5@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB5317;
 6:Ssv1n4d5P5EzO74S0+cVC+15yiHxCXoZzu80HNACn/Ezd+OO/Jl/NSDbFw902eVirCKz96pki7dmdbPEsnh8npWJN+wzqdp17JomhHTk8BKdV46/jmLw1TEAAAeiS2T1OnR9/NJqmnRYXc0sHJGlI5vzy+t/P+hZ6YLob036kZyvgXZ7THTAhmHMMa05ozdq2tJw5uSCqmN3m+nVvxcHKHA+vIH9byL93dZpMSa/MrWmQD87PxVcWl9dtBB4Nmaf4CtiTNk+OzUOkbo8mI5MAHheyl51ML1k4pLvv0Fs7TMLkCxzwzaXF7qARaOzHKoLIWoCw+B+60bDq+zJ5s9t123gWZ2g03In3knx3NVK8KKV480JDNesA+q1ua4gAHlfvztYDz+WcRvrHYUfA5qV9cQzOH/UcgEuA53rDYIcIHY9l8OI0JLHDtTHWr3+DnLIX1GAEJvJCR4l/0qxCcb8vw==;
 5:q7eKgS0NcxBi401Sx8/KC+n66iB9FWljq+oDwxzwJT1RNJJ8MyDy9R9h3JeNDV4tsEapdIaXXfsL1pNbCEtpczWKqBLG4/4W81XA0QDB+1i73B4N1LM//TdK7cZLdhb/bfSk3D1wNqLYiAe5EJdsfs7IlrK9WVzBjCgBMi0kXkjmGOuGHiPzNEyF4kYyGEX36DfOu2CevnMQgc48vh1wvw==;
 7:aLBV92AAJ2EOvflqLQfr6TnaMJKsMMSgDr9xzXc51S7bl8EimeSGnwx1UFwzCaORZLw2FHOO6lOKqHe3yHvxpgxaX2OrQJNQDTuFcH5hdM4b377SsmZXv5/C01xezy5D2VZHGntT9kDx0ww597rGAA==
x-ms-office365-filtering-correlation-id: 3ab0dcc7-7f44-4306-3e5e-08d682133cf7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB5317; 
x-ms-traffictypediagnostic: BYAPR08MB5317:|BYAPR08MB5317:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-microsoft-antispam-prvs: <BYAPR08MB5317601FDECA7A70E2F5D260DB9A0@BYAPR08MB5317.namprd08.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(486006)(81166006)(7736002)(6916009)(105586002)(8936002)(81156014)(76176011)(99286004)(7696005)(316002)(54906003)(66066001)(11346002)(476003)(446003)(6506007)(71200400001)(8676002)(256004)(71190400001)(186003)(26005)(102836004)(2906002)(55236004)(217873002)(6436002)(74316002)(9686003)(305945005)(55016002)(106356001)(6246003)(14454004)(97736004)(3846002)(86362001)(68736007)(33656002)(53936002)(478600001)(561944003)(25786009)(4326008)(229853002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB5317;
 H:BYASPR01MB0031.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XNCH+W0EegOzkOXnXA4b4C1AYSUz6IUeTpTh9AOzRFvg8MJjNGJYrZityymq3+GPY++ka58KgqxMASkr8WHKVkgY+GFXdPDUkt8onIRvaqc8KEDlHsYNVoE1bMcHDkT/KtH59hACrOXM9H9U5ZxHfgfM9Z94mSikiEWH+WJdiD5K0c+xfovJuWEFOzxMk0drPZYnVFjJTAXVfT2bW7gH7xFz93w6SUGERTi4e0kShCXS1INGxeNCdwHEbK/G5RC3d6CAXpL4tQTtCpnu2gZnCexP+j1rsI+q0YbgkqlRxXO8em8voGxoJcXG8I9oF4jmzgYGbDK0eeu3kDDggDQhfoZOlRmAsw9s/T/lOSTcVIjlgaxjU0MHB1hcgyKSe2zSt5xVbiZ5KS5KqUgwR/JFyQkMEzJiXjuOb96Wp6HaOn8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab0dcc7-7f44-4306-3e5e-08d682133cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 15:47:25.6368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5317
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24386.005
X-TM-AS-Result: No--12.519900-0.000000-31
X-TM-AS-MatchedID: 150567-139010-700038-702931-704156-703788-707451-707866-7
 01708-707064-780016-705232-701618-709803-707800-703399-704930-700104-106640
 -700476-105700-106420-711432-851106-701475-700398-705431-703712-700949-7006
 24-188019-706290-105250-707654-121588-708797-701146-106230-704421-703523-70
 1403-700107-700057-188199-700264-700324-701384-701594-703176-709584-702358-
 187134-702638-702118-705178-148004-148007-148020-148046-148133-20043-42000-
 42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_074744_775800_7617CB4D 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Miquel

>
>> On some legacy planar 2D Micron NAND devices when a block erase
>> command is issued, occasionally even though a block erase operation
>> successfully completes and returns a pass status, the flash block may
>> not be completely erased. Subsequent operations to this block on very
>> rare cases can result in subtle failures or corruption. These
>> extremely rare cases should nevertheless be considered.
>>
>> These rare occurrences have been observed on partially written blocks.
>> Partially written blocks are not uncommon with UBI/UBIFS.
>>
>> To avoid this rare occurrence, we make sure that at least
>> 15 pages have been programmed to a block before it is erased.
>> In case we find that less than 15 pages have been programmed,
>> additional pages are programmed in the block. The observation is that
>> additional pages rarely need to be written
>
>I would stop the commit message here and remove the end of the sentence
>which, I believe, is inaccurate.
>
I don't understand where is inaccurate.

>> and most of
>> the time UBI/UBIFS erases blocks that contain more programmed pages.
>>
>> Signed-off-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: ZOLTAN SZUBBOCSEV <zszubbocsev@micron.com>
>
>Could you write this name in usual upper/lower case like "Zoltan Szubbocsev"?
>

Sorry for this typo, fixed in next version.

.....
>>
>> +static int check_page_if_emtpy(struct nand_chip *chip, char *data)
>
>s/if/is
>s/emtpy/empty/
>s/char *data/void *data/
>
>I would rename this function "nand_check_erased_page" to follow the current
>naming and move it to nand_base.c right after nand_check_erased_ecc_chunk().
>Please also add kernel doc following the other functions pattern.
>
Thanks, will add in next version.

>> +{
>> +	struct mtd_info *mtd = nand_to_mtd(chip);
>> +	int ret, i;
>> +	void *databuf, *eccbuf;
>> +	int max_bitflips;
>> +	struct mtd_oob_region oobregion;
>> +
>> +	mtd_ooblayout_ecc(mtd, 0, &oobregion);
>> +	eccbuf = chip->oob_poi + oobregion.offset;
>> +	databuf = data;
>> +	max_bitflips = 0;
>> +
>> +	for (i = 0; i < chip->ecc.steps; i++) {
>> +		ret = nand_check_erased_ecc_chunk(data,
>> +						  chip->ecc.size,
>> +						  eccbuf,
>> +						  chip->ecc.bytes,
>> +						  NULL, 0,
>> +						  chip->ecc.strength);
>> +		if (ret >= 0)
>> +			max_bitflips = max(ret, max_bitflips);
>> +		else
>> +			return false;
>
>		if (ret < 0)
>			return false
>
>		max_bitflips = max(ret, max_bitflips);
>
>> +
>> +		databuf += chip->ecc.size;
>> +		eccbuf += chip->ecc.bytes;
>> +
>> +	}
>> +	/*
>> +	 * As for the empty/erased page, bitflips number should be zero or
>> +	 * at least less than the bitflip_threshold.
>> +	 */
>> +	if (max_bitflips > mtd->bitflip_threshold)
>> +		return false;
>> +	else
>> +		return true;
>
>Why no just:
>
>	return max_bitflips < mtd->bitflip_threshold;
>
>Mind that currently, the check for returning -EUCLEAN to the upper layer
>(meaning, there are too much bitflips) is "max_bitflips >=
>mtd->bitflip_threshold", hence the use of '<' in my proposal.
>


Ok, will add.

>> +}
>> +
>> +#define LAST_CHECKPU_PAGE 13
>
>I would place this at the top of the micron_nand.c file
>
>> +
>> +static int before_erase_checkup(struct nand_chip *chip, int page)
>
>Can you prefix this function with "micron_nand_" and use the same name as what
>you will choose for the callback entry in nand_chip?
>

Will fix.

//Bean
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
