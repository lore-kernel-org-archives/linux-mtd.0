Date: Wed, 16 Sep 2015 07:16:14 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: Re: [PATCH 4/5] xattr handlers: Pass handler to operations instead
 of flags
Message-ID: <20150916141614.GB16005@infradead.org>
References: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
 <1441367842-25079-5-git-send-email-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441367842-25079-5-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 04, 2015 at 01:57:21PM +0200, Andreas Gruenbacher wrote:
> The xattr_handler operations are currently all passed a file system specific
> flags value which the operations can use to disambiguate between different
> handlers; some file systems use that to distinguish the xattr namespace, for
> example.  In some oprations, it would be useful to also have access to the
> handler prefix.  To allow that, pass a pointer to the handler to operations
> instead of the flags value alone.

Looks ok, but the more usual calling convention would be to pass
the handler as the first argument.
