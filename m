Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6757BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Mar 2022 05:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaojwAT70NzDU+fu2eKpf/7c4gTPIbtJv79Q47MmLDA=; b=d1jv2B92WCAr6i
	QNzvceTsR2dDiAjrXW5b+DU3uTPALZrhlf+i/1/Hz7B0cZvHLr3K1faJqccloZvsT74O7TsnLGOkw
	1i3oO2z9DkBqDGbriYkFl/oBJDEBMpWmxoHZekUX+oMJbYTD40LAnDsHYVgmxpf+6tR1SaTUkObxn
	OpZStlANCsh5WbzwknuZE8Yr3/mHCTtu6EFBESiKG6hKvO4mhHNMqPlJDozmoi60/VLyl4mc7PJCN
	5RTcUuE/Bic6gLU2wfoEn4lnpGlvrI3WFIp3JDYhjCgtPRRmbQUxl+DHU98El6o80A+2Mm0GQje8m
	TrAAxnX9pEBmiNrIFllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSBOd-00BV4j-FK; Thu, 10 Mar 2022 05:31:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSBOY-00BV46-86
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2022 05:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646890286; x=1678426286;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d/Y6BaDPbH20EuZY8BT4jqENKauVPDiIRdhFn9oDB7g=;
 b=XQ9eLxlg6cD9ZMkZP2KVniC9k2r5DPdM3tkJCSAC2zk+Vgu4vPRxsTNP
 uF7/ZdDEgG7M9WTIwwHyAetxRuSBZS2QUG4YXWW2VYtE0uFE0owv3Trl3
 gZ/60jnWzSlHHyIrr0uO0SVm2xRI3YjugPUKLS6bZyCp5cq1QnuPlQ60r
 sfx3+6aEr9/RwuZ+YJx8fVYZZSUbXJYxGNM3bi2wakMwhnZgmz7Ux7AWe
 el3P5Dap1+/GPQ+6vzjVqR7lhtwf7MUTGQLINrjUEs1lIOX5cWdan/c9c
 r6LYF7xonM6i+EJ3TaoWIyqzNPBuW//H2Lw2ohrOnmmCWo4Hrr1BgG1cr w==;
X-IronPort-AV: E=Sophos;i="5.90,169,1643698800"; d="scan'208";a="88463604"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 22:31:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 22:31:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Mar 2022 22:31:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQPpwSoDb2N3MdD6W0XPsLX8od4bv+qwtLFbUqiacvphJ7/6NjqCke/a/yNeo9RYLHy3RVTakY7pRL2b3agNT1WccYaQKV/CCaRQw7D4spHr650EXJUVS8WIkm0O03mVub/CFtce03q8vp9mgFXh5QrOxfQULLYCnZWQPoM/qmRGKmfITDErA07Ddz1HSpheJcEoDMyAe5v0VeG+YxUVCMmiRdk6hbyVGCQIvsHV2G+lvHxi9CpTh/C6re20eyfXeCD8xFDavRqMUS+TNdFTHPG3J/KY3kTfvWZYF9KrsYvEgKg4JnZSIEUsGE5raMDtsUAB8uaGEMEOz+6+8ZaFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/Y6BaDPbH20EuZY8BT4jqENKauVPDiIRdhFn9oDB7g=;
 b=lv4aW1GOf2mwfVmj4LMvCI5RMgbgn42mZhdhvkg7/K010pJfN9YGKqbZNZutly1v3Wsl1fMWxzsWazrQ7AU1iOXvy3b8bpNnvpd2lQiKdn8jRm2vigFK5hqw1vtArkDweSpPWrD41t94zxme9s4+YSqbFTU4R8DQyw8aWNbdTS7XeoCw26/dHnek1J0B/DgrCH1wCDb/2uBpFtT0osfDafGT8U2z0eauPdCpDzA6QcFa5EMQdCs5hxUXWq0f9F2jUCzul62O/T4A+j07jtVjsoo0z1Sq9k9ICXhKN2GRVIF42ZpiUjnGujabLf3lZKkckKX+ccMdj1kuijurfruSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/Y6BaDPbH20EuZY8BT4jqENKauVPDiIRdhFn9oDB7g=;
 b=STJuU6lA9Gv8cJodI6upKRThOziMY7KlQUASE3NDyjO/SvYlSo2+PgzmzAR9R9hb7Byx3Rq7zHMiMeFF5Cb14QuglctZcmlD2YlE1NXMPds4jX7FzfISuuJN0xod+/+sTbmds3GJFS5VxsjXtREVEvv6FC8sk79UCDucbOoDtQI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 05:31:20 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 05:31:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 1/4] spi: spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Topic: [PATCH 1/4] spi: spi-mem: Allow specifying the byte order in DTR
 mode
