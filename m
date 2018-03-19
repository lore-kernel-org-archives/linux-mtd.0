Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exseX-0002K1-GX
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 11:08:37 +0000
Date: Mon, 19 Mar 2018 12:08:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net
Subject: Re: a few I_DIRTY* related cleanups
Message-ID: <20180319110816.GA23904@lst.de>
References: <20180221155449.25542-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180221155449.25542-1-hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 21, 2018 at 07:54:45AM -0800, Christoph Hellwig wrote:
> Move I_DIRTY_INODE to fs.h, and use the I_DIRTY* defines more consistently.

Al, are you going to pick this up?
