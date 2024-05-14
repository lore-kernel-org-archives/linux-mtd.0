Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ECC04FFE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsfyUvH4zBXGiPonzHmaBw7LNiCcUhJ3GZXUCqA7OiA=; b=FrV1KIDv81HkP2
	uc+S2EdEOryhayhpbOLBbcIgy6mzajBUD8E++aZJB+SCx3JL57i3XX0HLgNiYyKv9iTouB+BZ9PNP
	nsnU3FlDh5meDErJJFApTWPMIu5FcDW0xo7H5v335AEH4xz+UIVqWfwklcv/z1erVGxRX2VSxsoL6
	gfUkywyCyIoJQYg5pQ4Xs1JPND6L4eoAkjAlBEEjw2XAm6N1MXGk5akWQL3/ya3Y/uhYvubTwPmI9
	/MScaQttdPYWFsz0anYLy4e7obVMHF78vmwqK53c7E4I/9ksNOixce9cTACCptUfAURPLiAFfqE0Q
	PyfnEYOKhwG3fQV+dXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wPZ-0000000GkeI-0a8U;
	Tue, 14 May 2024 17:58:01 +0000
Received: from mail-westcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c112::] helo=CY4PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wPV-0000000Gkcw-1OA7
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 17:57:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTi2ASqDqalzjcqqIMXSsqIY08EjM3Qpc7lME0OefJJc//1ssb/Xc7sfISBmJlNL9/pn6YFBIuF8HobVamsZpOOhT2qu4ll112v3/KPHh2aEBaSPN/bRjcJ3ftQaO8OA7NhZlLPHNX/PIlPiN6+fbmiO42q+NP+LlTs+p66p+xw7qVu6pKmHXt7nS51P45/Brf2LOsx18TwEhqzUp0mv+9M/1V8uDWMhy/CQQp9D61+2bbiZH8qZs8F2BpJPSj8WGD+R4RM8wmYoFKjDmWDUjgOOmC6TbIl0daf2u5XqsrQdHJ41I6P98F0AQyqVrJ0XDjMRCRyLvJg36dTen0O1tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwcbqoUg/oaPkdKCMgsExNVuyjgSo0fNCQkjHrh/d6w=;
 b=R7sEHbEz02x1mANhhkZsUHEY67lIcoH6Oc3ooqfq55wrRIpFCquMkUDZ82DiXLTX3VtF89gcU7ejHAqpOAU3yqslRXq7+on6A07uFpnfxZjRtvNhjO7zAD8OfCO4/QJTUeHqb6q6yi8ceTmv84D1L9gTgctESMNE1BAE1KW4smlQWkJ872AS6nWuy/KZKXG2ShhYCGRZ6u2mWX8hyY4US+dLy3zgH2PXlDmxZpilrnSHJ1NY7YPk5m4I0Se6G/Zda+droWRh+qcZbRQ/yhLe6HVLZVcK8e7V5S56gSKfk9dLp2+6kSattZA4NDlNiDyS+QF5NpQzHsYdfojhWuMFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flightsystems.net; dmarc=pass action=none
 header.from=flightsystems.net; dkim=pass header.d=flightsystems.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5447408.onmicrosoft.com; s=selector1-NETORG5447408-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwcbqoUg/oaPkdKCMgsExNVuyjgSo0fNCQkjHrh/d6w=;
 b=yWB568WoiuWxXhjyRXKJOVShr2oK4glWJCj0DrDF0SQFqM1NX22zwtzgqyY10Dxud28ZsQs3OGsyqOZ5CZEZEhQulhK3s9SSdBDsbzqKbpLhnkoLN7Ad3jez+ATB7j0rcN6I2qhubxhx6tUZMMY94trFIdtcXzC1q51wULllO6I=
