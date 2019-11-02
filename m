Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C313CCA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9380E214AF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FDrNMgbl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Q2Yyq5eJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9380E214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSC4ENHSuD1McaRovnEcutfN8ww8rPE3Rdig4ejUi2E=; b=FDrNMgblx+8iIV
	gP1VzJ5AyLX6L6B3BE9Z90Ifzxz7eFLS9ipP0z5uyVEZoPhZf5NlIJB+K6AQQ+QIAX6T/sNeEpDD3
	86qvyrNlUfUb8vtqkHuX7PlIvehWwRN/htC/l7mmugCGi2D7te56z/r+8F5tE5FVL3TC6OdgXwVBx
	iL+9KPkRYxJeGiCvR7prquIQdReU1I1XRMOlVHNKeZHmW5oULWuFnHJ205LQH7oDPjKCoWAhO2V1P
	+POn+OXWdZtbGlcJbmp/VYLVuokIYbo3JFkw4mMUpupsh2+FW1XYkC/wBWpo4+jiGMaiJB2+BP1ma
	Tj4zj+w5jD18eTiqHpxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqyx-0000nl-8H; Sat, 02 Nov 2019 10:50:11 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqyu-0000Zv-NJ
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:50:10 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: BY2MD4iGtZnuctTw5Yn+smvMn0eHF9nsXHvox3JfhwfxJYDgTfI8zAApu4I9ACYi/wt+9z43ZV
 dGsZHExOk9OZAzP+e2Oj6AhU8RHMpccVdHn0JN3G94JsKEFdAT3KRj9xVQn7V8DI20UgLH0itk
 TeF8Jhk2JnwjivnQkCcdhYhz5PbofzykQV1JdzFz58bBGWnVPK4aVnOeGoOyrlYu3bYLsgzqGd
 Hzx0SDK2fy8Ql53mUgNBfyg915PgYuWNaQosd44exvesqqHqkxAD8gpOPE7nuuFYyPtg6XJ9et
 Hbo=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53868448"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:50:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:50:04 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 2 Nov 2019 03:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCTl2CF2nT/0HOg6ungYL2yLJf1Ev9FSE+9H/zFy7A0sEbP8fhx9OMIJpNg28RuJ862uAydDbSRANwzjL6hkQ3iQFg7JOoThXRhihdo/Ci6r9CF/mgh0vnpsIjjb+9uX0JbWzGRPi/Ha1U/AsfDfSfGEyGjk6COBuYxDF5z/5RDftYZ9qqB0leDfEkiOEn4pKU9OZcKpcmP5wwFOfoYiQwOez6wdnvavSI2OkBOFzF4BuGbELrJAJi+KiMiwJ5RTd8n/R4sftbzDJ1FeQmPwwRtv3O01SbgFtJwCqzAPBJzthZDel9LPYKU1GJcnIsU5CB+8tZS3s3D9LFQ5rsL+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuxTv6xmIxRkFr6pZ4IcpqNCXjQPgU9TFoC1WxJAppk=;
 b=PtoegXTF3WboRWAk8b4sxVgQ1z1sG7JNvDdSgmwW2Fte/2GyxgCbJkTWBpM7TSYapElQJ/1zQ9plZdUXZG1noGNQHaBOqcQkAxLSs5ejTX0tP4oCLXq6sCW3KsSEdP0K9E7utJbKj5QdNwpiseioWKKuflo79dwAbowW+JaOsOJmtRQJhdedCOGBOctN62+Xx1l4S7cqOdx6hEFsIff6xG9paZ4vzAtbBMgnzDprDSynPx7kk39/LyFEcwD/J882HofjkEAYNwjxrTw/manJ7ikB6Ti4SVxyet1Tm3Ohs27Dre1HgN3kvUE+EhgBz9dBrn27zzqSepNp7IscZIevug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuxTv6xmIxRkFr6pZ4IcpqNCXjQPgU9TFoC1WxJAppk=;
 b=Q2Yyq5eJd7Vsjp+o+BHZpNL4yg+2+fShDamZRYse/UXXbnFAeNK2LpiamZOw0X0NKvUo116ssruGwthnoDRpjtnEBkLAfpqzKrnC2B/BA+L3aOtZmlCZcjVvdya8Xo+pcVOE7XSNY+g3vEatKFyNOIJWOKbRC3qv6NacDgO/hhc=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3871.namprd11.prod.outlook.com (20.179.151.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Sat, 2 Nov 2019 10:50:03 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:50:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 0/2] Fix silent truncations in the SPI NOR driver
