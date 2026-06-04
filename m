Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC78CD6E4A
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2026 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTzXf2IXa6XgD7D08UcYXqK/djodeucmL1HoEOmD5VY=; b=jqwBuAtozkaifk
	bD8fTpTVfINYM5spvzLBfHDyMcaPA4KbtDK4I0RDRBi8r6lylE9Ms0OpPybSB5ABKdWh7px1D/duD
	XLAjcTDkEdIxXRc9l7VE14+ZM/axQ4jWHAUzJrBCkaGuhsTV+MXuNl+2SPz39jWBBoJwQPxsV5xad
	HwBlCUbqRCrw6GsR5wvNJx3p8+CmeRrykeGPNRn+Dq+DEBK0l95kmKNinEiTMQj7NNY7mEtm2a/R2
	miSka8HHa5zzuWq8MW8kjXXJVTgbYK25GDBeM6V+osDO77sPF9wsBeYf7OystjlZ9KLS6uP/Eeid9
	fPeLFLdNT8Cw/7wWjNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6oH-0000000Gh6h-0Fkd;
	Thu, 04 Jun 2026 12:04:29 +0000
Received: from mail-westus2azon11012005.outbound.protection.outlook.com ([52.101.48.5] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6oD-0000000Gh5X-30w4
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jun 2026 12:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALd6ElrmDoFwE5J22/9iWM4SHzwVtM6xAixmEjr03rySwL3WChOuPZ729U8LCnjqN211QFQ5MNOuM+5pKAiiV9sTXZJNOkWEM+jSCAgkUwaI9pXzj5jjyFu2znw/y+OuHVpTi3Rq+mg52gUAmgF6sXCgrSnjL5JXxAl2vV2n6iHSW3zATJ/Ekr2ipyK5uXoIVLGNvJBrvH5edwrl+GfkWHkGbvy2OHoQr/Ya3gynlrZ79sawFmiMCIj96J2rEyGJQalrhFxgnJOIJH6YF6zPqZxf9trZanrrjTu9uY9IJFx8ApWTgOO3F1F6bCzBo6gLJGCLUHZOAw+bXezl4bVVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vFlR2mYE9+ij18ctHJUpd8B4x5AEXkXiQDfM1fIuJQ=;
 b=wjtutbOeyKgnSija98i620p4TjPwLJMFMrQtKJ6f+LiY+yjGeTfy6/g6Sywd2Q8K4WAfpWNjrC9vNdA+jtsmPxJo9qXbhkqJLI5we66jHYR5QqlGqy80Lhpk9OUSBlZnu9s/wkC/deAl6NAqWJJVzCOH6bzaBLgeb0mFGxUHmUPKevCXTbjBHXuL0I6cdKTyaiRrnQ99P5E0qzG/Y1K1bUd7IgbRypUqKTFFo0ds5/TZOfWiyb4Mndzk7brjBCGbSs4ldrMRJFqx2T1/ChCTC+mQHAOtH4LCY6pETwwAoJFuQ+1JnUvBBhtEK28WUfCKbvOr2KaoFeEof7ZdBHzwfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vFlR2mYE9+ij18ctHJUpd8B4x5AEXkXiQDfM1fIuJQ=;
 b=RQDhEcgdPC31mu5c8K8W+1xsM1S/FswRCx/C9SaoCZtGJpgXL3CdB0HudOEqOtr5eEaB469rewrHoRDiBG/zP90spgcI4hgCUVx80DfaxdmWKpege1QfZj0jAg7+s0UL/VHsFlfSEAYAZe9u0xhHtbU6BmVuYF8XQXsUrCQggjg=
Received: from CH5P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::14)
 by SA3PR10MB6998.namprd10.prod.outlook.com (2603:10b6:806:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 12:04:19 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::5d) by CH5P221CA0009.outlook.office365.com
 (2603:10b6:610:1f2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 12:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 12:04:17 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:04:12 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:04:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 07:04:12 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654C47ll3864081;
	Thu, 4 Jun 2026 07:04:08 -0500
Message-ID: <e3ceabe7-008c-4969-8e22-97ffa4afec4f@ti.com>
Date: Thu, 4 Jun 2026 17:34:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning
 pattern partition property
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-3-s-k6@ti.com>
 <20260602164945.GA475455-robh@kernel.org> <87zf1by5oc.fsf@bootlin.com>
 <CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
 <87cxy6ydb6.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87cxy6ydb6.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SA3PR10MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 348797ea-dbf2-4701-3ac5-08dec2316772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: ChX+34hodUHqwbJweaRWv9igi/nC02rz/Vf8fMfelATkbdfaIPF8v32nc50NuvM9QiJHypXjJBuU6WkMVgILSnxAna6mwPZySJ+EqvrgeVvzne/YUhu/sZkG3OSy+IsmApGuE2/FCGTMfz/ArrENxArevEyAaqOR0caOyl4HpykjTy1tOxoR99rfxaRb2lFLkcf3DN/4/vpV++v2xfq2Zha+QSFhhzYeAQo9oNAyk1jsR4yGFHKLJNcZ4uC/8DE4ahPUkB416ICZHuegqlL4Dso3g19EUWIp7jqiMyDqfyD6uyafHgYrSQWiIEA/SdvpTlZ6gbaZwnl7PyNF32hzoaLKMu5v7P6iEPFOsQu7K/z2JeQL0LxcF+zpgnMo3NX0mpB5B/PAi1Js5FNy0uDTJItyC88fTmXOS6GAEXekHcZLgtRv+PJLWYkVmmISh9uBpg6ie6OgImlW55G9D69auCC3E6D+jQ8p65/vuln9vQt3uyUncIJcNSfQw7sscKu7EafX67nyVYfUTNi+5vM/dqVLfjqDQ+EATRyOE3+jhaQN2tf+H7xUyQ3B6MRhh2O8mwo5Qpjb7m8xXil84dE0Oa3dYOBiek5mzTcXCbL+5cwDXaHnd3dUsBqSChfy/RaUM5WSVaEKfpyEU38SNP8fzrUk+2aoK48nS0N0OzEuVCVNkAKQJ0ZUIpR4NS4uRX2LSvw1+YzeppUjMaFw9jW7U/39Odh67XYXkHwC3OMEn0Q=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U/MSLLA+opXrqHQCuN2VhDS8kOVQ06o95tGWmdNIVUVppdcOKdQ930WE7n0ewtMMl1vtGxtBpadX4+pNw6gwleuhq6USQgG30xDGdrQfSRlk7SbaMBUS4n97PxvuUToyVWAcS9MMcDJH6vS/r3Lf0ZT9VBxhOrKGojtqH/xUFSDaXTvxGe3X00SjqG3VQBo0Vn8pqg1NQtYJ8/xDBV4Q7HKCvKZfiBMJKua0PjS0KMsyEsNm16iGAVI6cvJMuP0KKY51qKi8onS612Fv+uu8+r0VDWxOJMRYeFcUg1zyKlQnKXZQnEvFnytJmVSnpb2ksJjowrBdZ2X9D1fb4c7V+KB6/M3oPYRnl0jD64hFfxrdcg5jwRqGMDvziP06dlSvTae20pmBpGnQkkcL7TPvFh5Vdvk5i1OsGisaLLDQKC7Arkcnziwu8f0pCoMc6zs8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 12:04:17.7016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348797ea-dbf2-4701-3ac5-08dec2316772
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_050425_759095_8BE84848 
X-CRM114-Status: GOOD (  25.92  )
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

SGVsbG8gUm9iIGFuZCBNaXF1ZWwsCgpPbiAwNC8wNi8yNiAxMjo1OCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBPbiAwMy8wNi8yMDI2IGF0IDEyOjM4OjQ2IC0wNSwgUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4+IE9uIFdlZCwgSnVuIDMsIDIwMjYgYXQgMTE6MDHigK9B
TSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPj4+Cj4+
PiBIZWxsbywKPj4+Cj4+PiBPbiAwMi8wNi8yMDI2IGF0IDExOjQ5OjQ1IC0wNSwgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4+IE9uIFdlZCwgTWF5IDI3LCAyMDI2
IGF0IDExOjI1OjE2UE0gKzA1MzAsIFNhbnRob3NoIEt1bWFyIEsgd3JvdGU6Cj4+Pj4+IFBIWSB0
dW5pbmcgcmVxdWlyZXMgYSBrbm93biBkYXRhIHBhdHRlcm4gdG8gYmUgcmVhZGFibGUgZnJvbSBm
bGFzaC4KPj4+Pj4gV2hlbiBubyBwYXJ0aXRpb24gaXMgZXhwbGljaXRseSBpZGVudGlmaWVkLCB0
aGUgY29udHJvbGxlciBtdXN0IHNlYXJjaAo+Pj4+PiBhbGwgYXZhaWxhYmxlIHBhcnRpdGlvbnMg
dG8gbG9jYXRlIHRoZSBwYXR0ZXJuIGJ5IGxhYmVsLCB3aGljaCBhZGRzCj4+Pj4+IG92ZXJoZWFk
IGFuZCByZWxpZXMgb24gbGFiZWwgbmFtaW5nIGNvbnZlbnRpb25zIG91dHNpZGUgdGhlCj4+Pj4+
IGNvbnRyb2xsZXIncyBjb250cm9sLgo+Pj4+Cj4+Pj4gSSBhZ3JlZSAnbGFiZWwnIGlzIG5vdCB0
aGUgYmVzdCBjaG9pY2UuIFNvZnR3YXJlIHNob3VsZCBub3QgY2FyZSB3aGF0Cj4+Pj4gJ2xhYmVs
JyBjb250YWlucy4gSXQgc2hvdWxkIHJlYWxseSBiZSAnY29tcGF0aWJsZScgaW5zdGVhZC4KPj4+
Cj4+PiBCdXQgY29tcGF0aWJsZSBkb2VzIG5vdCBzZWVtIHJlbGV2YW50IGluIHRoaXMgY2FzZSwg
cmlnaHQ/IFdlIGFyZSBqdXN0Cj4+PiBmbGFnZ2luZyB0aGUgbG9jYXRpb24gb2YgInNvbWUgdXNl
ZnVsIGRhdGEgZm9yIHRoZSBjb250cm9sbGVyIi4KPj4KPj4gY29tcGF0aWJsZSBpcyB3aGF0IHRl
bGxzIHVzIHdoYXQgYSByZWdpb24gY29udGFpbnMgYW5kIGhvdyB0byB1c2UgaXQuCj4+IFRoYXQg
c2VlbXMgZXhhY3RseSB3aGF0IHdlIG5lZWQgdG8gZGVmaW5lIGhlcmUuCj4gCj4gV2UgdXN1YWxs
eSB0YWxrIGFib3V0ICJwcm9ncmFtbWluZyBtb2RlbCIgd2hlbiBpdCBjb21lcyB0byBjb21wYXRp
YmxlLAo+IGhlcmUgd2UganVzdCBuZWVkIHRvIHBvaW50IGF0IGFuIG9mZnNldCB3aGljaCBpcyBp
biBubyB3YXkgZGlmZmVyZW50Cj4gKGZyb20gYSBoYXJkd2FyZSBzdGFuZHBvaW50KSB0aGFuIHRo
ZSBvdGhlciBvZmZzZXRzLiBJIGhvbmVzdGx5IGZlZWwKPiBsaWtlIGEgcGhhbmRsZSBwcm9wZXJ0
eSB3b3VsZCBiZSBzaW1wbGVyLCBhbHNvIGJlY2F1c2UgY29tcGF0aWJsZXMgaW4KPiBNVEQgYXJl
IGFscmVhZHkgcXVpdGUgY29tcGxleCB0byBtYW5hZ2UgYW5kIEkgd291bGQgcHJlZmVyIG5vdCB0
byBhZGQKPiBtb3JlIGNvbXBsZXhpdHkgaW50byB0aGUgcGFyc2luZyBsb2dpYy4KPiAKPj4+Pj4g
QWRkIGNkbnMscGh5LXBhdHRlcm4tcGFydGl0aW9uLCBhIHBoYW5kbGUgcHJvcGVydHkgdGhhdCBh
bGxvd3MgdGhlIERUCj4+Pj4+IGF1dGhvciB0byBkaXJlY3RseSByZWZlcmVuY2UgdGhlIGZsYXNo
IHBhcnRpdGlvbiBob2xkaW5nIHRoZSBQSFkgdHVuaW5nCj4+Pj4+IHBhdHRlcm4uIFRoZSBjb250
cm9sbGVyIHVzZXMgdGhpcyBwYXJ0aXRpb24gZHVyaW5nIGNhbGlicmF0aW9uLCBhdm9pZGluZwo+
Pj4+PiB0aGUgcGFydGl0aW9uIHNlYXJjaCBlbnRpcmVseS4KPj4+Pgo+Pj4+IERvIHlvdSBoYXZl
IGFueSBkYXRhIHRoYXQgdGhpcyBhcHByb2FjaCBiZWluZyAiZGlyZWN0IiBpcyBmYXN0ZXI/IElu
Cj4+Pj4gZmFjdCwgaXQgbWlnaHQgYmUgd29yc2UuIEluc3RlYWQgb2Ygc2VhcmNoaW5nIGp1c3Qg
dGhlIGxpbWl0ZWQgbnVtYmVyIG9mCj4+Pj4gcGFydGl0aW9uIHN1Ym5vZGVzLCB5b3Ugbm93IHNl
YXJjaCB0aGUgZW50aXJlIHRyZWUgZm9yIGEgbWF0Y2hpbmcKPj4+PiBwaGFuZGxlIHZhbHVlLiBX
ZSBkbyBoYXZlIHBoYW5kbGUgY2FjaGluZywgc28gdGhhdCBtaWdodCBzYXZlIHlvdQo+Pj4+IGhl
cmUuCj4+Pgo+Pj4gVHJ1ZSwgYnV0IGJlc2lkZXMgcGVyZm9ybWFuY2UgY29uc2lkZXJhdGlvbnMs
IEkgcGVyc29uYWxseSBkbyBub3QgZmluZAo+Pj4gZWxlZ2FudCB1c2luZyBhIHBhcnRpdGlvbiBu
YW1lL2xhYmVsLCBidXQgbWF5YmUgdGhhdCdzIGp1c3QgcGVyc29uYWwKPj4+IHRhc3RlIDotKQo+
Pgo+PiBJIGFncmVlLiBUaGF0J3MgdHJ1ZSBmb3IgYWxsIHRoZSBwYXJ0aXRpb24gbm9kZXMgd2l0
aCBvbmx5IG5vZGUgbmFtZQo+PiBvciBsYWJlbCB0byBnbyBvbi4gV2Ugc2hvdWxkIGZpeCB0aGF0
IGF0IHRoZSBzb3VyY2UuIEhvd2V2ZXIsIHlvdQo+PiBhbHJlYWR5IGhhdmUgdG8gc3VwcG9ydCB1
c2luZyBsYWJlbCwKPiAKPiBIdW0sIG5vPyBUaGVyZSBpcyBkb3duc3RyZWFtIHN1cHBvcnQgZm9y
IGxhYmVscyBpbiBUSSBrZXJuZWxzLCBidXQgd2UKPiBleHBsaWNpdGx5IGFza2VkIFNhbnRob3No
IHRvIGRyb3AgaXQgZm9yIG1haW5saW5lIGluY2x1c2lvbi4gSGlzIGNvbW1pdAo+IG1lc3NhZ2Ug
bWF5IGJlIGEgYml0IG1pc2xlYWRpbmcgb24gdGhpcyByZWdhcmQgYmVjYXVzZSBoZSBpcyBtZW50
aW9uaW5nCj4gbGFiZWxzIGxpa2UgaWYgd2Ugd2VyZSBhbHJlYWR5IHVzaW5nIHRoZW0sIGRlc3Bp
dGUgdGhlIGZhY3QgdGhhdCB3ZSBhcmUKPiBub3QuCgpZZWFoLCBteSBiYWQsIHRoZSBjb21taXQg
bWVzc2FnZSBpcyBhIGJpdCBtaXNsZWFkaW5nLgoKSnVzdCB0byBjbGFyaWZ5OgogIC0gVGhlIHBo
YW5kbGUgd2FzIGNob3NlbiBmb3IgY29ycmVjdG5lc3MsIG5vdCBwZXJmb3JtYW5jZQogIC0gVGhl
cmUgaXMgbm8gZXhpc3Rpbmcgc3VwcG9ydCB0byByZWZlcmVuY2UgdmlhIGxhYmVsCgpJJ2xsIHVw
ZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdjQgdG8gbWFrZSB0aGlzIGNsZWFyZXIuCgpUaGFu
a3MsClNhbnRob3NoLgoKPiAKPj4gc28gYW55dGhpbmcgZWxzZSBpcyBzdXBwb3J0aW5nIGEKPj4g
Mm5kIHdheSB3aGV0aGVyIGl0IGlzIGNvbXBhdGlibGUgb3IgYSBwaGFuZGxlIHByb3BlcnR5LiBJ
cyBpdCByZWFsbHkKPj4gd29ydGggaXQgaGVyZT8KPj4KPj4gUm9iCj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
