From: David Woodhouse <dwmw2@infradead.org>
To: Jun Sun <jsun@mvista.com>
In-Reply-To: <20031027101741.C1678@mvista.com>
References: <20031022182558.U19834@mvista.com>
	 <20031027101741.C1678@mvista.com>
Content-Type: text/plain
Message-Id: <1067338214.15551.405.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Oct 2003 10:50:15 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-10-27 at 10:17 -0800, Jun Sun wrote:
> Any objections or comments?  David?

Sorry for delayed response. I'm not really sure about this. Take a look
at drivers/mtd/maps/rpxlite.c -- that's what we're able to eliminate,
and we could even stick half of _that_ into a library function. 

I'm all for cleaning up all the duplication in the map drivers, but I'm
not sure we need to do it by making users enter correct numbers for
CONFIG_MTD_PHYSMAP_*...

-- 
dwmw2
