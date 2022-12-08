Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601CCC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpaMh6T2IB4MPmYDmdekK0VgPsRuNjNi2z9u1SxNoi0=; b=cxEkwAcJ96eApX
	ezm4EE2jmk7HE/cY8P//baVs3YgWYeq0A32kz1chntX7V/ye1xOUH8Abd6+NhOA/0rO1ThAm6Jycm
	EbnzeJV4GZNJFDZg3GKVYr003/PnR+/As78XwwWENd+MbkN9yL79diOjtqVxhVR3AniwK5bJOb0EO
	3h/RG3vBnXCmfToYjcwx+4lCsFJnMQawhZH0QOpdvyXEuSlTmZUbJio8UGrlRfyEyXC748/HhqvGd
	haffadYJoyhArAhr4m9EM0mw/xqJaaI7uDkBmdHF7fO48i1Vons2tH4cCQhlAxSBJvmEIdKEJMDh4
	rNpgD634hRPuLBARBFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3FUN-00FxYR-L9; Thu, 08 Dec 2022 11:54:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3FTC-00FwAK-KO
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 11:53:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id m4-20020a05600c3b0400b003d1cb516ce0so3166994wms.4
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 03:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p18FbFhJEWAP77GdEyssPCAGI7uoX/rYzoyWzSXOZK8=;
        b=c2WYl3/Mxey+5Dx4ByPJSCNNjgpj+nIOAtEmM1ThBoNU+0+xGG/zQif1Nl6JDOMO38
         xen+BjhUyJXnbVdDKSqpNzomYd6xcMHBKBKgpFxgHM1dPo5DWtAS8XTWyNGIrhCare3m
         xrTpQUk9uUhEpAJyBMVm41ePNKcwxMOLcLZbvj3hU9FyiphadSQ2zf12E6rA+uvrnhYj
         8U4TEnKcJzm9kUZun8AHLu4KwY0b3fiV6kKoGd32ddVms8NHry53rTy5lBd64NRZ6EoC
         rzsK5kA4jV+MEVLylSsLo2r3j4hFVYNvxvOON62PKAuEqbGkkGgf+ZQc1j4XLDutAPtf
         yanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p18FbFhJEWAP77GdEyssPCAGI7uoX/rYzoyWzSXOZK8=;
        b=jociN+dYnw4APVJvHY2lsuEQMbbo2QU7HbkchiiIrPkmFEOS09jPKS0mEZW4dOLQTK
         NBKHyd2v5cihGrUKI27OqN/jwOJzJ6BWGTXn2mKIEjmomHYCW2ad/zzqLOcWfWuyzSh7
         lNRkR5LJmRkc9rBWz3Qy2uGuaVwStdfSR4iv3dEidyHs+u6aNd0NyetzCcsJTFOsvb73
         2dWbYar6z2uVkyerjUbU3m9r0v11hxPvVX9nHUaYdwMpQdY7+kLRWFNb12aTRvk9khF5
         Zz5J0/xbTtvCcRT5p3LUeVSeXXB+zvZsBwUEclYr02W9xrEnI6/AMs208jUSgHRfKIlR
         kADA==
X-Gm-Message-State: ANoB5plxkO49uTrc21riKNwwklnO5J3SKrI2M86wzjtUEFamBz0QR7PH
	CeUjByWig/GQeM7d2AsidDQ=
X-Google-Smtp-Source: AA0mqf7K88JCFYX2OMtO45Y1EvCkxZOB4qOWteOPAw/kalS2ioezRXOjNcGOR2tIS1256P/FITEuQg==
X-Received: by 2002:a05:600c:601f:b0:3c6:f1fa:d677 with SMTP id az31-20020a05600c601f00b003c6f1fad677mr47836649wmb.59.1670500418860;
        Thu, 08 Dec 2022 03:53:38 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay5-20020a05600c1e0500b003c21ba7d7d6sm4830769wmb.44.2022.12.08.03.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:53:38 -0800 (PST)
Date: Thu, 8 Dec 2022 14:53:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuan Can <yuancan@huawei.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	rafal@milecki.pl, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 RESEND] mtd: parsers: Fix potential memory leak in
 mtd_parser_tplink_safeloader_parse()
Message-ID: <Y5HQNxsCI5yfd+dV@kadam>
References: <20221208113620.78855-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208113620.78855-1-yuancan@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_035342_711348_CE62F05D 
X-CRM114-Status: GOOD (  17.71  )
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

On Thu, Dec 08, 2022 at 11:36:20AM +0000, Yuan Can wrote:
> The parts needs to be freed with all its elements, otherwise it will be
> leaked.
> 
> Fixes: 00a3588084be ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> Changes in v2:
> - Add a new label err_free_parts and jumps to it when
>   mtd_parser_tplink_safeloader_read_table() failed to avoid leaking parts.
> 

Reviewed-by: Dan Carpenter <error27@gmail.com>

This is the same code as v2 but with an explanation added.

I spotted that the explanation was missing but knew what the explanation
was so I didn't mention it.  For me, a lot of patches have minor flaws
and if I complained about everything the whole kernel development
process would grind to a halt.  Greg is more picky about explanations
for new versions because he has to deal with a lot of patches and
because he is trying to teach newbies how to follow the process.

Although minutes ago I just criticized someone else for not putting the
note under the cut off but that's because I had no idea why they were
resending.

Next time please avoid putting RESEND in the subject because that means
there was no changes because your patch was perfect as-is.  Instead put
v3:

v2: blah blah
v3: add this explanatory message.

But don't do that in this case, for now the patch is fine.  :P  I'm
just telling you the process for next time.

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
