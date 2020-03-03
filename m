Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2E1C3F2C6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 06:28:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591DB2086A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 06:28:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AoV8akVd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ExertusOy.onmicrosoft.com header.i=@ExertusOy.onmicrosoft.com header.b="OYOhBrqX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 591DB2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=exertus.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qQ3sBT+UBB8jhKVBQsenjVHnccdkOvwOe7kE0fYjC1o=; b=AoV8akVdUZ36YL
	oB/7zHDLNJ7OEziB2Yh1Vb2wQ48Xb+V72aC29YRCkkvw1EsX3S+Rs7Cp4UT8d2085rFxEXjbvgAe+
	ly8haOwZv04K8jVMTdCfp2uvVVkz2H/qT1ACpa4nh0WGX8h9xWfYd9L+ekFF1rQ75vRBy7CEeHKYE
	5VC6r/AyhMwcmV3MZ97HOSEjjnRk8JQMIOb2qxJKRz8t1HrTfKkgxfFmMMr+S0GsFWxy3UxkI4B9N
	N6Gyynhd762KzEbzayDxGrI5uObfaDuoL9MBhjLbbxgvxW4Dnu3gy5J4IlHpGl/n/5HYWjkj7foPC
	KzrDz+d3r9nqLkeNnXIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j912G-0004zD-PQ; Tue, 03 Mar 2020 06:28:08 +0000
Received: from mail-eopbgr150107.outbound.protection.outlook.com
 ([40.107.15.107] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j912C-0004y7-0m
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 06:28:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXqOysXtQO1fIfK95K21vszJyhPoSZBzxdbMHIYZUhF5DLZAQ4u6iepMHXZ31xql6paNcZJMwOm1l2++xmLrwZ1UTeZJ4gh5oruNUakuWOncvbXv2FO+O/vC762FJzT+tGZnflqrfzBe+wiHfrWtX9AlLxlSBWxkgzzHSfcvr8PPKuUPo5R7JILby5URvnBfkIeqMMPVifwIYEr5+mB0723DTfNMjgyrPw3G+RngZtxuj7Sujs59jIhCXObM2VHSARRD6Y+lynbmPhBKJIoQL1FVhOqaZvcIUDpW1StcPsKeSGEgXi0bmUgblWDhprMnUx/K73wLsgYzg2KYHD0/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLGQIs3czZSoVoeet63/b0BF9zffKlK0Qhc+c1bvQho=;
 b=S5eCs7XC/bG5If3kJEt27Mo1irNUIFwIdAAL76ie3RwK2VMc7bC2dAUB+DCB1NngUQZNrpCy45zXZoMbhaTfoyxqtnSaXu/AD+gvfGV2UtXO/zVZ/kryxBod8OBQrW4RuuJQeKMKlx8sNfMYVlQCpVuKdXceXLF9l6+JahNohenlxrhbys4dI7BimZk5KI8SXkuw/IFDI+zc3xyLzyhNYvJwP4rbJ3uVMB8onGeyjvEkAkG1AePXgwVJwJZIp/VF7tfyFxO0bz81xorRhL7lJQ8nADNZ2FdkXYXnavohsTxLhLQwUVd2xHnM/6wAfavqX+nv4vGMZBQD0ULxTadp7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exertus.fi; dmarc=pass action=none header.from=exertus.fi;
 dkim=pass header.d=exertus.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ExertusOy.onmicrosoft.com; s=selector2-ExertusOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLGQIs3czZSoVoeet63/b0BF9zffKlK0Qhc+c1bvQho=;
 b=OYOhBrqXtyW4USP4Nu/Ici0VN5LI/TWK5mOZRBKoGYRnfOsdKXAiaZYS2NfPI7j2IoIZoCKckCy5kF/eSWzyHD+lytuYAFAPkNH2WmR/VdIGZQ7uaoiW7IggwwvPPxxGRKYP0cDoDwK524x+fhFBHR3Zvt7xhci/z8/0eBTHt9Y=
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com (10.173.254.160) by
 AM5PR0902MB2034.eurprd09.prod.outlook.com (10.173.255.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Tue, 3 Mar 2020 06:27:59 +0000
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca]) by AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca%4]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 06:27:59 +0000
Received: from [10.3.1.192] (193.210.47.3) by
 HE1PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:3:d0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18 via Frontend Transport; Tue, 3 Mar 2020 06:27:59 +0000
From: Timo Ketola <Timo.Ketola@exertus.fi>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
Thread-Topic: Power cut leads to "corrupt empty space"
Thread-Index: AQHV7W5w0ROHw32Dgk6RN8346II1lKg0Re8AgAEDi4CAAIdXgIAAnhQA
Date: Tue, 3 Mar 2020 06:27:59 +0000
Message-ID: <1829047b-0185-dd6e-c643-823610431ece@exertus.fi>
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
 <CAFLxGvztqWq-oi1weZcFJOcnngbNdGwmEpJMEMsrfqfJb4Dt2Q@mail.gmail.com>
 <a91e1123-44fe-f788-54b8-541433b4ab84@exertus.fi>
 <CAFLxGvzH+Pq9LCLgAvr_LO0bEpvzbXQiY_67M2vxMuvtSTeA5w@mail.gmail.com>
