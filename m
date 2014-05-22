Received: from mail-ig0-f180.google.com ([209.85.213.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnRYA-0007P8-7P
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:52:42 +0000
Received: by mail-ig0-f180.google.com with SMTP id c1so3399215igq.7
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:52:20 -0700 (PDT)
Date: Thu, 22 May 2014 12:52:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 09/10] mtd: st_spi_fsm: Provide mask to obtain correct
 boot device pins
Message-ID: <20140522115216.GV6679@lee--X1>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
 <1400757848-18075-10-git-send-email-lee.jones@linaro.org>
 <4231397.Nn7Rm5jh2O@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4231397.Nn7Rm5jh2O@wuerfel>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 Christophe Kerello <christophe.kerello@st.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Thursday 22 May 2014 12:24:07 Lee Jones wrote:
> > +       /* Mask to apply on boot_device_reg */
> > +       ret = of_property_read_u32(np, "st,boot-device-msk", &boot_device_msk);
> > +       if (ret)
> > +               goto boot_device_fail;
> > +
> > 
> 
> The binding defines this property as "optional", but the driver fails
> here if it's not provided. I suggest you add a default value here so you
> can deal with existing dts. The default should be documented in
> the binding as well.

The property is optional. It doesn't fail completely, merely skips the
boot device check and falls back to using SPI.  I can update the
documentation to this effect though, no problem.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
