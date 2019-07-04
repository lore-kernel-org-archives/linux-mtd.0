Return-Path: <SRS0=Zq+o=VB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957A0C0650E
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2019 08:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A25A21882
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2019 08:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGm/2sKf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="LmvE9UMk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A25A21882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5/S272sXdylpyTwNEVaIACBrazFQUBxAO2MF2etpvQA=; b=kGm/2sKfhq0cn1+7ZHLcGHSkM
	wfqw9jj35MpxDUqCyikzKcFAzOOm4mauVeODdEmi3jn91c4ttSHYQ7pKOMbeU+ytR2j7OwBkNWTB0
	E2BzxFZ3rRH5gdmrHXODel0CKi97Kg4Py0mum1i/8egMaYfBkw6x5PKaevhRD1RpbZTs3SQ0meFk6
	UZf8WkUVOna/gMSE+2LKTaX0dG3Ku6xjPnyEmg/ss/xtXgvDnCkGhHMnlABQGG6z8Peu0gzRpOTiG
	86STUBAV6qXsBJHuxAGhRCW3EuDvvwJ1kNmZeHUFeLr4ZknvRQDts3l5DWrBJsetWAjMJ8MWwgMbZ
	t7ehhdj8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hix7J-0006Aj-Q9; Thu, 04 Jul 2019 08:29:21 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hix7G-0006AE-AH
 for linux-mtd@lists.infradead.org; Thu, 04 Jul 2019 08:29:20 +0000
Received: by mail-lf1-x143.google.com with SMTP id q26so3657110lfc.3
 for <linux-mtd@lists.infradead.org>; Thu, 04 Jul 2019 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rnem1hwsrm93G06buvpONxqUaY+n9TOak/BfuwFpubY=;
 b=LmvE9UMk/EMiGfNjNoQwH6DEFJfg8e0Z0gmAkQhrXCBpg7NB++yLlVllSc95hdmhNa
 Ae/vizscwx18LrUCp82da8IBjlNv3S0RaHaPVm/8TMZYoSydDePjs/IE1Vsa0QZ7sInE
 gn10xpIa/E1pwbP2FqW0gD0mJCkMSR2rR8+eSxkw7p5xLhttG5wp5HH7W1bvFzQ9gk2N
 3jfMtE25upVnypfht+yjzZfNbTq6tMwPVMBKRCyeErxFioryfh8a/pvsh5HwBJYXp+9I
 3+BmjvI2yxQQWV5IB8OTyVacbFKczUerwKpSjZ7C58VV+JakT0ku+nZ3gGJSkJ1nVHyj
 6ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rnem1hwsrm93G06buvpONxqUaY+n9TOak/BfuwFpubY=;
 b=Rh4p8eP+SW2khc777WXzTjqGLX5NT8MACkky12hMxrUx6gANBKDXtb0xSMdmx1QeHc
 uTbOWjt4l/QEaHMkCwyoujZK7mUBlGODJ3x0+lQevmFFlNvnCQXxzGEso8xC+eNe2NG0
 eGkRqIb6saCxe3K9azzUGYHgIIFlpx0TdFd851Agp3HS95aAd9eOA1DWS0lRl//8mkh4
 J3mfRlaIeRB3Keosmls19pRZbTyJa+w8Kah89aFsQ7hl4jAMAT4EPoMQo/KJNMZBMX57
 vPH1QWQFE4Lc4IB1QPvkyKQf2gG7xaCbT0gYbVnBSd8DQHZip36DHY5ga8BLZ7Utz1YN
 yKEQ==
X-Gm-Message-State: APjAAAUQeRt+1PSyRYRVu0D98DcBA+yQv5i0j6oIKa3AXbrD46tJjkv0
 ldULUHwVKhRD19xFg004/+0Dxg==
X-Google-Smtp-Source: APXvYqx4B0wO9flz1Xpq4e34GcOEiUr+D9RtNIxwtd12MUUrgz8GDZ8I4qxnvOSFpjDlMVr3tfeEFg==
X-Received: by 2002:a19:8093:: with SMTP id b141mr399490lfd.137.1562228956675; 
 Thu, 04 Jul 2019 01:29:16 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4f4:91a5:b48d:cad5:1349:c0d9?
 ([2a00:1fa0:4f4:91a5:b48d:cad5:1349:c0d9])
 by smtp.gmail.com with ESMTPSA id f30sm756030lfa.48.2019.07.04.01.29.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 01:29:15 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
To: Mason Yang <masonccyang@mxic.com.tw>, miquel.raynal@bootlin.com,
 marek.vasut@gmail.com, bbrezillon@kernel.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, vigneshr@ti.com, richard@nod.at,
 robh+dt@kernel.org, stefan@agner.ch, mark.rutland@arm.com
References: <1562138144-2212-1-git-send-email-masonccyang@mxic.com.tw>
 <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <93e86083-7f8a-402d-db4b-26263719be25@cogentembedded.com>
Date: Thu, 4 Jul 2019 11:29:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190704_012918_500509_37660ACF 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: devicetree@vger.kernel.org, anders.roxell@linaro.org, juliensu@mxic.com.tw,
 linux-kernel@vger.kernel.org, paul@crapouillou.net, paul.burton@mips.com,
 liang.yang@amlogic.com, linux-mtd@lists.infradead.org,
 christophe.kerello@st.com, lee.jones@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 03.07.2019 10:15, Mason Yang wrote:

> Document the bindings used by the Macronix raw NAND controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>   Documentation/devicetree/bindings/mtd/mxic-nand.txt | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> new file mode 100644
> index 0000000..ddd7660
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> @@ -0,0 +1,20 @@
> +Macronix Raw NAND Controller Device Tree Bindings
> +-------------------------------------------------
> +
> +Required properties:
> +- compatible: should be "macronix,nand-controller"
> +- reg: should contain 1 entrie for the registers
> +- interrupts: interrupt line connected to this raw NAND controller
> +- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
> +- clocks: should contain 3 phandles for the "ps_clk", "send_clk" and
> +	 "send_dly_clk" clocks
> +
> +Example:
> +
> +	nand: mxic-nfc@43c30000 {

    The node names should be generic, and the DT spec 0.2 (section 2.2.2) even 
has documented "nand-controller", please rename.

> +		compatible = "macronix,nand-controller";
> +		reg = <0x43c30000 0x10000>;
> +		reg-names = "regs";
> +		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> +		clock-names = "send_clk", "send_dly_clk", "ps_clk";
> +	};
> 

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
