Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E521EC433FF
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 05:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B791A21BF6
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 05:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oKIXfZKw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="rAVEB05l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B791A21BF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHOa23jHCESX9r+N1JobPK4wsGZZSxvz5aMr4AgcQrc=; b=oKIXfZKwsmNYFh
	5HdK9zYtj6Q6jiIFPgpi/5/UnxwdOZDMeafvOu6AkhN4q1HTepVgdEHMPi+wE0jutlyzLsD9clZ6C
	ehTdEfFiB63k14hh8j282xqp88shfVVcf6m9RYe0PdadV3iqXPlcZAy42XjE4CQBIAUDNgLtSQ9aw
	NDMT9YyQ9r1Uff6mY1JfSmzZRzqn/8/We3F/Y1hmXXYOjqPOlQbhrTxwYuzuFsQm/7SAqUdGu83hf
	1GcrrjQWKLsmjriK/6HTgQyHtYlmJ5t75uBNqFTYEww/CFfkSIa3cmdrWhqPShECkDUUBuhSCJSKV
	Ecfm50KJR3VtltO5d8+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvEoN-0003dI-TW; Wed, 07 Aug 2019 05:48:35 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvEoI-0003cO-OR
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 05:48:34 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ST9bztjtXXZrTaBpEzEbK3wzi2veTxlAexenHWAuXVVsCnifVg6Jqa864Rm48dpeE+mEjHHUPV
 uc8KQhQUdX6jOwXN5SvQZdY0ygAGnObTbLKI+kPlYfgFP3/Xen6IdgMBhHfqYjfBFDoIDs16MW
 zmEHb0De+MNymQFVB/OBoNHuIf5QYiip0jYQnH9TQ3SKFn5aN3oi45yaIr+UmM+gB5Zbp75R7h
 EDtmcPZ9wcp2qyFjv21z3g8r4C9yRcuOnnF0ZqAaBSiwHUoLjXUUKGRgdSTosajWFy8kCoCCIq
 A2k=
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="42692374"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Aug 2019 22:48:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Aug 2019 22:48:15 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 6 Aug 2019 22:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E92VJuKZkAMccaoMzZdKYbEiaLqrxR0iSLQYZJig7dz0eQPGIbAgn66scWq04V6lqglfk0qJnQf4gsN7dogXmIP7UHJ5QRsPwJIqBysawSRWP1nUH5z+AUJCjwJYEobbEqUxruhSw8nnlfZTuhLy+9+a58abQxaD/Kay58KbsgRBnmx2rrBaC9p/UWkbV9FUgUDggQipt+0amWzIlqG+tojFBFZloJLU8bFMwHPR+3bOQDcZkF1xivTZW7NDKvJGgrfgLz0WUogMogOXRPUAFX8oYJy93xzwX7X8AvcoTNnZAZkUyYOJvya4qvCyQE5ALZCEONreTJYzeg3eudXPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOn7tMVeywif6Ez3JYaw8Lm6oAmM1OffBLJzimstfdw=;
 b=T3xNm3vRqJ6bIzDpDbpbPeJF6lNdrQyiQGGfVeAe1Ygn7F8/bM5LaFKchbG6H8B8A63JhwPR34VJHUn6fOpMOZ+4TH+LNW4OmTaFuw2KFf1MWRYImNGQdBGXlafxR6ZcLNTKb2y7R5IFL8w84wme6i/P4fpIzORICZOnayhSVx3jAcaG3EhY6WUGcZDmVduSkkjezQJ0GzKh0IK3ur0UGZ6QzFv83wods9+GGq9bzb3LocI79OhcJjetGrfaSY3aZJMZx/uH3BO6Tx3OsIfhY9qaSLkwzrXhNikBETjZUfeIYp7nq0RdkBk42jsKoPElXAjeZZahbgIf9/thtj4sgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOn7tMVeywif6Ez3JYaw8Lm6oAmM1OffBLJzimstfdw=;
 b=rAVEB05lQPGzrPE9L6XvX92sn/yumIFW0pJIjNsgvUJA5x+hSaHMDtt5l3/zdaCKJVXEnRShjpnM3GucQjVfqpoM6tYl+T7Xd53St5LY2TLL5JObiMcGKE/l9SQk0TUH44e0+SYhuollWr3PG1TsrdGb65RIo5cZEmRezO6koyc=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3901.namprd11.prod.outlook.com (10.255.180.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 7 Aug 2019 05:48:13 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 05:48:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v5 3/3] mtd: spi-nor: Rework hwcaps selection for the
 spi-mem case
