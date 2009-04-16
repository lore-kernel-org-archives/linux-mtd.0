Received: from mail.wantstofly.org ([2001:888:11ff:97::11])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuTH0-00040k-6I
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 15:13:10 +0000
Date: Thu, 16 Apr 2009 17:14:33 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: Bug in physmap driver?
Message-ID: <20090416151433.GS1760@mail.wantstofly.org>
References: <20090416150630.GR1760@mail.wantstofly.org>
	<5680.1239894019@redhat.com> <11416.1239894581@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11416.1239894581@redhat.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2009 at 04:09:41PM +0100, David Howells wrote:

> > That would suggest that dev->resource[i].end is off-by-one?
> 
> Actually, that's a good question: should end be one after the last useful
> addres, or should it be that last useful address?

The last useful address.  That's what the resource code expects, as
e.g. two regions with start=00100000,end=00200000 and
start=00200000,end=00300000 will conflict (registration of the second
will fail), whereas if you change the end addresses to 001fffff and
002fffff, they will no longer conflict.

And e.g. /proc/iomem on my x86 box has:

	c4000000-c40fffff : PCI Bus #01
	dff00000-efefffff : PCI Bus #05
	ff500000-ff5fffff : PCI Bus #01
	ff600000-ff6fffff : PCI Bus #02
	ff700000-ff7fffff : PCI Bus #03
	ff800000-ff8fffff : PCI Bus #04
	ff900000-ff9fffff : PCI Bus #05
