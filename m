Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FCFC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74DB42088E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 08:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dE9hGWOv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="eusmKJvC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="nHOpedYv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74DB42088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IskeAh/Arc7aIxeDeWU9VhVFzL52mZNNmhfoF5QgQo=; b=dE9hGWOvPEzT5L
	lSlgCTGMUFDjKRLGU7PR1+J3H24czphhras1Iq55PPEySwSKC5yaZ++DsQwSxoaLCm7LxMP+H6U53
	Pq1WZDfSwbOpmt20d+/IqKKyCMhynex6stebY0gXHpRqebmpFuNkR+TxCrtZ+5GP/sNuDLRjkPF4m
	k9Mids4WFfY/X3zNdwoOfX6l30elZcV8Goywure2nx/I4KT1WiQHtewIX9FyCUenMd5B00CKKIRx6
	IDjqQ9qwHQFkOkoxgN9aA7/wgzfkZHDJO9HL2SOWUPeyp78kL7AjB27vpSHxGPF2fOSbxiCpDTErG
	+xuzO0W/JNd3yDsbL38A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDcL-00049S-Ez; Thu, 28 May 2020 08:10:21 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDcI-00048v-Hc
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 08:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590653418; x=1622189418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XLd7n7rMCkdWKnnl4uNRcWfS/47OPzOGqnxqm6u8kg4=;
 b=eusmKJvC0b07hZRKUtZmy0CY48ar1+u4mcTX/3w+i4fWT1h2QxyDuTWH
 sBQwKPhtWwyiJ0ySEa0QvU8BJZHg4q51s7kXVM+4dNebKIQuYj55B2MaW
 SN18usNCD2OTE21XNaGn18ayVX29JVSHUTV8l5Qeqge49HpPGFbCvy9Ze
 gCXp2ljBJ5NehOf6DUOs8gSN8E++KPZJxeAkJdu9CoTokT96JxWSJ1FO1
 XlGUOgJsJLrI4a/SahbVXzeAuqBA1dsRdJk+jArneEyaEjOHUgL2lBt4H
 GCOMaB+MTbbeqHrSiogI+F8e2uCC/4mCY3/BcslPgiRm5B/ddGAwm7r1N w==;
IronPort-SDR: FHBMb+SaMPgGMwDVG6RUMIb8h6PGAl903hksU0WPSjFWQLYYNl4ctFGMRa/Nz71K2OcnjOnCA6
 tStMfQMNLQ+PmEiGRoRhDdl6JrBfrmbE2Hy1mPMM2OSf5FvoB5jZBXX9bDmYm+Epnl+qfZ8v2/
 8SFuuKXaOSRYBN5bVKMVk43NRl6TPMV9jcjZgV3BDut/vG0D96PD4B73cTztZJQevO1PoyLhRB
 aoWkaEut8u/jenFGJCEDUdrceIB3qE64x8IwJFqZpt9JH73JryLApC8daMarhhanQPpJPeXKyY
 gSw=
