Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A810E7E0D0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/c4uCQcT06HPLKqzDj7kvArc5CEZDrjho9DqwsXJuD8=; b=aTmuYCyFUcDuTT
	x62Xh51/fvg6YuXmGYEW13jRdjbhBjhF9EAFeQMmlE6cE6EmOwt3mc7bnhznIkvVgJ71kHRw6T4QW
	Xr+C3kDAGV9pHuf2LJz+6xIx+sdxEgwLlJH1/BdB5WLJF0kcxuRzabM++Psy9h+lvwYVZSspNELcX
	kI4r/3GC+5pZ7GDmpuoI85gMz92RDzCYw9HdSN6kYpAasTGuFAZFIMyCdy7fRh8RXAYJWH53A9eL2
	H41zDhEta1Nq5aEKrqzLSl7Ifjqv9So43bDktG02yCBLXNr+dGWxrzr05rnXtM01dubu+V10O7uvV
	9JvhfNt2F/UDoeeffdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPaO-0000000FJQe-2y5m;
	Mon, 09 Feb 2026 11:37:48 +0000
Received: from mail-italynorthazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c215::1] helo=MI1P293CU004.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPaL-0000000FJQ7-0MXZ
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 11:37:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spECur7+5UBhg4XA0cpWJQGAUp0aRTUv8ttRxjpAJWP8J8p/FSk7SYB/eUreFvKrVzPUD9PBL4J9OwfNdw8R/ZJ4xUwLY6QHqDm2MNYWLMFsL5aFyHRuKcWuM0MeQl0YDW9d09srnNhdUJmbsD/kmnUpC1TI27IotrxcmDLLNjSwYCP7GpYayecEI7mWZgkPTygXmhP1tl8DbulGG/rrXLChWF1iEVFm6yDu/GulIlQ7wv/YplTeepi2YquuRfjWjmq3PrjFIGCotDgQH2syu+yIx14knWMAf/qk81rVOE1X/yLVfoWkhlLa8TwjShTQQo5Zpl+HEYuiF1cwvbWFxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtTndpVGwqXy5oOF6lUnbYNJEDA2OW5HWuhPa7frPw0=;
 b=JQ1V+kLPyTAuDwvepkApLc3VKw1Bs3UtBiQ2UTvlwCgNRwLbSeazFVAb6/KncIWj32it9b0b1wAby6+79xOSjnnALpLv+v+Dbbc5UfcsRsfrPNODaA3J2x/djOVME7G88woncnpw6HKqaCcqVKLbY6xR5B0j5svEmSZUNq9GS3gPom9bUqLL8aseFXom/dsAj6mdU4ZTAdE90P7oysvty0s1MGyFmvMhgNsiYevcpiFA4hxIdSdWQGy4Zu3VDT+ze0vhD2ImYYViUAwW2sUmksPZYlwyIteAq8IyzlqNEKYIN+4UfAy1WSY/NEqyzzBiblwmzAIyulK2IrUXNPoSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dave.eu; dmarc=pass action=none header.from=dave.eu; dkim=pass
 header.d=dave.eu; arc=none
Received: from MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:50::6) by
 MI0P293MB0047.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:36::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 11:37:37 +0000
