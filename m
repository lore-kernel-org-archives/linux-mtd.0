Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58360C3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 12:58:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27933217F4
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 12:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JgN77CZS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ExertusOy.onmicrosoft.com header.i=@ExertusOy.onmicrosoft.com header.b="X36GmUjm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27933217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=exertus.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EF64uh9ca93sv8L5BGoa8Jq574ruuoe3NSXV22NpmCs=; b=JgN77CZSIbzuoV
	Hhh3rino9ExRD+gmJDDCaS13IUZ1Pj3oj4djhKmvJ9TgTwS0qD79BoUHuY+d0asbGZrTRyJC8YgTm
	JxFznkpa+eTrVyjGXVxXt37woPCCgTNIYB9BIXRAaP5Q723HQ/r7BEEkeiZGbgvpqO5k8p3+9hait
	hF4LJoqnBtb2V52csbb4faP6GAcLlnfZgkWLJfBQjj390prX+06Nr804pTL5A4aqK04q2/hx3CniU
	TeFupyURegeFm3eLLMlhooyxQj48pFeea54yNSQ+CGFzpLSSS/z01UThdcjvWSN79cjv9DNVOtfMq
	XIABP1pYyk7SPk49CXgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8kdy-0003Az-Q6; Mon, 02 Mar 2020 12:57:58 +0000
