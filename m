Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F552C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGYSU2h8nyX3AzTtRFLat4OEh6Sj9dMY3AVNiudmer8=; b=TvM4HmiIrbIdjL
	T4i1lZV1UySZJEAKIMqCAUAF8BtbhC1eiBCS5M6QtSjfRTYfFzFrQg8DbJ0Eu5BQxN+HeG8xDmLqL
	ShFZd/CuIf/Y+nnO1M6Mfl3meIK6bvhZb3G297Kkn6i+cojgXkg7lpgBIBdRpFOWrh4yPZp8fSMPI
	lMm62sdlF8Sz2g8A+eRUg5Prz0AWrBkqHVEuvTmrxTul5jWT/5As1m1pSjdeJpa45aW19hcOvXWOY
	lM7IAIHiBHMbHxn7A4PYFgeB1imrvonTeoD+mdmPO/9RBpTdtWWMxgVMmXZUsdnKkvVQAx81I3CpN
	DaUzsXPRzavcfWqUVjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrLt-0061iQ-Ky; Thu, 16 Dec 2021 14:03:21 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrFU-005zMn-Fy; Thu, 16 Dec 2021 13:56:47 +0000
Received: by mail-ua1-f48.google.com with SMTP id o1so47265567uap.4;
 Thu, 16 Dec 2021 05:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7QJ5cBXo5bJMtT1p7qM3PpjXsDY7rDmJRqDoolDi0U=;
 b=ZjFvM0ABMg+aaqRZuYv0sm8YyQfgWlAs2izYHMySt5h015yQ9URS7+So9ySHpViyBf
 Y0sjIczZzFqlkjMo6E37vs6lz7M+L8tu4VlzpxYQCpKqYE0lbEeJNO++A/ht7X8uO0YX
 2JQbu8s+TIKiEJLjTQZjbEBdv41Oxc7WRzBStVrdMwRL7hou0vZcdl678Q23klLKsmxe
 3a7P65jlAkZIG8m3snsv+WOMxrLJ+FnoSflYoDxmoWSB42pqvwf0oK+6dgsujHyP7g1X
 TbCQ+IQh9bUwj3bDkkyZnursCWF8PAdRcHA5/fY9ZawlMxQji/j9AB6JGRiix1jUEp9q
 JLhQ==
X-Gm-Message-State: AOAM531kTJh0raxC8MDgF/cSJE7zo64V1+4QO/AYokXrXNrHSKCU5bpd
 ZOk5yWDHObEr7IxTysDZc6t/DCAhj8j1hg==
X-Google-Smtp-Source: ABdhPJzXYr6XsLsuE0lCjJP5R3S00kMwzZAJrFyVqsIlPTnlTUtcLDXsA5wGLt0aRUf36M9+5Wt3jQ==
X-Received: by 2002:a05:6102:6c4:: with SMTP id
 m4mr5404355vsg.20.1639663003320; 
 Thu, 16 Dec 2021 05:56:43 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id 91sm1107311uac.10.2021.12.16.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:56:43 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id p2so47229052uad.11;
 Thu, 16 Dec 2021 05:56:43 -0800 (PST)
X-Received: by 2002:a05:6102:c89:: with SMTP id
 f9mr5601778vst.68.1639662529143; 
 Thu, 16 Dec 2021 05:48:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639662093.git.geert@linux-m68k.org>
 <20211215154619.166360-1-miquel.raynal@bootlin.com>
In-Reply-To: <20211215154619.166360-1-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:48:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUx0=b+GFP7Qvr9=L4tnf3K-UHatgKX=92EwRu3_7Bs_w@mail.gmail.com>
Message-ID: <CAMuHMdUx0=b+GFP7Qvr9=L4tnf3K-UHatgKX=92EwRu3_7Bs_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Renesas RZ/N1 NAND controller support
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
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
X-CRM114-CacheID: sfid-20211216_055644_568984_5248A822 
X-CRM114-Status: GOOD (  19.22  )
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

On Thu, Dec 16, 2021 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
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
