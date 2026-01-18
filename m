Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6FCD4A5F4
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Jan 2026 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iHBcU9w/ixLlejXqfBkNU1R0KvyyiYv8lMMOlKAxzyQ=; b=PKRBugD4WgHVkO
	RrOcX9ZLn38O833UHL4K6MSnFP15jIpErRBrLSPfVvbT9EYgRrBrpEyLssdb7pXlI/QZgpM/YYc8U
	NH4IoAtZok9EA/27g0du06jz1CGIOSp1SB5PF7T0lNjS9p2QTfHCuPBRuy10rpkep2qGG1SAemP8w
	b8OZf9pyoRE62rZdXPV/46/RkMZW3hlhl2syYQUHPFXZ7PzcklYeeNSvhv67aFzr1lzk8dORf4Z0d
	zlljXwi8ChBgrStpuxIub513daNsy5zva9ElcSmFZVjQ6DzXUCR0OS3ZOWztGRcVgktF5+EkrS8aA
	CDZtlcLfeoFOEtViJGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTY8-00000000DYn-1eJb;
	Sun, 18 Jan 2026 14:14:40 +0000
Received: from iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com ([34.193.58.168])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhTY3-00000000DYA-2qmm
	for linux-mtd@lists.infradead.org;
	Sun, 18 Jan 2026 14:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1768745675; x=1800281675;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Cr1TPCMoeTrrwLk8Y5KvpmMIyZxghQ+4wv7Cl8Q/+GQ=;
  b=mnT8ymDxBQqm8Ks9ij7zwEvv0nknmBL/Gne1OgEg+slciDTTalhFKKAP
   x7mzGobX8rvlx+JtTXg3ZnJbpUrOhYU+xGNMvPnopp+1CsvRwW8EUIBlf
   PN6mqBDkrvP5yzFPh1PsXvq8FMNtEw+5ozfu6ibi6TYxFzeAaagL1g+B2
   ca/WWzG1CRwp5pCoeMe+R7jc/dNbekf/EGezcECw2EfoeHuIStjKhz0Hc
   l2huXEKAkYXwy+XuxTzQ7DI++0DjIQ0wSq/xaNV0xH+Y3fS9c9oxNca1+
   KVwHTfalnjaERoCPgTxq04kiQubaSGkWVtZ2IuoOt9UDJpCfeXUFMf6OX
   A==;
X-CSE-ConnectionGUID: N432isNeRsClX9sEmUgOBA==
X-CSE-MsgGUID: aYZuvtGbSlufZRgFL02PsQ==
X-IronPort-AV: E=Sophos;i="6.21,235,1763424000"; 
   d="scan'208";a="10092165"
Received: from ip-10-4-13-79.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.13.79])
  by internal-iad-out-008.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 14:14:29 +0000
Received: from EX19MTAUEB001.ant.amazon.com [52.94.133.139:16480]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.49.19:2525] with esmtp (Farcaster)
 id 6cd3a0e0-3ffb-481e-8c61-dfb3e7e0fe93; Sun, 18 Jan 2026 14:14:29 +0000 (UTC)
