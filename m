Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB5BC47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:29:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5606127A
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5606127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=At32jfq5dlhCEfp0yKbZ21nN/2e3Qx/I/AADlNdJeRw=; b=d7ooQAfqF3o5cF
	eMKdDSKv7m92WbIw6MSxAh8ahChb9ILcgV7uTfmB7J/qljEQfyTvB0ye+95mol4CLXMrzyxqtp2X1
	99E8aOKcU3d2RUGVMzGp0P+MdkLUF2SmrhGartPuxN8qIq0kAudQBX2mBnDPgru/POQRcUCQcqjP/
	9G6qO/MbPtmHGtXPux5TTDSSakkpVw/dLUmmYHBPOno7E+NlTSxkB5jfhmyZPnfnrEaBdlBilSApU
	7ibkHFK1FwJMacLMhTDfk0wD8NGxAPzaVq/MjiZkK/lhdOS15Pa4PHtIn2i6plO+/8EPezOdz2kcw
	7ZvLJVhek3EGluQwzamQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndHm-00BRp3-Le; Mon, 31 May 2021 08:28:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndHi-00BRnf-MX
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 08:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622449710; x=1653985710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oo+Fzvn3zsOSKk65xvAlXacjN7hnja9sFNksg4BBisU=;
 b=X1HJb/cunAOZh7r0GFjqWY8068thPAcwzy4dtH7l87nCjEKQNMrVqevu
 DZ5f0hRvRweLiO7nCwqw9drb32eiVfLUQdNKzyTfPyeSRW4QmLu45oUj6
 Cmp4bY1a8C3sP16i4RvfDhpxmaAhJl2uQO8q7dwavXNbEaBQTZnh7crHz
 iBrcHFyKvOpcB6u4HfdAtOHuFjKz7u7VzbGtmmlb01+2dW+rc7IMYvEig
 5wzrdjnETonU2Ayp1RksRHFNGDkCWlJ22gkDbmK+sFVviTphQdlw4w9H/
 PErVht6QRXeX/rhTMw92bTNOvVrVUHa0sTXphiGq+AzXAa/pDec1X0eCE A==;
IronPort-SDR: BOTLDpGJTGoMmR4VQNwRbk05Yh499GYdiuhd16nBK1zF7mfpJnMJUaI3U2wMhoYA5sK4em6jFF
 gyjR81mpwgO50pzLRLd8kd9J+fxp5aHk5tVfmFQlojonwLMgxVkg3YfsHFlhKECztKUZO0j7Vg
 nLKimR+tUfoezCUXRbXeHBcEFh7xkXvSOT6IU5m8xsae9TKarqvLwqIRbYRpmwCyUsOWtflAAe
 Sdem0K/MUz32dSbcmgEsXS15wWCFQyTssvLRnwlbJu+EjXxyDf9aetRiAZ2R2aMPN8YAz0GHlg
 8MU=
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="117126061"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2021 01:28:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 01:28:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 31 May 2021 01:28:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awP/ex4V+w1jS+XMKSMCQM0Bykd/u4VzoYiQZceWQATEs2bb1f97l4rNUotjNPZY23RVYBnv8MO51usa4KbPhtYW7DhTYKbveFaONMUH9DXbV0yAz9yKDeJc8ebqmupytZg1adKYMuERHGE1t+IcETKJPYxgoxmrkPJewCbqEOSzUqDkI5rGZ0PkZUaFSgqgEkFbeYYeCseL32U+7pUbDeHHB2vW101AR1oCnwnD3Xfarpj7FnmWfVEEysozEP/gSA52oZYZiyZLy+VX0tmjCR45S9p9RO54pOWwOCZakzhV0lDDnXLDDxcHdWtuPbUUz9EdzQLKrGdtqlGRS6xzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo+Fzvn3zsOSKk65xvAlXacjN7hnja9sFNksg4BBisU=;
 b=BwTB47ZvilXure11XFAPiUoN02A0ktoRy6TxN2Tk0sevpmuWFtJxSEl1xYkPTTRgoFI+J1HruZQq3hIAskGSB1eXVhPkeutDS2DNRZWRnWvL7RIQYnNiWAMGWjIfCPQ2uSifFTyzo54gxuJxslqxCvJqKUCS7G18a9LTL9by3Vz+tuSS/CXyorzyrmDGWHINtCrUbkxZuVImBQviVi3OEvD4rYYgHpOajE2cYnr3kP4ioXT98T2FF8QOjDtnjaqrxIFlp4Ys+8Efd32yrmrzMH2Ysa9eRE19sC6lspb7GHvbNKLN8RACuiR1xw16WI1BrLEYT5u1XbJpFJpL+ECa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo+Fzvn3zsOSKk65xvAlXacjN7hnja9sFNksg4BBisU=;
 b=AUw8U6akkzcPNWlOOJ8eWAF5AzgQ8kanermTdWCO/cGs5BQ1oI893QtFvFUi8Qe41ktLPf6IeQ3E0HosJoMq+oEOk5J53pkLYMyKWVEfxpA9Q8zniivQcSU5T+i6tU65tdh65II4RkOEjqBrBbif5RqiECvXs95qHpbZ8oINCDE=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 08:28:28 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 08:28:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v4 2/4] mtd: spi-nor: otp: use more consistent wording
