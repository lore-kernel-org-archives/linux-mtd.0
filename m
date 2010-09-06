Date: Mon, 6 Sep 2010 12:53:27 -0700
From: Arjan van de Ven <arjan@infradead.org>
To: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
Subject: Re: [RFC][PATCH 1/1]nand/denali: Add runtime pm support for denali
	controller driver
Message-ID: <20100906125327.036fbcaf@infradead.org>
In-Reply-To: <20100906080838.GA6528@intel.com>
References: <20100906080838.GA6528@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 Sep 2010 16:08:38 +0800
"Chuanxiao.Dong" <chuanxiao.dong@intel.com> wrote:


> +/* NOW denali NAND controller in MRST has no way to cut power off
> + * once it is power on, so just let these functions be empty
> + * */

this isn't right; you should put the device in PCI D3 state.



> +
> +static struct dev_pm_ops denali_pm = {
> +	.runtime_suspend = denali_runtime_suspend,
> +	.runtime_resume = denali_runtime_resume,
> +	.runtime_idle = denali_runtime_idle,

you don't really need a runtime_idle function


> +};
> +/* support denali runtime pm */
> +static void denali_timer_add(struct denali_nand_info *denali)

and this is where I get very nervous about your patch.

The runtime pm infrastructure already has timers, you don't need to
implement one!

in fact, I think the code is rather not using the runtime PM
infrastructure right.

The runtime PM framework offers you a reference counter for activity,
so what really ought to be done instead of this polling timer, is to
take a refcount each time something is submitted to the hardware..

> +	if (chip->state != FL_READY ||

... and decremented each time something is completed. This will change
the chip->state for you... each place chip->state is used is a
candidate for this proper refcounting.


basically, this timer in the driver is rather misplaced and should be
replaced by using the refcount from the runtime PM infrastructure
correctly...... and I suspect your patch gets a LOT simpler as well for
free.
