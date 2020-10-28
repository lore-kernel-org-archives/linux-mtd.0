Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1226C388F7
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 15:22:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 277DB247BD
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 15:22:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txf2qGNB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="G1vJG6B3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="jYFKWOBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 277DB247BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mWe+oR/36K+2vHhUlNC9SVajN2wvbkb+H9HeZJKojqc=; b=txf2qGNBbbnZ0XXXNLaHDOfe0
	09vsgMSPfwBA2kt5bzdtClR0hEJd/JUUGVbChRy3fr0prq7pc1tTCy/WcAhvwumEYwXrpZN+glU8H
	xvNp26I66dN7w58pBHg8YHVcI59GHSCbTUH4xHWydmiRQ/JroVnV71ACAGf0X8gD84Ly5gD26ytii
	tDZJ9taiKHBBx1uv/tkqNQs/58UqjOFn8f8ajfHxkQuOVF6V2FhFaOK+PK44iMKCKBlG2RFpCuECR
	L6ej3lH52sWu1/yeOQg5SVRAduuMw84TJgL25buW/73+YchK3VvVSxr/jpIrNOx4qfiaXvMjdt/IE
	n9Cw1s+Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXnGC-0000n0-ES; Wed, 28 Oct 2020 15:21:12 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXnG7-0000lS-HZ
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 15:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603898467; x=1635434467;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A+9m0pFs0ir54wp+MgVZWoHjwig2VWrcIw6C6koOzAw=;
 b=G1vJG6B331t/0z8pSb1jcBoexOYXkoPTynFeJDiZQuEqU8IEgikvz/c5
 hDqDM7R2jGEZj9sGzdf+N/DmJ/fDDraapMG9n3IxQniv/lZ2aoSe6LOi4
 9tReAgux3+8Cq7lulH8W4a180cJhFtMebZNBNKOGlnLo2ql9znWRMCUdp
 MFtrDUmdyPOJqmxcTq2UXV7ssfFLOTVAEa09t/jY4VTyuurlp66tl1d+7
 YXFmK2CQPnlyFGsotneipMPQ5Of3F+gfRvLDNiNIqZK06143T1LR4nddk
 z0knnqPhBJcT+ixsiqnuD/UVV48Ozd4c/qoJPRjyLooJvtxTuyYl6+or+ A==;
IronPort-SDR: OHaSpts81VJrZU3iqxFKLDYwWqFkBB2PlzdZGx80vqJpkRCspLIv+BUCz8wiVLaTGK04eeqVGH
 oPLYWSGVfwGNK3o9gfxI0k2H9BKr5/XbNoYxHxl9jljhx9EhNksdxSZIb3OoY4QFKXTXsc8x8p
 SBcmzxTj3I/u3aZmOhRcwgyDRA5lEGdaNz4UPu+RKRiFp0r3pamKapm7hvtS+7iD5FWVuNPqVP
 olwk1RX8a4oz8CxKDvrtlHD5A0npTYaqjww+ZY0UMpt/eYLbGhqqnxKsgZ/lTrsP2qfpY19sxR
 +Vo=
