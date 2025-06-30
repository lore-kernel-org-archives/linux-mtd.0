Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6F8C8302F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jun 2025 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTT+F0hl46yoI1uLH25tm6bhVgtAPxUPlSeo+riRwsA=; b=e/Lt12w23HTdnz
	zA6BjEZHLhtOuJIVA9KdjUkpAKYnsvHniIIFou0DIR80WVNeKE2UYbTrlNT8hGZq9a12d/Uv0Zhx7
	NjXF6brVuAmwDuDb9mcMKsgAOph7uzKhDSceJ+bnRtTwOWsHtAdMK32zYa4DvsFPHEIqT7uW8L4IF
	SXQQhOGstvxzuzeIYoD/cYdJ93eTv6MmUnOsfMQiphMc/OeXSAwxUpK07pKwY3CjT8uMUzzI+aKSX
	VwzgjNhmPRyI2WpThoPI6yz/zGgssOZF9YNx/o6NIj1sAXXVTcR+IWBiDtYb1+tT1UOPMdUKJefAF
	9HmYVUJgFPlSFlJTTYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDUN-00000002A5U-0nmy;
	Mon, 30 Jun 2025 12:19:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWD1L-00000002669-2oLJ;
	Mon, 30 Jun 2025 11:50:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235f9ea8d08so36518975ad.1;
        Mon, 30 Jun 2025 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751284198; x=1751888998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7L0gD/O+S1jlluxpetyO6tXkKKPauMUBX5PO0vsdCY=;
        b=iEbwZ78LufD63sXFs65kgyRZeHbRVFO3IzGCWQm1d1SGyde8jcKUM+XEWGnBooH2ho
         /+YcjcB4vQJCQMvWRO4oygZXIYV3jZuqbTyE4HRp/dsxtA6Vhnn0eS9uVRbaa11ke4z7
         t33ZnVBHnTdW/0mHQcdW0peC52jHscpk6q4swhSxQDQg4dOGhRRAgA/zbL/qkRaHokV5
         V3a8hE12stHP5CgakHeg8HrOFOPWWUvPx/X/D+YlcHfxFGt/xY9I4dbuvKfrWbeGWl4K
         OJtPRZG/ds8I48b7PCPKxZQllzBxtFB4KP/cMurDg5Hiq/LvEK/0di26DRZKtan3lhXB
         ym+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751284198; x=1751888998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7L0gD/O+S1jlluxpetyO6tXkKKPauMUBX5PO0vsdCY=;
        b=Lai4c0ew6r3HHj+BMXOIXJPyfPL5om+ibS0F46gp+WcerR1GpBGcR1P/TcYwN8iU3J
         SR6vnzNYwliGFtBXqoF5snR98utj5PVTuE2vtO8FbdswG7a98HQnBxC421fOjX5AI9/d
         nR7nNFjrIwuJgaTu7kFLi9fh8FqSnnU+AyD4XWTqYWo82MLMN7Vl42GXhH0hDk22TkDU
         R6crH0gU6TiI1kX49sfHJEOsUqw/4QpCaWC7xVbDIJKojDRhUSpIVU71MmSCEgOjJZXE
         ++wf74dH+TP22KJD7Ipy6aSljSSrfamU1pH8Nyj8VoInWhixQIpA7zdt4m/Uq9nyb2Rw
         zaiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3/wV+sN6m9wiRJb7toQPv3P+RKo6sH3QBUO3VaKsHiLI7X1Xn7H1AOKqa1YkfCGdmFp8GNFVjnT4=@lists.infradead.org, AJvYcCXsmPsq8IMRcdPjegGJI/KpaRYkabgptaSFtpI/vssZW+RA+bkyY3kXyi1xN44ob7FnQf+UsOg08ZfeYiY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyjiP6/dawAAl5ax7+kHAU9LZQcWAaaxnsLDBRqsXjy8DP+oV0
	RQuo2rWNaB3Hf0SdwAsYRVktdRm853TGPXYowyr6gQoTgPdNkV4drvp1QG0uwPav5Cs=
X-Gm-Gg: ASbGncutosZF8q02/9KOPMxFnecImfDRs9PMTfeG+lQIrE17uFQv0dV7clOxYBkq4gL
	t4OMYAbSDzIps8A+p1Jk7XYXfzQhchg+ZlRAVndWbWAb0TFAgKBV63gy9FNTuJzwg4e8jSIX2H2
	8CHLDwQZWjD9XQqkZPg9ruSwrHsPsItD1IUWXDpJ7ISLI+yUeIdgbfYwSQZDdVhZ1fYw1OFwJms
	CEFVTL37+gVdBCRb8OD+xRPiMU5wCNWZ8YAc4OqaPV2xhOME9Jn6ilSRbj39p1HODmo9fRC2gbi
	h64sdeHfBdwWtsxvaljN2UEJ57PbBxh+kUx90IAel+p2D3BFaX0=
X-Google-Smtp-Source: AGHT+IGRukL3IXabxcCFKZppPUsWom7Io06VY/r+HS4hnkGjXR5xf1Ph8KP/wp7fO5A2N87ZPa2p4w==
X-Received: by 2002:a17:902:f745:b0:220:ea90:191e with SMTP id d9443c01a7336-23ac3cf5451mr179954255ad.4.1751284198016;
        Mon, 30 Jun 2025 04:49:58 -0700 (PDT)
Received: from localhost ([2001:250:5800:1002::cd55])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b34e300d808sm7928785a12.14.2025.06.30.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 04:49:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:47:40 +0800
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
Message-ID: <aGJ5XAYZ1nmQyBQT@calculate>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
 <20250630-ancient-quail-of-joy-effd60@krzk-bin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630-ancient-quail-of-joy-effd60@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_044959_708440_FD3952C7 
X-CRM114-Status: GOOD (  11.73  )
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

On Mon, Jun 30, 2025 at 09:17:09AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Jun 29, 2025 at 04:23:10PM +0800, Zixian Zeng wrote:
> > SG2042 is not fully compatiable with SG2044,
> 
> Typo, run spellcheck.
> 
Thanks for spotting that! I will add spellcheck to my patch checking script next.

> > So it is necessary to become independent const
> 
> No capital letters after ,.
> 
Ok, thanks

> Anyway, explain why it is not fully compatible.
> 
I have asked the technical staff of SOPHGO, the SG2044 and SG2042 are indeed incompatible with each other in some places because of the hardware details, regarding the configuration of the OPT register and FFTrgLvl(fifo trigger level) bit setting.

> Best regards,
> Krzysztof
> 

Best regards,
Zixian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
