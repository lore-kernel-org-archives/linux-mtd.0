Return-Path: <SRS0=BXPI=BY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829BBC433E3
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2020 08:57:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524C920639
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2020 08:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUFF5Szt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc/++NNg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524C920639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KLipnIhpFZF+SaD2fbEQPAgMHttXmmw+3aK14ZPr7OQ=; b=NUFF5Sztnkn6MLutF8OOhkFUx
	J5e4WE2lx+kN6f7Pgp3z6YInJ9Ww8yHa7dIYbNrZoKuzNqlpLMTNoJCcqv0fZNxynQj9KgxDd532+
	PkN3WEF5B7ovsPzS49T5IQgFCPLfJh/lElqhFxHWxGyuNgJtJnz4//ucuTFaZbicpGQ9aChvIn74U
	D0wvrcBxl6+QZzrORUWJ1VhXt4jeXVL5gxaylcQuM7vYFkSIbdkhl4AXJB3gOs/ijLBduyOc+EqF5
	MCQ+//qbdm78ZgyN65irS8WifsJdI16UCuQ8tJgFVf7N2/RDdWNSaipprKGTaVH3X0JIU4ZIIEOsq
	BBpKKcCJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6VVl-0002KU-VB; Fri, 14 Aug 2020 08:56:29 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6VVd-0002JY-F6; Fri, 14 Aug 2020 08:56:22 +0000
Received: by mail-pf1-x444.google.com with SMTP id 74so4233004pfx.13;
 Fri, 14 Aug 2020 01:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=zTcT2yb4VlahiZ+8x3DiZcJOZkmeuTPvsJD8D2PV1jQ=;
 b=oc/++NNgtI8v6eFrM0KIqAXlLPm2RknS/SV/lh/tUXDQHB8pdqmlxlheAvtfix/5OM
 tLzhnCft3oe37d3qXf8+l2t5J1sMEmkoMEGS8geSLxgl8sB6PAChS1CPjmvrXFbEpR+y
 wjjjZ2rG5DHJoEdIEyYJjoh3w1DWc24UyiyzLuB8MyeLfo7uFVzXZewZkiG4dEN8MFUo
 Gqtf1ez/+cJr/WCQCHpUTzl92NvKY+ZXVgEVd4ZwEHGiVtSv24CJqm12bVfjavCkMQPo
 BMPs7crTzHlHKtw9WAVBafFsZdiz9VNy0mzmcKGUUy4r7tV3NcK4fukNDbqRJsBMVAEe
 uz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=zTcT2yb4VlahiZ+8x3DiZcJOZkmeuTPvsJD8D2PV1jQ=;
 b=gt6Fb3VCU0uXutSQAefByixu0i4y7OaHJw86qdRcpKr4C9Obxd5odyiNDWC26acL/J
 xfrKJ2FAqzPYmy9nHQK2H5tuD6nCQQ5ucGZMy9ah0o59+UaDKwlabBFs0oLf2sa4U0C/
 ic+FxtEesMu4vJgXk87TVz2ule3cgXm2BiWq9LbScmRc720u2EyjPatiXZmW6D2x9Zkz
 HWUijUPtDiaiOpohnd1/EDmupWq5WhdnBq2iHe2YztXI33wN4rjZxeo2oGu1yJ7HOElF
 13hLyOUrH5tTvDECqmuf0UUc27w5aSyaY24EmB1/tdWB9DaeihPHNqYE8FbZvGu+008M
 FWuA==
X-Gm-Message-State: AOAM533vLGldiOd5cR2foagvgyw+QJuyPHgM66ppfNgsHEwCkhtIeWwQ
 eVz95MY0Jnt5kwcxAWLZ7wM=
X-Google-Smtp-Source: ABdhPJyfJw+JRCcHRK5mYeqXgxZBEKbhdNI+zRQErExZOJKxYHQqSs2GplRu196nml01FcKc6RgA3g==
X-Received: by 2002:a62:e704:: with SMTP id s4mr1165962pfh.177.1597395379200; 
 Fri, 14 Aug 2020 01:56:19 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n2sm7349968pgv.37.2020.08.14.01.56.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Aug 2020 01:56:18 -0700 (PDT)
