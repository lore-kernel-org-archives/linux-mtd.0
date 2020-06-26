Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C46C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:58:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B96206DD
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 10:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gQPAjrKr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hJK3ig6T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="JOeRYx4R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53B96206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PpjHPNm2ryrOAwp6DOhGKxLUPoWPrtq+kV9FOedachM=; b=gQPAjrKrlOSI+LAY+MS3Ta0iw
	fChAHVDJUrpY9+YfuIz3mUqRvi9Zns1dzYROkj1JLaupDLke4uLX5imU0XjoY60cLPULM+nm2Daua
	XnQMV8qLRz+xvlwj0tM6w5B1miGHFiVlinwq5vm/sx39ZUigr9D2SWBYxrQJjNYf8oHj0JNqBK9rr
	ItO3amIBX7df7UaNtW6jfxyYBRumLNdg+CjhQJRJO7DSEglqdjQs8yH1Wy+2XmMGh+o8li3gPRvlz
	me5CQ/F95wsYcfZTt6n6M2VZKT+TeY9/qegB5w2miRd9tb4+SPZsk5zUTCTUzE+9e9xubWcZb6yQp
	iJL6cRWBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jom35-0000Bv-DD; Fri, 26 Jun 2020 10:57:35 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jom32-0000BC-Ht
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 10:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593169052; x=1624705052;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/8rl3HYosR/nMLnPjNZAZzwxA5kChItBZg1Uq0K1FUA=;
 b=hJK3ig6T5MAuE2vYPEnxPsQGS/iYK0cKWkv8PDKoGDGM8BNhZiVA2ugO
 3LDuJep1YFtQQehZYVEooCLLUYFsm25lrQrSZkW2qGumXFjfdqjLQp0dA
 OZFQgfaD1tG+1lDKMCkTe4E6C3wigp8i3JVTSNL8MMY1io/Yc/1tMmogP
 mv22xgulTC/03assB5dFMNTqQbDdw2G9bYykTA1nMloFpL08bNJ/Je/S2
 mtHGQ8M+SBLj8ZU5p4jQKpwsth7+x1VGT+LG9wYXpkwPDwhmXTSXGy1TZ
 pgCrE/jwbnJ1UGVrUuQFFHU/ycapV3mdTaHVLdnfp7EpDlVkI5lzmEGjy w==;
