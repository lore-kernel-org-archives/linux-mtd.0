Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8C8C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZWyL89defKBB2amzOEWX2L5bJw78mGitOEZ4WrpQew=; b=2fYofITl37HaEs
	A0Ze0KMaHjBf+UD7qAuciPSsaZ9CbIdc2kIBjnDC4VgIPwDbLnxfIaBZO+AcS3XOZaWIMKhn9lAv5
	h8MJC/KOI69rvwrr0ZTMMGn1S6k45qNb3rG5Vl16CWCTaxPDIUg8S96+v1trHYisUgP4o+xRFoKC0
	CNMvKQiL9VxJmk5LykuFP+algR7cUfFSSNQqFZhphl+yyRicwADnuaphWKGUvUQ9zaQopbX75HzJ7
	mSywdroFORauSgXzaeTT3UiEgZhzvXfap7kArGch+xNS+HnQXNgr+xSs+U23uLjgRXe6qWbFwy/AW
	liTTbMUpO+cMMSUBYOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ2EE-008lc0-33; Fri, 04 Mar 2022 07:19:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ2EA-008lbY-RB
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 07:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646378391; x=1677914391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=I4YlRobCUpr2PMhD0/JlaSzdAF5IAFDjEquHKW6hqEc=;
 b=R70J0UVd7P8FSqbGW0I3Pgu9r21gQHfapk8UyLKqqlTD4gPs9u3o8x2b
 pCBTXU5VYooDSr9oOza6x7ymaGjPyva/MX+ZI7HvVRBjZkVXWFDjRkQmK
 m52ee7Oyg9Dg74ymOorlKKJkCaxN26KVuy4aRMYdr0Eo+xlrGJWlDyv8d
 t3b/a1Irhc16Ei2sMjye8sWdhRNGjI0N5hmb5PrTWVx1lAxM+3vRNNM6B
 7KUlpYKvQIGabfIpOmCxV0ngEeNpaCAaGxlfoHdLsBwFJ9Azsn4f21pZD
 gTqoNmYI/WoHInxCamycdrfC7tfFeaG7qWY+5DtXs0HaWTlxzgK39AQTM Q==;