In-Reply-To: <CAFLxGvzH+Pq9LCLgAvr_LO0bEpvzbXQiY_67M2vxMuvtSTeA5w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::18) To AM5PR0902MB2129.eurprd09.prod.outlook.com
 (2603:10a6:206:b::32)
x-originating-ip: [193.210.47.3]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Timo.Ketola@exertus.fi; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d389b4d-8884-4a48-cd2b-08d7bf3c04b5
x-ms-traffictypediagnostic: AM5PR0902MB2034:
x-microsoft-antispam-prvs: <AM5PR0902MB2034B54187FFAE50D85ACB298AE40@AM5PR0902MB2034.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(66946007)(66556008)(66446008)(66476007)(956004)(31686004)(2616005)(8676002)(44832011)(316002)(81156014)(16576012)(26005)(966005)(5660300002)(81166006)(64756008)(6916009)(52116002)(6486002)(186003)(16526019)(36756003)(4326008)(8936002)(71200400001)(31696002)(2906002)(508600001)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0902MB2034;
 H:AM5PR0902MB2129.eurprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: exertus.fi does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mn8Aj381KogCA1p/GqfgApbOLgWfZ+jDEZXwpC8cxkouEmJtdX3zsvMMzqq2snrWX0H4NNbe90+73C7XT2h0g0W/mqN6kJiNUmdXILvWJ/4uQhW9JH841NyARl2NzT4nZoLauw+HcUmKP8bZOUxj7FK5Ea3Vwdh86N7ssjOZEqEu79+Im0ulN58kG0CmzxeuPkajU196eX1158GltEglFL+sXbrjEFqRdQS7iYHx8U1JMm0KpSB50vMKEzo4OTKK9eNGO/L5QSwyQT7BYa7BJyrSJxFmEGdtEMjTAXj13eo8pF/Z8c0Il6wN+Aky/y40arJl5PYF2Jf6NztoHmDV5dFvapU3mAIoHKFfPwuG9s0H+DL8pocwbi6Y1rhhjjEU6OQtkIn8q75AhxSirIyGckk8zV/1dBEv+TuGVfYG1HUWrFQDV7HbTpEpWngJVW/n2RvCj0c+DNpGvRqG6iJGSR5V8+NZmXnDZtc2eyRz5yOT4BgjxZNnUkpAcpVHEBCKbSF4kb0geYRcjCJrnZkrIA==
x-ms-exchange-antispam-messagedata: Khu8mrDssjOkOBhA/l9NocVwKbfgPzuE7coDMBfcUFWmd4RkBIW4wg669DYoao5hVILLFKKCV9Jj8jv4QU1TFBuz1b99wr6UKhSOwMri5Vq9p/VfesO2MEY9C7C0K3nJ0LILuuJXEbAMkfptatwhaQ==
x-ms-exchange-transport-forked: True
Content-ID: <3304B3BB3ADD994FBA287F3F8504758D@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: exertus.fi
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d389b4d-8884-4a48-cd2b-08d7bf3c04b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 06:27:59.5300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ff5ff20-bcb9-4615-b2a6-3bbeefd7b8e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9m+IDYzo0vUoe6AXs/j5K4DkloqFZe4yEcrqg6R5cGEkJREIhc4/buiHt7aau65n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0902MB2034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_222804_133404_4F18134F 
X-CRM114-Status: GOOD (  10.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

Thanks for looking at this!

On 2.3.2020 23.02, Richard Weinberger wrote:
> Hmm, vendor tree....
> I strongly suggest giving mainline a try.

I can share the feeling and I have tried couple of times to switch to
mainline (4.12 and 4.17) but failed. There were issues getting GPU and
camera interfaces working which I was unable to solve. At this time I
tried 5.4 but couldn't get even the NAND subsystem alone working:

http://lists.infradead.org/pipermail/linux-mtd/2020-February/094090.html

> Did you also double check your NAND settings, especially timings?

Not yet. I focused on finding out if the corruption could be recovered.
Now that it seems impossible, I obviously have to device tests to try to
make sure, it does never happen again in the first place.

At least for now, the incidents suggest that this relates somehow to the
power cut. That would speak against bad timings. And I have a design
blooper there: When supply voltage is dropped, NAND write protect signal
is set hard. Now I'm thinking about a 'dirty power loss' scenario, where
supply voltage is dropped momentarily just before actual total power
loss so that one page write fails and then several pages succeeds before
the final power cut. But shouldn't one page write fail put the whole
UBI/UBIFS volume in R/O mode and prevent further writes?

I hope you got my other mail with the link to the UBI image. It does
seem like simply one page in the middle had been left unwritten, doesn't
it? Is there anything there, which could be used to estimate how long
before power cut that happened?

--

Timo
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
