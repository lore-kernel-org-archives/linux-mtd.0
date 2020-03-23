Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFDFC4332B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:46:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE2472072D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 09:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kjtjq431";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="QxSwABpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE2472072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPMeucZQ7X2dukow9fPCl3ni9C7XdGDw/pY5yLHZAFs=; b=kjtjq431GUHu+L
	Xnmh4BRPRbaqfuVustZ1Kly79L1p2SAYJavtCDzTEUDN5Ij15Dk7Tnhf5Dp/mglJ9r6zt+nlnm6lO
	BMOFLocwrukZ3CB7BNZ1+O5wVBGDKKiFyZhLuY17GvH8zIT5nJWWj1B1zPx077hlKCncu+vyRgl6x
	KnidzVPwhykkzqdkBteDIY1XxITiDiaxuqPv3TUHjDWR/tGde3wphjkWIWYblOMpdO4YvC2RcnDSl
	LlTzqQTKWCEPwYSWvGgvxFC4B4DZZsuDs/OwJ2r4xJQ78LsOD17Gxyxv+I2RsKo4DgHvGmvSNgBgl
	94+OLWKts4MK5DLk7EYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJfB-000183-0D; Mon, 23 Mar 2020 09:46:29 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJf8-00017b-9i
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 09:46:27 +0000
IronPort-SDR: QeanZgIWB2EF7OaVmuc5PadJLqiDWYYyojzjGYMFOSx9ct52SiNbphmqGHesvWd64djnGd45d6
 rSTUDJnHfFSr5K2mmSmfrSVD3/AUA2FpnSqxCDU3XsUHYJsFCa8Ezo2Rfsl7tIWXv9b7P0XUHO
 6YFbGakAyBnF84/Eq7B+L6kaV+Bqrk24zibGpkyccX31EsZMXM+hL0+0XqvEMDhSbBxw3RISJr
 6kXfDFapp2yyGZJ5fdO2/+/8C4nyZ1smbSM5Me97LYbqMsMui99v0w90XkDdmp+Xaxfc50OnCy
 WTQ=
