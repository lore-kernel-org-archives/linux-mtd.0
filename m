Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E66C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 05:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ISnMNGCg01iHpiRBFx4L/O26LBmJSvE9gubZ5GaZUs=; b=hmlJr7EcyPlwtP
	z8HxRdvYfUJWG3RvduSGCLYJvK0JRuW7k9N5aK4TaUkR+vltA84CzvzkErUEr+rqS7jDtgMZWSQkP
	jUZsIkjXJ79zZAs2UyfLdjURenSWJPEsPl0ksJAjLGd3Aahc0zKTE3AbFm/4olCM3k+/J+9y/7oHl
	zicciKlSIY1q94rhzkdLvC0zIb4XKhu/RaQuGBfWHdZER2sW+jzOiPay0Wu9g9KSOKS+kr6bpzmQZ
	wLfLcB+F+GXq3RV0SLJ0IzXDUOeYVxAGnKMZhAEcv74/SniM606ORqVtxWU8Ld+XK5c9iA3EteD6V
	SVCxYxEHRj5axAJ6C4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCDrP-004SlX-Cc; Fri, 15 Jul 2022 05:27:31 +0000
Received: from eu-smtp-delivery-197.mimecast.com ([185.58.86.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCDrM-004Sjv-5Z
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 05:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=camlingroup.com;
	s=mimecast20210310; t=1657862827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=109QY6VOR+mVOSJ2L322nVjAcaPG8/fpi7E6rdDEmtE=;
	b=MriIDDuqkvCMyqXCBWg9Fq4vDqdWrpBxR5XnUFYNXGQ3YadYzldqgE1yErMVtUgwtoCkK6
	jHKeWBBJraGY/cUDNyjTYX1+58kKhHRUl+iQ00VrHJyq2bSiGTyL2If2PKBa89tzAPj8DU
	8ccXPCqztiRUehoUI0Dagt1gUwlssp8=
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (mail-lo2gbr01lp2051.outbound.protection.outlook.com [104.47.21.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 uk-mta-309-RzTTU3zgOv6upNlXtulcIQ-2; Fri, 15 Jul 2022 06:27:06 +0100
X-MC-Unique: RzTTU3zgOv6upNlXtulcIQ-2
Received: from CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1ba::12)
 by CWXP123MB6143.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Fri, 15 Jul
 2022 05:27:04 +0000
Received: from CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f56f:d3d:9a1a:5e4]) by CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f56f:d3d:9a1a:5e4%9]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 05:27:04 +0000
Message-ID: <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
From: Tomasz =?UTF-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha
 Levin <sashal@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
CC: Han Xu <han.xu@nxp.com>, kernel@pengutronix.de, stable@vger.kernel.org, 
	k.drobinski@camlintechnologies.com
Date: Fri, 15 Jul 2022 07:27:02 +0200
In-Reply-To: <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
	 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
