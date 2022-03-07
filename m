Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B450FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UV1R/9tfZzlmKnWkeMkOS2KRCp/SXCeE3+QH1DUGgs8=; b=Q+k07F/NCvhPpx
	5RIu1pkKr/eRhMbU1uywTVfN42DiRiWrrXG0GRna/l3COiYLd5Kb2aR9K97dZ8L9IpPXhMg0g4WUk
	Hu7kEcidHMjS0HX9RlscUP8UIQXzbrh+e3isNnJAktJxVPLL2NC3JLdBGDJak65HnbfAoLxsF9aV+
	thyltBpSinXyuQ+1Glflce5YqVPh5xqAAxPd4OXZt+FQr6iAPaRci2h1ByHP9AOU/bDFRcSpJfqtY
	sbpmlv7hosVZss9uIr38e5FiJwJeFrqqUhVm5e7L5pz9ekmtmroA9ZXg2IsNBkaZ6qmW223khU5a8
	BizaNvZq892UQG+l5paQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR9hb-00GmMK-3A; Mon, 07 Mar 2022 09:30:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR9aD-00GitN-7d
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 09:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646644993; x=1678180993;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yeOTOhrt3GC+n/pK68FPs5ok48NI4vS33ZgO9qW7n9Y=;
 b=MK1vvMuHW1NDpM3e2djx8dvy6I5MheMgAqOYjINDgocipcQzC1brQE7V
 WSrve4fKMkaHywABlwpIVDa9bVliI0X3y+wqj1ohazPfOtDJ7CiWCxuel
 kU4EzmWH/i3txzITeBBKX/Kq3R9xvR+a0E2szB5vt9WQ90uW5BIuLDKBV
 DCWd6u885WzZGM1fY41UAZWXpkJxv6ALJIQlobyQDXsvQ4HFfte3OMqQ3
 z0m4rihniH9uikxtXjTq+MFy6egmgWMBpZ0fFQ+1x+1vKizUIjJ2hd6Yw
 vQOwlnVZzA9q1eamdeg2kgVHRn7w3XddgyVFOvpKSddEDbRjpiAuE5VJd A==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="151076772"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 02:23:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 02:23:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 7 Mar 2022 02:23:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCaNgI5IPV+nD4KajX3T2uN96hOWFpsBfzGApUHWmPsWb8gHfRFXK1KfhTReMe285kMs1dcEhZj8q61rc293eiLNd+6cx8ijvapwcXXp4kL11zh2sDp0H/7VJj5Wu8SJyl/peW+sxiYwKXXnwHlQNdFncC6K+o9TDnmYCjXk9hi6oPYVjlsoD4uALSaCj59tN1/9TlseQUc8AIcee0IExbyYb5O2nzNCOS95xng17E39ZBjQ1hNet/Rwivg28TMOi7GfxUJoYwxIpVokaZ/gxT/5WWkwASrKzNtkq9rHqUqS+AoN8fmvUJOhcetDygFwVHg1cW9vT/ClNLm3KeKCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeOTOhrt3GC+n/pK68FPs5ok48NI4vS33ZgO9qW7n9Y=;
 b=V7klx/GZEv2SG8W+YtroUwxwMkJvN/nHe7NU1h3BFBH4l6IMb3YpLgCYljgSmaXD00G26Q5TF087rb8IwkKvegO2ngG2SAzllzxNu40G6mvHt4JK96LDuNZ79N5NZH/YVTYQ3/T8o1mInRMnzIsGZ3kUJ62jQ8C3W3JRhy+DdSQeDyvkE4zhEscKErHbu1IvbUt4mSgc1wL3ofvQcbdZaW1XPbZiqZNzEdYrls5WnkBpmcxP4IHtUrdTihyCBdmijTEcQcGxHV6aWefrMFMUWvf5p13ifHzmFIpLh6gwb3CIPgbZQNWpcrCPoi+aozqGGY9pGZhKo80RBZ8VJALTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeOTOhrt3GC+n/pK68FPs5ok48NI4vS33ZgO9qW7n9Y=;
 b=WHW9GnzF4Hj1ZiZXqws5y9eZR1w0DqwjQqmPKi2ZPBDQ0fVXHbU8VRJKlZiFSmV6AAeaJAG5WufH8q5V7s70XWMU76yPmlSd5aujrCjQj/IGkvPOuolY0hELmLGpJnwxTNDT+YzNUHBdtzWYf/pVo31KMAK+xdamfT+0Mm8aRi8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Mon, 7 Mar
 2022 09:23:09 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 09:23:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko.thiery@gmail.com>
