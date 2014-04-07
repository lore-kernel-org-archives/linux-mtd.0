Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX7QQ-0003D2-5T
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 11:09:14 +0000
Received: by mail-wi0-f176.google.com with SMTP id r20so4839598wiv.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2014 04:08:48 -0700 (PDT)
Date: Mon, 7 Apr 2014 12:08:41 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v6 01/36] mtd: st_spi_fsm: Allocate resources and
 register with MTD framework
Message-ID: <20140407110841.GC8888@lee--X1>
References: <1395307268-12721-1-git-send-email-lee.jones@linaro.org>
 <1395307268-12721-2-git-send-email-lee.jones@linaro.org>
 <1396858351.8506.8.camel@x220> <20140407091110.GB8888@lee--X1>
 <1396863705.8506.39.camel@x220>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1396863705.8506.39.camel@x220>
Cc: Angus.Clark@st.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > > diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> > > > index 0128138..1210bc2 100644
> > > > --- a/drivers/mtd/devices/Kconfig
> > > > +++ b/drivers/mtd/devices/Kconfig
> > > > @@ -210,6 +210,14 @@ config MTD_DOCG3
> > > >  	  M-Systems and now Sandisk. The support is very experimental,
> > > >  	  and doesn't give access to any write operations.
> > > >  
> > > > +config MTD_ST_SPI_FSM
> > > > +	tristate "ST Microelectronics SPI FSM Serial Flash Controller"
> > > > +	depends on ARM || SH
> > > 
> > > That should probably be
> > >           depends on ARM || SUPERH
> > 
> > Actually it should be ARCH_STI, but thanks for the prompt.
> 
> I wouldn't have guessed that!
> 
> (Is ARCH_STI actually needed? ARCH_STI doesn't formally depend on ARM
> but I don't think one can end up with a .config with ARCH_STI set
> without ARM also set. Or am I mistaken?)

Sorry Paul, I should have been clearer. The line should read:

      depends on ARCH_STI

> > > > +	help
> > > > +	  This provides an MTD device driver for the ST Microelectronics
> > > > +	  SPI Fast Sequence Mode (FSM) Serial Flash Controller and support
> > > > +	  for a subset of connected Serial Flash devices.
> > > > +
> > > >  if MTD_DOCG3
> > > >  config BCH_CONST_M
> > > >  	default 14
> > > 
> > > Can this still be fixed in a future version of this series or should I
> > > send a trivial patch?
> > 
> > Do you mean the SH thing, or are you now referencing something else?
> > 
> > If the former then I'm happy to send a fixup patch.
> 
> No, I was talking about the SH symbol. I'll gladly leave it up to you to
> fix this.

No problem, ta.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
