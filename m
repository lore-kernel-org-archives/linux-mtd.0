From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <37CC93E8710D@baydel.com>
References: <37CC93E8710D@baydel.com>
Content-Type: text/plain
Message-Id: <1068214714.6065.887.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 07 Nov 2003 14:18:35 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: Re: SFFDC and blksize_size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-11-07 at 13:12 +0000, Simon Haynes wrote:
> I have been writing a block driver for SSFDC compliant SMC cards. This stuff 
> allocates 16k blocks.  When I get requests the transfers are split into the 
> size I specifty in the blksize_size{MAJOR] array. 

You can't set a block size larger than page size.

> It sems that most things 
> set this to 1k. In my case this causes a performance problem  as I have to 
> end up doing 16 * (16K write,  16K read, 16k erase)  to write and verify a 
> 16k block which has been previously written.

Urgh. Whereas with FTL, NFTL etc. you can just fill in new sectors
individually in the newly-allocated eraseblock. 

Surely you're not actually erasing the block and then praying you don't
lose power before writing the new contents back? There's some kind of
chaining from the old to the new block? Can't you say which sectors are
valid in the new block, and which should still be used from the old?

I wouldn't advocate setting the block size even to 4KiB, since that'll
waste a lot of space. But we could certainly make use of request merging
if what you're doing really is necessary -- we can make a
'write_sectors' function which writes more than a sector at a time.

-- 
dwmw2
