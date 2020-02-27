Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06489C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE06C24677
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ftpqNvlZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE06C24677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8eGisgP2YDzrR9i2igkhPDxsezyLtSvAYgkyqEjo40=; b=ftpqNvlZx24hBJ
	oQJHH8gxYj7tKH3BzaL32sU+S07ipxVU42XYbzLR1E1itALlEhSBuEbfn3cjY+LbPlM5r4yuIP//7
	mpbGS6febse0NNezvSSTNfU2/3/KSvU0lZrIJE8GyYAkmrgNcUIDQ/RUZITtTGM6nhaN6gr8MrWnU
	0eP4NHBITfztunNf1yGOcKni5pdk9ldxdME+h6MrctYuVWs4yu3bdLqbyDtExDjrdZO8UuhrqZMrF
	E3cmDXu7z74bl0j97gotQvicnBVwuPtPGmIM28RvntwR9e/icvXN4BMDy2y/I3Q00/r+1LISaQw03
	iCKcy3PQBU/nLhbaNosA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7M2U-0007kz-EP; Thu, 27 Feb 2020 16:29:30 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7M2R-0007kJ-KC
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 16:29:28 +0000
Received: by mail-oi1-f194.google.com with SMTP id p125so3861863oif.10
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 08:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jXudNkkQRrHswSQ0SFgmC83sC0Xe1CS0lzGEyLon8c=;
 b=h3LqAP2zQhY0YLh/WIFtI6al1cKB35ttRmTodE5mAXVXrpm6xFK1aXmwpXKq8/ht5+
 Kv4xbj6k2hoUj6d9ksCjCIXh3onVJdLqatwZgO/FPkqtB9ouKw8EOKiWMY0XVMsOCSDL
 ljT7Hvju1F/Gl+nTjgS6x/cUwv8dad073071YLcorWEJ6MmsPonDq+hFVGn4MB2fm2IU
 QN6sL+TAhXSDpZzec79JjbDNQgo1J/tcY92DRn0y/RS55cFFIVNsJO9//pwiXsd1CBW9
 mwo3wLpK13f1f2DGE5u9yKWNPLIDMU/MfULOFkUA5uOawR/c0AX/ih74HtXy8/RDxk9+
 5Y4Q==
X-Gm-Message-State: APjAAAUptLD+6qURoO01z7qq3DVXVcYpppY63/yjhn1NMBlDPIGCh2ay
 Ux+hIFiiFP3dNAKlijq/1tYzsKeXQIREXwx2pUYzN4U8
X-Google-Smtp-Source: APXvYqyUfhYfCXxfIpygMIWcy0cqjpe0cJtNKxAMEU7HwDavOmFyIh2NtpJAG7ozbOpNRe59proDJcrYJm8sEB1JY1g=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr3859856oia.148.1582820966275; 
 Thu, 27 Feb 2020 08:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-2-p.yadav@ti.com>
In-Reply-To: <20200226093703.19765-2-p.yadav@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2020 17:29:15 +0100
Message-ID: <CAMuHMdUGN8Yu6Tx0=OoLKzyOZ08fvjF6pEWi3ye02pr3Cgj=cg@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: spi: allow expressing DTR capability
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_082927_661462_8DC15E57 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

On Wed, Feb 26, 2020 at 10:37 AM Pratyush Yadav <p.yadav@ti.com> wrote:
> Allow spi devices to express DTR receive and transmit capabilities via
> the properties "spi-rx-dtr" and "spi-tx-dtr".
>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -120,6 +120,11 @@ patternProperties:
>          description:
>            Delay, in microseconds, after a read transfer.
>
> +      spi-rx-dtr:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Device supports receiving in DTR mode.

Please explain "DTR" in the document, at least once, e.g.

    Double Transfer Rate (DTR).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
