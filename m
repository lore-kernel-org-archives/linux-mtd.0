Return-Path: <SRS0=tlyf=UP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F75FC31E49
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jun 2019 12:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD75D20870
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jun 2019 12:44:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PZ55zXvw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fBMNN+Jl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD75D20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Yn7H7tA7DKDFv3IowbWCkv9eRrHNSBheZeBz7zSDEE=; b=PZ55zXvw0xpysQ
	Hw1LYQid4ESppQ/dUBJE92/HL8pu8b2Hwt9uwFWOdwNPFLuIxbcwdHwZZfRuvqHwXUmUnyn6f278j
	T20ta7M8tipZJboiytcgFQSjmQqrQXrUXv0h9QVr/UWo0iDuEbsrGHyhp1rhe3FKDvEBRxJb8uPPp
	m7l9RWJhDzF58Z/lzOT7f2FlZp8LFYxEqwORbZnwTquAykdCW2WbERK6DI3uoMTvsCt9nDHkWF9b+
	4feTkOhgsoDl3aKFfL/jJiC84e5hA4z+QwBD7jbfQv0dZrpIS6E7kmETYT0ZGdVEh/3BNPj7AukvB
	fSjklT1bOqeE2NBGS9Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcUWX-0005g8-PI; Sun, 16 Jun 2019 12:44:41 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcUWU-0005fh-Bw; Sun, 16 Jun 2019 12:44:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5GCiLhA033414;
 Sun, 16 Jun 2019 07:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560689061;
 bh=19H8228T7JxbHupQvwDqhQcBwn5pS/mQpYoEWhiFVCA=;
 h=From:Subject:To:CC:References:Date:In-Reply-To;
 b=fBMNN+Jl7jtZzcNJVVeNu23O1SMLIJURY6HkAxnEugTApS0+Qf+8w4dTVl5udZW9I
 WWkTepki3mCK0/KTL9D7KhWO8mofjFaG6vluM3At9EHCZ7FJ1MK85p8JAtYTO45Vc8
 JIsly0gmjIo/3EETy2UfYgeE/p0YT3PapwEPfhDE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5GCiL4U024120
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 16 Jun 2019 07:44:21 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sun, 16
 Jun 2019 07:44:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sun, 16 Jun 2019 07:44:20 -0500
Received: from [10.250.133.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5GCiGQW130920;
 Sun, 16 Jun 2019 07:44:17 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5 1/3] mtd: spi-nor: add support for is25wp256
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>, <marek.vasut@gmail.com>,
 <tudor.ambarus@microchip.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
 <1560336476-31763-2-git-send-email-sagar.kadam@sifive.com>
Message-ID: <325855d0-00f9-df8a-ea57-c140d39dd6ef@ti.com>
Date: Sun, 16 Jun 2019 18:14:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560336476-31763-2-git-send-email-sagar.kadam@sifive.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_054438_560510_6B987EF5 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: wesley@sifive.com, palmer@sifive.com, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 12-Jun-19 4:17 PM, Sagar Shrikant Kadam wrote:
[...]

> @@ -4129,7 +4137,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  	if (ret)
>  		return ret;
>  
> -	if (nor->addr_width) {
> +	if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
>  		/* already configured from SFDP */

Hmm, why would you want to ignore addr_width that's read from SFDP table?

Regards
Vignesh


>  	} else if (info->addr_width) {
>  		nor->addr_width = info->addr_width;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3d360b..ff13297 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -19,6 +19,7 @@
>  #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
>  #define SNOR_MFR_GIGADEVICE	0xc8
>  #define SNOR_MFR_INTEL		CFI_MFR_INTEL
> +#define SNOR_MFR_ISSI		0x9d		/* ISSI */
>  #define SNOR_MFR_ST		CFI_MFR_ST	/* ST Micro */
>  #define SNOR_MFR_MICRON		CFI_MFR_MICRON	/* Micron */
>  #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
