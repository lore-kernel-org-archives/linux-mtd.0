Subject: Re: bit flip
From: David Woodhouse <dwmw2@infradead.org>
To: catboat@texas.net
In-Reply-To: <1191439970.4703ee62083f1@webmail.texas.net>
References: <1191439970.4703ee62083f1@webmail.texas.net>
Content-Type: text/plain
Date: Wed, 10 Oct 2007 00:48:17 -0400
Message-Id: <1191991698.578.92.camel@localhost.localdomain>
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

On Wed, 2007-10-03 at 14:32 -0500, catboat@texas.net wrote:
> A NAND card flipped a bit and caused a data CRC problem in a data node. 
> When I cat the file, this region is zeroes. cat exits with rc 0.

On NAND you should have ECC to prevent this failure mode.

> I can simulate this. I made a jffs2 file system using mkfs.jffs2. 
> In a file with multiple data nodes, I manually flip a bit in one of them.
> At mount time, I see a printk about it.  cat exits with 0 and the file has a 
> chunk of zeroes in it.
> 
> Seems incorrect to me.  I expected jffs2 to return EIO somewhere.
> 
> Does it seem incorrect to you? 

We could probably manage that -- there should never be any _holes_ in
the file. It's not a panacea though, because sometimes if the latest
node is corrupted you might just see 'old' dirty data from an earlier
version, rather than a hole.

-- 
dwmw2