Thread-Index: AQHYNEARTqKlJy3ddkuP8VF4XCV4dA==
Date: Thu, 10 Mar 2022 05:31:19 +0000
Message-ID: <f0501c29-ae70-185d-8f40-4a249e49575e@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-2-tudor.ambarus@microchip.com>
 <20220302100255.gseqjbdyxrgmt3zf@ti.com>
In-Reply-To: <20220302100255.gseqjbdyxrgmt3zf@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ced78d1-a960-4fa0-9f33-08da025734b6
x-ms-traffictypediagnostic: LV2PR11MB6048:EE_
x-microsoft-antispam-prvs: <LV2PR11MB6048B636193345E775CDE903F00B9@LV2PR11MB6048.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MHLcIsAAIDzaVwYNb+3ky3gEe7cOdzrJsooED3OZpzdDLVb4oUMJigpy3GpxWHZ1n7L4t99ftpvKlB9aKn0dC6JgtYoZd2fwLpMFMAFB7VwTLRq21SW4COQb1QX060Bmi+OyZv261JuQhi2l5mXpBNGpjt4gXNhOi7bewnO9dfz3Wc31HUBd9sjUJWV2VyPRambmpETBHtCN902H9FkbMvohjSAW3ZUBcDArSzAhs1qAYYtxcevio01GNwj7K3BbKuTkeCXSqOIGjFAMPjEHazJKwFNSw6Ux87cPLz74zRyOxINitpE+pLgR6KBQU+XhDpiqariFpA52wUmRQ2LTRvIcvh8S4wxczeQpVE5219+J8CM+5CiIgzUXM0mwclIcK716YFKYDCHm1vilB/Sb9/kRxm5rdZCuW37GMZfmnI226TljWF1jLBRKIVO+OfIOxW7tVXe5eUGVG2KMNuAEj7m6iLRV/5mY2mFTVB3UZ/szU5ZadXgqvFU9g8i3WppFakyQG1V2UK7DCpQLrbLDl0a/Y8xgdXgDi5NfTfan9wlbaaASeigEymt37kSEgq/mnL6KAitsVnMVaIof5VeTvUBBDaTdTWrt2twEt9EI8r747C89XysKl2loD2QZ8ANLEA1jd2kms1MDERWNlPwfPC1Py8JiU2TYxHA89v8MAlsX3GuN22UXGXyGL6SnvANwXxGPvarad0hCHswxBqIpzHpiJt1m2LNBK2AeJyoBLL3YvGZ4quMN3xOqbxTXHCoGVb3oZcaIh3ZhOjDa2cHyXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(54906003)(53546011)(316002)(5660300002)(86362001)(6916009)(8936002)(7416002)(122000001)(31686004)(38070700005)(6512007)(6506007)(4326008)(91956017)(8676002)(2906002)(36756003)(66556008)(66476007)(83380400001)(26005)(66446008)(2616005)(186003)(71200400001)(66946007)(64756008)(6486002)(508600001)(76116006)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjBTTWMwWCtHdHJtR2RDUEpTLzRuTisrNkxYek13QmR2M1BFc3NVRXlkYjZO?=
 =?utf-8?B?OTg0T0lPM01ub083NTNyb0JmcEJiSm9QQWhhd1V6OGlXc2dWZWFlQ3BkMjJR?=
 =?utf-8?B?SHlnTU85Z3QrdDUrbkhSVEhKaTNudWxTU2g5Qm5YZHgwQ01uYktmZ2NJSk90?=
 =?utf-8?B?VTJnRWVZaEtUWUlnNE0wT0tkaWZGOGxBbXdMNWw5UWtuR0lyck5JTmI3dGdJ?=
 =?utf-8?B?alZvRmYxUS9kSzRNZThjcEdNMWxOS2ZzYnIxeFZIbmtEOThpZUdVbUV2KzVz?=
 =?utf-8?B?L1FkdjBtYXAyTWNTS0JzRlgxRzJvMTRvNS9HYXQ5YlIxSE0vRmpIYkJLeitU?=
 =?utf-8?B?WThaMWRtL3hvdjNyY0ttMUZPMlJEQVgwVEVBZjlsL25QVmRyVytMNGRaT0d0?=
 =?utf-8?B?ekQvRnFCZ3gzUHpPY2F2YzZFVnluWHJZYTJHdGR3cFdSWndwdnRqUVNwQkpl?=
 =?utf-8?B?dHE0aExrUHhqNGtuYmwxRTIwRWlzOXdUUitxOFc2eXdEVnl1WUIrZkdFdEVD?=
 =?utf-8?B?VDNXSW92VWNwNllESXBDR3lmbXBLenoyT3FhNzdOZ01LNWdFcGY5Q3hFcWp2?=
 =?utf-8?B?M3YvN3BrempwUzRUS3FEeE1FODd6RzNueG1tRWRUcHEyekJPWUZKd3JCZG9h?=
 =?utf-8?B?WW9jNis0dHRnNk5HQnI5QXFXSGtxek1UeHFmR1IwL0lCclh0VURCN2tXemxZ?=
 =?utf-8?B?UzFFSWk1OW1KK0o1YVUwSVIzR3A5WGw1ZE1PZDkwZCtqZGFMUzhVQ2d3bmpC?=
 =?utf-8?B?MkY1Tysydm40OUdWdHpPaHRTYkE0bXpma1FIQUtDWXJzbE12OE9YaFBCVG03?=
 =?utf-8?B?d3ppZkdJSFhlbjJaR3FoQ0xjZ3FURVN3SmZaaE1kUlZzcmV5SVVCaEppVWFh?=
 =?utf-8?B?alh2TGh5TWNpb09PVjRPUXo1ZUw5TytSK0NyaG5EYUtGOWhhVGdDYjRsWDBj?=
 =?utf-8?B?QytLZFJXc3RqZHd2clZFV3N4VE5xcllZc3VTNWtlK1lxSHc5YVNna0dkT1lH?=
 =?utf-8?B?SmUyeUltNG5TZnRuU3NhZmFFN2FQQzhqSzBVYmEzZnhqaHBhV3ZoaFR5a1Vv?=
 =?utf-8?B?YTFHYWN3TEhJSU10d0gxZldwcEZLZzBkQWNHRnNsSzVVaGZxcmE5cmFoUVZ5?=
 =?utf-8?B?RVhPVURvb05jWFZxdEpNME5tQi9IYnJXa0FSYTdjVWdwZTJHZWVoVkwzRlRx?=
 =?utf-8?B?VXNWU3VndVQwTlF5ckpUd3F5TkpxVklZU3R5UFBLbXVyY0I3di82TExYNDE1?=
 =?utf-8?B?RkVTeWNVODVDNHlFTEFPZE9JbVFiVzBYbC9zWU5nREZQVEprcmI2L2ZDem5N?=
 =?utf-8?B?Z2U1V1d3Q1B5OFdpRnpoYUVOSDg4TUxmRlN6b1VvNTh6OVVhaXVPV21mRTg2?=
 =?utf-8?B?U0ZUeVlBNGM0RFZvQmFYSkk2MGFhaStmM3NCMmltZVFqSXNHQlBOVDlzWjVk?=
 =?utf-8?B?UGFnSlRyR2RoajZaQXo2Mm4xWWYwVWF4b055TllhSGdsbnBscHNwK2dycVZC?=
 =?utf-8?B?YXNHbVh0Z3hvWk9KOHZ2Z2RnbURwNHdpbWRvbFM5eTJVbVRYM1d1RkllTjQy?=
 =?utf-8?B?Um1CbERLRVB5c1VLNlJoMGY0cXBDd21KbE5oSEpidEVsRFA0VzBzdGdLamUv?=
 =?utf-8?B?VDN3YWlMZk1rMlZZcEhjOXV6TU42QXRjVlJqMVZBTzVjc1FPRmxDN210ZmRn?=
 =?utf-8?B?Q28vcXVxS28rMHMzSWVlcnZKTk5xUWF6RFl6Zk9BeUtYUnNsb1JMRGRwcHRn?=
 =?utf-8?B?d2Y1emxqeGZaWEx4aGxaeHZBeEc4ODgwY0NHSlBJVGhBUFNTVnJRNG1JSUo2?=
 =?utf-8?B?OGpEdjQ1Z0FoNGZ0SG9mRjJDeWZIdXBUWW9qU21mT2pzMUQwU080bDk5RGhZ?=
 =?utf-8?B?eVlueGsxRGdQUno1NEpoM0UxdG9TakZpYmd6WVVHT3dLVG9kUG1xN0NoQ0t0?=
 =?utf-8?B?ZExsck9vNGpYY2J4U29YY1llSThSSVNWdG9zNW91RkpsN2lHTWNQWk1Xbmpy?=
 =?utf-8?B?VWlvVWdpNGZoTjFTdFhPbVg3Q1UrNHIzcU5ubnZITnAwTzRpLytBdkNyeGRT?=
 =?utf-8?B?OVpTRHh6bzRDclpFN1ZpVExqTHNmVG40dVRMRUNLQnFnOXdlbk10VmpKajd5?=
 =?utf-8?B?MCtvL3B3d1dJL1dRWExpSDFPeXRQRW9ScTQ0dHYwRGRzcXVKVUV1VFpGYlFv?=
 =?utf-8?B?a05OVWczRVNXMW1SMzYxTEVON1B6Tk1HaUdFMTZxOU05b3cxRE45TFM1K08z?=
 =?utf-8?B?U05vQzJjb0c1U2VMNm55aDNyN09nPT0=?=
