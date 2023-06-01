Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE98C77B7E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jun 2023 21:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/ibPnaVVvj9s0FAw3ErCd/SLngpNYZ6k38Oe8bS3Y4=; b=lR1YZa5Jjxej/0
	WYYeCL+dpQkxVe+1+oFptLCwAG4RrVLURMIB0Vedpx0DpamWUHbGHQCicXMKmmb/45iIaVfe/gEs7
	jRiRP0rQK3b4CB26CDZvUsy+juBiMM1cxPyZnYgD+M2h2h3H193huJcmu30g8/6SEwOQftmp8IVgN
	mEIwKJCj7qZqkHJS6Xw5uNeYZ6bqtgFYwKp/Z8f/TDzIoo9mz5M6BoLMW7T3zE7sancwV2f4IlMoA
	OsD895hPlduCwPQLmiNsPDdJ/UEKKopYQrdJ1sGgriGZUaNP4yn1wIB2a8BeGKFg4IBl/81okhtFv
	TCkI75qxcG0lz1PXDCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pkV-004ydI-0y;
	Thu, 01 Jun 2023 21:22:23 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4pkS-004yab-0x
	for linux-mtd@lists.infradead.org;
	Thu, 01 Jun 2023 21:22:22 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id E64211806CA;
	Thu,  1 Jun 2023 17:22:02 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:in-reply-to:message-id:references:mime-version
	:content-type; s=sasl; bh=9S/p27oip4PDGQ9Z+oA4k3J7hNxOGBhlUwHY3M
	7RanM=; b=oFhvIozLje7dDs23AiXNPSQLXvLdgpO37eGXO49g2WOYV7HhOkKOlJ
	rv7NedO2/d55FPz1hgjagL3YlmHcsu8WC9bXRuZlbs8D5uq5q3xSXXSD4+mgkjHr
	ULp8ZZMA0KM4/5NsZPiAriNGAz8kWqCjPr002TLHJBeNLngXzKWM0=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id DDC7F1806C9;
	Thu,  1 Jun 2023 17:22:02 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=9S/p27oip4PDGQ9Z+oA4k3J7hNxOGBhlUwHY3M7RanM=; b=oZR6Zcm/1zysoFGYD0vW8lZbDxJSyoN5XYi1kXnACFVDLeJocNUfuXHOyng4o7m7Jln66NBpjVKdeXAo15+Rkq5dn2+duRTgE1ocRgOwEcrPXvAFbenON5dI7x2KTM9MTDaMU5YsxWylIXYuuIaRTyljS02NlAD3izhEyppMmvo=
Received: from yoda.home (unknown [184.162.17.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 5F0DB1806C8;
	Thu,  1 Jun 2023 17:22:02 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu [10.0.0.101])
	by yoda.home (Postfix) with ESMTPSA id 281277CCC7B;
	Thu,  1 Jun 2023 17:22:01 -0400 (EDT)
Date: Thu, 1 Jun 2023 17:22:01 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Linus Walleij <linus.walleij@linaro.org>
cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
    Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
    linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0001: Byte swap OTP info
In-Reply-To: <20230601194123.3408902-1-linus.walleij@linaro.org>
Message-ID: <66r393r4-5qnn-0nns-9q0q-3o41n27300n6@syhkavp.arg>
References: <20230601194123.3408902-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Pobox-Relay-ID: 59B8E528-00C2-11EE-B09B-C65BE52EC81B-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_142220_558003_1B8DA70C 
X-CRM114-Status: GOOD (  23.27  )
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

On Thu, 1 Jun 2023, Linus Walleij wrote:

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

DOH!

And to confirm, in include/linux/mtd/cfi.h we can see:

/* NB: We keep these structures in memory in HOST byteorder, except
 * where individually noted.
 */

> Adding some byte swapping after casting the &extp->extra[0] into
> a struct cfi_intelext_otpinfo * pointer, and the crash goes away.

But this is wrong to do so in cfi_intelext_otp_walk(). That function is 
a helper applying given operation callback on given range. Each time it 
is called those values will be swapped back and forth. You want to do 
the swap only once during init in read_pri_intelext().

Something like this (completely untested):

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 54f92d09d9..723dd6473c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -421,9 +421,20 @@ read_pri_intelext(struct map_info *map, __u16 adr)
 		extra_size = 0;
 
 		/* Protection Register info */
-		if (extp->NumProtectionFields)
+		if (extp->NumProtectionFields) {
+			struct cfi_intelext_otpinfo *otp =
+				(struct cfi_intelext_otpinfo *)&extp->extra[0]; 
+
 			extra_size += (extp->NumProtectionFields - 1) *
 				      sizeof(struct cfi_intelext_otpinfo);
+			if (extp_size >= sizeof(*extp) + extra_size) {
+				for (i = 0; i < extp->NumProtectionFields - 1; i++) {
+					otp->ProtRegAddr = le32_to_cpu(otp->ProtRegAddr);
+					otp->FactGroups = le16_to_cpu(otp->FactGroups);
+					otp->UserGroups = le16_to_cpu(otp->UserGroups);
+				}
+			}
+		}
 	}
 
 	if (extp->MinorVersion >= '1') {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
