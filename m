Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1915CD6E56
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 09:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyH27gS6RFjI5Ul1LWaoCTWDmNDbS8HmrYzHPltLLGY=; b=BK4QO9vYLk97Tm
	6kJx1vyeHFz8ZfektiJOMJS53Ovtor1syHhZnFFLhpG2slxrLmevU/7ddyGAnXkA35NmNP5Cp8Rfe
	TfG9bmrhuqqpU0KpTYRuIfqcaecpEuMuIVVl1zqCaTvl4ywdDcBDMs8hbZxVR27J1mOHYCME1lQt+
	TX0qlWG6IIlKUAOXWi++Sj/gp36sMVfILr7qHj27zsKo9RqXDg/9TOWUC9ArhyrJXou/G20jSUSTb
	Hu5dIV1sLvKQJNhbLDx3epwEXNT+ie9Ej/ZPlsij/LQrNm3IONIm61WVLg2PSTANfd39wb799CyZ7
	P/tlqtQglw7PRdbGuP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTylZ-0000000ATXQ-0kyT;
	Mon, 01 Jun 2026 09:17:01 +0000
Received: from mail-eastus2azon11010071.outbound.protection.outlook.com ([52.101.56.71] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTylV-0000000ATWP-288N
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 09:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADpyZpGPuKgb58MuPJC7KeZgzNTaS4EK6tGOdAHeyczpf4CSk1B54tEErksCHcLJ97PFJNNiv0zjigaykRFPsBoG0+PFN2UbRh97HI5UzCipqnF2ROu7XEDNbvB/JFym0IvOgRgJRKrcCfelVAWmT1AD9cHf6uEadU2EWNNiBcWl2bcj/avUdErad1pRI3TmHMwsH/eB45uWtALnVxA7pqdIHOnIAJL4QvAlzbxSK0OAJb7mPz2vJ/od6xns0BXHR2lwGIa4RAem3Fodp8Cbs39kTDSggJCGsek7UNOnDkD1GletVy3jJ2fdyknkKJXkQQZ1r0zfsE95mzR1akUuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxTNlQFdzmXh2tYzBfynmc96b0ewkuI55Lqzeef3yKQ=;
 b=g9gkjZIQS9maSTPHXi4j27HEZ9HGHk3Vyy/ggy1kxezkuJxLwVmA6QXNF26dSG3nWkj1TX/MgO2G3rAI636zxST7S4OJSQ6Emo47DZPAh3cF0DjgUOwS74JJpilLcA7IuLFCoNy53H0MvHeaYqq03I+9GI7hXBzLam3qyjmL0Kb9adH9YienASHzsccYGC3mfKrONDHkdJ3lmgH+vfw1EguQ66onJssT1Zj5sV9yO78Z1QL+9+lj3VHJOLEfS7x7N5CQnH/0QcwzPM1PCqi9tbJr3mu5ls1i3RKEQPBalTWwO+qkC5/bxg/3RocB/8Nm9EJn4jOqiEu8lWk4/DpvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxTNlQFdzmXh2tYzBfynmc96b0ewkuI55Lqzeef3yKQ=;
 b=IXqfuSCscNCLS1tOg6Arg7blZnU3ls/Ue8LvTrm7sAvZG2Hc9N6G+9IPo92QUOUIJfbeHhYM6Xbu6NkmcUGJyDwl653EA1fO+eg+Vu1O1louGL4lotoxAmKKcJHolxVD/KdhgP72FCdo+l+XJ/uv+uQaFJrjbeHafANUs3OMmLA=
Received: from BLAPR03CA0177.namprd03.prod.outlook.com (2603:10b6:208:32f::30)
 by IA3PR10MB8300.namprd10.prod.outlook.com (2603:10b6:208:582::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 09:16:53 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:32f:cafe::16) by BLAPR03CA0177.outlook.office365.com
 (2603:10b6:208:32f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 09:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 09:16:53 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 04:16:50 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 04:16:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 04:16:50 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6519GjC1700738;
	Mon, 1 Jun 2026 04:16:45 -0500
Message-ID: <2f509130-491c-4a66-9156-39b01b40e65f@ti.com>
Date: Mon, 1 Jun 2026 14:46:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] mtd: spinand: run PHY tuning after init and
 update dirmap frequencies
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-12-s-k6@ti.com> <87mrxjg9zi.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87mrxjg9zi.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|IA3PR10MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 500aa677-998f-4ffe-ca69-08debfbe8599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|3023799007|6133799003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: NsiaIjixbLSwzDw5hOApCsIjOSoRuM5b//0cdHNVr9zgMOS7WPiP9l3xyzcI+V4mG7HrjycpNkKFz8UYRxkaUaloexLjV4ZgaGWf1enD2P+wFwSJ8o6C4BH2lcpHgGVWplXc+bQ7L8w95OgcZXwlGdIK3hMoXuN2Oxg1CWKB+wJ2Ky6JU9w8kDdHGi38pnMkbapLCnS1/GguAYgi93h2FhJDk5uPEH7KWHcK2tkg90bnDcwY9h2oTGzGpA1krIcVvHI7wHoB6VvLS+tRxIDf6kCzOEYPQxuY2PLcNw0erqoILcxO3bo4/QO0fjgbmXCnlnwY234tIPlpVkUC1QWAEc1egFQk/CUp4sNCrBvbenxDwKMq0M6hJ/f/OcrRq6jxQiC4dEYn3pud97OPCjAavNVJyeBOkremLAtVdtD/W2mET6nY+k3R4sGa/1xEXvtSbZ3Rr4kLS70rInCCz38uLG1rkOj9ZlQPuFn5uJO3Li/22lq1w+/HM4djTz2bacN8+0zk2J7sxFOr9//EX1t8LSNmII4QU5RTxI1uVCpXgXY51xkGJG0QxcuAm96d+diY8uMl+JDI7mO+nAhfPi44YI75Ed0y7vmHJpSVtmQvrPrxOfW5xddv7C4Nb2T1lBBPdYohNCcK/3chRo7e/dWoAD5zvH8G+GAGm+RUI8V73oihXZ9tclezVKgxKHHSFIm80DeEOs+sQeRDDLv17TE1UeeNi8obXqZSu35M5+sa1nQ=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WrdhD7JRKd2YkNlp+qaKG+4ITsFVx4qKAFx3oO8E6BFLaRjR3/Fp/kaytU9RtiHVsBIbGKYm/tAEBlKjELZkELucxeTjYutgnJ2FTSD2PZxOB44MPwH/JwJvGTM7/ciJQ1rSRPHnjRAslc4nPZQVLP/mVgtMGHELI8wrniRFiHPqle/K5fBSXNhSj5c2kbkQepJSrZ2FNt3U/qyE9S8naYu774LAHRwaYiq52seGnXoy/5ZpBlf2adECLThuD3YxVMcfls7GVHRro/UJVc9J+5H0lqS6IZNp52/vBjewZKY1nSvlwi1tX0CV4CncgEGT/M3x9PDN4F9JKi9CdBNa5fmeA5opMuVAZQ1SxFdb48Xg9rEs3CvR8Rg4/LeIWSPqPtqQ1ixsGXcFTVOFFpdtWFyNeZnePnWDlYvMF7Glxvv1oJls4dKjMvtdNilXexdV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 09:16:53.8018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500aa677-998f-4ffe-ca69-08debfbe8599
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_021657_550646_EF9219DF 
X-CRM114-Status: GOOD (  24.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWlxdWVsLAoKT24gMjgvMDUvMjYgMTQ6NTcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgU2FudGhvc2gsCj4gCj4gT24gMjcvMDUvMjAyNiBhdCAyMzoyNToyNSArMDUzMCwgU2FudGhv
c2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+IHdyb3RlOgo+IAo+PiBSdW4gc3BpX21lbV9leGVjdXRl
X3R1bmluZygpIGluIHNwaW5hbmRfcHJvYmUoKSBhZnRlciBzcGluYW5kX2luaXQoKQo+PiBjb21w
bGV0ZXMuIFRoZSByZWFkIGFuZCB3cml0ZSBvcCB0ZW1wbGF0ZXMgYXJlIGNvcGllZCBpbnRvIHBl
cnNpc3RlbnQKPj4gZmllbGRzIGluIHNwaW5hbmRfZGV2aWNlIHNvIHRoZSBjb250cm9sbGVyIGNh
biB3cml0ZSB0aGUgdmFsaWRhdGVkCj4+IGZyZXF1ZW5jeSBkaXJlY3RseSBiYWNrIGludG8gdGhl
bS4gT24gc3VjY2VzcywgcHJvcGFnYXRlIHRoYXQgZnJlcXVlbmN5Cj4+IHRvIGV2ZXJ5IGRpcm1h
cCdzIHByaW1hcnkgYW5kIHNlY29uZGFyeSBvcCB0ZW1wbGF0ZXMuIFVwZGF0aW5nIHRoZQo+PiBz
ZWNvbmRhcnkgdGVtcGxhdGUgZW5zdXJlcyBjb250aW51b3VzLXJlYWQgZGlybWFwcyBhbHNvIGJl
bmVmaXQgZnJvbQo+PiB0aGUgdmFsaWRhdGVkIHNwZWVkLCBub3QganVzdCB0aGUgcHJpbWFyeSBy
ZWFkIHBhdGguCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGku
Y29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCAzNSArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIGluY2x1ZGUvbGludXgvbXRkL3NwaW5h
bmQuaCB8ICA0ICsrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRk
L25hbmQvc3BpL2NvcmUuYwo+PiBpbmRleCBmMTA4NGQ1ZTA0YjkuLjliNTRlNDYwN2NmZSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwo+PiBAQCAtMjAzMCw2ICsyMDMwLDQxIEBAIHN0YXRpYyBpbnQg
c3BpbmFuZF9wcm9iZShzdHJ1Y3Qgc3BpX21lbSAqbWVtKQo+PiAgIAlpZiAocmV0KQo+PiAgIAkJ
cmV0dXJuIHJldDsKPj4gICAKPj4gKwkvKgo+PiArCSAqIENvcHkgdGhlIHJlYWQgYW5kIHdyaXRl
IG9wIHRlbXBsYXRlcyBpbnRvIHBlcnNpc3RlbnQgZmllbGRzIHNvCj4+ICsJICogZXhlY3V0ZV90
dW5pbmcgY2FuIHdyaXRlIHRoZSB2YWxpZGF0ZWQgZnJlcXVlbmN5IGJhY2sgaW50byB0aGVtLgo+
PiArCSAqIFR1bmluZyBmYWlsdXJlIGlzIG5vbi1mYXRhbDsgdGhlIGRldmljZSBvcGVyYXRlcyBh
dCBiYXNlIHNwZWVkLgo+PiArCSAqLwo+PiArCXNwaW5hbmQtPm1heF9yZWFkX29wID0gKnNwaW5h
bmQtPm9wX3RlbXBsYXRlcy0+cmVhZF9jYWNoZTsKPj4gKwlzcGluYW5kLT5tYXhfd3JpdGVfb3Ag
PSAqc3BpbmFuZC0+b3BfdGVtcGxhdGVzLT53cml0ZV9jYWNoZTsKPj4gKwo+PiArCXJldCA9IHNw
aV9tZW1fZXhlY3V0ZV90dW5pbmcobWVtLCAmc3BpbmFuZC0+bWF4X3JlYWRfb3AsCj4+ICsJCQkJ
ICAgICAmc3BpbmFuZC0+bWF4X3dyaXRlX29wKTsKPj4gKwlpZiAocmV0ICYmIHJldCAhPSAtRU9Q
Tk9UU1VQUCkKPj4gKwkJZGV2X3dhcm4oJm1lbS0+c3BpLT5kZXYsICJGYWlsZWQgdG8gZXhlY3V0
ZSBQSFkgdHVuaW5nOiAlZFxuIiwKPj4gKwkJCSByZXQpOwo+PiArCj4+ICsJLyoKPj4gKwkgKiBE
aXJtYXBzIHdlcmUgc2V0IHVwIGluIHNwaW5hbmRfaW5pdCgpIGJlZm9yZSB0dW5pbmcgcmFuOyB1
cGRhdGUKPj4gKwkgKiB0aGVpciBvcCB0ZW1wbGF0ZXMgdG8gdXNlIHRoZSB2YWxpZGF0ZWQgZnJl
cXVlbmN5Lgo+PiArCSAqLwo+PiArCWlmICghcmV0KSB7Cj4+ICsJCXN0cnVjdCBuYW5kX2Rldmlj
ZSAqbmFuZCA9IHNwaW5hbmRfdG9fbmFuZChzcGluYW5kKTsKPj4gKwkJaW50IGk7Cj4+ICsKPj4g
KwkJZm9yIChpID0gMDsgaSA8IG5hbmQtPm1lbW9yZy5wbGFuZXNfcGVyX2x1bjsgaSsrKSB7Cj4+
ICsJCQlpZiAoc3BpbmFuZC0+ZGlybWFwc1tpXS5yZGVzYykgewo+PiArCQkJCXNwaW5hbmQtPmRp
cm1hcHNbaV0ucmRlc2MtPmluZm8ucHJpbWFyeV9vcF90bXBsLm1heF9mcmVxID0KPj4gKwkJCQkJ
c3BpbmFuZC0+bWF4X3JlYWRfb3AubWF4X2ZyZXE7Cj4+ICsJCQkJc3BpbmFuZC0+ZGlybWFwc1tp
XS5yZGVzYy0+aW5mby5zZWNvbmRhcnlfb3BfdG1wbC5tYXhfZnJlcSA9Cj4+ICsJCQkJCXNwaW5h
bmQtPm1heF9yZWFkX29wLm1heF9mcmVxOwo+PiArCQkJfQo+PiArCQkJaWYgKHNwaW5hbmQtPmRp
cm1hcHNbaV0ud2Rlc2MpCj4+ICsJCQkJc3BpbmFuZC0+ZGlybWFwc1tpXS53ZGVzYy0+aW5mby5w
cmltYXJ5X29wX3RtcGwubWF4X2ZyZXEgPQo+PiArCQkJCQlzcGluYW5kLT5tYXhfd3JpdGVfb3Au
bWF4X2ZyZXE7Cj4+ICsJCX0KPj4gKwl9Cj4gCj4gVW5mb3J0dW5hdGVseSwgaG90IGZpeGluZyB0
aGUgZGlybWFwcyBpcyBpbnZhbGlkLiBXaGVuIHdlIHRha2UgdGhlIGJlc3QKPiB2YXJpYW50LCB3
ZSBzZWxlY3QgYSBtYXhpbXVtIHNwZWVkIHRoYXQgbWF5IGJlIGxvd2VyIHRoYW4gdGhlIHR1bmVk
IFBIWQo+IHNwZWVkLiBXZSBjYW5ub3QganVzdCBvdmVyd3JpdGUgdGhhdCB2YWx1ZSB3aXRob3V0
IGNvbnNlcXVlbmNlLCBiZWNhdXNlCj4gZGVwZW5kaW5nIG9uIHRoZSBib3VuZGFyaWVzIHdlIGNy
b3NzLCBleHRyYSBkdW1teSBjeWNsZXMgbWF5IGJlCj4gcmVxdWlyZWQuCj4gCj4gSSBiZWxpZXZl
IHNwaW5hbmRfc2VsZWN0X29wX3ZhcmlhbnQoKSBzaGFsbCBiZSBhd2FyZSBvZiB0aGUgZGlmZmVy
ZW50Cj4gcG9zc2libGUgc3BlZWRzLiBJdCBzaG91bGQgbG9vayBmb3IgdGhlIG1heF9zcGVlZF9o
eiBjYXBhYmlsaXR5IGFuZCBub3QKPiBmb3IgdGhlIGJhc2Vfc3BlZWRfaHosIGFuZCBmYWxsYmFj
ayB0byBiYXNlX3NwZWVkX2h6IGluIGNhc2Ugb2YKPiBpc3N1ZS4KPiAKPiBPciBvdGhlcndpc2Us
IG1heWJlIHdlIGNvdWxkIGdvIHRocm91Z2ggdGhlIHdob2xlIEkvTyB2YXJpYW50Cj4gc2VsZWN0
aW9uIGFnYWluIGFmdGVyIHR1bmluZywgd2l0aCB0aGUgYWN0dWFsIG1heGltdW0gc3BlZWQgc2V0
LgoKR29vZCBjYXRjaC4gVXBkYXRpbmcgdGhlIGRpcm1hcCB0ZW1wbGF0ZXMgYWZ0ZXIgdGhleSBo
YXZlIGFscmVhZHkgYmVlbgpjcmVhdGVkIGlzIGluZGVlZCBub3QgY29ycmVjdCwgYXMgdGhlIG9w
ZXJhdGlvbiBzZWxlY3Rpb24gbWF5IGRlcGVuZCBvbgp0aGUgZmluYWwgZnJlcXVlbmN5IGFuZCBh
c3NvY2lhdGVkIHBhcmFtZXRlcnMgc3VjaCBhcyBkdW1teSBjeWNsZXMuCgpJbnN0ZWFkIG9mIHBh
dGNoaW5nIHRoZSBkaXJtYXBzIGFmdGVyIHR1bmluZywgSSdsbCBtb3ZlIHRoZQpfZXhlY3V0ZV90
dW5pbmcoKSBjYWxsIGJlZm9yZSBkaXJtYXAgY3JlYXRpb24uIFRoaXMgd2F5LCB0aGUgdmFsaWRh
dGVkCmZyZXF1ZW5jeSBjYW4gYmUgd3JpdHRlbiBiYWNrIGludG8gdGhlIHNlbGVjdGVkIHJlYWQv
d3JpdGUgdmFyaWFudCwgYW5kCnRoZSBkaXJtYXBzIHdpbGwgdGhlbiBiZSBjcmVhdGVkIHVzaW5n
IHRoZSBmaW5hbCBvcHMuCgpJJ2xsIHJld29yayB0aGUgZmxvdyBhY2NvcmRpbmdseSBhbmQgbGV0
IHlvdSBrbm93IHRoZSByZXN1bHRzIG9uY2UgSSd2ZQp0ZXN0ZWQgaXQuCgpUaGFua3MsClNhbnRo
b3NoLgoKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
