Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E58C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hyf8dt6G8am/AkBykgJbTeDK0RkLQFCgeYmm0NwKm2w=; b=f0qUvx9pVzjDPp
	HXmsJNi0Bcd2ySEIrHGJVU+2LhVRcePL6jY2OrFc25r2JlihfowvXrxF8eyjcEbVqzu4/Kzsw4wtz
	CddJh89bY6JoY61QIyCIO7CIF6keXSHQOHozd9dKHuTrBfsAjc4jm/c6Vpi4xyJBUB8La7oBff1tI
	IECAGi4ixRH6EIL+s15WNhES3fcE5514B6VS6Cq7iSTNSyLqXSWz4Uym3uvIWwXGG5dXilKbG56qt
	YZ2IGXe0TFldNR72+JIAOUIoMp2feh93nNWv0ztx3VGgrZzO3rm0XP12YpHfA9iH7cJcSyLEvyJ6w
	a7OygtAKK8CyTkfkYbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrFy-005zUH-CF; Thu, 16 Dec 2021 13:57:14 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr7V-005w3a-NB; Thu, 16 Dec 2021 13:48:31 +0000
Received: by mail-vk1-f173.google.com with SMTP id e27so16883593vkd.4;
 Thu, 16 Dec 2021 05:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwUf1MNdbmgw1pD6FZTK0J55XMOIj4oBEJuIlJQ7QX8=;
 b=0CNLybVF9/y/0blPpPt5T+53aGfAbLQpwsFSkCwKTXt9DLUjF+4uWHuxuE6Ez1A7D9
 7Y2WUX5h/Ub+jLoy/KrcQY7lSPf9cw/C43aBGIdJaptyRjMBFvFOGX0jR4sfhZNvsk/i
 DMFovF5BzqKEgIfRJWkG7Q5I50VJstNUjdP7x2jd6Oagrm301gF0dLjMVRJm+IHbrhKE
 rCSjxOb4JTOi/cd1hgKAVThVoolelPpI2qrWacniiyCsWfl7xtJLp4UCnv0WyidEsGH8
 PK8bJHyjGziCBmeZIM0B11c++4N1gDTUty0k1HnO8fsMvsJjC0HEctUEabc501m0U5KP
 Vxyw==
X-Gm-Message-State: AOAM5327EqJU01QaOHUz+/3gkrnWt+Swk1ICuY2FNPcDrpLbllQOt89G
 PqQOl2mcCa8XKH/tqEZmsHU4YfTsPUiv+Q==
X-Google-Smtp-Source: ABdhPJzrjEtDBu/Ebr8HebKyZdaOhgFwlnKpXinE5gCCYbaPw88tMTQCaF0O+Z3lCgVaYg3tlj253A==
X-Received: by 2002:a05:6122:920:: with SMTP id
 j32mr6195097vka.13.1639662507504; 
 Thu, 16 Dec 2021 05:48:27 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id o5sm1114431vsa.4.2021.12.16.05.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:48:27 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id n7so3236770uaq.12;
 Thu, 16 Dec 2021 05:48:26 -0800 (PST)
X-Received: by 2002:a05:6102:3232:: with SMTP id
 x18mr5387370vsf.38.1639662506625; 
 Thu, 16 Dec 2021 05:48:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639661878.git.geert@linux-m68k.org>
 <20211215154619.166360-1-miquel.raynal@bootlin.com>
In-Reply-To: <20211215154619.166360-1-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:48:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwBNm=hG7mCgnpGAHFGHEmTBM0cGoVBDiqWGq9Go5+5A@mail.gmail.com>
Message-ID: <CAMuHMdXwBNm=hG7mCgnpGAHFGHEmTBM0cGoVBDiqWGq9Go5+5A@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Renesas RZ/N1 NAND controller support
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, 
 MTD Maling List <linux-mtd@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_054829_808085_FB6086FB 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, Dec 16, 2021 at 2:41 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Hello,
>
> Here is a short series bringing support for Renesas RZ/N1 NAND
> controller.

Oops, please ignore this email. Sorry for the noise.

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
