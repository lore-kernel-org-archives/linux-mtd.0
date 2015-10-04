Date: Sat, 3 Oct 2015 23:33:57 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 13/39] fs: introduce a get_qsize() to inode_operations
Message-ID: <20151004063357.GH28519@infradead.org>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-14-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-14-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 15, 2015 at 05:02:08PM +0800, Dongsheng Yang wrote:
> get_qsize() is used to allow inode to decide how much of the quota size
> in itself. If file system implements the own get_qsize(), ioctl of
> FIOQSIZe will call it to get quota size. If not implemented, get the
> quota size in a generic way.

This should be in struct dquot_operations.
