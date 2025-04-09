Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDC7C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNRzYD8r18ilaf+z6jsPd4TaSZ/Bt1l6xRfuU3NK9g4=; b=pNm7r1arwfzdeb
	aLSZ8mUUav1R+0w0S43VeTdxpZTz6FGEo01HAsgXV6Kr8isGYoBShGW02ElPIlRqOWMVLwmc3Y0Pb
	fgGzc6gvP9Z5hipStG9jlNmd/2ZdY8aLOCBZdL4gAkszxrH31tGlIYbN8ms5Jn+meTZ82yFStFJ47
	NrVgNWv2dQOAZ3Me5457hovMfCkZOjqdzt0yLrRD70/PtZ7Z+/8/0s4tkCSZYlOias+gpdxv1gEj3
	t15le+LgcXtlV79xbEv34sqHf4bbmgGKvsPF4tx5AAd+LbhvXj8RYi3JLIW+y4Y9lRViD3NYlPQ64
	K6F6uNM+6TYHpNwexwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z9r-0000000823c-1hT8;
	Wed, 09 Apr 2025 17:24:15 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z9o-0000000822q-32T6;
	Wed, 09 Apr 2025 17:24:13 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af5085f7861so4526804a12.3;
        Wed, 09 Apr 2025 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744219452; x=1744824252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xd6xaUI5nv9NKBM15KV37XOGcT5rm8Sii0IDXetnYDU=;
        b=YN44tarhvDeYjZ8q6VVrWbqjRXxMQ6MeQ/g0Tw9Mep+3Vgj1LrEIsaFMvO3aIXqUdu
         9q5OpWUpj+za9Mb5Z38trjIpv6J6bEJo7lz2UeClAc3J6qV3DNX7UXh6ATJ1vwmeYRAh
         Mmq6mOWG1j4VXF4f+5zmb9YJHZDF4WNMskl+eKroa9mrrbS8aHYLWYFO/lXbiHFBJoWI
         9RvzcBR84+tn6Y+M7Xm2w37ZaTOUghC+cR8M9Yu3FelMevEeEnk2X3rmB2gXLq4L60Mp
         14LdMt6XF285slhp/GgHXUr+qJ8Sj1GgJd7+Rq35vUXSBLahACcreFxa5U3GnRShKl/o
         qd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744219452; x=1744824252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd6xaUI5nv9NKBM15KV37XOGcT5rm8Sii0IDXetnYDU=;
        b=l1wNrHaimLV1yOpKPdKrEzvsoT8QtS6xuciTd1zelaKNd1MmUAWCWEZetm8NIbscY7
         meLufgRAyVx5s4MgMIS7KSjrmk8E/6/fL5KMIFfWMI/ACGFuyu3H+ekPEnD2p+m2uhzX
         d1/u6K2elvIGTPPfxNXtmiQ4qFPuFj/M9yz5oY7OWCnEYlkO0kT5J17zBJMcxa4EWHTa
         2sX/VOvYoNU7GMWyISCUhRNdazNlKYfboIHcgX31N8Ev89bkpNJK2b8F2QoXjT2oSLsn
         18//mPFIQA/GMI1ErwGZ5wvuQ5ntXX3QfBV9wumObUJrguJA8HwFq5vVk6UzuUCMRSLe
         KOdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0/Bh6MtAhFOnLciAJGJgwHRxeuKfOdoOO9kO2bTEJ2BuhyQM5j/C2Xmy8cP9ypIOzYF9/JkU9+Roz@lists.infradead.org, AJvYcCXiJsFmLVjbsYqgU9rlwNqun1rMmvtkCipPyyn+WLxlG5DcxJS4hUwnSu2PM9I1WKFcBAQf0BhOIK8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yws0VGCsf68czAvSlR+DstECPEGKL8M7nckdgZs4fSOEoDq0FZ2
	pL9WU3uqZllxgpoZ334gTV7II1ddRCUlZvcHWV+n81zFTiEq6Z6c
X-Gm-Gg: ASbGncuCQ8RBjWBdR7oIwT0DhurOnaw7ZLNmFp/P2hu9dfIJetBFH1vPX2OLnvKUZFz
	bTZHUtHcf1wg+S71vAhhojbVFCNsgVXv6HOJENVPywLwdilk7gKi274LSWX2dujNchorWKGGaSg
	XdzML9jrRCFkrpVPsCpPa+X6rwn79LE4oAtxWQ3dctaWIJeQEwsiyM7juAwbd1WGD9/ZaDgPk7I
	BVqcWu6XKQPRDw6c9EQlWHnG+Qhm9ylHL+nZqPB0xHmM8PF62u4SRM7ZjFucZJ/tAhsZOo0jfER
	v6fxgBBUKwYZfylgcS1gP0XXxb/KCPf4qMMeJF1y
X-Google-Smtp-Source: AGHT+IELcovaPBJxMo6VlfeeTod3PlQVQYXafQRyaLUWNqmSnypRNDEVNTbdlgjgS5FV2ZA5ueCy6w==
X-Received: by 2002:a17:90b:6ce:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-306dd556630mr5093919a91.24.1744219451960;
        Wed, 09 Apr 2025 10:24:11 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4d5sm2098089a91.25.2025.04.09.10.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:24:11 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:24:08 -0400
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
Subject: Re: [PATCH v4 05/13] serial: max3100: Replace open-coded parity
 calculation with parity_odd()
Message-ID: <Z_atODqZDkff5sjj@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-6-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-6-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_102412_787015_538785F2 
X-CRM114-Status: GOOD (  16.19  )
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

On Wed, Apr 09, 2025 at 11:43:48PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  drivers/tty/serial/max3100.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> index f2dd83692b2c..36ed41eef7b1 100644
> --- a/drivers/tty/serial/max3100.c
> +++ b/drivers/tty/serial/max3100.c
> @@ -16,6 +16,7 @@
>  /* 4 MAX3100s should be enough for everyone */
>  #define MAX_MAX3100 4
>  
> +#include <linux/bitops.h>
>  #include <linux/container_of.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
>  	else
>  		c &= 0xff;
>  
> -	parity = parity ^ (hweight8(c) & 1);
> +	parity = parity ^ parity_odd(c);

This can be simplified for more unless I misunderstand something...

From: Yury Norov <yury.norov@gmail.com>
Date:   Wed Apr 9 13:22:04 2025 -0400

serial: max3100: Replace open-coded parity

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f2dd83692b2c..07d332b8e87d 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -121,20 +121,12 @@ static DEFINE_MUTEX(max3100s_lock);		   /* race on probe */
 
 static int max3100_do_parity(struct max3100_port *s, u16 c)
 {
-	int parity;
-
-	if (s->parity & MAX3100_PARITY_ODD)
-		parity = 1;
-	else
-		parity = 0;
-
 	if (s->parity & MAX3100_7BIT)
 		c &= 0x7f;
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
-	return parity;
+	return s->parity & MAX3100_PARITY_ODD ? !parity(c) : parity(c);
 }
 
 static int max3100_check_parity(struct max3100_port *s, u16 c)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
