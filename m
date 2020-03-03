Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6F9C3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 14:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE2A20838
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 14:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O7FO0GtF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="FsuX/uFa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FE2A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6AW1YP9tvXHUP3WJqBJdJN7EiZag7y7fIQeO6z1LPE=; b=O7FO0GtF5V6SDw
	mQhrhMarIO6h7IcI9s2WKp60WNm8hDXdWqGNLG1g5eb9bxXV5quBxLkMOY0nLvWqpMCBgKMfM9+Tj
	4D7yFayVVd9I/4ttp7hOs22z0uSi+YZhCURanhdbhoGyFya2ZzM9mPfuTo9jPKu7uG80mjftor25K
	STHonguYU+l3G6J0kSSvDQws8pWXw6r4i6oCadEzfJua+ceeYbeK/EUBhplv8UZtl9ds9VbaQe6uk
	98kBRbSpdmHIrRdT+P/4bHbqCLAN67/zroH5kT+JhNS1lZfj28ZdP3frukeoJiH0AybWXTZAxfgfW
	laz4cUzJ6mS8yWy70EFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j98Wo-0000Ve-RV; Tue, 03 Mar 2020 14:28:10 +0000
Received: from mail-eopbgr80090.outbound.protection.outlook.com ([40.107.8.90]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j98Wm-0000UQ-4U
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 14:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJmPLIj0bmcI6xcNK73QjAeNMqVi1zv7WQ/vQ2Ol5b2erwPWwB7MXNmIl4Wx67e7JMqiUFWJdKHmP9INS1sVN7nb2Cvy/Mm5Tu8jrAPEMKl225h+q577G4juUqlfJwZXlqwO55WVA9dxst5Ny7MHKCxn+hijcZjXIPg+qzgGMB/XE1U5TgJ+h6s7eX0192ZIQCmFHzIvZkk/0kcwqGT5zgUnPkzxM59DYe36wKHOqtFyFUuHpSxWscy27EqHQQPeF+Ct2zL1oOS4D02bJ+cqiayvxFmQbxQrFt270of8ey94ZZZ+ovmVSaLvg5zUDFTpKQ77nHOcTiSs1onQgGG0AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gsl9LHSNbJAVENyBOjM96BfzCIaSu9kdmOa/WHUJD4=;
 b=kQ+2qgqg9IPVePXdyaTov0R5qEAgRN/UFBKlpJk5wcHjeipU4R3agsDE4c/r09NdeN06gLPnurGWambrPHTkYyACC6+NjI0N7sZBgjVo3XR7guYXSYNEI6FTITXUfTDv61Hq+2FS8ckIUmSUiiUGif6aRSOJ0fkzl5iFpsAWilP58RqBRUnxp9dcGVFLO15nWavuF9YHHs+ZABplX1FBM5iHpEVbdRAoNMEnivcM4FFK6Gp3aKSDTjdIi+nXhdYS3vcjWdnDV/xYUtX9fb5Sw4BNl/nnLMS8du8UzB/14/5d8a9IkarIWx0Ql0hLG2h+XcvdN1eNaFTxey/nC2AKkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Gsl9LHSNbJAVENyBOjM96BfzCIaSu9kdmOa/WHUJD4=;
 b=FsuX/uFanGvm8FBhO/r2KRERBXP8fv0T6sCWsBGf6K9J5+fYUnf1SGqMRtNUWsHMe8DfYewFOzIHhWqsKLE1+xcpMrK5iF+062x4iYrpRfCbmihZkwo8ZRbex8rTW/MVkeugV7HXCq8q1yNnZaUNf56K/KP6RafY/d/Pshr9tnE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB6126.eurprd07.prod.outlook.com (20.178.121.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.9; Tue, 3 Mar 2020 14:27:57 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd%7]) with mapi id 15.20.2793.009; Tue, 3 Mar 2020
 14:27:57 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
