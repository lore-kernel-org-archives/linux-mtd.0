Subject: Re: Linux 2.6.29-rc6
From: David Woodhouse <dwmw2@infradead.org>
To: Jesper Krogh <jesper@krogh.cc>
In-Reply-To: <49A6EE17.4070102@krogh.cc>
References: <alpine.LFD.2.00.0902222023520.3111@localhost.localdomain>
	<49A679E8.1010301@krogh.cc>
	<alpine.LFD.2.00.0902260941090.3111@localhost.localdomain>
	<49A6EE17.4070102@krogh.cc>
Content-Type: text/plain
Date: Fri, 27 Feb 2009 04:36:48 +0900
Message-Id: <1235677008.8730.176.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Ryan Jackson <rjackson@lnxi.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Dave Olsen <dolsen@lnxi.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-02-26 at 19:31 +0000, Jesper Krogh wrote:
> 1) pick the distro .config
> 2) make oldconfig

So it should have been a module, not built-in?

> 3) Let the kernel load what it think it needs.

That part at least ought to be disabled -- we don't let this driver
autoload, because unless you _know_ you need it, you don't need it.

It's for overwriting your BIOS.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
