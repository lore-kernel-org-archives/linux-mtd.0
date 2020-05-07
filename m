Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE5AC38A2A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 09:29:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6742B20870
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 09:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wvy75Jb2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="t+xw74CG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6742B20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8z6s5tJnBU1mqF0JcTH6q5/zrBSEfGrDkbhbmwTWbA=; b=Wvy75Jb2mjV8Ag
	nXAGJbv3ZrIKHO7mANjsu9ds5LACzQpZyBorFqGwFVmWoREbZZOXPYddlKep7PPRKy412mEOh571Q
	ixz5nIImFPcVWml8rQAcnI0ijI3rHCsunksuwO3dFBZD0rJD9a1sfr1Y4D0JowCl0ss3+CduX1iQC
	c9cXmilEY0rowvsnjwuHzNkaDL+jtLebgDjcYVgj+JPdTMV3c1drb/H1c7oXs9gB7HccoZmnf/B0i
	VqRs2BGo2Kmgu9SZFZZS1DwnZAJB9aIzMypjb376sTfJXL4YBySUJN6oqZ06gEpAhRq/KpbP4KE5G
	cKAphH9jpA5noGm2Q+fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWcq3-0000QV-UN; Thu, 07 May 2020 09:29:07 +0000
Received: from mail-co1nam11on2086.outbound.protection.outlook.com
 ([40.107.220.86] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWcq0-0000Nv-JF
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 09:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ8Cbnq0d5r4Ob4jOL7yozAkQ9m11EmeX4+AUCJaM+UZPEZHsOvhbmREL8r/eporm9/o1IzgaIsuYzmJcDs/o0VNbux9zJVukSoLg7Z1u8NIlBfblkaAx/rFhKZuPwq0KKKWdB1z5jErGb3EBV5GC5A/es9h8/FtGunhdr3ul0dRF7Bow9KNpJ7uGmOy7p4QUvzPblsfICucPmzgiwRCUyb4PbjzqkE8J5+OjDoudv4nGoMruGGdchgz5yhmzGPjFEes43DXWbhrHE6e/aTSHrCscWfEWNjPJjkwJCXnvVBGmb/qLcBVgaLiL3d/GWkhyNtWRQu7E0sFligVgaQ4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR6aWWG/ORB7saF2gnDdRmRdljrdFXla1OOpQSFFyNQ=;
 b=EHD/p1wCnUpKHyWoSHBFqGE42Cgb1/s9iDR1sPS81loZ+Zbo56pEzz53GgaTTuyzT5BdUfAmTN7M+b68y29l04OMovyUKHS/sgOLj7MbqCwl3WonSshpDgqpa2pKGZmKYNfMxujOzKixyr2TNK3Sw+LVfn7+Kx0jqgSA/83o18gtbNnAdZKFGLK9ZxVdgrp2H2SMxs8VgPc2hcz3LojRdM4ZfDPRj3OBqgUfA3BXnaJlyss0eo4peVBL5QEaHczJd8xsaMop/7oRGvASrGiHY56LEWAkfYBAxMdnfHSGiACNcVaQAGX8uU/Qsf+r/903EQZDZTlzwKGTH1vG9OJVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR6aWWG/ORB7saF2gnDdRmRdljrdFXla1OOpQSFFyNQ=;
 b=t+xw74CG3JrFgLht2Fzv3JvsmvUNTJ5QrqWMY6NGEp59xY/6s0kGFRUREjuM9O5aYBfgFiH1gJWpijsO1jc3lxdPRm0FxqkbDNJeGBgds0fBsof7/ND+TN2mXIUpVJOMmwHWGfFUbu0EG20JJAW5k+0DqALLF9EMX0CfG6fXrY0=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (2603:10b6:408:35::23)
 by BN7PR08MB4388.namprd08.prod.outlook.com (2603:10b6:406:f9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29; Thu, 7 May
 2020 09:28:59 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::9ca2:4625:2b46:e45c%4]) with mapi id 15.20.2958.033; Thu, 7 May 2020
 09:28:59 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: RE: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Topic: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Thread-Index: AQHWIT+tSg2eMxWQMkmMQ2x4Hr5xC6iauX8wgAAJXACAAHVPUIAABVcAgAAAtIDY4+LN9qccTiAAgAAF9gCAABWBAIAABWqAgAC2lLA=
