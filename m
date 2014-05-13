Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkD2M-0004xv-7d
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 13:46:30 +0000
Date: Tue, 13 May 2014 10:44:48 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/4] mtd: nand: Account the blocks used by the BBT in the
 ecc_stats
Message-ID: <20140513134448.GB1504@arch.cereza>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140513022753.GB1447@arch.cereza>
 <20140513023651.GC28907@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140513023651.GC28907@ld-irv-0074>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 May 07:36 PM, Brian Norris wrote:
> On Mon, May 12, 2014 at 11:27:53PM -0300, Ezequiel Garcia wrote:
> > On 21 Mar 08:57 AM, Ezequiel Garcia wrote:
> > > Strictly speaking we should be updating the ecc_stats in the master
> > > MTD object, with the blocks used by the bad block table.
> > > 
> > > This is already being done for bad and reserved blocks detected doing
> > > the BBT search, but not for the blocks used by the BBT itself. This commit
> > > adds the latter.
> > > 
> > > It should be noted that the ecc_stats structure is kept only for userspace
> > > information, accesible through an ioctl. However, since the master MTD object
> > > is not tied to any /dev/mtd{N} device node in the filesystem, there's currently
> > > no way to retrieve this information.
> > > 
> > > This ecc_stats is used for the MTD partitions typically allocated and
> > > registered by mtd_device_parse_register(). These have a device node, but scan
> > > for bad blocks and updates the ecc_stats in a different code path.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > --
> > > For the reasons exposed above, it's not clear we should remove the ecc_stats
> > > update in the master MTD altogether or simply take account of the BBT blocks
> > > for consistency. I've chosen the latter, for it seemed a safer changer.
> > > 
> > > I'm open to discussion, though.
> > 
> > Brian,
> > 
> > Can you comment a bit on this one? Should I keep this change in v2?
> 
> I'm not really sure. I'm honestly having a hard time tracking all the
> potentially-configurable knobs of nand_bbt.c. It looks like only
> diskonchip sets a reserved_block_code, so some of the existing code
> isn't really even tested widely. And like you mention, the ecc_stats
> from the master MTD are not propagated directly to the partition (nor
> should they be), so the stat is really unused.
> 
> I'm not 100% confident that we won't double-count any 'bbtblocks' in
> your current patch. Maybe we should rewrite some of this stuff...
> 

Indeed, I wrote this stuff a while ago, but I remember having a really hard
time to follow the bbtblocks count increments.

> I'll look at this again when my eyes are fresh.
> 

No problem.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
