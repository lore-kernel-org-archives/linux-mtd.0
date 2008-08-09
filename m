Date: Sat, 9 Aug 2008 16:09:01 -0400
From: Christoph Hellwig <hch@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 3/4] Remove XFS buffered readdir hack
Message-ID: <20080809200901.GC8181@infradead.org>
References: <18582.21855.2092.903688@notabene.brown>
	<76bd70e30808032319u65e35dbdj9cc5be07e1aef829@mail.gmail.com>
	<20080805085157.GG21635@disturbed>
	<18584.56584.98868.881298@notabene.brown>
	<20080806000805.GJ21635@disturbed>
	<20080806195635.GA31126@fieldses.org>
	<1218053443.5111.148.camel@pmac.infradead.org>
	<1218300478.26926.114.camel@pmac.infradead.org>
	<1218311710.26926.125.camel@pmac.infradead.org>
	<1218312191.5063.8.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1218312191.5063.8.camel@pmac.infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org,
	chucklever@gmail.com, Neil Brown <neilb@suse.de>,
	"J. Bruce Fields" <bfields@fieldses.org>,
	linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 09, 2008 at 09:03:11PM +0100, David Woodhouse wrote:
> Now that we've moved the readdir hack to the nfsd code, we can
> remove the local version from the XFS code.

Looks good to me, I'm also throwig this into my local xfsqa queue.
