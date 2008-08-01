Subject: Re: Node CRC failures in latest mainline git?
From: David Woodhouse <dwmw2@infradead.org>
To: Bill Gatliff <bgat@billgatliff.com>
In-Reply-To: <4891431D.7030009@billgatliff.com>
References: <48913EA3.9080603@billgatliff.com>
	<4891431D.7030009@billgatliff.com>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 21:59:50 +0100
Message-Id: <1217624390.3719.32.camel@shinybook.infradead.org>
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

On Wed, 2008-07-30 at 23:44 -0500, Bill Gatliff wrote:
> 
> Bill Gatliff wrote:
> > 
> > An older kernel (three or four weeks ago) continues to work fine on the same board.
> 
> I take that back--- a 2.6.24 kernel is issuing the same message, but it still
> mounts the filesystem.  The latest git stuff won't.

Why doesn't it mount? It shouldn't be because of a single bad node
CRC...
 
-- 
dwmw2
