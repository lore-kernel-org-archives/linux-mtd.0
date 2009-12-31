Subject: Re: [PATCH] drivers/mtd/nand/gpio.c: use resource_size()
From: David Woodhouse <dwmw2@infradead.org>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19090200EA54@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE19090200EA54@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Dec 2009 20:54:41 +0000
Message-ID: <1262292881.3181.5632.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-12-14 at 16:30 -0500, H Hartley Sweeten wrote:
> 
> -       release_mem_region(res0->start, res0->end - res0->start + 1);
> +       release_mem_region(res0->start, resouce_size(res0)); 

That's not going to compile. I fixed it up.

Every patch in this batch failed to apply cleanly with git-am, too --
there was something odd about the whitespace at the end of each one.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
