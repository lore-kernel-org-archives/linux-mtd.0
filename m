Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1crKBN-0001rS-KI
 for linux-mtd@lists.infradead.org; Fri, 24 Mar 2017 08:02:51 +0000
Date: Fri, 24 Mar 2017 09:02:26 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Laurent Monat
 <laurent.monat@idquantique.com>, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 devicetree@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Subject: Re: [RESEND PATCH v2 26/53] mtd: nand: denali: support 1024 byte
 ECC step size
Message-ID: <20170324090226.112b2a2f@bbrezillon>
In-Reply-To: <CAK7LNAT3nVvTWUb9bCB_7XN-wb4k+XrHn-f6FHHoU9gcVeytrg@mail.gmail.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
 <1490213273-8571-27-git-send-email-yamada.masahiro@socionext.com>
 <20170322223239.70a45053@bbrezillon>
 <CAK7LNARafOYZ54k2QZhTKgt-KLFs7Rz5X=GzDVkZkkXOchtGNQ@mail.gmail.com>
 <20170323093918.1e65916c@bbrezillon>
 <CAK7LNAT3nVvTWUb9bCB_7XN-wb4k+XrHn-f6FHHoU9gcVeytrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Mar 2017 12:23:01 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> >  
> >>
> >>
> >> It is unrelated to the chips' requirements.  
> >
> > It is related to the chip requirements.
> > Say you have a chip that requires a minimum of 4bits/512bytes. If you
> > want to convert that to a 1024byte block setting it's perfectly fine,
> > but then you'll have to meet (2 * ->ecc_strength_ds) for the
> > ecc.strength parameter.  
> 
> I think this example case is always fine from the
> "bigger ecc.size uses ECC more efficiently" we agreed.
> If 4bits/512bytes is achievable, 8bits/1024bytes is always met.
> 
> 
> The reverse is not always true.
> If the chip requires 8bits/1024bytes then controller uses 4bit/512bytes,
> this could be a reliability problem.

Yes. In this case, you can choose 8bits/512byte if your controller
supports it and the NAND has enough OOB bytes to store the ECC.
Otherwise, you try to do you best and pick 4bits/512bytes even if it's
a bit less reliable than 8bits/1024bytes.

> 
> 
> 
> > The nand-ecc-strength and nand-ecc-step DT properties are here to
> > override the chip requirements and force a specific setting. This is
> > for example needed when the bootloader hardcodes an ECC setting without
> > taking the NAND chip requirements into account, and since you want to
> > read/write from both the bootloader and linux, you'll have to force this
> > specific ECC setting, but this case should be the exception, not the
> > default behavior.  
> 
> Yes, I also thought the case where the boot-loader hardcodes an ECC setting.
> 
> Moreover, the Boot ROM really hard-codes (hard-wires)
> the ECC setting in some cases.   On some Socionext UniPhier boards,
> users have no freedom to change the ECC settings.

Okay, in this case there's nothing you can choose indeed.

> 
> So, DT property need to be supported somehow.

There's a difference between supporting the DT props and making them
mandatory. I never suggested to get rid of DT settings, just to use
NAND requirements when nothing is specified in the DT.

Anyway, if you want to keep this behavior, you should state in the
bindings doc that nand-ecc-step-size is mandatory for controllers
where the ECC block size is configurable (unless you don't support
such controllers yet).