Content-ID: <16B0A8C120090B4895199AFA0F874CF6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ced78d1-a960-4fa0-9f33-08da025734b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 05:31:19.5190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A4pjnrFb2QuCuFg4iWpFy2n4ksiTiCPWNFXokZwxR+MXpedZt8vx7klRk0Hvz9sqCecZ0Hhsw/6N09VI5TaXBs8mZ7MP59tnJergFb281FM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_213126_442402_6B989469 
X-CRM114-Status: GOOD (  27.67  )
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

On 3/2/22 12:02, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,

Hi, Pratyush,

> 
> I'm reviewing the code here. I still have not thought through the
> discussion about Kconfig option yet.
> 
> On 18/02/22 04:58PM, Tudor Ambarus wrote:
>> There are NOR flashes (Macronix) that swap the bytes on a 16-bit boundary
>> when configured in DTR mode. The byte order of 16-bit words is swapped
> 
> s/DTR mode/ Octal DTR mode/
> 
> I don't think this would apply to a 4D-4D-4D flash since it would only
> transmit one byte per clock cycle.

From what I see, flashes that claim "QPI DTR support" they actually support
4S-4D-4D. JESD251-1 talks about 4S-4D-4D too. So data is latched on both rising
and falling edges of the clock. But I'm ok with your proposal because we don't
have any proof if there are any QPI DTR flashes that swap bytes in DTR.