Thread-Topic: [PATCH v4 2/4] mtd: spi-nor: otp: use more consistent wording
Thread-Index: AQHXVfbuVF+lruj2ikatKaizLiU5LQ==
Date: Mon, 31 May 2021 08:28:28 +0000
Message-ID: <8ed3996d-78a5-a27f-978b-635b140ccee6@microchip.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-3-michael@walle.cc>
In-Reply-To: <20210521194034.15249-3-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e95bddd8-0aad-44c3-5fac-08d9240e10f3
x-ms-traffictypediagnostic: MW3PR11MB4571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4571AC899DE91CA8101A9CA8F03F9@MW3PR11MB4571.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JZd1XXtdiE38ESJvapN4kvTndbKZrjOrNulUd8nsNmDDyXPIljT807oquh0tGshCjPq2kilF4vgoefYeSss+b0/GXz6QRu9xZP6fp7iG1rcb3mDoBgEq8KyKykzbE6amrmM8WzGpWLuVFSDV4Ov1XPA7kfbaLxdpJVaT+piqGTEK3V2og/qkqD8AQemUymebTzaydJEeUbUijXIfRk9s0418as92TBfnL0xjmgA+QEKD/Y+EKHd7M9b6XvYird76b9QGzmyoD4IDjjLZWOqHCFh9lA5kPEgOrUSzpdW5tOEOAZfX47y/RBx+Pbvvu9PvYW/5Ztu5+inuvfpLDDM12c0BwUfqBemda5xI4sxF6OPVGq5tVTXPi1XcYDCan+NGh7JbJTDu9MnVvsYVqv0ARrAi2C0VyTqo5sUz2Vzly84bgVmFUmbiuOyOQssmh3zOsgGP8NgzmZ7y88etrQunv9KaMDdzwmhv8T7Urp2SeehC633ZthG+Eg/gmRmkruLRKHgZ4G2FzJfQdMlC0epXEaBQcshueWycgrCfvpdEQqoHLalPwg6O73GEhRG4y219gSOeIg+E7qxAAKlZqT/2AMVnxc5ThQTirYdPsopMNrIZK1fFkoLDip3jMPYWBudHVjzcyhJlwTkOA9DOhwKFHU0lBxU50nBwF5YGxXMzpkZv3O2fThuZ8A0mWoZWGwMr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(136003)(39860400002)(2906002)(6506007)(6486002)(478600001)(316002)(38100700002)(83380400001)(71200400001)(110136005)(54906003)(122000001)(26005)(86362001)(36756003)(53546011)(186003)(8676002)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(8936002)(4326008)(31686004)(2616005)(91956017)(6512007)(76116006)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?M01STFVySkpvUU5sT3V2YVBvaXNlaVN1cWlYejVkYmRaMWY2L2xaTUtKdkJu?=
 =?utf-8?B?YVM1Nk5nc1loRjhOcjlLaERmS2cyZjNNQkszcDUxVkVnbzdMZlNlSngyWVln?=
 =?utf-8?B?VVphVjFmZGFXdzV0dGRxbC9udFh2aEFKZlZUc0FPRHBUank3Q2k1U1g1UHJi?=
 =?utf-8?B?bVhHTWZuNE16RncyaHZxOEZ5OFdZSzJ3bDJJKy9wUUprOHlCWmgzUVN3cStv?=
 =?utf-8?B?WFRibGI4VDhud2t3VjJ0TWNkOFZVKzhxOWUyVWMxb1dLMnFJREdXbUkybnFB?=
 =?utf-8?B?L09UTUoycVdDZ0FLZHJqMHBxMkJuUnBSRUNoWFcrYUtndWdHdFRJT0d2OFFJ?=
 =?utf-8?B?R01JZm9MckM5ZVEyYjBTa2hlNTkzK0lVK2NFNTNhOVdzUjV1SkJPRkpEdk0y?=
 =?utf-8?B?a3BwaFpqaUxrTW00MVFnMzhrYmJGNlpyQ0N0K1FCcjZlcGJQYmN3NnVkYUVx?=
 =?utf-8?B?SjZRQzRKT3YzNDdPUitBK3JFY0YxMEs5bHpXZWg0aFFkbmlLQWFmQzhtWUx1?=
 =?utf-8?B?aU9nZU1qYkdGNEZNR0IzZTdLZ3loeDI4dHZQTEdqeGEyaGtFT0NCSzk5K3hI?=
 =?utf-8?B?OGZUamVldlBENHUzd2VSekY2QlVNZXVmQTlTbjlESmNVTFpPekRIOEl0N0tp?=
 =?utf-8?B?RDlIUnVpcmpwM2NGQ082a092U0x2emd4V3ZYYWJGZ0dYdHY3b0Q4d1V3UU5v?=
 =?utf-8?B?aTFUczlCVmJ2V2xMa244anA2eUM5SVlLWk43YWxWb2xoUzBlSE0yVlk4UjJE?=
 =?utf-8?B?a2lGS2xjclN2UDRyM0sxVy91NTlxRzVLbFJwQ240WjlDc0dGQ3lubGJ3aTZ5?=
 =?utf-8?B?OExpanZsMkpoSnFwOGxWNXJEWXRza0VDbE5mallpYWRKV1RUVXI4T3hMYTVG?=
 =?utf-8?B?eE1TRnVRV283Ynk1TEFKSmVOc1VNWU5QUk15SitzQ2VFYnM1aWVkKzhOQnFq?=
 =?utf-8?B?OTROMFlmWWw4aFFEZnFPMmIxSTE2bGE4aWdMMTMxOUpycmhpb0k3UG02OVFs?=
 =?utf-8?B?RDdxVGNXVlNLWll1M2RxVGJwVm0zQTZ5MzhNS2FML3dGeUx5SkljdzRLVHRY?=
 =?utf-8?B?aVNiRHdpMjhFaUhjL3VvVzBpbmszVldXSE03bHZZTTBtUUJwK3d6RGJjZC9K?=
 =?utf-8?B?L0lSYnNDTldtYkYzQUxtRGEvRDZ6R3pON0tQZXJma2ZGWnU3QnBwdWdONk5M?=
 =?utf-8?B?bHNiSVlTL29wUytoNCtvRGhmZHNEdXNMTnArazFUVmRJbEVxL1ZVTWtXdk9W?=
 =?utf-8?B?SzhJZWEvOEliTFBRTkJzT1lPalRuNDN2TjlnWXd1NDNwNXg3S1E5aWFPMGxn?=
 =?utf-8?B?d2lGaFdZd3RnNWVRMnVWbE9pOFhxWG4wSEd5ZnluNmc2eWdHZFc4WXJHRVRO?=
 =?utf-8?B?Y0pDVDF5bEhlQVF2a09YdTlteUNWcUdpanZ0VlZhc2dhRW1CMEtmaHllK2ZQ?=
 =?utf-8?B?RkhMMUVXK3NvOXc5S3dPVHRRQ2MybHhZalNXc21MNWlJRVZSSE03dExUNDBC?=
 =?utf-8?B?VnIxNU9STzdMekVJK3lMelExYklJeWF1UXlEUHR4c1JUMGFvSFk4N1dNUTFj?=
 =?utf-8?B?dWRFTm1zSTB4VzI0MTh0Q3VTTVNJQjdoQ3lHc0RKZlpteGx5bmV3dUdXUmF6?=
 =?utf-8?B?SWx3dEZSeXdPMHQ0VmJOaERmbWRpQjBOWmxsM3JIWFhOUWZRcjV6SnRyK1J6?=
 =?utf-8?B?S2pXbytkcTQ3cGpVd2NBS2l3UXJVMDhMZUc5NkY2WVN1SkdxZm5lVHVJeGpN?=
 =?utf-8?Q?2pFdgrYom9HB+VZ/g8=3D?=