Date: Thu, 7 May 2020 09:28:59 +0000
Message-ID: <BN7PR08MB5684AFAA722A0633357C064ADBA50@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
 <20200506210158.7fe33cec@collabora.com>
 <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
 <20200506224016.2d48d0b4@collabora.com>
 <130342272.192940.1588798779898.JavaMail.zimbra@nod.at>
In-Reply-To: <130342272.192940.1588798779898.JavaMail.zimbra@nod.at>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTJjYjg2ZmMxLTkwNDUtMTFlYS04Yjk2LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFwyY2I4NmZjMi05MDQ1LTExZWEtOGI5Ni1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjEwNTEiIHQ9IjEzMjMzMzE3MzM3NjkyOTMzMyIgaD0iY0dqRm15LyttYkdzV0dOVWtpSE1DQ0Fzd2Q4PSIgaWQ9IiIgYmw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBSEFBQUFBMXppSHZVU1RXQVVsSWRSTVpjRHNkU1VoMUV4bHdPeDBBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQkFBQUFmM09FS1FBQUFBQUFBQUFBQUFBQUFBPT0iLz48L21ldGE+
x-dg-rorf: true
authentication-results: nod.at; dkim=none (message not signed)
 header.d=none;nod.at; dmarc=none action=none header.from=micron.com;
