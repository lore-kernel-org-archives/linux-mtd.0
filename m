Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CC6C61DB9
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6rXKzpB3DZxFXDGqMySc8j2g9q50Xwd3it5fWfzE6A=; b=vIQYrcEdPcTO1X
	UH/rKVjoc5O6XFlC+O+LwM3UUnmRnjukems6q56ffP+TUcjcdLnH5Oo51X7abMu2dfNIjv44H5T6Y
	G0Ne9HhJ9+1tit+YbmErP0QEYVP1WxCzOgVAHpWZqsn05y5JKKYdHh1d3sHw8iBD4iHvkA1HQ/VGe
	Hcu4ZgNKR263NhVbG/RiPz4/RWG30x8XLKNmUCA9cKucr92uJU9FIJgSNQygPaRchvFAM2f7K394o
	iwE/nPfpJMO+6xRRsFxAmjZRWHPXIUT3hgYbFfVKe8xpS74gr4arq3rVnl+HJkp+X7Hav7eSrUHPi
	wNpIVsBi09jRlly4c45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdn4-00000004SCV-0YIv;
	Thu, 27 Aug 2026 17:21:26 +0000
Received: from mail-canadacentralazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c103::1] helo=YT3PR01CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdmy-00000004SC4-2Qh0
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 17:21:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X86NwsWBAYpFHTBJAm9PNER5sY7jhVNBIuFpf9SIMgM7N85q7A9efqEdLkmFIPe108uKGd2q8dohN6p6jR8SVj0moX2anh3JX+kZMvO6HMlvOAWJuMNsKS0I+JHwHPd6s1sb9O6Xlgm+Rug5Cye0VAikw40IKyJSWCt/JzHSDlsDuu/bBjhNuS6IBtNbarzUystPLUmmIIg+Lair1qNOl4vhJb2BUoWl3C4W6vWBCnisYJt9Mp++aaUybgduUsIGonaWBcYR5AaXsWiNIdfacCB2N9x/W5m3NThgOgxDp+9dDqCW7+bXtsaIC2+ITgioG1asLVbqA6rpJVTylGvwiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtKfxgih7hRjy1Npa5/ZmHaKpD+Kvw3eaEkSsAKx15I=;
 b=oz529/AtzcCefPuazcbeuhqrwhV2znjQRRzqiK2TMLYnskxzhpLAaU/Yykb+ecBP85cT0XbrMf28b4EZVnryEaG3HxqA+4NNobWHDBEmxRBbgb5L9sj/LETJL8eA4LSYgfqMCZbsmiDY/M7hR7HGd32rqkauljRZh0Vxni700xZCg0grSjm2PbAyUamm4WZ0YTdIsw6FD/7BC+E9lR6jf1GrKW/cSLL+hJE8isR0CKMXpd3v4Xw0MaCejPQsrZZ57KDJZxTQErUnLZ4dftn+iVljF5+XwBUHdCWIn9xBoN88gNrMnrtShg+Aas4UrpaKvXKbNa8tAN0O+VCNX7BRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tantalus.com; dmarc=pass action=none header.from=tantalus.com;
 dkim=pass header.d=tantalus.com; arc=none
Received: from YT4P288MB1145.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01:16c::22)
 by YT5P288MB0519.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 17:21:14 +0000
