From: David Woodhouse <dwmw2@infradead.org>
To: David Updegraff <dave@cray.com>
In-Reply-To: <4059AADF.50902@cray.com>
References: <4059AADF.50902@cray.com>
Content-Type: text/plain
Message-Id: <1079619325.16952.139.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 18 Mar 2004 14:15:26 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: large page NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-18 at 07:57 -0600, David Updegraff wrote:
> Hi.
> 
> There was a post or two a few months ago about support for larger 
> (1,2,?,K) pagesize and the extra 2 bytes of config available in newer 
> NAND chips..  And a cautionary about asking for advice before 
> proceeding. Is there followup/progress on that front that I have missed? 
> We are looking into these needs for some Samsung 2k-page NANDs.

Thomas and I haven't been forced to deal with these flashes and hence
haven't given it much thought. Nobody else seems to be hugely prolific.

> Advice & recommended directions appreciated.

Try it. The existing code shouldn't be _too_ hard to adjust. Join #mtd
on irc.freenode.net and heckle Thomas and I about how you want the
generic NAND interfaces changed.

-- 
dwmw2
