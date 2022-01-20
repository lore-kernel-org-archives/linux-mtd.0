Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C744FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 06:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yhgf/CPSLVUvNpzKXPtSgxp7/lVxPcVR9ETBH0bGOug=; b=nVSsy/bfbV4xK2
	Vy73TMFp5ldq4ugNBapQBCOqKcbeA/SXi3ZfGeqeUxJ3Kmhqis2ZmT8Fn7yjDPiL1cgPCAEqP3SN/
	9ZjhIwgPiMGZX3h9KWvG89RWKVtmal67B2/RPz0uzh7RDPHgkkaONHpVvEytxmNWKpEPRta+9mwPC
	yw7pxwY79rW0zrVNnQnK+CWo1hPi0uOit+noyZww+uaYPun9ppyd0iCvw79z2OoBROTfzL2GVYI7O
	MhMoqGNZb4CjHxuemhuUBBJtHmR/jHZy5Ha7ie6sEQgEWCGO1Cxg7e1y7bYFK2Sda9Rw3f5uKGYE5
	YcAEk3MU5jv7yVGPDLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nARC1-0095Ys-Tz; Thu, 20 Jan 2022 06:45:10 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nARBz-0095XI-0S
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 06:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1642661106; x=1643265906;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=esTke/buRky0QlqYuyzkjuIRPNVH7SJHk6d7WNj6fvY=;
 b=EFR8aFyHTJvRLUSQypsYVFMwuLAEEgAK92Y1NxEqcHPkcef0wCtz29AK
 rsYA4M53pbfsu3QN7QeuoNw/IppP6dbS9rKUWEf0WmYjkl+AZhWQAShbq
 Scio7Mc9rmaBpu9vQ9rlGKTf3ed5TFkRzG43RQ0dNrAovLid8VdBUvLSb Q=;
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 06:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnbPeNig8awz7rMLg3y/HnzwesolIxAvitPNODawybFirwxzeWGaHP0t4sCFb6DjXXEDfuwNZ2mQL+NMSymEfPh3D5Ss20+aWdiicR8ZJO4dcn1jbv9widIiI9y6U5P8S/p8I3e03wQ1VKl+8Fs9mW5ByLBZT4/tgip6k8BZJGnEH+SYTxtQL913u4M/w9AJeWSEVaCYiMC0ApkT6Ey6GdurWm4Pu7sLhGyM/Hk8ZfswNEyHvuLP0ZRskE4uagzl2ZQL4nvdg3ST4eaVnwECTFR1l2xkOSSxcwslppmNXFz6+72tu5hXATZ+AuL0+PdtrLw1GMfG0BpDDXkkl1vHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esTke/buRky0QlqYuyzkjuIRPNVH7SJHk6d7WNj6fvY=;
 b=RbgOZ8bk5kaOChYVKJcD9KqeKhHuss5cVBYv+pSSGdB48qkVQFsmqraUHy1HBIuYQ+rtPz8XP0kKdpXERP0IStpAWjLyjDny3OkykpdKBc7FqD8HcqcOLWj13hBTZOucZeFrFrSU4ndG429inN8vmCeSFMZn5oyS5rUoyGW6x86756nAzY+4wyx3tvB0iM27BuAVS39mZjnzOGmRIBfeQzbHD5TwZVItnPOSLj00qK+Pt6GcemTJteTWvKLmwGP5L6Q0LRmqRtgyF8gZYMdeyq+gBharFkp6TgashRcKJOGLQMxolOE3dHIlXTRCJFpHFtwaJGlLbw2pWotZ9aouwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com (2603:10b6:a03:3f5::8)
 by SJ0PR02MB7534.namprd02.prod.outlook.com (2603:10b6:a03:320::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 06:45:01 +0000
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7]) by SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::481d:88c5:eab3:21c7%5]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 06:45:01 +0000
From: "Sajida Bhanu (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>
To: Michael Walle <michael@walle.cc>
CC: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>, "Sajida Bhanu
 (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>, "dianders@chromium.org"
 <dianders@chromium.org>, "p.yadav@ti.com" <p.yadav@ti.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stummala@codeaurora.org" <stummala@codeaurora.org>,
 "vbadigan@codeaurora.org" <vbadigan@codeaurora.org>, "Ram Prakash Gupta
 (QUIC)" <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, "sartgarg@codeaurora.org"
 <sartgarg@codeaurora.org>
Subject: RE: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Topic: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Index: AQHX8NO+WlpZqE5WH0ySDSUiuNAdtawx1mGAgDgzhrCAAK1jgIAA+YpA
Date: Thu, 20 Jan 2022 06:45:01 +0000
Message-ID: <SJ0PR02MB8449C8C63E8915A170B61E0DCD5A9@SJ0PR02MB8449.namprd02.prod.outlook.com>
References: <1639476991-25676-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <488aafc3-2fa9-198b-c448-d1ca7ef52f35@microchip.com>
 <PH0PR02MB84557EA76BD8DDD35A99B915CD599@PH0PR02MB8455.namprd02.prod.outlook.com>
 <b4aad212d86b2d4dd27602db6add82e3@walle.cc>
In-Reply-To: <b4aad212d86b2d4dd27602db6add82e3@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bb60d1f-3a05-470c-f8e5-08d9dbe06223
x-ms-traffictypediagnostic: SJ0PR02MB7534:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR02MB753400D93F1634E0FA9CAEEBB15A9@SJ0PR02MB7534.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bdu4s5oPBmzVZZdgt4zK0Nsqj6mMUl7Y8iuqS66L6IaeZ15u0CoG+9cYuzPE6e55bkIQWQpiZhlz0AWQCXJz/V3nTsRyEXsl7sa/pX0xNNQfuNGVCU6XRqDCyuhKksnGfvVLFwpOXo5+JIM7LpbS1+zZjdi0D34YUFjULgwsDyfHLNfPAWs8oVhlDcP7risfaHnACX//T9jZeY4kA3/gscntvVpVjJoKaP4XCrX4cfT26dPaobRMCUc9EzL6Mf/OZErAO5x/EXHnQCfN2V8VR4kv3KW5sxmwr2+b2gGM5XXsLO6ezX+hkMT9I75Nx0V2Oiyo1niZP4yzTUv9lZG7ucVR3Ao9wHzPBz3Xv9gBQFlX4qZM1tunkjTEuaASJ7eaFKH8njp+wZKKpVb5GAvixeVKQnqqXIaGnpxGTPWxswrFOF9Z4oRYnMlBY1X9ahtj8/sA2FAAyIaL/OtR49oR1yBWUeN/uY+rLGDwqU3G4mF2e0HktJniDjI7aXpZ4ouvT2D67buVlPblG3YjjCtdTDwDto7h5uyT2mYVC029tq7kw4WO6LTxZ4+gCaeYfOu/ktTIGULiMwmVudUsCetdUoJFDy1EgA8EIXybMRxz1MzayqoakNzp1C4GCKFWmAiZuQ+xHJc0vQcgSgNkE9yo2Nl/SqmLe37d7hp8mVCGkroHrFvT3CzHc8kakeDip0QBas+tzhuxfMXqBEjuGi653w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8449.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(76116006)(66946007)(4744005)(6916009)(7416002)(508600001)(122000001)(33656002)(83380400001)(66556008)(66446008)(64756008)(86362001)(54906003)(26005)(38100700002)(6506007)(55016003)(71200400001)(53546011)(316002)(7696005)(2906002)(186003)(8676002)(9686003)(52536014)(4326008)(38070700005)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i1WBiBpTGQ91Mla7Qi8uSGLGBCv2T0bKYGPMy5+4swZM7ncHDboS+ygo9eM4?=
 =?us-ascii?Q?X7FoqmjQuG996lwZmjRU6pKL2A6MXJCYD4P1yK7TKE9pYISFnJqgzVo2Rw67?=
 =?us-ascii?Q?xpJc3ByxQipw0RZ6yfHksCsgIT2cCtlUESNanGp/jk8s7l+Lf+gXTJR9yjXS?=
 =?us-ascii?Q?/0DmzIKquoASTlHo5EDfSwBEeb50+RPzvh561AUo9Ek26375S9BsgkKjzp0b?=
 =?us-ascii?Q?Z10kLIYFhKoUELC2KDj8ldZLc0uuTu2/W1v9Mi2BQ3xAlcD3EBv3/Rntv4+2?=
 =?us-ascii?Q?oSMuDz2hEPNJ0mEG9MGoGky5Oq9flXEowbKS4Tm5w6fv80t3WE+iYUPjDX3v?=
 =?us-ascii?Q?K0BQMT0RSfDnRafhzw3c1V/EHO002OZpFDA8jQNeUeyLtzZzo5TUbkmeKD2e?=
 =?us-ascii?Q?rtr7q2eOPuWjkq1Ma0ZZvqQvaU3leYwa1+04e0AdEEugHJu6BGo6vV9DlGNm?=
 =?us-ascii?Q?X731127Y3NDb8jGnf410wReoCz4rER7WlWP/khUXrx+rdluRQBBnhKA/aQLF?=
 =?us-ascii?Q?nXYi12+x9vR8iqv/tdD4VYeJpw4yW8Q9atLAjqOQKMrFuvnB0uQ5KYBkKOOM?=
 =?us-ascii?Q?U82GrdNaojY/kK0SOouarkjQ/RL3fNzPSwPI4YPgamX8qLelW1y9UcvxWAra?=
 =?us-ascii?Q?hHrXaaUpxSAR5hR9dE2l581UKCg1qb3nUtiH9mKBmYAgZ02HPbK3zaAdSLW4?=
 =?us-ascii?Q?MKvce0byOPQCfweqqgdFtXOdFSNMHC4d9gGEMYk3qqvjpVgbbund1aJfFGsW?=
 =?us-ascii?Q?bVLOeB1+ss3QpirfbpfFN3seSSpAykS6tbXDczwhyKsEj4d2P5mtfZrSZ9BP?=
 =?us-ascii?Q?aVw0LE5Hzw68AdYEqrtTHQ67W2B62Lq0BLM/OlR0ADY6Zvv0SHyVtUkvFLe0?=
 =?us-ascii?Q?cM6PQfIAxgKRB26hY9WQZN2513khz/7e60Q129n9DaAVCfwf1V8bw176NHB6?=
 =?us-ascii?Q?9twOV3UgLDUggISKNftgq2tXGQCuC8peJ71A49Mc/7zXUBT7A6wQ2Dc7QhLE?=
 =?us-ascii?Q?IRTw6ZhbJWslBdouQQHfFmzCv5THmVeLyk5kQmEv1D7D3R/ssdg/SMgo+0RW?=
 =?us-ascii?Q?xXtHILPyYCB2Mh1VpEW13+XfDvYzzDGiDIAKeADQXGV+82Efyil1UFLmxLtn?=
 =?us-ascii?Q?brRfnFY143AaDPBTUKmoofRrb1hT6M8NK7ezp6Kf1k4bpxyOVi4P16BfdOx+?=
 =?us-ascii?Q?bh1N9KFTTGCieQq+g6hnkXw/TYsv9Rmo18hFDSuHvNsCMGbB4XptD2AIVPTk?=
 =?us-ascii?Q?2wk4ol8uHL3Bd+Um5W+nW6XuvUdCJiJl+yDi+deGshDH3YNZlGVsbdKsrpBa?=
 =?us-ascii?Q?N0Zh3/L6mkD2jomIyMXg9vGDqj84B7/qPMjC/waZ6CFErh5FXXzAAFO+6evo?=
 =?us-ascii?Q?YcvxxwPPqaaFYeus80dh0KDbxLYYYTWTR8ImJsxHJArNBAwnweJqJs+LgCvN?=
 =?us-ascii?Q?pNc1pIuWfcBpYhoHc3MY2ssNwdiFDN8CRpTdlgN7EFTGf4tDT+BFQow9vslz?=
 =?us-ascii?Q?smZaxovcouKD4SqrJBAU6rDtSw9gGPer8JsxZGotncdu/SHSqLf/75hWKmBq?=
 =?us-ascii?Q?oO55ENUOqdMY+kr9xlvrVQl8UaLn8jRokC26mNqShu/fXt4uYqe1IGYAxSFr?=
 =?us-ascii?Q?61qYyQHLgZCSOS3/dueTC/VG/d96BEAHbm6w+rq+UFQnD9P3KouTXgUfmvXT?=
 =?us-ascii?Q?HHSDVg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8449.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb60d1f-3a05-470c-f8e5-08d9dbe06223
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 06:45:01.3286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPcbytWsAZ/pu3trglSJeLthihsNEu5zjOXFOJdi6Bc526sb+FtG1EnAuoADlMXZD7ez29U1T8cM+6xyCi5STala2U2/gOcXJpcrRv32qak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7534
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_224507_166724_D3131411 
X-CRM114-Status: UNSURE (   8.11  )
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

Sure thanks , will rebase on latest and post next  patch series.

Thanks,
Sajida
-----Original Message-----
From: Michael Walle <michael@walle.cc> 
Sent: Wednesday, January 19, 2022 9:22 PM
To: Sajida Bhanu (Temp) <c_sbhanu@qti.qualcomm.com>
Cc: Tudor.Ambarus@microchip.com; Sajida Bhanu (Temp) (QUIC) <quic_c_sbhanu@quicinc.com>; dianders@chromium.org; p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; stummala@codeaurora.org; vbadigan@codeaurora.org; Ram Prakash Gupta (QUIC) <quic_rampraka@quicinc.com>; Pradeep Pragallapati (QUIC) <quic_pragalla@quicinc.com>; sartgarg@codeaurora.org
Subject: Re: [PATCH V3] mtd: spi-nor: winbond: Add support for winbond chip

Hi,

Am 2022-01-19 06:34, schrieb Sajida Bhanu (Temp):
> Gentle Reminder.

As Tudor mentioned, you'd need to rebase your patch to the latest next.

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
