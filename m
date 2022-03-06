Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE65C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Mar 2022 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rn2m2l52aewLy1CDxLLU/37VOVYuerKowLKf2ia1Of4=; b=CXBtZMGVrRQlhW
	Gk6pzdet61gqXbnnVPLxWZ8Grgc6N+mpv3MFWJEaQxTEKVapeHJUZJFpzrCNMUe8vCRj2ETrL7rIO
	6Q+qynhruhysousLa29JMTjGYoXVacW28Pc/M3OmSnVoOqvrvKetoSvbpyOW9rx4SsQfhaKj4ELi6
	aXkaI16K9we/x62adntA0B/yEDenN69wnugaX1QNaJxlKhyPwTR0/kjIlClYmGgNN+8K3uJTbrmwj
	WzFL4Y+j0OkHY+Adb4YTenwAIkcVNlrp5AwBrf33YnyQiyndCJ8+/Df3rs8CyUTGRlSJbRLhg+Zdu
	hoUtVtOwgqOSdWBuBi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQsL7-00ErYB-V2; Sun, 06 Mar 2022 14:58:30 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQsL4-00ErWU-2X
 for linux-mtd@lists.infradead.org; Sun, 06 Mar 2022 14:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1646578706; x=1647183506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nYA0e7+5crfZfpz5H9oYS7EPe3d5OC4V0CrRZUS1VW0=;
 b=t1A1AGM8/D57YM3Mm9u4VrNjr6JGGBhoGxDmap1tuzDtRqgj95Sylpwm
 cs4I3Az57MnJfWBnEA3N7Hj0R8NhvRDP91o4cTpY64sxtIGJsqo/rIZcZ
 ZoOXr6WPLilD4HnYDqOBChKPajnjG6JTEMX8I8pOQoGEYlBYpP1XsqvFd k=;
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 14:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qv3Aq33WL/a7Q9OfLo/Wz0ACjNDNHF9Ehu95zepumXYGOUMDxz/mBH5dVdNa220WqNTa349chCCtVc1dnXvJPL2dh9iwHoA8VgDqLt5kdG4mGPyeaoffSMrbVkgz32JIF+BVHe7CjOuK8wbAtQB0L3Lcg80l1+kVCwNy72KWRAf62T91Z531y7/2Qzr8Y7ThNcu+AWsJ4VuLXzd/vRo7T8k1xWA7beirUrgN0yL+bTgyKsV+kfo/KmGazOCX0kHwTrGriZT7TAcEslLhZfqjyZbzFutzcyl+/9qNdnsv/+XXtlQ5gWfwt/s6YO/nS6PW4aIGdNZkTim8DGMV3eP38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYA0e7+5crfZfpz5H9oYS7EPe3d5OC4V0CrRZUS1VW0=;
 b=I8174/0HGbQnU8D7lszyH+ZC3ICPG+Rk1DNlvsPyaUU7sVclKitN//oVeUaLgii4B7L1XM4OKYEWQDilRu1nDueeKbtG15f0dtn4i31AXBtpvDJbW8OtmWu9RhWwhdmQMYtOKDdywTleYhgYrgnoMcDytiuEWyvqrwWitOQOqOlFoLPBdf3Vg/L2cc7Etnxqyraz4F3i2gXJajvUPqyJ7tsrt9i0VTUrNJlg1hTJuZPcJmmbVvJPHsk23OVWaLCIrmyEL3y54zeQShzCso97Yrgmo0ms8K8C8ELAD9Jxrvu+7i2kCqkXAaF8RKJNGUMH4j7+0izZFYmbOkdohgBFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com (2603:10b6:a03:3f5::8)
 by CH2PR02MB6646.namprd02.prod.outlook.com (2603:10b6:610:a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Sun, 6 Mar
 2022 14:58:12 +0000
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7]) by SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7%6]) with mapi id 15.20.5038.026; Sun, 6 Mar 2022
 14:58:12 +0000
