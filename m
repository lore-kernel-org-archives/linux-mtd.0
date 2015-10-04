Date: Sat, 3 Oct 2015 23:32:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: viro@ZenIV.linux.org.uk, jack@suse.cz, dedekind1@gmail.com,
 richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 05/39] fs: super: introduce a get_super_cdev to get
 super by a cdev reference
Message-ID: <20151004063235.GG28519@infradead.org>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-6-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442307754-13233-6-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As mentioned before I don't think the cdev has any business in core VFS
code.  You must alredy have an anonymous block device for the st_dev
value, please use that.