Received: from mail-db5eur01on0711.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::711]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8kdv-00039q-Ja
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 12:57:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZVQ/d3Ts2C0Ho3l8X6lvIEMjANmnmSJjlm8Y0C6dJNsyf97Q+2JWd4s5WDh5lvPkh477l5SxdAy4L1H86/mtN+DmBc0dVPBEVj6ilwHpZU5rtZ0djFEcYffQspraYpek0UtxXtjFRWkbA29QmPnk6Ab7IUqP5bShdP6boJYfQWqKfesL4xyfxofkB7XKW3ScYeJ63b3f7ehlKBEMYw4FN6fnN2VqsIW+CKpp0TG0MrHg95u62kq2guWNP4Hogp+e0+a0c8pXaVxuWDSjosSvrQ+P6bIvy6VGhp+KlWK3q2wNE2ud6GfJRDEw2aQANm9bXs+AM0nB0WeleEu4p4u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbCWYvutoSBch8VIBCFcfFy5nNUxIn4ALr47kkq7rG4=;
 b=ZpIleHQIk180Irpl9DtrGAXW5DUdBq1f9ELirTs03Zck6HSOw8yASO6Jt3LgLowQhFtzYLHU4eIHCjNjrSAJwFBk5/jdmAYqTHBsKXosdov9LzirugWlp+EIuXqngF0O7cwrbdkUEZJ0hYB6uPQo2loZEZCHR1oKflwDM2+PeyR2dzYIxwEXxrTahpUwiZD90GLkd39JizyQhgulq36EkHv3oEYN7ZMz0Yf8GxAey169shS3cZHvvmlmHjtKy56nRNrtYKtuwVFRrejVOfVAZ7LtRLJJKf/5D/fIkKEK/6rv/adRIe7fEumXDA4YclFVYIVcMIwnVJCed4am7f2vmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exertus.fi; dmarc=pass action=none header.from=exertus.fi;
 dkim=pass header.d=exertus.fi; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ExertusOy.onmicrosoft.com; s=selector2-ExertusOy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbCWYvutoSBch8VIBCFcfFy5nNUxIn4ALr47kkq7rG4=;
 b=X36GmUjmpIIkMM+fZkBR6dtx8Wo6XQYp/sB+XZ+WEx8wLcQErKU+jCSfe4T/CbfVJSg/9n55TV9c4kDPJhgXIEApTfE2qD2yKc3Ywre/5juGrVk6mACAQ7/SHgU4jGw/z7gsCD5h1wbzzAIJHDk33GmOg+l/94WBis93zJh+pXQ=
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com (10.173.254.160) by
 AM5PR0902MB2147.eurprd09.prod.outlook.com (10.167.168.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.19; Mon, 2 Mar 2020 12:57:49 +0000
Received: from AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca]) by AM5PR0902MB2129.eurprd09.prod.outlook.com
 ([fe80::ad47:8da1:fa12:3eca%4]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 12:57:49 +0000
Received: from [10.3.1.192] (193.210.47.3) by
 HE1PR05CA0204.eurprd05.prod.outlook.com (2603:10a6:3:f9::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Mon, 2 Mar 2020 12:57:48 +0000
From: Timo Ketola <Timo.Ketola@exertus.fi>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Power cut leads to "corrupt empty space"
Thread-Topic: Power cut leads to "corrupt empty space"
Thread-Index: AQHV7W5w0ROHw32Dgk6RN8346II1lKg0Re8AgAEDi4A=
Date: Mon, 2 Mar 2020 12:57:49 +0000
Message-ID: <a91e1123-44fe-f788-54b8-541433b4ab84@exertus.fi>
References: <ee9d424c-8b89-c8f6-7b3b-1ab09371e04c@exertus.fi>
 <CAFLxGvztqWq-oi1weZcFJOcnngbNdGwmEpJMEMsrfqfJb4Dt2Q@mail.gmail.com>
In-Reply-To: <CAFLxGvztqWq-oi1weZcFJOcnngbNdGwmEpJMEMsrfqfJb4Dt2Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0204.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::28) To AM5PR0902MB2129.eurprd09.prod.outlook.com
 (2603:10a6:206:b::32)
x-originating-ip: [193.210.47.3]
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Timo.Ketola@exertus.fi; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a713358-e451-4e2d-b1e8-08d7bea94f82
x-ms-traffictypediagnostic: AM5PR0902MB2147:
x-microsoft-antispam-prvs: <AM5PR0902MB2147A09542EE45FC858F7BEB8AE70@AM5PR0902MB2147.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39830400003)(189003)(199004)(16576012)(8676002)(66946007)(81156014)(81166006)(2616005)(956004)(66446008)(66556008)(64756008)(4326008)(52116002)(16526019)(186003)(66476007)(26005)(31696002)(6486002)(86362001)(31686004)(5660300002)(6916009)(71200400001)(2906002)(966005)(4744005)(8936002)(36756003)(316002)(508600001)(44832011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0902MB2147;
 H:AM5PR0902MB2129.eurprd09.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: exertus.fi does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OUatj8pqxWI1fenauhLRLvPE/XyAXPEHXDR592yUIGL73vbdXY/gLPWt0sheeN0Ozq8iQHlXe5gtkjbe/JQMQ0urvf/rPhvjm9ENMKFQsSTuyj3KPs+I18q2/YoxFoF1sYXZ2uXNKXhgANoyZkP5XOg3NcKX7Pt+52WFmTZ0MyM8jAT7wPZdAO++tcat/9oO6nXA4Z48JslcnCalPU/rci2wcOIi1R4wxYcCIEstjA0w5cj13WxBDQOh2g2kGQZ7CesHS1IjFCROQxsddMY354xFT6veZmGOVvsvdx8BQDycjlsTdXCcktwTP225GDXpk7jWp0KVK7kH4HR0Hye+AztuhIYQwUKfvYukuFBnp6e9/qdsMUq2MMiAuQcBxHkigKFE5/SYAZp7uOmtdMpYmkeayZiwpoUekESy7E38dN/Fep3ZRBrfB5qG5PubN7UYClaUTmOER3L9zRfHMprAbAJbxTqgG1T3omTlI5HwO8mvf8QFSK8bxMQgpnGmomhInNPUAXG4oD6QwcQODp7u2g==
x-ms-exchange-antispam-messagedata: BgEKxI/y24KLoHD+cCAk+E1jnUHo1jmhvfeJX8o2Zy2glJ7auxC8u1yCkfZBcKm/PJ9eJtN0tH7bsupH0paWH6Nilk3SdUVAB9cXuXEsIuBRAokCN6zO9yayDiW7FE3ql/kqwMbJiXw2TcYAAu0VOA==
x-ms-exchange-transport-forked: True
Content-ID: <0F048F330983C24FB2C0C5680AA16FF3@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: exertus.fi
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a713358-e451-4e2d-b1e8-08d7bea94f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 12:57:49.2028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ff5ff20-bcb9-4615-b2a6-3bbeefd7b8e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4o5JZlR1KyEFrtC4QyqPL6WriFN0x6B1bcvUZPwMzXhiMA+3Ee5PLuDhLw0l7c+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0902MB2147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_045755_712463_58DA0384 
X-CRM114-Status: UNSURE (   6.90  )
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

On 1.3.2020 23.28, Richard Weinberger wrote:
> If you can share the image with me I can have a look and with some luck we
> find traces.

Thank you. I'll send the link separately.

> Is this a mainline kernel?
> Wonky drivers can lead to all kind of "interesting" results. :->

It is boundary-imx-o8.0.0_1.0.0-ga-pass2 from

https://github.com/boundarydevices/linux-imx6.git

branched at a51fcd6bd17c with our board support and patched with
v.4.9.88-rt66 from

git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git

> I guess 2KiB page size?

Yes

--

Timo


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
