From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
References: <20050215154819.GB831@synertronixx3>
	<Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 15 Feb 2005 17:36:29 +0000
Message-Id: <1108488989.19262.623.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-15 at 11:38 -0500, Nicolas Pitre wrote:
> Please study carefully xip_udelay() and try to understand _when_ it is 
> OK to call other functions and when it is not.  This function is really 
> where all the magic is happening.

Out of interest, how do we guarantee that there won't be speculative
prefetching of icache? If you're relying on hardware-specific knowledge
that it doesn't happen, please document that so that it doesn't bite
people implementing the XIP primitives on other platforms.

-- 
dwmw2
