Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E528FC021B8
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Mar 2025 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S57sSSvgY7YP/m4W35EYcTwOkJWTw1H79Mt6S/HvIT4=; b=Zf07aZ/biqFTGI
	TBlF8+oFW6MHVHLAFmMNElurVpagQmzj+Y88eDGu7nMgo+EJ1HNyVa92hecsueSpJVDxunIqLE4No
	7AiCjUsXV3AYilD7Zt5Cz9ATaF4jJhrHM9QlolG9gfIrfyHRSo1ym3V9v/f4ta8pnc12gyyq3i9B7
	7w9pk4WgBXPmnqMMxtqNnliNtBb++aIy65gZeb44Iwk04aCzRPN0i8Cnv01jzMfd6XjucLfmgJuG5
	7ndoUeqQ0joOB3mgBPHl1/L+JNHMjnhJIrFx9Hvpe+v1ejuwEB9iXq7wHUENi7KSxlB55v293LQZY
	R17xtYEcleJcT/IS0jvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toZin-0000000FI1F-2FyT;
	Sun, 02 Mar 2025 03:10:29 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toZij-0000000FI0i-3O7u
	for linux-mtd@lists.infradead.org;
	Sun, 02 Mar 2025 03:10:27 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6fd5f8f3e8eso6513277b3.0
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 19:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740885024; x=1741489824; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4LbN5fYyUHQt3Ti89i5IrvWdlm9UYzm7rEomie5t+cc=;
        b=iexyFIIh3tSru1xgrtrAyn0KVBJehiRbDgCvaXZug/RNTh4D5Faj7TdmhwqgMTE4bS
         dHc46TMMlG8YHK0FdpvQA/D0jnpmwIy4gsmCIu+9HEW2EB/3KSLn6wqHZZ8KZA9n1TSB
         JuGBc/Ra6x3GKCbo+y4sBvtRHo2zK3tTA00OSvzEQzacV4pdSuOho38dh43kCkB3hlxS
         3TOg3ym4llSlsrlgFpe7mcKu+BkpI/oNQoLCA8IPr86TYHNCn3DYfbVn2AgAdv19A6Xt
         NohcfXR9FrSrZ1nAbheOxfs25OUNmrIUeE0NPRpb/TEUZzNWm5SFP8DK+hmX4+HGD46S
         iaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740885024; x=1741489824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LbN5fYyUHQt3Ti89i5IrvWdlm9UYzm7rEomie5t+cc=;
        b=GFY1RY1U/g1AAAYyvvLOLqiKL0oFynhfJ2TuwD1FtqL65m3i/p70BT2V3AAkyzrRvp
         PlmVAABf/WiXMi50vuhgh6oqgacx+cwZXSrTx0U1XSEV2/gJrpqSfVF+2xXeGa/9G6U6
         hQCa3dG977tcJSQsIUQsq9oQfBno7JFCMvFs1TbLv4nUjN1zrrp1Sxqx8vG+FLUYldRU
         CZ+mB63hswpZuynwR19oxj9Uf7WwC+ymLRayG/6TWV5WS7pnCBGlUVCycooxvRxUNHeI
         CviKKX/f3OA8HQnrnideR0tasHUmTbX7CyJaTyalg+Fl/RFCrwr8Ke6Y65uU03bm+LBu
         QBIA==
X-Forwarded-Encrypted: i=1; AJvYcCXnq7vGSjtMmExEZMPjDeEPTnOI2o5T2ryAXepk1r+R5V6v8UIOMXzi5Aq22WP3KPXnC5Zk3+j+si0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPBRrbuOOO5O6usvAp7Bg2y4lX9WyRlrEPi1VStVAtQVtVFeXW
	/iH+Dquk1GMkX9gLFqF3VCvo9NLaCO8Bu+COtwMMSs07KCyPtaC9
