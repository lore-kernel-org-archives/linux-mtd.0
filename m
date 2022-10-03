Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBAAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 05:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCoBapaA9jkn89CYl2zT+eiGTcGLqJzXsZccMmTN2Yo=; b=cg8XpVXjeKGWz3
	vdZcVpTM2JBLuIROWGuK5SaeY43CkA5p+gTSJabQ6vU73dlUM1degdT2v1/NAnFb3qRa4P/vz0h6O
	7QJJ4rEZnzmuNAY1guFUeH/lbHyoedE16FnmvcNpAwSN+S0X/7LaLdFlhWPmJqRWa0SpsPq96YjQX
	hxkdsJD9cjX1m11YifmeWdJLWZL/AuwEE/VNft8UzoJuhTgQJBNCMKO4rDdDavqmPOt3j75B3VPM0
	mKMm7j1+Dpcv6iXok6AfxZvLmgdKpvDT3nQjxQTNJKyvB7bmFVYxkrPqfWSyRnM32LbJXRppNFl+F
	RSkYbh69S0oHfPEYjfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofENm-0046t3-2r; Mon, 03 Oct 2022 05:52:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofENj-0046sE-5N
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 05:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664776366; x=1696312366;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tuA5ZVgPPQYq7923LWjOtLVPyxsBzYh9fTIt41e+Y54=;
  b=giWHSV4PgJIQrH6fWMWCy4bi1sHhYC2uOZcpyYMp4imJXwAwyep1aPvd
   bxX8ISEbbXGoxMn1RMa3f2+o8qN3XAar16qvfZ/SfN5UjYEiixKxO35GE
   n6ufEiJAZJ8mVg6C6wPfEES56vrM1zfoRm0r/MvfMnSjwvb92fco0+x+T
   PM7/isIMiGTPNdBMe3fCnkiTX/E6xlZQkA1rbomRVtGlAOIHcB9cdpP/F
   QIWfRNQDy3SppUVivKAZgMMQofti42alF9wuY6QD6fQRsBWlWAtE1ow7y
   HoNhKWvCV9JyY5Rt5DxRggC/z7sukTOkKO3XG6df3A29gQ6EuXwid47yU
   g==;
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="180035495"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2022 22:52:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 2 Oct 2022 22:52:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 2 Oct 2022 22:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8oSvTqaMdZAZ6TQDJ+e4uUEvrt62Af3yFfpSuZj2YA/LNrr3EcNugND2OPVtFOhAwzaS1kZyGRz9k+XrM/t+fJ1kF6BzjqSch61BrZkh2PY1MSPexLC07e8ZLxE7zqhiQ3jFIvM4/G6Qtj84njFiKHM6khT4FXvYTrQRIHLNLD+wNKO7wOTphsekMu4Vn2sMHGUJTzwMaE1XFPp0PX8vXTtco+GnuqBFkJa35z9/EIrHuIwsCB1SPZnHcc9i1FNShkqamZZ4rCu4pHQd9NVitmtx9FZmfT6oVRX3EHPWrzTXMNdgBKQJIFK8KMe8i9k12whcAtn9cwzVbCSWCuuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuA5ZVgPPQYq7923LWjOtLVPyxsBzYh9fTIt41e+Y54=;
 b=Iki+TKzqHILCCDV8LyvRDCU8yoRudRBKXuhHzjvomsokNUmgv/n/i50Erk889W5IVgz5LRIUsa/4sZVHESvLUULdpsYS33Fe13posI0/YtroqiJrbzKfk7kuaMW+iTrSLArz+SG0rXAv5CZYcPAP3b+m8zqRonIm24uNg1cZMqkhTW8ZEW2u4La6uOmhIozK9ot8YgcUIw6L2hJAQeX/bI7hA1h0qlHbT95kB4GNGDrT7GvouopJzUqcczppDqNEskLgJqpOgObR9W/gD5tyNX/WldhIH7E8AqzjFLCJFQxN0vMZ52o/7miUY1nPxtY9MTkf6324m3iYrCKcHB/VZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuA5ZVgPPQYq7923LWjOtLVPyxsBzYh9fTIt41e+Y54=;
 b=If0V6JVxoNEdvwN0PDTm3/JzFatvt+F6ziLm2MIkoaKGx7Tj25UiA0Y6s4IldqwpyqjxV2Hfc+D3dS0BJhRg4utsTx4W56ELyiSj+pOGFlA4rcaOMdt6I+Nchfv/P4G2gNm40MphUXVDPGH+OnaOrt2E9B8oCr2HCoRQVVU/+Ho=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 05:52:43 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 05:52:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Takahiro.Kuwano@infineon.com>,
	<hongyu.ning@intel.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Thread-Topic: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in
 spi_nor_init()