X-IronPort-AV: E=Sophos;i="5.72,295,1580799600"; 
   d="scan'208";a="6622418"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 02:46:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 02:46:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 02:46:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W64zl7ayHLVDQNXqgCPWvL2kgSinhWp6n9IpMz8wKtcu0OOSkHTR4jG7OWsBHAnXCHvE87fzFKxzPBMvPi9BH8fk2c45FoMFNpnC13u6FMlajj8DcJeWR5qnHrPsYY1CIeDD2LUgst9ERQlhw8HTl2RzQqwplzD3rBT9X9jtvT+HUCXJgCRxRal3FwuSJwoq5yN7shVhf5TT0u8cNfkOayBs5TghkxOGQJZ7nX24VXKrDTjgyawBXmXXmWvtOe33+HeoQ0LYok/FgiJTk5JmShJD2lTOd4bZLTCSoRpsltqCydWqBXInuFM0IMmyQtZ5yW/XAZAnlv+svaoeK+Abdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QWx9XTw9Wt9mNMej3+jFi7J3TN/wMkEu81lDZSFl9k=;
 b=k4KafInSzlBuw+rljv2q+Pr0mdrKJjJ5OD5RnBv4b2gU7EEX1KBm9dgNG2vxIY0Y2/n5MOkxbxQqnJBRRKrTpWHZilXeTeif1OsgFnWZQXfNayYqyKur/lmnadxC+MsIFrL+gkEz/MbqKrCAYkE1+jx18f8xh7kK0bQjZthTwLIqPAyF9FCkz498vhmjPZ3d3Ntq/vZIVrwUFyNcJt42eIPVi/OWQ1dheFj4OqydoLDjEt1t+SNBR1dXVLUja8eEcfKcXgIJkDg6JT8XUM73g6H9cj5oRb8xgf0GsbVRXuur1t1UMUm24jQWL802oY5iUf1Txs6hC0uIVywWbSg/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QWx9XTw9Wt9mNMej3+jFi7J3TN/wMkEu81lDZSFl9k=;
 b=QxSwABpER6m57h57Uv/MvvZQFxl9K86/RvVVn6pRmNbg7/V7Y147CPJTio+IsJpcWmTNfLg9nQWexK5rUwSDqlySmL4zyAY8lbdu90bqCb/tcx7q365aGP2vtFIUb/OxHpxKmlbsYkiunbzurvCa+MishAG1yk67eLI2FbGPpJ0=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4168.namprd11.prod.outlook.com (2603:10b6:a03:181::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 09:46:22 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 09:46:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: Add 4bit SR block protection support
Thread-Topic: [PATCH v3 4/5] mtd: spi-nor: Add 4bit SR block protection support
Thread-Index: AQHWAPTe+FMJ8S5uPkm5x+wjpuNoJ6hV7eUA
Date: Mon, 23 Mar 2020 09:46:21 +0000
Message-ID: <50996383.L12nlKlULt@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-5-tudor.ambarus@microchip.com>
In-Reply-To: <20200323092430.1466234-5-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5287995f-54c5-4b78-4ada-08d7cf0f0b7f
x-ms-traffictypediagnostic: BY5PR11MB4168:
x-microsoft-antispam-prvs: <BY5PR11MB416877D6CD05A7EE7D4F1048F0F00@BY5PR11MB4168.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(136003)(376002)(366004)(199004)(8936002)(8676002)(81156014)(81166006)(76116006)(91956017)(66946007)(54906003)(316002)(2906002)(66476007)(64756008)(66446008)(66556008)(5660300002)(186003)(71200400001)(86362001)(558084003)(26005)(6916009)(6512007)(14286002)(6486002)(9686003)(4326008)(6506007)(478600001)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4168;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dcoOvpVU+6ufoRrSQaneekXllJ5fy/ZQYgkc8VMkvAVzgMzr0gGNNeMbNdW8xvPjsCiQZ1R1ulJ6yGDrmDJPh7XN1+oVwKeJV7/QfpJ4rHfHULkGTXUMoa8dOzCsfb2uOiQd3JaP/qDqZJtZcriSYTwbyTU9CeUWuxL32AReTDhH9Zzq5QHQ2h4aj4f/sdS0+5IPS7rJo0wrqBdM+usu6ZVy9q0wQ/zBx4IjdT//bZmWEx2O0JsJtqnJ4oEAEHromonF/oRUAU++5CX6zwDFMdzjl5atM2BG0gmZwYhdpzWqINOfHhIPFSEVpZec4rUbz9vRVIYTkiMR7j7/aQTqaIpCU4ZpQJXnQZaicJg5fdTR+YoRhJ12u6QJel6woLRozkid9vopwHjfs80JuWkFhrHpupVrMMCIRfrKWZ1GH6We4T9MIHoPg1ZerCweV5iyBuq9C1Yx1eE0peZ8jdQQTzTFMBP5zBh60Lj9RlFrMvp0cApRzGDqFMwEef2w9dgM
x-ms-exchange-antispam-messagedata: woeEpt76pjTE0dQM+fgAHg+doCWK4LyeIf4UjAoh+PXZV2FJBKD75qAne0OvMdEVRM4OiCsycva1hJJxAVn14pJHkZzNyGWDYGutKqzMUZ50RGsifnNw9kqK4f7e1dPKpP50+rTex16j9eEeTDXx6A==
x-ms-exchange-transport-forked: True
Content-ID: <4BB45B1D1C701E4691CF078D053A5FE4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5287995f-54c5-4b78-4ada-08d7cf0f0b7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 09:46:21.9765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ht29h7FpxPKYxF9Gdd5qHcHbUjtWiwfL5p0Rv/DfudwJcKkPlR949PHrdYm0juQQB2vfvpEO89CuXctg91VJ1eNwTCe+MuUEAWsXvhe5+EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_024626_374637_CB5A1BD5 
X-CRM114-Status: UNSURE (   3.73  )
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
Cc: michael@walle.cc, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Please ignore this patch, it duplicates " [PATCH v3 4/5] mtd: spi-nor: Add SR 
4bit block protection support"


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
