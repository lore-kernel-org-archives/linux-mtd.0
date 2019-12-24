Return-Path: <SRS0=lNmR=2O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D989C2D0CF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:03:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B1B20643
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sAY8KCVN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="L6KhDdR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B1B20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHaSoMsTaPgMlEcTvqDmEfUPNodIcrMtPi1bezyXVLo=; b=sAY8KCVNdif0A7
	KFbKDqGSoHW70r523DGT32kJYOSGq+OmDC44RZsRcc7a4OY0Rfl2RESyzQ0kVy6KUVYk60KGw8eZ9
	ULR3ENq4PYxdi8nTPrT1pRpX0V6sSbLjFXY8cQu955qtS3DxuRqZ2YcllZ1sWkhhwBDfrhQJFomdv
	ljKIe2mDauyjjci5EAJq5XeLOIG6oVaA9VoqCZX0CoFpyHHTkWKQOcQ760nEehA0dc3LtqisB6ooP
	HvGbV8LgwKenUFXjcWAAaJ1tBra92Q0umNGJYE5XDSPJYD1YRMmGc8y5TdBBmQBelpwe5ySgkSdyQ
	h+p+FzvKudD6gHyh5MHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijg5a-0000vt-Hz; Tue, 24 Dec 2019 09:02:50 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijg5W-0000vP-6c
 for linux-mtd@lists.infradead.org; Tue, 24 Dec 2019 09:02:48 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: SK51zKkuHLEliPHoy8ue2Dp174rXZtjpTVvlMLZ6uckeFnzu2Wabt6msZQ4lZlDZ53N8eELBah
 6EYiFn1UjNcIuhs9UXHIDa6UJYXbP9nVosaf1RE8trjy9rqRcRlEt44HNoCkm6aFBt4/nDuZMe
 IJFyFNiCK8OTGsqAK9XOb0Of1vl3a7lq+Jq9XfKT4rYPLxBR9rBMJvuW702ef7NxtPfN3sKFl0
 LueMps91t5ZqrHu8SGZOI75LCgS8GG3WwqnyAK1C3/BakwENTbNKYbpnDfv33p0jYIjUgNGF9a
 ei8=
