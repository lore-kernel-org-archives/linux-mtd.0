Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDA0C54E68
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 10:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/RLtOveg7CbjIpj9YR41tZHupuJ6O+FFCrm7bdqf4Q=; b=2Sm4akzGa9td0B
	+87tpSxHyLHjxW4RikQwObLvPTg5KQrQ/YAyQrXVSdHq6gWaP8QzI2DbR8OiJRmJvW0ZeaGn/YrAy
	1AHHRDy0igye9qgAvx1oDyoHe7wbAgtYNooKKF8w3SktxLe3Milb313wRtYpb/Jqxf0agiUwwGJR+
	Wy3Y/LMCGcZkJwXxWjCfLQmgrkFXDVJjOEfVU5Ik+LjUoX6dJBp+95hMUJHg+s9U2sZCpF9LXK2dd
	gyutl2jW4c9NBpcjeVH+UDSMm0fIw6eF+E2lQVX5O10+xB8U4atQO/fz3Uw5BSXv9nnrmCx4TmIFd
	ooQJD4rEXpYpwa9Tyn6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnFkg-00000002eal-1z6t;
	Thu, 21 Mar 2024 10:34:26 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnFkc-00000002eZp-3wcQ
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 10:34:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d46c2e8dd7so10077631fa.1
        for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2024 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711017260; x=1711622060; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NHG19S00nW0KrNYH2WSzHwN8S/SHdrN0ELw9d3lEmaU=;
        b=id5yRz7ZgHrLRxuvGueAMFsp3YmxRMDKtI37/RoGi0XYpOnPMC1nPdB0gD/elkEi1c
         T/HLF39FW8P3EXzR3r7m4X55OJE3+4RW7eL83BaeSVgEOlNA6tBZiv6hLDYCzV2+A/pT
         KYX+fqU82hJpuFIeRTH7QN1zPaTtcUMuZLObYdalZJqXe9ZXjMncYIzU6Q8uwuscRQdE
         R90evlKnkIlV4KWgrtE9Q/aYvyc7z0njaUqF6ZD696/+hh+kpCzirdrL1yw7/A/4wr68
         /7p2oA29xzsM62iw9bNQy1c4rt5B2cnrGIcWqqVxC5eQArQbxMjxn0PlLHM6D56urHAp
         CtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711017260; x=1711622060;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHG19S00nW0KrNYH2WSzHwN8S/SHdrN0ELw9d3lEmaU=;
        b=Dkw4huKGLDNUYwwo0thmzyX6COu+3MxRL7Bce+De3q0Q6HXmx3kBVvIAx9GEGQ11zg
         3Eje2o1SEFcRY+mAzWgnR1NDEqpZbigpS/ev8ep+Fy9mjSMEBVKzl1aE4IIa/R6FoMrm
         KxZ+JDp6LzN+nc3PqPcP6zuC8CW8XfQEn72403I8awg+5lOyg58PVlg2deIKOQ/rFBKv
         TnUaYyFf1IwtIjbbt+RkTPV6IJIrE/cGzyJorFbn23OdKL/J+xXv2H9TLUP3/7VhxSqb
         Q5dPYUQL2Pxq5OChxjoaqDD5m3gcES7ID+QfN9Z6di6/yRDbc/pNdgy/nq2xxdq9R/Nm
         mYzw==
X-Forwarded-Encrypted: i=1; AJvYcCXzIGdwbxYGoWRxV9tWwiKwO+da+sziEJ91HLVcn85UTattebAwyntFS6FS6ArrctpYnBSswexEjM19mMR64BunWF3nhFR5YoqP3+lh0w==
X-Gm-Message-State: AOJu0YzBXw6gy487Lw2qYc/KOHHW18SeCyEQRRtSBUcKv304kmCMsBXm
	z2e0+OzHD4CDZ0Rww2eowtjb/ZoGHVpHpLbXf8rijiUlI9sGkqDG
X-Google-Smtp-Source: AGHT+IHZsmHDVKcW8S4Muplgc0gm08EDd7GKFo3DN0TZd0vtgrg7sUO9gJqCCt6ZDD/IbDH6dh92eQ==
X-Received: by 2002:a2e:a4cf:0:b0:2d2:c83c:ffd7 with SMTP id p15-20020a2ea4cf000000b002d2c83cffd7mr2823962ljm.42.1711017259315;
        Thu, 21 Mar 2024 03:34:19 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c468500b004132ae838absm5174369wmo.43.2024.03.21.03.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 03:34:19 -0700 (PDT)
Message-ID: <65fc0d2b.050a0220.102ac.24f6@mx.google.com>
X-Google-Original-Message-ID: <ZfwNKKJD5Yy6UjxN@Ansuel-XPS.>
Date: Thu, 21 Mar 2024 11:34:16 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: limit OTP NVMEM Cell parse to non Nand devices
References: <20240321095522.12755-1-ansuelsmth@gmail.com>
 <20240321113256.7e66ac0f@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240321113256.7e66ac0f@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_033423_144962_7F65CE0C 
X-CRM114-Status: GOOD (  23.36  )
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

On Thu, Mar 21, 2024 at 11:32:56AM +0100, Miquel Raynal wrote:
> Hi Christian,
> 
> ansuelsmth@gmail.com wrote on Thu, 21 Mar 2024 10:55:13 +0100:
> 
> > MTD OTP logic is very fragile and can be problematic with some specific
> > kind of devices.
> > 
> > NVMEM across the years had various iteration on how Cells could be
> > declared in DT and MTD OTP probably was left behind and
> > add_legacy_fixed_of_cells was enabled without thinking of the consequences.
> > 
> > That option enables NVMEM to scan the provided of_node and treat each
> > child as a NVMEM Cell, this was to support legacy NVMEM implementation
> > and don't cause regression.
> > 
> > This is problematic if we have devices like Nand where the OTP is
> > triggered by setting a special mode in the flash. In this context real
> > partitions declared in the Nand node are registered as OTP Cells and
> > this cause probe fail with -EINVAL error.
> > 
> > This was never notice due to the fact that till now, no Nand supported
> > the OTP feature. With commit e87161321a40 ("mtd: rawnand: macronix: OTP
> > access for MX30LFxG18AC") this changed and coincidentally this Nand is
> > used on an FritzBox 7530 supported on OpenWrt.
> > 
> > Alternative and more robust way to declare OTP Cells are already
> > prossible by using the fixed-layout node or by declaring a child node
> > with the compatible set to "otp-user" or "otp-factory".
> > 
> > To fix this and limit any regression with other MTD that makes use of
> > declaring OTP as direct child of the dev node, disable
> > add_legacy_fixed_of_cells if we have a node called nand since it's the
> > standard property name to identify Nand devices attached to a Nand
> > Controller.
> 
> You forgot to update the commit log :-)
>

Ugh... sorry. Ok to resend or I need to wait 24h similar to the rules on
net-next?

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
