Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175BCC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPM7RT32lnM8Jjp9dnDmYQXkFPpevPhpm6n37UV29e4=; b=yhbcT6T7SAS1Jj
	umTRlEwZ0m+Z08SsFy59uMhLynLgzKMs9EVtn/vB43nTe5JzA/obuotxeZ6TqfiNmFjgO+cBxIXF9
	fzIofYafcvJhlOzWtTJdKkXibC4YYWAxhlAzTJJxnCHcvagBM5+5tBN6e8K11QPcr1IYcdIlM6sNl
	+croHxQGgNGR9l8SgQ0V9wmKmlaZkcTwrdTJ/UbM3x6LN9OgK7AJxtVDqFVNQwFNxx9c1jOW/lwij
	nEdaFBvpN34vbHUVVvUxKp6Itym2LXYk3LSw08ATDUSiBt1jO1vfMtf+gdb6pf5DA93qhS4Z7SeNZ
	SO4MekkEGEgHwK3rWNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4R7Q-009fL4-8y; Mon, 03 Jan 2022 17:27:36 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4R7N-009fKN-0I
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 17:27:34 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id h5so11075234vkp.5
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2022 09:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Grh3iRZLDkYqgCiFWJobaJkZx4Mto9jnEwXBQ73vVs4=;
 b=mMZ8yh5BwCDZZkz+NRrigwzXbRhzhr0uT47SGJR5vQ41rWiwsqT75T/KjbMPToqiOU
 ONeOVHXANG/jIWe6RYJ3tpVidoHTRfmCGdwb62w6tp1ND329HnY4TQ3brTu4cjnySEro
 E7JvCakWwdQ8GNodifagl0smURKNMV/i7BaNbTkfslU4WP4FFTEuqzAtYegsMPjbvruC
 MmabsvRR7PK3R5O2fGvEMroZnY3/W643AZX7WGsoqlMoNsczeuKmHx2X24T0x2rGdIkT
 ShdqfeUeECkDZ9fNBgWAMNl7JJOt+LjGXYTmt6XBVS+ciYmE+DynpwBCMOztEkoLpE/q
 ekUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Grh3iRZLDkYqgCiFWJobaJkZx4Mto9jnEwXBQ73vVs4=;
 b=KwILtsCjDNA1ydzKonzVhXJv719aAKVPo7VGyThJBVv2RnSXn2IC0GAx/WszU5FHxe
 1bLItH7Lxcv6iL4JzgeUZxXTblbHR0DWODVUXuHxWibp2RCgKmT1WdXxwRMyOBl6m6fZ
 Dge+lvUaGXBlyBnxWgjsPgOfq86QJuPIOEA3Elh5ZYkLzjVE9W2BM3HdrfK+iJoV8Abd
 PzNy60itGMj3D7CrXVbOPi5p0lenEMjshMujRkpHBMWIadxnR+BCK+sreStxHK+lCnCI
 nj2H3tRhXGlU5dDoFL+2ugSKnjUEpaFIPSmECs0zY/hAkXw1mPyzb48q8AKDiuHEdxPi
 z9Aw==
X-Gm-Message-State: AOAM5322CWblpdXu9jeMtDMM3rIejWt82wVJu4JlGTtDIWGjTI6qqirQ
 5XlETfG9ooOE4HJqYf19eHY=
X-Google-Smtp-Source: ABdhPJxUFUMmfH39/l/tXRgkH25UICIz6jPCAdEbL/I7WJI7MiJEefbIklc92it83hGd4QWS/zKivw==
X-Received: by 2002:a05:6122:220d:: with SMTP id
 bb13mr6095735vkb.33.1641230851556; 
 Mon, 03 Jan 2022 09:27:31 -0800 (PST)
Received: from [10.230.2.158] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id r2sm7449338vsk.28.2022.01.03.09.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:27:31 -0800 (PST)
Message-ID: <00d8af2f-45ff-48d7-43e7-14c59a0aca62@gmail.com>
Date: Mon, 3 Jan 2022 09:27:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 4/9] mtd: rawnand: brcmnand: Move OF operations out of
 brcmnand_init_cs()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-5-f.fainelli@gmail.com>
 <20220103175606.71a4eb93@xps13>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220103175606.71a4eb93@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_092733_084877_DC224A9B 
X-CRM114-Status: GOOD (  15.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 1/3/2022 8:56 AM, Miquel Raynal wrote:
> Hi Florian,
> 
> f.fainelli@gmail.com wrote on Wed, 22 Dec 2021 16:22:20 -0800:
> 
>> In order to initialize a given chip select object for use by the
>> brcmnand driver, move all of the Device Tree specific routines outside
>> of brcmnand_init_cs() in order to make it usable in a platform data
>> configuration which will be necessary for supporting BCMA chips.
> 
> TBH I'm note a big fan of the idea. I'm not sure going back to
> supporting platform data this way really is a good idea... There are so
> much things that are well described with DT that we now rely upon that
> I am not entirely convinced by these changes :-/ The move is generally
> in the other direction: getting rid of the legacy platform data.

In the cover letter there is an explanation as to why we need to 
introduce platform data/device support here: the platforms on which this 
NAND controller shim is used do not have Device Tree support, and won't 
have it in the future either. They are old platforms (first SoC 
supported by bcm47xx is maybe 15 years old now) but they are still in 
active and wide use by the OpenWrt, dd-wrt communities.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