Date: Fri, 14 Aug 2020 01:56:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
Message-ID: <20200814085617.GA129183@roeck-us.net>
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615091740.2958303-1-noltari@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_045621_560922_5E2BA06F 
X-CRM114-Status: GOOD (  22.90  )
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
Cc: f.fainelli@gmail.com, vigneshr@ti.com, richard@nod.at,
 linus.walleij@linaro.org, jonas.gorski@gmail.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
 bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 15, 2020 at 11:17:40AM +0200, =C1lvaro Fern=E1ndez Rojas wrote:
> Instead of trying to parse CFE version string, which is customized by some
> vendors, let's just check that "CFE1" was passed on argument 3.
> =

> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

mips:allmodconfig:

ERROR: modpost: "fw_arg3" [drivers/mtd/parsers/bcm63xxpart.ko] undefined!

This is not surprising, since fw_arg3 is not exported.

Guenter

> ---
>  v4: shorten conditional compilation part as suggested by Miqu=E8l.
>  v3: keep COMPILE_TEST compatibility by adding a new function that only c=
hecks
>      fw_arg3 when CONFIG_MIPS is defined.
>  v2: use CFE_EPTSEAL definition and avoid using an additional function.
> =

>  drivers/mtd/parsers/bcm63xxpart.c | 32 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 20 deletions(-)
> =

> diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm6=
3xxpart.c
> index 78f90c6c18fd..b15bdadaedb5 100644
> --- a/drivers/mtd/parsers/bcm63xxpart.c
> +++ b/drivers/mtd/parsers/bcm63xxpart.c
> @@ -22,6 +22,11 @@
>  #include <linux/mtd/partitions.h>
>  #include <linux/of.h>
>  =

> +#ifdef CONFIG_MIPS
> +#include <asm/bootinfo.h>
> +#include <asm/fw/cfe/cfe_api.h>
> +#endif /* CONFIG_MIPS */
> +
>  #define BCM963XX_CFE_BLOCK_SIZE		SZ_64K	/* always at least 64KiB */
>  =

>  #define BCM963XX_CFE_MAGIC_OFFSET	0x4e0
> @@ -32,28 +37,15 @@
>  #define STR_NULL_TERMINATE(x) \
>  	do { char *_str =3D (x); _str[sizeof(x) - 1] =3D 0; } while (0)
>  =

> -static int bcm63xx_detect_cfe(struct mtd_info *master)
> +static inline int bcm63xx_detect_cfe(void)
>  {
> -	char buf[9];
> -	int ret;
> -	size_t retlen;
> +	int ret =3D 0;
>  =

> -	ret =3D mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
> -		       (void *)buf);
> -	buf[retlen] =3D 0;
> +#ifdef CONFIG_MIPS
> +	ret =3D (fw_arg3 =3D=3D CFE_EPTSEAL);
> +#endif /* CONFIG_MIPS */
>  =

> -	if (ret)
> -		return ret;
> -
> -	if (strncmp("cfe-v", buf, 5) =3D=3D 0)
> -		return 0;
> -
> -	/* very old CFE's do not have the cfe-v string, so check for magic */
> -	ret =3D mtd_read(master, BCM963XX_CFE_MAGIC_OFFSET, 8, &retlen,
> -		       (void *)buf);
> -	buf[retlen] =3D 0;
> -
> -	return strncmp("CFE1CFE1", buf, 8);
> +	return ret;
>  }
>  =

>  static int bcm63xx_read_nvram(struct mtd_info *master,
> @@ -138,7 +130,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_in=
fo *master,
>  	struct bcm963xx_nvram *nvram =3D NULL;
>  	int ret;
>  =

> -	if (bcm63xx_detect_cfe(master))
> +	if (!bcm63xx_detect_cfe())
>  		return -EINVAL;
>  =

>  	nvram =3D vzalloc(sizeof(*nvram));

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
