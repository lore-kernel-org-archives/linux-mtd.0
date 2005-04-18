From: David Woodhouse <dwmw2@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
In-Reply-To: <20050418124656.GA23387@infradead.org>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
	<20050418085121.GA19091@infradead.org>
	<1113814730.31595.6.camel@sauron.oktetlabs.ru>
	<20050418105301.GA21878@infradead.org>
	<1113824781.2125.12.camel@sauron.oktetlabs.ru>
	<20050418115220.GA22750@infradead.org>
	<1113827466.2125.47.camel@sauron.oktetlabs.ru>
	<20050418124656.GA23387@infradead.org>
Content-Type: text/plain
Date: Mon, 18 Apr 2005 23:16:51 +1000
Message-Id: <1113830212.5286.33.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATC] small VFS change for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-04-18 at 13:46 +0100, Christoph Hellwig wrote:
> Why doesn't __wait_on_freeing_inode get called? prune_icache sets
> I_FREEING before it's dropping the inode lock.

Because prune_icache() _also_ removes the inode from the hash before
dropping the inode lock. It shouldn't -- the inode should only get
removed from the hash when it's actually been cleared. That's the real
bug -- and I agree that the fix isn't to expose internal locks to let
JFFS2 work around it.

prune_icache() (and probably invalidate_inodes() too) needs to leave the
inode on the hash list while it's being freed.

-- 
dwmw2
