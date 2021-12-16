Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC6AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wso6P+K8FDjdq2fEba/GkZSrf00O0xrD/z3EwTTrlq8=; b=ytayWwfvmA5t2y
	n4djb7PuhIkU0/PIvvCz0TC0NJXtDBRSv/zIm6Ebz+jRik5B23QJYebhontsy7ptKBYu6vrwNOF6R
	j4jguYTDur5wxwxoOU4WYQSzw3YqWQRV8lcvuvFgcZmKJ3oQ+ADsRHoCgasbVmvLZKtcNVDLBpXfA
	uYyK869H/FcHmVD1kCeKbmWb1RltzftBToaIe3IddxSb4x7QnhC569Cnawb+L4eZcOGQwzJYicHr1
	WvWrTaJ5nAm2ZYK505/ADb8T1Qo3BHQkorRsk+ZMDgoUQYWgIE+0Sb0qRmfjmR3YWA79bTylOIWtW
	AW3ZX+01ikd3Cj5oBLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxx2k-007RjT-Sn; Thu, 16 Dec 2021 20:07:58 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxx2i-007Rj0-Rr
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 20:07:58 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BGK7suw058679;
 Thu, 16 Dec 2021 14:07:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1639685274;
 bh=y06kAn9IC3WbI952LFtdigmbuoVtt5bJX7zaiQAfKg0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GZr1K7GuBEGqnXeNj+pY4o8ly5aSsw+jfiBgZw6QVeDXQYABvyMsgN5MFJjgnfx7n
 EnVTospr106RCMIXRbGe8RXwcr0POjY50RVCqYvydFVj3ZDmUxWs9CQgr5WR+/q/+r
 EY9uf2f4bgggTAk95XRfQLBG46UncxsCSgA0myFw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BGK7sHj116944
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 16 Dec 2021 14:07:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Dec 2021 14:07:54 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Dec 2021 14:07:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BGK7r2v119951;
 Thu, 16 Dec 2021 14:07:54 -0600
Date: Fri, 17 Dec 2021 01:37:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
CC: <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: micron/st: Hardcode erase_proto to 1-1-1
Message-ID: <20211216200751.u2guamsj5ptezans@ti.com>
References: <20211209100813.61713-1-alexander.sverdlin@nokia.com>
 <20211209100813.61713-2-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209100813.61713-2-alexander.sverdlin@nokia.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_120757_009922_20474C65 
X-CRM114-Status: GOOD (  17.34  )
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

On 09/12/21 11:08AM, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> This fixes sector erase on mt25qu256aba8e12-1sit.
> Looks like others like mt35xu512aba could be affected as well.

Indeed. mt35xu512aba would need to set erase_proto to 8D-8D-8D mode.

> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 2f3054b..058bbb7 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -267,6 +267,12 @@ static void micron_st_default_init(struct spi_nor *nor)
>  	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>  	nor->params->quad_enable = NULL;
>  	nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
> +
> +	/*
> +	 * mt25qu doesn't support all possible write protocols for erase, only
> +	 * 1-1-0, 2-2-0, 4-4-0.
> +	 */
> +	nor->erase_proto = SNOR_PROTO_1_1_1;

If this is only a mt25qu thing, why do it for all Micron flashes? 
Anyway, _if_ you do as I suggest in patch 1, this won't be needed.

>  }
>  
>  static const struct spi_nor_fixups micron_st_fixups = {
> -- 
> 2.10.2
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
