Subject: Re: [PATCH 2/2] mtd: msm_nand: Add initial msm nand driver support.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali Nalajala <mnalajal@codeaurora.org>
In-Reply-To: <1302942029.2308.1.camel@koala>
References: <1298940450-27365-1-git-send-email-mnalajal@codeaurora.org>
	<1298940450-27365-2-git-send-email-mnalajal@codeaurora.org>
	<1302861097.3220.12.camel@localhost>  <4DA85B24.50807@codeaurora.org>
	<1302942029.2308.1.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Apr 2011 11:31:52 +0300
Message-ID: <1302942712.2308.3.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dima Zavin <dima@android.com>,
	Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
	linux-mtd@lists.infradead.org,
	Brian Swetland <swetland@google.com>, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-04-16 at 11:20 +0300, Artem Bityutskiy wrote:
> > > +#define MSM_NAND_REG(off) (msm_nand_phys + (off))
> > > +
> > > +#define MSM_NAND_FLASH_CMD            MSM_NAND_REG(0x0000)
> > > +#define MSM_NAND_ADDR0                MSM_NAND_REG(0x0004)
> > >
> > > Could you please make the macros to take the "struct msm_nand_chip
> > > *chip" argument instead, and store the pase address there. Do not hide
> > > the fact that those macros are actually functions, not constant - this
> > > is error prone.
> > >
> > > Besides, I'm do not know your HW, but if you have several controllers
> > > with various base addresses - your driver won't work.
> > 
> > you are correct, we have multiple controllers, which breaks this logic 
> > in future.
> 
> So then make your macros to accept the base address as an argument
> instead please.

Or better make macros to be constants, and always use something like
base + MSM_NAND_FLASH_CMD - this is the standard approach.
-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
