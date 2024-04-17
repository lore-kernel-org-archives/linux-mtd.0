Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74819C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0A4d8TBCaAsSri3IARWIUiiKcAI66LrJelC4i2EbEG8=; b=RLR/vqcRk1Tg9E
	VbMRRkDzCbmYY3e0zNqtzMoy9MN02EzF6zdueARfwer1KgwOtBlHePDIG5vDjBIHWBUzAgEeQswOJ
	4EX2gNnJmlFr+3myuOUViesbQzqXgZALRyVjizFzAYwVLvKLOpG16hJUVVjqM9CT+p98RVK2tW0YE
	3STHOdJUVkFL6MkRL+eCh7+ZSqKM6h46YByTiKdQuwMfiZOhKTdyiAO/nX43wpIVUyxEYnELY8+HK
	GI4WDOSF4bM0JyrPyRxFgcoffiDBeibg9/twG14v6yBHQsvDvgbSre71SFH+RNLjGbfK1VCXnn1ep
	PCxWU+Y/6/x2iOCBVGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx4oO-0000000G09K-1rrb;
	Wed, 17 Apr 2024 12:54:52 +0000
Received: from mail-bn8nam12on20701.outbound.protection.outlook.com ([2a01:111:f403:2418::701] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx4oK-0000000G068-3018
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 12:54:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNzxJohiyMUFrkzpQpfFgwEWMMrA6xKIzsYin0cLtobNS1+WA4mrTg9hH1Wko7drYb0RjUaLCD6ajQpOoRVAlXY+pv+QG6O3QcWTUm3kIsgugHyFVwZECiDUVO1CH6MrNMc3YbnH0F+BlfzBKscFwHmcw9UJVNsuWYWDUR4zqDyxJcGhaN3CilfQE0RAdkcLFtEMs0eX/OaM6jZ64OHuT3T79MZjmZ+I+o/wYbFEPB7EYUT7JmFVzBXwYFDft3X3A6Y1QVIYRJAiv2O1V1ywS2Frv1mh1gRAxwDvjDg8TEK+afZvwy4xw3vc14+b09YTncQk/CX751t9HsyYAwN6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itcnUOEjNvIlcWnbwQJOFtlArGYcH3+q3el8XEqFXHQ=;
 b=XRSZ2vxPZdfk4bO7bDsFew9up+9pviA7qXX8wHEQJHTO+MoA9rcQLbf6kWM3URlxGpWOkFmgZ6mB3WdXxO87JC7yB/ewO+z+wz73jdnx85XagROZEX0mZWJXIOSqUwyoA0Ab859pKJecETHsogvr76yIrVrcvgP5HbMO1or173L7QGSDiVAu6SIb7+iVt7yUayYuRgD4whPYMvqTdRm8UQe9uLdHksnSQmHfyXxu5Sv6r+tnv8KriiscIHSopjBseF5UaJoX2IrFCRFzZ5lBvevIjktB4kb1eZWUICwBJm2x3bRtMb/pGzc1dKQbejre2xGklmIDe6FW/fNkwpbM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itcnUOEjNvIlcWnbwQJOFtlArGYcH3+q3el8XEqFXHQ=;
 b=u9Q0LCrX0jfYR8W/ly+WOWcA2hcxpu2PTR0/Meo5FMF9cOW+K/F3H44RTq9xf+9ZpKr6TNtCGEoR6iE4E1qlZ/Xyq+kDEmfY9HCKbAnu0i2fJ8lHcLGmZkNylB4h+ERRQIgrRLKSALu9+6Ylwk5G+C9nrQlhwu6IBRqsFuAEfIEFKQs0crpQAC9eOLmBGWzq24lOrVbMzZJVT5fD/TQ6AVbxy73FAUxGwwaUpY51HOwe+MFqsetEneOLD0g//641MjBAG88MAwsqEJDs83LlDv75+Q8BtCy8qeTwsrd8OUeCQ4vWURlrSfjV+L79AOt3zIWubtOC/E3lLPu92wPsUQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 12:54:37 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f%6]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 12:54:37 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "pratyush@kernel.org" <pratyush@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: spi-nor: excessive locking in spi_nor_erase()
Thread-Topic: spi-nor: excessive locking in spi_nor_erase()
Thread-Index: AQHaj01L6sSQ/XG/4Eyuk2wXNC2LlbFrC2RBgAAm0QCAATi4jYAAA0SA
Date: Wed, 17 Apr 2024 12:54:36 +0000
Message-ID: <9bfdc3a36d4112dd6464f26ebe86e82e88cb6ccc.camel@infinera.com>
References: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
	 <mafs01q758g7z.fsf@kernel.org>
	 <8366e6def86b792f3e8b0077dd9aaa5cbecf27ff.camel@infinera.com>
	 <mafs0wmow6tyu.fsf@kernel.org>
In-Reply-To: <mafs0wmow6tyu.fsf@kernel.org>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH8PR10MB6574:EE_
x-ms-office365-filtering-correlation-id: 4b0eb234-6009-47b4-aac7-08dc5edd89a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WSpayVLUXnShOpEcJKNkA2FjHP5AOS++Y0+Wch945VEbqwRCAYPLqcqiYn5jXYGz6NTzahmZXocsPSd5voWoc5pyGuDA87i4FziRzju1TpRAb+Vo+PBq9xuaVCRYimWJkFhZshFzekvV14fsNn+/rHKf43py47HV+VJWCvNm8TWKVp3z8GGksYDErbsZPZhMoMw74r4F7lIeCTKgYcJf+pbfNn6j0JPcMnGEnLjoM7VJc25AufJkPkoWysoWphs67Mn+V604AdVYSyVFcE/qYduMHN6XqDmtUQ/GtHSfCycYMYogfvwkzgUfOD4YMVBWsOooiNZCnjdWzWwrI9qukPUoHhdCzXLuwH0G2uRnKK7JVD0cExQAB7mEN01k60SuXAWfa5yltjkxVTMoLH1VZy6BLZB5M8f3TbFbuRuCojPeQw/5QvK1y6kluDlFxkl/qU+RJWlk+O7n3ZHh/qaLb5a4arqeol5sTrnf5fwr2X43M3J2rd0/ugKuoNH8JKD8du4lwR1RZ84IsjuZrLp8NuGQ08I1VC41SVf/hqk/szxwzibPw5ZW/hUD6VM4jTyvh9byQHxFUyM39OS2YHMym4JGvwdWplx7vOPLLOB5600McJw2OgwA2qJ7BE8F7B9SQCDChUlFjLziT5d37CdbyUxwcX6iMVBJukJ4r7L0+iw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmlZdWFUbzczSm5EYzhpcUp0T3lIZHFSNlA3YUVOdDZqWDV3WEhmV1VvRlg1?=
 =?utf-8?B?ZnFFdWpkRHRGMlpqNnBmbzQrTU90a3FQbkFpQS94VE0xb2o2cUgzKzJCK3JF?=
 =?utf-8?B?b0cvQVJJZWt3Q25qeVZOWUh6YTBtMkxEOVYxcStjNXF2Mlg3MGkvZ28rZ0lm?=
 =?utf-8?B?b3hFamwvMUlPdVpCbkZ6WlNrUVRMWmUxSEpGMWZNeExNYkI0bHMzTGhvU0V5?=
 =?utf-8?B?TXBudnErWGw4Sld5RTZhVFUvTE9BYzI5QW94My9hRWhVOTdXR3pUalB4WTBN?=
 =?utf-8?B?M05iNHUreFNLai9TS0FuRzBVSzZnd1ZPTUlob0swREhFMWxZMzh3WkRYZkpS?=
 =?utf-8?B?Q094RG9FbGc5bHJCb0xnUWMwMnZDaWNMS2JSVC9LcEthZDJlWGltSDlnVE9F?=
 =?utf-8?B?bVFYWXBkUDhqUjJIWWNCbzl0bFpjRWd1MGp4REhnSytmR3pBL2oyaG1PRnBL?=
 =?utf-8?B?K1lZNENpWThTNUZkWldxdEs4Zk5rTHIvbUxJWE85YVBsWXY1SllGYVBTbExk?=
 =?utf-8?B?MzRWT2M3SnBieE5nM3FUYXdETXVmSUlzeHhaQkpPcVA4SHRUSGVrQW91WjlG?=
 =?utf-8?B?Um96MEpNWVZqdUluTTA2WmVwWlpJTG1KMmUyWGE0WHBsSUJkaWpPRnlUWkZU?=
 =?utf-8?B?Umk4YS9iSXlrNTg3d3dIV0FMMGEvRkYxRG52QjlJZFRKUEhZcjdKdU1zbE1I?=
 =?utf-8?B?cmxOaFVlcE55eXdOd0plSk0zVTV0VEFQSXZOT2IwMnVMcFNCdW5USVpVOGQw?=
 =?utf-8?B?QjdzK09OL2dwaW9HeTc5R3ZOOXk2SWk5NEFiWEZwMjZzN2d0ekxrQXU4NWxu?=
 =?utf-8?B?K2tlbzArdVk5V2txQm1ONkgvcUN0ekpZOCtsSFNjTUNZOTV0YmIvMDJldlV5?=
 =?utf-8?B?TUVOakszWmhmRWtrUzNnaThMcVhYKytaaXN4bG1WWk5BWVR4VkU1c25ET0hp?=
 =?utf-8?B?aUZXdVI5cUEwZUZoMDdtc204MndGUlVFUWUxc2hCMXlzSDg2Q3RuU28xWjJH?=
 =?utf-8?B?eXYzUkw5SnBnbG9BY2dwUzlnbjFXdXgvTWU5QnNUbjNKbDVSYlNBUFA1blZw?=
 =?utf-8?B?aVFNRS9YeE1YdGZ4dkV2VTZRWTN3QzVyZTFrSkw4S21wZkZkL2xFd094ekZJ?=
 =?utf-8?B?SnZLaDJ4SW93dVNUcVcwVUlXaEtQL0t2VjU2cXZPa0xJeWxjYjMvS29DbTNt?=
 =?utf-8?B?WC92UjFhd0lwak5LblBlYTZBWVNrZFlMNHhIV3M3aFRLRklBVHFnSVBVS2s3?=
 =?utf-8?B?Y2JWa0ZpdTY5ZU1HKzJyZ3JOOWN4Z09wTmlRQm0vdDdUWDRmKzJXUXlhSnhX?=
 =?utf-8?B?Y21IdnIrUDUwQmNKSnJORWRLOFdZN0NKY01Da200cnlIOTBvN0pQaWtPbmsw?=
 =?utf-8?B?STdTSGRVV21ReFZhME9OWEgyNnFoZWFNRzJEamFGbEh3VnVRSFJwWDViSUxk?=
 =?utf-8?B?N3AwQlBiZmR4L3AwQlhyUy83MWZZaS8vekdwRkxLWml3L2JKM2lqQjJRdWpE?=
 =?utf-8?B?TlBLYll1dWlzbTVUeUFGa3cwUHV0Zm56YXgvY1ZaTUluaXZwakV0bEQ5SjYx?=
 =?utf-8?B?VVh0WWlvd3ZSQ1pRWVhSYVdwQlJLVVc1dTFTZ2pLOHdkOU1oV1FqZVAydzF3?=
 =?utf-8?B?NlJGd3VIZ2pwYUFUQ3o5NUFUbk4yUHVBem1ZSnNEbkpqZThUZnJyZkswdmx2?=
 =?utf-8?B?RGI4NEl2cVl5TStjUUNMNDlKbFVvdjVFSzBTWHJsYUwzMzRvc1UyS21vMXFv?=
 =?utf-8?B?OW9QZTkwZVNRdEJOVHREK01qbktKejkxdjhqaFRGb3lBZ3pDYVdOS1QxcTgv?=
 =?utf-8?B?ZFY0UkNnSmhJOFdiV3VSTkhmMG41dWRRc1E0ejJZaFg3SHVLVG9aUXlSZUVu?=
 =?utf-8?B?UFpsOHBOVFBJNVI2OVNVbUhDa0hOM2RZck5tTTF0TVlXZTR1ZXcvTlE1YnFB?=
 =?utf-8?B?WGJ2TnJ4a08wOWF5cm5lZ09DNkk2RFFIcHRSR3BLaG9QU2FRQnBvZGhFeWNt?=
 =?utf-8?B?dExRbzFCakhFSVZEeHk5TFBJZEdOTGJDSWVFRFNTV3VyUXZrczR6NTU3c2dl?=
 =?utf-8?B?RUxVZnMrM1h2TE9DODhFaHM1R3RsM1FsLzFCdGx1Mk55T2tlTVRLMXpkT3Jk?=
 =?utf-8?Q?AvC8Nxp+TUbRQQ2FUje9IoQu0?=
Content-ID: <9CAA110594B58846B2E55C848059CD68@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0eb234-6009-47b4-aac7-08dc5edd89a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2024 12:54:36.9630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2foGuKY2CNCZe+icSw1Z3+pmHb1zfuGPiHkE/me4lQbuI0XhiikOfi0PcKcwi6ebNU6RY6M5aXTnAqcAImc3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_055448_876134_EBEDC567 
X-CRM114-Status: GOOD (  43.14  )
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

On Wed, 2024-04-17 at 14:42 +0200, Pratyush Yadav wrote:
> On Tue, Apr 16 2024, Joakim Tjernlund wrote:
> 
> > On Tue, 2024-04-16 at 17:44 +0200, Pratyush Yadav wrote:
> > > Hi,
> > 
> > Hi Pratyush, thanks for replying. Se below
> > 
> > > 
> [...]
> > > > 
> > > > So erase locks the flash for the whole erase op which can include many sectors and I don't see
> > > > any Erase Suspend handling in spi-nor like the cfi_cmdset_0001/cfi_cmdset_0002 has.
> > > > 
> > > > Locking can be a challenge but this seems over the top, anyone working/looking into improving this?
> > > 
> > > I think you should lead with what the problem you see with this and what
> > > you think can be improved. Why do you think the locking is "over the
> > > top"? What should be improved?
> > 
> > Sure, we have been using NOR flash as RFS(JFFS2) for many years now and it
> > is important that RFS is responsive at all times. Up til recently we used parallel NOR
> > using cfi_cmdset_0001/cfi_cmdset_0002 which has worked great.
> > 
> > QSPI is different beast and its driver not mature for RFS use. Consider when our
> > sw update starts to erase Image B partition, then the flash becomes completely locked for other
> > processes to use, one cannot even connect with ssh while sw update is ongoing or do an ls.
> 
> I see. I assume the rootfs is on the NOR flash. While a big erase

Yes, same flash chip.

> (spanning multiple sectors) is running, other tasks do still get to run
> (since spi_nor_wait_till_ready() calls cond_resched()) but any task that
> tries to access the rootfs would have to freeze since the lock is held.
> 
> Dropping and re-acquiring the lock after erasing each sector or
> programming each page would let readers make progress in between. This
> shouldn't be too difficult to implement I reckon. You already mostly do
> it in your patch below.

Yes, that is simple.

> 
> Doing erase or program suspend would only make sense for flashes with
> larger sectors since even one sector erase would take a long time. For
> those, I suppose we could give reads priority over program or erase
> operations. When a read comes in, it suspends the erase, does the read,
> and then resumes it. This would be a little bit more complex to
> implement.

Right, a bit harder but I think it is needed like cfi_cmdset_0001 do: suspend erase to do read/write
Don't think cfi_cmdset suspends writes, that seems overkill.
> 
> I would suggest you try the former first and see if it already gives you
> the results you need. From your patch below, it seems it does. So
> perhaps just cleaning it up and turning it onto a proper patch would do
> the job for you.

Tests with my patch shows vastly improved responsivity but there is still some
way to go. Consider that an erase takes some 0.20-0.25 secs for us in best case in
which apps are blocked. We do get some complaints from the app taking too long to complete
some tasks during erase. 

> 
> > 
> > ATM I am testing this(which makes the system much more responsive:
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index bcaae9c71d90..62fe9cb97139 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -1635,6 +1635,13 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
> >                         dev_vdbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %u\n",
> >                                  cmd->size, cmd->opcode, cmd->count);
> >  
> > +                       spi_nor_unlock_and_unprep(nor);
> > +                       //cond_resched();
> > +                       schedule();
> > +                       ret = spi_nor_lock_and_prep(nor);
> > +                       if (ret)
> > +                               goto destroy_erase_cmd_list;
> > +
> >                         ret = spi_nor_write_enable(nor);
> >                         if (ret)
> >                                 goto destroy_erase_cmd_list;
> > @@ -1721,6 +1728,13 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
> >         /* "sector"-at-a-time erase */
> >         } else if (spi_nor_has_uniform_erase(nor)) {
> >                 while (len) {
> > +                       spi_nor_unlock_and_unprep(nor);
> > +                       //cond_resched();
> > +                       schedule();
> > +                       ret = spi_nor_lock_and_prep(nor);
> > +                       if (ret)
> > +                               return ret;
> > +
> >                         ret = spi_nor_write_enable(nor);
> >                         if (ret)
> >                                 goto erase_err;
> > @@ -1987,6 +2001,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
> >                 ssize_t written;
> >                 loff_t addr = to + i;
> >  
> > +               spi_nor_unlock_and_unprep(nor);
> > +               //cond_resched();
> > +               schedule();
> >                 /*
> >                  * If page_size is a power of two, the offset can be quickly
> >                  * calculated with an AND operation. On the other cases we
> > @@ -2005,6 +2022,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
> >  
> >                 addr = spi_nor_convert_addr(nor, addr);
> >  
> > +               ret = spi_nor_lock_and_prep(nor);
> > +               if (ret)
> > +                       return ret;
> > +
> >                 ret = spi_nor_write_enable(nor);
> >                 if (ret)
> >                         goto write_err;
> > 
> > This is s good first step but not enough, one need to support Erase Suspend(which the vast majority of flash support)
> > to get full responsiveness(see cfi_cmdset_0001/cfi_cmdset_0002)
> > 
> > > 
> > > Most flashes can't do any operations (except poll status register) when
> > 
> > Not quite, see above comment on Erase Suspend
> 
> Yes, I meant in the absence of a suspend operation, which SPI NOR does
> not currently do.
> 
> > 
> > > a program or erase operation is in progress. So the locking here makes
> > > sense to me. We do not want to let other tasks attempt any other
> > > operations until the erase is done. The only exception is some
> > > multi-bank flashes that can do erase on one bank and reads on other
> > > banks. Miquel's series [1] takes care of those (though I do not see any
> > > flashes using that feature yet).
> > > 
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/spi-nor/core.c#n1789
> > > [1] https://lore.kernel.org/linux-mtd/20230328154105.448540-1-miquel.raynal@bootlin.com/
> > > 
> > 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
