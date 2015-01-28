Date: Wed, 28 Jan 2015 17:55:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mtd: export new mtd_mmap_capabilities
Message-ID: <20150128165536.GA17313@lst.de>
References: <1900951.4yX9yJNQM5@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1900951.4yX9yJNQM5@wuerfel>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@fb.com>,
 linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 28, 2015 at 04:19:31PM +0100, Arnd Bergmann wrote:
> The recently added mtd_mmap_capabilities can be used from loadable
> modules, in particular romfs, but is not exported, so we get
> 
> ERROR: "mtd_mmap_capabilities" [fs/romfs/romfs.ko] undefined!
> 
> This adds the missing export.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: b4caecd48005f ("fs: introduce f_op->mmap_capabilities for nommu mmap support")

Thanks, this looks fine to me:

Acked-by: Christoph Hellwig <hch@lst.de>
