Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92D5C83030
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 12:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wdx7EaKrJuacx8hAjq4huHf8WdXLSLaVwChw7p+wfb4=; b=TLaPqyIuFj+pj5
	DWiAEyeNKrnzOkk+0rymBQujAlzU+U733885LV/8gvIJ+t2j0A/qWFzKgfg6+HaRC9ga75V/SGGfo
	XtlzP5dsYdJUsArh16NrymyqBwYGQTEJDk4K/YhmQmtAwNPKrpUULlVwdwWQYmyIDoUAUY4Cyx8eV
	2buR6iiQEDXz9Dq02/uzB7gOSOva/PjKfu9J/UXU6/7PkmgZbJpSWFdoVQDRqHd+SqHg6rtXIHKfd
	L73EhZGidVe4pJO1rsgouBQFYEAafbl9o19l6sL5545fCeuj14g0G7m+1om6bGdQFQO+OM/cbLfVf
	AYj8CaTnyap5tpnUHubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDkQ-00000002CTk-26ic;
	Mon, 30 Jun 2025 12:36:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDN5-0000000296X-2vJ4;
	Mon, 30 Jun 2025 12:12:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so4310760a91.0;
        Mon, 30 Jun 2025 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751285547; x=1751890347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kYgTWxigFnMh6J+7o3rXH2dHsX5hLP6u8Al9k3eKS4=;
        b=X1QQPHmOEsEjPhMxrt+x4iBkyiCr3RUokqSVW7Vys0eIfx0iOd95IEatAwf8TPni1R
         MfozOmUqPhwPLo7PuMWvMiQejFmCFrAlcYrq+DOX7FABmQZ5SS0qs0MiTcC+27myyYJI
         m8ZRnQxJNsosxE4a3SZTSx0Obwu4TJG1ojF9rEGbxblPjEPSScXTKAB4LiIoLBXUSskY
         X8kWikvgleCwQDd4fK6Hww8ryCY+7bhJdrKrocD4uM5vicDpSTUEA8XuDbDc7u4iBUIn
         8o3CdUOXsV7qNu2TdwWYHDYv5JJx7Z9eQte7sCRyHBu+/dBVPqb93Jp2tTzJxRdVS4ox
         E1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751285547; x=1751890347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kYgTWxigFnMh6J+7o3rXH2dHsX5hLP6u8Al9k3eKS4=;
        b=eSrLjrLUlOWemrtwA4OPo80J3RS+HitW/d8EaVzFUemFjgRuVkIZZwHxsCGAMJwuS8
         +ww3tHthEAjg4NIb4O9qVarcYOVOv/66QjLi0Cm3i1Kn7VJuXnVRBjVOhCnphmyS4Wn5
         rp/yhfP4D2/ZfD25WS1GLSnZRA+YLySclDnV6JLjU7Hl3zeI0cPxAEzh1sC/GgzW0tyx
         MYpY8t6isROBRAoQTLEJMXBYNijA8r7awqNs3zJ7f8wk9Bzc5aMniNB5RoZMhkmLJ7C+
         Yd3S2x15vDTRQVmTti9pA8cNhAOZd3zAo5eLY9Bbpw+H0/lBTVlbCE0LPZQZDRG7EUAn
         u0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWkethC+DqqoPrcg6jZC7MjfSQx1e1R0rtjJh6zGpNWGLhujevhH/d5G4zgJhcPlR/NdBq1z2P57df5ho=@lists.infradead.org, AJvYcCXATgdamlZ5rM2ZIyTeWgMpWlm1oFmwJjTlAGWA+oyY2C8TeKgMZ9e70o6/NzV95m1AS1PMMNYQAIQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgmK9dchz9Hg7S6cjUNRyP2xB4DNP0g8GEDUqqPPVXd2YrI1IU
	De2dZE+dgk21PvTNGQTLriEJB8s6PZwnxVSoRAjqgQtEdI6IVKR/dAmn
X-Gm-Gg: ASbGnctLx2fO466Ut+4F9XbRohIE5Pvf4N40CgynNhxetpSwQBMhc8ncaA1akvqM2HF
	9Z9CDCzpA2iGTF9DNSLnzf9Jc0PEBicJmRFUteRobrraN1FoL3ESU+iDZlTrBxdJT5IaKK5ZfWt
	3UgGcWxs/CR8b17S4+MRKaiNbtqxNqnisyWwkV9Dqa5FcTk90DvQsgKecTZ5mTL//45c6LJoyVA
	6m1+FIf4EFiH9ho7yJic9AaA8cmr7W5z4dsR3uWIkvlOY7VViXZK352PdkSf/+thYqOkLBVHgsX
	lHfkqNdfNHiIy17FPOIo5zKZvBOHHOpo/heNH8lz/UM48d807nc=
X-Google-Smtp-Source: AGHT+IHsIFpQ45mX5GXGIU8w06ZUsQgrAuvEXHa4TYUkn6AoK+LxDTuZVhduM++WcW9fKEEMhIst4g==
X-Received: by 2002:a17:90b:55d0:b0:311:482a:f956 with SMTP id 98e67ed59e1d1-316d69bf0cbmr24097074a91.5.1751285546499;
        Mon, 30 Jun 2025 05:12:26 -0700 (PDT)
Received: from localhost ([2001:250:5800:1002::cd55])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f54412c6sm13168373a91.43.2025.06.30.05.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:12:25 -0700 (PDT)
Date: Mon, 30 Jun 2025 20:12:22 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
Message-ID: <aGJ_JtThs7VpRIwa@calculate>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
 <20250630-ancient-quail-of-joy-effd60@krzk-bin>
 <aGJ5XAYZ1nmQyBQT@calculate>
 <4afcef9e-db98-4679-b9c1-40ffcf4861c6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4afcef9e-db98-4679-b9c1-40ffcf4861c6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_051227_737420_F80A62C3 
X-CRM114-Status: GOOD (  19.55  )
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

On Mon, Jun 30, 2025 at 01:55:58PM +0200, Krzysztof Kozlowski wrote:
> On 30/06/2025 13:47, Zixian Zeng wrote:
> > On Mon, Jun 30, 2025 at 09:17:09AM +0200, Krzysztof Kozlowski wrote:
> >> On Sun, Jun 29, 2025 at 04:23:10PM +0800, Zixian Zeng wrote:
> >>> SG2042 is not fully compatiable with SG2044,
> >>
> >> Typo, run spellcheck.
> >>
> > Thanks for spotting that! I will add spellcheck to my patch checking script next.
> > 
> >>> So it is necessary to become independent const
> >>
> >> No capital letters after ,.
> >>
> > Ok, thanks
> > 
> >> Anyway, explain why it is not fully compatible.
> >>
> > I have asked the technical staff of SOPHGO,
> > the SG2044 and SG2042 are indeed incompatible with each other in some places
> > because of the hardware details, regarding the configuration of the OPT register
> > and FFTrgLvl(fifo trigger level) bit setting.
> 
> So when driver binds with sg2044, the device does not work? Or what
> exactly does not work?
> 
> All this is supposed to be explained in the commit msg.
> 

I got it, I think I had explained this in the driver patch[3/4].
If this reason is acceptable, I would like to ask whether
the explanation should be put in the binding patch commit msg [1/4]
instead of the driver patch commit msg [3/4]? or both?

Thank you.

> Best regards,
> Krzysztof

Best regards,
Zixian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