Received: from MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
 ([fe80::5fc8:9a15:2d20:a015]) by MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
 ([fe80::5fc8:9a15:2d20:a015%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 11:37:37 +0000
From: Andrea Scian <andrea.scian@dave.eu>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, "michal.simek@amd.com"
	<michal.simek@amd.com>, "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "amit.kumar-mahapatra@amd.com"
	<amit.kumar-mahapatra@amd.com>
Subject: PL353 NAND Controller - SW vs HW ECC
Thread-Topic: PL353 NAND Controller - SW vs HW ECC
Thread-Index: AQHcmabaLgRDqovB5Ui7aOICxUgxvw==
Date: Mon, 9 Feb 2026 11:37:37 +0000
Message-ID: <MI2P293MB02644DC5515E56A2539C65739765A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
undefined: 5804773
drawingcanvaselements: []
composetype: newMail
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dave.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MI2P293MB0264:EE_|MI0P293MB0047:EE_
x-ms-office365-filtering-correlation-id: 1bd9ade5-42c4-455a-384d-08de67cfa003
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?wXXwVbIO68gOmFxCASsGmw+cyZx2Bah8I3AcDLL8Tg5Bt/J5+Y/+ML1OYt?=
 =?iso-8859-1?Q?dG5aZ36mKJaOp4OfSynvZd5Q3Z4i0VzNuiX18a7FAkvdanA0UWnxTt3RXj?=
 =?iso-8859-1?Q?dvCmCZyRASqYEvar1GG2CZmBBcGVCMICjOlfyjgrfp1/+//PDn33PSylkl?=
 =?iso-8859-1?Q?S7YLri/Y0+iOLBrypZxEWZ6e2RMrKyPl+1vbdZBqOJiTN/GoY+EhWs8FgH?=
 =?iso-8859-1?Q?R7LO28D5Z/J7Ue5RDTmTv+I8uDflkcczyg1XLc2uhdMEfJybb7qVrhSM6Y?=
 =?iso-8859-1?Q?20HbBW4B4m9JF2OG0vbW8K0cBoOmZOW7TIRsanEF2XgUsNv/7Z5EAr0+Qp?=
 =?iso-8859-1?Q?VA//ckAxTVWo8WRU6h3VSt4W+VUq5J5H9GcjnFzUv0Nt7oZAv+FZBUlOsA?=
 =?iso-8859-1?Q?VMWK9uoqNzyxbqGmSL7yDAUSR4aUDL0FuVVDU/n+4I+vB8oBin+5WbDqMr?=
 =?iso-8859-1?Q?xeP8vb7uR9HaPps4eB5/0Lkw2gxAdEHNGHAP0gCeuGFTAK9C82M26EC3Gc?=
 =?iso-8859-1?Q?yUGojbm1A0aH8P4Xe6cXDIytoR2wlE6/ALFSXkRCJiO6goIEkVAT0FkP4l?=
 =?iso-8859-1?Q?etVpV5CSMOuKVjX695vBmVfM6fZXzX7iVq2x3M7p9zxbdVBEcazYjbJLhD?=
 =?iso-8859-1?Q?x/ZRfb3s2VyYfqRTNZX2hxVejqFXf6OvK7b8Txn3RDjXA8NmmGivnl5VK0?=
 =?iso-8859-1?Q?X5dEubEC7hJiZMbhg3OR9TFZWpMmV20KL/dVIA9Op0PQzgQN+fKsuOvtUw?=
 =?iso-8859-1?Q?ph2wg1f1IsYzSnI2zgV+BzxNUui0LdXmwpvUR1FNYXCBxpdpYk7fEPO+T8?=
 =?iso-8859-1?Q?X0TF9EzSdNbKw/D1rrzuiCXhapYurA0txJRRfpGvawf6IMiDJ/o7sAy59w?=
 =?iso-8859-1?Q?PfOBYfXu3GJzREaQ8S3i6owNgtfXvlBOX9elFZQ/HbCHSfknT3Y29TTlVW?=
 =?iso-8859-1?Q?EDb7b8oyf5ffGmqdMvi1ams2LT8dVbeUG2v8ShTD/oAiD4pFQaohvyqESw?=
 =?iso-8859-1?Q?ONwn0yQHJ4HvKuzSg4Sjz8SW0+tzT0EoiY71ySDfxOVgWIqoknFBreEt7u?=
 =?iso-8859-1?Q?eiktD0aoemME8O8CmBmMUAlCZ8qkhvmhfzuS+bNnHtcfsq0LY1VT6YQxI0?=
 =?iso-8859-1?Q?stnevstINktQAlJpIkMDCYljqoqkuYO52vLGmoDxtNpLmlzLsrNO3XaPhr?=
 =?iso-8859-1?Q?ujwnDm2PrlAdUvXv9jqYQAhil3n5EsNEfiHcBCXqG81XfUOirxin2mXx9U?=
 =?iso-8859-1?Q?WpmYpuTTTcHIWNMzzyAQKDxxP/pyoEL4tt/FzS6yhWQyAHl568phOTyD3l?=
 =?iso-8859-1?Q?WqE+MQm9bfirfI4Ea+l32VLqeZ0rIFBBFbU0o/L8Trg9pso+MpH0K2XLG3?=
 =?iso-8859-1?Q?EJXH+SoIUXhl4PXlfulxQJfBlfsdVzQCyHL2lVAz+LANjjhlqh4bepF+/k?=
 =?iso-8859-1?Q?AsBVxnkMaL89SPxi67HwXaSIeQjUv1uP8gx8xu3P4qJaUOuFAxNJcQjRzm?=
 =?iso-8859-1?Q?ByYrdVBrYzJs+XGyHvESEX8LA98lKTX9QFmhJpDK+QaLMP1eNpmw141go9?=
 =?iso-8859-1?Q?7e5BQozwa8v5MR/K0+uZztAzNxCXczTlKolUU47WnJ8p+muI3yIMm2+jon?=
 =?iso-8859-1?Q?+fqeeOzUKsyIZuzWjewKbyQq58z1kMdP9S9SDrGJL6U93AQva3P1KndLnY?=
 =?iso-8859-1?Q?kZQOt/uvZOW8y2C5fsI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?H8B7qFmnvsOai+hjpPFagvxBjicJy0mY/8pC0OikuMlsHiOwXjlEsOtZmU?=
 =?iso-8859-1?Q?bdbx4Y2X+P2G/HnUz1qIut6USaz5g659YLJsUhsoMMextj2n0NQ1of1RQg?=
 =?iso-8859-1?Q?pgr2Nf0t5iFtYMJAjZmrbkuLnQQA0Bv0Wdf3ExBr83NQxGoKWy9owcoSTh?=
 =?iso-8859-1?Q?jXYD+WOiZqCrZpveUytYZAf/nNolYg2YDztVAy2cBiAa9zSr3TutrcpVwv?=
 =?iso-8859-1?Q?zyQbw7qppoevWJgDWdC7sAjwDEd786BG/3mCgEtUNJCt3NNz/xMwChAxGg?=
 =?iso-8859-1?Q?icuIuBhIWB7P81uOBnLCPQlkl0fGm2f9FtvgtrC4U3IHJPIWVfqw93VFn0?=
 =?iso-8859-1?Q?3zpjlTzPJo3YHrW8U+DRvpR9fJ0X11GT2iuxxcCZLX2vfJXOIyYe064mK7?=
 =?iso-8859-1?Q?xKgmeqZjaW7QzgQML2qg3um84VpXl+JuAPMr5sK0fOXk2PcDlhosF0Zzk0?=
 =?iso-8859-1?Q?psyxJA0VlANclVMLL45/rQZBd6tyNmZkP1cvv63kUOwx823fHRFMS5aAe0?=
 =?iso-8859-1?Q?4M5cOKKPYwnYwTZqqtDYFO2e03k8xaWyaREJZdfuXvI/wmXGBn+GSwP4dj?=
 =?iso-8859-1?Q?kP25564QWM3zk4bP0puybi7yIpWOCa/GktboZSOfycPqtzhUwtOgR1EC2l?=
 =?iso-8859-1?Q?tXvsG6hpUbJvHprqzpjFWIygWHND5W8JCCJcu8F3ALuUPDQEkZoJvYRwY+?=
 =?iso-8859-1?Q?cqf/bq8gMatjgYnxkkZnhUvtIrV9xPJL6wcywu3EMAQcwumvoQKiOCjeY3?=
 =?iso-8859-1?Q?zmYhBdwgqVYC1wWJ+jc3yCH3jltdk5ScpVp32mf6pGkJ/IQUPZPi+G2rkA?=
 =?iso-8859-1?Q?wvHrcJWDo51HgG1PJ4Z2le4SScIUjxEXD9bWrAmRtbnE7Lf5/i22fspAyq?=
 =?iso-8859-1?Q?llBy8AsAIZE9qqNeVWZfzoAkUHt6uyKD9/vYKPq58GeRzu4QLFaw3PD4UR?=
 =?iso-8859-1?Q?xuvDAONhgRreYQi9hat2Hp+01IQaNF4XZ+13PqVo70zv+06Utcv0QzZ3W3?=
 =?iso-8859-1?Q?3KGPo9R2fetkHWC53A42FZmtMIR5Gw2xAvpc7Q0XDXhNC308ZaAmKzTr5Z?=
 =?iso-8859-1?Q?GHeubnaYn10hdDZQj1g0cPy0pHh+FDl/QQWe1K3FwSvz2l7a5IunmBSgeD?=
 =?iso-8859-1?Q?B3t7h0TzCJXPWGTQPQ/ESyJSsbZzSqO2zPAXQVXbGVdxqiILI0jemJCF2x?=
 =?iso-8859-1?Q?HXCyDrjaUrj8/+WS98jWxAkkjT4TlrnRDVSdk46doZdPFkmGE1ZOLBZbrV?=
 =?iso-8859-1?Q?GVKgjvLmj1ydQxqH13TNR8zqwO8VbzstW0rvHhe8jk3CQXvx7Fyiphk546?=
 =?iso-8859-1?Q?vjTRoSPkqrgjNGTLb4fOO74Yrv1eQwE8lQ6YTjZJMm8eJbzKI+tDUK+9tn?=
 =?iso-8859-1?Q?c/T7A7sC/ZhC8dKw9HEKVsT92y8FBOlYFod/JWYnIVaToMzMmVd+NNeyhl?=
 =?iso-8859-1?Q?IO6Vb5DqNJEwWy+u1OpIlP0gAQ3DZBdnXpVxUgbYCDjMst/6gcwmWVT3yc?=
 =?iso-8859-1?Q?4z45W8z6wh3YWldjFS8zHFm5nqj1oxg/GruSFAux4iXolyClorcj44QUg7?=
 =?iso-8859-1?Q?KDqp2b023J+YvvjJ57AFkk5sNoj2Ykw+sHdol+Hcl5X+mLH+pNCegsJWxm?=
 =?iso-8859-1?Q?7dmYI0xDQLuCcf0Y9FrDbvxypgRi0QwqAcW1tINApEhbI6woL1f4zGlL8v?=
 =?iso-8859-1?Q?y4BzPujEBQTX9/3oR/J/EO6SW+VwpxZczSmDQTPAwVrlx785s5yR33eP/C?=
 =?iso-8859-1?Q?Zt4DG40jNy66n/HWx0GjP4jq6HQqnJBL6kGg/drsuzoVuR?=
MIME-Version: 1.0
X-OriginatorOrg: dave.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd9ade5-42c4-455a-384d-08de67cfa003
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 11:37:37.3603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c85ddbc-ed10-48cc-8f28-5d7f9561238a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tF01pNO1Eq1gqDAVU464gzIJYuGwQJ0tScgHZZdob/OtzOPQ3bMtX1wrWQJyCAIX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI0P293MB0047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_033745_313117_C9DC1F08 
X-CRM114-Status: GOOD (  15.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Dear all,

I hope I don't annoying you by putting directly in CC, but these people are the one that were already involved in my patch to fix SW ECC support in PL353 NAND controller (mainly used in Xilinx/AMD Zynq7k SoC), and I think are the one that might help me with this follow-up.

Our standard HW/SW validation procedure for BSPs includes (after some basic functional tests) raw NAND MTD tests.

Usually we check ECC functionality with mtd_nandbiterrs but it's way of testing ECC correction is quite obscure and unmaintained (see a thread between me and Miquel on this mailing list in December 2025 on this topic).

We've thus moved to userspace nandflipbits which give much more control on bitflip generation, making easier to understand if everything's fine or not.

By using this tool, I'm able to reproduce what I think is a PL353 HW ECC malfunction, that I think is hardware related (there's some, cryptic IMHO, errata on this) but I may be missing something and it may be "just" a software bug
There's also the obvious 3rd option: PEBKAC. I'm doing something wrong with my test setup, either on kernel/test configuration/usage or in hw setup ;-) )