Subject: Re: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Topic: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Index: AQHYMfKsE2aD0LVQO0KmbZoSG1RT0qyzpgQA
Date: Mon, 7 Mar 2022 09:23:08 +0000
Message-ID: <92cde38c-d398-44f4-26f8-ef4919f5944e@microchip.com>
References: <20220304185137.3376011-1-michael@walle.cc>
 <7f339d0c-5ca9-261c-a545-d4ebf3bda140@microchip.com>
In-Reply-To: <7f339d0c-5ca9-261c-a545-d4ebf3bda140@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dcae956-5c8c-49fe-d2dd-08da001c1811
x-ms-traffictypediagnostic: BYAPR11MB2600:EE_
x-microsoft-antispam-prvs: <BYAPR11MB2600EE021C70F4E390E18458F0089@BYAPR11MB2600.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aym4fjUUrRV9wEsuXt/r77GJEG5cHEUODOAhERe44XcZQOi8KctQz1mQnxXoNd4aHASYrR8iycLGxjja8JNomFFMKNdJQFlzWEJPmczF31twNOG5HwBZOcME/G5CZ0FhJk7hewQfUBjspErPOAdOu8l+u4tuwh3o8x92A38KXxyDGn23c1EMSrPJPehlgyhUmL1it18dG4qye6zt+vR+pXR852q8vdmUb3mYw+QXIO7svJXxdBdEQwSzbdgHm+K3iCtkyzFJqtT8/foD0XEGzq3uXnYs4PDS3MORSTufjHcRTkkR7DhRucYDM45DMDPffXHyhWKprskPznWPZW9RibmGnwIM8qzxPFyvFe+RNAzBhodYR7CvLpkKJh26/Pp0gcA5eT1n1p4s7ZZ104GaEiqPiRbbBPl9I3Y97r3gSmTxmdnrKx4BVKYp/qdulawtRQfgcE/uq9P8aDXOwBlAm7j9dSIKZHhnxTxLq1M+Ne9A7aQCK6ZNSFEYiBDf3uu1mUdCxJjQDXbOdS+aTI6snpwAcp4vXU5BPXUixjf6ZqeP6iL/MDCCosRmxeKq/JVxIbumTJzH8ta9hM+nIQOiPW6EBU8/hK8O3m7w9NuCOX8rCRl4p7bIxwRioPmVsbvzkSLOXk5wFmSU0TljF1OyNNiXCgLovSD1N/uOFtbyKNqFKtQq5atGBAIk5Z5Ixcc3Es1iqmXcIcFk+cvSyrgQ81iuXJar7AOyI/9Oiq8VH7zQyxHHKLhZBvI2aAtNwa6attjqheFThH7CSd1q1ayIVNek+uFKzNfT7KKTXiCZgBQxRB4NNZgW8jHOEx8AkPE2UwCxKd8nwLZbodHNDTjAQCtz/ejA+AOdGmqQ66Lj+VE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(2906002)(122000001)(26005)(2616005)(186003)(83380400001)(86362001)(508600001)(31696002)(36756003)(110136005)(66446008)(966005)(66946007)(316002)(66556008)(6512007)(66476007)(76116006)(6486002)(54906003)(64756008)(8676002)(8936002)(31686004)(38100700002)(91956017)(38070700005)(71200400001)(6506007)(53546011)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzJ6M1ByclFiaForQUZrK0RwcEJJNFdHYlo0a2ErR21Za0IvY1JwVDdrWkVI?=
 =?utf-8?B?QmRvZG0rQTMwU0JlZGZhUjM2UUU0RElRVFZkQzVvZ0xxTHNDWlRqdG1PcTY4?=
 =?utf-8?B?VGlZSGN2NWJyUW82K2hOSXY5dTJ1SjhGUGVNZklsR1BhazgwVVl0R3hxRmRv?=
 =?utf-8?B?WkIzRkd3L3FUemVKOHFrM1V1VWJsaDRkZXdldGtrVEhObXpOOUFMaDB0VU13?=
 =?utf-8?B?NHJ0SzRocGJyWTdVU0tFREM3em5oQW1qUUFMekJxVVlCcnlWY2lmcFhvWjNw?=
 =?utf-8?B?U3I1TnIxbWUyL1FiN0FBZG1RL01MSjNkNVUzaUcvVWZ6dmpicmhFT0Y3TXRw?=
 =?utf-8?B?d2xJckgyZnVjZWFTQ202ZTBqQlNJamdROFZGN3hjOGF0bHhPTnhzNmNlNUR2?=
 =?utf-8?B?N1F0MWFXeEhBTDNDcFk0eituVnJmTjc2ejROeEcraFpIOFdybXhlbTd1ZjhX?=
 =?utf-8?B?UFNPZWFxa3I3N2MwVGovdWFzSVczSWd0SzA3ZHZ4a21RTDRUTDN0Z3lrOG5L?=
 =?utf-8?B?ZTdZZWl3T3F1STNNaTBVNDl1QWFQOXp4UVZSY0t1VmlyOUQwbVljYmJscEFx?=
 =?utf-8?B?b2tFTExkd2RsSHBYZGtLRTRwdW1HMEEwTXlSbTM0UjJBYUg1NWdFS3gzcitx?=
 =?utf-8?B?ZHVkdjdtZnhKM0k4UW13YnJsOSt6ZGdzcXQwUGd6b3ViczlEbE04cnUwc2Rh?=
 =?utf-8?B?N2pXYzN3RzIwMjVyanEwYy8wL0dtQi9qc2ZnaDB6WEY2S1E4V1VhKy9sakFy?=
 =?utf-8?B?TC9jTnduditYYlQvMm5acWxHK2RZMWNObUdsLzhwQjJuVHV4YlJQOTVsVzZu?=
 =?utf-8?B?bjBEVDNhUGsrYTlkbCtNQXNUaDEwU2s4SFI3cHJScnhVUkVHZFlQbDBPck94?=
 =?utf-8?B?SE9xYzVISGxDUllzK3Y5K0ttQnh2cFRZekVFYTJ4N25JdDBya01SWjlQQ3Jk?=
 =?utf-8?B?K2crNHdoVXBlLzd2WWxrMVpCbFQrd2pxdkprdTVVck9IcWJNcE04d0Z2UXRp?=
 =?utf-8?B?S3orTGMyMkllU2toc0ZkNzU0Q0o4Sm12S0NwMXQ1YUNuZVBaWkNTWnB5cU5B?=
 =?utf-8?B?Z2piT3JXVjFzb1ZqUVZnTEpmUGpycEEvNEJtR3lSblpBbW5qWERVZzQ1bTN0?=
 =?utf-8?B?VnF4S0ZQMFZnYzgwbFZXbDVMNlV2bTcwRURIYWR2MDZ4U1pPUVZxZXEwbCs2?=
 =?utf-8?B?enRvRHoySVdsREdFSWN0WkVIY1FpUko2ZmxLMFlKOUJGUjljMEVHNy8yVmc4?=
 =?utf-8?B?bG5DZ3F5c1VvaVBiTEZYWVgxTytNWDc0NlNBRzZWRDFwYmpaNXFJbjI3bXFD?=
 =?utf-8?B?NTlBNGxwSUVtTUVaWE1tOWVkZk9CYmlyTDNFR0lERGQxNlgyQXJPK013b0N5?=
 =?utf-8?B?SzZFa2RGNGhVRHpSQXRhK3g1RzQ0eHlwUFBxdjlxYk9aaXJncWJsZjc2Q2Ri?=
 =?utf-8?B?WExhQTBSeFRHbXd4WHljV2xBTXFpWXJDV25NSk5iZWZiRmVOUHpjYnJrdnFS?=
 =?utf-8?B?SFZuSmthZ2ppVEVTQmsrZXFqV1dhdzdpamN1U1hLREJhZnNwN2JYTW9PZ2wx?=
 =?utf-8?B?U0ZMUVpiU2IwL2RFbmRMSjdTV3kzY21jMmdIeXl0NHZSUHY3U3F3anVnS0lk?=
 =?utf-8?B?Tjhmd1JDcE5xN1hVaUxMWHpNdVFwdHMraS9FZFNPVHNNNURZS2dDdUVQNDNK?=
 =?utf-8?B?QUJrZTdFM0JPd0hXMkFVWHhLK2hGYlUrdDU1N3NQd2JrSEpIYk1DazEya3hs?=
 =?utf-8?B?ZW8wTTlZRTNuVkVsYUdQSXh1RkFnNzEveU80cTk1N1VDMm5TeHdKSHZpSGpy?=
 =?utf-8?B?aENPWHNkU1Q3SlZmWjR5SjVxaUx0b3hmVitYRkwvYkNHZEhsMnl6ZTN0U3JY?=
 =?utf-8?B?bDNPdDNhbGZZYlJkQXl1YXZIWDJTS2djclNqTVNaMTd2QmhkczVmRCtGbnpG?=
 =?utf-8?B?VWxWVkpCTjJFUkVpVnhlSmloRDlDelY0bndpNCtsZS9VOUVLVXJEWFR2b1FT?=
 =?utf-8?B?dlNrejBQNU4zQTBCMDYrRjREbzJHb2owYlJJZUJjT2J6TVF5YjY2UURRSm1O?=
 =?utf-8?B?T0xqU0pTaXN3WXBZb2RnMzR1WmxucU5LcEs0T1VWdnpSZERQWDIxUnQ4OWt1?=
 =?utf-8?B?b0MvTXJXaUwvR0xwZFhraUdXdWpvdEFrQVV5YkM2T1pmc045SmNVNldCNGJH?=
 =?utf-8?B?MUZBaTF2TVZxOXdPblpvdEpZVldhUldSSks3NTl3WXN3NDRjTnhUdTFjdW5Y?=
 =?utf-8?B?bmlZUUpYMHV3QlhOYnRrRHlnWjBRPT0=?=
