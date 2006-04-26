Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYkon-0001UT-9r
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 10:16:43 -0400
Date: Wed, 26 Apr 2006 16:16:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
Message-ID: <20060426141609.GG29108@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 April 2006 15:36:08 +0400, Belyakov, Alexander wrote:
> 
> JFFS2 (and not only JFFS2) does not work on top of concatenated MTD
> device in case of NAND and Sibley chips due to missing
> concat_block_isbad(), concat_block_markbad(), concat_writev() and
> concat_writev_ecc() functions. If anyone cares - the patch below fixes
> that issue.

concat_writev() is far too complicated.  I have a patch somewhere that
adds a generic writev() function to every device.  Once that is in,
your patch should get a respin and be much simpler.

I didn't closely look at the rest of it but suspect similar things.
Having complicated code in the kernel should not result in adding more
complicated code, but in someone making the existing code simple. ;)

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