X-IronPort-AV: E=Sophos;i="5.69,351,1571727600"; d="scan'208";a="61436181"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Dec 2019 02:02:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Dec 2019 02:02:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 24 Dec 2019 02:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpY8+8hUj5Q5qNBsIFwYOmxH608EHE3WsQR5UFMrwo0SyZuFCNyq62/eH5iKPyehbRCWg+Pl2hhvlpCG3abF25G3R0k5h3gKyqFn1QfgrZUVBFSn1LCXDJ7NNlDsHRBiSBrpUCJ0BISJhUiCG/lA4ZObA+zaXqGyAKxx9s5qeUGM8sh2Ej6oOyZFig71TTA+r+xLErhN7tF9J0P1cSCVLK8Y7Np8Jc8wSDtm91513wk4djVXogL8BBp6PkqqyIaxCRMTasns031TDGrYzu+t/28nLdPtnOpcftXvb+B3bh0Eqp10wgqfqDexJTnxqNg3S7h4Zl7o/qa4aixTlDxzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTyPfoaQjI7343hXGfeUFUrQqHtOgcNyQfUYh1/uGwY=;
 b=kMJUby+oye5DayvrOZNoX7zV/ZpPEEEU4z7iNthFSK7u9DonoyBcBDujrUBD08GNAvHrdAu5SILsiF74uJv0J5x0SoGZBr3bujTdxC+GgH1hque8wsn/RI6zAXAZ6DmixI0kA/ZGs1PtLw59eS5KGl0jbHBHNeap3GxAzb9NPmhMoFJ9lQTi72ILn7iO+KxM2TBSTyNkfiX2LMZo7HBwMegKvZDd259ABSffsvhC9DpKkAkROUKjXfRbcKEBqpppH2xlHiflDnQMwB4vKYEv68D7A1RSAaLQtcenAnxzD7WUbnH0+I5OF1obJNET5mk7MuXah3B3jx08FPIgUdrYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTyPfoaQjI7343hXGfeUFUrQqHtOgcNyQfUYh1/uGwY=;
 b=L6KhDdR2vePMcmyLfPwghz7h96PYLS+F4N63HVw9Go+eFCYxcb15ZbcLpLWcYaJjMgEgQM0Z+G2ohh52wHPYA2x7OA8jeNoYAJhptO7xDHkuF74FHA844Jkmq9qrqUA3TKGx0p1zIe/NdRxNzMvTaDDeqMzxEQOhC54EEkyj+J8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4141.namprd11.prod.outlook.com (20.179.151.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 09:02:42 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 09:02:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <js07.lee@gmail.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: fix typo of "JESB216" in comment
Thread-Topic: [PATCH] mtd: spi-nor: fix typo of "JESB216" in comment
Thread-Index: AQHVpcoXHiSAER/td0G5Hxn8njza7afJJjaA
Date: Tue, 24 Dec 2019 09:02:41 +0000
Message-ID: <1818e3b8-700a-6912-7ed0-0788130b7bdf@microchip.com>
References: <CGME20191128085855epcas1p4df769371adf54c302feff687fdb30279@epcas1p4.samsung.com>
 <20191128085850.27531-1-js07.lee@samsung.com>
In-Reply-To: <20191128085850.27531-1-js07.lee@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.122.210.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5744c705-3a6e-460d-f75a-08d7885008b0
x-ms-traffictypediagnostic: MN2PR11MB4141:
x-microsoft-antispam-prvs: <MN2PR11MB41416A56B2D10CE9D730FE2FF0290@MN2PR11MB4141.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:185;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(316002)(81166006)(558084003)(81156014)(110136005)(31686004)(8676002)(186003)(2616005)(6506007)(6486002)(26005)(53546011)(66556008)(64756008)(66446008)(66476007)(86362001)(76116006)(91956017)(6512007)(66946007)(36756003)(71200400001)(2906002)(31696002)(478600001)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4141;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2rlxL1trFtRe8y8Qoa2gSvMZgYgHJk3156reno7k9xNbfS702HsNfwh8RA5df8VGWeK8LnZtSLNrbCub0Pw0CMh0F3QzxFH7hXgD5iSEN+NZXYvyD2LM2OqqgB2NaOnQGK7jXcaVv6OmJddFIwHZbfYUGoCmklRGQHywmYhn98ICFwidAiwnwgShxA0nzleNQXEir6ebmnf+N4Lm5Uy5LjMhFHgtDH90gGEArAwDA1Wrpyx26wJWPmCzJS96nukZ8ZcjNxdOi9iTZVz2vTKW0Rx+TtsMI1vsj04s674S9H+teXcu3fkB3ytsnaFQdnULoPx8zEY2ueIWQUtmQ3Rim4cF9/8Utp0pwlWzCi46ww9RDd3JhEDgzqyMQODOrWqCd1gNJCJiJQYy+FzE7jlUjD+m475eY//PNvYSTuqgU/4uisrx+N6hFVy0aEiIvt0O
x-ms-exchange-transport-forked: True
Content-ID: <DC20C21BC1D09547A1713E0AEE5E0901@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5744c705-3a6e-460d-f75a-08d7885008b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 09:02:41.9321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+UYP9THXzRWCB8IK/rG2Z8GtJx5DXl6NEIn6iGGmJTyM9TndfBDBBIUm/ptBnPMgU+btNW75/qxjVw6oZew5XZWNQrJner/cAGK6IFkKEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_010246_245382_A4B26344 
X-CRM114-Status: UNSURE (   7.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/28/19 10:58 AM, Jungseung Lee wrote:
> Fix typo s/JESB216/JESD216/
> 
> Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied, thanks.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
