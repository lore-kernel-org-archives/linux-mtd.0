Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5D0C4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2024 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nItuImB/JxMBpPLg7Qh8pSBvy0GrCp7EJbhyXAJKKmw=; b=yOoqN1R8QivkS7
	mO9gtt9GtjdkZR85X0C90p+tM5QSRiy57bVZvDwuUKjsn5vH9yieg5x0063TI/7SSg6uQ1K5vmXWL
	walL7wGJneSboR/NqlCwJD0IzfBtpDeJJ+52uxqGqx+CLXcXt866Y+TnjpL3xbZN5f0TDMYkXQPs+
	UhoNm156jMOPwGOnLWxZiVB3iAQCIWXKgI5gywWCEwR7QoilpT8FZWj8Mt5BfOkGri7aed36lKoH1
	XcxxV/gEDcwQIN/63cxZE9ea8qprv4idJYBBSY6/aDhejZAKMI2CfgcbzhvQ3QsumWv4IspNXiB+F
	qJnvzTf6ommXBH0VUXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnA3-0000000DFh3-0a1T;
	Tue, 16 Apr 2024 18:04:03 +0000
Received: from mail-mw2nam12on20700.outbound.protection.outlook.com ([2a01:111:f403:200a::700] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwn9z-0000000DFg7-29rK
	for linux-mtd@lists.infradead.org;
	Tue, 16 Apr 2024 18:04:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd3sVJmf81Cr2g4Gc0zfXBkTDjKxK38YmV7NiPtt59WT5X/4qO+DnxrBkSiibCHtb84EaOuz+JFYYTlaRB5sccW94AwFRPcbxALckr6wDLA5Tv2kPvXe8FN7T53YuZgHRTwD+UVEQVg54rAD8TR2KS2s3cGHduyvVhS6I3rAqI7gLJnpsARnawcnYrxB13M34QgNe1IqctIn/5yz6D59+aMb4hMULCqeqbqvZAXBkSuU3wE5Za1b61uLnteXLmCj0wVHFxUHgPs0kHwBfP09QlUjNW2Gz8zbf2r7wR8txo7BaRe88pZn6ufZKnMJhydc/QgVY99UwQHj6fx05fa3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qNES5dRg63Y5loQcjwgZEzoEj881XCd7Gsd7bnlSnc=;
 b=SzTrzmfq+Vp/IrQq+3X0ckYK52HJyYLQry3dW5rDoeIr6uWDTsOJU7pCqz805upSPvj5y4hxJAs/jtS/AnYJlUeFYrCLbjSyuqCg+dFYcDwd3YgdE54uDhT15DZaRPgc25toiY/KziMUsLY8El3gCUgA8LX/zBP4ekNqhqhS+UNRw4lmY4taTreBYJeb8jc9p9DFXuuFm3LIsms011q5Fjn+6NIi+W5OTHHd344SRQRgAa865JO2B85v0Mw9vSQ4elwRZFszNWytO60RQ/lmCf8uQyhkSD3DiDaiZAssXIzvov6MLIG7pop3C3t548P3RGkWMozf0tjAXVMySFILMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qNES5dRg63Y5loQcjwgZEzoEj881XCd7Gsd7bnlSnc=;
 b=pzS9aHbDgBlCr4P81XWnB1wPYTUorhJM4soQz1dWGm+wqtbRJIWKc5SikA5kHAs6cw4+G5Q1RSvuAxutVHJdHsRm0gUaet7yD9w3t8mU7RLRcexCQULyEBYPnC7BxycpdzvbO2+6Pv2QykdwJCwU3x7VPhT+Z/96m3H17NoU1bZ20/uTEqAJijs4JB+BQitxmK15Qy9LtDNRlbV30BUoQbg7qi9/DNHet0n/UL1qETUCb0C607WihcKqxA40asB95KCchH0KOuuQEkX+JToDoWr1Iktz5IuP+NOINRT9Wz3bjrfp3ICz5PhIo0jLrgzoUSZ4vW6eRM4MTdM+OsRW9A==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by MW4PR10MB6299.namprd10.prod.outlook.com (2603:10b6:303:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 18:03:40 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 18:03:39 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "pratyush@kernel.org" <pratyush@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: spi-nor: excessive locking in spi_nor_erase()
Thread-Topic: spi-nor: excessive locking in spi_nor_erase()
Thread-Index: AQHaj01L6sSQ/XG/4Eyuk2wXNC2LlbFrC2RBgAAm0QA=
Date: Tue, 16 Apr 2024 18:03:39 +0000
Message-ID: <8366e6def86b792f3e8b0077dd9aaa5cbecf27ff.camel@infinera.com>
References: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
	 <mafs01q758g7z.fsf@kernel.org>
In-Reply-To: <mafs01q758g7z.fsf@kernel.org>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|MW4PR10MB6299:EE_
x-ms-office365-filtering-correlation-id: 1b50ffa3-d997-4b52-beac-08dc5e3f8b97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sq15yDAyPJFhUtP9G4/3NAcmAwBZtEzItduiv9jxfUQxC9IJ3SijKj2mmJE0iIKkz1Whx0fubiO3r2dzEw5xtyJMT4soOHvTWrT0/I1Dc+UYnRzLIsUrRMEymDgQsKxsnzgKjTJwhh3SXwvvqKNFkut6mushpGsOEZSSX4ff3g9YopjbdREroc20M4tR/VJMaWmVzYegDNY50emshnGMNDsOdqMOAd7My7U3vPRkLzW14H2hbDWmyprw12EO9sm8JHpvihoGK6i6ReDFXmFDbZaYy0aFlFgSC0l+UVNauRzzJGG+QcXqKDWMvXEeDqLoCEDscEruAAIox5XYXccWDDKQfEbIlUufj/qHYBwSoY2kyU+JCW8+4hFGDrJUGbbonoVZuLGcNfmtMg9TqS2g1hVZCgBOhsUUBMl0nDKWdyEsJ8GHREhM1XQwzk6LdBDZ1MKjPlIMSUOFCjG9EyNEXr+nqLEUTMg9jX+MghNWfAsAfIU89w+BvwitEree9o3tbPumeHtNjqOeyD8EkW+EyXqohJftJv481TOO96N8EJmwb2B6wGv4QPsDrOvkKvqbGUIuUO2gFjturrMkLSWeLtpTLxsXZrfONwUBXYouEVlHb5H2cZQB+quk5urS2+Av2qSJfEE2seJsbvQDoQd+A18op7VgkXizGMPP9IivV5A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnZ2ZzdaWUNTekJyMUlzcUN3eTVEa2xyK2pncHF4VENQcTRXV096d1doRkNh?=
 =?utf-8?B?V2QyNXRqdXpxNzU5R2xKTnhvLzJoWFlDZlQ5Z2N2cDFCR3lFRy9obm9RTUpK?=
 =?utf-8?B?c0IvcTJod3BpSldoWEJQSG84VmlvQ1UvL2JRQ2huT0dibkRrQ1kvSHZodGha?=
 =?utf-8?B?SVFERzNUVTZvTFNrbzNmV2RocFVwQU9md1NLV1NIQ1U1R2tCbHJHN1RDK3Vu?=
 =?utf-8?B?TDBlMVlyVlRQcHVmL3JQc0JpSmVCTzlOQ2hEVUJxSDVJTE1rMHhDbCtWT1Fp?=
 =?utf-8?B?YzRkYTdwaXgzM2IzSFp2Ym9IZXFjbWRtM0pCR2ZRb2ZkUVdDYzk5MXJsNTZ6?=
 =?utf-8?B?VTdrU0ZIbDZ5QjNJMklFWDZLOXI5Sy8vSHJyeEVpaHZ4UXJYbFNtdmIxcWY2?=
 =?utf-8?B?cmJHQW1JeWtEWnEzQ1ZXREFRYi9OdU5tWjVXS2lweng1SkI4UUZrODh6dnRy?=
 =?utf-8?B?dU5KV2lPU2trUHJDMmFWaEo5YktaOWZmcnY1U0kxTWMrV2dIT0xFRktXdmts?=
 =?utf-8?B?K0p1a20vZXJZSnVsY2lFcU5LbHRpK2l1YkoyRmlqWHgrRkMzQkVKRXdWWEtj?=
 =?utf-8?B?NWRVK3ZnME1mT1ZIZEU5akpZV29MaWpCOUd1dFZlY0FncWdzYTFZMSt5R2lS?=
 =?utf-8?B?ZE43YW5HVHZKZUpQSk1Vc2VadkVqd0YxbG5oYzdxSDJJN05MY0F2Z1hXMU5t?=
 =?utf-8?B?NUhZRVZKT1liQnB0VGFPbmh1U2xOd2tuZTlOdndGSEIwcEVmOU44c29PVnpE?=
 =?utf-8?B?WHB5bTZucUUwQ0I5NXFUTGw4WHIyRmREVm80cnIzeVFMSytWWENrdFR6MWVS?=
 =?utf-8?B?RTA0WGRVUFN1V0dxTkhpWWlKQXExWEFrTTdFUFJYZ1NlSVJqWFJFZTdHajh3?=
 =?utf-8?B?VnkvbjBqdCs3NmswbzR3WjRWdlRiRFRjeGdUVGhiNEFGeFNsOWF1aHdlOVVC?=
 =?utf-8?B?RjFTM0VnREp4TDk4WGovak9SbFFPSzRWbnlUbFJKUnRPR0ZVeTdPRlBtK0JY?=
 =?utf-8?B?UXh0VkE4NG1qai9JRm5tNmNia2VUeE1pMUw4a2lhMW0wNUJVUkdlbzRGOCtx?=
 =?utf-8?B?dHlUMC9GWEd2YWJRTFd6N3RtWFRkY1ZsajBsRmpYQ0phbDBZZUZieWhEZC90?=
 =?utf-8?B?N29nRTNkdkFwK1ZsR3VSSkVkTWpjL0FpTXFOZDVlUVh4blZtNDVhV2FPalZo?=
 =?utf-8?B?NW1Yb2o1bGZFYVlxM0x6QjBvUEltdWlwK1VLeFpxclZ4QXFMSFhtb21qZmRO?=
 =?utf-8?B?cGg1eHQvenAxUnFkOGorZ1pTcHVyZDE1L3FvaUsvYnVBejl0VzNBMjQ2SDRm?=
 =?utf-8?B?Y3hSdDZaSzYwZ0FCUXR6T2NwcWN2ME5PVVdLMk5TbFhJanNxUC82MkNQRDNZ?=
 =?utf-8?B?Y1RZRnZ5dTNFTE00RnVoT1I3bXFnUkMxaE1ncStaeS82dWpzNDVhSXVRNW1m?=
 =?utf-8?B?ZVM3dlZRcVQvTlRiOGVTSVBKVHN0U2dwNGNMeURYSTlmZ2tuRUlMQno2L1Rl?=
 =?utf-8?B?bEc4S096NFFEaFhwTWFUajEwanVkd1prc3poVWVTQUx5eVIvblpjWnRSLzE1?=
 =?utf-8?B?cnFHSFF1Sng0blZEL1FmWVFwOVZTMHhzcmJTZm9YYUZJODBCam1BK0ZhS2RL?=
 =?utf-8?B?YUVEQUxSOWR3LzJrbjZabmN1emw4RFVlU2IraHZUUEt6RkZEbWtnc1UwbW96?=
 =?utf-8?B?L1p0MWRMSXNGZ0VkRzN3M2o1c1RVTnBWeEhka1FOVENxU3RnaFgvY2IyWTY0?=
 =?utf-8?B?QUo1VzBQOUh3SkhiTmVuQytPbm96VXFpeTZGTnhCa2N1ZWhCZVl2Z2JlR0Y4?=
 =?utf-8?B?THU4Y21DNjJSeXpaMnVyc2xhSDFBTHJKc3RQSjJvc3dGWDB5bVNFUXppNXF0?=
 =?utf-8?B?cjJGU0xKQmZjRVJKcDJEeXBIUS9XVFhsb0F5V3ZHOUEvdkNHWlNablIzQzZs?=
 =?utf-8?B?SXJTaHYxRjl6ckFZbFdMdmxHN0tFZTZ5L2FYcUVWNytuc2ZJMDN2RVNOUkdO?=
 =?utf-8?B?RnhQeWVVS09GdWV0eExBU3dHL2tHaE51TTdqWTN0T3RyQ2FBejdMcmE5SWU0?=
 =?utf-8?B?YlhHVVpEUllVK2xpVGNHc0R1Z1lJemxlNFF3S1BYUHRVWEJSc1o0REFrRHM2?=
 =?utf-8?Q?yHMiDtijyBbC5mJmgcncrBMKw?=
Content-ID: <70025F87B3F98B40A45789B5F81A13FF@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b50ffa3-d997-4b52-beac-08dc5e3f8b97
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 18:03:39.7160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esIRfwkcM6OuUnPKEHTbaZaJD5MCc7aeDjA/DyhfeRkL9OHqdLMQ5qpO6NURsEApd3DhA0gAQyYxgItBJQtNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_110359_633099_098B35E7 
X-CRM114-Status: GOOD (  29.79  )
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

On Tue, 2024-04-16 at 17:44 +0200, Pratyush Yadav wrote:
> Hi,

Hi Pratyush, thanks for replying. Se below

> 
> On Mon, Apr 15 2024, Joakim Tjernlund wrote:
> 
> > static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
> > {
> > ...
> > Lock here
> > 	ret = spi_nor_lock_and_prep(nor);
> > 	if (ret)
> > 		return ret;
> > ....
> > Then we have:
> > 	} else if (spi_nor_has_uniform_erase(nor)) {
> > 		while (len) {
> > 			ret = spi_nor_write_enable(nor);
> > 			if (ret)
> > 				goto erase_err;
> > 
> > 			ret = spi_nor_erase_sector(nor, addr);
> > 			if (ret)
> > 				goto erase_err;
> > 
> > 			ret = spi_nor_wait_till_ready(nor);
> > 			if (ret)
> > 				goto erase_err;
> > 
> > 			addr += mtd->erasesize;
> > 			len -= mtd->erasesize;
> > 		}
> > 
> > 	/* erase multiple sectors */
> > 	} else {
> > 		ret = spi_nor_erase_multi_sectors(nor, addr, len);
> > 		if (ret)
> > 			goto erase_err;
> > 	}
> > ....
> > erase_err:
> > unlock here
> > 	spi_nor_unlock_and_unprep(nor);
> > 
> > 	return ret;
> > }
> 
> Firstly, seems like you are looking at an older version of the driver.
> spi_nor_erase() looks a bit different now, though works pretty much the
> same in practice. See [0].

Ah, yes. I am on 5.15.x, not ready to move forward on this product yet.

> 
> > 
> > So erase locks the flash for the whole erase op which can include many sectors and I don't see
> > any Erase Suspend handling in spi-nor like the cfi_cmdset_0001/cfi_cmdset_0002 has.
> > 
> > Locking can be a challenge but this seems over the top, anyone working/looking into improving this?
> 
> I think you should lead with what the problem you see with this and what
> you think can be improved. Why do you think the locking is "over the
> top"? What should be improved?

Sure, we have been using NOR flash as RFS(JFFS2) for many years now and it
is important that RFS is responsive at all times. Up til recently we used parallel NOR
using cfi_cmdset_0001/cfi_cmdset_0002 which has worked great.

QSPI is different beast and its driver not mature for RFS use. Consider when our
sw update starts to erase Image B partition, then the flash becomes completely locked for other
processes to use, one cannot even connect with ssh while sw update is ongoing or do an ls.

ATM I am testing this(which makes the system much more responsive:
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bcaae9c71d90..62fe9cb97139 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1635,6 +1635,13 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
                        dev_vdbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %u\n",
                                 cmd->size, cmd->opcode, cmd->count);
 
+                       spi_nor_unlock_and_unprep(nor);
+                       //cond_resched();
+                       schedule();
+                       ret = spi_nor_lock_and_prep(nor);
+                       if (ret)
+                               goto destroy_erase_cmd_list;
+
                        ret = spi_nor_write_enable(nor);
                        if (ret)
                                goto destroy_erase_cmd_list;
@@ -1721,6 +1728,13 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
        /* "sector"-at-a-time erase */
        } else if (spi_nor_has_uniform_erase(nor)) {
                while (len) {
+                       spi_nor_unlock_and_unprep(nor);
+                       //cond_resched();
+                       schedule();
+                       ret = spi_nor_lock_and_prep(nor);
+                       if (ret)
+                               return ret;
+
                        ret = spi_nor_write_enable(nor);
                        if (ret)
                                goto erase_err;
@@ -1987,6 +2001,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
                ssize_t written;
                loff_t addr = to + i;
 
+               spi_nor_unlock_and_unprep(nor);
+               //cond_resched();
+               schedule();
                /*
                 * If page_size is a power of two, the offset can be quickly
                 * calculated with an AND operation. On the other cases we
@@ -2005,6 +2022,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
                addr = spi_nor_convert_addr(nor, addr);
 
+               ret = spi_nor_lock_and_prep(nor);
+               if (ret)
+                       return ret;
+
                ret = spi_nor_write_enable(nor);
                if (ret)
                        goto write_err;

This is s good first step but not enough, one need to support Erase Suspend(which the vast majority of flash support)
to get full responsiveness(see cfi_cmdset_0001/cfi_cmdset_0002)

> 
> Most flashes can't do any operations (except poll status register) when

Not quite, see above comment on Erase Suspend

> a program or erase operation is in progress. So the locking here makes
> sense to me. We do not want to let other tasks attempt any other
> operations until the erase is done. The only exception is some
> multi-bank flashes that can do erase on one bank and reads on other
> banks. Miquel's series [1] takes care of those (though I do not see any
> flashes using that feature yet).
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mtd/spi-nor/core.c#n1789
> [1] https://lore.kernel.org/linux-mtd/20230328154105.448540-1-miquel.raynal@bootlin.com/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
