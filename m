Return-Path: <SRS0=1wRa=2N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0647C2D0C0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 15:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8027120709
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 15:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSQLJUUu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pCviZxwQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8027120709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNIYlh7uqqQzXJJ8REx6oxLw25ePeBbooTfQ2mM5J0Q=; b=iSQLJUUuzTguLM
	nd/ItB2QrQj7Q132XPpVSu4/PAqVq8/HqhvlJocW3zHEzMelErBctmCxZEyeSzucSegLZdm4eOIh3
	cglk/qhfuBME3Bd+XDWFwxl7N+AjB5LWnv1zjSpej5LSoukCAx8axUPkRvf0tmvM+X4aN3bidDR/c
	85b1gCMFDxDIENY4JL6wpeAvDn2LZSwbJZzMwLRUIa/HaJJsddiy3oy5Lx5vAsvVoh2uQG4zet0zY
	QI4YDCzru8gx2XBtfBf6kNQiAtMFOzsW9mwc56Hbtwf2tqmTbztbbj7OdraoxefRtPaikRpGHAEsU
	CDw4V0DEnE/+KWOt9J4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijPj6-0002Do-RK; Mon, 23 Dec 2019 15:34:32 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijPj2-0002Ct-K6
 for linux-mtd@lists.infradead.org; Mon, 23 Dec 2019 15:34:31 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: dJYdVgX+J51pMhH+N3Vh+UU3VUOr0/VAK/J/ByGapZOAtpHLmKzCRt8nmQeMGz+T7bZwCzhjvH
 OKuzh5yB2s6vSaKUxlUpjPWwMJMJ8PmsNdZop8RzsP2loekVj63pIYwN8qot08cZoU/pnGY3Gv
 lkGzbtEuTohj19nZn+A6aON3YSBRiO3e1eWq+rT1kb8NRjLZUHAIdkgqQePGawgV/gton/PDF+
 H79Q2fWu05HMaWb3adiz8IgQv0T/NG7fDy/QWfnntOXD2Dr7yYOAnqwg1/lfo7b7Ijy0wURj+q
 O2k=