Thread-Topic: [PATCH v5 3/3] mtd: spi-nor: Rework hwcaps selection for the
 spi-mem case
Thread-Index: AQHVTBVMg2kaNSwXrEOHbCy0uAK3u6bvLzKA
Date: Wed, 7 Aug 2019 05:48:13 +0000
Message-ID: <ae26ad74-3506-6074-8024-2ff9bc1003aa@microchip.com>
References: <20190806051041.3636-1-vigneshr@ti.com>
 <20190806051041.3636-4-vigneshr@ti.com>
In-Reply-To: <20190806051041.3636-4-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0022.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::32) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.106.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b720231-1ccb-4f3a-497f-08d71afad5e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3901; 
x-ms-traffictypediagnostic: MN2PR11MB3901:
x-microsoft-antispam-prvs: <MN2PR11MB3901E365F64D905052BB24D0F0D40@MN2PR11MB3901.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(366004)(39860400002)(189003)(199004)(256004)(476003)(486006)(478600001)(446003)(6246003)(11346002)(6512007)(26005)(66066001)(186003)(53936002)(2616005)(102836004)(229853002)(8936002)(316002)(3846002)(25786009)(305945005)(71200400001)(7736002)(6506007)(71190400001)(386003)(53546011)(36756003)(76176011)(86362001)(2906002)(68736007)(66946007)(6436002)(31696002)(31686004)(14454004)(54906003)(110136005)(6486002)(66556008)(66476007)(6116002)(66446008)(64756008)(8676002)(5660300002)(81166006)(99286004)(81156014)(52116002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3901;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vPq4jnTy8gWJJkhg4vv/muYe4MGkB4X8zvFUMrjkFq8DmSx8Stag52xvXVuU4rWJDXJyfK3yEZ0W4jqBlj97UeXOFfZcNoI2tgkiiDDcOXEpbihSa0ql3yDwSE9Hwxgd6sIVf06Dz6C/QcUnrLQsOSexlsjN/9iwtaKn1ENtMb4c1U6uNBv0ds79FegDjW/5poZPKnSmumAPvIcd6I8/vhdoBh2uRk87FeBQuXLHLkTM9jrytdlwn5wD+fNP0uyA1s/8Fxe2aqZeIQIXHTdX8+dDUxRzHo9wY0b53SBKEVHw5yuTBToPYJvI1Q9u9acm4T4XLuvBL8SDnQaRZ5zH7S95eBKj63l+BV+6hF3C+/KFeiau5oqC2fNGr+o36Ixjsm+ibmf8iYaAiYXfTnfsDYVZ/z31g8ZyZiqwj5M3lTw=
x-ms-exchange-transport-forked: True
Content-ID: <D671789B65B2E04DAD34642320C6DFE6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b720231-1ccb-4f3a-497f-08d71afad5e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 05:48:13.2241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_224830_922098_9A2A1A3D 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/06/2019 08:10 AM, Vignesh Raghavendra wrote:
> +static int spi_nor_spimem_check_op(struct spi_nor *nor,
> +				   struct spi_mem_op *op)
> +{
> +	/*
> +	 * First test with 4 address bytes. The opcode itself might
> +	 * be a 3B addressing opcode but we don't care, because
> +	 * SPI controller implementation should not check the opcode,
> +	 * but just the sequence.
> +	 */
> +	op->addr.nbytes = 4;
> +	if (!spi_mem_supports_op(nor->spimem, op)) {
> +		/* If flash size <16MB, 3 address bytes are sufficient */
> +		if (nor->mtd.size <= SZ_16M) {
> +			op->addr.nbytes = 3;
> +			if (!spi_mem_supports_op(nor->spimem, op))
> +				return -ENOTSUPP;
> +			return 0;
> +		}
> +		return -ENOTSUPP;
> +	}
> +
> +	return 0;
> +}

We can get rid of a level of indentation by writing it as:

static int spi_nor_spimem_check_op(struct spi_nor *nor,
                                   struct spi_mem_op *op)
{
        op->addr.nbytes = 4;
        if (!spi_mem_supports_op(nor->spimem, op)) {
                if (nor->mtd.size > SZ_16M)
			return -ENOTSUPP;

                /* If flash size <16MB, 3 address bytes are sufficient */
		op->addr.nbytes = 3;
		if (!spi_mem_supports_op(nor->spimem, op))
			return -ENOTSUPP;
        }

        return 0;
}

I'll do this by myself when applying, no need to resubmit.

Thanks, Vignesh!
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
