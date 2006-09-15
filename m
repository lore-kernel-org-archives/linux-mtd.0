Subject: Re: [-mm patch 2/3] AVR32 MTD: Unlock flash if necessary (try 2)
From: David Woodhouse <dwmw2@infradead.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
In-Reply-To: <20060915163711.10d19763@cad-250-152.norway.atmel.com>
References: <20060915163102.73bf171d@cad-250-152.norway.atmel.com>
	<20060915163554.4f326bf6@cad-250-152.norway.atmel.com>
	<20060915163711.10d19763@cad-250-152.norway.atmel.com>
Content-Type: text/plain
Date: Fri, 15 Sep 2006 16:32:26 +0100
Message-Id: <1158334346.24527.94.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-09-15 at 16:37 +0200, Haavard Skinnemoen wrote:
> If a cfi_cmdset_0002 fixup installs an unlock() operation, use it
> to unlock the whole flash after the erase regions have been set up.

There are cmdset_0001 chips which have this affliction too. I was
thinking of having a flag MTD_STUPID_LOCK which you set when you
determine that it's one of these chips, then add_mtd_device() can do the
unlocking... or add_mtd_partitions() can do it but _only_ for writable
partitions.

-- 
dwmw2
