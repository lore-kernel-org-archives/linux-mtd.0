Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C493CC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Dec 2022 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7E8eTLc2GH90f1P4K3nXlw3v19i6SmxuVs+J50cRehE=; b=Gvy1xTjHG+slsq
	Jip4RjeWiH24E5cNnChlMnR7fmWPj14Rm1zThwK/GbwOw/aRbDgF05ihce/HyQTcLPCdh1qpsJ304
	LJMXfApgnUCQgWHl01PKgNCPd+dCKahh6XTXw9OtYPLUgM4sh1ox0xC+m68fUXZT0yTBYPpvWzql7
	2f2ce46XtwHBxrCZT0fYxApauyZl02plItTAwiv2lIn5Wjzbs4QOkAgitdLPV7yq/wIts9WMBvT9y
	l30eOXsTzaVXFLxjKpJRJnMPnIpUKyFlmcg0mmPyJbRdfmEPckF5a7Lv4iTOvUNC7GTjEvKoMp0Wb
	pKJWOzztXm+yMnqTSbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7y3Z-00EeO4-UK; Wed, 21 Dec 2022 12:18:46 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7y1j-00Edld-Tq
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2022 12:16:53 +0000
Received: by mail-oi1-x22e.google.com with SMTP id s187so13120143oie.10
        for <linux-mtd@lists.infradead.org>; Wed, 21 Dec 2022 04:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7gUlc1sHcGQgKs5k8gVhHit/S+tlYXh/+hMIkbtr3w=;
        b=OxAO/i4IhQEGtjoA2p+uVjYvtJMMCXgrseUkDD1BxuSAzH1pMejYdtEZF56n7SWbTB
         +kNKGO+B0QVQ15FbwB55YDaF1sZmRa1YuyaC7RIgcYNGeGAN6ZA0JV3ze0+L1yEDJS88
         FrsemVpbMRkg/k0z93KhkYnkUR52q6yoSCgbeWlOKoQv8gIWQNfj4zZ3lXv4cWODLvhI
         cqdLz4n+uiNs4DWYxKL2MEj8K7cj0RyYN81iLotgVKxrA7IphX8hzOLlCshoESzzmXGL
         Tjboc5WXLwxW+4g49Kh/YTSD+VTkuM26VPq7JM30fHrrZbKRZxA3eRie56rCEsyvneD+
         5emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7gUlc1sHcGQgKs5k8gVhHit/S+tlYXh/+hMIkbtr3w=;
        b=Ktuz+uGTQsqC++pzxD21mFpXN71lAInvV8Vp+0Hq2h2Gsancav45Nh8QbX5K0zb+0o
         V06N5jU9oqKmQua72euWMlRolB25EegdkNnzWTroykptFZWQK8lzRv1OdjOWaGEwm2nI
         rBeBerF+gipHPG9FQuH4zgfemf8no6qQ0G2xidEpSsLURm4USsVK6maBZ+dPEWmmAFzk
         POmxO/PO9LRFPHETjCGlyvtcLqLiKDdRLW3b1BUE1xhXXVbd9G7dB8F1K6PNU3Q/TrY1
         l/Hl4Y6vJGZXmmS/DDpy7SJkSbellNCXiHxX+EJX8ErX8kXMT4dY8Nm0EhZEfJeQI7k+
         0zjA==
X-Gm-Message-State: AFqh2kpxoGlUsWAVATyi8IrGEVdadM3EIhM4yAcTB1w91ibOn7vowfs+
	7dE5RbTbY6MYT5SENOKNh1c=
X-Google-Smtp-Source: AMrXdXu9b5VImz2WDrwJTxTlZikQ2QoNfQAsFGFICYDcFs+A0fgHtYnVoeTaZ34nferXeu+DJNNn6A==
X-Received: by 2002:a05:6808:154:b0:360:fc0e:f61c with SMTP id h20-20020a056808015400b00360fc0ef61cmr630996oie.1.1671625009936;
        Wed, 21 Dec 2022 04:16:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a19-20020a05680804d300b0035ba52d0efasm4679802oie.52.2022.12.21.04.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:16:49 -0800 (PST)
Date: Wed, 21 Dec 2022 04:16:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: Sudip Mukherjee <sudip.mukherjee@sifive.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com, william.salmon@sifive.com,
	adnan.chowdhury@sifive.com, ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based
 on SFDP
Message-ID: <20221221121647.GA1353152@roeck-us.net>
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
 <20221221003009.GA280250@roeck-us.net>
 <9cf53ca3bfb39c85da968f9b46dbe6d7@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cf53ca3bfb39c85da968f9b46dbe6d7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_041652_035239_8AAA691E 
X-CRM114-Status: GOOD (  14.44  )
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

Hi Michael,

On Wed, Dec 21, 2022 at 09:22:04AM +0100, Michael Walle wrote:
> Hi,
> 
> Am 2022-12-21 01:30, schrieb Guenter Roeck:
> > With this patch in place, qemu emulations with is25wp256 fail to
> > instantiate the flash. Specifically, this affects the qemu sifive_u
> > emulation. The resulting error message is:
> > 
> > spi-nor spi0.0: BFPT parsing failed. Please consider using
> > SPI_NOR_SKIP_SFDP when declaring the flash
> > spi-nor: probe of spi0.0 failed with error -22
> 
> qemu is to blame here. It doesn't fully emulate the flash. Esp. not
> the SFDP tables. See also [1]. Adding the .sfdp_read hook with the
> corresponding binary [2] should fix your issue.
> 
> [1]
> https://lore.kernel.org/qemu-devel/7827c791b7f91f4eb216b33473dd6103@walle.cc/
> [2] https://lore.kernel.org/linux-mtd/CAHyZL-ch=mr0x_19e6P9G+Z4sW2iJXW9nTnXUNAhn+pTptN2ww@mail.gmail.com/
> 

Great, that helped. I'll prepare and send a qemu patch.

Thanks,
Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
