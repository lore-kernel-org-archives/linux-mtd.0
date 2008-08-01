Subject: Re: [RFC] Reinstate NFS exportability for JFFS2.
From: David Woodhouse <dwmw2@infradead.org>
To: chucklever@gmail.com
In-Reply-To: <76bd70e30807311753m2785c6d3kd82edd1fe8b5f8b7@mail.gmail.com>
References: <1209670979.25560.587.camel@pmac.infradead.org>
	<20080501204820.GA5951@infradead.org>
	<1209681898.25560.613.camel@pmac.infradead.org>
	<18458.28833.539314.455215@notabene.brown>
	<1217541264.1126.15.camel@shinybook.infradead.org>
	<18578.21997.529551.676627@notabene.brown>
	<1217551230.3719.15.camel@shinybook.infradead.org>
	<76bd70e30807311753m2785c6d3kd82edd1fe8b5f8b7@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 01 Aug 2008 02:00:37 +0100
Message-Id: <1217552437.3719.30.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Neil Brown <neilb@suse.de>, Christoph Hellwig <hch@infradead.org>,
	linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-07-31 at 20:53 -0400, Chuck Lever wrote:
> For now it is sufficient, IMO.  NFSv4 doesn't implement a readdirplus
> operation, and the performance benefits of NFSv3 readdirplus are
> equivocal -- there isn't a strong desire to replicate the complexity
> of NFSv3 readdirplus in NFSv4.  I'm not even sure you can do it even
> with a single compound RPC, so even in the long run NFSv4 may not ever
> have the locking issues that NFSv3 does here.

AFAICT NFSv4 does have the same recursion issues already. The call trace
goes fs->readdir() ... nfsd4_encode_dirent() ...
nfsd4_encode_dirent_fattr() ... lookup_one_len() ... fs->lookup().

Or am I mistaken?

> I agree with Neil, though -- as a reviewer, I think the architecture
> of your solution is valid, but would need to audit these pretty
> closely to get a sense of the individual correctness/appropriateness
> of each change.

The important part to review is this one, which is fairly close to what
XFS has been doing (for local access too) for a long time already:

http://git.infradead.org/users/dwmw2/nfsexport-2.6.git?a=commitdiff;h=37f3aae5380eb4ef23a77f3f52b8849a18cee188

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
