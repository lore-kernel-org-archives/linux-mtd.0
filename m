Subject: Re: mtd/maps/ceiva.c: possibly uninitialised local variable nr
From: David Woodhouse <dwmw2@infradead.org>
To: d binderman <dcb314@hotmail.com>
In-Reply-To: <BLU108-W25DE0DC220AD6F99A8C5879C580@phx.gbl>
References: <BLU108-W25DE0DC220AD6F99A8C5879C580@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Feb 2010 12:50:24 +0000
Message-ID: <1267102224.30247.6304.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-01 at 10:26 +0000, d binderman wrote:
> There is no code to cope with the case that function
> machine_is_ceiva() returns 0 or that CONFIG_ARCH_CEIVA is undefined.

CONFIG_ARCH_CEIVA can never be undefined -- this driver depends on
ARCH_CEIVA in Kconfig. I don't quite understand why it's littered with
the ifdefs. Russell?

The error you spot could conceivably happen in a multiplatform build
though (if such a build {is,becomes} possible for ARM platforms).

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