X-Gm-Gg: ASbGncvkyD9cLK/RTuKv7ZEtdwUg5VsfB9zqM807wO1W48pNzucWVPypXqma1cb0jof
	65TCcf/HwXMeciDwShOHWOKYF0PUEum2qoGX34W0anZHzWzWqD8YZPaFdgu5XcyNEZJo0S73i7U
	YdMHthDfDceh7HCHk79LsP6jN2yISlINFnf9UeX/bJN10UR39PibOFxHtZhDAx815vDj3LR7RW4
	5a+eUesk7SVZ2RiGVXf+N3byYGx8HiHvo27S56Cg90ITFGLA3ET04GNvVw2CQNJkiAJh/WojcQ1
	mIN1R34IbY7ZQj4UQ4/n7cA6DixU8IvwF780VTN/qLSvclLOk8kkBvIfkaV7BPIAJCrUbPSGi7/
	Jk+AO
X-Google-Smtp-Source: AGHT+IEy03FjYEvkbsUi6/ttRTlOKe4T1PD9HCNrsgjQ3AH1f8i6gR4SnirQZ7DNyXo/QUPkw2L8/g==
X-Received: by 2002:a05:690c:4b12:b0:6fb:9450:b0c3 with SMTP id 00721157ae682-6fd4a02b0d8mr124121857b3.19.1740885024067;
        Sat, 01 Mar 2025 19:10:24 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd3cb9dac4sm13986657b3.102.2025.03.01.19.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 19:10:22 -0800 (PST)
Date: Sat, 1 Mar 2025 22:10:20 -0500
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
	jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8PMHLYHOkCZJpOh@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250301142409.2513835-2-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_191025_872655_D609ED5E 
X-CRM114-Status: GOOD (  27.51  )
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

On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:
> Add generic C implementations of __paritysi2(), __paritydi2(), and
> __parityti2() as fallback functions in lib/parity.c. These functions
> compute the parity of a given integer using a bitwise approach and are
> marked with __weak, allowing architecture-specific implementations to
> override them.
> 
> This patch serves as preparation for using __builtin_parity() by
> ensuring a fallback mechanism is available when the compiler does not
> inline the __builtin_parity().
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  lib/Makefile |  2 +-
>  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 lib/parity.c
> 
> diff --git a/lib/Makefile b/lib/Makefile
> index 7bab71e59019..45affad85ee4 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
>  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
>  	 percpu-refcount.o rhashtable.o base64.o \
>  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> -	 generic-radix-tree.o bitmap-str.o
> +	 generic-radix-tree.o bitmap-str.o parity.o
>  obj-y += string_helpers.o
>  obj-y += hexdump.o
>  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> diff --git a/lib/parity.c b/lib/parity.c
> new file mode 100644
> index 000000000000..a83ff8d96778
> --- /dev/null
> +++ b/lib/parity.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * lib/parity.c
> + *
> + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> + *
> + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> + */
> +
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +
> +/*
> + * One explanation of this algorithm:
> + * https://funloop.org/codex/problem/parity/README.html

I already asked you not to spread this link. Is there any reason to
ignore it?

> + */
> +int __weak __paritysi2(u32 val);
> +int __weak __paritysi2(u32 val)
> +{
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +EXPORT_SYMBOL(__paritysi2);
> +
> +int __weak __paritydi2(u64 val);
> +int __weak __paritydi2(u64 val)
> +{
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +EXPORT_SYMBOL(__paritydi2);
> +
> +int __weak __parityti2(u64 val);
> +int __weak __parityti2(u64 val)
> +{
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;
> +}
> +EXPORT_SYMBOL(__parityti2);

OK, it seems I wasn't clear enough on the previous round, so I'll try
to be very straightforward now.

To begin with, the difference between __parityti2 and __paritydi2 
doesn't exist. I'm seriously. I put them side by side, and there's
no difference at all.

Next, this all is clearly an overengineering. You bake all those weak,
const and (ironically, missing) high-efficient arch implementations.
But you show no evidence that:
 - it improves on code generation,
 - the drivers care about parity()'s performance, and
 - show no perf tests at all.

So you end up with +185/-155 LOCs.

Those +30 lines add no new functionality. You copy-paste the same
algorithm again and again in very core kernel files. This is a no-go
for a nice consolidation series.

In the previous round reviewers gave you quite a few nice suggestions.
H. Peter Anvin suggested to switch the function to return a boolean, I
suggested to make it a macro and even sent you a patch, Jiri and David
also spent their time trying to help you, and became ignored.

Nevertheless. NAK for the series. Whatever you end up, if it comes to
v3, please make it simple, avoid code duplication and run checkpatch.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
