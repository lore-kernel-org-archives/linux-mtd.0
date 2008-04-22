Subject: Re: Fwd: [PATCH 5/9] magician: enable flash VPP GPIO and build in
	MTD, physmap-flash and JFFS2
From: David Woodhouse <dwmw2@infradead.org>
To: pHilipp Zabel <philipp.zabel@gmail.com>
In-Reply-To: <74d0deb30803210933u1d3ca18endcd942496409de28@mail.gmail.com>
References: <1205785071.11350.39.camel@localhost.localdomain>
	<20080320210120.GI16166@flint.arm.linux.org.uk>
	<74d0deb30803210448l49d2eea8ladd95766c47ba820@mail.gmail.com>
	<74d0deb30803210933u1d3ca18endcd942496409de28@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 20:59:45 +0100
Message-Id: <1208894385.9212.666.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-03-21 at 17:33 +0100, pHilipp Zabel wrote:
> Hi, I'd like to forward you a question about this patch that I'd like
> to get in via Russell King's queue.
> 
> The way the MTD subsystem / physmap driver handle set_vpp, can the
> magician_set_vpp function below race with itself? Or would it be
> better to use a counting approach like omap_set_vpp in the omap-nor
> driver?

I believe that when used for a single chip (or set of chips with a
single map driver), all access is serialised. It's only if you use the
same set_vpp() function for multiple different maps that you need to
play counting tricks.

-- 
dwmw2
