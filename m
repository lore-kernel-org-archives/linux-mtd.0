Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvdzi-0007Vu-42
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 11:01:45 -0500
Date: Mon, 31 Jan 2005 17:01:29 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <20050131160129.GG6694@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 January 2005 10:43:25 -0500, Robert P. J. Day wrote:
> 
>   ah, excellent, but while we're on the subject of parameters, is
> there any hope of getting some consistency in the way parameter values
> are supplied across the world of JFFS2 and MTD?
> 
>   to wit, with "mkfs.jffs2":
> 
> -p, --pad[=SIZE] Pad output to SIZE bytes with 0xFF. If SIZE is
>                         not specified, the output is padded to the
> 			end of the final erase block
> 
> 
>   so, apparently, you supply an *exact* byte size here (it's not
> mentioned if you can use KiB or MiB prefixes).
> 
>   with "--pagesize" and "--eraseblock", the help states that you *can*
> use those prefixes.
> 
>   if you check what you can do with the mtdram module, you get:
> 
> $ modinfo mtdram
> filename:
> /lib/modules/2.6.10-1.741_FC3/kernel/drivers/mtd/devices/mtdram.ko
> parm:           total_size:Total device size in KiB
> parm:           erase_size:Device erase block size in KiB
> 
>   so the values here are ... what?  strictly in KiB?  so i'd supply
> something like
> 
>   total_size=16384
> 
> to specify 16M?  it's just a bit painful to jump around between the
> various utilities and have to keep remembering what the standard is.
> 
>   thoughts?

Feel free to send patches. :)

mkfs.jffs2 is something I personally don't care about.  Few do, thus
the current state.

mtdram looks pretty broken, interface-wise.  So if you want to fix it,
you might want to follow my path with slram/phram or blkmtd/block2mtd.
Rename the file, fix the interface, fix the other crap you find,
submit for inclusion.  If it's better, people will start using it.

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918
