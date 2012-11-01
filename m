Message-ID: <5092F67A.2060203@panasas.com>
Date: Thu, 1 Nov 2012 15:23:54 -0700
From: Boaz Harrosh <bharrosh@panasas.com>
MIME-Version: 1.0
To: Jeff Layton <jlayton@samba.org>
Subject: Re: [PATCH 3/3] fs: Fix remaining filesystems to wait for stable
 page writeback
References: <20121101075805.16153.64714.stgit@blackbox.djwong.org>
 <20121101075829.16153.92036.stgit@blackbox.djwong.org>
 <5092C2CE.7070209@panasas.com>
 <20121101162254.03dbbd9a@tlielax.poochiereds.net>
In-Reply-To: <20121101162254.03dbbd9a@tlielax.poochiereds.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: lucho@ionkov.net, jack@suse.cz, neilb@suse.de, david@fromorbit.com,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 v9fs-developer@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 sage@inktank.com, ericvh@gmail.com, mfasheh@suse.com, jlbec@evilplan.org,
 ceph-devel@vger.kernel.org, axboe@kernel.dk, tytso@mit.edu,
 martin.petersen@oracle.com, dedekind1@gmail.com, adrian.hunter@intel.com,
 sfrench@samba.org, linux-fsdevel@vger.kernel.org, rminnich@sandia.gov,
 ocfs2-devel@oss.oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/01/2012 01:22 PM, Jeff Layton wrote:
> Hmm...I don't know...
> 
> I've never been crazy about using the page lock for this, but in the
> absence of a better way to guarantee stable pages, it was what I ended
> up with at the time. cifs_writepages will hold the page lock until
> kernel_sendmsg returns. At that point the TCP layer will have copied
> off the page data so it's safe to release it.
> 
> With this change though, we're going to end up blocking until the
> writeback flag clears, right? And I think that will happen when the
> reply comes in? So, we'll end up blocking for much longer than is
> really necessary in page_mkwrite with this change.
> 

Hmm OK, that is a very good point. In that case it is just a simple
nack on Darrick's hunk to cifs. cifs is fine and should not be touched

Boaz
