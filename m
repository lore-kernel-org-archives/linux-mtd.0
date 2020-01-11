Return-Path: <SRS0=phPz=3A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02F1C33C9E
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 13:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 800202082E
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 13:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHU1woT/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="oEAo8E8p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 800202082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/PoEEuMpqe3tpDkEiperKkFGGgBUaXqmtlKbA5mTHQ=; b=QHU1woT/QjRd2I
	CxwnNk8jwJusdhUAFcMJoqHHNAm4+Pn2EnArL8APAfLR9VS4n8SmWRzO9XTq0Agr/qtrbURfwdS/1
	7SM/YxpJtpJjXkqz/9JHBRrdygSybABEOIB5RCgAgJuU2CYAUyKX0PE2sNAYWaOYxYL+sJkci26+U
	gx4ASmi63rGMdq6Sr9Y/rlCfT7T4DO89OR7R1N60Pniq/FN4wVfhqp+pUSxHyGg/6hZLdqdIkp22z
	W6OKvvvQB2D99fqVTfzngElKqArkezfczZBaE2HDjUsKmI/6UirHFYSMEdUOQeu8TLOLgqJaxZcMO
	k0KUZOQrIvyZXzH/8ZYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqH6S-00088M-G0; Sat, 11 Jan 2020 13:47:00 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqH6K-00086N-EH
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2020 13:46:55 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 4neUknRqleX83RXlv40EiWD0BSBtAQ98R6Tt5pbH4ofqpNd0OCuqI3Sjq39kFBYobic8grhva0
 dl/TnqHTzPhLUaci1TD5O41/cSHBsiD65bNCjqzy5jgBVI+725N4mZnGU93LKqp7kfpliCD3RK
 XsN5337UTSyLexDysfg8lG1Ua6AoeD0Ri5mxZ/7/qO/ZcAnxV++YBpyGQgg6zDPbCDzoVd1XEv
 YrAL2ZeMDvR/69AeI4y4cBpTTfR+IShv9vM0VyCC8buiCk5cpSFGKGsuPbBaTfK24nrtnwnyBf
 OTw=