Thread-Index: AQHY1uWcePCZ/Lfg1E+SS6lAXFxdag==
Date: Mon, 3 Oct 2022 05:52:42 +0000
Message-ID: <94b93c10-7f81-d6a8-f2b3-cb54b3976517@microchip.com>
References: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
 <1da83197-fa6c-8cd9-1e81-c317db1bccf3@microchip.com>
 <Yzpxcrgynprx75wQ@black.fi.intel.com>
In-Reply-To: <Yzpxcrgynprx75wQ@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|MN2PR11MB4759:EE_
x-ms-office365-filtering-correlation-id: 2b07a0c0-d05f-4f72-7e6a-08daa5037cdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: az5kH3wrJyeJ4YI8yeXvb4nxfE8TYgtzfiQj0gYNLZlTUrK/YTR7UtABCSHwVMW8fNqNqlbfmkFCWJnc+BRSBNO8jtyaUKApmrXY1l9jittkq10DL/o8FpS3kZZFIMjfMudlgSfTy+qioqIuHIDbWxw8bRIOt9HuPH3gqeDQX9ZcFMPSlqwiK6r24HTvJGKNm90iZUCTDeJRIDod4oXUj82P4QWtXvujeXyY1CthYk6WDpu/3rRwyJEEbC+zDn7kXUvyQXxWnQFG2X4iIRyOBpp6OQhWitqGAPahULdaIQdIrLjseUoSpD8/kKRffbmgYzH85CxsQky/r/6npQB8HFZ9SRiQ/t83RMGgbeEtEPivMOjme8EazKSKURObpwWcXCTY6xk2nZKZb/jK2kWW5zCE6lGRuYYTBPTrv2AEE3+c6qXWC3f3JGxdwbRI4RIS26scKJii/PvLCQl3zahuuGvq/vCuvULKmNbT8Qcrb64ESnpfBDIiRD1g/J5XHhQxIL3zzOGzx4elXRXUd3sUVglFWESZJWaG33CwTSvJc5IwuLFRgJPZVlLRTSytjD/w1JcUKcLusUkVQtu0OxzKB/BW/W1Qss68XUjrzvIgQ4Z9WXDaqIy7TuC5PjkvWko2rqHGOkLZOR1L16a5dkWVqC3B9iixELvGtVt3fjHOy7db8ZiaXmowPBNEhQvWYMoi4UNmBjEs7Lmdy6aHIMjcrmwm5go4/iNE04qxRKHhXJl9HxIR6TLWCdxSQVwbgnQSUNMGMOxaVHxqYRUv13hjdCe/mw+JNu4fwwg5xQPXV3lJC2EFBo92XyGZdnml8613vYEVcTgVlSMm++k0faAHjtusrV/RhFMUy805N5yZ6Rc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(31686004)(66899015)(2906002)(41300700001)(5660300002)(8936002)(71200400001)(36756003)(478600001)(66556008)(66476007)(966005)(66446008)(38100700002)(86362001)(31696002)(122000001)(64756008)(6512007)(26005)(53546011)(2616005)(54906003)(66946007)(76116006)(91956017)(4326008)(6506007)(316002)(6916009)(8676002)(6486002)(38070700005)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWJ6dFM3V2VUZUUzSE1QNlNlUjRzVXgzMnM2alBqczRYdjJxSi9BM2l4UFFk?=
 =?utf-8?B?S3gxcktwQkRwS1FFRFMrNlNUZVhpUDBoNk11QzJuZHpzWWRyVDB1dVVySWx5?=
 =?utf-8?B?YlRaNW13VzE1aEZxQjQxR1RLd2ZYeXJ4bnA3WGtRVFN1elNWZlZsN295ajF4?=
 =?utf-8?B?RmlLVkVOS0ZTNU10UDFrRFRJTGFia2N4MkZ5RkUvcnJRUnU2MW45UG9DRHNs?=
 =?utf-8?B?dDRrR2pPM1NXUUNNNTNwN2ZyUWl2ZjBQMU5uR1A5UGoyQ2Y2cHVVSmdDL2ZW?=
 =?utf-8?B?L250STdoMGZvU0Vsd1JxK0t4MXY5cWNmQjlmcnhlZVlrWVpMY3V5NHJEWmVT?=
 =?utf-8?B?VEJlajh5TU1JZnlUcG9malhKcHNTc0RhQzVwcFU2L2tpclZzbGV3UEZpVGdZ?=
 =?utf-8?B?UkZnV2svWkhRbEFJSlBXTVpHODk3dWVubVpDY0ZaU1VKcUJhY3pQL0Q5OEEw?=
 =?utf-8?B?b1NDVFRablJETVI3emhHOUVOd1lSZDlEWFZRUStwVkFWREhNZThxNks5UUU5?=
 =?utf-8?B?dElwYkRwbUZ0R2kyMkM3WC8vQXcwbnZ3T3E4MjcvcUt0MCs3Y3ZUakZ2bG4z?=
 =?utf-8?B?bXdOdGpJTSt6U3NRY051Tm5zaDRKY3liL3hybmE1NW41TlNYd29ZcDRCcW00?=
 =?utf-8?B?SGMwUlVmNndMb3RxZmpOdUlYTWgzOUJVV3REZFcwL0xRREgxTWZxV2pzZmY4?=
 =?utf-8?B?cWdiVVhWeFY5SWgxUXJscnpyZkdTYzBleWYwNDd6UlZWdnBMMlVlZ0kwakQ3?=
 =?utf-8?B?L3pFU1lIWEYzMGdjY2dCNEN4STBiNUlqaHRBL1FqdmlLancwQkt6bGdTVmZQ?=
 =?utf-8?B?emI1aTE2c0lhYjZCU2VIQ1dEMU5PZ1NNMktYS0d0TDFEbWt3WnR5bnJkVlY5?=
 =?utf-8?B?eDNzOXpVdmoyUE9sdGlaOGVrN0tWOUxXdGE1NDlFTjdtcXlOY3k0SWhIbXFl?=
 =?utf-8?B?eHhHSVl0RXliYlZoZ1kwZEtmWDVJMjY4NFpRTGxGUTVIU1BMSUxhUEZTdG9M?=
 =?utf-8?B?TnAyQXdWeTRMSXl3NElvcXpYRzlheGZUTG12L0dJc1E5N25zNEtpT3lqZjRU?=
 =?utf-8?B?ejBudHN4L3dhNU5qYm51b01GQUIwM2pheHdzUmxuY0EzaHk4VGRtdm9lTE5T?=
 =?utf-8?B?ZjVBUXRTNW9zUVlDa3BNdXc0QXBlYUZRU0JtNUJMWWExczBlNUhhSDBnVGNX?=
 =?utf-8?B?ZTkvcU5HekVSQm5yVkxOM3FqZDNOYzNDR3NJaXNCTnorTExMWWpZSHdBNU8z?=
 =?utf-8?B?amh3eW5RTEN1T25qR3pxdDZ4R1hPWWhYL3Z5ZDVwSjFlYkltL2VrTXRud0h6?=
 =?utf-8?B?WWdMbDZBOEx4QUJqaTg5MGwzeDN3dUlscXNoNldicFBtV0VqK3NYMW1QKy9J?=
 =?utf-8?B?MEp1bEV3dWxvMHRXMXNzc1VORWZVUUtybm9uQ3hLOGNOWVFWUFdQbXRSK0wz?=
 =?utf-8?B?dXlTWndsS0lCRExzT3RSWXlKSmNzdTE5bjRqd040SjRKSFBGVkNpSFE2VlhR?=
 =?utf-8?B?V241ZC9LSWZaZ0RrYWRwTXh2MkpHKzhCVnZQWE9DSGJpdjRzZ3dHR2FyQkpM?=
 =?utf-8?B?Z3FpTXF0eGtaNHNBY21hbFFUMjNXUGNseGVqUUZ6WUozMUJ4RHhSaEY1YTZz?=
 =?utf-8?B?cGNZaUsxRnM4Z0p0Ly9xZWFFQk1BdVVXMSszekpiVW5XMlNhVlN3c3FLTjZC?=
 =?utf-8?B?NjFBRkVpVGJaMEZZZFJhMDc1cDdpaTZTQThWN3lIcU1KT29wbUlPVE5GNTJO?=
 =?utf-8?B?SUpXSEtoZGsrVjhNdzY1UmVNQ3MreE9kamtZdTBFaGVmZWVpMG5HZTA5dmFU?=
 =?utf-8?B?bEwva3d6cG1YK1VnN3V5T2FrcU1TdjNKL083L2t5dTB5Ty9YcWVEbVlGVVly?=
 =?utf-8?B?T05xbTdYNENoQ0hRR3V6UUJBV0tFMWt1MlR6L2pXekFsMytrdGk0Y3p6K1lR?=
 =?utf-8?B?cVZpY1ZQQXZadUlSN3A4OWhtaDI3Tk84YndVUjNXQk00dU1US3FITHFmT1gw?=
 =?utf-8?B?M1V1d2gvWjY4dUE2MWxJaEwzTXE3enp2U0RsNUJZWUQzY0F1K2FWdmtaSDJK?=
 =?utf-8?B?dXVqa2RyQSs0Z2sxSWJsZUYrZ1dDR2dXcnFuSGRjWnFxazFyU0Z4dFhQRm9D?=
 =?utf-8?B?T2p2M0ZMZkJrUG4vS1pWeTRpWm82NHJ2RGFXQmtIaU5Fd0NJZGRZRThFdzRV?=
 =?utf-8?B?bGc9PQ==?=
