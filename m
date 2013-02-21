Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8N9p-0007tP-Pz
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 03:49:18 +0000
Date: Wed, 20 Feb 2013 19:48:34 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 6/6] ubifs: Wait for page writeback to provide stable pages
Message-ID: <20130221034834.GA4055@blackbox.djwong.org>
References: <20130119011231.20902.55954.stgit@blackbox.djwong.org>
 <20130119011316.20902.56721.stgit@blackbox.djwong.org>
 <20130123134312.b69c53cd.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130123134312.b69c53cd.akpm@linux-foundation.org>
Cc: lucho@ionkov.net, jack@suse.cz, neilb@suse.de, david@fromorbit.com,
 Adrian Hunter <adrian.hunter@intel.com>, adilger.kernel@dilger.ca,
 jlayton@samba.org, hch@infradead.org, gnehzuil.liu@gmail.com,
 bharrosh@panasas.com, linux-ext4@vger.kernel.org, ericvh@gmail.com,
 viro@zeniv.linux.org.uk, rminnich@sandia.gov, hirofumi@mail.parknet.co.jp,
 axboe@kernel.dk, tytso@mit.edu, martin.petersen@oracle.com,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 23, 2013 at 01:43:12PM -0800, Andrew Morton wrote:
> On Fri, 18 Jan 2013 17:13:16 -0800
> "Darrick J. Wong" <darrick.wong@oracle.com> wrote:
> 
> > When stable pages are required, we have to wait if the page is just
> > going to disk and we want to modify it. Add proper callback to
> > ubifs_vm_page_mkwrite().
> > 
> > CC: Artem Bityutskiy <dedekind1@gmail.com>
> > CC: Adrian Hunter <adrian.hunter@intel.com>
> > CC: linux-mtd@lists.infradead.org
> > From: Jan Kara <jack@suse.cz>
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> 
> A couple of these patches had this From:Jan strangely embedded in the
> signoff area.  I have assumed that they were indeed authored by Jan.
> 
> Please note that authorship is indicated by putting the From: line
> right at the start of the chagnelog.
> 
> 
> I grabbed the patches.  They should appear in linux-next tomorrow if I
> can get the current pooppile to build.

Well... these patches have been banging around in -next for a month or so now.
As far as I know there haven't been any complaints.  Can we push these for 3.9?

--D
