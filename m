Date: Tue, 7 Jan 2014 07:53:24 -0800
From: Christoph Hellwig <hch@infradead.org>
To: viro@zeniv.linux.org.uk
Subject: Re: [PATCH 00/21] Consolidate Posix ACL implementation V3
Message-ID: <20140107155324.GA24113@infradead.org>
References: <20131220131635.650823732@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131220131635.650823732@bombadil.infradead.org>
Cc: Andreas Gruenbacher <andreas.gruenbacher@linbit.com>, xfs@oss.sgi.com,
 Mark Fasheh <mfasheh@suse.com>, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, Joel Becker <jlbec@evilplan.org>,
 jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 20, 2013 at 05:16:35AM -0800, Christoph Hellwig wrote:
> This series consolidates the various cut'n'pasted Posix ACL implementations
> into a single common one based on the ->get_acl method Linus added a while
> ago and a new ->set_acl counterpart.
> 
> This remove ~1800 lines of code and provides a single place to implement
> various nasty little gems of the semantics.

Any more comments?  Al, what's the best way to make sure this doesn't
miss 3.14?
