Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218A0C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 21:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gai/G0vw7N9yvVzs8AO9Il9jmW+cFs97CB47L2OGUOE=; b=LCupcMh9WENykXG5B1fGbKAcHK
	KF+B+gl3nqphl84a4D2JoCjISQzt3TqT9MAjBBipgDo+FwnD6yhmChWA6TIhKUBHzrDjDvMIm3lMT
	aSjoegzMd8IrsUrVzVysV2GwiK+huFvrEeBdDDF1fTuazS7YgfKrOCrbLt4af5gYoIizgaVmfBZtb
	rCNp+AXFRUARkbt9pUupAoFh53pI23GtvVAKa5ubJSUkgvs7ff7n7LKFnN6E5f4rNQjvw/e4S5qs8
	+/tZDdEUaLE4Am1kjj+izcNpsOztDU0lwRFVWWkF3BWgOku5TD4WofXTTwNirtETvNky3ir5r7cK/
	hDXV6LFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msX0I-00ACF1-JH; Wed, 01 Dec 2021 21:19:02 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msX0D-00ACDr-OV
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 21:18:59 +0000
Received: by mail-qt1-x82d.google.com with SMTP id l8so25527614qtk.6
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 13:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b8vgoAoZ91QTBQeNq/7pHGnW/opI+Ut4MEnu2qhtgD4=;
 b=hzhORA2lw3S8x6OlyTSSZPtpX+49RWaJ5mFSze63Xv9KM80O3jFwf+h40jtWNCFr7Z
 D7UmNZDBSpPjWXC/sAzKfYSzNiDgiML6xec8B/WxdnkIMzWwDJUGwiHqeHDZLBMyS0Er
 NqJXtvOWUnz5tTmzk0lAlYUs1mEwi4Zj9xUvGZKplN6JC0csZqevljbSWwYA3rZIkr3f
 5gmzVGRrgRqbjlpQu8CSTtCyT4mdOOPXHAIYoHv+YILfdDSthKogff4T6QXBF6HIeMmP
 3/KUPGHFq4zk+4wPn+0ySGzRbtj2xewPBe+iHfUufj17IiFHKDdRx3pY8ZSNj2ZFKAUR
 TWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b8vgoAoZ91QTBQeNq/7pHGnW/opI+Ut4MEnu2qhtgD4=;
 b=iq1PmIK3VK7VH0la/2DBZqY/VY1TfooTghoJY1JB4LFyJw69vlFdyWxoW5z2Si5G/w
 GyRFiNzOftHfv39zrCpKKnzUogNMU02rLAw3TUAv1ypJHINPULJFB+ZxsTm5mxv/WquI
 vXt6TQ7/tV1FBXaCUhSwXBH+Chviwq4sEmfsFvXFew3tPmlBLEnSZ6kSXHOu8xC4r1Jy
 8M72sNNBIFVNFJlQt7gNJNe8R9qkdrO01nS4cTiDQ5c9RDBseLLH8gIf50zlkeH0gITA
 30JTeDCEsx8B+D2qnbukGeDHcDCiGmpSY+O5N61aPLAA1REIA4FXZD5wYZnsEvFWVG4T
 nM/w==
X-Gm-Message-State: AOAM532fm+EmABGorxzXz7op4Lo7K0TKpcm0/laBJedONViZ76Ge1Qdv
 vSXFL4NQwv+JzlmyTmFZc3O17w==
X-Google-Smtp-Source: ABdhPJxqGOqq/gw6JuZdVLFQOpcFbkU+SQpOD5ytqySci0rhxYTI1yg25DOl+iiS5T+fQnZLF0zf8g==
X-Received: by 2002:a05:622a:186:: with SMTP id
 s6mr10238691qtw.477.1638393531681; 
 Wed, 01 Dec 2021 13:18:51 -0800 (PST)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
 by smtp.gmail.com with ESMTPSA id bp38sm462037qkb.66.2021.12.01.13.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 13:18:51 -0800 (PST)
Date: Wed, 1 Dec 2021 16:18:50 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Message-ID: <20211201211850.GA3132024@maple.netwinder.org>
References: <20211126140625.351697-1-miquel.raynal@bootlin.com>
 <20211126140625.351697-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126140625.351697-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_131857_807907_083A189C 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Nov 26, 2021 at 03:06:24PM +0100, Miquel Raynal wrote:
>Introduce Renesas RZ/N1x NAND controller driver which supports:
>- All ONFI timing modes
>- Different configurations of its internal ECC controller
>- On-die (not tested) and software ECC support
>- Several chips (not tested)
>- Subpage accesses
>- DMA and PIO
>
>This controller was originally provided by Evatronix before being bought
>by Cadence.
>
>Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I've given it a try and all seems to be well. Thus:
Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>

>+	mtd = nand_to_mtd(chip);
>+	mtd->dev.parent = nandc->dev;
>+	if (!mtd->name) {
>+		dev_err(nandc->dev, "Missing MTD label\n");
>+		return -EINVAL;
>+	}

Minor item: could the node name be used as a fallback when label is not 
present?

Regards,
-Ralph

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
