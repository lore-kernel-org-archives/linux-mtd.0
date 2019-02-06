Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DE9C282CC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 04:06:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316C120844
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 04:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kTGlozcy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=denewtech.onmicrosoft.com header.i=@denewtech.onmicrosoft.com header.b="bu7aHUTm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 316C120844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denewtech.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MXyy4kGN43Ce7QYS5bLC8ngbBU1cskGBQSOYG4Z2ems=; b=kTGlozcyy2deO2
	cpzf6+15aeZbfJNFrfdBeefFV3FC0pzYZXh0Oe1TRYt4HlwlYWUWAYIsQ2wUiIW0cQmLbJx/UhXC2
	xniv+TK31sNbYNiJdzn0QmEPtTtdTO6kHhA1hh3xBeUcA9HWSCBndKKWBwMzRZpfqphMHFWHHVJ1o
	MsQmuZ2/vHYLEMmJcqkJciax8PMpm+WTxSrIFGog6fWl4hnPFaCy2bssQs9cTFpbPuiJa/KezQC6Y
	fh2lvXyWHEYzTuGkqbMb+nuupWAXMHgt6jsfEqw2UwPYQhguniLa9hqxzEKgBayx3+FWt/LiU6gP1
	0A4KKSac0nA+Z9FrvnWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grETM-00089z-MH; Wed, 06 Feb 2019 04:06:04 +0000
