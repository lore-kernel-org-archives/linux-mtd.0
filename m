Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F39C3F344
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 13:42:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D70320726
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 13:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dv0uqVu5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ExertusOy.onmicrosoft.com header.i=@ExertusOy.onmicrosoft.com header.b="afuCKSWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D70320726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=exertus.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfZgiiwHj2ZnF6UiwNt339eD1bpZlck3K9DJftg6tXA=; b=Dv0uqVu5HYREk6
	c8QuDMBjksIaOLbs/EvVNdBmoaoQw33LGCv7OC/hPZ7lAVU9IxUY55mzTK2+ExomY0mbPKyAk/oJO
	LsaYKYq83Bw9PToHhtGIba103kVCyX7g2K6hNFbrLdUvhBOo8LiiMw7hAscocPXA62dClbti+vD0I
	OEd+Ah73mBgg8+VipLXTktllwA1tBH/LVhJ5UqwnqePds0Rrd/+VmaBgL4NAPta4808krvyumtvxH
	GD++O8uZQ62lOod+j0mgZSWfbnzUxTFPxEM2liRdz2bcuP8V69qqsJovjgmRnt6ZKR0HrGynYXcGa
	ElpgpkXBHP/xfOltl72A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7JQn-0001J0-0Y; Thu, 27 Feb 2020 13:42:25 +0000
Received: from mail-vi1eur05on2120.outbound.protection.outlook.com
 ([40.107.21.120] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7JQj-0001HP-It
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 13:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krfjXB2O/ZsmEtFY5wOy//PcLBsz/1v+RtAu4m3zzDQoVGtmngHJTcvapzn18OFDvRmi6w3xHcACUYkW8DDMbcNKqivVkbdMRTNpwe6mPPvM5KJ9YrhGQiYTbpWg2vXvR6lK7URJwo0ZOqwwPZLCkU8Q0QVIcFw7Rdyg2C8CuWheoJPmpjQ26mUK4m+iRPINYJbTYm9QJpRwSPrIYGjzzGrTKR6cKe7aL/+nltJZTiS1gnoPqocUAVL3ehdGoy6rilqs0GfXDsI2h97RY0AgryeS9udFUQXmKTrBAcr+4jTbTzKc7lH2uSscyaUI1kzdvEhFYTFn2l2omoXUkryBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTPO2hd0hu0QssVbXbdRsuYl2w1+sAadENkGznv3QMU=;
 b=ZGdkQ9XTiQ+0vanpMlIrWCbhsWMV4hpSRDXdlxqJ7F1MGregU949ldpBREPkMZhivZiX+v/MHSJK1cVZBfW9AWUbR8tGSL9AJqTE0Sv87vxza6Fh8ExcLpLYCwSOmJPZF0/n3CNGPPnO0sUvaZMQctnnbuLZHMOcHiWJ25uDIQTeGnW5Zdrf4e7cVmufAuq6NE2pZwY/ROBx0rOyhPxI0zlSS3FYZ8rWH46KWA5A06JU4Z7zHAwPJywrFTQPvYj7dcdysg03UrOXtBcjhmSPZH9cduYt3eLV5JA/dirsmqjVw2n+PQhdEdSCYfAk3Otxf5AJu/xkUlZHo3O8ftyLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exertus.fi; dmarc=pass action=none header.from=exertus.fi;
 dkim=pass header.d=exertus.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ExertusOy.onmicrosoft.com; s=selector2-ExertusOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTPO2hd0hu0QssVbXbdRsuYl2w1+sAadENkGznv3QMU=;
 b=afuCKSWRsD3h9mahOmBSlRkzaJoekpkkm1IxMgu80K5NMJpjpBwEaV81mInRtC1tmyTMbB7G/s8KIIq5c0QvLOMlIBEyI8F4OzBCBNpx7a4XQqMcl7WjjrBnaj6sVG3EUPjYwDkcXcsLitcgfCZYWmP+w+dB5M82quzxsEBjYJc=
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com (10.173.254.160) by
 AM5PR0902MB2036.eurprd09.prod.outlook.com (10.167.171.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Thu, 27 Feb 2020 13:42:17 +0000
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca]) by AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca%4]) with mapi id 15.20.2750.024; Thu, 27 Feb 2020
 13:42:16 +0000
