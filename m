Date: Mon, 18 Apr 2005 09:51:21 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050418085121.GA19091@infradead.org>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
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

On Mon, Apr 18, 2005 at 12:47:11PM +0400, Artem B. Bityuckiy wrote:
> JFFS2 assumes that the above mentioned 'state' field is always coherent
> with the real state of the inode. The state is changed on read_inode()
> and clear_inode() inode operation calls.
 
> One obvious thing to fix this JFFS2 problem is to acquire the iprune_sem
> semaphore in JFFS2 GC, but for this we need to export it. So, please,
> consider the following VFS patch (against Linux 2.6.11.5):

No, exporting locks is a really bad idea.  Please try to find a better
method to fix your problem that doesn't export random kernel symbols.