Received: from mail-eopbgr820053.outbound.protection.outlook.com
 ([40.107.82.53] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grETI-00089K-LO
 for linux-mtd@lists.infradead.org; Wed, 06 Feb 2019 04:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=denewtech.onmicrosoft.com; s=selector1-denewtech-org;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybEOb2WDr4Bm+FtRECXVHCIcMdrPgntNiLC3g4shhsg=;
 b=bu7aHUTmjoIxp1yQFVe2/nOOCWaGvqQbMcyyY0zrUnpTDlBM64gG3KnvQOYiungmXMWVM9+MLQgH063JiddiBdeHSycL1Sc+43esbvgAhOB09d2sX8VjjyiRbPpj26J0AFznV8ghjzGE9nkR97xTho9YsSCr6CQrLIDBjBGr9UU=
Received: from MWHPR04MB0944.namprd04.prod.outlook.com (10.174.174.154) by
 MWHPR04MB1103.namprd04.prod.outlook.com (10.174.250.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Wed, 6 Feb 2019 04:05:55 +0000
Received: from MWHPR04MB0944.namprd04.prod.outlook.com
 ([fe80::753e:6f6a:5f2:4e32]) by MWHPR04MB0944.namprd04.prod.outlook.com
 ([fe80::753e:6f6a:5f2:4e32%5]) with mapi id 15.20.1601.016; Wed, 6 Feb 2019
 04:05:55 +0000
From: derek.murphy <derek.murphy@denewtech.org>
To: linux mtd <linux-mtd@lists.infradead.org>
Subject: Ciao! 
Thread-Topic: Ciao! 
Thread-Index: AQHUvdFCXdVPFTefWUutNm96VLYgWw==
Date: Wed, 6 Feb 2019 04:05:55 +0000
Message-ID: <44c0a27f-83c1-4c1f-b80a-8a409c2c3840@denewtech.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0176.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::24) To MWHPR04MB0944.namprd04.prod.outlook.com
 (2603:10b6:301:3d::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=derek.murphy@denewtech.org; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.253.140.104]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1103;
 6:K4/1lZ1lrLyRaTsfbYGJ1CWLrD9ar6hX2gJbSS1eKtttKMA8GR6e5U7jFb8zznByK6Z7fKAQYv/sa9nXHOhf3o4grL6Hu6j/vz8rwgEwvsBPdMG4rhOWf5AlS51vJdwhPeWHVPA3iUbon35Ss7GeJKzYEQgCzVQWuMExGgCq7VsCmZlJHfopwei6Bj1zelEMres/LtDmY3Wm9rTJ01vLn62aGqNLVODurNYp/DC2l8lwRcOItmQGzILVK1sWLqP/tC14yz7gxnrew9W0uLRegR6kgfxqol+WjPG50kEWMv0GTgAlPUbN2N2zegcYI545Ny+nGw7wRhPBu+pceDtzblQ7N3X9FDqtBUANbs1YKeQVIaEW6mssYc9+Osipw1EMfrdQ6HZFS6jubVb/4O17ye+XiqNksJKx19mn4x43oq/gumyU5E4vEDxWLoA2Xs8GQwcBkGbX9oTUa2RtF71F/w==;
 5:37B+Pcd0ebyhP6iSfCoW51QiRQ1zLnecLkRNzRJEZkf2TU7fkX7UAl3gQYfElQYH0CgxaYbEbA9kO+xOA9Yb9uj6mH2OmAYGS2FsDgxqHzljUW8ZVI2/V6qHpChZkk1DTf6Lt7P/6btWfyU3IJS1B+fZIT2qxFL7PFyKD/y+WyKnaaCNsMj7ki2VoTAyvM3Xe7iuwl+HJUjkeRtSVewKpw==;
 7:yBrVzW9wsCf+T/pXumX6VRJi6LZkQZb7XmLk5ql0lzaBeaeK0KtMIePsCdWcBZbp/W1smFAeBmJcji3WFa6LVOgq2AWrZUeNyl4i9GKiPiDcFhij209XojRXi8MkacHdU9Tw7y7g9239BnGiwHTP+w==
x-ms-office365-filtering-correlation-id: f6d0fef0-65a4-4b89-18de-08d68be86477
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR04MB1103; 
x-ms-traffictypediagnostic: MWHPR04MB1103:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR04MB11030405C8E465FE0A76339B916F0@MWHPR04MB1103.namprd04.prod.outlook.com>
x-forefront-prvs: 0940A19703
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(366004)(346002)(39860400002)(199004)(189003)(966005)(8936002)(6306002)(36756003)(6916009)(86362001)(2616005)(68736007)(305945005)(31696002)(3480700005)(53936002)(2906002)(476003)(66066001)(7736002)(99286004)(558084003)(316002)(25786009)(386003)(97736004)(81166006)(256004)(7116003)(786003)(81156014)(6436002)(105586002)(106356001)(6506007)(226693001)(14454004)(8676002)(26005)(6512007)(52116002)(4743002)(486006)(71200400001)(6486002)(3846002)(6116002)(31686004)(186003)(102836004)(478600001)(71190400001)(226143002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR04MB1103;
 H:MWHPR04MB0944.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:it;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: denewtech.org does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P/zj7gQoS1e6k5pbf4dbbFLmw+qOAyOBvuRo7gABkL2EDfIqVj71Sn4rN2AQ+K44GuVvI2LDFThf81VN2ThKkUNwllhqhqWPtUDJQHGIdzABVucXCCvSvo8RI/QUD+2pRAIrcelydroa2iCk0Jh06B10o4RTsE10Y5hLh8XQXxKT9rw5BiuxQVXKfb1FtnCZQ5gTdlyMV4FBQsXKM9ZiQ8da1XU0jef2eBLqb1Rmkz342FjW6HzM1U1dovhAs4OAFxKorG3KwhaV2QbQRpl+lsnB+qZSAq5e2nMJGt016O/9Ov12cDV/js3WF3orOKHHyVCOTXi0driTEQkleV9sPzDWVZ+pbPx9J+aUM2jzCncvOCoKCxEtihXHMpQRzehB9Lfd11WzpQq/wd7iDJ2xCme5c/KFtyKGnJRP76px8as=
Content-ID: <A427B90713AC3640BBC9D0A76F267CB3@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: denewtech.org
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d0fef0-65a4-4b89-18de-08d68be86477
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2019 04:05:51.8289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 86df104a-c428-43a6-bdc1-64ede511e259
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_200600_945020_6A318BDF 
X-CRM114-Status: UNSURE (   3.09  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ciao! https://reoloaprespe1982.blogspot.rs/




Sinceri saluti,



massiblue@libero.it 


05.02.2019 20:07:12
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
