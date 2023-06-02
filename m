Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3915FC77B7A
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOcTchtNw8/CsZnpR/RX2+PV3fBj2XAq7pH1Cm3ExS4=; b=YSzSXUjWdiWygA
	+wbeZIrN8fTDiT4E3XUALSPH0lwjFdmw96uPVJFWQ/KWPmj0yGugDLqwR2zpwbNwv0VBdXn2ww1kP
	51JdVqAGRrDPwddWSX//Z8OSVpEjbBiJPVypu2T7Q5W76NfNDDdlespKrCvHt1luSZXYyiyb3/Dz9
	Hve8RFH/spvB2OhzQiNNv+ibp6EB9e1TMEOutHNPlqgPB5AG2g57tv+ogn0W/TWj26ABxlNeWukt8
	Bj/vFl+u83VnHrE54Mz9E4wOdMbFOoh+8r/OVSI9tu64iCr2ec4GjXRyf00FiMpvLUaHr13KY5qzt
	lppP6sSRkTr6iFaNMGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5C3c-007uTb-3A;
	Fri, 02 Jun 2023 21:11:36 +0000
Received: from pb-smtp2.pobox.com ([64.147.108.71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5C3Z-007uSc-2C
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 21:11:35 +0000
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 9755A18640D;
	Fri,  2 Jun 2023 17:11:26 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:in-reply-to:message-id:references:mime-version
	:content-type; s=sasl; bh=f8ShItLV8CgghuGuwOojfc7jC2wXuOhPcJdUrt
	uYthc=; b=i2a/7j0RFUPfdHun3yYctOWxM3IPxNuh0kYkSPfYUwcOTzbciZg6/l
	sxMeuF5wO50gvvK/4qQZcgZ/dYFWG3vcD9DeWJvLZyiz+SifjACHe8EZJ4DwT0N+
	EDihUHmGMjw2dZNPT+vraLKQsNKWOndGKK2qYRRQj3Rn1sjm/dL5k=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 8E42418640C;
	Fri,  2 Jun 2023 17:11:26 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=f8ShItLV8CgghuGuwOojfc7jC2wXuOhPcJdUrtuYthc=; b=Z0kC22iHVruWmbGvcO7AF/5+zSBH27jOjNdFasgRVZ5ktnLP3AkcFYW20fJKHuwV1FWBVP20hRQbLhUbNqny2Lu3x1tAol1ZunYmi5DPDCcq44IXCg4FKS0XI5MJ3I3qxMEjIDkk5pqXi2vaO3pp6oxliHaAM8FfCEN5YQLvt18=
Received: from yoda.home (unknown [184.162.17.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 03FA818640B;
	Fri,  2 Jun 2023 17:11:26 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu [10.0.0.101])
	by yoda.home (Postfix) with ESMTPSA id B3F3C7CF1F3;
	Fri,  2 Jun 2023 17:11:24 -0400 (EDT)
Date: Fri, 2 Jun 2023 17:11:24 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Linus Walleij <linus.walleij@linaro.org>
cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
    Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
    linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0001: Byte swap OTP info
In-Reply-To: <20230602204359.3493320-1-linus.walleij@linaro.org>
Message-ID: <1nqsp3n7-n82r-698p-sn82-0231n75p7216@syhkavp.arg>
References: <20230602204359.3493320-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Pobox-Relay-ID: 08D51708-018A-11EE-96D9-307A8E0A682E-78420484!pb-smtp2.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_141133_939241_8C2C2C64 
X-CRM114-Status: GOOD (  29.71  )
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

On Fri, 2 Jun 2023, Linus Walleij wrote:

> Currently the offset into the device when looking for OTP
> bits can go outside of the address of the MTD NOR devices,
> and if that memory isn't readable, bad things happen
> on the IXP4xx (added prints that illustrate the problem before
> the crash):
> 
> cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x00000100
> ixp4xx_copy_from copy from 0x00000100 to 0xc880dd78
> cfi_intelext_otp_walk walk OTP on chip 0 start at reg_prot_offset 0x12000000
> ixp4xx_copy_from copy from 0x12000000 to 0xc880dd78
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address db000000
> [db000000] *pgd=00000000
> (...)
> 
> This happens in this case because the IXP4xx is big endian and
> the 32- and 16-bit fields in the struct cfi_intelext_otpinfo are not
> properly byteswapped. Compare to how the code in read_pri_intelext()
> byteswaps the fields in struct cfi_pri_intelext.
> 
> Adding a small byte swapping loop for the OTP in read_pri_intelext()
> and the crash goes away.
> 
> The problem went unnoticed for many years until I enabled
> CONFIG_MTD_OTP on the IXP4xx as well, triggering the bug.
> 
> Cc: Nicolas Pitre <npitre@baylibre.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Nicolas Pitre <nico@fluxnic.net>

> ---
> ChangeLog v2->v3:
> - Move the byte swapping to a small loop in read_pri_intelext()
>   so all bytes are swapped as we reach cfi_intelext_otp_walk().
> ChangeLog v1->v2:
> - Drill deeper and discover a big endian compatibility issue.
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 54f92d09d9cf..02aaf09d6f5c 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -421,9 +421,25 @@ read_pri_intelext(struct map_info *map, __u16 adr)
>  		extra_size = 0;
>  
>  		/* Protection Register info */
> -		if (extp->NumProtectionFields)
> +		if (extp->NumProtectionFields) {
> +			struct cfi_intelext_otpinfo *otp =
> +				(struct cfi_intelext_otpinfo *)&extp->extra[0];
> +
>  			extra_size += (extp->NumProtectionFields - 1) *
> -				      sizeof(struct cfi_intelext_otpinfo);
> +				sizeof(struct cfi_intelext_otpinfo);
> +
> +			if (extp_size >= sizeof(*extp) + extra_size) {
> +				int i;
> +
> +				/* Do some byteswapping if necessary */
> +				for (i = 0; i < extp->NumProtectionFields - 1; i++) {
> +					otp->ProtRegAddr = le32_to_cpu(otp->ProtRegAddr);
> +					otp->FactGroups = le16_to_cpu(otp->FactGroups);
> +					otp->UserGroups = le16_to_cpu(otp->UserGroups);
> +					otp++;
> +				}
> +			}
> +		}
>  	}
>  
>  	if (extp->MinorVersion >= '1') {
> -- 
> 2.40.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
