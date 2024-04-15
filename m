Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DEC4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cNRikRMztlLV07CFy6fA37cf1E6rCubKj5+mhs70U8U=; b=e/+gpIVFHidLLZ
	yGB+NPnUqRSlotRz8AefyotNgAQmYjwKcJRKdRUCHAIB1skUIkE/JE0fqGcELp2Ix302YFlx/SHYk
	XkB5ZQErGVEERMaSqN2CUR8v3l/XZN9NISai4HCi2VamB2c1igKNLy9dYqrOtEhwkoIZdhlebsEZm
	r4A5upWsYkIKk++udYY1aBkgj2/ldTuhRM1VpwWgPCd7uxBE0U+kD05E8j0HroL4Nc84KMsPWruRX
	Et+sF9ZXH8ww6wO1cji75+DaIKPC+chMultFGesvZVZXdzhsyY8IRKls7Q9b7CMp1aOlNGepfwB+5
	66CuWE/tAlqIju8MWn0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOg1-00000008xQA-1Srs;
	Mon, 15 Apr 2024 15:55:25 +0000
Received: from mail-mw2nam12on20700.outbound.protection.outlook.com ([2a01:111:f403:200a::700] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOfy-00000008xNN-11aW
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 15:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqdkGYA63xV4ItL99S7Pd4Ru6o/KLG2l9v0LHBizdvm2H5pKF1QcegJ3hOvUjT08V3QT0uTkegiVxaA3RwKpMDgBtx3gb56LPpX2RHMMGF4+7qZtkj8tgCBgat7BMNcMMa4gglu1uZw6WZ6S5FrEn44LtAy7qVWjwq4QDJ4ZeZD4ErMpgmPZsxx92fJ0sgfsDNkduyoKW7CJm7/dIv5iE1OhOfbN8yV2ANkBnuPxUnJIP8Jp9I7Rjg+oMIPW36mS9xYqrcG39PFTLBFv9+jTuCVmdHK/6uYu1O/vOUKHACMtW4CExjxiqTc0j7mS2LZXPEhvMyPwy4yT2y0xsc/sbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v83WbzJJEHjU6dcw2vOeigLal5AjCY+gxayhBEaVdeg=;
 b=CPABANXIkw38+nRGZwKrBfCWZxzOYCLHySwRFzMxRttzfaIkhoendagIFhIKq7TTnMBoKbYALd1wvkNEepA2XuqZEosNVoWkBIPAexOBMtvTMGjYSX+44gc8gGCClzn2lCpChNPlORevpUVQnDH5fD2i1ZoLpVF21aO4Vpd+auGP4vuSNmaYu9TiSbseCY57ueYPpXWk2ICjsQ73K7jlHmMzTySsMJR6HrK5ew6jQgzAzUp7UPI9JfHjg9PizK7TtOjShMj5FjIpUtHFzV/3hoFMiS1hCsKJ+Gqi0g4TFWrRiVb8xjDucunuF1TXmvDts5PzxDO76oqjjhGFIEDGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v83WbzJJEHjU6dcw2vOeigLal5AjCY+gxayhBEaVdeg=;
 b=t70d+E9RZxgolfWoAb8s4n842W4vj8utrvPuEb5e0wsK9fuqs1wRhVLYgDc6N2ZkY0vl26MY8kBMcuMQ6A6si/40ngCckhq3vmDxj+FHRKZ2PvWvlqNIgMtYlhgXUMtLgzYMBnWmwOEIIIC3CN1jds3GZFo2gNLm3fJYzmYChTTXiXiQPMwWzYGyKC7kvVe2wX0+aLXL8G87WswuHGJCLLrS+tAgYtYfZcgV3WTIC4OdnHbl1oRHhP6iDox33zZUdeWVj0frJU9zqqO8NKfQ1kPVi4gyZmZgn4PE8aCDyvz4lIhSeP8e+AdLQCcMg6qK5uR2Wjy5Ia3pGLvQa8pjpg==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CY8PR10MB6684.namprd10.prod.outlook.com (2603:10b6:930:93::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 15 Apr
 2024 15:55:11 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f%6]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 15:55:10 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: spi-nor: excessive locking in spi_nor_erase()
Thread-Topic: spi-nor: excessive locking in spi_nor_erase()
Thread-Index: AQHaj01L6sSQ/XG/4Eyuk2wXNC2LlQ==
Date: Mon, 15 Apr 2024 15:55:10 +0000
Message-ID: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.4 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CY8PR10MB6684:EE_
x-ms-office365-filtering-correlation-id: 06bbac45-c422-4ef9-43dc-08dc5d646e41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BuZiwZrOdiNnDX7hi+Uuugm1JXQXpauH9if1NbGMFDFpw0uSp/dKAUII07VrfD/plFAjAYEbhVoNdSivge37IwxVpKpOCF2cV4RjtNvhljojAbhfHWZZoetkCOu/ldVHHRwhEuNOjCAENFXF+ph5FtD5mUhKMZBvt9FV4eoLunY/WLiTeHet5/amFQA2ei4fV1FFmS4NYqfmPO61lYKEL+ZBDM3lcaEBncu2UOnRnkkq70PWty8X3OeelzjtT/QVXt93jsAqYyGM+nXx09bSjrd5CKKyrDcENJCSJqIh3cxneW2s3/ZpPvXHuav3j+jvL+tTWIVe95phQpM7Qa87gZz+XEDrXZ6qCYO+5ujPnZLDwQn0UjSSgTF9N4S6VFS8+XG4blDVD7EiehvMT1NS15YZCDVlJuexUJ4RITc9aDfZoDfI6oXP6G8YzUZ9SU6O13jdMwWK5+9EoibJePCa2WITHHbyVAuaoB2rSMWHwUJloxrpGWnPWawhAb1YZ2gj7R4rvIjxICNoYrk7BLBfEKoDTBSoFwXiUvmD28fG9UBvsuWbfQlJaVB3S3E++jl63KOIsFciYOcqXq2eTeQMag7DnxiJXSy+CAqX81v7ECgkuXMrmidublErZNkjWawRDtJkkTVmDZactQow+Qjb3HvxkRyD6VFiCfT+jFbv5R29rGu8M3sFx5muGKtaU5yAfJtq1595Ao1loFcY/P4yylafFgnBgHHq8pbugzUzEZI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnpnNklGT0FkcVlsSE1DZUdIN2RJaVNtQit1SzBuSTEzdlVZRzdCNFJZbFhy?=
 =?utf-8?B?djFCd0ZSRHluS2dOY21GK3FmYUI5VlRZcWd1eGhmRURZaXFCRlRVY3gxMjRE?=
 =?utf-8?B?bmFSY0ticDhTczJ2VC9iOW1TSDRRTTBZT3NXN1dQb25ucURBamxpRVlIZFcw?=
 =?utf-8?B?TGVhTXNkdXVqTFBkbXVpczhOZjYzVWJndU9HbUJoZ3U3NjNnbjAxb1lzWGdm?=
 =?utf-8?B?UzhTL0hpR0U2QXBoeTNrV0tGSkMzdmp3VWpQL2JiTW1ybzl5MjV3UmZYVmx5?=
 =?utf-8?B?QUdscG9lOWxUZkF2WUZjSjNwcTl3UnFhQ0dqUGNyTU5xVlNSays4b1JWSlJ4?=
 =?utf-8?B?VFoyUzNtOHV5c3RyUUU1am14YUJZclJ2VjhMS3hzUG00ZFh5ZlVSVTJ1MGly?=
 =?utf-8?B?Yi92RVVRYi95WFAxZ1JLVGs1cGFITTNFN0x5eXNvdFpPSkZuYytLeXQ1QWRy?=
 =?utf-8?B?SWMwZU5ETWZrbzV4ZkJNY1FvWmZ1azdTZDBsNEExaTFnQTNhc3k0S1hzaXJa?=
 =?utf-8?B?KzN0cVpQK3czYnZyMDlwYnFoV3RIOWhIWm82M1JwTmlsVytIYnJCeFF0Qjcw?=
 =?utf-8?B?OUdEY0FwTnRFQVc4SUNibjdlSjdIZEJ3UEVTTkwrSURobnJEdFZPMG5wcGdv?=
 =?utf-8?B?YWQ1SFpXbHBCWHZ6cHM5Y3p0Y2NZaHNFbGZkMEYxN0xFREhXQUJWT01NMmZD?=
 =?utf-8?B?SmN6UGN3WitQOStGU3VBUXhxUDRESC9lQmpkSEx4QUkzNE42NjRvVm9ObnRL?=
 =?utf-8?B?TGVNdDl6NVlkNWpURDdoWlhHazFrV05GRVNBUUE0Umc4Y0N3VWdSSWs1UmI2?=
 =?utf-8?B?MXVDWm02Y0pWM3BDZGxHcnM0QzJQMUtyWDdBYklWQnVpWEsyMGhnb0w1eml6?=
 =?utf-8?B?NkU1WDYzK0IwdGxrYkNvSTg0UTJnMC9qT29wamhITllGbExLS1FtbncyYW9Z?=
 =?utf-8?B?bEQ0bk1hWmpURHdpTERSUGtGb09xckJxcjBRemlJM3RNL3RqVWFsWkV3NlBJ?=
 =?utf-8?B?dUtHSkFwSkJQSTY0dUFmUGFjbjdPQlBsYzF5ekNuNHloaTI4cmRiS0ZUYnND?=
 =?utf-8?B?NE9sOGxDd2dzQ1RuQllDTzJPdjBKUDFDQnFzTzBrK3AyRzZIbUV5eEl0dVNN?=
 =?utf-8?B?V05ad0pOaTNkNGV3SHBKcXhtTmRHY1BlcityaHJ3MUh6M0VPZ3ZpYzM0YkhR?=
 =?utf-8?B?TTB0aFIwd3l1MWo3L1p2TlZvdis4UWM4anhkVGxIM3pPR0lJVWZpNWpCZUFR?=
 =?utf-8?B?L2VXRFdHT2pVeUJMRG5MWUEvZkFDZ2hKbnc3akpOWUd1dW5MMWVoa214U1RW?=
 =?utf-8?B?MVAxajd6YkkrOWgrVkdsMlliekhPVkttSnkyRkpyVk4vWXJDVndsMU0vTE81?=
 =?utf-8?B?T1NZYkE1YXdlSTI1RzZhZ1JmVnh2WjhpdGM5TmdKbDVRdDY2K0lKZXFlOWZB?=
 =?utf-8?B?RzdVMkl4SDFvNG4rdFhLdFg4TDhUaWxDdUxYcE45Q0VTaHBQSVVBQnRmMm82?=
 =?utf-8?B?VmRCWnAvTWN1Rks1OHp1aThyMFNXRVJPSllTdjg5VXBnMHcwNXpFNHVBdkVP?=
 =?utf-8?B?RjZuVUs5Q1FyV1RQVCt0dFU0RFpQOHRoVUxQTWJsSWZuTGhRQjI4NjErU1h6?=
 =?utf-8?B?bHhKRmlIN3VVMDBROW4ySFlXVzRKWnkzY016MG9ldVVBbWJRZnQ5NGhSdEds?=
 =?utf-8?B?aVVpaFplSDdQdVlENEFTczFTREJtbm1mbW5DelZpRnVxcG5TWFlnMkQ4aFBV?=
 =?utf-8?B?M3pudm5pSEJmcDRFNjkweklDT3NKTXdwa2pEWmJUcGdtZUh0SFpzbnVyY1cr?=
 =?utf-8?B?dU54cnNvUjdpRkdvYWMwV3hJQ1BmcUVMU3dDUnJPR1QzKzFkcEdkejNaSHJ3?=
 =?utf-8?B?TDF5UjVnNW9ob0pkK1Zsb3FsWEdYSjlaQ29FSjRSMVdlWWZ2TE5VWFVtZVI3?=
 =?utf-8?B?S1Erc2VIQnZjSk11WDV3RER6aTNqQncwaXJkcU5rbTdVK3BMRm8wYWhFeTJo?=
 =?utf-8?B?bWJXMHdCRmJ5TW1sQ1RmNzArVzIxK1RIUGZuSnJ3VzRPcTBobXhLRGF6L0s2?=
 =?utf-8?B?aUlrNGF1eW96d0JVOUw0ekRFUHIwUHFTbmJNWEZIbTdxRzhwMnB6aDJVeXBJ?=
 =?utf-8?Q?H9l8PmcawYMRCefJmKtbhhaMm?=
Content-ID: <81022CB17CACB344A8D316B765274719@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bbac45-c422-4ef9-43dc-08dc5d646e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 15:55:10.7051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lJcWMYbN5Gj/+2a4XB57aXMSSQKCkiRDCqPEaqChlXBTYRBsRxJqqnsmf5fCN9mvnMTyjyMyms4pmjHHMG/fMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_085522_322878_61B9D162 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
{
...
Lock here
	ret = spi_nor_lock_and_prep(nor);
	if (ret)
		return ret;
....
Then we have:
	} else if (spi_nor_has_uniform_erase(nor)) {
		while (len) {
			ret = spi_nor_write_enable(nor);
			if (ret)
				goto erase_err;

			ret = spi_nor_erase_sector(nor, addr);
			if (ret)
				goto erase_err;

			ret = spi_nor_wait_till_ready(nor);
			if (ret)
				goto erase_err;

			addr += mtd->erasesize;
			len -= mtd->erasesize;
		}

	/* erase multiple sectors */
	} else {
		ret = spi_nor_erase_multi_sectors(nor, addr, len);
		if (ret)
			goto erase_err;
	}
....
erase_err:
unlock here
	spi_nor_unlock_and_unprep(nor);

	return ret;
}

So erase locks the flash for the whole erase op which can include many sectors and I don't see
any Erase Suspend handling in spi-nor like the cfi_cmdset_0001/cfi_cmdset_0002 has.

Locking can be a challenge but this seems over the top, anyone working/looking into improving this?

    Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