From: "Sajida Bhanu (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "Sajida Bhanu
 (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>, "dianders@chromium.org"
 <dianders@chromium.org>, "michael@walle.cc" <michael@walle.cc>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "Sahitya Tummala (QUIC)" <quic_stummala@quicinc.com>, "Veerabhadrarao
 Badiganti (QUIC)" <quic_vbadigan@quicinc.com>, "Ram Prakash Gupta (QUIC)"
 <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, "Sarthak Garg (QUIC)"
 <quic_sartgarg@quicinc.com>
Subject: RE: [PATCH V7] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Thread-Topic: [PATCH V7] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Thread-Index: AQHYHzn9nkd9BTnp2kCou5Nqcg+4i6ykmSWAgA39lhA=
Date: Sun, 6 Mar 2022 14:58:11 +0000
Message-ID: <SJ0PR02MB84490E47E47519D89DF83395CD079@SJ0PR02MB8449.namprd02.prod.outlook.com>
References: <1644578661-21821-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <63301527-46ff-b7ee-93dd-12ce9d79008b@microchip.com>
In-Reply-To: <63301527-46ff-b7ee-93dd-12ce9d79008b@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 845a1698-8cad-43ca-7d1d-08d9ff81bc12
x-ms-traffictypediagnostic: CH2PR02MB6646:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CH2PR02MB6646B088D8FF2AF2DF7AAC74B1079@CH2PR02MB6646.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bKJeg4X++CINmGaA0/5EhuNsaalhUOz9jm7h8P6RtVhcfgmhTMo5pHJ8HM+uS/BHzZNCBkqUO3/E93PNoUgbvb4T3taFQLu/BDwHJ/vWkUcpQ07oc6pfd6WxIk1KfhYxf4fCCmIRpxT/za507eIvWcABnbDUnZV6+2EOjl5j64Epld2PuRiEMO6QkX7u/sf0bIiIl6I3J9GKSLRx4weqgs/ckf1JyCydEFGjSLwsTO//nvWplXJL383cYTD8JUoqrFfJNfmbEU/N3TL2Fuz5+j1m46WNsdGDk+UQp28coVLhf6dz/vKzpan5dU11MEvpnTc7RtrKcohpAGbFBgdFeC2ox5s6Sj5DnsYKqFGzOe6TzLMJRVcHdxQTyHyhp8158Pe03DrpX55tV2wcI2Mk2uu1cVRMp04/Gdede7GEj5sl7T+OxL+CvF6hxn3e+HS5xDGwiuhVKbQ76n9+SCVQBkaxa00P7GTAvEPDIk4ZY8tRHmmsQ+EJmHlNa5vfxVBaYJZngucF2MG9KFTJ6NJ97uSlRWcVhxQY0qle6KqmXlL6dL2bHeCz8+rMJQr24xF1GKPU4x1pty5JOKoi4i7Pi0tYercna//EeV3aQ2Hlp5vRMwmp+JHH1U4kfYaxZYW5aK9KT0tRS7YlIIBomaUk1xIh7GuDoIH2BTuEjLF0FQjCI3ZGAFL1f8dUplFZ26vPMaOuJEB9owk1IYutpIp4WVMZW5GNQsUwcwG5KVpN7a4uFgYL+n1d/mduZFpbeQ2saaDwByARhKM8ka2N5sABOJpzyM3N4LkuDhyS8UUVjPDGt+HZH5C3NdGK93bagI9Q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8449.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(53546011)(107886003)(66946007)(33656002)(83380400001)(316002)(38100700002)(54906003)(186003)(26005)(52536014)(110136005)(921005)(122000001)(38070700005)(71200400001)(86362001)(55016003)(2906002)(5660300002)(4326008)(8936002)(966005)(6506007)(7696005)(508600001)(8676002)(76116006)(64756008)(66476007)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU1RRVZ4TzIzWG05bTlpRkY4K1hUMVowQTRPY09wSEgzZVFyZHRRWU9Zb1BE?=
 =?utf-8?B?ZmMvVFJxVGtvUjh3eE1yVTEybkFMd3F0U3U2THA2aWVuY2FPVHl4cUhYcllh?=
 =?utf-8?B?QzN5TDAyQ1NqS0VXbGlSbTJNQkJBa3NvbDN0WjdYckpoTi9RVlNXMFE0K2NG?=
 =?utf-8?B?S2F3dnk5MEhBaUpIdTlCeUJtNVluTkF4TjJmTTdTRXNzcktOejlPdXRlckh1?=
 =?utf-8?B?R1dndlFSaGpiWFJTSFdRUkYxS0d1alhHOFYrK0VMeTllekg5K082cndvL09V?=
 =?utf-8?B?c3NtZnVEYWwxaGNSeHZhWFlCYVI3RnJzZFNOaGZFYVlRdkFHUkV6amtGZTdo?=
 =?utf-8?B?YjNxQzBjUXZpdEZQMEZid01DQkx6TUl2N0tPTzE0ZGQ4bFplRUQrVko4Y0Nr?=
 =?utf-8?B?UC90a0o4ZGd3RW9mcFpWOW1nb1JlalpWZUo0WXVVRFM2N3VKS2M2OW16WURK?=
 =?utf-8?B?SGZOcFhITG43NVJ1SFVZZ3U3dDJxRjNZZVpzK3NYVytlSTU0ZUxBWVExS1h2?=
 =?utf-8?B?RmIxdGpYQ0p6ZmkrK21yY0pjU0dHWXpHdFZ5NElUcGZoVTVodUp0Q2dEMFF5?=
 =?utf-8?B?Yng0U3FuNStGUWFpNE5lNDVkVWFJWEZObVFBOXluN2ZaUmdQd2w1RE91Nllv?=
 =?utf-8?B?cW5aNGMyNlVOWHcvZGtxVmI1YVI4UGkzN250NkxGcjEzRmdjeTNUcVpsSVNo?=
 =?utf-8?B?V0xOS2lxRERJcmFleE52UUhMdWZXcDcwaG1KWjBOaDJ4eXJSeVp4QnRjN0lp?=
 =?utf-8?B?MUoxMW1ENG9pY1BGWmJIVEZSbCtPTEdhMjllUGNLMCtlVXRld3h4aEt6N3ZY?=
 =?utf-8?B?cnZldXJaTGdUaGM1QXhwZG9ick8ycjh6MFY0Rjl2cWN6eE1YNzJEU29IcnpV?=
 =?utf-8?B?VEZXSmVCblVxa2ZqVzY2MmxXakdiL1RYRlV3Qjk5aXdHYlNCbnc1ajFYNlN2?=
 =?utf-8?B?aWs3VWY0QVJ5bUlWNGxBSmliUExHNUU1K281bkYwZGE3MTA3aGhnSmVFZGxI?=
 =?utf-8?B?VEtzYnNBN3NCNmR0YkpScUVXTjIrU3B0L3c3UER0TDdWNlRrSEd6dHZ4UlpU?=
 =?utf-8?B?cTlJL2dzdXJTU0oxTUhPclNKbGRFN1ZNRG16eEFzcmNjcFBYaGtna0xNQ0JT?=
 =?utf-8?B?U3laNHB4aSsyUXdNYVljdlNTWE00WnQzYXVWN1JSTVVISUt5TFlMa1BPcVZn?=
 =?utf-8?B?VTNiZGl5eHNYWWtxZ2FDQ1MzemZZYnNwUnJldUU2MVpkWkJjNjFhUkxuY1hZ?=
 =?utf-8?B?QTdzM3lJOC9zZDIyVkVXRWJJVVJ5eUoxcDdKWk44ZkJJWVJOaHdWQ2ltTzUw?=
 =?utf-8?B?bDJyaENzM3k3M1BYd1dsTVhrQk41Tk9pQzJkNk41bDJnNitXZjMxTTBwTGRm?=
 =?utf-8?B?cDlEcjUwaVVQOGlONDNzeGFOeGcvWUJjSEVPMjluUEcxU1FFTmt5MjQ4MEp2?=
 =?utf-8?B?YmdTdUNqMXRWVS9QUm1hZDlQby94TXhmaGRwR3pHM1ZSeVUzZEZUdGI4dU9J?=
 =?utf-8?B?UVEzZzlndHgxZzVVYmhuWjZUTGoyVXJWcVVFMGVIckExY29zTkF1ZXp4cEZu?=
 =?utf-8?B?blIxTmg5ZGp1ZjFqUjNQVHFnWXZqcjBGWlRDV0NkRHFMQ3F2WG83WTRaMWtS?=
 =?utf-8?B?allRbUMySUFicnVzU0U4cUFYOXpQS2dWeGtpVm9WLytFcEQ1VG9OalJYTnEw?=
 =?utf-8?B?VWJSYzBVTStneUxteW9OQmxJb0xzRW85VVJ6ZVFlVjVBYnBXYUpxcTI1NXZm?=
 =?utf-8?B?ZkNLWGo1cEV4bzByNjdHWEhJV211dFYycWdNNkJTTndxOHNiQzJHWEhkWmd6?=
 =?utf-8?B?enIxQ3BFUFZnQ2xBd0lNY0pXZFk0SlpueWdiSm1lbmg5Q2xad01IcWRIZHh6?=
 =?utf-8?B?bllPMGRiQW5zQlVGODNNT0RISE52NlBzYTg1WHgrdVBWVGxuQVhjS3dhMm9D?=
 =?utf-8?B?ampIOE9EQ0lHZnU4RGFSRnJtNmN2WVN4Uk9heCtSc1BBY1B0eEhEUXlGamVB?=
 =?utf-8?B?WHd5N05wOXZDWEUvWm5hTjU0ZlFocXhTTVg3SFBwdU5TTkpOMDhXOG90QVY3?=
 =?utf-8?B?VDg3VmFtWGp0WU84Y0VnaGhBekh1NWNXVHhzQjBpYkNUaTNNcWhIR3JlTDlC?=
 =?utf-8?B?dE1rem94U3BuM0pqV1dEVnRJR0NSMW5EbThiUjRvTUZsTmVxVUY3WHNhbUdO?=
 =?utf-8?B?Qk56dlRGV0U1NWxkMmtXOGpGV29lanZDQWtnbzdraFZCODhGdlB1d1V0dmo2?=
 =?utf-8?B?bWM2YlYzZnZobDJqNVl5Ti9UODNRPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8449.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845a1698-8cad-43ca-7d1d-08d9ff81bc12
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2022 14:58:11.8627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6UnG86FsTgVvJa4Uk1zqf5DZzFpXrcujxnJc30+2PPwOm/qCXqv8MOuLrPY/wxt9iJGi90E2rFT/JjqCZN4sUMS/u4Qa+QyJraZEmKoUd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_065826_259746_05FC9DD9 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Tudor,

Thanks for the review.

Please find the inline comments.

Thanks,
Sajida
-----Original Message-----
From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com> 
Sent: Friday, February 25, 2022 10:49 PM
To: Sajida Bhanu (Temp) (QUIC) <quic_c_sbhanu@quicinc.com>; dianders@chromium.org; michael@walle.cc; p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
Cc: Sahitya Tummala (QUIC) <quic_stummala@quicinc.com>; Veerabhadrarao Badiganti (QUIC) <quic_vbadigan@quicinc.com>; Ram Prakash Gupta (QUIC) <quic_rampraka@quicinc.com>; Pradeep Pragallapati (QUIC) <quic_pragalla@quicinc.com>; Sarthak Garg (QUIC) <quic_sartgarg@quicinc.com>
Subject: Re: [PATCH V7] mtd: spi-nor: winbond: add support for W25Q512NW-IM

Hi,

On 2/11/22 13:24, Shaik Sajida Bhanu wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
> the content is safe
> 
> Add support for winbond W25Q512NW-IM chip.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> ---
> localhost / # cat 
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/jedec_id
> ef8020
> 
> localhost / # cat 
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/manufacturer
> winbond
> 
> localhost / # cat 
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
> spi16.0/spi-nor/partname
> w25q512nwm
> 
> localhost / # hexdump 
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/sp
> i16/spi16.0/spi-nor/sfdp
> 0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
> 0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
> 0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
> 0000030 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
> 0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
> 00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
> 00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
> 00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
> 00000d0 0aff fff0 ff21 ffdc
> 00000d8
> 
> localhost / # md5sum 
> /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi
> 16/spi16.0/spi-nor/sfdp
> 106d89d6c049110bc94c01517cb4ce24 
> /sys/bus/platform/devices/soc@0/88dc000.spi/
> spi_master/spi16/spi16.0/spi-nor/sfdp
> 
> Changes since V1:
>         - Added space before name of the flash part as suggested by Doug.
> 
> Changes since V2:
>         - Updated chip name as w25q512nwm as suggested by Doug.
> 
> Changes since V3:
>         - Updated flash_info flags passing according to below patch.
> 
> Changes since V4:
>         - Added OTP support for SPI card as suggested by Michael Walle.
>         - Updated SFDP flags passing as suggested by Pratyush Yadav.
> 
> Changes since V5:
>         - Reordered flags passing info for spi nor as suggested by
>           Michael Walle.
>         - Added SFDP dump info in commit as suggested by Michael Walle.
> 
> Changes since V6:
>         - Updated commit subject and added md5sum in commit as suggested
>           by Michael Walle.
>         - Reordered flags passing info for spi nor which has missed in
>           V5 patch as suggested by Michael Walle.
> ---
>  drivers/mtd/spi-nor/winbond.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c index 675f32c..6fde2ac 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -124,6 +124,10 @@ static const struct flash_info winbond_parts[] = {
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>                               SPI_NOR_DUAL_READ) },
> +       { "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
> +               PARSE_SFDP
> +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)

