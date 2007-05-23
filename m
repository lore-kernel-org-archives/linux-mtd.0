Subject: Re: jffs2 sumtool bug ?
From: David Woodhouse <dwmw2@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4653F6DE.1090105@parrot.com>
References: <4653F6DE.1090105@parrot.com>
Content-Type: text/plain
Date: Wed, 23 May 2007 06:55:11 -0400
Message-Id: <1179917711.10095.58.camel@shinybook.infradead.org>
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

On Wed, 2007-05-23 at 10:10 +0200, Matthieu CASTET wrote:
> PS : about summary, could the sumtool change the order of the nodes to 
> avoid to waste too much space. For example if the eraseblock is 16KB and 
> we have 4 nodes of 4KB. Sumtool will put in the first eraseblock 3 
> nodes, 4KB will be wasted for the sumary node. In this wasted 4KB, we 
> could have put smaller nodes.

Theoretically, yes. But there's easier things to do first. We could
halve the size of the summary node itself, for example.

-- 
dwmw2
