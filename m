Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A90FC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/SLoyAw5njSsVyTB2m9Sg4CGdgiNy1MdNeEwXiXwPU=; b=LjMt7mbWduarSl
	OoeaDb3LGgAheSA4mSMgi0rubvbOOLHSFdH6H57BnbGC2gy2EvFMM7NXbaeGzAxWiuL/ke+Mq+UGv
	TElLTB92ul2gjVIQxRUDBaQmf2CCIeAIKWgmvGmOPubppfCpFrtgzYlO4tdRbzo/evWGutjqt6/yV
	myFYEl/UniL//kLBNCqw+AdTdrL5XntZxt3FeSmVl+9yy2nx6qREQWxObk4eaWvdPhp0fIK3Tfd/l
	DwuIbjBDQv++RH/8+HSAA+fKdQionw38aggtSJ3arvPBoa6G7/vY4u5bPxZ9XH7BZRugxEpLlW+7d
	Ck/n5KSdeRMQVUmzPeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Obb-000SLk-0E;
	Wed, 31 May 2023 16:23:23 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ObX-000SKi-10
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 16:23:20 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id E99C824CEF;
	Wed, 31 May 2023 12:23:12 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:in-reply-to:message-id:references:mime-version
	:content-type; s=sasl; bh=dNwCIwme9KBD1mWufS5y3c01KDxL685FUJh+d+
	qk3m4=; b=YiFI2vten4gNti2tTacIM2M11kLi+9Q1KHqpHMbAr3KXlYu/1RE/sq
	456iUc/lLgwJk6LFBFWRz/MF/Z8TyA+FzqtgieWT5ihGQDA0x6bIo0vgMVHDPxud
	zePcrz7Kzwf/cfY/vz+sL4K1+muj5R5TJB8VatqBD31fBGwF3UJ4o=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id E23B324CEE;
	Wed, 31 May 2023 12:23:12 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=dNwCIwme9KBD1mWufS5y3c01KDxL685FUJh+d+qk3m4=; b=jUwXe/UImPUuriF+nUPJ32jUC4pddsRFChZqbwvWKm5+yFgTxab+yleMErVOU8BBHtUm/HC3eVj2khioxDg+kIWOvykQkM0VTYOAsA5hV9IH+ba4Td4p+IGyz88Gp23K10CmQQcM6hnhY68rxXMOAgPtVSsIKO2OcLLvLdeyiac=
Received: from yoda.home (unknown [184.162.17.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 6CC8C24CED;
	Wed, 31 May 2023 12:23:09 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu [10.0.0.101])
	by yoda.home (Postfix) with ESMTPSA id 52C6C7C9599;
	Wed, 31 May 2023 12:23:07 -0400 (EDT)
Date: Wed, 31 May 2023 12:23:07 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Linus Walleij <linus.walleij@linaro.org>
cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
    Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
    linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: Do not check for OTP outside
 device
In-Reply-To: <20230530205146.3200321-1-linus.walleij@linaro.org>
Message-ID: <34n3r14p-1q7p-n074-p9os-sqsp11n3n1p4@syhkavp.arg>
References: <20230530205146.3200321-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Pobox-Relay-ID: 6E7187CA-FFCF-11ED-B27A-B31D44D1D7AA-78420484!pb-smtp21.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_092319_495404_45CF1F7F 
X-CRM114-Status: GOOD (  26.94  )
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

On Tue, 30 May 2023, Linus Walleij wrote:

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
> This happens in this case because the flash memory ends at
> 0x11ffffff, so 0x12000000 is outside the range of the MTD
> device.
> 
> Breaking the while loop of we offset outside the size of the
> MTD device fixes the issue.
> 
> Cc: Nicolas Pitre <npitre@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Well well... I apparently wrote that code... 23 years ago! Dang!
Obviously I barely remember the details.

Still, I have reservations about your fix which looks like it is 
papering over the real issue. Looking at the original code, we can see 
this from line 2418:

                        /* next OTP region */
                        if (++field == extp->NumProtectionFields)
                                break;

That's where the loop break should be happening. Why isn't it the case 
for you? Especially given that 0x12000000 is completely bogus for sure, 
which is likely random memory content outside the actual extp record. 
Next time that random memory content may well be <= mtd->size and your 
fix won't do anything.

This needs more investigation.

> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 54f92d09d9cf..a979e0316b31 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2352,6 +2352,9 @@ static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
>  			reg_fact_size *= cfi->interleave;
>  			reg_user_size *= cfi->interleave;
>  
> +			if (reg_prot_offset >= mtd->size)
> +				break;
> +
>  			if (user_regs) {
>  				groups = reg_user_groups;
>  				groupsize = reg_user_size;
> -- 
> 2.40.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
