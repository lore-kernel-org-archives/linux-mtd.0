Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3FAC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:51:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D9B208B6
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MFV6bQVI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ExO2jdqa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ADCmuwjm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D9B208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5innn4oA9ZzcMz26O970BV6IPn4M9tqToK1tX0qqvUY=; b=MFV6bQVICxdXTjBUyGzwWicaR
	xT3BrSDKPNcSMtJM22pnkNP0rdI9HvZ/SOQqAD3rFugzJrV/YdRav13lEIYDgdkEIgOckqpKT/4y0
	KvRK1H5B+ZttbvQumI/yel6mMF4WRjLeF5/gWy2Fff70tHlQtnPnt7G0pv+VoiM0UNCAmMHjxHpNP
	JOeA64bh6CnyzhQlHLLx8DO2LYduAav8MRM3N7QwJRsakZ8V8wd8Q8v7TVhd+qyiXAyZo/t5mcRVO
	8e0Sah/MKqFzQmb2xMNBVaejscTW1kGGIHbvi3lXgdn2maTzxhmOKieFLbm/jrpEKMGfx4a4YBnCg
	MdEqRm00Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNuIT-0006IO-8W; Thu, 01 Oct 2020 08:50:41 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNuIP-0006HN-E2
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601542237; x=1633078237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nHvLqxWV1lW1hlcibBNr2ybo5+O9dD0f5EBspMTPnWQ=;
 b=ExO2jdqa9qVaK5rlz1lXTKWOMtFnPNbnF71AguF2cBCeyOcvb9Msxd7k
 cbT+FTFmqa0g/N0Z8GaxMJJ4tkbbxiqnOZm44G5HcJ8cdqqqS4b3n26LQ
 OUOqn6MKm+nq3QK7XPxLezdlCDzD2OqFKE+NiFDCcLXE9MAUFD63ku9nd
 Vto2zkxatX65JnlUQCDU8f425y3jipDNePtbWnmsx3m5qsn99XBR+M0dI
 GMt+pmscnUBu24DYK+ZKkc5pguHdNABMNnczZKBJenqBCAYSijUWi0wvY
 5pr0lGYnF37Vmyai8UlDAe8UFJJh3TczQo91GJU2enN5We+rHxGT9aodL Q==;
IronPort-SDR: Pukc1AfvsCie9oAWSVJr2KBYoFbcl2ofSk6moRimfwoc8ArH/4sKDbeYDJPwgYve9T54Zi2wDW
 VU5OOi31ovfr1EdkgRUDjkQOsXq1MHvdacApZ3zy4zFsoSOHnQ2KiTr68HnsRvB2fDRw2cApF/
 O4CdjY7FpQQaaKNPWkntAsZNDAROslJ0CkRf35jIgvvQTEdw2HumEDr4++uJi/0UTl1c6Z0hUM
 cjhFSE3QBZLiOvvxIn9OPN7HiV5/qXUZtAt6/qtwC6dl+u+EYdq4194Wg+RlA5YXA9M/egweA7
 fWA=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="91057960"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:50:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:50:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 01:50:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qf+34J4vyYUWv1vQt7cAwn4XTQXCphEc/UHqMZiIvX6RKe7Fl20pUpN8rk87NNzDGQkpewclKYIOlsUIy09AizApZMr/vE6z00HFENB3l4M0kg5iagcoVrPbTns80/aZZmlV/K0ltAdT4q/vWPHEiKi/9bJhOEOHV3LshbmOw5Df8ec2DAvckQbBVKq780dFQeavogLrs2Phn9gkaQd6GKGvLDbwknjFbLez64+edN5jWWH2HJD7U1BGsnrJC7rKnwBwICnbOp/CgVJqb/thWT8AngAHHnx9dDFR8U+t0+jFJN1647k6wLoRTHAl5bWpgjXt0pgwlp9hwC6WCaEzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHvLqxWV1lW1hlcibBNr2ybo5+O9dD0f5EBspMTPnWQ=;
 b=dgzoHLtAkzPmt6K/Tufx6KIrHQpYzw+p/iwlJJwwN53HqyVRJrfdD8nWJpba87vAMF9g+pWUu/GKuYdIybvKfLh6sV/9RYzRHCTYEfYAD/6tBCVnX37bTkTbhLf9rTpEB1V0HwF7VSMSFlHmHBhItRKpFbYwNm75hx8etpeNDhVM3bshsfevkNSZDuVCobcRsSRD4VLtsTOq1Px9vWUe8M+47TPYlgPDLEzZG2GKjeLx0kvQ6XPhTLCwwbi+zeWBXJVtG0QXdOVDELfA0iqtUw1QX/shv1ERYrvUXyjab9pO6hP6cT1RomFJuRB4eq0YV4pQPX61PBq3Lij4Bh/rdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHvLqxWV1lW1hlcibBNr2ybo5+O9dD0f5EBspMTPnWQ=;
 b=ADCmuwjm2NXY4RGnpiqaY6wmHHOQUB5sT1PBS5pDwIcBN1+KTcc2sGeHymx9kpE3jzSeDEnhV2XbPGh0VXqDrfn77pd9XiqPxiY79OU2gx2soxiflewZZNnYDC9PJcQOIVDttWxLZeHQAYBR+MKFKqRkQ4EpsRK/hG48lgeThfg=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB2667.namprd11.prod.outlook.com (2603:10b6:5:c1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Thu, 1 Oct
 2020 08:50:33 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:50:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v14 14/15] mtd: spi-nor: spansion: add support for Cypress
 Semper flash