X-IronPort-AV: E=Sophos;i="5.69,421,1571727600"; d="scan'208";a="62326724"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jan 2020 06:46:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 11 Jan 2020 06:46:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 11 Jan 2020 06:46:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nl13XybmnUxJwFs06vdgmKC2PFQY7B7MrJWxkupj4EBUVNOsVzuyxx4tSUczJfxQ9uIgIDaIskTcduw835afD7xLID2g+4VYNsBgAqft/DoTqew70e4361PcfXBv10SzdIO4549oCO0a4OkZlpv8OaxBLCt6w1+VOHMGRTHOinfZaCvYbXmHcNFn8JV0C/411HrU6QmP8hjRk/kzBa42MvmNxmbbomSVXu0cGnX4mEJKrigtKNjlEJ4UXnsSdCF+BKVqSlI7zQekc6teOBuI7sVYedJEKPBaedLIqJ9vAuWLUQEYCgfqb7No2coTvh4+5VKTO//qigXEVBdG2XoRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jo62Mv6RNzfUDY2dN9bb+JfxJCyeopM3CxQMZfGZaXM=;
 b=DnVRTWg4B2JaQWSCdOmW9+R8ZmZAPvkSx4heRTY9Fs4KKMjiZwUH7zWMxqD0TVSwado4Z6duTS7iDyde72zb2lTMWY93qKOyKBX553q+lDPDD1fTDWV9DGe51F1oYBlajv/Kx6nqzUtpJ6E0a42NAOr6UkLzXvSjJopoJB54oy9GmbWEB9sVIoUnend5QHJ2lbKprvk8PbAzW9OwbW88zWtX6Oih0OpPMLnMY0ZnXnzZJYvjgKBVoU2MxexEaJ4AgVJOConDfEUKIUOxIqoWGlDUwGdsqnMOhHouG8UlBnKdq37mSbUd26bz9lhmpFW5Zto+pNA0DKBDFCo9y4Kx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jo62Mv6RNzfUDY2dN9bb+JfxJCyeopM3CxQMZfGZaXM=;
 b=oEAo8E8pqwcc17HTYFAqVqYQHzAajTCL7qd1hzlZ6C0+DkRGJQg6JMn3txOCx8dejVZHb0JoFRNRDJ+b4QuK714y87JJna/N+W7is1xFJIpAqPA+7Sx6zaTlpl1RvQC5mL5sa6e7qo62zTHhG7H2y1U178g+4zytlVgIMrzFyEw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3839.namprd11.prod.outlook.com (20.178.254.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Sat, 11 Jan 2020 13:46:40 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.013; Sat, 11 Jan 2020
 13:46:40 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: keep lock bits if they are non-volatile
Thread-Topic: [PATCH v2] mtd: spi-nor: keep lock bits if they are non-volatile
Thread-Index: AQHVyIWMlxFjXvTu+EGjJ9P1l4qrMw==
Date: Sat, 11 Jan 2020 13:46:39 +0000
Message-ID: <8187061.UfBqSTmf1g@192.168.0.113>
References: <20200103221229.7287-1-michael@walle.cc>
In-Reply-To: <20200103221229.7287-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec322142-443b-4902-1ca9-08d7969caf8c
x-ms-traffictypediagnostic: MN2PR11MB3839:
x-microsoft-antispam-prvs: <MN2PR11MB3839AC5329967C3F933770F5F03B0@MN2PR11MB3839.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0279B3DD0D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(39860400002)(376002)(346002)(199004)(189003)(54906003)(6512007)(9686003)(478600001)(316002)(5660300002)(966005)(6486002)(76116006)(91956017)(66946007)(81166006)(26005)(81156014)(14286002)(86362001)(8936002)(66446008)(66476007)(66556008)(64756008)(6916009)(8676002)(53546011)(4326008)(186003)(2906002)(6506007)(71200400001)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3839;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lI++594xO0ugH4EF084Kjs7v/TWUrqVi8UnUTyEGlolKS6far1FF272SmlDjWkY5T750RJDHde1DPu4axvBmb/zPOG6n/8fA23Yu48ToRU4BIA22S1Hg/3lGhwziBpjvDqA3BzSX3AME2Cg+TgqoeRBxmqktz6jU51cjDmEX8rOO4nDx7AUGdwjdtwlD5iIv485D9BXPpdp1HrPWuvCLjpdTQtOE8GmMELAVTC7V3nCP4Dwm8JvXU/+LMQF6n6erKYPFWCdBn59QZxIi6eFgAxqFNOWYxrP19vothXTZhtvZ2kJOdkz4vcSUGkYyf7SJ0vX/5n7hv1aghWec8Df3hXO+bx6ekIjN5Sqh+Qua8ZwRKmqgOKuT7R8vRQgdF5xxO3XTYRN0Ji0ny12nTknvjW8oZtqMscSJb2xosEMtKGzWR8eeLFGTlGWLCl1a/0lzCW1XShdGshIMNdGefndrWBKAfvNQhM3qdR0sH2Ux+m2vI+jZ/V23en+7Uw5zcwcmCOciUPezhoJi8QIqZ9qvoPK0tNDcb+dR1wf3Yl539r6cpiucWmn/RY+dweUZKXK5
x-ms-exchange-transport-forked: True
Content-ID: <266AD8ED94A09A4D810CCBEAD4BF36BE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ec322142-443b-4902-1ca9-08d7969caf8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2020 13:46:39.8735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtJ2tFnvzCpu8A5BwSYCi1VOVKflsoZJNRSoi3xx8Q2i41rSucmjZ9+xxHJU3emSoyyxhGpVbO4TChIWA+LzJPpngd/tveqbKKwncUtpRIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_054652_535954_886A0757 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: marex@denx.de, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, michael@walle.cc, boris.brezillon@collabora.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael,

On Saturday, January 4, 2020 12:12:29 AM EET Michael Walle wrote:
> Traditionally, linux unlocks the whole flash because there are legacy
> devices which has the write protections bits set by default at startup.
> If you actually want to use the flash protection bits, eg. because there
> is a read-only part for a bootloader, this automatic unlocking is
> harmful. If there is no hardware write protection in place (usually
> called WP#), a startup of the kernel just discards this protection.
> 
> I've gone through the datasheets of all the flashes (except the Intel
> ones where I could not find any datasheet nor reference) which supports
> the unlocking feature and looked how the sector protection was
> implemented. The currently supported flashes can be divided into the
> following two categories:
>  (1) block protection bits are non-volatile. Thus they keep their values
>      at reset and power-cycle
>  (2) flashes where these bits are volatile. After reset or power-cycle,
>      the whole memory array is protected.
>      (a) some devices needs a special "Global Unprotect" command, eg.
>          the Atmel AT25DF041A.
>      (b) some devices require to clear the BPn bits in the status
>          register.
> 
> Due to the reasons above, we do not want to clear the bits for flashes
> which belong to category (1). Fortunately for us, the flashes in (2a)
> and (2b) are compatible with each other in a sense that the "Global
> Unprotect" command will clear the block protection bits in all the (2b)
> flashes.
> 
> This patch adds a new flag to indicate the case (2). Only if we have
> such a flash we perform a "Global Unprotect". Hopefully, this will clean
> up "unlock the entire flash for legacy devices" once and for all.

Thanks for the detailed explanation. Unlocking the flash at probe time was 
badly designed from the beginning, we should disable the write protection only 
on request, to avoid destructive commands during power-up.

Breaking the backward compatibility is a no-go, and looks like you break it, 
by not treating case (1). We can indeed continue your idea and treat both (1) 
and (2), thus disabling the write protection at power-up for all the flashes 
that we support as of now (in order to not break backward compat), and to not 
disable the block protection for the new flashes that will come. This means to 
have some point in time before which some less fortunate flashes don't benefit 
of write protection at power-up, and after which the others benefit. I 
wouldn't got this way, I prefer a generic method that handles all the flashes 
in the same way.

I see three choices:
1/ dt prop which gives a per flash granularity. The prop is related to hw 
protection and there might be some chances to get this accepted, maybe it is 
worth to involve Rob. But I tend to share Vignesh's opinion, this would 
configure the flash and not describe it.

2/ kconfig option, the behavior would be enforced on all the flashes. It would 
be similar to what we have with CONFIG_MTD_SPI_NOR_USE_4K_SECTORS. I did a 
patch to address this some time ago: https://patchwork.ozlabs.org/patch/
1133278/

3/ module param, the behavior would be enforced on all the flashes.

Preferences or suggestions?

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