Content-ID: <CB8058B6EE2D6245B49401C1D2E13D68@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b07a0c0-d05f-4f72-7e6a-08daa5037cdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 05:52:42.4500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CvfSnqobbDDa36Tu58Do4rj1PAD7iJZp2ao9feO1qDKZiSfCSa3ZHUQW0MQBybgD7NlpCEUMpKyp1rKvdtDMZ+9DcDdqdRUU1GlN9lFWd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_225247_318085_EA59BADA 
X-CRM114-Status: GOOD (  35.36  )
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

On 10/3/22 08:21, Mika Westerberg wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> On Mon, Oct 03, 2022 at 05:04:26AM +0000, Tudor.Ambarus@microchip.com wrote:
>> On 9/23/22 12:34, Mika Westerberg wrote:
>>
>> Hi, Mika,
>>
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> The Intel SPI-NOR controller does not support the 4-byte address opcode
>>> so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
>>> chip probe fail like this:
>>>
>>>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
>>>
>>> Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
>>> Return error code from set_4byte_addr_mode()") it worked just fine.
>>>
>>> Fix this by ignoring -ENOTSUPP in spi_nor_init().
>>>
>>> Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Hongyu Ning <hongyu.ning@intel.com>
>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> ---
>>> The previous version of the patch (the revert) can be found here:
>>>
>>>   https://lore.kernel.org/linux-mtd/20220922134824.46758-1-mika.westerberg@linux.intel.com/
>>>
>>> In this version we ignore -ENOTSUPP but the other error codes will be
>>> passed to the caller.
>>>
>>>  drivers/mtd/spi-nor/core.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index f2c64006f8d7..bee8fc4c9f07 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2724,7 +2724,9 @@ static int spi_nor_init(struct spi_nor *nor)
>>>                  */
>>>                 WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
>>>                           "enabling reset hack; may not recover from unexpected reboots\n");
>>> -               return nor->params->set_4byte_addr_mode(nor, true);
>>> +               err = nor->params->set_4byte_addr_mode(nor, true);
>>> +               if (err && err != -ENOTSUPP)
>>> +                       return err;
>>>         }
>>
>> So as of now if you use a flash larger than 16 MBytes, you can't
>> access above 16 MBytes, right? What happens at the controller side
>> when it receives a nor->addr_nbytes of value 4?
> 
> The Intel controller does not really expose any of these operations to
> the CPU so the only thing the driver can do is to tell the SPI-NOR core
> that this is not supported.

