Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBFCC04FF6
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 13:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SaJ5gplNHWvpO/NKjQb3k7kyFkDB1EuS30AeaB1KRXA=; b=r+3bopf1RuV8h0
	6RV69IhfKE0sr8k1mzqaFSx+bdQzJFtXul2wRhTSocaXWOqXudZvlao4ivs+I/czEnvtoJvwAqX7M
	xZKdgdyAlSPqcHQIzB7p5s9FTkjrcoq2AMcL4yaDquWmRuDqGum8Gp+WlbofR7PDHqkqlsJXeraBt
	MkVPrIZ73idkzb7fZOefCg3WWZ+VkbvDkCjuKLUitVPwAoPBf10JiDsYQ6oCUnCMg4KbKRLQzlXu3
	cCUuNKhMQ3yplQt11h3VzcgdeB15HzUZSjMx4s3GvC/ck9RmxM+PQRaZmlUtk5gr3GbX8btc1GIc6
	1UTBbQYSC2iC0lQ162lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxo57-00000005io7-0hnS;
	Fri, 19 Apr 2024 13:15:09 +0000
Received: from mail-sn1nam02on20717.outbound.protection.outlook.com ([2a01:111:f400:7ea9::717] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxo54-00000005inT-35Ee
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 13:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS8EjlJmoanepq9e1LruPTiN3cU1y98bAMo0TRUReIaQ/HR0yVs6lS2WsjKW2Sb0v4JP9byvglFNQQkV19R556L1/jF4iywZpsK6tU9ZqUmyHqLQHmf3jgZbrfvR05q7h7C0ecpnrdAhNSa13lEOzF08/R2hM3Sws5JN4mD+12fDhfXr8SrosjHUSCWmsN4GD53LHQAYeDv1+00nPaFgZqlCe4dVeEe3tlZE7pgmjCnCj4E0N7aBnsZ1efkC+Ypjw/1UBf05EQrwRbgf6CrAEBePMI8bKhqoozdHvd64C4YPLjHWrGbsxI26c7xxL6+Pl1CoBzXZsYxhO5MeIv6RZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4dOBnZ5K2IuEGHMfb7fquyUcN56ZloudlP4U3gvgBI=;
 b=RlrJr4C2HPkQ2yMs8N9BHNdJAVOZo5UsbgszkSU/AoB9ShKp2c5sJV4LH+wp3iRMATzbF9APDa77LpFVwbGiRfLjgc+/2A7PM+r48lA3uDdkcMgOQzYVUetYNGFhgnYL3fnIAafpc0zqOboaJE308KDALn15rWBm2DeQy0XS4qywop1yjC6px93xCl5wshTo1z43/qpHG65WAtdkWebgAQGIuBEnS1hGu6DMrMwUNcgBnmuiurRqoQaXpz8siNUWXUW3Ipjd7/OR+s7mWOU3IG4X2Xltysfpo8Oodj0ZkRqykrwC76S453dtmVpvS1nzLqYusI2+Y16wCUqDonc3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4dOBnZ5K2IuEGHMfb7fquyUcN56ZloudlP4U3gvgBI=;
 b=fXlnmX4Xs9Wkp1/5M9G503x7azw9+fab+Eq+E/bSHRqVwZZnY1MD3R8BmeFAEYn8CNPTBW0Y4qOUmNqGnftTS0uxqoC5QG6RUcHux9NCtFj5ddRQLjVhIl1JnfcxQt7BASO1KPIbH7GcgLR29e3dr3N4AivFJfacTdcp4899gC6H0hJYEv0QgHdH4xe7crIUFjp7EFZZUMEPIPHkRrfUXO/5CdeaKAccAx79tKK3V+/wfAn0LnvDTUL50gV6vZZL1Fgqsfxe0IRgNnVfIVmCrgk4Me8XyGGb066CICVMAOlQOObivVySquh6O/VmhAJDU4EmOiPF5Fgna2tstPEF3g==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH7PR10MB6483.namprd10.prod.outlook.com (2603:10b6:510:1ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Fri, 19 Apr
 2024 13:14:54 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::24d1:393a:f0ee:5c7f%7]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 13:14:54 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "pratyush@kernel.org" <pratyush@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: spi-nor: excessive locking in spi_nor_erase()
Thread-Topic: spi-nor: excessive locking in spi_nor_erase()
Thread-Index: AQHaj01L6sSQ/XG/4Eyuk2wXNC2LlbFrC2RBgAAm0QCAATi4jYAAA0SAgAMlrMGAAASoAA==
Date: Fri, 19 Apr 2024 13:14:54 +0000
Message-ID: <f7ec2deb3c16ddd7f49d28ddbadd0c7224176593.camel@infinera.com>
References: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
	 <mafs01q758g7z.fsf@kernel.org>
	 <8366e6def86b792f3e8b0077dd9aaa5cbecf27ff.camel@infinera.com>
	 <mafs0wmow6tyu.fsf@kernel.org>
	 <9bfdc3a36d4112dd6464f26ebe86e82e88cb6ccc.camel@infinera.com>
	 <mafs0y1995x2c.fsf@kernel.org>
In-Reply-To: <mafs0y1995x2c.fsf@kernel.org>
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
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH7PR10MB6483:EE_
x-ms-office365-filtering-correlation-id: f1b9c6c4-b590-4353-c5ad-08dc6072b402
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ED5sBDS2/FEljjVAfJLEhDDb+DyR0ogC9O48Dlu/Q9wZDuePLF04Mnw9Xn4K1pf0mAGOjCpGr3W8HYersV+z6Ql+VdIgSH2zHpp5j0GfiiMBbgo4sUYr3bea95zuUFyKMrdbNxf2MQuwHL7yPTt9sdXZkkKHVsqCHYMenUyhnqrbi+dUqcpJj5JRF9YyV4aEOWQVHZnnZoLcsqJkv4K7fY/sXtYYZMFcFj66AAHa3aEQ7syDHAZrpLH1ZQXjf44tGVNJaLfh3rlMT8nBsgatr6218XHCPrCfouidWbBtYtnO6J+EVoTPAc6/2XHAbRmgZwTlA44h+bn9fjQ006dAqHNRz6DLK9sFBvYA0wWM8XibgzA9GMuTjQtCTIoyDkyD7ldwX8V8kSVozfyY16/sYmXLFaEm2YAcdTAVZbTzXls3YiUvJfND7uB8Nsc5Z6hyLttJRopa1ukMtb5xgu9yr9z5vZvts6MVQl3lG/ZxWau9hpWR2+rkAACl2cqMyftnTC/VHmHZ60cvbCM/biGx/N1ZFgomkoNVsI5OGiKHHXcxrftC05I6FfqqywSE+eXcbVQpNyqtcVGwR//VV1uVkBIVqOTFZ6UQfLt2ExTVSMc8wysBdaYSOIe/7yGGtl7JNOA+bFST3rGviLuc/hxUanxOJ3Y57M0bHLlfsgMTd9JB38ykge0WkBScVkK36eb5BVQzOa/I+F1Zd8k8qJvtlHWz2awofteCmENS+UWFs+g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUhQcnFBZ3ZtLzU1emdMMVBidkpnZEVVQjVDZnRZTUFveHM0K0g5TEpsdHcy?=
 =?utf-8?B?eVcwZ25QSTVaMmJ0c3ViY2xmMUhvcU4wcUU5M1EzRnZia0tWMlByZm03UUN0?=
 =?utf-8?B?SFhYQ3pLUlVHNFJuT1hicXJiRHlYTVdwQ2RiQWNmUTV2aWdkekI3SDhLWmQ2?=
 =?utf-8?B?T2FWaVZ3SkNkeWFUaEpBTGRTbG5xY3NNdnYrQ2ZaY3dXTHhHeHk0dk5xdG41?=
 =?utf-8?B?ZmtDNEM2TkJGRFhRYzFQMVJFSE1mMTFTSWhycXlIMjA5QlJSWTc0R2R3aVlB?=
 =?utf-8?B?NzN2Y2o2OUpLczRrVWhIRDN4WGwyejA2MzlTVmhQRWdpc0lvM2QrQzZUV1BW?=
 =?utf-8?B?bG9TR3FDb3FFSXdOV1hmWTFJTXNUcHJOUmNWeWplMFRtNzN2ZTJ6Q1lnSmRP?=
 =?utf-8?B?WlZJa05aMGFNanVwNzEzNkhZK3Q0b282MUg2REg2d1Z6SFF6bXVzRXUwdzcv?=
 =?utf-8?B?aU1OL3pvMXhqendUN2Y0QVpNZytybE5lWUszNTh1dlJPQVdVS3IvSGRnVmp2?=
 =?utf-8?B?eUZadkVxNXJKVkNwUVNtY0I1UXZvTysxTzZOTHhadnZHQ2YrLzdrVzByOUlO?=
 =?utf-8?B?TkJqZFcyRFJNY0xSMHBVYnNGVEsrRGJsdzJtMC84WEJ2cUJDM3FXckNzTmlF?=
 =?utf-8?B?Q0d2MUNTQ2ZDV0Z2WE1XeGUyWU4yN2EwdXNnUjFublhQSDV5dDR0Nm5rMEc3?=
 =?utf-8?B?N2RhMUNIcndJRG56OTRyZ2o5dGsxRDN5d3dNV0IxdHcrVUYvSlBZbEdaTUsy?=
 =?utf-8?B?dCtCYk9WNVdtNTlGYSsxRHUybTNHcWdOMEplLzJZZk54am1hNGY4NmpsSS8y?=
 =?utf-8?B?aEoyZFNlYlVnS2tIYXVVQ0QrYkh2QS92cFJmVWt5eHduQjhGOUt4WmQ4Y2Z0?=
 =?utf-8?B?QlZmVmNXNkhocExBRXBkRjFKbW1BWTN0VndHMGtJRkpwYkRyQTJJUGg3cjdG?=
 =?utf-8?B?bmx1M0gwTzJHdkxaSWNBUmVKWitoVjAwQ21pNzVVTStQcTUwN3JiMVVvVU9E?=
 =?utf-8?B?RTY4cWdmYmtKRHN3ZmRIRGZjSGM1UFdjbDh0S2FEVEhQenFld3RaMTdZbnNX?=
 =?utf-8?B?bHFWdGhUTFY3ZmhnYnZ6cVJsV1lWUkJFcHJxcEpnQ1JhVXA3dURmN1ZNMElo?=
 =?utf-8?B?MGgvMm1pcHpYMXFpcjJhMEVDU1Zpek1VaTd0YkkzTkRaYmdMWEJUbm9vR3k2?=
 =?utf-8?B?Q1VKTnNQaEdlcDMrbWFIckhwRFR1M25KcFp0c3lxbDNkTGF0S0gwaXFCdnZY?=
 =?utf-8?B?cVRjMnBwSFFiRGMrUHBxYnNpaWNwc1V3OGpIb3l1bnNyR2N1SUpCaWZZU0xR?=
 =?utf-8?B?RUJXOHlEUUxmTVF3eFdtNDBnY1pDN2s4SHowa2Y0bFhobkRYWDFYc24zWVg3?=
 =?utf-8?B?bFpLdERCdm5IM21uNzB5eHRLYVdKY1lLVXh3RmkyQ1F5QThJeTJUUjJJQy9l?=
 =?utf-8?B?NE5scWhJcGdnZHUxY2drRXBLTVMwOFV5RzZzS2tSbnJEeTJVMUhxWHNNaW5L?=
 =?utf-8?B?UnNBNlBCWWJLbW05KzVFVnRkUDdjM1FvZWEySHY2a0R3M0M3K0pzL1l2d1Zx?=
 =?utf-8?B?MFM4Qms1QlArODF3dFU1YTFWOHJNKzU2aGdVWm83S3YySWkwQ2VwOVVmZ0tv?=
 =?utf-8?B?QkJGaEJaNG12WlZvYzZ1SUZUZ0QyWTliVStQQTRQbDBhYUpiNXRzdGtoY3do?=
 =?utf-8?B?RXE1M2UwbFMyTkFMQ2Rmd1A5RmtTektlNm1DVFZIcUlqN240ZHRuL21vTUls?=
 =?utf-8?B?V0VDWXJ1Y29pVUNlUEVHUmxFd1BHajBxNDBGQnV3TWFKanpxN3JkTFpaQkhB?=
 =?utf-8?B?eE5SMGJ2U3oyL0xsTDJBUko1b1BGYWkvQkEzYkhXaENwT1ltcXVTeHNEOGNP?=
 =?utf-8?B?d3c3dkZFOUxaU29tSU9qSUozMTBRaTlFbGFKNktldTA5TjQ2RGhLSFByZkxH?=
 =?utf-8?B?cVJMYjVGOVF6dk5sdkFBSTFEV1hOOHh6c1JSbFZwYndqME5IVkN3eFRvbnR2?=
 =?utf-8?B?WVVVN1hJcy9qTTc2UHRpTEJDbGpwS1VGeFU0VXJ0QW0vY2NXZ0ZCdWZmZUov?=
 =?utf-8?B?MEFQVlNmdlZWQ0VkNXU5a2JybXRLSjF5Sk1Pakw4YmdsZjN1TnpEK1huaFRL?=
 =?utf-8?Q?c//W3UFA+OKSFGpbuWvPGWpJj?=
Content-ID: <150E784F70825949841BAE904E924667@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b9c6c4-b590-4353-c5ad-08dc6072b402
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 13:14:54.2168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPUuPgrW7Hm2xr+6ZrLhTh8u5KhBx0Uixv+fe6aNkz+5VrAfdLuvQyVOMwvHdVlMVUSv/icHkADiPLKna0mwVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6483
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_061506_820918_B5955DFA 
X-CRM114-Status: GOOD (  31.58  )
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

On Fri, 2024-04-19 at 14:58 +0200, Pratyush Yadav wrote:
> On Wed, Apr 17 2024, Joakim Tjernlund wrote:
> 
> [...]
> > > (spanning multiple sectors) is running, other tasks do still get to run
> > > (since spi_nor_wait_till_ready() calls cond_resched()) but any task that
> > > tries to access the rootfs would have to freeze since the lock is held.
> > > 
> > > Dropping and re-acquiring the lock after erasing each sector or
> > > programming each page would let readers make progress in between. This
> > > shouldn't be too difficult to implement I reckon. You already mostly do
> > > it in your patch below.
> > 
> > Yes, that is simple.
> > 
> > > 
> > > Doing erase or program suspend would only make sense for flashes with
> > > larger sectors since even one sector erase would take a long time. For
> > > those, I suppose we could give reads priority over program or erase
> > > operations. When a read comes in, it suspends the erase, does the read,
> > > and then resumes it. This would be a little bit more complex to
> > > implement.
> > 
> > Right, a bit harder but I think it is needed like cfi_cmdset_0001 do: suspend erase to do read/write
> > Don't think cfi_cmdset suspends writes, that seems overkill.
> > > 
> > > I would suggest you try the former first and see if it already gives you
> > > the results you need. From your patch below, it seems it does. So
> > > perhaps just cleaning it up and turning it onto a proper patch would do
> > > the job for you.
> > 
> > Tests with my patch shows vastly improved responsivity but there is still some
> > way to go. Consider that an erase takes some 0.20-0.25 secs for us in best case in
> > which apps are blocked. We do get some complaints from the app taking too long to complete
> > some tasks during erase. 
> 
> Send some patches to fix this then :-)
> 

Could send these for 5.15.x/6.1.x but current release is different, still want those ?
I am heading out for the weekend so next week in that case.

    Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
