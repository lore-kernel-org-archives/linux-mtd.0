Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457BEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jan 2022 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqUuwyfJVNcLE/sJCTnMWGZlaNURoWHmJaro4ooWOWI=; b=JtPGiJWNqnoNXk
	jnwcWgtd6fc8AUwUP95hO7D3rXQ0GZt/JxKXBEWH+b5q1GZ4BFoNmdVbEwaO6UI0JGFmFS3h7angm
	+xjgfoUl2b8YZmF3GB8QjP4m/xSEWHpZu/+ka4dNkpj+D1u13/eEkBcVh5a7VocOzUwSQDN1EflpH
	N234WpU30egQ+McEu3w9sGvTf5LM5nwpw/26Mc42jglFC5HkwJaz3LfvMZwaCMeVTDz+IcsMRw81r
	fwoVisM8SWrCOyB5BYEd8HW8PBWhZ7IoO4lxLBFhS4jHhlddJSmAgCMEUDe2vbS9gmeNZ7D8oTnCR
	FW6ZhovP0mEmIlzZLzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9qPB-0025sw-SI; Tue, 18 Jan 2022 15:28:17 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9qP6-0025rp-9p
 for linux-mtd@lists.infradead.org; Tue, 18 Jan 2022 15:28:13 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 23A303F1E1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2022 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642519684;
 bh=1OLNttQ1asKxdD9jkTevvJIOQX0Ntd1aencr/Pbi/Sk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Ns7iRb7++kzOGoqt7alD41eFuhkhDfYMun6wh7dTxs9F98bMJYAzONYAkVJMnZiYX
 K297ESSC7dSiMnYVFoWfbzN4ybPltXhyZa6eCb/++3a50B1jwCo9WVg+Waae2GF8hp
 rg6DKU5lhkY/wkCdl80ZsX+BeACPMNksWOVTZOt4c1RCf0kNNDg013xcWuBxkl0qK1
 3dyR+P9XbSoeJD4/EhfDwVeyQjWUYZ9EQpWxNuKMy+DtanMILmiCWuzj71y1AR8LcV
 iKgCvBUTTQrUtnB+SgSlWM5umU/3d1huRmTYtabWATTASfcwa/5WSszd1FCzT/jez5
 t/jPy1u73rtDA==
Received: by mail-ed1-f69.google.com with SMTP id
 t13-20020a05640203cd00b00403cefbefe7so552784edw.7
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2022 07:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1OLNttQ1asKxdD9jkTevvJIOQX0Ntd1aencr/Pbi/Sk=;
 b=S8KvHUIl0s+P6i/ocOZY13VHI/UBfi0pwREpiF4T5t9Zj9GBAoQ2zOj94biK2TObW+
 d8YS8qW4R7Ucjxroy0aiXFJMrSyi13b4tjLUt9yj5UY7tXeitLo92yBtoH8vQQ8Z36/s
 3d8Oje1DSAiWKSnQHpU1NYEZTOidjZqHG3Jzp5KqG5LFplISKOxOenSuTbFsM4AcSdI5
 5aVdOFEH+3mCnp1pnYHSdvoEeTu9ZB8lSB+Kp/ZayrNLpaJ2xluPo5/SZOR12EED54+e
 dTGCcroeX2JZzzIbAovZtlXZleBs+IGjAJ0MRDSARY29onCXnE+E7CZvPAyB8NzyK4ZX
 xudA==
X-Gm-Message-State: AOAM533CINY90QBofmwlBuxcRXXqqPg7el987eYAtxwSE06vessqBk91
 l0Q8SwgVh3/7RWx3jofX4CHsZE2j7f8I7b/5jQg04aEGEYfLgSc0YvVBqyFrTRmnc/Hjh/KngGg
 9t9elUkLEXmXYhTSQ9lFT5zr+FD7Vz3yKJBPuyUBQLpA=
X-Received: by 2002:a05:6402:274e:: with SMTP id
 z14mr25982740edd.242.1642519683795; 
 Tue, 18 Jan 2022 07:28:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygIRF9yVUauzAmFNSOP7FJ5sfUvWWzgizmrSffrYvLCHSnxw9NEINuO+ImEIkCQiDNBvlFMg==
X-Received: by 2002:a05:6402:274e:: with SMTP id
 z14mr25982726edd.242.1642519683665; 
 Tue, 18 Jan 2022 07:28:03 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id cd6sm5424697ejb.91.2022.01.18.07.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 07:28:03 -0800 (PST)
Message-ID: <4feae128-0e15-1c80-0974-f0d535734463@canonical.com>
Date: Tue, 18 Jan 2022 16:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] mtd: rawnand: omap2: Prevent invalid configuration and
 build error
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com
Cc: vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220118123525.8020-1-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118123525.8020-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_072812_510424_C17F81C2 
X-CRM114-Status: GOOD (  13.23  )
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

On 18/01/2022 13:35, Roger Quadros wrote:
> We need to select MEMORY as well otherwise OMAP_GPMC will not be built.
> For simplicity let's select MEMORY and OMAP_GPMC unconditionally as
> this driver depends on OMAP_GPMC driver and uses symbols from there.
> 
> Fixes: dbcb124acebd ("mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/mtd/nand/raw/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