That would be good. And you'll get a non-working flash anyway. But I was
asking something else. There should be an address register in the controller.
If you write 4 address bytes, the forth is ignored, or why does it work? You'll
at least get inconsistent results and always write in the first 16 Mbytes regardless
of the value of the 4th byte of address.
> 
>>
>> Shouldn't spi_mem_supports_op() trim the 4-byte ops?
>>
>> The better fix to me would be to extend the SPI NOR core to support the Extended Address
>> Register which consists of the 4th byte of memory address when the flash is operated
>> in 3-byte address mode.
> 
> This is also something the Intel controller does not expose to the CPU
> so I'm not sure if I have any means to test this approach.

would you please remind me what you mean with "expose to the CPU"? I thought about
that the intel-spi controller can inform the SPI NOR core that it doesn't support
4-byte addresses and then the core to take that information and use the EAR register.
Would that be possible?

> 
> My point is that currently all the Intel SPI users are basically broken
> in v6.0 because of the commit 08412e72afba so shouldn't that be dealt
> first and then look at any possible improments?

Right, I got you from the first time, I just wanted to highlight that the intel-spi
controller and the SPI NOR core behave badly, and they should be fixed.
Your patch fixes a regression of a somewhat working flash, so probably it should be
applied for the time being. But I'd really love a proper fix.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