X-IronPort-AV: E=Sophos;i="5.73,444,1583218800"; d="scan'208";a="77329823"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 01:10:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 01:10:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 28 May 2020 01:10:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVlUScTiJqiqx955v+UrCiYOFjBHTSsmnsYW616kNiU+ApRgSBD+89UBJwcQ6fE3TTeWv3gJ/lxD00nQ5D4Z7KysoOnadNuEcNoTpAJMd8qyMjkXqohd2ZvPzKThSt5ZHHbTO5LSZcSb2EF2Gkh1pAs8Uf9QCXUNH3WixKzMLGJdXleZk7oiyfuPPFLGepY/lhtt8pHP6VhlefSSmkKP0d1CfOqVxndDd9L7xv1BHYCHK4y0RNOfJ4uKL5LzxjfVBxlWYx7yay9p5pR8HyERF/fcBPWbdwlPb+Ugm6nr35v8otwDpqAJq8iF5yRQZBb3BfqESH/i563zQme2rvA4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLd7n7rMCkdWKnnl4uNRcWfS/47OPzOGqnxqm6u8kg4=;
 b=M+aNyf7/J/JoalyytSfOi+jn0BRm0Rx783UP70qHqK7XIj/1l5PzH2bFGbpJR1QHRHPExr+E8WGGj29p/jBmj3O6b/Q+uOm5aKRKI3zQIIIzHwDIhpOTRHlYVT9T2KDu70ttsZZ4BdyIjubvzDHRkh49lbeFeA0gLrcuEpq9MJrkw8E//VyH3wHH+UkMUyOcBGKih+GVQBweoOuS9u3X1MxkSEMdb1NZDLneig8E93BtKAhof7HQrJImHDIYa1TVKh9s7MErE9yHxAo26XWftJGc3ODB3hGH3qkEubSUWtQktGGPkjhpyIh/tzpMEwt0LadYe0cbbY0IFGSKMabTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLd7n7rMCkdWKnnl4uNRcWfS/47OPzOGqnxqm6u8kg4=;
 b=nHOpedYvcthq1ShpPpV1FbTW2MB9MeIk1WzJxaM1UmC2Fk68Z6VXWSE5bdeWqgjL/LDh6SlXyD7As0ch3eph9x43y9qt1Zp7zVNyM1tU74pxcJledsbA0fkGzC0CzhUD33vJhH/Ht4YMY0vQPikUclZ88AH1WCKFLxTMH6Wf2aE=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4134.namprd11.prod.outlook.com (2603:10b6:a03:18e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 08:10:12 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 08:10:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yangyicong@hisilicon.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for s25fs128s1
Thread-Topic: [PATCH v3] mtd: spi-nor: Add support for s25fs128s1
Thread-Index: AQHWNMdpgFtFKTkLHEavmG9ugo8Wfg==
Date: Thu, 28 May 2020 08:10:12 +0000
Message-ID: <20296452.IyAK31tqu9@192.168.0.120>
References: <1587546809-3797-1-git-send-email-yangyicong@hisilicon.com>
In-Reply-To: <1587546809-3797-1-git-send-email-yangyicong@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 113fe9d9-c2c8-404c-6904-08d802de8bc5
x-ms-traffictypediagnostic: BY5PR11MB4134:
x-microsoft-antispam-prvs: <BY5PR11MB4134EC96D0B60DE5BB39A9B7F08E0@BY5PR11MB4134.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tCm0Jru54NUqOPOLKGPj3cNP8mWWTMEdigOhm/bo5gdOK+1N3FHNY6+lNLvYPZo5mY0hFsb1VCDQxJ4USaaPGMZ1xZFDcKM0wavDs7TAbxZWcVW+ODswPzxKDfLNuASnoZNezQmw39YhcPCsAg6O2H2aCwQBE1LNx5S6TLQnjc0r7Kg3myY9vTlUDv/g2LO4WJs6pM4iomgZJIMwgTSYbP2g1WMX/4n6/xOaUJZ/ytYHkt+QBeoQiif+ZF8CzjVcvD8moWlTSfAfQnuj10muZeQtfDv8czpwJU/yryT9h6qhb3gfB0Ec8tT5fgSIPidzUQAOKaPHkBRPS+wDmMfiVCmV/7D6RGuuZuXCY4ySgo0J00fCEStcsn7wgECxQTey4tRT1YuQeyGdzT4ROzvULp8EJUEz31yfqcc4T/fWI7jBxhr6UYB/SNmmbp1CFTHj272pePakT6QnpnT7VkChkHKN6OigyQFrrIj44Zxfu8A+LQpfHbcHF1zXXYtBQ20IoQVhQUSgOilOh9F3OFJWlLFuUhnsmkC/Hhcl4XQmegn6kzA5GbYnaaUZHCCNCxqE2xSlKSIQMB4Dcy15deXYwT5Tl31paXXJY5X+17ZNGZ3APCoYeDdt/NLqshFlQDC9YkAGHcihSS04AjN5nOMwiRhdjbB6YtJKdXN4PJkAKIWn2gjuB8SrFTi8ci0aHqzJUD2lyu8E4wYh/wab+kNvKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:OSPM;
 SFTY:;
 SFS:(366004)(376002)(136003)(346002)(39860400002)(396003)(186003)(91956017)(76116006)(8676002)(6512007)(9686003)(66476007)(66556008)(64756008)(66446008)(14286002)(66946007)(478600001)(4326008)(6486002)(8936002)(54906003)(316002)(53546011)(6506007)(26005)(6916009)(86362001)(2906002)(71200400001)(4744005)(5660300002)(39026012)(138113003);
 DIR:OUT; SFP:1501; 
x-ms-exchange-antispam-messagedata: 4vpHpfeA2VwjDedqZxvXJmtnZDBQNRu3YkbLnanq6qCDSSMkEGsxRSa47u2V+O6NEEwq374d3pSCp35DoKkHjYdBbJ9WgcTP335X6ug8Y0C1wHJOqByd5e3LdA+EfpPxRuCZDZLg4iOrJh0XNV6oi2fen8y7dw4ingEgLao7l5TCGIft9M62SAd7D/aPiJ+lGxYHakFAVIj6Xg8K7XetwY053Sy9eNdwI010Qr+S8EGyIGZPi0ouDImwZbHgs4qN6W4PIOVwUWcZag8D3DOygJt3XCb8Eyy/3Xai8QfJb1Ov/CSI/2InhahKP2eW0UXnatOGjgPjpj+T8zpjAAUUWW8Ienm9NGGv54ts7jRq4qhYucph7gITTzYHdWqp3Hrno081ZXaW6LZXoZdTZ1Hdpg5RzbB46Rkp4KgExd+xgDWbhidcBeteOHx34U38rgydrs4VPVQ1KTkc3SYfFF3F5qsas1zjNGoKTS4evbSr5e4=
x-ms-exchange-transport-forked: True
Content-ID: <651813A5052CD144A172B0053DE6D955@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 113fe9d9-c2c8-404c-6904-08d802de8bc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 08:10:12.2201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: znKsNLqCIngN6UsUS//JHWC9YGfLVJ+4Y3ft5TCfPerwv0esr9/o3/R+u9733FHP1vlkyT1nJyGGxx4ThclDQ89Supu2fliHqyjZkoQc46A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_011018_598567_E193D88D 
X-CRM114-Status: UNSURE (   8.35  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, yangyicong@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 22, 2020 12:13:29 PM EEST Yicong Yang wrote:
> Add support for Cypress s25fs128s1 flash. Previously the flash is
> decoded as s25fl129p1 by mistake.
> 
> Add it in the flash info list to correctly decode. The flash also
> needs a fixup for s25fs-s family. Further capability of the flash will
> be parsed from bfpt.
> 
> The flash has been tested under SPI/DUAL/QUAD mode on hisi-sfc-v3xx
> controller, all the write/read/erase works well.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Fixed compilation error, fixed alignment and applied.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
