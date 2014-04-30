Received: from mail-wi0-f175.google.com ([209.85.212.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfTeT-0001Av-5X
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 12:30:17 +0000
Received: by mail-wi0-f175.google.com with SMTP id cc10so9035234wib.2
 for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2014 05:29:52 -0700 (PDT)
Date: Wed, 30 Apr 2014 13:29:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC 07/47] mtd: nand: stm_nand_bch: initialise the BCH Controller
Message-ID: <20140430122946.GM29462@lee--X1>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <1395735604-26706-8-git-send-email-lee.jones@linaro.org>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5CB7@DBDE04.ent.ti.com>
 <20140430102244.GK29462@lee--X1>
 <20980858CB6D3A4BAE95CA194937D5E73EAC6A35@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC6A35@DBDE04.ent.ti.com>
Cc: "angus.clark@st.com" <angus.clark@st.com>,
 "kernel@stlinux.com" <kernel@stlinux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Ezequiel Garcia \(ezequiel.garcia@free-electrons.com\)"
 <ezequiel.garcia@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >> >+	/* Reset and disable boot-mode controller */
> >> >+	writel(BOOT_CFG_RESET, nandi->base + NANDBCH_BOOTBANK_CFG);
> >> >+	udelay(1);
> >> >+	writel(0x00000000, nandi->base + NANDBCH_BOOTBANK_CFG);
> >>
> >> Why using 'udelay' ?
> >> Isn't there any status register which tells you that controller is reset / initialized ?
> >> Or may be polling on NANDBCH_BOOTBANK_CFG may itself give you status.
> >
> >Documenation says:
> >
> >  "The soft reset bit has to be reset to ‘0’ to de-assert the soft
> >   reset. The soft reset bit is expected to be asserted for at least
> >   one clock cycle for proper reset"
> >
> That’s the hardware way of saying that 'enable the clock before applying reset'.
> Clock is required to propagate reset-logic to flip-flops in pipeline, which do not get direct reset.
> 
> However that apart. You may safely drop udelay(1) because this 'udelay' is at
> CPU side and won't guarantee anything about clocks at your controller side.
> But I leave it to you as this delay is pretty small.

I'd like to keep it in if it's all the same to you.  The original
author is pretty competent and I like to think that it's there for a
reason - and as you rightly say, the delay is pretty small.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
