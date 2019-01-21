Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95598C7112F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 12:28:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5482084C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 12:28:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pJfTZhZd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="A6fT+XCR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5482084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDLAxO18H/2ncEI/6nA2IxZBMSjxWXFSxBcTkMkSums=; b=pJfTZhZd40erMy
	geL5OD9BjRgIjc7OXWTCCpsIH+P69xWzqW9W9MqSpJsVZ9YA1o6p47e7XmAfgIm3A5M1/cE1+GVqh
	GKK2+3k1fsO9GhC5CghfhhFP+FOuve3HhW4qpOVVMFKXjlF2AXrERkdONipD6miQzFsYH7QZFemvP
	1KRRoubc934UEglyNTqwJxhIlHEXF5iPCpmjwaBCVbPIMIUA+zNHscKKhVOwdo/w9EeY8Zl1c47Jq
	BnFPEsaGalo9kG0tJhNKP1ZmgqEWuwPwR3Vm1wN/vvI86huei19nS6dh6TuPRJXcMNo6/ozOxrLPJ
	YIKlSsIwe9cZDzhO8X9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glYgx-0007PW-0u; Mon, 21 Jan 2019 12:28:39 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glYgt-0007P9-F9
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 12:28:37 +0000
Received: from mail.micron.com (bowex17d.micron.com [137.201.21.212])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0LCSKia016283;
 Mon, 21 Jan 2019 05:28:20 -0700