Received: from YT4P288MB1145.CANP288.PROD.OUTLOOK.COM
 ([fe80::76fb:67e5:79b2:e9ba]) by YT4P288MB1145.CANP288.PROD.OUTLOOK.COM
 ([fe80::76fb:67e5:79b2:e9ba%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 17:21:14 +0000
From: Devin Armstrong <darmstrong@tantalus.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
CC: Junghum Park <jpark@tantalus.com>, Wolfgang Tolkien
	<wtolkien@tantalus.com>
Subject: Re: mtd-utils: [BUG] fsck.ubifs backwards compatibility issue wipes
 ubi volume encryption information
Thread-Topic: mtd-utils: [BUG] fsck.ubifs backwards compatibility issue wipes
 ubi volume encryption information
Thread-Index: AQHdNXmt/yhdS/7cJ0OAxrMRNzoS/7axJ6UAgAD+BtE=
Date: Thu, 27 Aug 2026 17:21:13 +0000
Message-ID: <YT4P288MB114596D4320D56D032E8EC32B8AD2@YT4P288MB1145.CANP288.PROD.OUTLOOK.COM>
References: <YT4P288MB114509D5F1B6B114BABB5E93B8AE2@YT4P288MB1145.CANP288.PROD.OUTLOOK.COM>
 <9a92cb19-5b14-bc3a-db1b-5fcd7a736722@huawei.com>
In-Reply-To: <9a92cb19-5b14-bc3a-db1b-5fcd7a736722@huawei.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tantalus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT4P288MB1145:EE_|YT5P288MB0519:EE_
x-ms-office365-filtering-correlation-id: ec8bfb6f-363c-44f7-4acd-08df045f98a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|59022699003|3023799007|4133799003|22082099003|18002099003|5023799004|4143699003|38070700021;
x-microsoft-antispam-message-info: UNatrKz+OFgA1wGOGL+OFRW2js9Xixk9GxwS6ndpMWNAQcd6oEY+Zz6PAH7tQMWrgWOKc/IpTRsfReNeWbEQOwZBpoE+ocwBtD5i01dZgfbp1Hc2UyzRs55uBrccc4Kxs6+FHYDrY0VwYipphh71tFoPKp9EruUUGj+/63puEDJiPVZ5iGjuzirtT9sDuJJC3xBX6LZPp8UQI7mTOovfydMCEVwf+E7GsrsC22tJIToCXnPtzHP2K2zrRdtSHwI8gGIA1I3zmkMyc8LdWuqVZANtULkMbrHzTbFbhXNB1AkknR+UVRXeQUyrJLHwWcBxH9q2k7XaO8DK+Zrp0lEOpBIwpCVDHqeTUgbl2arLK991AXupTgta03B/6XPaI4hPlRujgjRwOssMVu4q4ZmEYEU2Fmb4y0lEdW/n0/aK0MPzbSGfY+bEd5kH8GqEbHOr4NGIb3qyQ8LPctvzE+nso2o9473NHxSa1z+uZG1HvwY2b9yEA0BrtdLfUhw0ly7bNQXA0jbhceCYrco3LYZbfyeDkMtCetug2GdioR7FEs48fNUF9TXkeU1cROVQU98S2mZNNDV8LZXfDZw0j9tZHvEaJA7NrkIn8lWJlf/CmWXfXqgH8S1YUt6bmLKf38g8huFXkHdQAXO3mrC0lvMuX50+/S0ur+tgpv2Rsq3R52I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4P288MB1145.CANP288.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(59022699003)(3023799007)(4133799003)(22082099003)(18002099003)(5023799004)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?b0dSMWR6dEZSZW4xSGNSN2ExVStLdDg4bGxGcmJWTzEvZXkyVHd5Sy9p?=
 =?iso-2022-jp?B?VGZhNnZVRHExRGZhNkpOeFhwYkdXZk9GaVJCblFjT3JndXNVcVJIaktr?=
 =?iso-2022-jp?B?anlKMlNJMHAybnpjUUZYQ1dXNzEvS0E3QVpmSWpMUU1wWVh5UVlNQkJT?=
 =?iso-2022-jp?B?bXdibHBDb09mUkJDQ3l3OWJNcEJxVFdKcGhiSWY1MFN5RGkvUklNeHc4?=
 =?iso-2022-jp?B?TWpIeGo4WTQxWWtUUWtMTVZ0OHNxZGRYK2JrNWN2NTl4clcxNVpxMXpC?=
 =?iso-2022-jp?B?eHN2UktKT0MvTEtJanUwV0hDMmk4SmxSVU01VXFPTDJXZnRqV29RZnov?=
 =?iso-2022-jp?B?Q3had00vVDlCV04vYzRSNXVqSmRNKzhPQ2RwVGFINVlONmRtWEhHMUlw?=
 =?iso-2022-jp?B?YmEwZHhPYngvc3FjQ2Zoektic1hSejgzY3p2dFVTWWY0UG9DM0lhY2dK?=
 =?iso-2022-jp?B?bVNOM1U4cVVlUXN6T0FwT3BndGlTWFZNLzR2U0VaQ3drZHZ0enYyeUZM?=
 =?iso-2022-jp?B?MHBWZnhtb1Q0eFRkNll2UkZlcHdXOTIrZjcrVnRvYU5MeitoWmZYQnhS?=
 =?iso-2022-jp?B?TU9MaU1NdHMzN09TWTUvSmJPaVpXQVFDalg4aEZDeDBOckF0R1h0ODIz?=
 =?iso-2022-jp?B?aS96VTF6ZG9XNXpVTXhtMmFJTllTMHYvUzFFc0dNeVhSbUhYaFhnc1pP?=
 =?iso-2022-jp?B?b2JwaXlEa3FjUmhEQldFMXcwb20wU3B2SCtnbFNPSzRHOStnZ0IxVjhl?=
 =?iso-2022-jp?B?V2pwTEpEMlRaejJFRk9XYyt0bXhhUzIxZDNLeTUrSFRBaHE3UjhHV2lu?=
 =?iso-2022-jp?B?QzdobWo1OGlMYnRxWEd1MHZYTEdzSElZUC94U1l0Zk1OeXZDOTdCNURT?=
 =?iso-2022-jp?B?Vm9YYkZEZEM0eXd3SkZqTWFHMyt4TWxQNjFCVkhib25wOTBpUnFUVkly?=
 =?iso-2022-jp?B?Y3laRjFEM3hFbFBTNnhJQmU1TWtwYThmOHVyK1VMTzJtSHJGOUZLbVFi?=
 =?iso-2022-jp?B?cnUycGJkRzZmQ2cwa0x4Z2pqSVdqTUlPVHFrTlF1OGZ4a09QdW4zb2lY?=
 =?iso-2022-jp?B?V2tRYWI0Q1Q3RkpOUXdXWmkzalJubEo3M05UVlVwREZaRksrUVAvQ1Bv?=
 =?iso-2022-jp?B?MERIanV3a2FkNkQ0MVFqNEFRV0ZsUUNveVVXS1E4MWdZSjJMTW1iWmNk?=
 =?iso-2022-jp?B?ODIwaU5iNGhuTlY0NGVHMnF5TnVPQmFwY2pBM1o5dENVdGZnUHBVY1hP?=
 =?iso-2022-jp?B?ZDh3WWNBTHlHc3N6Z3REUWU0RWZsN2VPRnVIWlhVSUM4QVBBUnNSOVcr?=
 =?iso-2022-jp?B?UGk0SEMzNUFBTE1xdlNyVzNwY1RMUGhGYjFZVGdXY1Y5RytBTE1aYnAw?=
 =?iso-2022-jp?B?cy8weFpjMVdGSHZPbE8wT0RvWDFvUDY1cG42TXlzY2s0czVNN3hQVmkx?=
 =?iso-2022-jp?B?SEk4eTVBSndIU0ZadEZjNzViRXR1S3ZGVU1vaEdEajJ2R3J4NFJmeFNx?=
 =?iso-2022-jp?B?SlJEVkZVUk1pSFEwUlJSL1NwVCt0U1ZnUHVnMENJbWtjSUl4dHpZcFJV?=
 =?iso-2022-jp?B?R0VuelhVdVBLWGFpS25MQ3NYS0d0V2xrcjJZUDZYQSs4b3NRRkZMdzhN?=
 =?iso-2022-jp?B?cXh0ek9Dci9EcFA1b2F6NCt4anlzaG15QWZJZEQ0QjdXOVBMSENtcmtH?=
 =?iso-2022-jp?B?dTl1cFJUYW9VWnhGZzJRcTFSWG5JbmM5dVJTNDk5cWdibElibkZxV2s1?=
 =?iso-2022-jp?B?RE81L3ZXaTROTnRJME9WLzlPa0FyUVNmbkc5WXUvVUxMODRZZFhOR1pm?=
 =?iso-2022-jp?B?Tm1uN25JM3k0a2ZyWjQ0VXRycnA0Z3p1L1YzeXp6U2FiK21ONUFSRUNF?=
 =?iso-2022-jp?B?OTdUZ1ZZVzk5Rm9ybllrSlJPaDJONlV3VkIwOU82QUhHd2xleWp0MVF2?=
 =?iso-2022-jp?B?Nm01emJxYUFwS2kyUmswTjRQR3hRYTZKZW1sS3VnMFdQelNucGNtZldz?=
 =?iso-2022-jp?B?VXZWRHZRUjRnNS9vdENsUVVhcU5oUFkzVkFnSnV2SmZ5eFU4dDlWd3B1?=
 =?iso-2022-jp?B?blVjbWpxck16R0dzYjc0RnBvbFJyRk95SHRWTjA4UTJkdnNkdFZpalRt?=
 =?iso-2022-jp?B?Uzdvakt1VVpsMzE0bUdHdXFwRWtsNW5Sd2QyYlk2VG1HQXRKeENabHRx?=
 =?iso-2022-jp?B?WC9zMkNsbzB0WnU2R0JWcHNWWG14dis3d3A2R3VjR2x0Ni85M01QZE9u?=
 =?iso-2022-jp?B?am5XaHRRaWo4QXIzSmpRRytXMWdwdm8veEFHQkNjajFRZjdWQjJrQk5X?=
 =?iso-2022-jp?B?d213QmNBTXh1MDI0MjgxVHh3REV6aXQ4bGRObHpTamZjQWhxUTNTMmFK?=
 =?iso-2022-jp?B?SnFpYmoxaUdRUmRJeW5WakJUZENrci8rSk5URlptOFVsb21sazVaMkh1?=
 =?iso-2022-jp?B?SnUwdlovbUt3Q0VERVFmYWoyZ3VYYlRjU21EZjJvL1BzM0FrczUvZWx5?=
 =?iso-2022-jp?B?NFBPN29rOXBDeG10cUdZZ0VlbklJd0N4MktjQT09?=
MIME-Version: 1.0
X-OriginatorOrg: tantalus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT4P288MB1145.CANP288.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8bfb6f-363c-44f7-4acd-08df045f98a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 17:21:13.8682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84e23124-053c-4a39-bff4-5dbaf09fc80e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /sRI8Fh7BXIdQ11QB1sHqjBzweNbPu/4hPA2nXJN9aIIinHXzC8/bKElZs/Y+PkmbBbAXd98PQvbDVP3rcGduw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT5P288MB0519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_102120_707598_CCF151E8 
X-CRM114-Status: GOOD (  23.83  )
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Zhihao,

Thanks for the quick response. I agree, the type field in the old versions of mkfs.ubifs is wrong and rightly flagged by fsck.ubifs. However, I would like to push back about the way this type inconsistency is handled. The type difference between v2.1.1 and v2.3.1 does not mean the node is corrupted. This is a labelling change that is treated as corruption and the action that fsck.ubifs takes is to delete the node, which in our case is the encryption info. Do you think a more appropriate fix is to repair the node in place? i.e. have fsck.ubifs repair the node by changing the type from DIR to REG

To try and give more context, we have a large number of embedded devices in the field that were formatted with mkfs.ubifs v2.1.1 and if fsck.ubifs were run against these non-upgradable partitions, it would wipe the encryption information from the ubi partition. And since encryption is paramount for our devices, the device would simply fail to boot due to an unencrypted partition, leaving the device permanently bricked.

I believe fixing the type in place preserves your goal of not ignoring inconsistencies while also avoiding data loss where there isn't actually any corruption.

Please let me know your thoughts,

Best,
Devin

________________________________________
From: Zhihao Cheng <chengzhihao1@huawei.com>
Sent: August 26, 2026 7:10 PM
To: Devin Armstrong; linux-mtd@lists.infradead.org
Cc: Junghum Park; Wolfgang Tolkien
Subject: Re: mtd-utils: [BUG] fsck.ubifs backwards compatibility issue wipes ubi volume encryption information

[Caution] This email originated outside of Tantalus

This is the first time you received an email from this sender (chengzhihao1@huawei.com). Exercise caution when clicking links, opening attachments or taking further action, before validating its authenticity.

在 2026/8/27 0:44, Devin Armstrong 写道:
> Hi,
>
> Description:
> fsck.ubifs v2.3.1 will always detect fatal corruptions in a mkfs.ubifs v2.1.1 encrypted ubi volume. When fsck.ubifs is run with the -y option, it deletes the volume's encryption information and leaves the volume damaged.
>
> Steps to Reproduce:
> I have attached a bash script to this email that can reproduce this issue reliably. Essentially, it:
> 1. Builds mtd-utils v2.1.1 and v2.3.1
> 2. uses mtdram to emulate an mtd device and attaches an ubi volume to it
> 3. format and encrypt the ubi volume with mkfs.ubifs v2.1.1
> 4. Run fsck.ubifs v2.3.1 against the encrypted ubi volume
> The script also allows you to test an unencrypted ubi volume for comparison
>
> To run the script:
> sudo ./https://linkprotect.cudasvc.com/url?a=https%3a%2f%2ffsck_ubifs_reproduce_bug.sh&c=E,1,HwWSNjxDb4Jyi6Svubv4_rU_XXblAM5sl-SGW5gnPWBkek9xx1RZkIdBVsnBUxLDjH_E4giHec_5fveXphcc48M7bQdBQizqd2-e4-8MMQ,,&typo=1 --encrypted /path/to/staging/dir --no-patch
>
> fsck.ubifs will output something like this:
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Read superblock
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Read master & init lpt
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Replay journal
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Handle orphan nodes
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Traverse TNC and construct files
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and handle invalid files
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: File has inconsistent type, ino 65, inode type file(xattr), dentry c has type dir(xattr)
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Remove dentry? y
>

Hi Devin,
There was a wrong type assignment in old mkfs.ubifs. which introduced an
inconsistent problem in ubifs image. The problem is fixed by [1]. Then,
the fsck will detect the inconsistent problem from the ubifs image made
by old mkfs.ubifs.

[1]
https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit.infradead.org%2f%3fp%3dmtd-utils.git%3ba%3dcommit%3bh%3dd17b14d953b2ab56c938d6c7829b70b91c736efe&c=E,1,fSFm63jP5iXDZF6oguP_D6Dnsu-jSWIGtM0IU1q1M7Ks6IGRzpY4Q1MG_j0iqRWJIEIv5rOKZNFe8_f46iJ_DT7EuassTHgEodvrxN6a6pOKn8OV&typo=1

> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: File has no dentries, ino 65 type file(xattr)
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Delete it? y
>
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: Encrypted file has no encryption information, ino 1 type dir
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Delete it? y
>
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and handle unreachable files
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and correct files
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check whether the TNC is empty
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: TNC is empty
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): inconsistent problem must be fixed
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): ********** Filesystem was modified **********
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): ********** WARNING: Filesystem still has errors **********
> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): FSCK failed, exit code 5
>
> The steps to reproduce should be agnostic to the linux kernel version, however for reference I am running this on an Ubuntu 24.04 with linux kernel version 7.0.0-30-generic
>
> I have done some digging and I believe this issue stems from the fsck.ubifs tool is doing a strict type check in the "file_is_valid" function of the extract_files.c source code file. A fix in v2.2.1 (git hash: d17b14d953b2ab56c938d6c7829b70b91c736efe) changed xent->type  from  "UBIFS_ITYPE_DIR"  to "UBIFS_ITYPE_REG". The fsck.ubifs tool does not account for this change.

