Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1216BCDB47E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2oYIxI2ZnT+AMXz3QnulicIqB9NPCGyvd0LY411hoLI=; b=xA9A9cfh68Kj4p
	BmkVTlzG3YPbsmJzLBDOnFMAPS+Qow9gQUKf16gBskldVpApXSkTIRZLC71AyLVWyew9+vVfVFvOS
	bN8togZnl+pevuQghp6aPGJV773cvnyEwJfmrAMk1GyhWJt5/t5xmWCw0uM1BNnOyoHVL8maYHj3j
	kbeYra/sUEcqxClFTxpJfWFGQOJjiDVwe4oIZNVl6Dy9kiEKGFT9BPS30QviNS63Ga2NvF9tDS5N4
	Q3yjZWJI6hgzaB26Fvu0oF3Nvmljq7VKEax8hzVPE05kZ16w185WM2xYZHNNmsH7NkxMLLJNoWDMB
	BR2O7tDWZHzqDkzeY5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrFz-000DHU-0R;
	Thu, 12 Oct 2023 08:41:23 +0000
Received: from mail-sy4aus01acsn2080b.outbound.protection.outlook.com ([2a01:111:f403:7005::80b] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqrFv-000DBd-1Y
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 08:41:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deidcrqxypQdy+yFK3tHUtKKyNXNRsnr+LRmBMDfmST4WvJRhFueOTvwO1HqXlb1VQj18Q5wGE57q9YfndTMtPX4iwZPbxweacLMIatBFSms1VvMwgWCY0PcGGjozaTtr1vie3H+nMyrIgwYgqlNeZDcTvKnzZW74k1NJwWG0nQJy7rXhBeRGb5xYaW2UWCXP7CA9QBIgPxWUTk3F4kqpNIcuZbcaKUd62yk1h7kDm59fM4Ql8MNT3uosoh18q+a7O8wbHlny0Y9yrcHzTznQ3l/L1msg1FzMvOSCSMaUYAVXNr0O9bZVkoTxjladwGt90j5ypH2dka2BreCddgszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thUJW3OEno0Q4wW6cMW1DgsYT31uh13J0vUTBxX0d7I=;
 b=I2ee5bxBEotXQ9ygCJhlDPYXZrHduomMbCmv80inpVUWd7Nq2wObqUJSUs+QSwTJA//FkmAmgiCiGr9W+bu3EALSkqbOauk8tRVcH3php3sZ7AUpM0RttIm4d4UrCR4AzvGigkPF/8bMsLDgjtYPXxzsaOKAXZ9IzCFr5ZVPLu3F7lDhgnP2tzoIJZfHWX3NsOEEXAqYKL6sd6ytPENxa5laJLAeFP4/gmzORjtHPV1wCG93wybr5E4f+3LJjnVTPwtV7N6KfXiDL8tgD7swyNKq8KmZeJy+3x6lrsjt3rhT/GFTNJt38tUACOh08HzKB+GK11eG6y0RuvHrWalesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thUJW3OEno0Q4wW6cMW1DgsYT31uh13J0vUTBxX0d7I=;
 b=YTMksxYNthuFtOZTaS4kmL3k5qF2qorM3pz85snpWUuXjQ5mbCMetGxVNO+2g/61heA0P9WSivRIitgt7+1IwhIyT31h8wlS24eEfPCICsGcRLCqyrzCxtnX20Y766MBuzeJcrkrNN6XDFIGwWPwjrMUqfWj5z9uvqUzvNVgl5QYfNiLhHDDQMZGOd3saBVxgG5/BM6NRDJXCBSaE2GwQhSbO/Su362yDD//xBt+WDvF44tL1/81jF9j+2jtHaWoFnT9UFPZAfdzOZCG6husnVCrfPq+G8vTdyU/RtZbLt9sPkS1X01B6Cuq4wZBhTtsM2W2fVntbg9DbNHFhrbyQw==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SY7P282MB4738.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:276::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 08:41:09 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f57c:b29f:dc13:f936]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f57c:b29f:dc13:f936%2]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 08:41:09 +0000
From: Wang Ryder <rydercoding@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: nandsim: to support bigger oob size than 128
Thread-Topic: nandsim: to support bigger oob size than 128
Thread-Index: AQHZ/OYujrnnDRvWvECTMUcJjarWaw==
Date: Thu, 12 Oct 2023 08:41:09 +0000
Message-ID: <MEYP282MB3164228AA0FC01BA425F0F54BFD3A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [K1+S73fzQNvSuIEJSaGi43PFj4aYkL/n]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SY7P282MB4738:EE_
x-ms-office365-filtering-correlation-id: 6bf791f3-c7a6-4a7c-f4bb-08dbcafefba3
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dBm6CAHvwngV3mTw69BjnQJggDd6j/+eVfQFPgdO1NZbl0OD+cBbvab+UsySpIpWKxiZJdcu1rJriY8WHjSLH+EOkA/v2JYTLE2i4lwuQYfuJ54GGzIPdwVRFefDjjCFGn1kBGmMsQd678hTdWewnTUJIUV7c6eBUTzcaRFDWdT8YAdVcpmmSABtfgOHFaKTlkb6Ng65HaaN3JxeN6uLab5nMbUCtrz7uiM36NzR0pGqqMCgINAYxNUQOnp3zpKdwibjO3v9yaAQs7d0P/7/j9MtGC23U+847V1WiU7T2Rn15VbeP/FJJV8rdZEvOAw0EbSx7wU/K29wD9FqtUH/6jeZv11bD9OUaov4JM3GyYXZaZb4RfgpXzBAdXhVDIRCqEQjXevgTI21Bf5UAKAYqRwFwf+HesqgFi/0OX/UMZDJFkfvrnp5fA4gBb+kcZPq2xwVfbOwHIhMTNY4u00bGMs3S7WW53/NdA7kVE+NUI2wVYbOeHkUgNoT6OOtYxCBgFfo7mHw0HKMmOP5Hmuu5G0KelV4yjd2iZrZwzXVir8vLNEaxLJhngc7W8i+czFi
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?WGdGZ3lENm5qc09OMmZhYzN0WEprUENlQ3VwbXpXdW1ydGpKMGJoZmxackhz?=
 =?gb2312?B?ZG55ejBWT3IxdUhORXF5WHhaSnFTQkZ1UFRQektUay85YjJFaFVCRzRVV3Zx?=
 =?gb2312?B?K1NrSXFqZ2tXSy9wNHZZMW9HbnhFaGlmaThERDBJNG1zVitKRVZPVk5OTEVQ?=
 =?gb2312?B?K3RIMmYwVWRZamdwb2Fnb1U3ZnpwanE2dHJnbksrVy9Gb05XeUdoMmNpN0hB?=
 =?gb2312?B?cG9CWDJLTTZkKytONElpTW14TWJ5bk5zRlVyZlhkWXlMdUtyMUw0SGkzZnJD?=
 =?gb2312?B?aEd5b1RiaEJ2dkpWY1dzQzFvdnh0Y3lWOUwrM1F2RnhvV2hDTHFxT284M29s?=
 =?gb2312?B?WFVGc3I2TS9LR0RLNVFmdzM1VU5pZkdnWG4wZWtQVlFLc05MMWJxOVNvYVYr?=
 =?gb2312?B?a1lvTVhLTlJ3d0dsZy9PeGR2dmdNclNBUEtFSzc3eUpHWXNaWW9SalI3NWxD?=
 =?gb2312?B?SXl0ZWFRNUM2dVc4MXprT1Jtd1JyUDNYaWRpLzloS28yNmx0VHpBR0RSQStT?=
 =?gb2312?B?Vm5DU0RNcysyeHF0VDlHRTIxcW9pN3BqUXRhajdRdi9NT0crV2dZUkdVeVcw?=
 =?gb2312?B?em1zUHZsVm5JenFkaE9YTmcwMHd2eXQrWE1ETlh4RUM4M0dRcmF6MUhWckl5?=
 =?gb2312?B?NlpKWmllKzlqOVpSUkZFL1dGQmQ4S1NsSkNqWG1lNFNTVjB3NytSUk9TYnla?=
 =?gb2312?B?WHNKRXZJb2N6Q0pMYjdQMVFIWmorLzhMdUt5VnNibTdEOUdnSGo2SFNWdUp5?=
 =?gb2312?B?MTRpV084eGRLSHhVRnhsS0hMM1VnYnZ5R3p5ZVpFUUpmRjFKQkszc3QxSkVV?=
 =?gb2312?B?OHkvMnJMbEh1YklYNXBFSkhEN2FmdGlKRC9HMjZLbVZqdFYxUXl2SWljcVBp?=
 =?gb2312?B?SFQ2aXB3eVN2ZG1MUmRWSzI0bk5Eby9ITC9JUEZHdDlvUStKa3RBdUdxV3h1?=
 =?gb2312?B?amZZZlprdFUzN2x6ZEhaTEQxZTNVWkJ5bEcwbG9wTldleitGYnhPT2lTYjJv?=
 =?gb2312?B?MVFZdWxPek9qWTFDWW9OMHlDQXdUdmkwZ29NQlNmUWVKSTAyNzExelB5a041?=
 =?gb2312?B?R2dmY1VjNFVxVGRYRkpyalIzNDAxdWY4QW9xUHJPSSs2MFQ3b2g5SGVIWldQ?=
 =?gb2312?B?eXRFK2RVTEVnTTV5WUFlV3hXSHE4ek43ZUxhSnZDQjIyNG56bk9OY08xSzJB?=
 =?gb2312?B?bkpUOWExV2JENFR5QndmMFpEZkh1T21EUDZYbmRnSktVeXpCeTBwM1RVNTF5?=
 =?gb2312?B?bkUxRG4rZU9TZFAwUktBWjA5UzNUbHhqb1JxODdHRlNUQktvTVc4bUNLRUl4?=
 =?gb2312?B?WllGdUI1djI0d0IyVnNqQW85UFVDVlM3dnN5T1hBb09PdzJEVmRtWHhubmdB?=
 =?gb2312?B?dkp0U005cVVBS052ZHlLaEJBM1Y0aDc3YWMvKzROV0lZV0lXNDhweGVubHp3?=
 =?gb2312?B?SWJhNzdQR2lSd2h0VmhhbHVUd3ZUcXhpanpDRWNqVmNOa0syd3pVT0tYUyth?=
 =?gb2312?B?a1ZMZWF0U3ZtMEpHSCtMNUM0ZGpablBBUGdsKzIxU0NVOUc3VU5RbjJEVmU4?=
 =?gb2312?B?elViNTMyZEhUazBUOVpzU2hJdlhuQ2ordzZxVk9ibTdGbnM4Sk5sQlBkVm50?=
 =?gb2312?B?OWxIYWprYnoyQTdBZlFIWWxQVmhHL2c9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf791f3-c7a6-4a7c-f4bb-08dbcafefba3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 08:41:09.5317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB4738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_014119_545484_9E3644E1 
X-CRM114-Status: UNSURE (   5.08  )
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

It looks nandsim can only support max 128 bytes of oob size. By my testing, kernel error log will be printed as "No oob scheme defined for oobsize 256", if oob size is just 256.

Since more and more recent NAND chips have 256 or more oob size, will there be any dev plan to support bigger oob size for nandsim?

Thanks,
Ryder
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