X-Farcaster-Flow-ID: 6cd3a0e0-3ffb-481e-8c61-dfb3e7e0fe93
Received: from EX19EXOUEC002.ant.amazon.com (10.252.135.179) by
 EX19MTAUEB001.ant.amazon.com (10.252.135.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Sun, 18 Jan 2026 14:14:28 +0000
Received: from EX19EXOUEC001.ant.amazon.com (10.252.135.173) by
 EX19EXOUEC002.ant.amazon.com (10.252.135.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Sun, 18 Jan 2026 14:14:27 +0000
Received: from SN1PR07CU001.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEC001.ant.amazon.com (10.252.135.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35
 via Frontend Transport; Sun, 18 Jan 2026 14:14:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtY1Ko9eZEKLWmUTSaBLlXPJNRT9y6uM0xLu8gxNTx/EZEuqwdb7yK7z3brFvXZrKebmSnzRJeCymAEgxco5+ELJh6OPh9+Pj/slTJZWtQdsGeyrfUBYc2zgk4aa4uS3XRn5YsPpbqX6FblTGL+5hYIB9mCbsfKFiZWDQxfv7Ef4zy8VRcKeDLdqU9qCaF3UZ7TzFzQg1EJonL2DwGO8jw5e44JeiWbtJ2nZrhmA2NS1yagVaqLCtn7XtHacPg44vEZ7Bobj0v9SME3YcZof3dFcM3cmMMmKvEr2V5lAh8pT6XztsHll/ndHuGtMzhk0y5fceKAvefkwHCO7RotJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cr1TPCMoeTrrwLk8Y5KvpmMIyZxghQ+4wv7Cl8Q/+GQ=;
 b=Q7GD6Zj5z21F1gXUmQXGC+HywyHQeIuNQFpzrJq7cpvn+S1YW0504njWLQMEFKAPOW9SUNFUVLtN1rnxaXMXWNgJPbzrmepi2WnGSZDkaDTwxFN0QC1ENX6sdC0Xl0P7zAkaBFKid2b8vS5OCAD0T6L8h+bfs4ZE3Ekcj9IWKnoYm9at0R5GfoI0Ocd88ICG4wWtGTNN/dQIY6V4Tn6nrfqvb0M0Si73GChy/+hztkhDXAp85qqKigkLTHJX9F5OL8tYYDoM61QlUKs/4pK2VlBs8r3hUT9TIPJ1s0hAVPiDBVlcXP3ZHnmTygYqCYlYopBmuQMleOBN//rdqVUgRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from PH0PR18MB3798.namprd18.prod.outlook.com (2603:10b6:510:24::19)
 by PH7PR18MB5202.namprd18.prod.outlook.com (2603:10b6:510:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.5; Sun, 18 Jan
 2026 14:14:25 +0000
Received: from PH0PR18MB3798.namprd18.prod.outlook.com
 ([fe80::54fe:542e:a8ff:66c5]) by PH0PR18MB3798.namprd18.prod.outlook.com
 ([fe80::54fe:542e:a8ff:66c5%7]) with mapi id 15.20.9542.005; Sun, 18 Jan 2026
 14:14:25 +0000
From: "Havivi, Itamar" <ihavivi@amazon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "Katz, Itamar" <itamark@amazon.com>
Subject: [RFC] mtd: spi-nor: Use-after-free in MTD layer when unbinding
 SPI-NOR with open file handles
Thread-Topic: [RFC] mtd: spi-nor: Use-after-free in MTD layer when unbinding
 SPI-NOR with open file handles
Thread-Index: AdyIgdQ7zxIrGG0oTgyJY2mlJIn4pQ==
Date: Sun, 18 Jan 2026 14:14:25 +0000
Message-ID: <PH0PR18MB379800213D5E264FBE228C78C38BA@PH0PR18MB3798.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB3798:EE_|PH7PR18MB5202:EE_
x-ms-office365-filtering-correlation-id: 7118b238-b260-4b43-2568-08de569be27b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?zYgydMDgebZ8CVOdB8vVn7mtqd1l9hc4Qy4jmhacWJvMkKDQcIluVsEx+zTZ?=
 =?us-ascii?Q?SdPvt3DeGcTCtxvHOcO14MV2gkG2FT6cqvTsXyNFgt/ctCgZAYvaYZ2PpVYU?=
 =?us-ascii?Q?RB85WXVPwu1oE9VbzdlfvqEsLH3JXJkaPDYQREnTA8PyjkE4cOUktFXoglqH?=
 =?us-ascii?Q?wefGmwhEv281MiVPZuNipcPeMyRgdET6PLWMUd3C6kSjkIpKRer6hSbVIEHy?=
 =?us-ascii?Q?ir2F5Le1E/kn62C0f/lvD2H30WEjVrhtKTWCsD8m5aXLmlGWYw9VrIWhZVx1?=
 =?us-ascii?Q?pwTTJBE7YVy65TrJ3kEPJskzpJCBa8IiYT0c2QnTMVJHzmVV+G06uIbbbw6E?=
 =?us-ascii?Q?CVXqQHpL4rAen7j5meWktbtBL0UhCAkHtFFP7/HkbWzWg9Jix+FQfbCGQdof?=
 =?us-ascii?Q?TKWUWv+qXkW3NB6bJGzcB9ZVJ3l6dIYoxGcFmjOoaiEb8w+jh9dlGL45Eq3Z?=
 =?us-ascii?Q?W2QGwbI7CiIJhK+/IwKSeUK5DcqgbJWPTI8jZHo/3zMwjWz/NMW6X91y7J7n?=
 =?us-ascii?Q?B27ODhLb0FDcUGnJtNazDJKj8ja3+YcKLCe4gDMCStCnGkMs+xXt2I9kTBiF?=
 =?us-ascii?Q?MqWJJlW02BGr2ivBTR9aaCD9pHnvwBmjJg0ysGFJ3T2PeJBHD2oUiqjwpkGY?=
 =?us-ascii?Q?jcIDzAq8lluhjUg5wtr3pbgcTST1zaKh8Gc8TMBaWNpbDszUJHIa2zvrQtR6?=
 =?us-ascii?Q?bEBWJ9J1YEyq0OQNYUJlxh9NFuXSj2bFJM6ISrLu5gjb7vXWqmz63A/+YSop?=
 =?us-ascii?Q?qJQ+yb3bAsoI4UEFVHs6pVCClpj+oNI6vu5ygGCoM/U5lk8izkxkOqsoWK/J?=
 =?us-ascii?Q?jzTMNFACvvQdPDI4hDJVxUiFy9pMJgPQG+GmoaX/G0TNp6dTnF03DQITr93v?=
 =?us-ascii?Q?e3fHMRJD/9IKUg1k2zAJCNdiNTy3Be2Noe53VK+g+P3DmZedf/8t9l/vjYwD?=
 =?us-ascii?Q?sK6BI5DmRPRWxixoV0AVsCsgBHzmCOTGi8BucmS0NQ7bCUPDzavUBNz9nsl2?=
 =?us-ascii?Q?Z1T/4E9AWpHo++7BYL/lnChQLgg46Sh+fosTZjbsiR6VdnR9YvEmEWNValkA?=
 =?us-ascii?Q?tbyOpMdiLUMDnU08m0Q95hR/u70gfdcajTBrUmJJwEn0jKpijS2Ij7hJCXwT?=
 =?us-ascii?Q?rSPlKSx8U8e2BluBH60kCwmUlCW7UWi50BlE0wyEpravDe7S5ycPvZxkkX1z?=
 =?us-ascii?Q?/9/D16N8eETgFOrtQomgKfUtkJQvHvJsahy1Xeyy1FYuZSPdJZycQovNuTXc?=
 =?us-ascii?Q?VzdyIFWxWjYiw6Tu5Go6aX0H38W7Cw5iTWaj0mEdqZ6OKnMVIpdlPKY1d91K?=
 =?us-ascii?Q?J6uW+GL/+Cr1UGjlr1d1v0P7GxJb36xdghKoj6u2KIluLux4z0dodHKY+NR2?=
 =?us-ascii?Q?Ycs13tcR4iuCpqCm3KjlVZnQJtTVlkeOYQQvLSLBLBqYBEN4I7A0S+2ge1LI?=
 =?us-ascii?Q?1NvdSeAzveTRtnNaYoUWJSerERZ5aWXxuVVJxq1l0Z6uBrQ8b08zukKxOlkj?=
 =?us-ascii?Q?nD9/43G3am5QUAQ5KYwWYnEdWuOY5INBjqyks6ya7KBObjjuANxr1tLVtup3?=
 =?us-ascii?Q?G+K+Z+2VMMYACpQd2TwdP4EFb1J+p0qI4W5fyvsBas1cwwwd3XQxn2JHGsdr?=
 =?us-ascii?Q?61D0segxSEMqWpe83wUwrYE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB3798.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fZWWcG79tEmf9h7mvqd4PykoNDSIyQIK9mlp4Q3VmUy7eHrQgqfUJnhNXBDB?=
 =?us-ascii?Q?4+fffmoOrgJFJud0+H4UDwPUs9+uZX74y+nX/ATrSAMYCmSAOtXiOAXzANKM?=
 =?us-ascii?Q?zT3vKVkwkq2e/wsSJv8/UNzg53d8wTFfIITsdh7MwPJS/qb+55uCr1JMM7Ye?=
 =?us-ascii?Q?6hnUu82m5COMgWVVy40KQ7TPFT74jS3N8etYnzX5VBhTROkkGLr2LqBgEXDn?=
 =?us-ascii?Q?ZzEfoKuebEAq3UjSOxEOLXGmfG97vH/Fz6MYHQRNgEbAW2lY55sZz4rsZkXM?=
 =?us-ascii?Q?MqtdO/6c3fM0c2Xcjb1u8WWH4rhDLhRkXWLXkk5IdVjWDWzB3MagSnqVI1zD?=
 =?us-ascii?Q?MyfXQgOAD0nmiCkfiIzRfoYcJ/s4/+pYw9JxuSK+xu1P4IfmzM0ask+Nl4lT?=
 =?us-ascii?Q?EFP+HNPyZic0h6CvNJCUB4W8IDEzFtkYM16xAl7gm5kXGmwkuXFY9eZUOJ60?=
 =?us-ascii?Q?Yq5RVSZ2UholCYm9blTlRiqt1pryxGrgOXmgVFbK8O2CsKQ+j8CQ7BOxP8yh?=
 =?us-ascii?Q?Bp+bPx/3/+wIXvZ+UFYd/EGd5mR32kxNYN2hhAQeBW0veukt8EfcWAymj+Sk?=
 =?us-ascii?Q?Kh7nZ/nN1Qgz463ygUBazF8h80AXlsQdcHrUrAvWrLvr094hFnd5d2kXeDl2?=
 =?us-ascii?Q?n4WT3gWs6Vs5DvDgiwlPDQTnQY6lEP3+M5Wl6EEexhAhpDik51bZRjEd/Q70?=
 =?us-ascii?Q?am1f98UFBQz0FKwvS3cr9uFjvHv3VQ2/eQVAhqGaKhnfzPG4BmvXlN5FonXc?=
 =?us-ascii?Q?TGESnFmwxMyCkhItamMweptb6edGSldxsHUAoZbQTEfY48hzvr5+Lyx70Z4z?=
 =?us-ascii?Q?FgFrTqod2bIvgaYFwGbor5wp4g95EzYuO7uu8lfADnxc3V19ShmJFX0o8Mg9?=
 =?us-ascii?Q?TgQPbYnd5bOHApiF9hH3tKee8qGsVEogIBLEMQEDD3HgSPTgZnKyg1cf6ylX?=
 =?us-ascii?Q?YuI58+0iW5j7CGamgN3kq/FQmuUFx3hKgSzhiQiwv24/FnRLYmAeCIznWYj3?=
 =?us-ascii?Q?OXojirozvVgMDnnzsrvCFH+s1RQhlvtpq0dPS/KkxjMfyg2OIXWQH1PsEppH?=
 =?us-ascii?Q?MEh2SLNj1ZNJ1VHy5co320nqpuXg6fk65/SqhVgooz3zrLAJ52WdiqmBrHNU?=
 =?us-ascii?Q?AyJzoP9X3USS92QDn+y0Iat7q6sEcSKiYtLnETnuFUmyslM5GmoQUeZgOEX6?=
 =?us-ascii?Q?GHu/KNy6O4iUHA1sHthHEvCbcqsiKBbe5eASZQ5dJy9DyeN+MgR4jD1AHOgZ?=
 =?us-ascii?Q?hpIU2ctRFwwsfmbZq2mu9C9CUMSJnUa7wVKhjbWjA6fcieSt2RC0FFh7YmYG?=
 =?us-ascii?Q?oMSQITdD6+vQja8mayURK9xb/MKB0OOWXcKw1bmmm2YTZgh7ePqOyVfExncL?=
 =?us-ascii?Q?YDSZ/Z3ocEULouH2gNCMP///aOvQF1IgDBkSODi75aymhRFzfwnRHRkTl9cz?=
 =?us-ascii?Q?qQLVBawHBgOPjOVrDJgR8rnDUs3EZ6jwubu/V0wnqxfYGNI4/ys2dvuOMJhA?=
 =?us-ascii?Q?VI/3bg1TBr6/VdK2Ymto1GUtYwLdl13s62XdqsMlbOiu9JMUvx6FUn5F/Rvu?=
 =?us-ascii?Q?+Iz4iNK7MNmnnWB26pjkruuwBK7iNZ/nQ87z33ek6cnzroShDCVob0FKAabp?=
 =?us-ascii?Q?y4hi3sA7zAM1sHK//hftT1ADIlW3ohV/qn/QLVbjjrAITZ/qJZX/KJDAUaje?=
 =?us-ascii?Q?uVvpri/ThN8wTwmrEQK5vQe/mznSWTwRiRvETUc0yE0dMjUF?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB3798.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7118b238-b260-4b43-2568-08de569be27b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2026 14:14:25.2795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ABVryrAc461X39hvYOUsa4c50AoLx6z6MZXfzu1Fs//APpDsIdGKJxIOh/Yz7MtnVTzMNjQTnln5svFROGO0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5202
X-OriginatorOrg: amazon.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_061435_865426_CA6D0354 
X-CRM114-Status: GOOD (  13.11  )
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

Hi,

We're encountering kernel crashes when unbinding SPI-NOR flash devices that
have open /dev/mtdX file handles. The root cause appears to be that the
mtd_info struct (embedded in spi_nor struct) is freed via devres_release_all()
during unbind, while userspace still holds references.

Kernel versions: v5.10 / v6.12
Config: CONFIG_MTD_PARTITIONED_MASTER=y

Reproduction:
1. Open /dev/mtd0 (SPI-NOR master device)
2. Unbind the SPI device via sysfs
3. Access/close the open file handle -> crash (sometimes not immediately)

The issue occurs because:
- spi_nor structs, and the master mtd_info, are allocated with devm_kzalloc()
- __device_release_driver() calls spi_nor_remove() then devres_release_all()
- MTD device memory is freed regardless of outstanding references
- Subsequent access through open file handles hits freed memory

The recent MTD patches that added kref in mtd_info did not fix this since
the spi-nor and master MTD memory is already freed when the last reference
is dropped, and even the put_mtd_device tries to access them.

This was found on master MTD device, but affecting MTD partitions as well,
since they also access their master device and spi-nor when a reference is put.

Proposed solution:
- Allocate spi_nor with kzalloc() instead of devm_kzalloc()
- Add kref to spi_nor, managed via spi_nor_get/put_device()
- Add "removed" flag to prevent operations after unbind
- Free spi_nor only when both device removal completes and all references drop

This would allow graceful failure for operations on open handles rather than
use-after-free crashes, and closing the files successfully.

Before I prepare patches, I wanted to check:
1. Is this approach acceptable, or is there a better way to handle this?
2. Are there existing mechanisms in MTD/SPI-NOR I should use?

I will provide a patch series if this direction is acceptable.

Thanks,
Itamar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