Content-ID: <CC182E34E343614E9DC3096F2C607254@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95bddd8-0aad-44c3-5fac-08d9240e10f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:28:28.0888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bifZeeGzpQsAaC7c46i+a/J8WCU2wuQY+BtJssbEXswgE5N2bPFVAGZBj3BuE7/3ljyso6ar8JD6U7Io4Ukjw7tsK0MEpcJeH32gi+erob4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_012830_862769_EF2B7A07 
X-CRM114-Status: GOOD (  23.76  )
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

On 5/21/21 10:40 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Use the wording as used in the datasheet to describe the access methods
> of the security registers (aka OTP storage). This will also match the
> function names.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/otp.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 91a4c510ed51..3898ed67ba1c 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -15,14 +15,21 @@
>  #define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
> 
>  /**
> - * spi_nor_otp_read_secr() - read OTP data
> + * spi_nor_otp_read_secr() - read security register
>   * @nor:       pointer to 'struct spi_nor'
>   * @addr:       offset to read from
>   * @len:        number of bytes to read
>   * @buf:        pointer to dst buffer
>   *
> - * Read OTP data from one region by using the SPINOR_OP_RSECR commands. This
> - * method is used on GigaDevice and Winbond flashes.
> + * Read a security register by using the SPINOR_OP_RSECR commands.
> + *
> + * In Winbond/GigaDevice datasheets the term "security register" stands for
> + * an one-time-programmable memory area, consisting of multiple bytes (usually
> + * 256). Thus one "security register" maps to one OTP region.
> + *
> + * This method is used on GigaDevice and Winbond flashes.
> + *
> + * Please note, the read must not span multiple registers.
>   *
>   * Return: number of bytes read successfully, -errno otherwise
>   */
> @@ -56,16 +63,20 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
>  }
> 
>  /**
> - * spi_nor_otp_write_secr() - write OTP data
> + * spi_nor_otp_write_secr() - write security register
>   * @nor:        pointer to 'struct spi_nor'
>   * @addr:       offset to write to
>   * @len:        number of bytes to write
>   * @buf:        pointer to src buffer
>   *
> - * Write OTP data to one region by using the SPINOR_OP_PSECR commands. This
> - * method is used on GigaDevice and Winbond flashes.
> + * Write a security register by using the SPINOR_OP_PSECR commands.
> + *
> + * For more information on the term "security register", see the documentation
> + * of spi_nor_otp_read_secr().
> + *
> + * This method is used on GigaDevice and Winbond flashes.
>   *
> - * Please note, the write must not span multiple OTP regions.
> + * Please note, the write must not span multiple registers.
>   *
>   * Return: number of bytes written successfully, -errno otherwise
>   */
> @@ -88,7 +99,7 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
> 
>         /*
>          * We only support a write to one single page. For now all winbond
> -        * flashes only have one page per OTP region.
> +        * flashes only have one page per security register.
>          */
>         ret = spi_nor_write_enable(nor);
>         if (ret)
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