Received: from DM6PR05MB4506.namprd05.prod.outlook.com (2603:10b6:5:97::17) by
 PH8PR05MB9989.namprd05.prod.outlook.com (2603:10b6:510:1c1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.22; Tue, 14 May 2024 17:57:47 +0000
Received: from DM6PR05MB4506.namprd05.prod.outlook.com
 ([fe80::d1cd:f671:63c2:845]) by DM6PR05MB4506.namprd05.prod.outlook.com
 ([fe80::d1cd:f671:63c2:845%7]) with mapi id 15.20.7587.021; Tue, 14 May 2024
 17:57:46 +0000
From: Steven Seeger <steven.seeger@flightsystems.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <michael@walle.cc>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>, Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: Bypass a couple of sanity checks during
 NAND identification
Thread-Topic: [PATCH 2/2] mtd: rawnand: Bypass a couple of sanity checks
 during NAND identification
Thread-Index: AQHaoJhwi0AJ1BuOok2LZZsskHo7wrGXDFqk
Date: Tue, 14 May 2024 17:57:46 +0000
Message-ID: <DM6PR05MB450689909396CB80A56B8732F7E32@DM6PR05MB4506.namprd05.prod.outlook.com>
References: <20240507160546.130255-1-miquel.raynal@bootlin.com>
 <20240507160546.130255-3-miquel.raynal@bootlin.com>
In-Reply-To: <20240507160546.130255-3-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flightsystems.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR05MB4506:EE_|PH8PR05MB9989:EE_
x-ms-office365-filtering-correlation-id: 97e56de7-1397-4408-6a47-08dc743f5ccf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?JXt5+9k+2+1l3dk9h8sf6NKgzTLQidcSwjTznoLrqTlSu1EiU1HcG4iwar?=
 =?iso-8859-1?Q?DmeUwYEXyZYzYl7o8+rvVwaXL4COqgqZdy4XLGQG/zxOz0XGBbem3f4xRn?=
 =?iso-8859-1?Q?h0zqstUFP+gS7fIPwMrJmIri+0QaEf7VceRreVP4DLfXOFC5UxTCLozVdk?=
 =?iso-8859-1?Q?7r0eCZKCYLkb+FT444H3d08Cd4+GFf1vp+PY7BejGEpKhjDnoffyRgEJCy?=
 =?iso-8859-1?Q?DP/7rm/VUJwETvab7LsEMqxLD4YjGEbGhMJSw5iSMiPFIdtJtInjJBdi59?=
 =?iso-8859-1?Q?59OxRacwpMvkfbuTuFSpMfaQ1lhGefib6ZMAHgOR9NNOqIudhPPPFYtqBO?=
 =?iso-8859-1?Q?9I9Szz90PC4M0rcmSNF+jILCs89yfn7g53S/Dp9dRU3Ub50bTxn8mweoA0?=
 =?iso-8859-1?Q?sgIURE42uq5EMybrB/f8uIx7sKULtD9Si8lke6idN+wQo4XVFxdFRauNVC?=
 =?iso-8859-1?Q?oGkFvtSIhL/FQSfBAXiaM/7zyjNKYCz85SbmMl0xi0veJMeuhH4gP74j9A?=
 =?iso-8859-1?Q?6KQtlvnobL/TMVu+Pg5MSFMADlYQAbo5ZvOQwKbzsHja8ugsP6eil1+a/F?=
 =?iso-8859-1?Q?XrJO0wzT1Ba38YbvG+oR7/QPOsYkB78jnWzSdrz/PCIhsRQS+HW3kPMl+W?=
 =?iso-8859-1?Q?tTBGaf4uY85GeWsL0aULFlHDS5dcjQSPm7pjHxNJMQycrVgwwmnIBK2Wai?=
 =?iso-8859-1?Q?bYopjZCHVJ8nINov7rvWknP1T7m1TlOQ8bEKqwSK+4OOKH2UFObT8em20U?=
 =?iso-8859-1?Q?ppIBLFd4DrsMpJZ61a/Q0i1p+IVa18m0ztEnFv2X2nEaZQUp9WrEnh7d87?=
 =?iso-8859-1?Q?r///bIY3kQwbDtvXZzYYJPqOIL+uEWi6M3BrDdxSD+OJEWyt4DkrXZmLqY?=
 =?iso-8859-1?Q?mqtjmsTUr9OYA/Mrb1Dd41UNvZ7BdLPctRqZVfNryEp8fW5wHZteLTyWh0?=
 =?iso-8859-1?Q?aNXJIidxHSKrbPaRx75XNyQIdz/zm84EsXZTeKj0rdDuNYkH7wKgcK3/69?=
 =?iso-8859-1?Q?bfIpRxO9X4QnCRElLNNOd6s1P99aN6AZndo2B3Qazi3Hgk2DjLnMyKhHvK?=
 =?iso-8859-1?Q?0L1C7HyfB7hY/3bUnl69S8hyxqp1n9y1/Ql2hirPNhpS7fR4tAval9whJZ?=
 =?iso-8859-1?Q?1m2KgBQU5XE2p1gGkXzrZm6siBSGbhUPQ37FI3nWF0wxGye8WsjXETMRzS?=
 =?iso-8859-1?Q?h9DfjCs43R9JGDm5mDeQmkPEIg2Rf0dxhHsDh0j5/AeGh9MnTGpY8EnZKa?=
 =?iso-8859-1?Q?C4HMYG2a7zFkQfENGdht25/FSSvbeaLDFi9GEQk5rrjc8hRAEVPc3Zolb/?=
 =?iso-8859-1?Q?Ly2wglqZgcb3MDXeozHnEf8xPTSFbw8oDxLw0peNxe7yXjK5ffHR79Ej74?=
 =?iso-8859-1?Q?iJx+xaUYLonCyaTovWryeQlSY1csP0lA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR05MB4506.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3gpqAMrokzpuU+QyQO0GxqaVbap3UF9DNsxCSpoe81gsgTPYsyJMiuzs3I?=
 =?iso-8859-1?Q?8RmPQ+/N/zibrInNvFqGHBcydb3gmDMzSKHeBIQne7QbCn1l25rNzVPMW6?=
 =?iso-8859-1?Q?CRJ/rXmTerQ4kch6NI9vX8cvkE6pl2oYGEUCLPp/45PHIe1PSOVpQbFlNl?=
 =?iso-8859-1?Q?dltR91vmu6nuR9Zae7fhXDs64/viSNORXRyG/nAemAcWomfOGuKrjyKODt?=
 =?iso-8859-1?Q?fgAK9l6SwqJjX1fbhrHLT5Ht7xMD+uDxdcceKyLPKbOEpPt0tDaWCTcJrL?=
 =?iso-8859-1?Q?UHg72HDo16GwCzdac8aKmRVHrJPkphAfgRzcUuBzyDD8UUkgYDyEnLiob1?=
 =?iso-8859-1?Q?F/G6Cem8HXo/NtuXRLwxfZ37L98OnV8pdkwH6o3nWFoPWqnccKeaS5qk6f?=
 =?iso-8859-1?Q?T8wCW+vmRwUMXMTRLjUmjLIo65bgs15u9auN1dFr1iJxNfR12H/VQ7owp1?=
 =?iso-8859-1?Q?4/7/7wlnZYNyRei91z9Citd8s2ekeAmSiw9KjhubhJzC7ZwE7eql0iQNTG?=
 =?iso-8859-1?Q?v0QkNsX2Emfvk7MW3cT3IYAIUaBtIaSY8ZbP7pu3kywQ/ZGN8oG4VDw1p1?=
 =?iso-8859-1?Q?m/8+bT7TCH/AqXD/+TYVfD9sipscXeoxPFJP7dDL6BE0dcE+kA/8JYdSXO?=
 =?iso-8859-1?Q?wF2S7mBOyhH1458t8oJ3/KrfLZ4YWfItO+vEzK3+qqkHph4QX9M2tza2up?=
 =?iso-8859-1?Q?0/MRX8dsKevENdL7PPkEWNkxs/hqhUU05EQcW4KHg4bOeUUFhwMXj/krsu?=
 =?iso-8859-1?Q?ne4BO4wFC1EZJueUJ1KOBeEVfpEMOGm+Q/dNEPgY1yqIlf/FH0vPdSynGF?=
 =?iso-8859-1?Q?ePV9dKn+4/vfyDAwzwWn4YjeRtb/kHlMJP2Qs2lVDzUsjtO15vhHpfFPum?=
 =?iso-8859-1?Q?yc5xrHOPGvBhcXapLdHKqPfDA2XGbqybOGF9dX3943rwPewRGyAgH5/coQ?=
 =?iso-8859-1?Q?WDw+tOnCJEHbloxIc/L7Yuve0Cg54+t8F7Svmp6uDCpHrl2PxBMQ5aZWI1?=
 =?iso-8859-1?Q?l4yAydO+ZCS0MrSxW2ZnDipUzbgyuyY6EkAPl0W/FHMggV7kQFdlp3pZOr?=
 =?iso-8859-1?Q?3OghSFqU+n+HEZrz83MHZOv6G0+QkjN7hzl2SYbDKRP4/JdbLTFvOoD51F?=
 =?iso-8859-1?Q?fx196Q2Dm2TPuLP2MWYqASBIfTx1rxETNgMuCWI6Wtip2LMIbwM494uIkL?=
 =?iso-8859-1?Q?yAHf7qYSmjk+Zugbjog2td0PqH/xzOLlXLdWMd5rsljzxtGcd31m1dcMAc?=
 =?iso-8859-1?Q?jVlKpZuqf12ey3MkOW6uOG9On6F9gbxFrEBBIEnN/BZrU8s4Yq4YmRGJWl?=
 =?iso-8859-1?Q?+RoPTxLvK3m0ocgDK4ng0f4SFVUauXuFSuftDPYRGvuWtpyO8si4G/E9Um?=
 =?iso-8859-1?Q?9OdSkGKk8g7SASidgeNEwyk6CSYaWS4b+66a7PBt18L9mDirf73CLNCvS/?=
 =?iso-8859-1?Q?bU6tLtQlYUv6oYNv2c6lL5m6rcqXLAY8zCd96ngx/SfEq3tCkIwNP5b2Ao?=
 =?iso-8859-1?Q?wwMkt7stFtvYKL6HTL7jAHU9Ufe++vjTWA2HzNMIUXUybMkXg+vvU+SyBB?=
 =?iso-8859-1?Q?DvPo7To16ufhYxODp5WFvijPrf8j76TlqReIKb2QValdWmjVLrl4QUNThE?=
 =?iso-8859-1?Q?ZLEkcGuhuj5G18kndbWCZlPxOSAfRju1gIem8ZTliQ1ba49O2gNI3U+A?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: flightsystems.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB4506.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e56de7-1397-4408-6a47-08dc743f5ccf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 17:57:46.8039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cc3d8032-d019-412f-a0a3-ce7bb88962c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ff1thuPQdbkTKd0u7xUXVVyAPjBrYlZpU8qe+eRn2ZUgoAADPfwIwulm8365U19ioeYP5Lj+l0AVngAjV6i76yFcEfN2P/D05Zd3tsb/9jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR05MB9989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_105757_441493_FA798F67 
X-CRM114-Status: GOOD (  17.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Tuesday, May 7, 2024, Miquel Raynal wrote:

>So, if the fields are empty, especially mtd->writesize which is *always*
>set quite rapidly after identification, let's skip the sanity checks.

I noticed this when first looking at my board with the bitflip in a NAND chip's parameter page. I just assumed that since I was setting it up to do column change operations, I needed to add this in at the time. Looking at it now, since this information is being supplied by me before the scan, it's wrong.  So I agree it's a bug, but I didn't think about it again since I was tackling the bug of trying to read additional parameter page copies further down the page due to the bitflip.

I don't have access to the board right now, but when I get to it again I can try this patch. I will need to remove what I already added in to check and reply back. It may be a few weeks, though.

On another note, I think that this entire API would benefit from discouraging hybrid approaches. I implement function overloads for things like ecc.read_page, write_page, read_page_raw, etc, but also use the exec function for things like erase, read id, read parameter page, etc. I maybe did it "wrong" but it works. Past drivers I've done use the legacy cmdfunc, so this was my first attempt at using the command parser. I suspect there are a lot of people like me writing drivers for proprietary hardware that uses FPGAs to do some of the NAND interaction, rather than direct chip access as the API was originally designed for.

So, to explain further, read_page triggers my addr/chip select, read page command, and retrieving the buffer. Read parameter page goes through the command parser, as does the column change op, with some state variables to keep track of where in the read cycle we are so that each copy of the parameter page data can be accessed in the buffer. I lament the lack of consistency here. But, it works and the customer is unlikely to want to change anything at this point. :)

Steven

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
