Date: Mon, 6 Sep 2010 20:34:53 -0700
From: Arjan van de Ven <arjan@infradead.org>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Subject: Re: [RFC][PATCH 1/1]nand/denali: Add runtime pm support for denali
	controller driver
Message-ID: <20100906203453.453b1da2@infradead.org>
In-Reply-To: <5D8008F58939784290FAB48F54975198278A3798F3@shsmsx502.ccr.corp.intel.com>
References: <20100906080838.GA6528@intel.com>
	<20100906125327.036fbcaf@infradead.org>
	<5D8008F58939784290FAB48F54975198278A3798F3@shsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Gao,
	Yunpeng" <yunpeng.gao@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 7 Sep 2010 10:12:09 +0800
"Dong, Chuanxiao" <chuanxiao.dong@intel.com> wrote:

> Hi
> See my comments below.
> Thanks
> --Chuanxiao
> 
> > -----Original Message-----
> > From: Arjan van de Ven [mailto:arjan@infradead.org]
> > Sent: Tuesday, September 07, 2010 3:53 AM
> > To: Dong, Chuanxiao
> > Cc: dwmw2@infradead.org; linux-mtd@lists.infradead.org
> > Subject: Re: [RFC][PATCH 1/1]nand/denali: Add runtime pm support
> > for denali controller driver
> > 
> > On Mon, 6 Sep 2010 16:08:38 +0800
> > "Chuanxiao.Dong" <chuanxiao.dong@intel.com> wrote:
> > 
> > 
> > > +/* NOW denali NAND controller in MRST has no way to cut power off
> > > + * once it is power on, so just let these functions be empty
> > > + * */
> > 
> > this isn't right; you should put the device in PCI D3 state.
> 
> This will be update after I got a correct runtime PM framework using.
> 
> > 
> > > +
> > > +static struct dev_pm_ops denali_pm = {
> > > +	.runtime_suspend = denali_runtime_suspend,
> > > +	.runtime_resume = denali_runtime_resume,
> > > +	.runtime_idle = denali_runtime_idle,
> > 
> > you don't really need a runtime_idle function
> > 
> > 
> > > +};
> > > +/* support denali runtime pm */
> > > +static void denali_timer_add(struct denali_nand_info *denali)
> > 
> > and this is where I get very nervous about your patch.
> > 
> > The runtime pm infrastructure already has timers, you don't need to
> > implement one!
> > 
> > in fact, I think the code is rather not using the runtime PM
> > infrastructure right.
> > 
> > The runtime PM framework offers you a reference counter for
> > activity, so what really ought to be done instead of this polling
> > timer, is to take a refcount each time something is submitted to
> > the hardware..
> > 
> > > +	if (chip->state != FL_READY ||
> > 
> > ... and decremented each time something is completed. This will
> > change the chip->state for you... each place chip->state is used is
> > a candidate for this proper refcounting.
> 
> And this is what I am confusing. Each place chip->state is used is in
> MTD framework....no in MTD driver itself. MTD driver never know when
> it is opened or released. Each time before hardware has something to
> do chip->state is already set to be something like READING/ WRITING
> by MTD framework. And after finishing the hardware work, chip->state
> does not change. Then return back to MTD framework. If there are
> still something for hardware to do, chip->state will not change. Only
> when there is nothing to do, MTD framework will set chip->state to be
> READY after MTD driver finishing the last hardware work. That is the
> process for MTD driver working. It only maintains the hardware
> working part. Before or after it finishes the hardware work, the
> chip->state is always to be READING/WRITING. It never knows when
> there will have the first or the last hardware access. So that is why
> I add a timer for driver to detect the chip->state. And that is why I
> think it's better for MTD framework to do some runtime PM work.

if you take the refcount every time you get a command, and drop a count
each time a command completes.... this is all not too important.. it'll
just work



-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
