Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B77C021BB
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LmYKLoRYk2bEL5Z4E8P45ZAY/53+zcvbR4q2rDjrbs=; b=4FfrJ7aWSL+KJt
	lwaEWm3nHETgad/k/Vejv5aP33/4tr6iEB5faGMI72GQ141J3mbkQzFYsyf9XP379rbe5k81TFtKk
	EaOlFW/qt0HHub/Qu70wOrNvh0xTDPoVUJfn2zFjvZyBA78VlRoY7YycrCkJRlSI0AVWYLDupSgfn
	zV3eXnUH67kW/iraQMxz3MyqBxCflaVgAV0DXAaDaJdVv8IG2cgAUk7845ZbaEeVN0WFB38/QQM0j
	88rYEQ/EPolb2tfmK0Woz0faZN9KdV86+w4rUiWVUcK/vezAkAj3PFl5UH4JHEad/oEZWH7fhuNsv
	tKPymq4FOZVcvOu0yJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tme6g-0000000Ey1Y-1cLs;
	Mon, 24 Feb 2025 19:27:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tme6d-0000000Ey0k-3Mv5
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 19:27:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2212a930001so18026865ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 11:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740425227; x=1741030027; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNLdUwijT6W41ZsoblnFA+2AFZPup2ylwdIktRpNhS8=;
        b=c5Bu5XkzzoDa1iSLxOWJRAxaSdERuo693r11+/jWNCAIhoTfCdfVKrKe8ZPse8Zmvo
         tjuHzg+1vPdkVksmRf+hyaFE/fhQa8e4HESLuX+XcXqbAVeO6ZRko0eLMq0n9HVfe4XE
         VFHyouKDhNtpUnnJ9BlraTF8Npbf0896K7a2Igbo1DjvFfH4MXlgmixb/YT1kCpc9qag
         N+vl9culKIyEqqrjxgB3h4YavTArWfVlFY9iRLYlxmBMnvqObm2V0XHhXk8PmzXjd7v5
         yMcRr+wRqqxMnRYqCg04vtVjixsigj022pFnivHtESN0MvO/M12iUyVRXzA5Fqx6wkkf
         07mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740425227; x=1741030027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNLdUwijT6W41ZsoblnFA+2AFZPup2ylwdIktRpNhS8=;
        b=IdT2qLNcCeOqN3PEm/BRNb4vqsWC3V3QbZi6gar2ewl0K4YFGIaZx8dG8CtlYEqdFG
         Jr8vjJqm01cGNkGMei3r+TPQ57oHgx1vGte4OsZQh4gOenmctN3Fo1Hc1/8eEShMcZA4
         OIM7QbmNk0je6uSZf1VYTSkNJNQPKPNHx1UVDfptauGmZtjdX+UhlNg4iX/pJaO3I0Re
         IkBW8D9Nweb2y4QBo8RhIZKVy0R+EBUi+87Z7sERRCPTgDb9JLoZPW5Ce4c93SZwzJRZ
         Y9U3KUW9gmdiBMdJEhnWqjCgfA6Te99hYwZAzrg6zF2H9c4tfZ/wm89cQfM2NTNFtYjf
         7ltw==
X-Forwarded-Encrypted: i=1; AJvYcCUUT7D0dAR4+UyLaW8+H4VJt1WBAXCq+viagDzlHc5GmMP25z7Kit2EsiGXoaANQtyDp4PsrGRLefE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOESlHZxf0neZBEn1wClAEq+oLu0vZolYDHaS7DcRxphtwwTe+
	oa3/2N4hCO6H5Qu68kVoC7GrghdXmuO/sF/+yI3K6Vpb+5GEaHSS
X-Gm-Gg: ASbGncuo7Rt/EoKZeMumEUpZ9PrNkAsUUFpD4Nk7rmIEvAoRhRJUZkHiKih4759J2QN
	4ziWZ68EhYFf9yQvxmyeYMhlpLC06kDoS0ocvY86TLxZrzenJ99aUQ+tF4BDwFCZSHa+g+zsY5s
	5n8MG2wFt51NRMJAudtqJLBHOZOS+Bv43+DfDiDRimU2Zg8izSulgA7LTs1XwEWTrtMm0Y5eM14
	1zhkJeW8vM7Dyxp+rOZndM26qHDGsf8nlfEPsEIpw0Y5LvfV5bcY5tQFj/YtETJylPMEqp1cWkl
	awM4+mlmoL6F5ABQSVJacyWH9/ZfzLSSu+aucxVJ15DCpkbd1w==
X-Google-Smtp-Source: AGHT+IH68TTuhENvYMBVibjVTmGrUAIBmwlMSF4lzlrMkZQD90CN6i4oKdfqdXSCYQRlTI+LIK96VA==
X-Received: by 2002:a17:90b:38ca:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-2fce86cf118mr21465186a91.19.1740425226496;
        Mon, 24 Feb 2025 11:27:06 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3da759sm31947a91.13.2025.02.24.11.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:27:05 -0800 (PST)