> 
>> when read or written in Double Transfer Rate (DTR) mode compared to
>> Single Transfer Rate (STR) mode. If one writes D0 D1 D2 D3 bytes using
>> 1-1-1 mode, and uses 8D-8D-8D SPI mode for reading, it will read back
>> D1 D0 D3 D2. Swapping the bytes is a bad design decision because this may
>> introduce some endianness problems. It can affect the boot sequence if the
>> entire boot sequence is not handled in either 8D-8D-8D mode or 1-1-1 mode.
>> Fortunately there are controllers that can swap back the bytes at runtime,
>> fixing the endiannesses. Provide a way for the upper layers to specify the
>> byte order in DTR mode.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  include/linux/spi/spi-mem.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
>> index 85e2ff7b840d..e1878417420c 100644
>> --- a/include/linux/spi/spi-mem.h
>> +++ b/include/linux/spi/spi-mem.h
>> @@ -89,6 +89,8 @@ enum spi_mem_data_dir {
>>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
>>   * @data.buswidth: number of IO lanes used to send/receive the data
>>   * @data.dtr: whether the data should be sent in DTR mode or not
>> + * @data.dtr_bswap16: whether the byte order of 16-bit words is swapped when
>> + *                 read or written in DTR mode compared to STR mode.
>>   * @data.dir: direction of the transfer
>>   * @data.nbytes: number of data bytes to send/receive. Can be zero if the
>>   *            operation does not involve transferring data
>> @@ -119,6 +121,7 @@ struct spi_mem_op {
>>       struct {
>>               u8 buswidth;
>>               u8 dtr : 1;
>> +             u8 dtr_bswap16 : 1;

but I would keep this name here as it is, without prepending octal.

> 
> You also need to add this capability to spi_controller_mem_caps and
> update spi_mem_default_supports_op() to check for it.

sure, will do.

Thanks!
ta
> 
>>               enum spi_mem_data_dir dir;
>>               unsigned int nbytes;
>>               union {
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
