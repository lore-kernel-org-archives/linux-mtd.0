From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@oktetlabs.ru
In-Reply-To: <41986D89.4060308@oktetlabs.ru>
References: <41986D89.4060308@oktetlabs.ru>
Content-Type: text/plain
Date: Mon, 15 Nov 2004 08:49:11 +0000
Message-Id: <1100508552.8015.61.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND pages cache?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-15 at 11:49 +0300, Artem Bityuckiy wrote:
> So, the obvious idea how to avoid this is to introduce something like 
> NAND pages cache. The cache will keep several NAND pages which were last 
> accessed.
> 
> I don not know is it good to do this only in JFFS2 or on the MTD NAND layer?

I thought we already did this in the MTD NAND layer, since we had to
read whole pages there to do ECC anyway. Thomas?

-- 
dwmw2
