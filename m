Date: Sat, 3 Oct 2015 23:31:19 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 01/39] fs: introduce a ->s_cdev field into struct
 super_block
Message-ID: <20151004063119.GF28519@infradead.org>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-2-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-2-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 15, 2015 at 05:01:56PM +0800, Dongsheng Yang wrote:
> There are some filesystems are running on char devs, such
> as ubifs. So we need a field in super_block to hold a
> reference to the char device.

We only care about the block device to get a device number to return
in st.st_dev.  And while filesystem literally run on top of a block
device that is not the case of a character device - you might use a
chardev to identify a device to mount but it'll never use the actual
char device.

So please don't bloat the superblock with this.
