Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5042CC388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 13:29:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16622076E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 13:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fmc0nWDq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="E1RG6fD/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Uj/5W0F4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D16622076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jB0P5k45Bb2AEx2xNR+XAFNilaKgsWd/GYfvZG5qEpc=; b=Fmc0nWDqxTxhrqslgv209utMk
	uvr2MCqLA6LblCyva9pihCnG8CxIeH1f6tz36d/UWoOGwKAcnMcSby6xO+r/P0DoOCQ1MZPnexId/
	kzsij3TZARuY5F/6WjzQnagE+Jb/ULddrvHXHolfFAIneDueGDptmfPH/OQni+8UekeqsAtadaTM/
	bVlvAWz278KorsJv4Az+N+6HaOWBoNFz4RcVmlFzlTNid6F5QhHiYxZKuFYZRXitZmJqDMaf77fG5
	69Frkvrwg1SPTigbG8L4fAzwSmEQFXbwZ5UyzirFiaxwAB9+FYEtyenyYWuwrC8VhXC8HF2CY7P9t
	nYWVW6TEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc7Da-000243-Bw; Mon, 09 Nov 2020 13:28:22 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc7DW-000225-Oz
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 13:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1604928498; x=1636464498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=r5avHiQkyvQexodZqUTGLEc5YQrwbiK544WIytT6JRE=;
 b=E1RG6fD/NR5UJhKRUAsPcGW9xPyuRs6dFHoPkfkT1dmN00vy0cK3CIQm
 wuNZaEzB/bbBuMc7AT+YfM5pjXnuVo8AoS5dwkJS4aWVIAMW7YBUr9ZvK
 aovmzBAh+0Sj4RCZ8sO/Endjsu4Komm7Q8T07tBOg50aMqvbngEhoTRcs
 wIL/RtgnenkJVrxoAHcAKkTEtDD16HF0x5bP4cmWi9pdlh5Nr3qbFPGKu
 A8XeRDwd6dxLsc+yhmAgL8+EVg7rYWM5yRs2ecdJOn9Olsb3QFtqngTM3
 kQ83yKgj72iHp5WMseDa7bfM7t99LJ735bfms9NPIJMyv3CToMf6FMz+s A==;
IronPort-SDR: Vvzam8V0O3m3LYkSiioUA9zHl79noTyPUlMM+2bGTMaUdzv3EGD/IiQq5cMl47sFg9cd0b35dN
 7JKQSwIkbhdO1htAgP2cVmo0IBAR3BqYYvJZulcHf9+X17ZJQjY6Ik4qMiIfjm+fKAWm42i94Y
 tXzu6H8t4CUDiNlN4ReXgtV2WdiEH71HQnSB0XXE53Nvg3PTnFeKp3o1ueJfLR+4j6x7zAqpzr
 D8K6MJTZx3dZG3XfVYBpVTuJ7OHR0HWuVdZyl9KU4GE9xyc2Eik6e0XgMP+7f5Ie9x7NKXJajj
 6gQ=
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; d="scan'208";a="102690367"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2020 06:28:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 9 Nov 2020 06:28:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 9 Nov 2020 06:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcJw0V5ZURAriAYOrPCN3VN4YlWc0TPrJS0RWbNI2SFh7DAjAe0TH8d/ZRv2SXZLDwXP6/cX86g/igO+P6vN7sb38Wo9PYsYP9TIi/vDL1oYdVHoD7Whv/XIUd1/MziiWT1utDHk/O1wlVFwt3a/S7GJ50jvIezrF+UZnhy78coVGRVmgb7DjB0zyhgdkFwg+O7nUbfnIJu8RdUZjHw2LgVTWdDvKEuTlHX743AgarRUo3k/FyoaYe69UyNh2fiWglQgAd9eEdUOO6sXRMLP1urhOK7y+FcYTDTvpxNK8VjFW0foshVqHRvJQGK0iTt3pTcOjDXjEA1c/k77L3I/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5avHiQkyvQexodZqUTGLEc5YQrwbiK544WIytT6JRE=;
 b=RJo9sXBI5HyWxE1YCZxUKhNdTWlq6GY9htGajkJACR3/tcwSadSnG5lMyCLCnYpKmXzqKMp/+fQrmj2TaPg4flT76l+L23mnKF8ocgU+5T9ufyse7d+gEf6c/VcNnVTrV37ffnJ1VPu2ZRE/5Basxyo8GKda6ZXXODa1HVAVzDJCRQUeqffv0Zb2xnLBFNlo8LDwvzSQLM+Oq3GQ75LahL4iSgKB0m0O3LfkLVTKIWWxCLvQF2eDhIeamSvXgEBbbqtTlR86CEVBHEi5tHTzVLgpeAxDQqsCB2NondHIceAzwlLDs79zZr9pB1ezpqIkESa11Gu1eLPwsP9K0FbX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5avHiQkyvQexodZqUTGLEc5YQrwbiK544WIytT6JRE=;
 b=Uj/5W0F4KQEVcXWIml3skBJigl4GPxIiITdQuX/PcVkpNMqn4gYq4MmAv5reH/4iohX17GhtIcF9H+bDpblqBypPn/rb/USgZKdCm8V/INAj24qbsbpPkLpytUcmwfV0asTr+EP2WEH69DeCDX1UyOcb8igOcz3b/DkeoA8w0Gg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2685.namprd11.prod.outlook.com (2603:10b6:805:58::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 13:28:12 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 13:28:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v16 14/15] mtd: spi-nor: spansion: add support for Cypress
 Semper flash