Received: from bowex17c.micron.com (137.201.21.211) by bowex17d.micron.com
 (137.201.21.212) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Mon, 21 Jan
 2019 05:28:20 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (137.201.20.7) by
 bowex17c.micron.com (137.201.21.211) with Microsoft SMTP Server
 (TLS) id
 15.0.1365.1 via Frontend Transport; Mon, 21 Jan 2019 05:28:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1xLzccUIlGFJgFldsuYGKYTIvc6vXZ8HBZ8oe438+0=;
 b=A6fT+XCRD8nsltmjpg++k2fKhNPBoSnOjyfMq3pK3IIu7lje8o4Ye7kIbhIb6y0rSuB5SMCgEJ7inEcWilElT82aQ1DIRrlkg4yeSRV8VUa3urK0waa1Efp7s/NEC4vsul/W+2tQqTgsDmFrxVgvrw94/2Xt33jBLi1WwP138OM=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB4551.namprd08.prod.outlook.com (52.135.234.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.25; Mon, 21 Jan 2019 12:28:17 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 12:28:17 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: RE: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Topic: [EXT] Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Thread-Index: AdSvejlpF3Q6HUqcQlOcRwI7zje2QQABHseAAIBLtWA=
Date: Mon, 21 Jan 2019 12:28:17 +0000
Message-ID: <BYAPR08MB4533ADDA97A62DF732E565B1DB9F0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190118233943.5f003eef@bbrezillon>
In-Reply-To: <20190118233943.5f003eef@bbrezillon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB4551;
 6:jZNwhPfex1SCW+KJRDW7L2Prs7HwedKR2e6Oy4k2uD6N5cyEJ/U6lEGrXV0TvwEV0sV9os5ldB5WmWJH2mC/gx+UmYDXNw1+gH34GstetB3MDWQcPb352sh2fDuCpHeuCXb/W/yjVEg5mD4LtR4KxdjULkK4o+SxlFUJg6chJreSnRl0NoPcyhUozGUmqwEoCbkHzRWSKVB6KTaYtkrTRKP38bgOr9St7AKA6AEUupsByWiToVr5U8W+t+zFF1zo5YTo8sb/HGYlefFp3SXZwI60h4H+soUUYmeRWLaZtnCYq4mv/QzoXnV1kHnjquh94gSQqtnDv793aGMtj5sWoCmitXkGctpmswI7Z7SuDmEVGIRP0Yl0cvLFkpkmf9zxW7LExY4nF+13yQqZnF+ba2+fWYjsGTCMU64v1ts7v2SwdoMtN8BaacxAXcne7oxJxO0LSvxs3AyM3CYSoEddJg==;
 5:jtPCQIDOG+39gZovSsru2uZKV87uKuZoPbk7rNGhiqYBze3Z2fYbP6eBKY+OvNzpj5pXIY4gTw9ZBGSvdvbUIHoSrIQsOeF05iWBQxu8op/fUPP9lem7zsqyufq0nKL38Z7lTTJouGt4KVPdW97wr4pQkwpn3F+9tQVE+vgS5tp/UFg1ktk9TfSswWzWREKNoiR1jMiGMJhdrh3zEj/eJQ==;
 7:sN9z6eGJ4CRoqZHKCTpLZ77sJoZGLW7ONejcIv/O0Tr30POj3/gvFdFJ2wgUBoY+M1amwbYsITiT0lvulzNOlIlJF28jso73Uf9ZKmPT4d98NOsGuHjnmRkGH3Q+KX1L0kSC9IYy6fTwIsz2OTANKg==
x-ms-office365-filtering-correlation-id: f38afe91-df07-4bcd-7dd2-08d67f9bec3c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB4551; 
x-ms-traffictypediagnostic: BYAPR08MB4551:|BYAPR08MB4551:
x-microsoft-antispam-prvs: <BYAPR08MB4551EF95AC9092157AE4222FDB9F0@BYAPR08MB4551.namprd08.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(136003)(39860400002)(396003)(199004)(189003)(68736007)(9686003)(478600001)(316002)(86362001)(105586002)(4326008)(76176011)(97736004)(446003)(107886003)(106356001)(74316002)(11346002)(55016002)(14454004)(486006)(6116002)(3846002)(6246003)(476003)(53936002)(26005)(102836004)(6436002)(229853002)(14444005)(256004)(8676002)(8936002)(54906003)(6916009)(6506007)(186003)(33656002)(305945005)(99286004)(25786009)(7736002)(217873002)(81166006)(71190400001)(71200400001)(81156014)(7696005)(66066001)(2906002)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB4551;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uI8/rBmPtKzPFkmQAt2OklaVOupYVwhrfjEEOHMsVkex81vrvtmVElAeg16tduB5VDu3E57n5px/+gF+WMqjHEvi/YcM5bSQVTpBqpD1Z6eoNl88lgT39aXQvX9kdF0PMEeMy2K8TbO5hNFzUHnDtn/cXrDtfsyOW+pZM8VNCIy3rLOppkn5jx1coNEUUTCCnL+Dc0+Kq9en5ke12uf1iIjwXCc57AY8nhVIUWdPUrYwbZvuMKrznFVOxybUDn3Q2cGUjU4/RJg98t3KeC/DL/9Vdl+vPW3J9XepJ82ko2uMcDeqpJLbaFweNw1HXNjHSzc0QyvYbQMXG+S6+oy66SZ878yoJIQb7gH2p0DLy7dNH8j3urZ+00iMSNvYcdGOtdIKGDdlhtriRILzA2Ei/ofrn2fWEnPo29aIXXsfiGI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f38afe91-df07-4bcd-7dd2-08d67f9bec3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 12:28:17.7518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4551
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24378.005
X-TM-AS-Result: No--13.900600-0.000000-31
X-TM-AS-MatchedID: 150567-139010-702931-700492-702020-705861-704156-703186-7
 00300-701619-701291-703523-703399-105250-703938-701436-701594-701305-703355
 -704935-709584-700104-710837-700955-703712-708733-710245-704980-121169-7002
 64-188199-709755-105630-707654-707325-105700-712264-702126-708325-700042-70
 0756-700023-700433-700889-700782-148004-148007-148020-148050-20043-42000-42
 003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_042835_605713_EAA4B5C4 
X-CRM114-Status: GOOD (  15.56  )
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

>> +
>> +	 /* Only for legacy planar 2D parallels NAND. */
>> +	if ((mtd->type != MTD_NANDFLASH) || (chip->bits_per_cell != 1))
>> +		return 0;
>
>Are you implying that all your SLC chips are impacted by this issue, really?
>

In principle, all SLC NAND devices can show a sensitivity of the erase operation 
to block filling prior to erase. On certain devices it is almost undetectable. 
Nonetheless, given the expected improvement in robustness and the negligible impact
of the patch on performance, we recommend it to be applied to all SLC NAND devices. 
This will simplify maintenance and minimize the risk of mistakes with parts requiring
the patch not getting it.

>> +
>> +	data_buf =  kmalloc(mtd->writesize, GFP_KERNEL);
>> +	if (!data_buf)
>> +		return -ENOMEM;
>> +
>> +	memset(data_buf, 0xFF, mtd->writesize);
>> +	/*
>> +	 * pgs[] contains pages need to be checked. We firstly check
>> +	 * page13,because, for the most of cases, PEB being erased is
>> +	 * not partially programmed. If page13 contains data, we directly
>> +	 * return since it is not a partially programmed PEB.
>
>So now you say the minimum amount of written pages is 14 not 15? In your
>previous patch, the magic number was 15 (and the commit log says 15 too).
>
it is still 15 pages, page0~page14. But it is now odd pages, there will one less odd pages than
even pages.

>> Otherwise,
>> +	 * then we check page0. And if page0 is programmed, and page13
>> +	 * is not programmed, then we start to check from page11, page9,
>> +	 * page7, page5, page3 respectively since the pages of PEB are
>> +	 * programmed sequentially.
>
>Looks overly complex for only a small gain. Did you try writing X (X being 14 in this
>case) pages all the time? If you did, how does it compare to this version (perf-
>wise). I suspect that reading pages before potentially overwriting them will
>actually take more time than blindly overwriting 14 pages with 0x00.
>
>> We olny check odd page.
>
>Why?!
>
>> +	 */
>> +
>> +	char pgs[] = {13, 0, 11, 9, 7, 5, 3};
>> +	int  c = ARRAY_SIZE(pgs) - 1;
>> +	int i;
>> +
>> +	for (i = 0 ; i <=  c; i++) {
>> +		ret = nand_read_page_raw(chip, data_buf, 1, page + pgs[i]);
>> +		if (ret)
>> +			continue; /* Read error, we just skip it now. */
>> +		if (check_page_if_emtpy(chip, data_buf) == true) {
>> +			if (pgs[i] == 0)
>> +			/* page0 is not programmed. */
>> +				goto free_buf;
>> +
>> +			/* Mark page need to program later */
>> +			empty_page_mask |= (1 << pgs[i]);
>> +		} else {
>> +			if (pgs[i] == LAST_CHECKPU_PAGE)
>> +			/*
>> +			 * If page13 is programmed, this block has
>> +			 * met the requirement of robust erase.
>> +			 */
>> +				goto free_buf;
>> +		}
>> +	}
>> +	/* Corrupt page0 and page1, in order to simulate an
>> +	 * uncompleted eraseing scenario. Just for case of
>> +	 * power loss hits while below programming. in this
>> +	 * way, the PEB will be re-erased again.
>
>Looks like the "erase the first 2 pages" thing is here to corrupt UBI's VID and EC
>headers. Is this really needed? We should definitely not assume the NAND user is
>UBI, and that's exactly what you're doing here.
>
We must deal with all sorts of power loss, if other NAND based file systems
Have the same behavior with UBIFS to deal with un-completed erasing.
This is not just for UBIFS.

//Bean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
