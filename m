Subject: Re: [PATCH 1/1] [MTD/NAND]: Add Blackfin BF52x on-chip NAND Flash
	controller driver support in bf5xx_nand driver
From: David Woodhouse <dwmw2@infradead.org>
To: Robin Getz <rgetz@blackfin.uclinux.org>
In-Reply-To: <200711231704.59948.rgetz@blackfin.uclinux.org>
References: <1195812893-26312-1-git-send-email-bryan.wu@analog.com>
	<386072610711230625k23b68e49q6090b7eb27c2c039@mail.gmail.com>
	<20071123135212.7c483aae@laptopd505.fenrus.org>
	<200711231704.59948.rgetz@blackfin.uclinux.org>
Content-Type: text/plain
Date: Sat, 24 Nov 2007 06:43:28 +0000
Message-Id: <1195886608.25590.59.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Bryan Wu <bryan.wu@analog.com>, Bryan Wu <cooloney.lkml@gmail.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	uclinux-dist-devel@blackfin.uclinux.org,
	Arjan van de Ven <arjan@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2007-11-23 at 17:04 -0500, Robin Getz wrote:
> It could be a runtime if() but we don't currently have the is_mach() all set 
> up properly today.
> 
> This is because on most systems that Blackfin ships on - memory is the 
> dominate cost of the system, and end users don't want to take the either the 
> storage (flash) hit of having code they don't use, or the run time (DRAM) 
> overhead. They are fine with compiling 2 kernels for two platforms if it 
> means things are cheaper. :)
> 
> That being said, we still need to go back, and add things properly - and just 
> let gcc optimise things away if it is not used - c code is more maintainable 
> than all the ifdefs we have today.
> 
> This is the goal - it will just take a little bit to get there.

For now I suspect you could at least define machine_is_bf52x() and
machine_is_bf54x() which are hard-coded to either zero or one according
to the configuration, and at least you wouldn't need to add ifdefs to
drivers.

-- 
dwmw2