I think fsck.ubifs should not skip this inconsistency issue for the sake
of compatibility, in case this issue was not introduced by the old
version of the mkfs.ubifs tool.
>
> I have made and tested a patch which I have also attached to this email.
>
> With the patch applied fsck.ubifs outputs:
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Read superblock
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Read master & init lpt
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Replay journal
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Handle orphan nodes
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Traverse TNC and construct files
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and handle invalid files
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and handle unreachable files
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct files
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check whether the TNC is empty
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct the space statistics
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct the index size
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and create root dir
> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Final committing
> fsck.ubifs[24723] (-): FSCK success!
>
> Best,
> Devin Armstrong
>
>
> Email: darmstrong@tantalus.com
> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fwww.tantalus.com&c=E,1,KxYAgvOSYMOTWGdye0Adt1F048oGFXnOpJah8_YTqn3b6A4MQdT4tyIv9gQ6A00P9wFm02BvBnXB6i20P5tEBLReYmPYuPi7H9rGvJoKyw,,&typo=1
>
> CONFIDENTIALITY NOTICE.&nbsp; This documentation, including any attachments, transmitted by electronic mail is intended for the use of the individual to whom or the entity to which it is addressed, and may contain information which is proprietary, confidential, privileged and/or protected from disclosure by applicable laws. Confidentiality and privilege are not lost by this documentation having been sent to the wrong electronic mail address. If you are not the intended recipient (or the person responsible for delivering thereto) please immediately notify the sender and destroy this documentation and all copies (in any form and media); and note that any distribution, reproduction or other use of this documentation is strictly prohibited and may violate public and intellectual property laws.&nbsp; Thank you.
>
> -
> CONFIDENTIALITY NOTICE. This documentation, including any attachments, transmitted by electronic mail is intended for the use of the individual to whom or the entity to which it is addressed, and may contain information which is proprietary, confidential, privileged and/or protected from disclosure by applicable laws. Confidentiality and privilege are not lost by this documentation having been sent to the wrong electronic mail address. If you are not the intended recipient (or the person responsible for delivering thereto) please immediately notify the sender and destroy this documentation and all copies (in any form and media); and note that any distribution, reproduction or other use of this documentation is strictly prohibited and may violate public and intellectual property laws. Thank you.
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> https://linkprotect.cudasvc.com/url?a=http%3a%2f%2flists.infradead.org%2fmailman%2flistinfo%2flinux-mtd%2f&c=E,1,Xh2NmZs7gefQx34TtrCEOwqEojHkrwcC4s3P8wZQAFW-F4oaZOFhE3eja3YeKpzd6xXRcGMSP66fqVHs7GNJ8E1BAmMNr9YJru9OI80OJrm0k08qiw,,&typo=1
>

CONFIDENTIALITY NOTICE. This documentation, including any attachments, transmitted by electronic mail is intended for the use of the individual to whom or the entity to which it is addressed, and may contain information which is proprietary, confidential, privileged and/or protected from disclosure by applicable laws. Confidentiality and privilege are not lost by this documentation having been sent to the wrong electronic mail address. If you are not the intended recipient (or the person responsible for delivering thereto) please immediately notify the sender and destroy this documentation and all copies (in any form and media); and note that any distribution, reproduction or other use of this documentation is strictly prohibited and may violate public and intellectual property laws. Thank you.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