X-IronPort-AV: E=Sophos;i="5.90,154,1643698800"; d="scan'208";a="155238288"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Mar 2022 00:19:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 00:19:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 00:19:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blzj+NGeKxm+HGkxV16J5citz50P5mI9wt5sA6GGvWjsDTMPnzRrImLIWyk/28PVtGqdEwDK+qb3FnPvfJOSK8a2YylAujphpDTp7MrFEGhmPyHvGMdipLYDzIjWVUkdX8GuOUDiSChC4Z/yW4fhxX/W3X8771ymmmNG4GUi6NDe7B7Zab4acULcYLhbaHZydw2l0YnI/Euw6JEAcIM+dwiw68CDdfnQsXfLT1ZWovLd3INmqmu6RrDFcse4YAe8hNf8ZiKNbR9nVYc6R0njg4ei7q9qw2aRvmN+V2yco+Z3QRO+iuZn5pkXttAnCBmp5nQK3Yd2UEnUdGdrxwlMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4YlRobCUpr2PMhD0/JlaSzdAF5IAFDjEquHKW6hqEc=;
 b=LP6tpqhlNS+xGI51S1gA2G9AuKT3sMiEJYjYjzJ4fIv33N2pDFUhX25ymaPx62sTgjb3mZDQ7kKofthgSN9vuCIHDpfYUtVzRGxWog1zE6nP28WKV4zzN1rkrXgSqxEX++Qz/zxV6z5dmx0Ze+dYcGx/PMT4wUCzCfHfjPQ7uvkGeYUzfqOiS9HKtOIH2wsONnEgRQ0f+G06ZT9XK1q5qzaN7v8LFGP4oblfOlemcwn/19G4uNWe1Gvs8kd4NHyGjgseyc3GA8UQC4PJXGRzCNzpka7M0PwXN+/hD6jeWhue6JCe6dsIRbXo/WAZMtizLEKhk1jIEURAOS613lfTpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4YlRobCUpr2PMhD0/JlaSzdAF5IAFDjEquHKW6hqEc=;
 b=IWfQR2wjHnOof+E8CQMDoKXoTAr/Ej3mc+No2h8XpDYhF1d2fgtRCgz7Wiz3K/i/JJXNnU3aTR2lH1NJ1VAyHQl0AeBOKhOQz+t3tnk5IxZosFJZxB5p2Nsa73QADMLzcwMiKhqtj3Cr0RW5U9bsIAf75B3jihAHNOTwj57Wcro=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MW5PR11MB5881.namprd11.prod.outlook.com (2603:10b6:303:19d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 07:19:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 07:19:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <p.yadav@ti.com>
Subject: Re: [PATCH v2] mtd: core: Remove partid and partname debugfs files
Thread-Topic: [PATCH v2] mtd: core: Remove partid and partname debugfs files
Thread-Index: AQHYL5g5cRRasti+jECAK2OJBo20tw==
Date: Fri, 4 Mar 2022 07:19:45 +0000
Message-ID: <787ca51d-fc85-dfe1-0c2d-dc8ab6234aa2@microchip.com>
References: <20220225144656.634682-1-tudor.ambarus@microchip.com>
In-Reply-To: <20220225144656.634682-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d8861a7-f62a-4b93-d58d-08d9fdaf5be6
x-ms-traffictypediagnostic: MW5PR11MB5881:EE_
x-microsoft-antispam-prvs: <MW5PR11MB58818C41881BCF110372A5C8F0059@MW5PR11MB5881.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pRPpEwop0GPYhZTZOWx5VJ9FINmVhDbd1jQ4wTp/Xs50+t/VovqK4cezL7LN2txhy/zZXa50t6LhcMEXl8kF6cyZYBzUVOyj5hT73Nk1YrCSagFSnvRbrJEA8AiG/3B5LHsXB6GiEe6D5j0sEVyujQXJvgH4Dvo80xduVVpabTYGrMlm8fi3Z9vaCAloPsK4CeF19KcU/SihGZt9SIbIHt9uP05c2S8vUz0I5RofekdWuK74AUd42J/ktGtr5rzTTYLuKk6ABL5pynN2RoEZ/ht3AWgDHQMHoTRGqMPg2hahamesqp77iAQZI37/JmoCZqgLIiVETrNcOGFMAujCM+dbUf/so3GCa8k4cmSESUN/UT1JIm58l6TLUJ8xlOXg6XI60zAFF2jSCWzITPZDjPohhYH7ww92PvCwtpuRCyz+pEZeA6QYm7RyOgnqIDrP7oChJCFKRGPTyAp28WEXaxS8MTPn72l8tNGclGgtBMhdxuWjbKnrUzgau3CF2Y1N5+Sp+6ci7c83g6KASOvdK2DotFULxtNAj6DV+MR8aBEAhJSKaBqs8p3xp5Ufvz8rfZGawqz3XhI3NEutQRpjj5d097cy9fU9HRAaghvyutSVJszlPXenc2mQCuBg3+YX8HJva81KcWagx25KKv5oeA2Gz1wDhdz9hBwSVfidxp49YY18/UNerGPVB9REjWoB6Kbm4xEOEc4O3/0ZIRljJVNjNQZKXajXpRWqAH8mSVUfRUwl3exmPHE8o0Xu5GDFNiMwm/oksFu/9tt34WGUmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(5660300002)(31686004)(36756003)(38100700002)(186003)(4326008)(122000001)(8676002)(2906002)(66476007)(66556008)(66946007)(26005)(76116006)(66446008)(64756008)(91956017)(6486002)(6506007)(83380400001)(31696002)(86362001)(316002)(38070700005)(54906003)(53546011)(71200400001)(110136005)(6512007)(2616005)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGVvcnJUQWU4bkpuRzI1UUx6Q01YT2JCR01uZkFEVmtOZUtvSDhZak15bG12?=
 =?utf-8?B?QWo2OGxndk9KWEhSYmN1WFRJMGY4ZVd4S1BOcjNsVkh1VFc3Y3pCSkJoNy9V?=
 =?utf-8?B?VHdMZGhKZFowT0RIUHJNNXo3WDRmNWRNS0dTdEFZODhrVldDNmVkdUdSdXRj?=
 =?utf-8?B?V21tS1BoenNmeGYyMFJiVVdzeVlXaG42Tk1pWTBXMVk0YU1KMkFpV241dVFp?=
 =?utf-8?B?V29qMDYwUFdBQ3pUSlUxeUdsSDB2VnZ0VXRlQ1c3V1ZkL21vTUdSeWNlZjdJ?=
 =?utf-8?B?YWZNdkVIYW1abDhDK3FIc2lHOTlZa0FHUDNuUkpReFBNazhTK25pZXljMVBx?=
 =?utf-8?B?STQ1bDd4TjF0bUFJa2I4T0tyT1g1eTExSzQwdUVaZXl6RklNNHVaQ0hXZGZo?=
 =?utf-8?B?K3A1VkJUQkhYOEtxMXlkL2t1QjA3U3BIREtZbVJMZlE3T0g5UktBdmtLYmlG?=
 =?utf-8?B?dno4Z1ZYM3NWQkNCOE9vRFgzZmJraTdSam1BR0RyOWpzMmttY1hPZGpmV1BR?=
 =?utf-8?B?NWZ1VE16OTFkTXdueEVHcHJVcVE4UGtSSDlpZTlzZHF2MWI1M1hadWRYaTBR?=
 =?utf-8?B?Q1E0Um83QkRjRGlWUmhMQUFxMllTT0tFa0MxU01MNk16eHptUzF3UUFoMk1l?=
 =?utf-8?B?S25OMTgzT0o0T2hjVTYybEEvekJjZmdDSVllOFVOQ1F0V2JoRlF6VDE1d1pk?=
 =?utf-8?B?Rm9yeU1jSXRmMHhXNzJlbmgvaUJwSzMwZU5xUEdxL0QvcHVKNm1oc2pIeVRD?=
 =?utf-8?B?d21BcWF4V1BwK29kYTUwNWUrZDJjOFBBWWp2RW9UVXJLTmZDRDBrblA2bmNT?=
 =?utf-8?B?NDNFbXc0VzFFVVBYTVlRaW5UZTdKVzBxYWFZMW1pMUtKMVA4QklnaDVZdkZ1?=
 =?utf-8?B?S2lvMDRXbTdELzF4cHNFZTFPUTlmTHVnZFNSQ2E1TXBKaGpNZXpKWUNKVTZa?=
 =?utf-8?B?N0NscTZNNWVJaEMvQXhKcjJ6WlNVbHZwdnZJYTZ5NmM4TkwxY0wwNnVkcUlX?=
 =?utf-8?B?RHpnc0RsY0E1eEo0U2ZiNDZiMXZKcGJVNjczaHhLUUQzcDFURWJFbWpjL2Fn?=
 =?utf-8?B?MytlVjJjNHFPU3RDOUYwbjhXNkxWT1p3cjY5ajhma0RIN0ZhWVhtWUI4cTJB?=
 =?utf-8?B?dk9TcTRhbjhzL0kzanZUeG13SmpuYS83bCtZc2l0S2g3ZHQ0NHM2QnZjZlhp?=
 =?utf-8?B?SmhSR1FRM2dCRkhFNW8vWStxNjJ0NVZkb2RicmN2N2NpU3l3NnoxcmRsU0I4?=
 =?utf-8?B?TE9yTzI3VlFaRzQyekhzcTQzSUU4MUhYZFpFTStRZHRWOTIycHVUQjYycmxF?=
 =?utf-8?B?bG9sd2FGd29SNUZPK3RxZWtKa2t1UHpITFlLbUlVU0dBUU5OUS9jY3h1UGFx?=
 =?utf-8?B?UGVoU2kvV2lmT0Y0aWRWamtHSjdXYXJTNlhXYjBldDNuM3dMTkhnb2lEVG5x?=
 =?utf-8?B?T05xR1M1YXorSHhjMnQzdUJtQno1R2l2T1RFV2k0R0lZem5qWDUwY3QxTXF5?=
 =?utf-8?B?RkIvOXVtTno2eHViM1QyaXQrSXAxQkdKYStScW9zVzR2T1BYdHRpU0daem9h?=
 =?utf-8?B?eC9iL2ordlUyK1lTMmVwSk5jN0NoRzBKT09pb0dMcXFwUVJkN3JFd3JJZkJY?=
 =?utf-8?B?aE50WEFmQVNsSXpoelFScnRlRmcvTEpvVmQ3VlRvWUZ2RTFuMG8wdTlGOC9m?=
 =?utf-8?B?MFBBclZHVzF2dU1LMlAwZ2lvQ3ZZRklUdndGQ1VXaEoxK2NrTGQvYmh5WmNm?=
 =?utf-8?B?MTNDM0I5RlZPTXhRbWEzeU96czM2dXd2d2FZenJ0SEszeVBmcGxHOTF3SmNX?=
 =?utf-8?B?TTB5Uk95UGhaanlXeDIxa2YwcVNBTHBjdFBWR1lUSWFGaFo3eW8xYkRVVFdi?=
 =?utf-8?B?V3ZWdXZqOUtpb3RzT2hhdkNvM2pPT05pbkhKMnlldlgrODFGWmNlYk0yOXdk?=
 =?utf-8?B?YTlnSXlXc2o0NHpvS0grd1BWRmxqT2g2MFZmVExYWXBhZVFvRmJlaWlUT3pW?=
 =?utf-8?B?MnhGZzdHUkpSazB0TW5DNTNYRXowNUJMb2dVRFl2N1R2ZkFLVU9xZE1ReCts?=
 =?utf-8?B?TFVYSGFNZzdZWFI1cjY1L2NudW1SSnljc0lsVHhDdGUwWW1BVXhNekFyQmhB?=
 =?utf-8?B?U0NSZFhWMjdUK3pFNXNLK0swSzl0SngwZ002Nko0ZDVvRTA4dUZoZkJCWTZW?=
 =?utf-8?B?RS84cCtLNjJSWGZKVkZGNlN3dW50V3paYnlxQmF0NmhjOWYvT2lFZEN1TXQ1?=
 =?utf-8?B?UkZVRXludXd5b25YZVZQWG9HWGZnPT0=?=
Content-ID: <342A39A804A6F5429BA92BB89E96352B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8861a7-f62a-4b93-d58d-08d9fdaf5be6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 07:19:45.2125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCBFr63Jdko/rB3ewLAACnziJ21PcynkqQZndjjDCp1BS0iDK+cC38WSacB4bNpnYAULkWfYu8Z9yPoIC89dLNx2izOM9Rsh79pF/JLF0p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_231950_958273_64B607A3 
X-CRM114-Status: GOOD (  22.76  )
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

Richard,

I talked with Miquel on irc and said that he would like you to review this patch
before considering it for next. No pressure when, just wanted to ask you if you
can add it to your pending review list.

Cheers,
ta

On 2/25/22 16:46, Tudor Ambarus wrote:
> partid and partname debugfs files were used just by SPI NOR, but they were
> replaced by sysfs entries. Since these debugfs files are no longer used in
> mtd, remove dead code. The directory is kept as it is used by nandsim,
> mtdswap and docg3.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> v2:
> - update commit message
> - collect R-b tag
> 
>  drivers/mtd/mtdcore.c   | 35 +----------------------------------
>  include/linux/mtd/mtd.h |  3 ---
>  2 files changed, 1 insertion(+), 37 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 1e7f3bbf847e..7dd105daf19d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -336,28 +336,6 @@ static const struct device_type mtd_devtype = {
>  	.release	= mtd_release,
>  };
>  
> -static int mtd_partid_debug_show(struct seq_file *s, void *p)
> -{
> -	struct mtd_info *mtd = s->private;
> -
> -	seq_printf(s, "%s\n", mtd->dbg.partid);
> -
> -	return 0;
> -}
> -
> -DEFINE_SHOW_ATTRIBUTE(mtd_partid_debug);
> -
> -static int mtd_partname_debug_show(struct seq_file *s, void *p)
> -{
> -	struct mtd_info *mtd = s->private;
> -
> -	seq_printf(s, "%s\n", mtd->dbg.partname);
> -
> -	return 0;
> -}
> -
> -DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
> -
>  static bool mtd_expert_analysis_mode;
>  
>  #ifdef CONFIG_DEBUG_FS
> @@ -377,23 +355,12 @@ static struct dentry *dfs_dir_mtd;
>  
>  static void mtd_debugfs_populate(struct mtd_info *mtd)
>  {
> -	struct mtd_info *master = mtd_get_master(mtd);
>  	struct device *dev = &mtd->dev;
> -	struct dentry *root;
>  
>  	if (IS_ERR_OR_NULL(dfs_dir_mtd))
>  		return;
>  
> -	root = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
> -	mtd->dbg.dfs_dir = root;
> -
> -	if (master->dbg.partid)
> -		debugfs_create_file("partid", 0400, root, master,
> -				    &mtd_partid_debug_fops);
> -
> -	if (master->dbg.partname)
> -		debugfs_create_file("partname", 0400, root, master,
> -				    &mtd_partname_debug_fops);
> +	mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
>  }
>  
>  #ifndef CONFIG_MMU
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 1b3fc8c71ab3..151607e9d64a 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -188,9 +188,6 @@ struct module;	/* only needed for owner field in mtd_info */
>   */
>  struct mtd_debug_info {
>  	struct dentry *dfs_dir;
> -
> -	const char *partname;
> -	const char *partid;
>  };
>  
>  /**

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
