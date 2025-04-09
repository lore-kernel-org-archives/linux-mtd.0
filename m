Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702E4C369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YM/MbgLyAmGC0C6wsVh314frubyzfVu8MaViU0j3XJk=; b=1HsiGPTYwszFuV
	9PatugJKIG6+/KvbyhGQKxQSoWtSKHzYjqeI9vHEXZI8hyT0yPgwdvS9e017YXpmCohopXlNwimh/
	Y5+4MgyPMjAHcq4qZBUdYkffwATUp5v8U5Nn+svvfMwZXM6T3HzmQ0GhqyRYxVaDh9rtRcVNVk962
	3geQdDyihswOEAdh17w6YWgMYpE0rpL3/dX2NtV477fNNVEICRwYsrzbUTE0y/OnSWE1BeCVymo7I
	1tAtsI8iZI2TLoGAw83My00xkeo4LAaP/cUZlkg7kb/1ceDj4T2f43hwRCRfVqneoPtTOWJnwh+Li
	hxCBEI1nVQxac7lO5ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yyu-000000080Uf-3bHV;
	Wed, 09 Apr 2025 17:12:56 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yq2-00000007ykd-2aCE;
	Wed, 09 Apr 2025 17:03:47 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7376dd56eccso7717518b3a.0;
        Wed, 09 Apr 2025 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218226; x=1744823026; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gduFr9psKq3/rFKzYti1e6w9zW9vBtwhKjWFoDD4Umw=;
        b=CaCeEW0FEXIDQkxYy0AXzQh2bukfTXK9/7xJ0FreHaB2QoQny2KD0NZP3hBVcniSV4
         0nSFBI2VeZr27Ur1L1cDSXXSK+Wj+6jjDIQEDvUWtaTOcBjF5JTORRxw0NE0f1VvYCsd
         sJ4MM7hsMyDJE4dO5nUBLnmF5HFsH2BdZTe8brxDynQQ82CRP4vTIVgKj/MByBNC6ioM
         Ny4PVg9tIvM6B+L7KQy0OIBCVDE067q7lsQEAA6coZbvpXNxsz2I9C2h961rzQBGaihC
         2Si2KW6XDcq+vWun/epaXnkgLr5n6W7xb7XtZvcBMzPtTEkSRjhIjrkqTW4RrYqI7i3i
         dv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218226; x=1744823026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gduFr9psKq3/rFKzYti1e6w9zW9vBtwhKjWFoDD4Umw=;
        b=BYmuPTSxRH9lMyXLcv/BPGfYAt5TXDyuXugEQVQB9GVui5VNbArEOv/o9ALsgfnMgM
         YHdnHDMNNv09AqGOadrGam99JyBmxYQ5u1axUMbdgAh+AEaAcKjjo7WBanmHDhh//doS
         lzyYNxNsObMjx4MPy6g7qpGbncMz1Enq5cx0dLm0jqD7IlzkZYPe4fKjCwSHV3dt1J7/
         nQzP61wKc77A6HIV6I5JTXPlhoV/urbYdg3bWCRzugavfbhI4bOeSTEkWTb4upnouBJN
         D8sdLvgGEF/fsXAqAy6tcxDs10sxB9PG1Fw80xEuvUiRJ15Opg8cVgZDhoe9ABin2RqE
         h0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeMUXvjVQ2OZFgaHYBxESA9dCt1AFC1FbhIlOoJZmUsW6CD1O/kKsgekulHPxN/8CZTZ4mQG+Zl5kT@lists.infradead.org, AJvYcCVYg/nkuTDPcgOBtoTRtiU2TCubO78UETBoloUyf4/rnSNgdWrVq1RmsCVWLtEZteZaBzICNJkhPK8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTgc5t+ijX0t5YbI9jTI+w1jeq6EUDhlw4lfDgc/essaEGBqlb
	DfZgc4Clh/eCSepsUUrB5U+f+JQTKBejBE4Ieajv5NBdpoK7+Ovu
X-Gm-Gg: ASbGnctrmM5lG/GIAaeQgmKbRcwDqUOmJZgzFyhz3blSUgpLZOLih7qYtmGAHLSCgp1
	4KeOTZsHjpDxVwepsCV6EQsXqv9u3P580kAVLSkfPxz5Dl9l5Z9Unp8LBip3pdUgO6WkNq27WaV
	mU3txHl5dqaJTlA9oQTl6iM8XGzX6MAi0N9+qZFSupteTUP8AZE4oitXfH5xxhqwiIAy6uzBSNT
	5zX+psTGMi279MbRmQmpy4WHrQqCSAsDYVvHePBLhD0Wr18GO+JQMU73lOw2zFvFROoBwTPXX4z
	OlLWf+zKGyM0tVXP1b6SJPh7gf3s1gplICoEHzq2
X-Google-Smtp-Source: AGHT+IFo/aQceu0toKb44OYHKBYM0JofkQ3whuz+MJluns/fIT/s5YOPql0qpyNQQjmA8CWqrkcceg==
X-Received: by 2002:a05:6a00:2408:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-73bae496ce6mr5244634b3a.3.1744218225458;
        Wed, 09 Apr 2025 10:03:45 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d54d32sm1590079b3a.72.2025.04.09.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:03:44 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:03:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z_aobrK3t7zdwZRK@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-3-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_100346_662421_86ECA65B 
X-CRM114-Status: GOOD (  16.91  )
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

On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> index 70a4024d461e..5e1b7b1742e4 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> @@ -5,6 +5,7 @@
>   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
> @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
>  
>  static u8 calc_parity(u8 val)
>  {
> -	unsigned i;
> -	unsigned tot = 0;
> -
> -	for (i = 0; i < 7; i++)
> -		tot += (val & (1 << i)) ? 1 : 0;
> -	return val | ((tot & 1) ? 0 : 0x80);
> +	return val | (parity_odd(val) ? 0 : 0x80);

So, if val == 0 than parity_odd(val) is also 0, and this can be
simplified just to:
        return parity(val) ? 0 : 0x80;
Or I miss something?

>  }
>  
>  static void vivid_vbi_gen_set_time_of_day(u8 *packet)
> -- 
> 2.34.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