Step 1 - SW ECC

Thanks to my patch (and mailing list review) now I can use SW Hamming ECC on Zynq7k based devices. So this test is about using software hamming ECC on (1 bit on 256 byte)

This is the device tree

&nfc0 {
  status = "okay";
  nand@0 {
    reg = <0x0>;
    #address-cells = <0x1>;
    #size-cells = <0x1>;

    nand-ecc-mode = "soft";
    nand-ecc-algo = "hamming";
    nand-ecc-strength = <1>;
    nand-ecc-step-size = <256>;

    nand-on-flash-bbt;

    nand-bus-width = <8>;
    status = "okay";

    partition@nand-ubi {
      label = "ubi";
      reg = <0x00000000 0x0>;
    };
  };
};

To make it quick, I'm using just the first EB, with a simple string on it (in my case,
this is useful for testing on u-boot too, but this is for another separate thread ;-) )

root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
Writing data to block 0 at offset 0x0
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|

I'm now inserting one bitflip, which is detected and corrected as expected

root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
0x00000000: 6a 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtst testing....|
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
ECC: 1 corrected bitflip(s) at offset 0x00000000
0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|

With an additional bitflip, we have an uncorrectable error (and this is, again, expected)

root@sw0005-devel:~# nandflipbits /dev/mtd0 0@2
root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 0
ECC corrected: 1
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|