Thread-Topic: [PATCH v16 14/15] mtd: spi-nor: spansion: add support for
 Cypress Semper flash
Thread-Index: AQHWtpwqZuIgH09300u0XqKhQVtAgw==
Date: Mon, 9 Nov 2020 13:28:11 +0000
Message-ID: <2885e3ae-3a03-d6c1-4cb8-3c56256713ab@microchip.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <20201005153138.6437-15-p.yadav@ti.com>
 <7d058da8-90ef-8f71-fe86-cc0b27a2895a@ti.com>
In-Reply-To: <7d058da8-90ef-8f71-fe86-cc0b27a2895a@ti.com>
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
x-ms-office365-filtering-correlation-id: d44dbc14-35e9-4265-f580-08d884b34e48
x-ms-traffictypediagnostic: SN6PR11MB2685:
x-microsoft-antispam-prvs: <SN6PR11MB268541CBD25AD358E5C7F092F0EA0@SN6PR11MB2685.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S+XntHtCxfCT3Ia3hzJQYPkgsJey6Caq+qJWBRDVuEYkis/Hhxsk0Jh4J0iNIIswX//5xTgTOqTfkbxudHcHMhkcd1HsGKYXLPtIIvqYEc7o3rxUJxDCd6P0V5J9Lz+9LwqYHepaRG3RhlPKOpx1GgfPlMkECOs6Jyxms87pjSKcXP9OERznamnLM5qPKuNEZf9ehID2S6jqQgu8Elj67D54hSf6d3Ei7hWbPwJb4vU1B6wClRma4XXAMiNVXp26bKAkDE/cSmWGzmrIquj/b6kvFqhcexz5QTInsQi1jrjOL3Nx/8Tb0Y5UZPZ3XHUhUClovlv6YrgGFzugYJ1DkA+q49I9iGwaNKSBzgK9BtxW8VwOrH1rcwueOiuqgsRd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(39860400002)(366004)(346002)(36756003)(2906002)(5660300002)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(316002)(86362001)(31696002)(54906003)(71200400001)(110136005)(478600001)(186003)(26005)(4326008)(6486002)(83380400001)(8936002)(31686004)(6512007)(2616005)(8676002)(6506007)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8ivwJjPYpNMew6B7zTAeHtXlAJzgoJbBa5FitxR+TNdKKowxIYNji4qoz0WC5FceMX9jW9LD6cx64AgdxGK5UqmG008opNKsY1E9UV/7xbUV141E6dNVu5I5yTxF1J2h2ZUkXiU3w61RuxnYJenr4X7NaPNRCBmVLGbD13AKHw0fnBXj6pBEedATB44sOPO5g9s5aYI7qNyH0dGNFuOAixovCmkpIwReS0ZZI5A45ylHwYOhOclaQ5rDmr737kzjIdU8BjG88/0yJ1yX7rVeCgoy9O9elN4pSk5hPoE3Y27rXdyheY0eR53J+gJc6lcJ4OXWieeThhDLndH2ejGngLCmW+N77AkFKSUICN61ukiujsUny6rEGiVV3ssafuaoCiX6AXX1XWUTApOJMrd4no97o+MOXKCaWX6Skdvb+qmd/XrZhC1OMRV2YR/b/SsSJ2p+nyqvWxbH8+63QIMmj3nfIS/mScCow1f7vFtOpmROoIO1yo3UR/Akj4cVPuTyOXWPX4sC2qNBhGJCsz1u2KAfo3vYSCKCFiMABsAdeqcpeDztNFexcMqy3yJSZ/BWZB+Gqy6ws3NPFwQj399qFzr7wrDR89Xlgu8ocGOmez08q/3nUJLLhoYNXNVpWQ6FndJURBBupiy2fIrlVfxPxA==
x-ms-exchange-transport-forked: True
Content-ID: <C6BB0849F94A044DB169DBEF6567FE18@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44dbc14-35e9-4265-f580-08d884b34e48
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 13:28:11.9067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpaDpO8YKwhkhOBGy0piH3+d7wclXzaP60GRzYPPPK8W8aveMehE2a+2Ts+gtnq5UNcKfznAPu8krRl+GCuco4epsyHgIlet6vgTVDVPxKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2685
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_082819_095251_C67DE064 
X-CRM114-Status: GOOD (  17.48  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/7/20 9:58 AM, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi,
> 
> [...]
> 
> On 10/5/20 9:01 PM, Pratyush Yadav wrote:
>> +static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>> +{
>> +     struct spi_mem_op op;
>> +     u8 *buf = nor->bouncebuf;
>> +     int ret;
>> +
>> +     if (enable) {
>> +             /* Use 24 dummy cycles for memory array reads. */
>> +             ret = spi_nor_write_enable(nor);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             *buf = SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24;
>> +             op = (struct spi_mem_op)
>> +                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
>> +                                SPI_MEM_OP_ADDR(3, SPINOR_REG_CYPRESS_CFR2V,
>> +                                                1),
>> +                                SPI_MEM_OP_NO_DUMMY,
>> +                                SPI_MEM_OP_DATA_OUT(1, buf, 1));
>> +
>> +             ret = spi_mem_exec_op(nor->spimem, &op);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             ret = spi_nor_wait_till_ready(nor);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             nor->read_dummy = 24;
>> +     }
>> +
>> +     /* Set/unset the octal and DTR enable bits. */
>> +     ret = spi_nor_write_enable(nor);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (enable)
>> +             *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
>> +     else
>> +             *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
>> +
>> +     op = (struct spi_mem_op)
>> +             SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
>> +                        SPI_MEM_OP_ADDR(enable ? 3 : 4,
>> +                                        SPINOR_REG_CYPRESS_CFR5V,
>> +                                        1),
>> +                        SPI_MEM_OP_NO_DUMMY,
>> +                        SPI_MEM_OP_DATA_OUT(1, buf, 1));
>> +
>> +     if (!enable)
>> +             spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>> +
>> +     ret = spi_mem_exec_op(nor->spimem, &op);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Give some time for the mode change to take place. */
>> +     usleep_range(1000, 1500);
>> +
> 
> This delay is no longer needed right? I can drop it while applying, if
> you confirm.
> 
> Tudor: Could you provide your R-by?

with usleep_range dropped one can add:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