X-IronPort-AV: E=Sophos;i="5.69,348,1571727600"; d="scan'208";a="59951086"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2019 08:34:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Dec 2019 08:34:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Dec 2019 08:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3AKbm+9ll2HJlz2XaKlOtOS52AF0NKGSmVVFVOE9QlF/YUuy7oYBjwK1sq/paBN/xOjwDoCIFo+dIWl3M+sUa6nKSLOzBBSWloLiViUG5MJDBg4pTvM5ywFRYglAJaCmnVvzJvChaRSoR0vbg7R4rZJSj3gl2nO3iU6TZBImigqIoE0PLAN2mGo+nfZ5u29tsoHFd+aH8h7ptFKouuU8IGyiZJVRiMPnb4avmo8YDf8YnKxhJB7qlSBOr2sGfXjq4OqsG1lEfM3m06PxKX3afsN4IlVJUu8jtcKYAL2unGTSntcKR7QMBcl3DGVWP/iXHF5Pn2rUdf05hLZ+n1OjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JW68bYcWCMmKLfuO0nbdjfPlbckcvj7iR60562TTFAs=;
 b=JcSX6SwiAi75NulJQl4boEmsnskzJslCddoEoYV+ofH3KviQ/Z3jgQ+qKSrgT8bA9DFU9U4pWePvefu0VAvcFRBgDDwOpnnWyFsMskcSq8MUUWAEKY4zv9f+YF4fFCvOh2pCS++cXB960DUsweQaoLwgYnlmxTyj+dVDBZek8ljt5OBkNHywTyb2TWLRINxWS+UZQvnYDsQ1UAZpc07kvcUCUny0myQuQvwfM0np0dFxl3igCwPD6UDk5ms6zZm40x3Do7bgdBIgUNDvBUUvMmBarW25Je7KNdZaWNowbrtYgWZLeeIKXscUVaUwSgLUhCswftcv7lr0E/XZrFpzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JW68bYcWCMmKLfuO0nbdjfPlbckcvj7iR60562TTFAs=;
 b=pCviZxwQx5xgrtefTaTyETYX3sXenvPdG+fM9ptY7qxNMogQKlwbNkHoyk6xVfLO8AXeIbzsB3OJEF+rVP/mKsSlhF0UeyfmWzM+6n4ZuorLYftFJFLVgyLjITkw6PJP03MueVbGMy9F29ID5kYB+9mUGPvgjtjQkeQZ8xv1IEM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3584.namprd11.prod.outlook.com (20.178.251.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.16; Mon, 23 Dec 2019 15:34:21 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2559.017; Mon, 23 Dec 2019
 15:34:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <joseph.kust@collins.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for sst26vf016b
Thread-Topic: [PATCH] mtd: spi-nor: Add support for sst26vf016b
Thread-Index: AQHVnZHVQnUd3S3MikaMOTXcv3k0NqezvlyAgAAseICAFCbrAA==
Date: Mon, 23 Dec 2019 15:34:21 +0000
Message-ID: <7d97c9a2-ada5-be2e-fad8-40e26f1be65a@microchip.com>
References: <20191117215547.163120-1-brandon.maier@rockwellcollins.com>
 <ca733470-b953-d805-110c-2696bb9576ee@microchip.com>
 <CAJzBf2Y55hXOpKAFkVwXx2=cX+36t8EuucVniDyne+_yp8eJpg@mail.gmail.com>
In-Reply-To: <CAJzBf2Y55hXOpKAFkVwXx2=cX+36t8EuucVniDyne+_yp8eJpg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.122.210.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 615938ea-b316-4168-e8d8-08d787bd9518
x-ms-traffictypediagnostic: MN2PR11MB3584:
x-microsoft-antispam-prvs: <MN2PR11MB3584F130720D8AFA70EB592EF02E0@MN2PR11MB3584.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0260457E99
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(376002)(136003)(346002)(189003)(199004)(6486002)(54906003)(6506007)(8676002)(53546011)(2906002)(6916009)(6512007)(81166006)(26005)(81156014)(86362001)(31696002)(36756003)(8936002)(66446008)(186003)(71200400001)(2616005)(64756008)(76116006)(4326008)(91956017)(478600001)(66946007)(31686004)(316002)(5660300002)(66556008)(66476007)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3584;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uipgXAAdL7/dKflSo5cTFiaOVGhYfDSPcGFXZdomfPMNjf+zlWux45wg9+P+5NuM2xPYo0wzOj7e+b26IbQ+9gb9Y5RqsFNq3Ry0Da2NcTyQ871wOMPgJn7FbKAe6OaUT2V0ZZlGaetxdQ4k2W02tLhMB811VAo3hTjsTqpNyEjAsGBso3XYolvPj/WQDyrdJGFf+IO/p3kwZnWESlHHsZioBS6a14akBvxprDXC1Pxlnk1UWcnytF4uQ2WxIdDBv8n55nGcivuaYovF4Etc4H5VBQGOi99cmCP4PUM9kFEWxRdRdp3nwGW/y+mtY7XdzicB7Hv45SPB+lxf18V4QsrELVf6mkH8Vlej0dvJpE+GB6nJ/jAopkF+gcNHqtJrRj/WKaMx+Fk/vILOPleZWxmqrnebmMYWc2dBo+I3HwqfPu8zU1zF3gFukR+8UkHwRkX7UAcDBcoBF/87dCYDZjLyGbE7LXpQ+7Di/mQqMMqcS7HYvXjdnMmA2wqN0RS/
x-ms-exchange-transport-forked: True
Content-ID: <35C8BB0F0A8D3640912DDA6C09FF00ED@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 615938ea-b316-4168-e8d8-08d787bd9518
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2019 15:34:21.4611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPV02c2WOQynsr/S9y4l3VaTZnhlHhk4YpmqGjTBhVDwCLSp9WUhQ5F8FeVe05phtJP0x2oQbcoLx6duBK5RSDgDb5zu6ou1ZfYnLKLB8zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_073428_692681_6CE0E9DA 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: marek.vasut@gmail.com, brandon.maier@rockwellcollins.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Joseph,

On 12/10/19 9:49 PM, Joseph Kust wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On Tue, Dec 10, 2019 at 11:10 AM <Tudor.Ambarus@microchip.com> wrote:
>>
>> Hi, Brandon,
>>
>> On 11/17/19 11:55 PM, Brandon Maier wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Joseph Kust <joseph.kust@rockwellcollins.com>
>>>
>>> Adds support for sst26vf016b, a smaller variant of the sst26vf064b.
>>
>> How was this tested, what controller did you use? Did you test the quad read?
> 
> This was tested on a sama5d3 SOC using the atmel,at91rm9200-spi
> controller.  The quad read was not tested.
> Kernel versions tested were branched from mainline 4.14.115 and 3.14.79
> 

Thanks. The commit message should specify what modes were tested and
on which controller.

>>>
>>> Signed-off-by: Joseph Kust <joseph.kust@rockwellcollins.com>
>>> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index f4afe123e9dc..500929903f61 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -2538,6 +2538,7 @@ static const struct flash_info spi_nor_ids[] = {
>>>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>>>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K |
>>>                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>> +       { "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

The dual and quad reads will probably not work because they require
that the IOC bit from the Configuration Register to be set to 1,
which is not the case: the default value at power-up is 0 and we
don't set it to one in spi-nor either.

I can drop the SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ flags and apply
your patch without these if you want.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