The same applies to another combination of bitflips (this will be useful later and don't look at ECC counters.. I had to reboot the system ;-) )

root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
Writing data to block 0 at offset 0x0
root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
root@sw0005-devel:~# nandflipbits /dev/mtd0 0@0
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
0x00000000: 6b 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |ktst testing....|



Step 2 - PL353 HW ECC

The device tree is now
&nfc0 {
  status = "okay";
  nand@0 {
    reg = <0x0>;
    #address-cells = <0x1>;
    #size-cells = <0x1>;

    nand-ecc-mode = "hw";
    nand-ecc-strength = <1>;
    nand-ecc-step-size = <256>;

    nand-on-flash-bbt;

    nand-bus-width = <8>;
    status = "okay";

    partition@nand-ubi {
      label = "ubi";
      reg = <0x00000000 0x0>;
    };
  };
};

Please note that PL353 is not using nand-ecc-step-size property correctly, but this is a secondary issue (this NAND device requires 1 bit on 512 byte, so it's fine anyway)

root@sw0005-devel:/lib/modules# cat /sys/class/mtd/mtd0/ecc_step_size
512

Re-doing the same test as above

root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
Writing data to block 0 at offset 0x0
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|

One single bitflip is detected and corrected as expected:

root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
0x00000000: 6a 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtst testing....|
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
ECC: 1 corrected bitflip(s) at offset 0x00000000
0x00000000: 6a 75 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |just testing....|

a 2nd bitflip is detected as uncorrectable as expected:

root@sw0005-devel:~# nandflipbits /dev/mtd0 0@2
root@sw0005-devel:~# nanddump -n -c -s 0 --length=100 /dev/mtd0  | head -n 1
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 0
ECC corrected: 1
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
ECC: 1 uncorrectable bitflip(s) at offset 0x00000000
0x00000000: 6a 74 72 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jtrt testing....|

But there's some corner case, e.g. double bit flip that are detected (wrongly) as single bitflip and return wrong data:

root@sw0005-devel:~# nandflipbits /dev/mtd0 0@2
root@sw0005-devel:~# nandflipbits /dev/mtd0 1@1
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 1
ECC corrected: 2
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
ECC: 1 corrected bitflip(s) at offset 0x00000000
0x00000000: 6a 76 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |jvst testing....|

Another full test from scratch (ECC corrected counter is bigger that expected because I had to try a few combination, without rebooting ;-) )

root@sw0005-devel:~# flash_erase /dev/mtd0 0 1
Erasing 128 Kibyte @ 0 -- 100 % complete
root@sw0005-devel:~# echo just testing | nandwrite -p /dev/mtd0
Writing data to block 0 at offset 0x0
root@sw0005-devel:~# nandflipbits /dev/mtd0 0@1
root@sw0005-devel:~# nandflipbits /dev/mtd0 0@0
root@sw0005-devel:~# nanddump -c -s 0 --length=100 /dev/mtd0  | head -n 1
ECC failed: 1
ECC corrected: 6
Number of bad blocks: 0
Number of bbt blocks: 4
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x00000064...
ECC: 1 corrected bitflip(s) at offset 0x00000000
0x00000000: 6b 74 73 74 20 74 65 73 74 69 6e 67 0a ff ff ff  |ktst testing....|


Conclusions:

IIUC with the results of the above test, we have an issue on PL353 because it cannot detect double bit errors (at least some combination of them) and, while this is a rare event on SLC NAND devices (that requires 1 bit ECC to guarantee 100k PE cycles), I think that this might give some catastrophic failures on field (because, AFAIK, upper MTD layers, like UBI, don't expect this situation).
Am I wrong?
I kindly ask to the MTD experts if I have to worry about this or if we can assume that correcting 1 bit error is enough for this subsystem.
If this is not acceptable, I think we have to update the driver at least to warn the user about this and use SW ECC where possible. WDTY?

If anybody in this list can also help me in understanding if I'm doing something wrong with my test or may have some setup/configuration error, it's appreciated and I can make some additional test.

In the mean time, as my previous patch anticipate, I'm trying to setup a configuration using only SW ECC (I'm currently stuck in Linux/U-Boot compatibility, but this might not the right ML to discuss this topic)

Any feedback is appreciated. Kind Regards,

Andrea SCIAN

SW Development Manager

DAVE Embedded Systems

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
