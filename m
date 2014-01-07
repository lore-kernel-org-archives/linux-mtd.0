Received: from mail-we0-f172.google.com ([74.125.82.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0ZG8-000496-FZ
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 16:12:05 +0000
Received: by mail-we0-f172.google.com with SMTP id p61so347863wes.3
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2014 08:11:40 -0800 (PST)
Date: Tue, 7 Jan 2014 16:11:36 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH v3 09/36] mtd: st_spi_fsm: Provide device look-up table
Message-ID: <20140107161136.GK3182@lee--X1>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-10-git-send-email-lee.jones@linaro.org>
 <20131210220338.GF27149@ld-irv-0074.broadcom.com>
 <52B016A0.3080201@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52B016A0.3080201@st.com>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >> +/* SPI Flash Device Table */
> >> +struct flash_info {
> >> +	char		*name;
> >> +	/*
> >> +	 * JEDEC id zero means "no ID" (most older chips); otherwise it has
> >> +	 * a high byte of zero plus three data bytes: the manufacturer id,
> >> +	 * then a two byte device id.
> >> +	 */
> >> +	u32		jedec_id;
> >> +	u16             ext_id;
> > 
> > Will 5 bytes of ID be enough? I think we're running into a need for 6
> > bytes of ID in m25p80.c right about now. Might make sense to start with
> > the right number of bytes.
> 
> Yes, we will need 6 bytes of ID.  The "dirty" stm_spi_fsm driver already handles
> arbitrary-length IDs.  This will need to be pulled into the "upstream" version
> at some point.

Just looking at this now. May I do this subsequently? It's a pretty
big change and I don't want to disturb the patch-set too much at this
moment. The "dirty" kernel has only been updated with this change
recently. We will need it too, but we can definitely do without it for
a little while.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