Thread-Topic: [PATCH v14 14/15] mtd: spi-nor: spansion: add support for
 Cypress Semper flash
Thread-Index: AQHWl83DTXjWYxo3bEmDQEKhOT98Hg==
Date: Thu, 1 Oct 2020 08:50:33 +0000
Message-ID: <1dd3b793-f159-2454-aafa-a0f5706cc581@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-15-p.yadav@ti.com>
 <b5663e72-b67c-cb2c-e46c-62262a65cd44@microchip.com>
 <20201001084012.wumsndtwe4qeuklt@ti.com>
In-Reply-To: <20201001084012.wumsndtwe4qeuklt@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9fbad0f-9c26-44cc-336a-08d865e70f0f
x-ms-traffictypediagnostic: DM6PR11MB2667:
x-microsoft-antispam-prvs: <DM6PR11MB2667CAD5AB91739A5F5ABD4CF0300@DM6PR11MB2667.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +k74a6YPAOwhsgNeSaUdFL1M7hGEeZeZHsX/gQKZlP5UHaB9AI+F6neargHyaBJeHF5pVpwy9M2b1HLdEAytLfohzkaMRknqdaXjO+QytJaK4ZyDLZUEXwntnNpNkfZ9QKBfSIPkwSniefgq2o/fIla8rcK3p0ogV3rRjXTRGireF/VWZ1Va3PUJsP5vUU+6LinP1Fdd7J51aqKHXQtjHbbmVOIFBCXIPgFbGWSmtxPNfD+0zrUsJOIZGWIo42I2xBWIhst0p/YJoBTSmL8R4AZAQstP3c0iyFFbK6zOAO7O6sYEM4IdrxNWBNJtz51O2OJyVQ4on67sw8psubHzE3AcA9Kf3nYLbZDFC24LDTFIUa1iUj2n8AsYq/v/++Dt/su/oc+dxAsV9Qt0PLfZeYAnvQJJuyhmhtQSK58K5Ba3g/hGrRR428mYgiRpf9cJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(31686004)(36756003)(4326008)(5660300002)(8676002)(8936002)(53546011)(186003)(64756008)(26005)(83380400001)(6512007)(6506007)(2616005)(6916009)(316002)(54906003)(31696002)(66556008)(6486002)(478600001)(76116006)(66946007)(71200400001)(86362001)(91956017)(2906002)(66446008)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Zo2/nxvCArWKYeDIBb9NiTftlQsyDHqUBbrblnfqaN4Kg9JFsik8sqwDthvN4sBqCpfOOlIrYiXPRt9L4Obh47tSRqWZG04xd1ZImadvT/vMGPqlCOOWdXlBFrq8CIOy+12LzU6yIDRMfCcRN3nFIdrlR+fuw52LusDMsQHXSiv3d7u4CsQIeGHG/lAC+l0c+1iektT7zJrNNQ0mhS0RPOkMRo0iJIgpA5oxf2pTHEJawQA72LuOoNKxcG7cj/jnN1Veip36S1XerTHQkLJCt463AFPlxCXZXyBv+us9gfqGKOIiXdbksWKNTINwxBGmbzlUAV2RRz3dgqjmhm/ZcaNN6Sp0KJQOKV78T/26AvV/1CPBEvr/ceVltIKzSnA+63ZlVEkNbxwJeNAtYetZTH7hRc0UGX9mWAyw7tb+nrxVBSc/x1xyxxJ0Sbuf+ch0LyOuBNA32x8wJMHbcO0HstJ5lz5iauzX7Ln0CGlZefmiCC+yISXKUJuqkkuwGCvuPIiC0X9AtkrBxe2CGHmwdYU1Ech0Bbtpx7Km8awc2M/g7zWlmnsK83iKtyhGw6/mLIfwipLPtCIW9n2Tuy+RwhBw0r5q+lOxeQoA15Ym9bi+gx0EWpSoDgPpqhgz04ZolBfFiQwGboia0KTDskz4lg==
x-ms-exchange-transport-forked: True
Content-ID: <38ED89CA87691544BE8BE2E49AA64D0E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fbad0f-9c26-44cc-336a-08d865e70f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:50:33.6021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MoVkh9mAAqSGVHDZ5G8McgFfkKx0doOTbzzzjG+5o2jlDyEnEBOo+yyhs5HoIrqU8vFDN2934mUYGLYh+QWxSG3mRG8XH/Rj56N/d/5+8YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_045037_689566_06753DD5 
X-CRM114-Status: GOOD (  24.09  )
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

