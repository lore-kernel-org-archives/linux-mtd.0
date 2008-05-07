Subject: Re: jffs2 and unaligned access
From: David Woodhouse <dwmw2@infradead.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20080507102724.GE4326@pengutronix.de>
References: <20080507102724.GE4326@pengutronix.de>
Content-Type: text/plain
Date: Wed, 07 May 2008 11:53:49 +0100
Message-Id: <1210157630.25560.884.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jon Smirl <jonsmirl@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-05-07 at 12:27 +0200, Sascha Hauer wrote:
> memcpy_from/to_io() use word aligned accesses on the io side of memory.
> The MPC5200 local plus bus where our flashes are connected does not
> allow unaligned accesses, so we have to use the io versions of memcpy.

But this region of flash is marked as suitable for execute-in-place,
otherwise the point() function wouldn't be working to give a direct
pointer to it. It sounds like we shouldn't be allowing that.

Which in turn means that perhaps we should have a property in the
corresponding node in the device-tree which indicates that it's not
suitable for direct access?

-- 
dwmw2
