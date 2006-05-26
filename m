From: David Woodhouse <dwmw2@infradead.org>
To: jean-francois simon <jfs@themis.com>
In-Reply-To: <44773572.7000809@themis.com>
References: <44773572.7000809@themis.com>
Content-Type: text/plain
Date: Fri, 26 May 2006 18:31:49 +0100
Message-Id: <1148664709.28878.67.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mpc8270 and 64bit flash geometry
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-26 at 19:05 +0200, jean-francois simon wrote:
> We now know this single WE poses problem. From reading the 
> archive it seems there is a work around by defining a write 
> routine in the map driver that uses the 64b load/store floating 
> point instrcutions.
> So I have done that, but I still can't do an "eraseall" (it will 
> panic the system).

Show the panic. If you're using floating point registers in the kernel,
you need to do that carefully and properly.

> Besides the specific write routine, anything else I need to do? 
> Or the MTD code will simply not work with this kind of geometry? 

It ought to work.

> Looking at the code, I have one question: SHould 
> ./mtd/chips/cfi_probe.c:cfi_probe_chip() be called for _every_ 
> flash chip? It seems to be called only once per bank.

Er, I think we just assume that all the chips are identical.

-- 
dwmw2
