Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682A2C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 06:35:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CBAF20838
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 06:35:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bR0d6/5l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lLf3FYUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CBAF20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2WpP8wi3l0SaX+Y4SJU/K4E3lahDoHxFLEiTIbZI95Y=; b=bR0d6/5lTumiuvv/9+aSK9m5y
	6FpBFs/8F+x/t4TSvLu38pajAm87XsJKrApazANmkhpUzZN3ku/uQAzq2cKsejZM0CC8K+60RhFz6
	J91RhBzcEdumZnQeYFexkLjpufB08OgpaegSV0WOYANT/6TsvorFHJsJRLdVpo26ZNkUa+HEkkX56
	cyqY1C7rmN6JFtFq0/lmL/WmDJtod2xJg1iH7QbEaBy2GFfVjtn3Nz+uOIadFU9SPSg89+iIKIzU2
	Ausdmr9P4u+e5kPaFYPsGzvYLKHjv84TD9U6zz0GHbhlrtYlFlh4qe8E03Yp8ypPpbokNnqP8P05q
	CImG4zdAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNsAj-0006gR-Mx; Thu, 01 Oct 2020 06:34:33 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNsAh-0006fW-It
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 06:34:32 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0916YNch013296;
 Thu, 1 Oct 2020 01:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601534063;
 bh=XVFQ5GLbFfp9MKYTIQfqxjcku0NgzU2HqmWayPSwDzc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=lLf3FYUNgFwfQ2v3ZS0isMYAfQ85gUFR5SPPDXvbjK0kCjz0fAW4rztXPIIG6G6Fh
 bmyEBM5L9KegNVyOpZLD2j7Fu8ftIe2aQivul+QUsCreCyEqRHoo9HmYGAaW55/3qF
 qpv2N41djolqq9m96TOX9ZW6c+TfD15hzvJ2ej7A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0916YNtF045955
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 01:34:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 01:34:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 01:34:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0916YMnH127527;
 Thu, 1 Oct 2020 01:34:22 -0500
Date: Thu, 1 Oct 2020 12:04:21 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Bert Vermeulen <bert@biot.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix 3-or-4 address byte mode logic
Message-ID: <20201001063421.qcjdikj2tje3jn6k@ti.com>
References: <20200930235611.6355-1-bert@biot.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930235611.6355-1-bert@biot.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_023431_707942_2F09F6EC 
X-CRM114-Status: GOOD (  27.91  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 01/10/20 01:56AM, Bert Vermeulen wrote:
> Flash chips that announce BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 capability
> get an addr_width of 3. This breaks when the flash chip is actually
> larger than 16MB, since that requires a 4-byte address. The MX25L25635F
> does exactly this, breaking anything over 16MB.
> 
> spi-nor only enables 4-byte opcodes or 4-byte address mode if addr_width
> is 4, so no 4-byte mode is ever enabled. The > 16MB check in
> spi_nor_set_addr_width() only works if addr_width wasn't already set
> by the SFDP, which it was.
> 
> It could be fixed in a post_bfpt fixup for the MX25L25635F, but setting
> addr_width to 4 when BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 is found fixes the
> problem for all such cases.

JESD216D.01 says: "01b: 3- or 4-Byte addressing (e.g., defaults to 
3-Byte mode; enters 4-Byte mode on command)"

So using an address width of 4 here is not necessarily the right thing 
to do. This change would break SMPT parsing for all flashes that use 
3-byte addressing by default because SMPT parsing can involve register 
reads/writes. One such device is the Cypress S28HS flash. In fact, this 
was what prompted me to write the patch [0].

Before that patch, how did MX25L25635F decide to use 4-byte addressing? 
Coming out of BFPT parsing addr_width would still be 0. My guess is that 
it would go into spi_nor_set_addr_width() with addr_width still 0 and 
then the check for (nor->mtd.size > 0x1000000) would set it to 4. Do I 
guess correctly?

In that case maybe we can do a better job of deciding what gets priority 
in the if-else chain. For example, giving addr_width from nor->info 
precedence over the one configured by SFDP can solve this problem. Then 
all you have to do is set the addr_width in the info struct, which is 
certainly easier than adding a fixup hook. There may be a more elegant 
solution to this but I haven't given it much thought.

So from my side, NACK!

> 
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index e2a43d39eb5f..6fedc425bcf7 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -456,10 +456,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	/* Number of address bytes. */
>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
> -	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>  		nor->addr_width = 3;
>  		break;
>  
> +	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
>  		nor->addr_width = 4;
>  		break;

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f9acd7fa80be6ee14aecdc54429f2a48e56224e8

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