On 10/1/20 11:40 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 01/10/20 08:35AM, Tudor.Ambarus@microchip.com wrote:
>> On 9/30/20 9:57 PM, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> The Cypress Semper flash is an xSPI compliant octal DTR flash. Add
>>> support for using it in octal DTR mode.
>>>
>>> The flash by default boots in a hybrid sector mode. But the sector map
>>> table on the part I had was programmed incorrectly and the SMPT values
>>> on the flash don't match the public datasheet. Specifically, in some
>>> places erase type 3 was used instead of 4. In addition, the region sizes
>>> were incorrect in some places. So, for testing I set CFR3N[3] to enable
>>> uniform sector sizes. Since the uniform sector mode bit is a
>>> non-volatile bit, this series does not change it to avoid making any
>>> permanent changes to the flash configuration. The correct data to
>>> implement a fixup is not available right now and will be done in a
>>> follow-up patch if needed.
>>>
>>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>>> ---
>>>  drivers/mtd/spi-nor/spansion.c | 160 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 160 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>> index 8429b4af999a..dc6b14aba405 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -8,6 +8,161 @@
>>>
>>>  #include "core.h"
>>>
>>> +#define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>>> +#define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
>>> +#define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>>> +#define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
>>> +#define SPINOR_REG_CYPRESS_CFR3V               0x00800004
>>> +#define SPINOR_REG_CYPRESS_CFR3V_PGSZ          BIT(4) /* Page size. */
>>> +#define SPINOR_REG_CYPRESS_CFR5V               0x00800006
>>> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN    0x3
>>> +#define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
>>> +#define SPINOR_OP_CYPRESS_RD_FAST              0xee
>>> +
>>> +/**
>>> + * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>> + * @nor:               pointer to a 'struct spi_nor'
>>> + * @enable:              whether to enable or disable Octal DTR
>>> + *
>>> + * This also sets the memory access latency cycles to 24 to allow the flash to
>>> + * run at up to 200MHz.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>> +{
>>> +       struct spi_mem_op op;
>>> +       u8 *buf = nor->bouncebuf;
>>> +       int ret;
>>> +
>>> +       if (enable) {
>>> +               /* Use 24 dummy cycles for memory array reads. */
>>> +               ret = spi_nor_write_enable(nor);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               *buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
>>> +               op = (struct spi_mem_op)
>>> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
>>> +                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR2V,
>>> +                                                  1),
>>> +                                  SPI_MEM_OP_NO_DUMMY,
>>> +                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
>>> +
>>> +               ret = spi_mem_exec_op(nor->spimem, &op);
>>> +               if (ret) {
>>> +                       dev_dbg(nor->dev,
>>> +                               "failed to set default memory latency value: %d\n",
>>> +                                ret);
>>
>> Why do you consider the message important? I'm asking for consistency
>> reasons, below on the next exec_op call there's no dev_dbg message.
>> I would get rid of the dev_dbg entirely, the error code should be enough,
>> but I agree that this might be just a personal preference. So, do as you
>> prefer, but try to be consistent across the code.
> 
> Yes it is mostly personal preference, but I don't mind either way. I'll
> drop the dev_dbg().
> 
>>> +                       return ret;
>>> +               }
>>> +
>>> +               ret = spi_nor_wait_till_ready(nor);
>>> +               if (ret)
>>> +                       return ret;
>>> +
>>> +               nor->read_dummy = 24;
>>> +       }
>>> +
>>> +       /* Set/unset the octal and DTR enable bits. */
>>> +       ret = spi_nor_write_enable(nor);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       if (enable)
>>> +               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
>>> +       else
>>> +               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
>>> +
>>> +       op = (struct spi_mem_op)
>>> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
>>> +                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
>>> +                                          SPINOR_REG_CYPRESS_CFR5V,
>>> +                                          1),
>>> +                          SPI_MEM_OP_NO_DUMMY,
>>> +                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
>>> +
>>> +       if (!enable)
>>> +               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>>> +
>>> +       ret = spi_mem_exec_op(nor->spimem, &op);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       /* Give some time for the mode change to take place. */
>>> +       usleep_range(400, 600);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void s28hs512t_default_init(struct spi_nor *nor)
>>> +{
>>> +       nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
>>> +}
>>> +
>>> +static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
>>> +{
>>> +       /*
>>> +        * On older versions of the flash the xSPI Profile 1.0 table has the
>>> +        * 8D-8D-8D Fast Read opcode as 0x00. But it actually should be 0xEE.
>>> +        */
>>> +       if (nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode == 0)
>>> +               nor->params->reads[SNOR_CMD_READ_8_8_8_DTR].opcode =
>>> +                       SPINOR_OP_CYPRESS_RD_FAST;
>>> +
>>> +       /* This flash is also missing the 4-byte Page Program opcode bit. */
>>> +       spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP],
>>> +                               SPINOR_OP_PP_4B, SNOR_PROTO_1_1_1);
>>> +       /*
>>> +        * Since xSPI Page Program opcode is backward compatible with
>>> +        * Legacy SPI, use Legacy SPI opcode there as well.
>>> +        */
>>> +       spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
>>> +                               SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
>>> +
>>> +       /*
>>> +        * The xSPI Profile 1.0 table advertises the number of additional
>>> +        * address bytes needed for Read Status Register command as 0 but the
>>> +        * actual value for that is 4.
>>> +        */
>>> +       nor->params->rdsr_addr_nbytes = 4;
>>> +}
>>> +
>>> +static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
>>> +                                    const struct sfdp_parameter_header *bfpt_header,
>>> +                                    const struct sfdp_bfpt *bfpt,
>>> +                                    struct spi_nor_flash_parameter *params)
>>> +{
>>> +       /*
>>> +        * The BFPT table advertises a 512B page size but the page size is
>>> +        * actually configurable (with the default being 256B). Read from
>>> +        * CFR3V[4] and set the correct size.
>>> +        */
>>> +       struct spi_mem_op op =
>>> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RD_ANY_REG, 1),
>>> +                          SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR3V, 1),
>>> +                          SPI_MEM_OP_NO_DUMMY,
>>> +                          SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
>>> +       int ret;
>>> +
>>> +       ret = spi_mem_exec_op(nor->spimem, &op);
>>> +       if (ret)
>>> +               return ret;
>>
>> no need to wait after CFR3V?
> 
> It is a read operation. We don't need to wait after reads.
> 

oh, yes.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