x-originating-ip: [165.225.81.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 460e2555-3ba3-4172-82fb-08d7f26912d8
x-ms-traffictypediagnostic: BN7PR08MB4388:|BN7PR08MB4388:|BN7PR08MB4388:|BN7PR08MB4388:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR08MB438896A06906F6298693082EDBA50@BN7PR08MB4388.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J+Z6cmzIJeQ6W1wll6TIEosPqQpqvDp49eNA2Rpcz5FhUfqwH5G9dKQ191DJUwRcgfboHn4o6CbK5zWRBHl6gdG6yT4QjYBN7IZgIJLjFXHqJeq6LBXNjkQq3BMsBFKQz4KdctyWLKQ/CR+UtZdRevFIXDlHSTOeHOu8t1MWXT09eaxLNsaHxQ2YKg3Fxle7z45nX84/gAGe5tE/252iHv4BhbY1SyztUqA4+6/fH2u2G6xPFN+PF444Zpu92UkBnP3TR/F71xw2W8SDhC68CJXUvVVgiigaNloFRZ3sGjQA/xyR1yCb/A+uY8GklMHa0Jumky03+tdSncc04CWXaP70tK4tHult8pSF+Gzvf9s3Gvfwjdm4D+UkcuoIpFVaeialb+IJm4xhqRCelN/ocF5Zq+lHvRIAHsexNBxM4X7poBtzJe6TdW7f+83N2x2rOBQP7q0C0ALqpk7EFNQBXbJBQmGbYtG1SZL89ENLwlscMooWXN49jeEnKnzDZvpoo2GzO9/CEHjle3TRc8/32Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN7PR08MB5684.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(33430700001)(33656002)(7416002)(54906003)(316002)(83310400001)(26005)(83300400001)(110136005)(83290400001)(86362001)(83280400001)(83320400001)(7696005)(33440700001)(186003)(6506007)(55236004)(9686003)(66556008)(52536014)(64756008)(5660300002)(71200400001)(478600001)(66446008)(66476007)(4744005)(8936002)(8676002)(55016002)(4326008)(66946007)(76116006)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: sCbhgViAhxhTu5N8hYCDGa+oBe53cOUcW0pAIVOGyFzwu4hvZf8va2v/7O1XQaeF2ugXK6Uzir0Yc4ZQIzynmHZv1kFaKwfTeAZ0SUShOHaufQqAmT8h+IPqvp4hBRZJEmJMRRU0CIJIsf/09u1KchCKbYZfyFdP1rui/ThbFhAy17fLgymyOeE60DU8e/d+qZWYqq7XMBXc/y2jISjUbGKj0z8tkK9Q9vrWafBWRvsDzbjYlqDseR0W4CHiPY5o1g5OjlCRZF+B5OZpMWWlKUo27ytH0HGm2O/edoU0ydd/0uPZ4JkZTP4f7oUVK7rv7KJlyd+7xG65gU7mewK1wTgYqA1rwayVJrA3oZOM6WgxL44KX/3jc7G6CSSM4xuogP1KrAc2fTqyHTiRCeUYsQPLUAuHZLREDR3R0jiUkFL8eY2lXBYxqv61FQZP07IYFux8UhSalX3NypH8A+qCAS338uK6PxDIxv1quHGsiY8Fr18fNN/vCwpEhMNj0/zbroQUodd5DpKZ9YObvha7gd5Z4Kr+FYf28Glj9LdbjhzcZyTnbhMwov0o5nEpv17SDxBRIFZ453PEnfcrnj8D9UDc7UIJ054iTA1yxoY2ijj0tcD/072V7knp83uo4yxA0gYOFe8P1nm3ddP3+b7/gEj9TyJGOpr+3MH2f2HEi7xhqNt0WgGl2m5w13ZEMKBkPcbfDDMg3f+Np/I0D3Ghlh/6TmmA0PEY1aW3o49G1rmyMxGz9TIo5ATURSa4OQ9JdNL4CKHoHPH7EFB1J/Xy3BITv7VqcOx8Y5MV3xnrOhw=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460e2555-3ba3-4172-82fb-08d7f26912d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 09:28:59.6342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xe0qVG+oWrx9yFTJ71lNSThxU5YKq/mbkC+IshTGP0Y2dyyUATOWwYUkDIM/d4RNaOWYxBvUyBMFzYZIctRg8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_022904_631128_FFBC3222 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Steve deRosier <derosier@gmail.com>, "Zoltan
 Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmljaGFyZA0KVGhhbmtzLiANCg0KSG93IGFib3V0IHRoaXMgc3BlY2lhbCAgc2l0dWF0aW9u
OiANCg0KUGFnZSAwKEVDKSBpcyBnb29kOw0KUGFnZSAxKFZJRCkgaXMgYmFkOw0KUGFnZSAyIChk
YXRhKSBpcyBnb29kOw0KUGFnZSAzKCBkYXRhKSBpcyBiYWQsIG9yIGNvbnRhaW4gZmlsbGluZyBw
YXR0ZXJuLg0KUGFnZSA0IChkYXRhKSBpcyBnb29kLCBvciBlbXB0eTsNClBhZ2UgNSggZGF0YSkg
aXMgYmFkLCBvciBjb250YWluIGZpbGxpbmcgcGF0dGVybi4NClBhZ2UgNiAoZGF0YSkgaXMgZ29v
ZCwgb3IgZW1wdHk7DQouLi4uLg0KDQoNCkJlYW4NCg0KPiANCj4gLS0tLS0gVXJzcHLDvG5nbGlj
aGUgTWFpbCAtLS0tLQ0KPiA+PiBVQkkgc2NhbnMgb25seSBoZWFkZXJzIGR1cmluZyBhdHRhY2gu
IElmIHlvdSBkb24ndCB0b3VjaCB0aGVzZSwgbm8gd2F5Lg0KPiA+DQo+ID4gU29ycnksIEkgbWlz
dW5kZXJzdG9vZCB3aGF0IHlvdSBtZWFudCBieSBwYXlsb2FkLiBVQkkgc2hvdWxkIHNjaGVkdWxl
DQo+ID4gdGhlIFBFQiBmb3IgZXJhc2UgaWYgdGhlIEVDL1ZJRCBoZWFkZXIgaXMgY29ycnVwdGVk
Lg0KPiANCj4gVUJJIGV2ZW4gdHJpZXMgdG8gcmVjb3ZlciBmcm9tIHN1Y2ggYSBzaXR1YXRpb24u
IElmIG9ubHkgdGhlIEVDIGhlYWRlciBpcyBiYWQsIGl0DQo+IHdpbGwgY3JlYXRlIGEgbmV3IG9u
ZS4gT25seSBvZiB0aGUgVklEIGhlYWRlciBpcyBiYWQvbWlzc2luZyBhbmQgdGhlIHBheWxvYWQg
aXMNCj4gY29ycnVwdGVkIChFQ0MgZXJyb3JzIG9yIGJpdC1mbGlwcykgaXQgd2lsbCBlcmFzZSBp
dC4NCj4gDQo+IEEgbWlzc2luZyBWSUQgaGVhZGVyIHBsdXMgZ29vZCBwYXlsb2FkIHdpbGwgY2F1
c2UgVUJJIHRvIHN0b3AgYXR0YWNoaW5nIHNpbmNlIGl0DQo+IHZpb2xhdGVzIHRoZSBJTyBtb2Rl
bC4NCj4gDQo+IFRoYW5rcywNCj4gLy9yaWNoYXJkDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
