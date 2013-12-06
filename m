Date: Fri, 6 Dec 2013 11:47:20 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 16/18] gfs2: use generic posix ACL
 infrastructure
Message-ID: <20131206194720.GB32122@infradead.org>
References: <20131201115903.910559036@bombadil.infradead.org>
 <20131201120656.539995924@bombadil.infradead.org>
 <1386159157.2711.11.camel@menhir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386159157.2711.11.camel@menhir>
Cc: cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, xfs@oss.sgi.com, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 04, 2013 at 12:12:37PM +0000, Steven Whitehouse wrote:
> >  		error = posix_acl_equiv_mode(acl, &mode);
> > +		if (error < 0)
> >  
> Andy Price has pointed out a missing "return error;" here
> 
> > -		if (error <= 0) {
> > -			posix_acl_release(acl);
> > +		if (error == 0)
> >  			acl = NULL;
> >  
> > -			if (error < 0)
> > -				return error;
> > -		}
> > -
> 
> Also, there seems to be a white space error in the xfs patch around line
> 170 in fs/xfs/xfs_iops.c where there is an added "if (default_acl)" with
> a space before the tab,

I'll take care of these for the next version.
