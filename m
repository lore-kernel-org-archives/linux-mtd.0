Message-ID: <4263AE96.5080707@yandex.ru>
Date: Mon, 18 Apr 2005 16:56:54 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
	<20050418085121.GA19091@infradead.org>
	<1113814730.31595.6.camel@sauron.oktetlabs.ru>
	<20050418105301.GA21878@infradead.org>
	<1113824781.2125.12.camel@sauron.oktetlabs.ru>
	<20050418115220.GA22750@infradead.org>
	<1113827466.2125.47.camel@sauron.oktetlabs.ru>
	<20050418124656.GA23387@infradead.org>
In-Reply-To: <20050418124656.GA23387@infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATC] small VFS change for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Christoph Hellwig wrote:
> Why doesn't __wait_on_freeing_inode get called? prune_icache sets I_FREEING
> before it's dropping the inode lock.
I suppose because the inode is *deleted* from i_hash. But 
find_inode_fast looks for inode using *->i_hash*. Of course it will not 
find anything and call read_inode() immediately. Did I miss something?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