Thread-Topic: [PATCH v2 0/2] Fix silent truncations in the SPI NOR driver
Thread-Index: AQHVj1Ia2jxZOpikE0Cr84dNDESYbad3t9sA
Date: Sat, 2 Nov 2019 10:50:02 +0000
Message-ID: <af8d7f71-c31c-379b-1bc9-9dedea77b657@microchip.com>
References: <e069093b-ea7c-9a8f-7700-ee0d8d23ef91@cogentembedded.com>
In-Reply-To: <e069093b-ea7c-9a8f-7700-ee0d8d23ef91@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0191.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::15) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99aa9852-5a25-4c8a-e10c-08d75f8269b7
x-ms-traffictypediagnostic: MN2PR11MB3871:
x-microsoft-antispam-prvs: <MN2PR11MB387195135785A387DC55F570F07D0@MN2PR11MB3871.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(366004)(346002)(376002)(199004)(189003)(11346002)(81166006)(446003)(316002)(8676002)(486006)(2616005)(86362001)(6506007)(7736002)(476003)(110136005)(5660300002)(305945005)(53546011)(31696002)(71190400001)(26005)(186003)(81156014)(8936002)(71200400001)(3846002)(64756008)(99286004)(66946007)(2501003)(36756003)(102836004)(76176011)(52116002)(66556008)(66476007)(66446008)(4744005)(6246003)(2906002)(6116002)(386003)(6512007)(229853002)(25786009)(14454004)(6436002)(31686004)(6486002)(256004)(14444005)(478600001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3871;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q/paJlGWsxQkIRxNUDxW/WR/bEsCA5V04H+zjMcb1G2F2b8j759STmhPols1Ib5IRFn5bpsC+Sgb1qwEQNdwPsFaZjqBuDCg9MZWOs51/U92LF5hPc78A1D21GKMNLqavJrK+ABOB+6J2cusGdghiYBBjUgmOC4B443oUqGp5sei5K6EM1rMlLAq4ttaz1U383tNfnJOFBhIbOktgusMsAzAdOwkx7pDXTx4OGRF+4WXnDnHgtJW31nkflGLu+rqXztSCyGHH7Ki8I8Z6cUW7X5xvy3VNfF9Uklf8hrg9xll45NZcybzo7C6X88A0sOYir9ArBaXjdz8GLaDGmWRArE6hDzVZylHp1PiOM3OAj5IcEsKRJYkuVmBZOR0PDOTUr6oag4CDcLhCJ+YKsNPNyRURfTFRedcIpn2f7GH0KC5wSV4KrAKX0EpDlatvG+L
x-ms-exchange-transport-forked: True
Content-ID: <E64A4AEF4890524A9E8804F4A0AE566A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 99aa9852-5a25-4c8a-e10c-08d75f8269b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:50:02.7455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NS791WUyiK6nD2sgVrbUpU6Ilq04deHNu3R/oIbT/OEZeCl7Y3z0W3V9xSfCP+L3z7mxFNLsltBGciSu/7nY9RyrPXHFBSnk664g4rsMlDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_035008_813953_8E803326 
X-CRM114-Status: UNSURE (   8.56  )
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



On 10/30/2019 08:44 PM, Sergei Shtylyov wrote:
> External E-Mail
> 
> 
> Hello!
> 
> Here's a set of 2 patches against the 'mtd/fixes' branch of the MTD 'linux.git' repo.
> The SPI NOR driver assigns th result of a function returning 'ssize_t' to the *int* 
> variable in a couple of places, while 'ssize_t' is a 64-bit type and *int* is a 32-bit
> type on the 64-bit machines. The silent truncation that happens there isn't really
> valid, so we have to fix up the variable's type...
> 
> [1/2] mtd: spi-nor: fix silent truncation in spi_nor_read()
> [2/2] mtd: spi-nor: fix silent truncation in spi_nor_read_raw()
> 

Both applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
