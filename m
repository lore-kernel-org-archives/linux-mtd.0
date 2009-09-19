Subject: Re: [PATCH] [MTD] [CHIPS] stm_flash: new ST PSD4256G compatible
	flash chip driver
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
References: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain
Date: Sat, 19 Sep 2009 13:08:56 -0700
Message-Id: <1253390936.6317.33.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-06-13 at 06:59 -0400, Mike Frysinger wrote:
> The ST PSD4256G Flash In-System Programming (ISP) part is a multifunction
> device.  Since all of the different pieces are memory mapped, this is a
> driver for the NOR flash component.  All the other pieces can use generic
> memory based drivers.  Unfortunately, this is not a CFI compliant part in
> any way, so we need a dedicated chip driver for it.

Hrm. This looks very similar to cfi_cmdset_0002.c, which we _do_ already
use with non-CFI-compliant parts. 

CFI is just the _probe_ method. We can probe chips using the JEDEC
method too, and that works just fine -- jedec_probe.c will "invoke" the
appropriate command set driver.

Can't you do the same?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
