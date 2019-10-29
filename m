Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E213DCA9EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 09:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B892083E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 09:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sjaiJnii";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="H3JkTksc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B892083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MG37VMGm6wdHo9vV2/zuwcs9ulwej85sUaXUpn6MbQ=; b=sjaiJniijg/bc/
	G9b3MLVuPP0TREJ3/sPCPym+0q6rrC/XT9dgAMQshJH8GdATQuN/cDkUmbNCkMJGSHYOnjFdLNM6R
	/ApsyFLU9CzBV9n6dEJ9L8cNw9caijWkaLNQ5zd2i42xXae1I39WbIkTuisQ/dMo6o0rmgAv17jr0
	hrgrRYZ09n82cZs/mOm7d8k0aZtV3Av8N2rTIHDh2MlhzgShPHGmetcT/Q/I7LKJE3Yn+VyvATY/a
	VjaOBvsZw+OP/e7Tt9FKpUyPJQ+Za7PKAt0mHrFbwTz+S5wfmYRWoXar77AsRYE+cMxPRo+Ruy2Lr
	jzknzaeRIreeiqleBVag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPNb0-0002xR-Ra; Tue, 29 Oct 2019 09:15:23 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNan-0001RY-Mx; Tue, 29 Oct 2019 09:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iENbg+FdOJeAwjiRGinPqnU5SrOnnqln7JfFosCjnn4=; b=H3JkTkscyd9P7wDj27DHoHwRV
 ZRLlduecjL1PLM71TFPypN4uUjukvtpEwLe45Re5UyWtlmfQ55pC0oEwBwzNSBGA9mdpSKkar7DvS
 C8uZI25CEO34oBSLmWGrDtIOw8+XhRSUPcWrRS1VqFAnl6QiWXMCnSNRKG2I/w+l5yeK8Ve6ccaFd
 1kjTwJQC0uIRYBCqvwAKUUVFcjzl7zH1qSQfaUZ74Sd5xHV7727LW8I9aOM+ZO9u6CTKqyVE9H+5l
 yGLChwVob0lycs2Ve0oYi0oEp7pS8SKVsAdUf5ucOk+GdclZo0OQre6e+Gxy0LKFV0L1PNZImYAr5
 eJT2c0JBw==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:48926)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iPNaK-0000fQ-HD; Tue, 29 Oct 2019 09:14:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iPNaD-0004Vk-Up; Tue, 29 Oct 2019 09:14:33 +0000
Date: Tue, 29 Oct 2019 09:14:33 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Subject: Re: [PATCH] mtd: devices: phram.c: Fix use true/false for bool type
Message-ID: <20191029091433.GG25745@shell.armlinux.org.uk>
References: <20191029032142.GA6758@saurav>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191029032142.GA6758@saurav>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_021509_931773_1261A152 
X-CRM114-Status: GOOD (  17.17  )
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
Cc: vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 joern@lazybastard.org, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 saurav.girepunje@hotmail.com, tglx@linutronix.de, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 29, 2019 at 08:51:42AM +0530, Saurav Girepunje wrote:
> Return type for security_extensions_enabled() is bool
> so use true/false.

This doesn't seem to bear any resemblence to the subject line.

> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  arch/arm/mm/nommu.c         |  2 +-
>  drivers/mtd/devices/phram.c | 11 +++++------
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
> index 24ecf8d30a1e..1fed74f93c66 100644
> --- a/arch/arm/mm/nommu.c
> +++ b/arch/arm/mm/nommu.c
> @@ -56,7 +56,7 @@ static inline bool security_extensions_enabled(void)
>  	if ((read_cpuid_id() & 0x000f0000) == 0x000f0000)
>  		return cpuid_feature_extract(CPUID_EXT_PFR1, 4) ||
>  			cpuid_feature_extract(CPUID_EXT_PFR1, 20);
> -	return 0;
> +	return true;

This isn't explained in the commit.  You explain why it should return
true or false, but you don't explain why converting this from returning
0, aka false, to returning true is necessary.

>  }
>  
>  unsigned long setup_vectors_base(void)
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 86ae13b756b5..931e5c2481b5 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -239,27 +239,26 @@ static int phram_setup(const char *val)
>  
>  	ret = parse_name(&name, token[0]);
>  	if (ret)
> -		goto exit;
> +		return ret;
>  
>  	ret = parse_num64(&start, token[1]);
>  	if (ret) {
> +		kfree(name);
>  		parse_err("illegal start address\n");
> -		goto parse_err;
>  	}
>  
>  	ret = parse_num64(&len, token[2]);
>  	if (ret) {
> +		kfree(name);
>  		parse_err("illegal device length\n");
> -		goto parse_err;
>  	}
>  
>  	ret = register_device(name, start, len);
>  	if (!ret)
>  		pr_info("%s device: %#llx at %#llx\n", name, len, start);
> +	else
> +		kfree(name);
>  
> -parse_err:
> -	kfree(name);
> -exit:
>  	return ret;
>  }

At least this partially matches the subject line but it looks unrelated
to the other changes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
