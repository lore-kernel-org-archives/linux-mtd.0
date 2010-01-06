Subject: Re: [PATCH v7 5/5]: mtdoops: refactor as a kmsg_dumper
From: David Woodhouse <dwmw2@infradead.org>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091015094815.36f5872c@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094815.36f5872c@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 14:33:16 +0000
Message-ID: <1262788396.3181.8153.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hmmm.

On Thu, 2009-10-15 at 09:48 +0200, Simon Kagstrom wrote:
> +	/* Panics must be written immediately */
> +	if (reason == kmsg_dump_panic) {
> +		if (!cxt->mtd->panic_write)
> +			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
> +		else
> +			mtdoops_write(cxt, 1);
> +		return;
> +	}
> +

...replaces...

> -	if (mtd->panic_write && (in_interrupt() || panic_on_oops))
> -		/* Interrupt context, we're going to panic so try and log */
> -		mtdoops_write(cxt, 1);
> -	else
> -		schedule_work(&cxt->work_write);
> -}

So in the case where the device driver doesn't provide a ->panic_oops()
function, we now don't even bother with a best-effort attempt to dump;
we just give up.

Would there be any harm in scheduling the work_write function _anyway_,
just in case it manages to run?

The bug report at http://bugzilla.kernel.org/show_bug.cgi?id=14102 seems
to be suggesting that sometimes it _did_ manage to work, with a bit of
luck and a following wind.

Also, it looks like in the (in_interrupt() || panic_on_oops) case we end
up calling kmsg_dump(KMSG_DUMP_OOPS) from oops_exit(), almost
immediately followed by kmsg_dump(KMSG_DUMP_PANIC). Is that going to do
the right thing?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