X-IronPort-AV: E=Sophos;i="5.77,426,1596524400"; d="scan'208";a="94251028"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Oct 2020 08:21:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 08:21:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 28 Oct 2020 08:21:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRKeDum1wqftGazLJknVEvZ6QzdqkUhoBSNuJWiqED4+eylT7NgWIBHFAHOEOq4vN0gQBfL6mQz5EBLsS9/dqP5KIIR0jorfgZEfopWQfCrIqeABVPGQVeHbDFB8EzoXsRloR9Dp8duLFGibjjDBAbW0OtOf6fiTgM38bqoujNHhHGDCqS0FsNaropFe8YcBMvVeuB4NeeUpCn9E83nnz4hOzj7jQJDFbtck3fldZYHMiwS4VT8Hw/ys0stAREix7mvJh/XbsI1MPVERN/GO53eSwCbtO53fbWzdJ9HonLSCArf0QR72H+krkI9hqJY6xGFQDYBkYd85ep2yvVH8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+9m0pFs0ir54wp+MgVZWoHjwig2VWrcIw6C6koOzAw=;
 b=nRYGZVPD9hhbATwVNnZwQMtCg1yapQu67EgND0Nk3L0GoR8VmmZo/qCV2MqfDQeTgb5hNS6HQDAN/rYBskjIaI+DrU/XxoLnRJkKHqWgcfcskr1+lzGoieN70FzaLE+kQhUYjXLvJPqrshfP02h0DHQtEgiSRjC8NUztNllRnD6Zpqe4FhaViAv8jUqAWNNGqd14uEhPBGR8X7+2LPyS9N3gYh8Ge1gfl0HFHJmDpc4/FS8mqeJhoY1vofEc3iyFkqR0KoKnoT77co7VcEsm6MpxDnzXgvSB2Nrvqgs8B0kGmdvjcfsIb2iuztxtI3cAFWie7mSs7c1KeS8g97c4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+9m0pFs0ir54wp+MgVZWoHjwig2VWrcIw6C6koOzAw=;
 b=jYFKWOBHQ8wf133X07PhQvH5nhX7OkAUBfWJPOQ947M406wqG8enFOhJDONEfKAf5jcfxacGI3LdcjsIJwflwGqX/O6348AqyTkabo2gUQsh/Abj7VK+0xuXPo/932qhCNPDL6dtusSTJ65XDoRP8l2tbRUzN8ZfpAP2oZKmo9U=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3200.namprd11.prod.outlook.com (2603:10b6:805:ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 28 Oct
 2020 15:21:02 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3499.027; Wed, 28 Oct 2020
 15:21:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
Thread-Topic: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
Thread-Index: AQHWrP9znYtyl4SgskmwPX4NHXsKvg==
Date: Wed, 28 Oct 2020 15:21:02 +0000
Message-ID: <d9d96eda-4cb6-fe68-7469-e73dc7ba2fda@microchip.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <d0d702c1-761b-1480-c74d-135193b33c26@microchip.com>
 <20201028124920.pot77v4phkqiswhr@ti.com>
In-Reply-To: <20201028124920.pot77v4phkqiswhr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.107.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69d7fa1d-3f8e-45f0-3ade-08d87b55150e
x-ms-traffictypediagnostic: SN6PR11MB3200:
x-microsoft-antispam-prvs: <SN6PR11MB32006C376F861E3B382AF016F0170@SN6PR11MB3200.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ufvSZ/7yhTYe9/HNzDj1+CCevMdTu3pqmiXBpg8n5I9Kq4THjKma9GvYZqDt2+UWkrx2Lh6kj9UkSmw4vweCQdHboBaqOPqxWhiLWmrAKmJTz98vQIXU16Mo4HkgM156kBqKy4JzTW33/s1xdBxV5a2lQRdb9DsE9HuFbrCfwmx1UvLwP26HBgIaljBrNUJ0GUqbhxEUGYN+MOPXfdjvPrBZNWBFGPmdMLp6bp3b+yI0+NI5or0abDZq4mXobWxKcs/7SmlXoofzbjJ6lF2EtLxsR0PpFLF5XtaDdR6flbgSVba5dm7kvo3iT8kcYOg7DjAjmjP46jW3Lhm4yd700laME/Q8XUk0vFYY0Gh6AjkOX9XVAjnKe/Yhnl7FFwb0uLjg2gTCPZU6YjeT0WbAA+Fn243njDaFt7VNWA4pBoyl6n6+IWKjanI4As59TQwU3FUg1fJZ9ybU3BjbHKgTtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(346002)(366004)(136003)(54906003)(966005)(6506007)(4326008)(64756008)(2906002)(36756003)(316002)(186003)(71200400001)(8936002)(478600001)(31686004)(26005)(5660300002)(66556008)(6916009)(53546011)(8676002)(6486002)(66446008)(86362001)(66946007)(6512007)(66476007)(2616005)(31696002)(76116006)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ICaW3/lxo6f2jHXcYMtFD2OT3bZkTE3TrGt0MLBFhhqaLcv6hQvtrWE/gRpRey5YRnVxmgi7fkvvyBV0mxxo3wtV1eY7Da5poPMDYada3orehVIEM7vvnNoaxfj3ZYCwy0Z0OSdslPhR9CaLwGtwfapcC0WJtuk84dRE/FF5MIX3Ucjn8S1xDiq5R/N0hAdAMX1OS8MRpb68ZBHTHjRmRQ6faJ2TPNKM1irE3LtJu2th/+2KnUX+PGaAe96sD+cfORwAhrBG6sXZy26jQmDcTfD7/raJkLx/8QtsAEBpDySL3zQ1QiE9b5N/DaQpfvjqWAtKgEbAEawZZxI0Xx4whbsIK2ANeCkLSG8hUpGz2qHCQppLqXB4IUnWkm0DWQalojrQ2XerDMsWBY4yKAiLyrsUyLYqHjFTuBFK+nN7H3xwntEZHIUl+mCcCWwNa5t3sMJCV7bis+6lmZXHvW6pFhLp5OzXCt0bYwhkuQnFDKR3xNBXNe5RxkiuXfMtdVHHe1cj/0dJiBLbuaJ0PvXLtsVLYz9Tvz9WcX4LGZYExci+BDLDvKaHNB2m5ltDwmAoLYjzynR/iFNo0LfYkRzGKtalFgwEkXE2R96kMNauxnz5X3FAMqoFyqu6W8XB0XOxCYCYjeBxP3WmuTtW8S6gBw==
x-ms-exchange-transport-forked: True
Content-ID: <8BEAC9624A6D79408A943E70818B4767@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d7fa1d-3f8e-45f0-3ade-08d87b55150e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 15:21:02.7968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QLdU8X52V8S4ENl3iEjS6SkEb7F2w7eRFk/a+8/TikRThTguWU2VemsBoUXJmS8s1U+oMUVYWittR6+HmHI1HqvlwZ+2Od/M4D/Dnj+4sJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_112107_898355_F5C49E89 
X-CRM114-Status: GOOD (  20.77  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/28/20 2:49 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 28/10/20 07:53AM, Tudor.Ambarus@microchip.com wrote:
>> Hi, Pratyush,
>>
>> On 10/5/20 6:31 PM, Pratyush Yadav wrote:
>>> Tested on Micron MT35X and S28HS flashes for Octal DTR.
>>
>> Do these flashes define the "Command Sequences to Change to
>> Octal DDR (8D-8D-8D) mode" table? Can't we use that table
>> instead of defining our own octal dtr enable functions?
> 
> The Micron flash does not have this table. The Cypress flash does. The
> problem is that one of the samples of the Cypress flash I tested on had
> incorrect data in that table which meant the sequence would fail. The
> newer samples of the flash have the correct data.

Can we differentiate the Cypress flashes? Do you remember what
was the incorrect data?

> 
> I don't know how many of those faulty flashes are out there in the wild.
> IMO, to be on the safe side spi_nor_cypress_octal_dtr_enable() needs to
> be implemented. So from the point of view of this series there is no
> need to parse the Octal DDR enable table.

Meh, we cover manufacturer's mistakes. On the long run, our aim should be
to follow the SFDP standard and if a flash implements it wrong, to either
fix it via a fixup hook (if the fix is minimal), or to skip the faulty
table.

Regarding "Command Sequences to Change to Octal DDR (8D-8D-8D) mode"
table. Have you looked over
https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw/
?
Is there a standard way to determine the offsets of opcode, addr and
data in the cmd seq?

Cheers,
ta
> 
>> I see that Mason used this table for a macronix flash:
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-4-git-send-email-masonccyang@mxic.com.tw/
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/1590737775-4798-8-git-send-email-masonccyang@mxic.com.tw/
>>
>> Cheers,
>> ta
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments India
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
