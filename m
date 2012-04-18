From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 4/4] ARM: mxs/mx28evk: add GPMI-NAND device
Date: Wed, 18 Apr 2012 23:46:48 +0200
References: <1314169643-23425-1-git-send-email-b32955@freescale.com>
 <20120406023121.GK7264@S2101-09.ap.freescale.net>
 <CAOMZO5Dr+qVMOpG6T03L-+i6qYkJRPUPT87hcJAs6DxHs+EcmA@mail.gmail.com>
In-Reply-To: <CAOMZO5Dr+qVMOpG6T03L-+i6qYkJRPUPT87hcJAs6DxHs+EcmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201204182346.48333.marek.vasut@gmail.com>
Cc: dedekind1@gmail.com, Sam Gandhi <samgandhi9@gmail.com>,
 s.hauer@pengutronix.de, w.sang@pengutronix.de,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Fabio Estevam,

> On Thu, Apr 5, 2012 at 11:31 PM, Shawn Guo <shawn.guo@linaro.org> wrote:
> > I have to do that to motivate people to add DT support for the drivers
> > they submit from the beginning.
> 
> Understand your point for new drivers.
> 
> If you take the GPMI driver for example: it has been available for a
> long time and there is no board using it in mainline.
> 
> So how can people easily test it and find bugs with this driver?
> Patching their own trees themselves? Sam Gandhi did extensive tests on
> NAND and found some DMA issues with it.
> 
> If we could have mx28evk supporting GPMI driver today it would
> estimulate people to use it and more issues can be found and fixed.
> 
> Waiting for DT support to be in place is just blocking the progress for
> mx28.

Sadly, I have to agree. I'm not against DT, but blocking it now is bogus.

> Please note that right now there is no dt support for mx28 in mainline.
> 
> If what blocks this patch "ARM: mxs/mx28evk: add GPMI-NAND device" to
> be accepted is the pin mux conflict, that would be easy to fix and
> Huang could do a v5 if you agree.
> 
> > Also I do not see much point to keep patching board files which are
> > to be removed.
> 
> I understand your point, but again, right now there is no dt support,
> so the only mechanism we have to register driver is via board files
> for mx28.
> 
> So it would be nice if you could still accept patches for mx28 while
> mx28 dt does not show up in mainline.
> 

Agreed


Best regards,
Marek Vasut