This flash has 3BP support, was locking tested? I would like you to describe in the commit message how the flash was tested, and add in the comment sections proofs on how it was tested.

https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf

Cheers,
Ta

> I have tried to validate lock/unlock feature on w25q512nwm card. But looks like the lock is not working as expected, so when we do lock the whole card and tried to write, write was successful without any errors.
   Similarly I also tried to erase lock protected area, it was successful without any issues.
   Below are the experiments I tried.

  localhost ~ # flash_lock -i /dev/mtd0
  Device: /dev/mtd0
  Start: 0
  Len: 0x4000000
  Lock status: locked
  Return code: 1
  localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
  Erased 4096 bytes from address 0x00400000 in flash
  localhost ~ # mtd_debug read /dev/mtd0 0x400000 4096 temp
  Copied 4096 bytes from address 0x00400000 in flash to temp
  localhost ~ # mtd_debug write /dev/mtd0 0x400000 4096 temp
  Copied 4096 bytes from temp to address 0x00400000 in flash
  localhost ~ # flash_lock -u /dev/mtd0
  localhost ~ # flash_lock -i /dev/mtd0
  Device: /dev/mtd0
  Start: 0
  Len: 0x4000000
  Lock status: unlocked
  Return code: 0
  localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
  Erased 4096 bytes from address 0x00400000 in flash
  localhost ~ # mtd_debug read /dev/mtd0 0x400000 4096 temp
  Copied 4096 bytes from address 0x00400000 in flash to temp
  localhost ~ # mtd_debug write /dev/mtd0 0x400000 4096 temp
  Copied 4096 bytes from temp to address 0x00400000 in flash
  localhost ~ #

  Could you please let me know is this expected behavior in this specific card.

  Thanks,
  Sajida

> +               OTP_INFO(256, 3, 0x1000, 0x1000) },
>         { "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>                               SPI_NOR_QUAD_READ) },
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
> member of Code Aurora Forum, hosted by The Linux Foundation
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