To: John Garry <john.garry@huawei.com>,
 "chenxiang (M)" <chenxiang66@hisilicon.com>, linux-mtd@lists.infradead.org
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
 <18cdef63-75e3-97c3-2a22-4969d4997af9@hisilicon.com>
 <60b272c1-ab6a-7a7a-6f56-03d7c7daf8bc@nokia.com>
 <43ae2554-06c8-59f9-153e-094a326166c2@huawei.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <5d6f3062-677f-3d0d-b0d7-7c97c658ed89@nokia.com>
Date: Tue, 3 Mar 2020 15:27:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <43ae2554-06c8-59f9-153e-094a326166c2@huawei.com>
Content-Language: en-US
X-ClientProxiedBy: HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14)
 To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Tue, 3 Mar 2020 14:27:54 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4470b2f-c068-4656-de86-08d7bf7f1151
X-MS-TrafficTypeDiagnostic: VI1PR07MB6126:
X-Microsoft-Antispam-PRVS: <VI1PR07MB6126F3ED2E4539FA5570AFA488E40@VI1PR07MB6126.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03319F6FEF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(189003)(199004)(6512007)(8936002)(31696002)(81156014)(5660300002)(7416002)(81166006)(66476007)(6486002)(8676002)(86362001)(4326008)(66946007)(66556008)(52116002)(6506007)(53546011)(26005)(36756003)(316002)(54906003)(31686004)(6666004)(956004)(16526019)(966005)(110136005)(44832011)(2906002)(2616005)(478600001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB6126;
 H:VI1PR07MB5040.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RnmVXC9MaLyq6x/ukpe3//GsU5/6UVCu6s/MfffUe61ogf6KteUe+2Y9sJlLuWbfjYKZHVu/PCoucYiZQHX9SEibIUbEAr15jwkZHs/xYQbfd3i66RdDNGri4PDf6N8cilPndiJTNSCZ1/WZPX+yKvnLRBKnF9Ls2SmbXepROPgrQTgC9JLPE+9P6odw/tZkQtOeC4FjsMwRDjcb831uL2Yp8R+/yr5Nb2IYJ9lE6J4sbF0fvq/XcvWKr1eCObUFidK3ZcuU9/PvqtwSQRgL9nPEaxcPY32KJIHuAlGHOsPydK6bXCIPZgwZ+rsMWmktFpGGYvz0rr38pWF4+XgxNcJ7G5ssTBVGqxTmoEPJM8v6DAxVBqxNiNRE931h6WMcDNg93CyfQ+h2qEeRfFjEcM3dvI7UjQbKNqUjMDXOLwQ/BZQlFky0P7XL4ofYyGhdfKuZ12rrWnYU270/eXlctPC6Kl+yj15RVVZNuV7m/+IVB6yntzte/poTmPJ4et1I0snjcmQKuk0V8dqf1rP7GA==
X-MS-Exchange-AntiSpam-MessageData: 6upneDgBywY1C3ZiuGvpnyZVN4NlynacA22Q3qTXFjaglhAnqbc65wtqr0K8QEMrHn5uaKj87T5k2UDIIxT7O0Mqd5XT/khsUUOitRmVLldAEnKytrYqrHYNFeweiLynpf/WHFh34lpwjYetARPLuw==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4470b2f-c068-4656-de86-08d7bf7f1151
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2020 14:27:57.2322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8oU7rsfwQ61D0VobIScOsb5x5g/BjtBJEF84xNaCOtz9F/0tx1hQkKyjyrhh4cNnnyh8jMr3tUMm93oRVQH+g0DL1oEO/FVtb7sc43qqXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_062808_242485_5E287502 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9obiwKCk9uIDAyLzAzLzIwMjAgMTk6MjUsIEpvaG4gR2Fycnkgd3JvdGU6Cj4+Pj4gLcKg
wqDCoMKge8KgInMyNWZsMTI5cDEiLMKgSU5GTygweDAxMjAxOCzCoDB4NGQwMSzCoMKgNjTCoCrC
oDEwMjQswqAyNTYswqBTUElfTk9SX0RVQUxfUkVBRMKgfMKgU1BJX05PUl9RVUFEX1JFQUTCoHzC
oFVTRV9DTFNSKcKgfSwKPj4+PiArwqDCoMKgwqB7wqAiczI1ZmwxMjlwMSIswqBJTkZPKDB4MDEy
MDE4LMKgMHg0ZDAxLMKgwqA2NMKgKsKgMTAyNCzCoDI1NizCoFNQSV9OT1JfRFVBTF9SRUFEwqB8
wqBTUElfTk9SX1FVQURfUkVBRMKgfMKgVVNFX0NMU1IpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC5maXh1cHPCoD3CoCZzMjVmc19zX2ZpeHVwcyzCoH0sCj4+Pgo+Pj4gSXTCoHNlZW1z
wqBTRkRQwqBpc8Kgbm90wqBzdXBwb3J0ZWTCoG9uwqBzMjVmbDEyOXDCoCh5b3XCoGNhbsKgY2hl
Y2vCoGl0wqBvbsKgaHR0cHM6Ly93d3cuY3lwcmVzcy5jb20vZmlsZS80MDA1ODYvZG93bmxvYWQp
LMKgc2/CoGlzwqBpdMKgbmVjZXNzYXJ5wqB0b8KgYWRkwqB0aGlzwqBmb3LCoHRoaXPCoHR5cGXC
oGZsYXNoPwo+Pgo+PiBZZXMswqBhbGzCoG9mwqB0aGXCoGFib3ZlwqBpc8KgbmVjZXNzYXJ5wqB0
b8KgcmVwYWlywqBTMjVGUzEyOFMswqB3aGljaMKgc3VwcG9ydHPCoFNGRFDCoGFuZMKgbGFuZHMK
Pj4gaW7CoHRoZcKgYWJvdmXCoHRhYmxlwqBlbnRyeS4KPiAKPiBTbyBkbyB5b3Uga25vdyBob3cg
d2UgY2FuIHRlbGwgaWYgdGhlIHBhcnQgaXMgczI1ZmwxMjlwMSBvciBTMjVGUzEyOFM/IElzIGl0
IGJhc2VkIG9uIGZhbWlseSBpZD8gRm9yIHRoZSBwYXJ0IG9mIG15IGJvYXJkLCBpdCBoYXMgdGhl
IHNhbWUgaWQgYWNjb3JkaW5nIHRvICJzMjVmbDEyOXAxIiBlbnRyeSBpbiB0aGUgc3BpLW5vciBk
cml2ZXIsIHlldCB0aGUgU0ZEUCBzaWduYXR1cmUgaXMgbm90IHByZXNlbnQgKHNpZ25hdHVyZSBy
ZWFkcyBhcyAweDRkMTgyMDAxIHZzIGV4cGVjdGVkIDB4NTA0NDQ2NTMpLiBJIHByaW50ZWQgdGhl
IGZhbWlseSBpZCwgYW5kIGl0IGlzIDgxaCwgd2hpY2ggc2VlbXMgdG8gYWxpZ27CoHdpdGjCoFMy
NUZTwqAod2hpY2jCoHNob3VsZMKgc3VwcG9ydMKgU0ZEUCkuwqBDb25mdXNlZC4KPiAKPiBXaGF0
J3MgbW9yZSwgdGhlIHNwaS1ub3IgcHJvYmUgaXMgZmFpbGluZyBmb3IgdGhpcyBwYXJ0IHNpbmNl
IEkgZW5hYmxlZCBxdWFkIHNwaS4gU28gSSBhbSBpbnRlcmVzdGVkIHRvIGtub3cgaWYgdGhlcmUg
aXMgc29tZSBkaWZmZXJlbmNlcyBiZXR3ZWVuwqB0aGVzZcKgcGFydMKgZmFtaWxpZXPCoGZvcsKg
dGhhdC4KCkknZCBzYXksIG9uZSBjYW4gZGlzdGluZ3Vpc2ggdGhlbSBieSB0aGUgZmFjdCBvbmUg
ZG9lcyBzdXBwb3J0IFNGRFAgYW5kIGFub3RoZXIgZG9lc24ndC4KSXMgaXQgcmVhbGx5IG5lY2Vz
c2FyeSB0byBkaXN0aW5ndWlzaCB0aGVtPwoKLS0gCkJlc3QgcmVnYXJkcywKQWxleGFuZGVyIFN2
ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