Date: Mon, 24 Feb 2025 14:27:03 -0500
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
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z7zIBwH4aUA7G9MY@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250223164217.2139331-3-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_112707_847572_DEEDE909 
X-CRM114-Status: GOOD (  31.29  )
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

On Mon, Feb 24, 2025 at 12:42:02AM +0800, Kuan-Wei Chiu wrote:
> Several parts of the kernel open-code parity calculations using
> different methods. Add a generic parity64() helper implemented with the
> same efficient approach as parity8().

No reason to add parity32() and parity64() in separate patches
 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  include/linux/bitops.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index fb13dedad7aa..67677057f5e2 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
>  	return (0x6996 >> (val & 0xf)) & 1;
>  }
>  
> +/**
> + * parity64 - get the parity of an u64 value
> + * @value: the value to be examined
> + *
> + * Determine the parity of the u64 argument.
> + *
> + * Returns:
> + * 0 for even parity, 1 for odd parity
> + */
> +static inline int parity64(u64 val)
> +{
> +	/*
> +	 * One explanation of this algorithm:
> +	 * https://funloop.org/codex/problem/parity/README.html

This is already referenced in sources. No need to spread it for more.

> +	 */
> +	val ^= val >> 32;
> +	val ^= val >> 16;
> +	val ^= val >> 8;
> +	val ^= val >> 4;
> +	return (0x6996 >> (val & 0xf)) & 1;

It's better to avoid duplicating the same logic again and again.

> +}
> +

So maybe make it a macro?


From f17a28ae3429f49825d65ebc0f7717c6a191a3e2 Mon Sep 17 00:00:00 2001
From: Yury Norov <yury.norov@gmail.com>
Date: Mon, 24 Feb 2025 14:14:27 -0500
Subject: [PATCH] bitops: generalize parity8()

The generic parity calculation approach may be easily generalized for
other standard types. Do that and drop sub-optimal implementation of
parity calculation in x86 code.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 arch/x86/kernel/bootflag.c | 14 +-----------
 include/linux/bitops.h     | 47 +++++++++++++++++++++++++++-----------
 2 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
index 3fed7ae58b60..4a85c69a28f8 100644
--- a/arch/x86/kernel/bootflag.c
+++ b/arch/x86/kernel/bootflag.c
@@ -2,6 +2,7 @@
 /*
  *	Implement 'Simple Boot Flag Specification 2.0'
  */
+#include <linux/bitops.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -20,19 +21,6 @@
 
 int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
 
-static int __init parity(u8 v)
-{
-	int x = 0;
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		x ^= (v & 1);
-		v >>= 1;
-	}
-
-	return x;
-}
-
 static void __init sbf_write(u8 v)
 {
 	unsigned long flags;
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..29601434f5f4 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -230,10 +230,10 @@ static inline int get_count_order_long(unsigned long l)
 }
 
 /**
- * parity8 - get the parity of an u8 value
+ * parity - get the parity of a value
  * @value: the value to be examined
  *
- * Determine the parity of the u8 argument.
+ * Determine parity of the argument.
  *
  * Returns:
  * 0 for even parity, 1 for odd parity
@@ -241,24 +241,45 @@ static inline int get_count_order_long(unsigned long l)
  * Note: This function informs you about the current parity. Example to bail
  * out when parity is odd:
  *
- *	if (parity8(val) == 1)
+ *	if (parity(val) == 1)
  *		return -EBADMSG;
  *
  * If you need to calculate a parity bit, you need to draw the conclusion from
  * this result yourself. Example to enforce odd parity, parity bit is bit 7:
  *
- *	if (parity8(val) == 0)
+ *	if (parity(val) == 0)
  *		val ^= BIT(7);
+ *
+ * One explanation of this algorithm:
+ * https://funloop.org/codex/problem/parity/README.html
  */
-static inline int parity8(u8 val)
-{
-	/*
-	 * One explanation of this algorithm:
-	 * https://funloop.org/codex/problem/parity/README.html
-	 */
-	val ^= val >> 4;
-	return (0x6996 >> (val & 0xf)) & 1;
-}
+#define parity(val)					\
+({							\
+	u64 __v = (val);				\
+	int __ret;					\
+	switch (BITS_PER_TYPE(val)) {			\
+	case 64:					\
+		__v ^= __v >> 32;			\
+		fallthrough;				\
+	case 32:					\
+		__v ^= __v >> 16;			\
+		fallthrough;				\
+	case 16:					\
+		__v ^= __v >> 8;			\
+		fallthrough;				\
+	case 8:						\
+		__v ^= __v >> 4;			\
+		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
+		break;					\
+	default:					\
+		BUILD_BUG();				\
+	}						\
+	__ret;						\
+})
+
+#define parity8(val)	parity((u8)(val))
+#define parity32(val)	parity((u32)(val))
+#define parity64(val)	parity((u64)(val))
 
 /**
  * __ffs64 - find first set bit in a 64 bit word
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