User-Agent: Evolution 3.36.5-0ubuntu1
X-ClientProxiedBy: LO4P123CA0544.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::9) To CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1ba::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2a74952-8730-4c10-97e0-08da6622a71f
X-MS-TrafficTypeDiagnostic: CWXP123MB6143:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: TgjaF0BKUAbiclCM0YbubHIRSUw0E9CLeWnUsrnXPZ5VnlaMgp83y45SZWCiXoZ8VbNQTmb26p+iVZ/8SMnwUc+3/7pM+0KmKSCdvGclHjVtveVzf1lYuAxpgxTRRWYESRAE6H1ky8UvOEqBry87bD/cuFxM+7pgu5d2W5cc1lNj13zM8l7x1nf55ynwfVNK7PfXa/J2HvWXa+u2/5znWcRW4sMu56eZtCKEP2U4UnZqfztPinvv/msNXCZU+IHrsGibVQ4ZV8BG/CMk3xLaCAIB9R63RJ5YmhLPXV3MIvifGgA6xe2BTyaZgZDDpJ8ZMkN4TRUGPbujoYFz+1Y/v9zG3VCPFfx850Xo0sRHta/qITlDUBAKMub680eAvO0Ix7gQFstSGEWt7hFwGPGktcKfE0gdxj3t6QQz0lV5fVpTJsseBHrrIxaiirps+GM41okQNvcpxJqN1vcpV1FECXTsHo+Luwl6AvLPXl7c6VSTOEbiFvuIq3QX5/5JhzjU14GDdAoLvC7RmY5muvBnLiWC9hy6i9uZi5pUSaEpYmi5jrSGX06z9eJNZCLpLxRaXRub2C0mJwG9xaOhiLH83AQi3G5O0J3wqlw9LZEEEzjSwxLW2xMOt6HQ+xmNVYK+OOD6msw+HOiaL2cWh59Jc6vn3W8E8yTgGamjekot9BiJJVKxQB1srxhvT0hO3iLFAoondiAo+oAprlRpuRnbydDzbr006uG8alJ/r7SphmYPfHufg8038CYr/ajmPkizBSEKCRiNwLS6WTqqUxH9QWH6mJFcN3DHn35s/qp9m6Qafn4ppqiwosy6ELIHW8FVmXILZi1ZzoMbCWrjGcYVEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(396003)(366004)(39850400004)(41300700001)(66556008)(2906002)(316002)(478600001)(8676002)(36756003)(110136005)(66476007)(52116002)(86362001)(6512007)(186003)(966005)(6486002)(4326008)(26005)(2616005)(8936002)(83380400001)(38100700002)(38350700002)(66946007)(5660300002)(107886003)(7416002)(6506007);DIR:OUT;SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B/1ncga0uHJhCNGaQUYPMcyHsMlWp3Q+YGVM+hhUk9tTtNCOcBgAivAqD0kx?=
 =?us-ascii?Q?YzssOL41nAAn62tO5xX7vZCQTEs6FeRxpSrDcTA10vZPLEauX9a8A7ZEf+sl?=
 =?us-ascii?Q?NSZyL5X+yBoWRZqSAIO3pD1Vnpk9dzEOCS4qUHhyEvnbMjosYpTkxuGCy/wj?=
 =?us-ascii?Q?/ceVg8OU0qR52/lYbZqdXAdI10nbxhROUz9oi9zwcgWTA4L1PxuAzoIW86wF?=
 =?us-ascii?Q?gL3LO7p0veIq8mQGfRswUL8e5UN9A42bhw4IX9ItzUsbLRT0HFozuGiNUyBI?=
 =?us-ascii?Q?PgLdF3HLc28EyY1S7cIR2UFylL9C/aMbK3h/NlsFXzUCue2JplagqOnSq16K?=
 =?us-ascii?Q?bVN8BVy1Bux48Bw3nxH5DewRA5fjkH8JGXzMaQwezPQgRG52MEBtCPG0Qzv0?=
 =?us-ascii?Q?gKSmXGK8Rm9TXIII/mUJQ4fi+WXoQh+shnkpWDJB59KVrvwnuPZZZYTiADsA?=
 =?us-ascii?Q?HwwmgR4Sp8/fu/xAq0DcbmTbDRT0nsOTZ93EhfX21JeItyOQAVzSgEKxtTX3?=
 =?us-ascii?Q?++FkzMqYDbDB1f4yLGIYhyMYpeGH4yRAgng1jGVx8hBDfWVrGtebbvb1SCFc?=
 =?us-ascii?Q?rK14W8SldB6Q7YvkWwajqW6XPc9xWtXDD3sUKfhx7rO94xkXf9zJHC9GQ52V?=
 =?us-ascii?Q?+lcrBvLkzXoB4gVrQ9gOGeik9KM+HclqJsHQUbl3anw2mqj3uB2nvlgjzYbS?=
 =?us-ascii?Q?uzey5ve1QTjDMvqBGhYuEHWdNw43pE7CrvSrmyugwnOLwAO38Gw4Q+W3S+bQ?=
 =?us-ascii?Q?9hnmToca+PyC+sR0fn6/cn7T7ImZVHg287ryHPvVbtV6xSF+d+yk4yQJJKyB?=
 =?us-ascii?Q?knMINlaWfDC+6UvjpuCjjxR3K4bZKg998U2RAblHHkmHzr9D8YZJgXwf4Vxo?=
 =?us-ascii?Q?t+bUbAcApHXKf7Hqjvvg31XPDCE6JMO6TUwtZV3B7Fc/IxXcUWRfIkWm1k7N?=
 =?us-ascii?Q?Zi26KZ8A31ifVODf2wYtBALtmxj5jVEj4VYbFLLPNd3cbcDVUrY7T7Li+ba/?=
 =?us-ascii?Q?QQuwfUfVcEHE+fU6SSpqJpiVb4UiSX5+PLTt5aNeYM9/TT+Bg/uwSpeuiw8c?=
 =?us-ascii?Q?xIQcTs84tsHk+O+jqWpYwL8CMA+qFjelIN99cHhk+aaGc7kX3CBorS94cvKV?=
 =?us-ascii?Q?7NPRz43bUSdjVM0+8yMuyCqfHIcEIuaAkyktAghULk2e1Ej2czJ9TFmBj0bB?=
 =?us-ascii?Q?S4eQS7jcTYUGGTp9OKV+piw4h/Ufae4YeWQJnnDYYS3G76NNbEIxbnVUy07f?=
 =?us-ascii?Q?9DoQSw7B+Di4eby43lBZ5wSINJFq0xcp9Q9xyCon5961JqkR33ji9YSTc8ig?=
 =?us-ascii?Q?lfTq75Co0J7Fbt+rgjJ+e377uW6ELcMNE4O5kkidG7TtkgyBG5zK/Bk4+OSv?=
 =?us-ascii?Q?mSB0tDUK5PXgSipQbW5/B6FM+oz4D2oSmUBYf2SomQTsmTnIYz3G233xHEYt?=
 =?us-ascii?Q?Tf+31lUxmunb889ZvAbolwOuuR5get+QQQfVqlsC+3GRCklViwyel6XNax97?=
 =?us-ascii?Q?5aHeSLgx/bRhvm330vHZbtTaHH/dA33LGB5DE/+1Hp9CLiEaVQAfykPFHH6j?=
 =?us-ascii?Q?L2pNHhxQJDUISAGTPH80BcjBOJdvOnoRGkkz5WcMQcSrm2RIz5Ds82G2IyXH?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: camlingroup.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a74952-8730-4c10-97e0-08da6622a71f
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 05:27:04.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fd4b1729-b18d-46d2-9ba0-2717b852b252
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VO0HHh21yk3g1TECeugq/2nWsix313rN1WXI9E2Wa2zORKDNNEXBgZFxQXFaYH85MV3x2teg2EzqM4/A4OljEP1CtqC2yOVtpJs2qBslwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB6143
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUK97A341 smtp.mailfrom=tomasz.mon@camlingroup.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: camlingroup.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_222728_385987_7366A19C 
X-CRM114-Status: GOOD (  19.49  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIyLTA3LTExIGF0IDExOjEyICswMjAwLCBUb21hc3ogTW/FhCB3cm90ZToKPiBP
biBGcmksIDIwMjItMDctMDEgYXQgMTM6MDMgKzAyMDAsIFNhc2NoYSBIYXVlciB3cm90ZToKPiA+
IDA2NzgxYTUwMjYzNTAgRml4ZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBERVZJQ0VfQlVTWV9U
SU1FT1VUIHJlZ2lzdGVyCj4gPiB2YWx1ZSBmcm9tIGJ1c3lfdGltZW91dF9jeWNsZXMuIGJ1c3lf
dGltZW91dF9jeWNsZXMgaXMgY2FsY3VsYXRlZCB3cm9uZwo+ID4gdGhvdWdoOiBJdCBpcyBjYWxj
dWxhdGVkIGJhc2VkIG9uIHRoZSBtYXhpbXVtIHBhZ2UgcmVhZCB0aW1lLCBidXQgdGhlCj4gPiB0
aW1lb3V0IGlzIGFsc28gdXNlZCBmb3IgcGFnZSB3cml0ZSBhbmQgYmxvY2sgZXJhc2Ugb3BlcmF0
aW9ucyB3aGljaAo+ID4gcmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0
cy4KPiA+IAo+ID4gRml4IHRoaXMgYnkgY2FsY3VsYXRpbmcgYnVzeV90aW1lb3V0X2N5Y2xlcyBm
cm9tIHRoZSBtYXhpbXVtIG9mCj4gPiB0QkVSU19tYXggYW5kIHRQUk9HX21heC4KPiAKPiAwNjc4
MWE1MDI2MzUwIHdhcyBtZXJnZWQgaW4gdjUuMTktcmM0IGFuZCB0aGVuIHdhcyBwaWNrZWQgdXAg
Ynkgc2V2ZXJhbAo+IHN0YWJsZSBrZXJuZWxzLCBpbmNsdWRpbmcgdjUuMTUuNTEuIEFmdGVyIHdl
IGhhdmUgdXBncmFkZWQgdG8gdjUuMTUuNTEKPiB3ZSBoYXZlIG9ic2VydmVkIHRoZSBpc3N1ZSB0
aGF0IFNhc2NoYSBtZW50aW9uZWQgaW4gaGlzIGVtYWlsIFsxXS4KPiAKPiBBcyB0aGUgdjUuMTkt
cmM2IHdhcyByZWxlYXNlZCB5ZXN0ZXJkYXkgYW5kIHRoaXMgZml4IGlzIHN0aWxsIG5vdAo+IGFw
cGxpZWQsIHRoZSB2NS4xOS1yYzYgKGFuZCBhbGwgc3RhYmxlIGtlcm5lbHMgdGhhdCBwaWNrZWQg
dXAgdGhlCj4gYmFja3BvcnQpIGNhdXNlcyBOQU5EIGZsYXNoIGRhdGEgbG9zcyBvbiBpbXggdGFy
Z2V0cy4KPiAKPiBJIGhhdmUgYmFja3BvcnRlZCB0aGlzIHBhdGNoIHRvIG91ciBpbnRlcm5hbCB2
NS4xNS41MSBiYXNlZCBrZXJuZWwgb24KPiA0dGggSnVseSAyMDIyIGFuZCBJIGNhbiBjb25maXJt
IHRoYXQgaXQgZG9lcyBpbmRlZWQgc29sdmUgdGhlIE5BTkQgZGF0YQo+IGxvc3Mgb24gaW14IHRh
cmdldHMuCj4gCj4gSXMgaXQgcG9zc2libGUgZm9yIHRoaXMgcGF0Y2ggdG8gbWFrZSBpdCB0byB0
aGUgdjUuMTktcmM3PwoKTm8gcmVzcG9uc2UsIHNvIHNlbmRpbmcgdGhlIGVtYWlsIHRvIG1vcmUg
cGVvcGxlIHNvIHRoZSB2b2ljZSBpcyBoZWFyZC4KU29ycnkgaWYgdGhpcyBpcyBub3QgdGhlIHBy
b3BlciB3YXksIGJ1dCBJIHRoaW5rIHRoZSBpc3N1ZSBpcyBzZXJpb3VzLgoKQ3VycmVudCBwcmVw
YXRjaCBrZXJuZWxzIHN0YXJ0aW5nIHdpdGggdjUuMTktcmM0IGFuZCBzdGFibGUga2VybmVscwpz
dGFydGluZyB3aXRoIHY1LjQuMjAyLiB2NS4xMC4xMjcsIHY1LjE1LjUxLCB2NS4xOC44IGNvbnRh
aW4gYQogICJbUEFUQ0hdIFtSRUFMTFkgUkVBTExZIEJST0tFTl0gbXRkOiByYXduYW5kOiBncG1p
OiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0dGluZyIKdGhhdCBpcyB3cmVha2luZyBoYXZv
YyB0byBpLk1YWzY3OF0gb3IgaS5NWDI4IGRldmljZXMgd2l0aCBOQU5ECiAgIioqIFRISVMgUEFU
Q0ggV0lMTCBDQVVTRSBEQVRBIExPU1MgT04gWU9VUiBOQU5EISEgKioiIFsxXQoKVGhlIHNvbHV0
aW9uIGlzIHRvIGVpdGhlcjoKICAqIFJldmVydCAwNjc4MWE1MDI2MzUwICgibXRkOiByYXduYW5k
OiBncG1pOiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQKc2V0dGluZyIpIGFuZCBhbGwgaXRzIGNo
ZXJyeS1waWNrcyB0byBzdGFibGUgYnJhbmNoZXMsICpPUioKICAqIEFwcGx5IHRoZSBmaXggKCJt
dGQ6IHJhd25hbmQ6IGdwbWk6IFNldCBXQUlUX0ZPUl9SRUFEWSB0aW1lb3V0CmJhc2VkIG9uIHBy
b2dyYW0vZXJhc2UgdGltZXMiKSBbMl0KClBsZWFzZSBkbyB3aGF0ZXZlciB5b3Ugc2VlIGZpdC4K
CkJlc3QgUmVnYXJkcywKVG9tYXN6IE1vxYQKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1tdGQvMjAyMjA3MDEwOTE5MDkuR0UyMzg3QHBlbmd1dHJvbml4LmRlLwpbMl0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjIwNzAxMTEwMzQxLjMwOTQwMjMtMS1zLmhh
dWVyQHBlbmd1dHJvbml4LmRlLwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
