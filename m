Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02968C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 00:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ezfz3/wqX7ljgnu1/gJ0iciggHLxouw+mamz1OEjij0=; b=Bs8JzQL5hrVa8h
	RhQlY4xNrEO8hTICJO0lUip2usGl/YaX198QN9SgfFMr1I+2I4UD3WgaWghcmZfxXix+X/TOcurjQ
	FD56uO+lpQFsmnKU/cvOOtb83KC8/KUrJjB7q3fGBOyaZN2KMF3k7WF2XJ8+kepGLCHPSKR7/mYK2
	IlvnSk6DE2+gtZuawucOokMGoHiliSB1F1JU+hgd/rFLmd2EvU6ulwYlYrSRFDpZPRibKaCODoWJ6
	204eac72BukMScNF5DsAMnM3W+9lTUIYgpGKGeAKIy9feUr67qEjN0cfJHKNejRWo64KOhjyVjOau
	V65JX9ZZIayK05clATTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQrY-00000003DAp-0yti;
	Mon, 09 Jun 2025 00:59:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQrV-00000003DAV-16gF
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 00:59:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2360ff7ac1bso11570525ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Jun 2025 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749430780; x=1750035580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1UZ3G3hP2PMByn8gAasj2ugyuBhdWDYhYy8rSg1DMCk=;
        b=gBHo9k3pH2jbRYNAbOG+8H//ttoF+6hLDghdIdVUQiXEODDS7gFb6wS/2L8Djb3zGt
         PNSQPl8542rESg7q6vc0qGuo/b0C+eAyJaoIjWywuFhwopqKauL62ta9BrLZ9NZzukYM
         7gqSYKJFH1PyUYSInj6x1/QjH5KVfMMEbXzE8v0VgLiY/kRhZ0DjdlwtNCJ+ASQz9azk
         1Lso9+Ntr8jAalQTEdFMcIg5lZaxfS4DocfGHrUQuj8vTlvaxokv+KbAeK/zDi5l/Rkx
         mtjnrnmvs4rUp5WaVzMO+/iljoAZtaDeUqzXJrXqsKQmUwiUgUvPQ2lSfxF5mlCzkukm
         DZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749430780; x=1750035580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UZ3G3hP2PMByn8gAasj2ugyuBhdWDYhYy8rSg1DMCk=;
        b=cvOHftqJZuKfRx2QbPFXjZkSJA2BHbFkHoI37AD95GhXukKHq3U/sfDB2hIFkJjXGK
         +l7Wn51t2LUkY/PFhM4G/BTkgJYBxpwlUGkdSUJh5UXf0oPBQ6tPBbpKq2oxYueY1myK
         REyBVawgjclSdg2pa2822J+WuhPI4QX+thWlMuE+3hJHRjB5r5jrWT4oxIOp45FGhGSK
         bUiXr3Wzs7xLsH2LRVJMbDpG4FB/tL+8UEflMyBXZkpUUit8wKXLLT3tDfQYsFtwdKbd
         UqWmELLvbAGBEyh3/a/ZauJvwfoJ8MZMM3k4hfTusTfHixdSR9kNF0G+hKjpBoEQdRRi
         1Q8w==
X-Forwarded-Encrypted: i=1; AJvYcCXKqvTyXefi/neDTAfmdUGDhCaUIW8kkOOuTPjC4Ed3WUS1wokr8mUKS8r7i77tP0uPlmbuRlqQz6o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyidxslxMxRlNTfxamInoO7imkAg8Z8XbpLPP2FD5VxLKSTvZq6
	t/Ko38zjfkVk66DriuiwDEKhjgEs2uFVzc4Q678PZ61++lOqNTt73lQK
X-Gm-Gg: ASbGncur26O/mZXp1FqVfBHPhedDjoyfE0P/oIsRH3YJez1y8LLQ8eR/5GoAOYGObK+
	aLTRwR/Qhk3m84pZzBHKRnTEhCaCbIwCmL00pRO+lYHYNaExvksshxqXj2yIq3wKs6rfcZSNi6O
	CVXvLzVrVLWD4x5UAodcYSO0gx2cNDLhlB3XKljkWlJgm5ICCOyFi6x7srIoIJZAh/IGo3W9cTv
	kFtbndZTHYSn1SfHZyXb7muhApKuIGSOTvLLkNEwOwlo1EIe6jdAZBBO0I6XJJRViXlw3K8f2Wm
	9tUE8jWXUwBQK4zkDJNCuGAFgvB4TQ4DfzA84hczooFf4dessfte/g1Bvp9Zl7tkeXM78rctzOh
	ZHAVGNGmhUdcfvwnMt+nag087/8KoZeHZnnzJnoXFTwuePw==
X-Google-Smtp-Source: AGHT+IFx7Bw//bf81ZFuNLNFxpt0Z3XFm1C4VkqMkhOt4fhQ54pvjlNDTtmhS80ppAjEon3na2MsaA==
X-Received: by 2002:a17:902:e84b:b0:234:cf24:3be8 with SMTP id d9443c01a7336-23601d172bbmr161947955ad.28.1749430780376;
        Sun, 08 Jun 2025 17:59:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603096983sm44234525ad.85.2025.06.08.17.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 17:59:39 -0700 (PDT)
Message-ID: <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
Date: Sun, 8 Jun 2025 17:59:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87bjqyja7o.fsf@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <87bjqyja7o.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_175941_309354_BF1B008F 
X-CRM114-Status: GOOD (  20.16  )
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

On 6/8/25 12:37, Miquel Raynal wrote:
> Hi Guenter,
> 
> On 08/06/2025 at 07:00:10 GMT, "Usyskin, Alexander" <alexander.usyskin@intel.com> wrote:
> 
>>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>>
>>> Hi,
>>>
>>> On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
>>>> Create master device without partition when
>>>> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>>>>
>>>> This streamlines device tree and allows to anchor
>>>> runtime power management on master device in all cases.
>>>>
>>>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>>
>>> Several of my qemu boot tests fail to boot from mtd devices with this patch
>>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>>> see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=y
>>> when
>>> trying to boot from an mtd partition other than mtdblock0, with the
>>> mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
>>> Is there a guidance describing the changed behavior, by any chance,
>>> and how the boot command line now needs to look like when using one of
>>> the flash partitions as root file system ?
>>>
>>> Thanks,
>>> Guenter
>>
>> I've tried to make is as transparent as possible for the existing users.
>> Only change is that now every partition has master that is not partitioned.
>> Is the CONFIG_MTD_PARTITIONED_MASTER=n fixed the problem for you?
> 
> No change is expected, can you please describe the devices that you
> observe with and without the patch? Maybe there is something wrong in
> the core logic.
> 

I am trying to boot supermicro-x11spi-bmc in qemu from flash partition 6.
The qemu command line is something like

     qemu-system-arm -M supermicro-x11spi-bmc,fmc-model=n25q256a13,spi-model=n25q256a13 \
	-kernel arch/arm/boot/zImage -no-reboot -snapshot \
	-audio none \
	-drive file=/tmp/flash,format=raw,if=mtd,index=1 \
	-nic user \
	--append "root=/dev/mtdblock6 rootwait console=ttyS4,115200 earlycon=uart8250,mmio32,0x1e784000,115200n8" \
	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb \
	-nographic -monitor null -serial stdio

This is with aspeed_g5_defconfig. Note that the flash models need to be specified.
The default flashes are no longer recognized when booting from qemu since commit
947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info fields").

The above only works with this patch reverted (or with v6.15 and older, of course).

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
