Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DAqLw-0008L7-Jd
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 09:15:29 -0500
Date: Mon, 14 Mar 2005 15:15:09 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <20050314141509.GA17590@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0503121217090.24583@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0503121217090.24583@localhost.localdomain>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: how to access jffs2 partition properties?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 12 March 2005 12:20:27 -0500, Robert P. J. Day wrote:
> 
>   on a PPC system using a 2.4.22 kernel, is there a way to access the
> properties for the jffs2 filesystems that have been defined on the two
> flash chips this system has?
> 
>   it's easy enough to see the devices /dev/mtdblock/[0-4] that
> represent the partitions, and the file /proc/partitions contains:
> 
>   31     0         64 mtdblocka
>   31     1        384 mtdblockb
>   31     2        128 mtdblockc
>   31     3       3072 mtdblockd
>   31     4      29184 mtdblocke
> 
> but can i examine, for each of these, its chip, starting address,
> ending address, etc?  thanks.

Not all mtd are flash based.  Mtd code should have zero knowledge
about chip, start address, etc.  If you need that information, you
have to tweak the mapping driver to give it out.

Jörn

-- 
Premature optimization is the root of all evil.
-- Donald Knuth