IronPort-SDR: XfaJdA0tyEzUF/6aNi6b0rURpduEMBFMkPl/NGpVrxoDjxFskE/LEItW9n2z43OBnkSOTTWzEh
 6wWsUPJcWWiWsfftfEEB6SsRodNdep3jwapRIWl/kVfpggrMxzhe3U4m/ba/+uq+3+fU7c99i6
 rdNty4groSt/7pvhQZUx+aTwVDBv53DltUHwWmENW+dUQgCMlWP0xjpQMYvKbjo/cWpV9FcEok
 aW+NdOdNr9vUTXUuzqq6xEEVxT615cIvAelUFUGsWo2nvyXQvlLtavEJNZ1W2NCeCnAIpNhPYE
 lYo=
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="77929145"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jun 2020 03:57:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 26 Jun 2020 03:57:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 26 Jun 2020 03:57:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZb4CP6d9W4TIx4+ppQUrhBmc7WRcH/tD0Us7iqzc58a3QU/VkSusm0dz+5gntj3/YsikAdyAz55BrWsi+cZFKcoxthnbGhGtbY9UU4r3ZqrRr/+t5+XmYJHRo8geklFnigzCmpDqct67eEzdUEKPecPcB+RhmhdiAaFMfQMhEcdzDlR+EM0xvQLie7lb7uY2Xo4D+pYszdXHmjwJ9iBNB/AWhcYDxD8Q/QTJRs81T71aM6xfdOa5b2WWPJsS/VkQUX+n9KC3gkkf8ouRoLU5lBQd028FAy83Qzty5GNVvBDxJU9r4R6Q/nfjI9biYaAaeCEB8ELazMcD3xB25eFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8rl3HYosR/nMLnPjNZAZzwxA5kChItBZg1Uq0K1FUA=;
 b=TNguGQw04W7n9W96ip4dtONYkIIY6f7R97Y+vhpBw+orgQDISBhv2qugSX1ZoGEQv6rFh/pbaHC1D7sfLH5iFVUf7XCvUW/rCkx1jS+9STbHZ8rAJZ1UO6DGlU7Mb4uH6RAb/KsVXBLmA16tR8BWiB6ID//jV2wbKul7UmGUtD0xiLpq+AhxAel5FQAPNQ5cQKQaWEt2Eo+aJ0nMfchmFUBcb29I15cqSpH58/gr5haczEIhHvWZkim/ishuU5iak9+nAhadKfRjmFArO+FM4Vtie4qq76PAUW91VBGgJrevCu+HEAr+3yw0eEvD37w/bRDs12JOyJoI0ML8ZXfrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8rl3HYosR/nMLnPjNZAZzwxA5kChItBZg1Uq0K1FUA=;
 b=JOeRYx4R987Ju7rhzM5Vl7Yr0NI9jm+fMJCfok4+m4juULJYMM1Jb/gp1155dL5Vbzo8FQQZKi0HhVepPLvtyrMnDJmYnxDI2B5TYM9Zkui5zG/w+CNob0N6loYBqa6ZFS5RUqeyzVUY59/LicJaQiQkVdlfjbn8pZKp2FpCKt0=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3461.namprd11.prod.outlook.com (2603:10b6:a03:7b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 10:57:27 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 10:57:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <luisalberto@google.com>
Subject: Re: [PATCH] mtd: revert "spi-nor: intel: provide a range for
 poll_timout"
Thread-Topic: [PATCH] mtd: revert "spi-nor: intel: provide a range for
 poll_timout"
Thread-Index: AQHWS6iUCAqTB2Up30yP+LHzC/Sy+w==
Date: Fri, 26 Jun 2020 10:57:26 +0000
Message-ID: <e5f8203c-bf0a-3aee-a067-980592eab9e6@microchip.com>
References: <20200610224652.64336-1-luisalberto@google.com>
In-Reply-To: <20200610224652.64336-1-luisalberto@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1874aa67-0591-4319-c8aa-08d819bfb6e9
x-ms-traffictypediagnostic: BYAPR11MB3461:
x-microsoft-antispam-prvs: <BYAPR11MB34612F679F70589B9A9EBA55F0930@BYAPR11MB3461.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0446F0FCE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /GyElf74I3j4Q0tntrwyIUat5/6++fFLdq8FIHHG7ZabAaArp6xI4Tt60ctkJ0oX6pdhxN5RlqbiXa1cxY8RqZDS9aIfvPs4lqlDNk78Re9djVROF2mjpdjnPdJJ8sMfWpgZi5MQPPoVklYbHzr0qmcEzHmKHlzS9MEUcvtep74jLUxyR9AYmJX0GNAKfSFKwhEw1XT94yqsgLda/0iOYtxH72hTAVIoplZHuX2jsT88fMrmnxCpSk+/IqB7gB1ue7jlkBwBsy//2ZMGqbgsaY07JYeg+N03W5Z+SB22Qkva4ZoRd3YUWb3IbZrmp4iyzUDi03JJv/OqDScu/TIaSHIiqDFV5mkX5ZjgIAenIxgcpB9Bs33tdW0vYf3U6g1P
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(396003)(346002)(39860400002)(136003)(366004)(5660300002)(64756008)(31696002)(66446008)(86362001)(36756003)(66556008)(54906003)(6916009)(8676002)(478600001)(6486002)(76116006)(83380400001)(66946007)(66476007)(316002)(53546011)(8936002)(6512007)(6506007)(91956017)(71200400001)(26005)(2616005)(186003)(2906002)(31686004)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 1Zi6FesVMXBl3bcS6fhw4R+nURIFAAxU9i4zdZ5fNK2wGg7giaOcOs55LyupJb0Ku0QWpWJXKTxZz7ixm89vYaAvhN5J371TmqSBlPSAEVHZpU3wvbDWmx8SLYm+HML3aiDcEyMF14vZkJEjAfsfzn5TaTXSFGrnZqkJOLpizc7RyKCVdf7TKeW8kTFO/C/xwkW/kh3HUoaQqnkZxsK9Q8UqPBpuVkv+9yYZp3yFO3SxzOkHedGelOupIair/U0rlxQ++aZ/fLmTV7JyjRy7YZ3sEt4ll5o0oQ07q28bLLmFbKjKUv6YjWEWWn67Cc3TjH4/SMtbKsoQ+fbj8cFxev/2SuxTrAY9z14kIOSlZWcWIpVmo7rkkQiTuPyz6Arisi8QGRw0jccmrgLi8rkt+kNvpsnMPFJiBAi84j9ri1/Xw+To7gDJsj0y1esQ7N83St/NxPiKpTUZ6l52b48Y8vZlgSY3u7UdKajsJD/NfEs=
x-ms-exchange-transport-forked: True
Content-ID: <4E57C6A9BB55824C8122813DE858586E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1874aa67-0591-4319-c8aa-08d819bfb6e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2020 10:57:26.9318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UTKeLRnhELbGcyGpqhfrSRdXisOhOgjCfbVWOwz4y5ED9OYaTzsrfB6lwdbaifYvtjJHVuJU85uj6OYxKwBSxu5ZnDzk5vsam66k+6EWNzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3461
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at, jethro@fortanix.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, mika.westerberg@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/11/20 1:46 AM, Luis Alberto Herrera wrote:
> This change reverts aba3a882a178: "mtd: spi-nor: intel: provide a range
> for poll_timout". That change introduces a performance regression when
> reading sequentially from flash. Logging calls to intel_spi_read without
> this change we get:
> 
> Start MTD read
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [   20.045527] intel_spi_read(from=1800000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  282.199274] intel_spi_read(from=1c00000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> [  544.351528] intel_spi_read(from=2000000, len=400000)
> End MTD read
> 
> With this change:
> 
> Start MTD read
> [   21.942922] intel_spi_read(from=1c00000, len=400000)
> [   21.942922] intel_spi_read(from=1c00000, len=400000)
> [   23.784058] intel_spi_read(from=2000000, len=400000)
> [   23.784058] intel_spi_read(from=2000000, len=400000)
> [   25.625006] intel_spi_read(from=2400000, len=400000)
> [   25.625006] intel_spi_read(from=2400000, len=400000)
> End MTD read
> 
> Signed-off-by: Luis Alberto Herrera <luisalberto@google.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> index 61d2a0ad2131..2b89361a0d3a 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> @@ -292,7 +292,7 @@ static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
>         u32 val;
> 
>         return readl_poll_timeout(ispi->base + HSFSTS_CTL, val,
> -                                 !(val & HSFSTS_CTL_SCIP), 40,
> +                                 !(val & HSFSTS_CTL_SCIP), 0,

Would 10 us keep the performance as it was before?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