Content-ID: <95E09864A930114FAA26CD545BD3AA40@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcae956-5c8c-49fe-d2dd-08da001c1811
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 09:23:08.8627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNLE/EbynxHa05WPy1WipQVyRlpGOfpDNIMLmmAX3fuvk4pFuX9M/3AATdH1M+AEwZUkqfU2/yUlNzN7FtPV+tTR8hxo+f1W0427bJIwHXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_012313_535510_A060019E 
X-CRM114-Status: GOOD (  30.93  )
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

On 3/7/22 09:12, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 3/4/22 20:51, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> While the first version of JESD216 specify the opcode for 4 bit I/O
>> accesses, it lacks information on how to actually enable this mode.
>>
>> For now, the one set in spi_nor_init_default_params() will be used.
>> But this one is likely wrong for some flashes, in particular the
>> Macronix MX25L12835F. Thus we need to clear the enable method when
>> parsing the SFDP. Flashes with such an SFDP revision will have to use a
>> flash (and SFDP revision) specific fixup.
>>
>> This might break quad I/O for some flashes which relied on the
>> spi_nor_sr2_bit1_quad_enable() that was formerly set. If your bisect
>> turns up this commit, you'll probably have to set the proper
>> quad_enable method in a post_bfpt() fixup for your flash.
>>
> 
> Right, I meant adding a paragraph such as the one from above.
> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
>> ---
>> changes since RFC:
>>  - reworded commit message
>>  - added comment about post_bfpt hook
>>
>> Tudor, I'm not sure what you meant with
>>   Maybe you can update the commit message and explain why would some
>>   flashes fail to enable quad mode, similar to what I did.
>>
>> It doesn't work because the wrong method is chosen? ;)
>>
>>  drivers/mtd/spi-nor/sfdp.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index a5211543d30d..6bba9b601846 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -549,6 +549,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>         map->uniform_erase_type = map->uniform_region.offset &
>>                                   SNOR_ERASE_TYPE_MASK;
>>
>> +       /*
>> +        * The first JESD216 revision doesn't specify a method to enable
>> +        * quad mode. spi_nor_init_default_params() will set a legacy
>> +        * default method to enable quad mode. We have to disable it
>> +        * again.
>> +        * Flashes with this JESD216 revision need to set the quad_enable
>> +        * method in their post_bfpt() fixup if they want to use quad I/O.
>> +        */
> 
> Great. Looks good to me. I'll change the subject to "mtd: spi-nor: sfdp:"
> when applying.

As we talked on the meeting, we can instead move the default quad mode init
to the deprecated way of initializing the params, or/and to where SKIP_SFDP
is used. This way you'll no longer need to clear it here.

> 
> Cheers,
> ta
>> +       params->quad_enable = NULL;
>> +
>>         /* Stop here if not JESD216 rev A or later. */
>>         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
>>                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>> @@ -562,7 +572,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>         /* Quad Enable Requirements. */
>>         switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
>>         case BFPT_DWORD15_QER_NONE:
>> -               params->quad_enable = NULL;
>>                 break;
>>
>>         case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
>> --
>> 2.30.2
>>
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