Received: from [10.3.1.192] (193.210.47.3) by
 HE1PR05CA0134.eurprd05.prod.outlook.com (2603:10a6:7:28::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Thu, 27 Feb 2020 13:42:16 +0000
From: Timo Ketola <Timo.Ketola@exertus.fi>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
Thread-Topic: Power cut leads to "corrupt empty space"
Thread-Index: AQHV7W5w0ROHw32Dgk6RN8346II1lKgvAwqAgAAJioA=
Date: Thu, 27 Feb 2020 13:42:16 +0000
Message-ID: <49a83666-2e08-833e-dc63-0fb820b5c6f3@exertus.fi>
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
 <CAOMZO5BHW7r8aMT_7g91LpGem+WpP+PRKwnsfu9v7yn278pErQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BHW7r8aMT_7g91LpGem+WpP+PRKwnsfu9v7yn278pErQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0134.eurprd05.prod.outlook.com
 (2603:10a6:7:28::21) To AM5PR0902MB2129.eurprd09.prod.outlook.com
 (2603:10a6:206:b::32)
x-originating-ip: [193.210.47.3]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Timo.Ketola@exertus.fi; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30782165-3397-4a8b-e388-08d7bb8adbfc
x-ms-traffictypediagnostic: AM5PR0902MB2036:
x-microsoft-antispam-prvs: <AM5PR0902MB20364DF95ED2307F45D3366B8AEB0@AM5PR0902MB2036.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(396003)(366004)(39830400003)(199004)(189003)(86362001)(52116002)(4326008)(71200400001)(53546011)(64756008)(2906002)(66446008)(4744005)(5660300002)(31686004)(66556008)(6916009)(316002)(508600001)(6486002)(16576012)(66946007)(66476007)(31696002)(956004)(26005)(2616005)(186003)(16526019)(36756003)(81166006)(8676002)(81156014)(8936002)(44832011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0902MB2036;
 H:AM5PR0902MB2129.eurprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: exertus.fi does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2R2MObwoPBmtedj7LD/tybj0PZQoIRHBGJk2pZqoGfwnqmqQKxpGlkpnyWAkjK2lg2GIksyoi0thVemlsqK4yip1BqdQ0+FaocVHy2BFL8hV2UrB+IzByKZ87EtTrSlVtRbuIfznsQJ8pJgyDUCGBZCw0cpsVf5KbLQ/hLkF2Zd8aAWHyhmv2+T95gstBDZfHqBNy2ipIxwOgis2U9ytn/abGj7SACCAVU4LjnNwaEnezPBXPL82nMGZ99e0tfiH4BABfp+wXrIl+DqS8H4bAnvJcXawcFLeWTQjEXEhgsgcX2NNszvHaR/EYLjlIK0GKJxUOjz6Yp918NICMxUDES+6TKVVbGSOpexZSgOlJHOs5qvu09qXNvWIkWQptgKcJPAwTQZLu+7oK1i+r73rjEqYBVHJ1FxDvOTE6ny3I9YKYs2LFRhrrXjwqY0JfcFT
x-ms-exchange-antispam-messagedata: jbEYW5WjycClkMHvtjW5q2d02Gx8ZNjWz6gPNC+YqnOilYWbfCBffUXk81tFZQNikMqzKKDDZFsdPXqUDwG+R/4igHNDB+kHLfBFJpQ5MtuzZ7Cmv/6Rzc7xrvx3saQaIeuuvohOCmoj9nN2FMU6hQ==
x-ms-exchange-transport-forked: True
Content-ID: <B72F39310FE20D4ABFADAD2E117078D0@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: exertus.fi
X-MS-Exchange-CrossTenant-Network-Message-Id: 30782165-3397-4a8b-e388-08d7bb8adbfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 13:42:16.8378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ff5ff20-bcb9-4615-b2a6-3bbeefd7b8e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eGtG9WoNl2M8W8XPRIFx+BDrwpvTDmg5/HcxiEmFeDwdxWARmoK9Kz4z8rnQACg9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0902MB2036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_054221_684826_6EABA0E0 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Hi Fabio,

On 27.2.2020 15.08, Fabio Estevam wrote:
> Hi Timo,
> 
> On Thu, Feb 27, 2020 at 10:04 AM Timo Ketola <Timo.Ketola@exertus.fi> wrote:
> 
>> Storage is NAND with 0x20000 erase block size and the kernel is 4.9.88.
> 
> Could you try with kernel 5.4 or 5.5 instead?
> 

That might take considerable effort. Would you think, there should be
fixes for this? Would it be on recovery side or preventing the issue
happening in the first place?

--

Timo
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
